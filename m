Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB2B4FE919
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 21:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbiDLTxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 15:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbiDLTvL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 15:51:11 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33E665799
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:46:43 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-de3eda6b5dso21927026fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OcCFOIbabGMt8R4R5kmD+nWqw4w/utia9Z9PYHvplQc=;
        b=m2dzcglSF6AgD3X8N5HTbv7KqJkmZFNOirfaSAEFEihSuceCvzNa5HXcUilyiXZXDy
         zURF3W6b44+rgOeL6/HQbB0OtbxFI3RC/Ki+t3a/wqa7hVnoqfyr9YRBEkD+yq1lUEWj
         zwdILpqgAqWpRm5gOip9LPDtQLEjw62N8TC3+ky2m+gDdbL6K+RCAv7n0jWRLbPffnH6
         F+s6nlz49Bg5JvpXEGQgiiZcwblXBthrdI2HbB5NZv5014L21pubsa880JYyZyPmneHT
         uAyBYzyhxsaLjqNLNV0Etk4V3ZghSjqklGG+MD8UXxkCRPPWlzM2wYqUjMLUsPpunpK3
         5fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OcCFOIbabGMt8R4R5kmD+nWqw4w/utia9Z9PYHvplQc=;
        b=LtxLxXZ1PqUGIlgc536qnAjHifH86tpChtXlE4G3NxdUDpE+u14CmxVG4hp2fI0xjr
         rJ2pX99u79rNR44df9egem2PM+oBtgUwJEI/EORRjZluoETWflGevHKsmQc7NvULi/el
         LGm+hNg+VCzH/jEx63S5QRYorQyorMyFIkL4bO68y6J7/l8O1YIXJnFst1CnWALokV7K
         gORXDXvahyi3gl33G6y4wcI2rcn0kZGq2HpxVAf4y+o6nyic9A2jbDLX9pUAsgP24w0I
         ojAmAwBBITbW9g/KvXARPoDjSK0+afHTZaKgmmVdLeOuN76dorFmnq8zqyKjyzQDMdaF
         S1Rg==
X-Gm-Message-State: AOAM531BjGR+dUU3foz9ciQ8UYav/mnxIuXWWWuIAOmsDE+AZR0W2joV
        jy3cnd9GzigaYO9jhLYKhzWTgtutQX78hzhr
X-Google-Smtp-Source: ABdhPJz57YhmO0GbH2IOg8zrRjFf+Vn8T4DxIDvA1pCWwG5XZAcc5n87X0xNf2O1Lp1voPFA3bWVUg==
X-Received: by 2002:a05:6870:e303:b0:e2:e9fc:2fbe with SMTP id z3-20020a056870e30300b000e2e9fc2fbemr2863838oad.74.1649792802346;
        Tue, 12 Apr 2022 12:46:42 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id r205-20020acadad6000000b002ef824213c9sm12964798oig.55.2022.04.12.12.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:46:41 -0700 (PDT)
Date:   Tue, 12 Apr 2022 14:46:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan McDowell <noodles@earth.li>
Subject: Re: [PATCH v3 03/18] ARM: dts: qcom: add missing rpm regulators and
 cells for ipq8064
Message-ID: <YlXXH3ikA5Tcdx9R@builder.lan>
References: <20220309190152.7998-1-ansuelsmth@gmail.com>
 <20220309190152.7998-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309190152.7998-4-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 09 Mar 13:01 CST 2022, Ansuel Smith wrote:

> Add cells definition for rpm node

Why do we need the cells?

> and add missing regulators for the 4
> regulator present on ipq8064. There regulators are controlled by rpm and
> to correctly works gsbi4_i2c require to be NEVER disabled or rpm will

Are you saying "...to correctly work, gsbi4_i2c must NEVER be disabled..."?

If so, that's good information, but how does it relate to this
particular change?

Regards,
Bjorn

> reject any regulator change request.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> Tested-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 36 +++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index b309bc0fbbcd..0938838a4af8 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -842,10 +842,46 @@ rpm: rpm@108000 {
>  			clocks = <&gcc RPM_MSG_RAM_H_CLK>;
>  			clock-names = "ram";
>  
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
>  			rpmcc: clock-controller {
>  				compatible = "qcom,rpmcc-ipq806x", "qcom,rpmcc";
>  				#clock-cells = <1>;
>  			};
> +
> +			smb208_regulators: regulators {
> +				compatible = "qcom,rpm-smb208-regulators";
> +				status = "okay";
> +
> +				smb208_s1a: s1a {
> +					regulator-min-microvolt = <1050000>;
> +					regulator-max-microvolt = <1150000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +
> +				smb208_s1b: s1b {
> +					regulator-min-microvolt = <1050000>;
> +					regulator-max-microvolt = <1150000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +
> +				smb208_s2a: s2a {
> +					regulator-min-microvolt = < 800000>;
> +					regulator-max-microvolt = <1250000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +
> +				smb208_s2b: s2b {
> +					regulator-min-microvolt = < 800000>;
> +					regulator-max-microvolt = <1250000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +			};
>  		};
>  
>  		tcsr: syscon@1a400000 {
> -- 
> 2.34.1
> 
