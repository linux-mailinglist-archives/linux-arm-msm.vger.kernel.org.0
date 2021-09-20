Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2A2410EE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 06:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhITESX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 00:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhITESW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 00:18:22 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8702C061760
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Sep 2021 21:16:56 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id c8-20020a9d6c88000000b00517cd06302dso21836865otr.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Sep 2021 21:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0N/v0Gsykjs7WJF9Qw6lISgB5iqvBLM+hQh8dhdz0T0=;
        b=UBiSCTKK1GPR2bNgRg2TrffMeItGZd+b+nwxFcWw0zRmFi5z3LjZpCkAVwozO1ElXh
         Q6rbnuJuBBCz1nf328o60CM4UZg85AC2YPXVzxwZTIcHd4VJJzOu1KJ/mBO/2XmAaWyK
         fNguKUtoYA4YNUeKeVxuGB39p/icyw8okbXA93wEuHxIjeqXpA4bD+feCXNsEUUXTqjs
         QMWl8Ls6eME4Mqvbby3u4LSti8Jk76qSu3qwsK68uRNG/tbqO+/tkQklNEVYKwQWCpDp
         xIvKBmlscI7Np8Fz/LLtEzyPoaDV7iCrbv3NalDAOWyFxOxlk6Rx807hY/M0cvjDF36h
         2jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0N/v0Gsykjs7WJF9Qw6lISgB5iqvBLM+hQh8dhdz0T0=;
        b=Kqs5csc0ib0tYM/1UUtYGKMBlJhIuTGDRC+wAkXg4Z6FcxuYrmhdp+ziOiCV0iqc1z
         /LZBycnqrbSG0AvUuwq+/ZpUBE/nNUA6RSc74HfgPlq/CblNJdZ95T3kfwxpqLuIVj5f
         Is3gEnkXQcKllI+GTP+iKbsjR13HF89ayfehvYu09+SKCTzlpwAZzq3AdhxL3vSajaqc
         hXSv2Usrmw2gcDVV0zql/a+jaIH4B1sviy8pLhg8FJZcUKAlRBTjQpga5ut5Vyj5xt4/
         /UXhIIulU1/vjD0cx1ayRT8CPiJgvV8dCugLNElvTGlJEkyepBBoNpv9vA6btWZUzoWG
         +b1g==
X-Gm-Message-State: AOAM531WLOl+UzlrCrZh9YG29pdA/EiifcCQwvAetdyhVMKiecUXx4KB
        VNSlxNHr5s266wp/EiHwjYxy9Q==
X-Google-Smtp-Source: ABdhPJzaujUf8VNoX9rkPNxkf7ZzKEX36vXMeq8Umw/8JMYwZ7swWChQQkeIKpy0w+9g5AnTKGCXdg==
X-Received: by 2002:a05:6830:913:: with SMTP id v19mr18727098ott.131.1632111416118;
        Sun, 19 Sep 2021 21:16:56 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m2sm3233639ooa.42.2021.09.19.21.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 21:16:55 -0700 (PDT)
Date:   Sun, 19 Sep 2021 23:16:53 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: qcom: ipq4019: add dwc3 arch spec
 compatible
Message-ID: <YUgLNZlKbaqeCQYp@builder.lan>
References: <20210908193329.87992-1-david@ixit.cz>
 <20210908193329.87992-2-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908193329.87992-2-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 08 Sep 14:33 CDT 2021, David Heidelberg wrote:

> To be compilant with qcom,dwc3 definition
>  - add compatible
>  - rename dwc3@ to usb@
> 
> No functional changes intended.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index a3ae5458ac68..25b7e10537df 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -637,7 +637,7 @@ usb3_hs_phy: hsphy@a6000 {
>  		};
>  
>  		usb3: usb3@8af8800 {
> -			compatible = "qcom,dwc3";
> +			compatible = "qcom,ipq4019-dwc3", "qcom,dwc3";
>  			reg = <0x8af8800 0x100>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> @@ -648,7 +648,7 @@ usb3: usb3@8af8800 {
>  			ranges;
>  			status = "disabled";
>  
> -			dwc3@8a00000 {
> +			usb@8a00000 {

As noted in a recent discussion, this causes the UDC name exposed in
sysfs to change. So even though it's contradicting the binding let's
keep it unchanged for now.

The compatible part looks good though, so can you please respin this
patch with that part only?

Thanks,
Bjorn

>  				compatible = "snps,dwc3";
>  				reg = <0x8a00000 0xf8000>;
>  				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
> @@ -669,7 +669,7 @@ usb2_hs_phy: hsphy@a8000 {
>  		};
>  
>  		usb2: usb2@60f8800 {
> -			compatible = "qcom,dwc3";
> +			compatible = "qcom,ipq4019-dwc3", "qcom,dwc3";
>  			reg = <0x60f8800 0x100>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> @@ -680,7 +680,7 @@ usb2: usb2@60f8800 {
>  			ranges;
>  			status = "disabled";
>  
> -			dwc3@6000000 {
> +			usb@6000000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x6000000 0xf8000>;
>  				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.33.0
> 
