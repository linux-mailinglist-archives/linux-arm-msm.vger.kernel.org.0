Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460601CFD08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 20:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730821AbgELSRl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 14:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgELSRk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 14:17:40 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4462C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 11:17:40 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f23so5856342pgj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=euXBSP25RPjMzH4Dh9C3lpxMXHOdeuOASj1ttEKt7x0=;
        b=Wroes02mCax4eMhpIIobFMnCfM6A1Pj+4FmBkeg071MEoobNUB6eEBhe9aRrCPgfzu
         mI9UK0R/lwW0VFaibTMWnHc5/KLCRj68RCjVFkHph5SJ7kb/KkvTE/eCmDFtmTU8pPrF
         Rg/ma42+YB2ZkoHa8X35JKXdIklqUkPjC6rMukiR/bVLFFZ4vU3NdcSnTcXxXrOnjFyr
         k1vvtHvhZ752AT7E8pPHi3rdp5W4+Koky10nAJMBiGLEeaRQo9PR+lCjn5aQwiEZvBkR
         KHmXeCFZTPFviyRQRj4al54x1KxXlZJ04CmzMace698OYumHUk7A87uANb3Jph+spV9H
         q3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=euXBSP25RPjMzH4Dh9C3lpxMXHOdeuOASj1ttEKt7x0=;
        b=XFl2CfRJH9HQ2bm4ElknR/4p7YM9+jeflq+y8hwN8I1tORFh1RgyPDjwkSp2kNYrR6
         nyimEiQqVmZX04JuYdXa2ZCKplxD8+CbbVGrOwqs30HWd9OMYwzXt7a/KuGlE9wZfEex
         968A3ujASAy8ccafsnS2ei1hxlhtfv0Vz95XdeDXJmuVd20VZW5QmSIKMTOJNPO1jAQL
         nA8reNyqQtsxBZJhUHMvTnsyGtoe40lapn7GUsBx5VaZrHgJPqmgHnjmNPFQo6V+FPGZ
         fHFNxo+bUbNBK1gFRyu/BsGFtsnI8ZVWJHXW7w6hr5l6L4BmTD/E3h5GXbX4C46/UBnM
         H0hA==
X-Gm-Message-State: AOAM532DgbjxVYJPc1+Q664sEf9S2fviFrgRtSfioGmMBbAgaak/2YdY
        PHiSle+/vAErzq3BblbuZeGDzw==
X-Google-Smtp-Source: ABdhPJzQ9Cl+k6SVXVtCY2gk0XCiM48Zi16322pyq+Y+NejUC4LZKjLDWpH7EHO5TTISb0QQtVE2Ow==
X-Received: by 2002:a63:7d53:: with SMTP id m19mr7104533pgn.168.1589307460314;
        Tue, 12 May 2020 11:17:40 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w125sm11129642pgw.22.2020.05.12.11.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 11:17:39 -0700 (PDT)
Date:   Tue, 12 May 2020 11:16:07 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/4] arm64: dts: qcom: msm8916: Add blsp_i2c5
Message-ID: <20200512181607.GI57962@builder.lan>
References: <20200426140642.204395-1-stephan@gerhold.net>
 <20200426140642.204395-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426140642.204395-3-stephan@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 26 Apr 07:06 PDT 2020, Stephan Gerhold wrote:

> MSM8916 has another I2C QUP controller that can be enabled on
> GPIO 18 and 19.
> 
> Add blsp_i2c5 to msm8916.dtsi and disable it by default.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Most MSM8916 smartphones/tablets have a touchscreen
> connected to blsp_i2c5.
> ---
>  arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 24 ++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi      | 15 ++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> index b45fd12856ea..31886860766a 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> @@ -334,6 +334,30 @@ pinconf {
>  		};
>  	};
>  
> +	i2c5_default: i2c5_default {
> +		pinmux {
> +			function = "blsp_i2c5";
> +			pins = "gpio18", "gpio19";
> +		};
> +		pinconf {
> +			pins = "gpio18", "gpio19";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
> +	i2c5_sleep: i2c5_sleep {
> +		pinmux {
> +			function = "gpio";
> +			pins = "gpio18", "gpio19";
> +		};
> +		pinconf {
> +			pins = "gpio18", "gpio19";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	i2c6_default: i2c6_default {
>  		pinmux {
>  			function = "blsp_i2c6";
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 6ab7cabde370..57ab5573a2d2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -657,6 +657,21 @@ blsp_i2c4: i2c@78b8000 {
>  			status = "disabled";
>  		};
>  
> +		blsp_i2c5: i2c@78b9000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0x078b9000 0x500>;
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				 <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c5_default>;
> +			pinctrl-1 = <&i2c5_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		blsp_i2c6: i2c@78ba000 {
>  			compatible = "qcom,i2c-qup-v2.2.1";
>  			reg = <0x078ba000 0x500>;
> -- 
> 2.26.2
> 
