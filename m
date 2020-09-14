Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8BD268955
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 12:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgINKcl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 06:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbgINKcY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 06:32:24 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F006CC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 03:32:13 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n14so12271920pff.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 03:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a7CbxgECeeYGvMy1kKa7QbFLhhs6Nb24PTd99kXDMSc=;
        b=xkfoLlI0Mv3CIhknjFR+QhQdoEXQVIlcn8vDXc77hEBbrWDHDJxB0nbncIWpdBTi9l
         0IUWSjHm/D+g6wwjJ6rp6mY3gj01JRSU0jTuMOhtiYOdkZEMdi/8aDMSaX3MV8bXO1Lm
         8lH45p/7qPqetiik4xULYtxOxrPf4qwvuwJRWwNUVtlJUcq26FyRI7RJYAAPH3f6re7e
         x7CTcD3x5O6bziBh+MMkFGrSkC+8dNsONm+LJ/KzBsc95TIR9dx7dsyt/gzkKVz1rqk4
         IUK8O+9Hmo9cSj9H7m8DmeJrXIx3T54ibMdDytmp9/y91JQCxl+Lx5ww7+8R7kPEE9W2
         wxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a7CbxgECeeYGvMy1kKa7QbFLhhs6Nb24PTd99kXDMSc=;
        b=jrUmfCgymIxEVd3w4fBZ6BMWmX6mN1QSSzmkn0x02AjZCplZDMEa2FCGd/ks4sNh/F
         9ExUqMlgY3bpv5glk1PR4b407MeBoEy4m0mBrMP2XV2s55kAj0Ux8wqmjVH6tXXySsRa
         yBtIAw1XrB513jGP1h2tZWyyfGG0sOU/vqKPif7dW+nQeV6VttBAiTGr954b2TDdVM+W
         /q9aEuNTh9OKI7H445Jv2Lf1HJmtmNBh9TIqhwwPabEE+EgH1PNhHnI8CXn07UmzsRqQ
         sxV6Z+00QukYcNJ98DnFyG6Z5yeXfMZ2ohC241dNtVA2LkTtFfkARgL2mOQBOq12CS/5
         Lh/Q==
X-Gm-Message-State: AOAM532JbXTmJRgWs0RWtnV+VG0cvdkuqhUw1ZuLfbSbNTJWihGVhPTH
        KMBs8QiC9vMmKPp17fyn8ALH
X-Google-Smtp-Source: ABdhPJyctVBevEp3B64kw6WkbaXqRHCMnjJsLuyJJc9dAdrDBBn+yvQr309xh9i9s5Ah0u8IcZ4rAQ==
X-Received: by 2002:a17:902:9a44:: with SMTP id x4mr13674633plv.31.1600079533470;
        Mon, 14 Sep 2020 03:32:13 -0700 (PDT)
Received: from mani-NUC7i5DNKE ([2409:4072:6d84:8e8a:d537:f870:596d:5afa])
        by smtp.gmail.com with ESMTPSA id e125sm9925507pfe.154.2020.09.14.03.32.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 03:32:12 -0700 (PDT)
Date:   Mon, 14 Sep 2020 16:02:08 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] arch64: dts: qcom: sm8250: add uart nodes
Message-ID: <20200914103208.GB19867@mani-NUC7i5DNKE>
References: <20200909103238.149761-1-dmitry.baryshkov@linaro.org>
 <20200909103238.149761-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909103238.149761-2-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 09, 2020 at 01:32:38PM +0300, Dmitry Baryshkov wrote:
> Currently sm8250.dtsi only defines default debug uart. Port rest uart
> nodes from the downstream dtsi file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 74 ++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index e5525df69946..552fa3df9e4f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -551,6 +551,17 @@ spi17: spi@88c000 {
>  				status = "disabled";
>  			};
>  
> +			uart17: serial@88c000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0 0x0088c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_uart17_default>;
> +				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
>  			i2c18: i2c@890000 {
>  				compatible = "qcom,geni-i2c";
>  				reg = <0 0x00890000 0 0x4000>;
> @@ -577,6 +588,17 @@ spi18: spi@890000 {
>  				status = "disabled";
>  			};
>  
> +			uart18: serial@890000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0 0x00890000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_uart18_default>;
> +				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
>  			i2c19: i2c@894000 {
>  				compatible = "qcom,geni-i2c";
>  				reg = <0 0x00894000 0 0x4000>;
> @@ -693,6 +715,17 @@ spi2: spi@988000 {
>  				status = "disabled";
>  			};
>  
> +			uart2: serial@988000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0 0x00988000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_uart2_default>;
> +				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
>  			i2c3: i2c@98c000 {
>  				compatible = "qcom,geni-i2c";
>  				reg = <0 0x0098c000 0 0x4000>;
> @@ -797,6 +830,17 @@ spi6: spi@998000 {
>  				status = "disabled";
>  			};
>  
> +			uart6: serial@998000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0 0x00998000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_uart6_default>;
> +				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
>  			i2c7: i2c@99c000 {
>  				compatible = "qcom,geni-i2c";
>  				reg = <0 0x0099c000 0 0x4000>;
> @@ -2410,6 +2454,21 @@ config {
>  				};
>  			};
>  
> +			qup_uart2_default: qup-uart2-default {
> +				mux {
> +					pins = "gpio117", "gpio118";
> +					function = "qup2";
> +				};
> +			};
> +
> +			qup_uart6_default: qup-uart6-default {
> +				mux {
> +					pins = "gpio16", "gpio17",
> +						"gpio18", "gpio19";
> +					function = "qup6";
> +				};
> +			};
> +
>  			qup_uart12_default: qup-uart12-default {
>  				mux {
>  					pins = "gpio34", "gpio35";
> @@ -2417,6 +2476,21 @@ mux {
>  				};
>  			};
>  
> +			qup_uart17_default: qup-uart17-default {
> +				mux {
> +					pins = "gpio52", "gpio53",
> +						"gpio54", "gpio55";
> +					function = "qup17";
> +				};
> +			};
> +
> +			qup_uart18_default: qup-uart18-default {
> +				mux {
> +					pins = "gpio58", "gpio59";
> +					function = "qup18";
> +				};
> +			};
> +
>  			pri_mi2s_sck_active: pri-mi2s-sck-active {
>  				mux {
>  					pins = "gpio138";
> -- 
> 2.28.0
> 
