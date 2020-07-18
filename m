Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F81224993
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jul 2020 09:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgGRHHq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jul 2020 03:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgGRHHp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jul 2020 03:07:45 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E44C0619D4
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2020 00:07:45 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a14so6444418pfi.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2020 00:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FvB+EstirEoaTYLy3FAmpSy2vtZp1fbnxBznhXtHkyU=;
        b=zOrVrQ8vs9K/U2uxQicdd0HuHtzFZWRl13/zXu2H/VSzWMsxphMZUUccwK34jqeiRr
         KYSzLmJrqdrS1FHjnsQxrBD5jirXXrbWPj8UksDOnkWSD9lGGhcFULfAvndSAaH7vbrz
         di3kEoRa+6Nt83wAeKHtAxGjWguI+iTDqOswGzEDwQ1HwjmRXOMG6tLFULIiSFfQBztv
         bAVQNa8r7K1RiTJ/0He0A1X5MTFZ9NZo4mfRLsI/3T4z3g3mM6lT2jXLRaL/SFC+mr6C
         nQP3VAn06OoxobWjoZ0bkub4ez4+feDmW4qpkYZ/BNALw2aDF1EcgC9jV2cbozWHDlBv
         PMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FvB+EstirEoaTYLy3FAmpSy2vtZp1fbnxBznhXtHkyU=;
        b=X2DAzZk3Fh0WPWy/uwfodRf8uLcthg02mb1srwff2py2glgvpYSKmUC1Z7ZgI8Ojr2
         weMjXXV93dnVnEwVlBQVyXgKP5Jg6QneWGet9X24C+FTqWIenDziGClVFkqP6JkHNeiL
         9NP093mlVjll0zWG5g5Aq3Tn2wWhrQVG9CrLjxZXW4YQt7JrS4tH9UKnJdYx8HD85U7z
         6ScumzShd73V4XfqHOwdtkOMFWh4dHeet4ohqoHkq/fsMT7geTMoIK7kCt4M3yMoxF+y
         9eDf3ajzQtzup+kEW16AGNJXH4g6+jsfRKstyu2MnoJAtGL32AR8x/5p2p+O6IiY7k5m
         AWXA==
X-Gm-Message-State: AOAM532DfUEQn/cQrl91wib2btv42rXBjwqRuVrAYNhBL9gUTFLRwDgi
        keemcW9U/5dWCVTBgF4msyhhQQ==
X-Google-Smtp-Source: ABdhPJxI1f6Tah2zpEfBV0ApJb35RLL0rDSc8ngWpvA54RkvtaT4kEQqaoMfJx9gdGEPqAzFnsReiQ==
X-Received: by 2002:a63:be4e:: with SMTP id g14mr11652459pgo.193.1595056064925;
        Sat, 18 Jul 2020 00:07:44 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r8sm9689269pfh.29.2020.07.18.00.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2020 00:07:44 -0700 (PDT)
Date:   Sat, 18 Jul 2020 00:07:40 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, mka@chromium.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: Re: [PATCH V1] arm64: dts: qcom: SD-card GPIO pin set bias-pull up
Message-ID: <20200718070740.GB61202@yoga>
References: <1595054041-6872-1-git-send-email-sbhanu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595054041-6872-1-git-send-email-sbhanu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 17 Jul 23:34 PDT 2020, Shaik Sajida Bhanu wrote:

> From: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> 
> On some sc7180 based platforms where external pull is not present on cd-gpio,
> this gpio state is getting read as HIGH when sleep config is applied on it.
> This is resulting in SDcard rescan after suspend-resume even though SDcard
> is not present.
> 
> Update cd-gpio sleep config with bais-pull to fix this issue.
> 
> Also include xo clock to sdhc clocks list which will be used
> in calculating MCLK_FREQ field of DLL_CONFIG2 register.
> 

Please split this in two patches; one fixing the card detect bias and
one for adding the xo clock.


This needs Veerabhadrarao's signed-off-by as well (followed by yours).

Regards,
Bjorn

> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d78a066..8034fcc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -682,8 +682,9 @@
>  			interrupt-names = "hc_irq", "pwr_irq";
>  
>  			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> -					<&gcc GCC_SDCC1_AHB_CLK>;
> -			clock-names = "core", "iface";
> +					<&gcc GCC_SDCC1_AHB_CLK>,
> +					<&xo_board>;
> +			clock-names = "core", "iface", "xo";
>  			interconnects = <&aggre1_noc MASTER_EMMC &mc_virt SLAVE_EBI1>,
>  				<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_EMMC_CFG>;
>  			interconnect-names = "sdhc-ddr","cpu-sdhc";
> @@ -1819,7 +1820,7 @@
>  
>  				pinconf-sd-cd {
>  					pins = "gpio69";
> -					bias-disable;
> +					bias-pull-up;
>  					drive-strength = <2>;
>  				};
>  			};
> @@ -2481,8 +2482,9 @@
>  			interrupt-names = "hc_irq", "pwr_irq";
>  
>  			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
> -					<&gcc GCC_SDCC2_AHB_CLK>;
> -			clock-names = "core", "iface";
> +					<&gcc GCC_SDCC2_AHB_CLK>,
> +					<&xo_board>;
> +			clock-names = "core", "iface", "xo";
>  
>  			interconnects = <&aggre1_noc MASTER_SDCC_2 &mc_virt SLAVE_EBI1>,
>  				<&gem_noc MASTER_APPSS_PROC &config_noc	SLAVE_SDCC_2>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
