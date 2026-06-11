FROM ://microsoft.com AS build
WORKDIR /src
RUN git clone https://github.com .
RUN dotnet publish -c Release -o /app

FROM ://microsoft.com
WORKDIR /app
COPY --from=build /app .
EXPOSE 8080
CMD ["dotnet", "RebornRec.dll"]
