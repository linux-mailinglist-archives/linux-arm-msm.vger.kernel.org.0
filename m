Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE5C4770607
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 18:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbjHDQay (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 12:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjHDQaw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 12:30:52 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A31049E8
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 09:30:49 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-991c786369cso305351366b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691166645; x=1691771445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI+FjztjAhlDqQ6jCUap2ilPY23v0NvrgrfzfYO4RIA=;
        b=naUs6b25S0gvtdKQ4hq0/PrfKWUXV1DI48vVU57sagCxS/gLvJLsMZLBj7ee3sWL41
         i9udzzzMzYQeMQ8iERiJ+Y+TwXJdcGBbqK+GgMEaFo5SXllf3DpvwMTDeW8DINnHO/No
         Oz8Z2BBjMecZ1gADpxiuHMLghssfyDZVVLqRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691166645; x=1691771445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WI+FjztjAhlDqQ6jCUap2ilPY23v0NvrgrfzfYO4RIA=;
        b=ZspWr+h4sCgen3+2cwkrz5yPEqdP4AA6/EbTsm93zdtNw3WkE+wXv6bpvefimxpfSt
         WXdbLRmY/OUMLiqk0C1e/KA9wT+y8arnVhnzDLxQNiRp+5IoJ3XE8KE4sj+TAsBeZ/d4
         R7qGBxewvJxq6CN2wuO29Bn0iCUKxFbrTbW9+ZPRDJMTfCwGu3zWF7JaEoHC/qqmICQ7
         YXNBVasWQzZD0c0EFkSMd3tvjFXBHmBRQMDtw/+06RIBhz8S5Yy7yrUXiORgZTzxfBM9
         wHqtR8zWNLYWXExTL3WIjVxXxD8EB/lgEZ9mx1JzkOpVZyqCtPasV3Y3yA9SWoVMMAQW
         Aa6w==
X-Gm-Message-State: AOJu0YxEJWwyFHo6JZ1mGaUVrf8sESM8n5LN+rSlnDxOaVJEvZiGKVTX
        l3fJuQyo2A5lK2kgAVwrk+6hIRE4Xrp7rztY10u7FVFu
X-Google-Smtp-Source: AGHT+IF28a+HqvuodzR+cChbeylfLj4AUQBotwiiyAP566gSb5S274PbA4K45YTfFXh14umI05pt+Q==
X-Received: by 2002:a17:907:7802:b0:993:ec0b:1a24 with SMTP id la2-20020a170907780200b00993ec0b1a24mr1962072ejc.7.1691166644979;
        Fri, 04 Aug 2023 09:30:44 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id r13-20020a170906704d00b0098e34446464sm1512533ejj.25.2023.08.04.09.30.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 09:30:44 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-521e046f6c7so11494a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 09:30:44 -0700 (PDT)
X-Received: by 2002:a50:c212:0:b0:523:ee1:8d27 with SMTP id
 n18-20020a50c212000000b005230ee18d27mr54911edf.1.1691166643789; Fri, 04 Aug
 2023 09:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230804095836.39551-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20230804175734.v2.1.I7a950de49ec24b957e90d7fe7abd5f2f5f2e24c3@changeid>
In-Reply-To: <20230804175734.v2.1.I7a950de49ec24b957e90d7fe7abd5f2f5f2e24c3@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Aug 2023 09:30:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WKPu2R_j3yh5OJcc95SmxgJsc3+HxSi9_Ks6TvUOYJ1w@mail.gmail.com>
Message-ID: <CAD=FV=WKPu2R_j3yh5OJcc95SmxgJsc3+HxSi9_Ks6TvUOYJ1w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: add sc7180-lazor board bindings
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Aug 4, 2023 at 2:58=E2=80=AFAM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> Introduce more sc7180-lazor sku and board version configuration,
> add no-eSIM SKU 10 for Lazor, no-eSIM SKU 15 and 18 for Limozeen,
> add new board version 10 for audio codec ALC5682i-VS.
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.googl=
e.com>
> ---
>
> Changes in v2:
> - add new entry rev9 with Parade bridge chip
>
>  .../devicetree/bindings/arm/qcom.yaml         | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index 450f616774e0..dce7b771a280 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -470,6 +470,11 @@ properties:
>            - const: google,lazor-rev8
>            - const: qcom,sc7180
>
> +      - description: Acer Chromebook Spin 513 Parade bridge chip (rev9)

You probably didn't need to include "Parade bridge chip" in the
description since that's implied by "rev9"


> @@ -512,11 +522,26 @@ properties:
>            - const: google,lazor-rev8-sku0
>            - const: qcom,sc7180
>
> +      - description: Acer Chromebook Spin 513 Parade bridge chip with LT=
E (rev9)
> +        items:
> +          - const: google,lazor-rev9-sku0
> +          - const: qcom,sc7180
> +
>        - description: Acer Chromebook Spin 513 with LTE (newest rev)
>          items:
>            - const: google,lazor-sku0
>            - const: qcom,sc7180
>
> +      - description: Acer Chromebook Spin 513 Parade bridge chip with LT=
E no-esim (rev9)
> +        items:
> +          - const: google,lazor-rev9-sku10
> +          - const: qcom,sc7180

The no-eSIM and normal LTE should be combined into one, just like they
are in your device tree. If you look at patch #3, you can see
"sc7180-trogdor-lazor-r9-lte.dts" contains:

compatible =3D "google,lazor-rev9-sku0", "google,lazor-rev9-sku10", "qcom,s=
c7180";

You need to have a single entry here that matches that. That means one
entry that has both rev9-sku0 and rev9-sku10.

You should be running "make dtbs_check" at the end of your series. As
Krzysztof would say, (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sourc=
es-with-the-devicetree-schema/
for instructions)


-Doug
