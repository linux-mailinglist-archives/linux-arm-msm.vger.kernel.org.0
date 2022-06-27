Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C95B855D691
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235985AbiF0RR7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 13:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235968AbiF0RR7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 13:17:59 -0400
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2DFCE29;
        Mon, 27 Jun 2022 10:17:58 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id i194so10203680ioa.12;
        Mon, 27 Jun 2022 10:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kaxFnNRB8GMdQ+miLrcwnlUrNBhYoVcXqeLxcTf0qVw=;
        b=K7E1PELEzYRmX1hPMDRXuDTt3wUPsFxiQRH7QeGZHiDKhfGa6ICdThgCNGbHX023vI
         b3e+Uqr33gvccihU6mIJqTOSgtT/2YoxD0iIGvL5fqXCtbiTKgtcLBi50Ba/dblJVcOJ
         c+9KClRFizqEBFokXEhgxXvPe/LZZsmrZC7LoajzQWTa0hJiZ2i5Xlt6bU1one88B0d1
         KeOS+eFhhnRJETydcILVnMUolayrLDXZLsbZcQE7jf62xGsJZ9168YMOrlw3XEeGHyAT
         aTirxBLgzXeA+Gy7ZpR0jKMWYQCqnpKlQwEdjPONvQkcDMFceFk3v9AoTByH1YELoLwe
         5WuQ==
X-Gm-Message-State: AJIora8lkpMKaEOmwZQps9tq2aCXzOzofg0CGsUYtpyJNjDBqHyMaiaI
        O/h9f11yIVDkMII42vgtQA==
X-Google-Smtp-Source: AGRyM1tsXTH75Mc66rG1PrT/Fid3kLPfbtvG3eWXiFBELiDbgFfLZQ3J7nT/9SjPJIebJNZsFsq4xQ==
X-Received: by 2002:a05:6638:2684:b0:33b:afc4:298d with SMTP id o4-20020a056638268400b0033bafc4298dmr8613041jat.49.1656350277868;
        Mon, 27 Jun 2022 10:17:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w18-20020a6bd612000000b00674fe816f79sm5372452ioa.7.2022.06.27.10.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 10:17:57 -0700 (PDT)
Received: (nullmailer pid 2612764 invoked by uid 1000);
        Mon, 27 Jun 2022 17:17:56 -0000
Date:   Mon, 27 Jun 2022 11:17:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,hdmi-phy-qmp: add
 clock-cells and XO clock
Message-ID: <20220627171756.GA2610798-robh@kernel.org>
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
 <20220620010300.1532713-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620010300.1532713-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 20, 2022 at 04:02:58AM +0300, Dmitry Baryshkov wrote:
> As the QMP HDMI PHY is a clock provider, add constant #clock-cells
> property. For the compatibility with older DTs the property is not
> marked as required. Also add the XO clock to the list of the clocks used
> by the driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Doesn't apply, so no checks ran.

> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> index eea2e02678ed..41e6492d4a0f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> @@ -28,12 +28,14 @@ properties:
>        - const: hdmi_phy
>  
>    clocks:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
>      items:
>        - const: iface
>        - const: ref
> +      - const: xo

minItems: 2

>  
>    power-domains:
>      maxItems: 1
> @@ -44,6 +46,9 @@ properties:
>    vddio-supply:
>      description: phandle to VDD I/O supply regulator
>  
> +  '#clock-cells':
> +    const: 0
> +
>    '#phy-cells':
>      const: 0
>  
> @@ -75,9 +80,12 @@ examples:
>                    "hdmi_phy";
>  
>        clocks = <&mmcc 116>,
> -               <&gcc 214>;
> +               <&gcc 214>,
> +               <&xo_board>;
>        clock-names = "iface",
> -                    "ref";
> +                    "ref",
> +                    "xo";
> +      #clock-cells = <0>;
>        #phy-cells = <0>;
>  
>        vddio-supply = <&vreg_l12a_1p8>;
> -- 
> 2.35.1
> 
> 
