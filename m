Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83A322CBB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 19:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgGXRKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 13:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgGXRKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 13:10:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93630C0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 10:10:21 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o13so5631423pgf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 10:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qkAaFjery3QjJ83jfEJ0MJlBn4m3y6EVIy2ZbJLV8bU=;
        b=kuy4/sNcdDcQ202jEjqBuGOnLzo0pbV5eJseYDLyUGSWZ8ex6s9jqe0ekBtgjg6ljJ
         7PTWh+d687iUKNUgu6iPFMx78M8I0pYjZBP/8ZLz+DB+7k9ZMhN4yaX5XA/O/Sdo5iMP
         p05otZD7eM5+ZLXdt3oma4VUUiuuVuZZzYjV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qkAaFjery3QjJ83jfEJ0MJlBn4m3y6EVIy2ZbJLV8bU=;
        b=lBLkFrtAxt/rV0i2ZU+t4AoJYQxfe/OdUH7yMtUfdSsso9Wk3K+DOJHYU8tVubtiJE
         VJmWxlQ25mFPUb+M6AC4r0i8+UQLapIgdCq8sVREXOmXy3isDQyLMPDJ2RHG1A7B+th5
         weAYt/aVXUqZ0kV5PaZBNg9pL2IS4++ubWXe05b/TpFmMB5g5D9kKIGOE9bsxAy4KfBz
         tiQqho2+SkEtk8rg8a1yRDtyVpicLVF3b4AEcNbL2edRk2LSIJfvhrfUqhnAZw38JD2q
         dr0rWFJyGcRaYK+tiU7q/iEyFivDSlWtQeVm1pWqVDQR7vgspVFecEAzSh0Qkt6Yrw1d
         MJwA==
X-Gm-Message-State: AOAM532FiA9MWwRiDB6ZCwwMkDS6o0YtxpcvwkSJyTViLxJpkBfv6WPL
        f207+27CYjPwvCX3FKCrH5L9ug==
X-Google-Smtp-Source: ABdhPJzZxhrzHOCqKvqD4WQ6yqc1s3n1hBE8cuy5bTPcCpOum59Gr0QXldYjMlULUPK1IaxQYnkh4g==
X-Received: by 2002:a63:7c5:: with SMTP id 188mr9653775pgh.48.1595610621095;
        Fri, 24 Jul 2020 10:10:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id m17sm7265223pfo.182.2020.07.24.10.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 10:10:19 -0700 (PDT)
Date:   Fri, 24 Jul 2020 10:10:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, rnayak@codeaurora.org,
        Pradeep P V K <ppvk@codeaurora.org>
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7180: Add bandwidth votes for
 eMMC and SDcard
Message-ID: <20200724171018.GZ3191083@google.com>
References: <1595328381-29552-1-git-send-email-sbhanu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1595328381-29552-1-git-send-email-sbhanu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shaik,

On Tue, Jul 21, 2020 at 04:16:21PM +0530, Shaik Sajida Bhanu wrote:
> From: Pradeep P V K <ppvk@codeaurora.org>
> 
> Add the bandwidth domain supporting performance state and
> the corresponding OPP tables for the sdhc device on sc7180.
> 
> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> ---
> 
> Changes since V1:
> 	- Incorporated review comments by Bjorn Andersson.
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

Does the sdhci-msm driver actually have BW scaling support at this point?

There is commit 4ece9795be56 ("mmc: sdhci-msm: Add interconnect
bandwidth scaling support"), whose commit message says "make sure
interconnect driver is ready before handling interconnect scaling.".

I haven't seen any patch adding the scaling support (supposedly by
adding dev_pm_opp_set_bw() calls?). Did I miss it? If not it seems
it would make sense to post it in a series together with this patch,
as far as I can tell this patch alone does nothing in practical terms.

grep sdhc /sys/kernel/debug/interconnect/interconnect_summary
  8804000.sdhci                          0            0            0
  7c4000.sdhci                           0            0            0
  7c4000.sdhci                           0            0            0
  8804000.sdhci                          0            0            0
  ...
