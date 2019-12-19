Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33390127174
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 00:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfLSX3L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 18:29:11 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40780 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfLSX3L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 18:29:11 -0500
Received: by mail-pf1-f194.google.com with SMTP id q8so4153212pfh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 15:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Jsi+F0iX2PzBdBAMLJPSaUkUuxSr3VLCQXp5gSjIoW8=;
        b=LIYGkG4+kJk0lp1PkIDafWCnaoooIAJXV1BFG4P86uc8iWle3bJipXQbjnuAyBFvdj
         /eGVwgZEG6jXAmnujn9RyenMxtf9baMOH+xarAEBG5Uvts3b1XnuDrgSxBqXP81bXwA1
         relGzchU1zH/YqQ66+QXAhhALXdnw2Jo6Svek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jsi+F0iX2PzBdBAMLJPSaUkUuxSr3VLCQXp5gSjIoW8=;
        b=ZElkdNiLLAJXCG0HxLvM0QiqVQWjpEezYXVIDR0d8KcfNKnuYnZwgAMoX1aJ1CK/3x
         gfplgw2v2fGmMqOk6zhk8narH5arvj+7IkadxUqkx0t9rD4Q2Tb7ayOo+EmCBu7CRUuX
         FhSKGBpVuwbEtvsKcHbFP8CfQryqy/eq8m+OedeaYvLlfbfPKv+u4lcx4vE2w5JJzIrv
         rHJ9HmtBHf2PRTId2/zCHRFS1AaN4403lzTTYFmZY/szB90KAALcrwgrh2Tc1KulE/Yv
         zyAGS/JqEQBYHqbN7zcw7IXYRP/vrsy51q2jgpOdMcvMGXL+Lesh7OK8miB4nGWyxRVU
         w06g==
X-Gm-Message-State: APjAAAU1Zr8kXpKZAdCbwHmH5G3Y22NPiJCOqJuiLz2pgFYInxrDs53J
        UGt+D40+KkVAw+Q9n3IEhijEsw==
X-Google-Smtp-Source: APXvYqxnxUNXSFAedpvMV3Vof65Su8H7bj4aXmgynUniBeReHLqhhSUJJOJXjjHnv73UGqdw4rJhtQ==
X-Received: by 2002:a63:504f:: with SMTP id q15mr11563591pgl.8.1576798150841;
        Thu, 19 Dec 2019 15:29:10 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id e12sm8087062pjs.3.2019.12.19.15.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 15:29:10 -0800 (PST)
Date:   Thu, 19 Dec 2019 15:29:08 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7180: Add nodes for eMMC and SD
 card
Message-ID: <20191219232908.GA228856@google.com>
References: <1576288475-7606-1-git-send-email-vbadigan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1576288475-7606-1-git-send-email-vbadigan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Dec 14, 2019 at 07:24:34AM +0530, Veerabhadrarao Badiganti wrote:
> Add sdhc instances for supporting eMMC and SD-card on sc7180.
> The regulators should be in HPM state for proper functionality of
> eMMC and SD-card. Updating corresponding regulators accordingly.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
> 
> This depends on the patch series (dt support for sc7180):
> https://lkml.org/lkml/2019/11/8/149
> Also depends on documentation commit 2078158 (Present on mmc-next)
> 
> Changes since V1:
> 	- Updated the regulator min, max voltages as per
> 	  eMMC/SD-card voltage requirements
> 	- Enabled IOMMU for eMMC and SD-card.
> 	- Added pull and drive strength to SD-card cd-gpio.
> 	- Incorporated review comments by Matthias Kaehlcke.
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  47 +++++++---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 148 ++++++++++++++++++++++++++++++++
>  2 files changed, 183 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 189254f..b6d4dc1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -7,6 +7,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7180.dtsi"
>  #include "pm6150.dtsi"
> @@ -101,9 +102,9 @@
>  		};
>  
>  		vreg_l12a_1p8: ldo12 {
> -			regulator-min-microvolt = <1696000>;
> -			regulator-max-microvolt = <1952000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l13a_1p8: ldo13 {
> @@ -143,9 +144,9 @@
>  		};
>  
>  		vreg_l19a_2p9: ldo19 {
> -			regulator-min-microvolt = <2696000>;
> -			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
>  
> @@ -189,9 +190,9 @@
>  		};
>  
>  		vreg_l6c_2p9: ldo6 {
> -			regulator-min-microvolt = <2696000>;
> -			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2950000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7c_3p0: ldo7 {
> @@ -207,9 +208,9 @@
>  		};
>  
>  		vreg_l9c_2p9: ldo9 {
> -			regulator-min-microvolt = <2952000>;
> -			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l10c_3p3: ldo10 {
> @@ -400,3 +401,25 @@
>  			bias-pull-up;
>  		};
>  };
> +
> +&sdhc_1 {
> +	status = "ok";

another nit: the DT code is fine with both "okay" and "ok", however
the rest of this file uses "okay", so let's be consistent and use the
same string in all nodes.

> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc1_on>;
> +	pinctrl-1 = <&sdc1_off>;
> +	vmmc-supply = <&vreg_l19a_2p9>;
> +	vqmmc-supply = <&vreg_l12a_1p8>;
> +};
> +
> +&sdhc_2 {
> +	status = "ok";

ditto
