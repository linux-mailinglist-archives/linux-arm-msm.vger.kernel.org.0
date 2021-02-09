Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BAC3155A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 19:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhBISIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 13:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbhBIR5M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 12:57:12 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BE0C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 09:56:29 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id m7so20305290oiw.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 09:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F72H5mb0+68Ux+Ml42r4uV0q0vrHd23xqxfJGY2hPQ8=;
        b=mDQluLNjtMTA3BqT54XhFj0qmTH1xBgNbNKH7ZSXDlQnUGaKkx0K0eL1CSg7XTEteC
         fhOtatIy1AGhbnLMRsf9J05yvCDX7ghufiUFyLF9989DtR8dkQDF94TKP19+TeIXWn8J
         /gnLayyjypR3M0+ruqAH4y0eRipn3PShGZEzh5VwcrcbhogTEcsuPlXQzbAaqSV2L0BV
         CD8FDGvUjFeDEWQ07qCLxvizLQSv3mct6s35z3tInlQ3DAm206TYN/Nys9kPYbH2bWfw
         HGZWK5k25DGaxKT9awl4S2oUAWxX30i7ZfCb0irA3z+3Z2FZ6yDTnOxdZDzmhrNZRKId
         +M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F72H5mb0+68Ux+Ml42r4uV0q0vrHd23xqxfJGY2hPQ8=;
        b=N0JUpw2LQ7rXXzS/txBFvJ2FQOxBGt+lW/beDy6enzUSvUZRpZrzf1STh4C+FxeqQR
         hoyiESfKTpNep1J6AwzYf81drfp1Y4CoOrG7hMT9XONAThcqNxN/NibNMxwH8QvPqjKJ
         L0uLWTYTtWivc0S4uTMY+4uVqrxgYsEXfYxLGOm8EY6MDhDMVGYWObkyXA0APKR+F7W3
         8xXjlHtuzR95f/PBDWiGHZS/wnmLMs3/OgZHh8PMg8uqq7pbxWy1Co++elb0R+uNETG1
         IUKTGwc8Wo33hkLWrnrl7/+j2hFZbmMfaqSoUw101z2DMcgYyDSovAajZUpgousrDCjr
         HZyQ==
X-Gm-Message-State: AOAM530jhN+baYOk0GfD35Sage/7pgVyQ/PNTcAlIPjnQ4IKiNV1Toa9
        F8bOWIXLQLakCaACn/gA6MUHB6GtrA0h0A==
X-Google-Smtp-Source: ABdhPJxtxf6GmNrufQFO5LHz2ZinwkAP4mPeJ9RRs7QA+ZoCJnn8t6LkkppogszwW+ebIGOQCMS0lA==
X-Received: by 2002:aca:550e:: with SMTP id j14mr3338275oib.31.1612893388671;
        Tue, 09 Feb 2021 09:56:28 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k67sm3058622oia.7.2021.02.09.09.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 09:56:28 -0800 (PST)
Date:   Tue, 9 Feb 2021 11:56:26 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8250: further split of spi
 pinctrl config
Message-ID: <YCLMyt5wJyG3A2OK@builder.lan>
References: <20210209124758.990681-1-dmitry.baryshkov@linaro.org>
 <20210209124758.990681-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209124758.990681-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 09 Feb 06:47 CST 2021, Dmitry Baryshkov wrote:
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 51d103671759..e43e1367ceb7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -549,7 +549,6 @@ spi14: spi@880000 {
>  				clock-names = "se";
>  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
>  				pinctrl-names = "default";
> -				pinctrl-0 = <&qup_spi14_default>;

I think you should either drop the pinctrl-names as well, or you should
make this <&qup_spi14_default>, <&qup_spi14_cs>;

>  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
[..]
> -			qup_spi0_default: qup-spi0-default {
> +			qup_spi0_cs: qup-spi0-cs {
> +				pins = "gpio31";
> +				function = "qup0";
> +			};
> +
> +			qup_spi1_cs: qup-spi1-cs {
> +				pins = "gpio7";
> +				function = "qup1";
> +			};
> +
> +			qup_spi2_cs: qup-spi2-cs {
> +				pins = "gpio118";
> +				function = "qup2";
> +			};
> +
> +			qup_spi3_cs: qup-spi3-cs {
> +				pins = "gpio122";
> +				function = "qup3";
> +			};
> +
> +			qup_spi4_cs: qup-spi4-cs {
> +				pins = "gpio11";
> +				function = "qup4";
> +			};
> +
> +			qup_spi5_cs: qup-spi5-cs {
> +				pins = "gpio15";
> +				function = "qup5";
> +			};
> +
> +			qup_spi6_cs: qup-spi6-cs {
> +				pins = "gpio19";
> +				function = "qup6";
> +			};
> +
> +			qup_spi7_cs: qup-spi7-cs {
> +				pins = "gpio23";
> +				function = "qup7";
> +			};
> +
> +			qup_spi8_cs: qup-spi8-cs {
> +				pins = "gpio27";
> +				function = "qup8";
> +			};
> +
> +			qup_spi9_cs: qup-spi9-cs {
> +				pins = "gpio128";
> +				function = "qup9";
> +			};
> +
> +			qup_spi10_cs: qup-spi10-cs {
> +				pins = "gpio132";
> +				function = "qup10";
> +			};
> +
> +			qup_spi11_cs: qup-spi11-cs {
> +				pins = "gpio63";
> +				function = "qup11";
> +			};
> +
> +			qup_spi12_cs: qup-spi12-cs {
> +				pins = "gpio35";
> +				function = "qup12";
> +			};
> +
> +			qup_spi13_cs: qup-spi13-cs {
> +				pins = "gpio39";
> +				function = "qup13";
> +			};
> +
> +			qup_spi14_cs: qup-spi14-cs {
> +				pins = "gpio43";
> +				function = "qup14";
> +			};
> +
> +			qup_spi15_cs: qup-spi15-cs {
> +				pins = "gpio47";
> +				function = "qup15";
> +			};
> +
> +			qup_spi16_cs: qup-spi16-cs {
> +				pins = "gpio51";
> +				function = "qup16";
> +			};
> +
> +			qup_spi17_cs: qup-spi17-cs {
> +				pins = "gpio55";
> +				function = "qup17";
> +			};
> +
> +			qup_spi18_cs: qup-spi18-cs {
> +				pins = "gpio59";
> +				function = "qup18";
> +			};
> +
> +			qup_spi19_cs: qup-spi19-cs {
> +				pins = "gpio3";
> +				function = "qup19";
> +			};

If you intermix these with qup-spiX-data-clk you'll maintain the
alphabetical sort order.

> +
> +			qup_spi0_data_clk: qup-spi0-data-clk {
>  				pins = "gpio28", "gpio29",
> -				       "gpio30", "gpio31";
> +				       "gpio30";
>  				function = "qup0";
>  			};

Apart from that I think the series looks good.

Regards,
Bjorn
