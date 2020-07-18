Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22E522499D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jul 2020 09:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbgGRHQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jul 2020 03:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbgGRHQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jul 2020 03:16:55 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5ACC0619D5
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2020 00:16:54 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o22so7373903pjw.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2020 00:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hfxUueH3QbeglEO7GeTZdxJkg4B3ud/EaO3dQbu1Hog=;
        b=dJkmroxRnASHU49YmVLzvTRNRNDhNriN4AkQBH8Uh7RzLxxpddcTCglkk9C7OIlojz
         Bg2I+4BZod7hZhFJb4dTzGDjGMFEAzCoAGZUxrohX87vux5J82jnWcq6xYuZqqIZ3t79
         cudhKXbUTgB0WBVnong8BkqETzxZqazL+t9i2kcgBL6RMy0urpkLO/E8t6x13pCacSLr
         M225oOctgnwDwEOeDN4cZe4Wa272TY4DFz43fF5ULxJ05rC4iKP8fPJzPgr23NjUEmoo
         5n+E3W15gaB6ylvXHyqJcWF4Xpa405tbjktCA6vM+i1brDEedNMWDrOL8A6BPYA2lYLQ
         9tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hfxUueH3QbeglEO7GeTZdxJkg4B3ud/EaO3dQbu1Hog=;
        b=ub7916imLm4Z2RXIRngHu00sliM0dgqEATkEMtR7WVIhCJDScco3rzkzpirVoNiCbu
         m0ii0wbRmwl7XOzn3DUIjZnfTqT55ajFeit1dmEIfdZB9uFz9pqXaA83zuvtX3wxvdH2
         usvX+SOodQVhB4j7Z0mmLrSG/u1GOzt+wjSRhrlsn9Wb0F1iCTNe35zy4GR/nzg0nXEJ
         zPW3LstU/HmQVcgvGVvILYRfaQD88K4jg91fFu8M7IYbUSbQy6c0fhAErt3s8Q0Pb7+N
         UlxhCSWjCT5W/9DcJOPSBLDWo1jo8Xd6IpgE5KnOJs1aFKa8JWBcSr1rX8aUAK+Erkyf
         eXEQ==
X-Gm-Message-State: AOAM530Xpj1J8fjdpmbvKeadRQcjPIRjxXm6L61Z1vOyAR1Mkkq/A8/M
        uiF2YqoVn2ApxBhhWr6PnI97VA==
X-Google-Smtp-Source: ABdhPJw+e+O6DfxUZ/zVD14RmqoHO4q64ucdaV4e2CBHpcvf3lklVV+zwiNz4hv2SJez9BqpzI8uPg==
X-Received: by 2002:a17:902:40a:: with SMTP id 10mr10822306ple.260.1595056613941;
        Sat, 18 Jul 2020 00:16:53 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x9sm7088652pfq.11.2020.07.18.00.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2020 00:16:53 -0700 (PDT)
Date:   Sat, 18 Jul 2020 00:16:50 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, mka@chromium.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        Pradeep P V K <ppvk@codeaurora.org>
Subject: Re: [PATCH V1] arm64: dts: qcom: Add bandwidth votes for eMMC and
 SDcard
Message-ID: <20200718071650.GC61202@yoga>
References: <1595054006-6803-1-git-send-email-sbhanu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595054006-6803-1-git-send-email-sbhanu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 17 Jul 23:33 PDT 2020, Shaik Sajida Bhanu wrote:

Plase add "sc7180: " between "qcom:" and "Add"

> From: Pradeep P V K <ppvk@codeaurora.org>
> 
> Add the bandwidth domain supporting performance state and
> the corresponding OPP tables for the sdhc device on sc7180.
> 

You need Pradeep's signed-off-by here before yours.

> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> ---
> This change is depends on the patch series
> https://lkml.org/lkml/2020/6/30/1280
> Also depends on documentation commit 557ed5f (Present on linux-next)

Afaict both of these exists in linux-next, so no need to mention them.


Would be nice to have Rajendra's ack/reviewed-by on this patch, as
you're amending his. Please Cc him.

The change itself looks good to me though.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 68f9894..d78a066 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -684,6 +684,9 @@
>  			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
>  					<&gcc GCC_SDCC1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			interconnects = <&aggre1_noc MASTER_EMMC &mc_virt SLAVE_EBI1>,
> +				<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_EMMC_CFG>;
> +			interconnect-names = "sdhc-ddr","cpu-sdhc";
>  			power-domains = <&rpmhpd SC7180_CX>;
>  			operating-points-v2 = <&sdhc1_opp_table>;
>  
> @@ -704,11 +707,15 @@
>  				opp-100000000 {
>  					opp-hz = /bits/ 64 <100000000>;
>  					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <100000 100000>;
> +					opp-avg-kBps = <100000 50000>;
>  				};
>  
>  				opp-384000000 {
>  					opp-hz = /bits/ 64 <384000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>;
> +					opp-peak-kBps = <600000 900000>;
> +					opp-avg-kBps = <261438 300000>;
>  				};
>  			};
>  		};
> @@ -2476,6 +2483,10 @@
>  			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
>  					<&gcc GCC_SDCC2_AHB_CLK>;
>  			clock-names = "core", "iface";
> +
> +			interconnects = <&aggre1_noc MASTER_SDCC_2 &mc_virt SLAVE_EBI1>,
> +				<&gem_noc MASTER_APPSS_PROC &config_noc	SLAVE_SDCC_2>;
> +			interconnect-names = "sdhc-ddr","cpu-sdhc";
>  			power-domains = <&rpmhpd SC7180_CX>;
>  			operating-points-v2 = <&sdhc2_opp_table>;
>  
> @@ -2489,11 +2500,15 @@
>  				opp-100000000 {
>  					opp-hz = /bits/ 64 <100000000>;
>  					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <160000 100000>;
> +					opp-avg-kBps = <80000 50000>;
>  				};
>  
>  				opp-202000000 {
>  					opp-hz = /bits/ 64 <202000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>;
> +					opp-peak-kBps = <200000	120000>;
> +					opp-avg-kBps = <100000 60000>;
>  				};
>  			};
>  		};
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
