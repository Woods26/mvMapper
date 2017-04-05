FROM continuumio/anaconda3
MAINTAINER forest.bremer@gmail.com

RUN conda install -y pyproj
RUN conda install -y -c r r
RUN conda install -y colorcet

ENV BOKEH_APP /bokeh/dapc_webapp/
ENV APP_PORT 5006

EXPOSE 5006
WORKDIR /bokeh

COPY scripts /bokeh/scripts
COPY data /bokeh/data
COPY dapc_webapp /bokeh/dapc_webapp

VOLUME ["/bokeh/data"]

COPY entrypoint.sh /bokeh/

CMD ["sh", "entrypoint.sh"]
