Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83A845287C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 16:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244852AbiEPO6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 10:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244832AbiEPO6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 10:58:10 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0BB639146
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 07:58:05 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id s12-20020a0568301e0c00b00605f30530c2so10211226otr.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K+Y70coh+Lp+roExSs0REYyqTm2S4dimkeJMPuEY3ro=;
        b=a2LKmOSvf8pekx9Ba50+WsLfSfczKYD5qYZ0CvNasNSqyAbqFoydfY2gx89tJxtr2y
         c6V12q8E0n4xIF1oGIXmZ6+uBA97B7Z1UJqB4t17GUOyxAf2pXUwws57sW7wLjvNQUoE
         i+oAg1OCuAOCthZ7bVwuYfhu7ZAyX6AKyOZXHNSTYB+gW8Ieci6qyQlxHQwO9CPGJ2Dx
         YqlGNlTQlwKE0obNLvF1sweC4Qz3/TKbLPBkYfFqxFVfCyxNfoxNTobOqtotw1w3qVio
         J4LpXmPH+pDm9LPti4oTg2sL+AMWAByuxCkYC9tODNdF+XhZJb9HlqKHWPK5tQQHqQJh
         SNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K+Y70coh+Lp+roExSs0REYyqTm2S4dimkeJMPuEY3ro=;
        b=ib+dP5WDgNTEJdwJVAqU8boe60gWyjEfWkBM+n4/Q4/IxIlSctQ3q+JEIxown7W6F4
         QHBAEKeq7Q8VkicrtwCiI81OiAFELmWo+P1j9n+IpZj9xPQgD3S9jqZHE2EkMXmHwR5u
         EfNH053XYoqj7JustBJzxuBWJl+A6P36ZRVan967X6o991dDjGU4pc8MCWUM6BjuEA/T
         hdGAY3Rn5UI6tW9SzQp9qb4G5N1Ay023qbCFkAZy65lwX5DTr/dDGLrJIpW/EoLpbTJS
         M5yQXfcLPMzVChrh9SxjwpaH4nvWiUVymJr/Hu2GgyOZRew24egQDpBFFf62CAgN7D3V
         85mg==
X-Gm-Message-State: AOAM532KXTmvXrGZfcx2SCbYXh8Qkbp5wZ6DBMP6lmrDtV3eG4+0vemB
        /usZuiUlCkZerxgJBl8tvf9aMQ==
X-Google-Smtp-Source: ABdhPJw4N5aCDpS5ff2CufYGmp786lJ7RNGJHCtFjbTmuAq8MExGgtUzZ2Sa7rZJBeZwP5bNxHqKXQ==
X-Received: by 2002:a9d:4b14:0:b0:605:d4b1:a0a0 with SMTP id q20-20020a9d4b14000000b00605d4b1a0a0mr6401833otf.134.1652713084987;
        Mon, 16 May 2022 07:58:04 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w15-20020a056830144f00b00606a6c09a0csm3953648otp.12.2022.05.16.07.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 07:58:04 -0700 (PDT)
Date:   Mon, 16 May 2022 08:00:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm6125
 compatible
Message-ID: <YoJnDGI3gVyIITe4@ripper>
References: <20220511220613.1015472-1-marijn.suijten@somainline.org>
 <20220511220613.1015472-3-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511220613.1015472-3-marijn.suijten@somainline.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 May 15:06 PDT 2022, Marijn Suijten wrote:

> The pm6125 comes with 9 GPIOs, without holes.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> index 22dbcba752d0..ef7a4a9450a4 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -20,6 +20,7 @@ properties:
>            - qcom,pm2250-gpio
>            - qcom,pm660-gpio
>            - qcom,pm660l-gpio
> +          - qcom,pm6125-gpio
>            - qcom,pm6150-gpio
>            - qcom,pm6150l-gpio
>            - qcom,pm6350-gpio
> @@ -107,6 +108,7 @@ $defs:
>          description:
>            List of gpio pins affected by the properties specified in
>            this subnode.  Valid pins are
> +                 - gpio1-gpio9 for pm6125
>                   - gpio1-gpio10 for pm6150
>                   - gpio1-gpio12 for pm6150l
>                   - gpio1-gpio9 for pm6350
> -- 
> 2.36.1
> 
