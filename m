Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2E6E25C6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 05:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbfEVD7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 23:59:51 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43543 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727681AbfEVD7u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 23:59:50 -0400
Received: by mail-pl1-f195.google.com with SMTP id gn7so373107plb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 20:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4mGp/RVFJWnTD/Q9wDJvqePP0STvNYmZjwcAHTYvGuA=;
        b=lmvy3Lil+GnYr+FE7U2+jS9pdx2E8qSCKzedcOVr2rTy/BvwqQPNKeArOrGk2F1hAT
         vlLTJwTIpuQ8Ze6IajIJ/J2yzjpOoET5dX8xnHQf49XILpP8ZMgvE750UBMR+7HXWtdo
         8MY9W5HbnnFdAzNsT/mgl2pqZoM9acxeah349NLcYXMi1282OUlzcDUd32oJ0F/HA9EB
         PbxhEoCBvICEIVQQma69HWM9qNveB+wnnJPtTyALqZgKThyU3rFQo5Bzr/wGO57A/S7H
         8+N5UH3ewRr04bd9mLjkOH/qI2NbwVOSOhgXnFkz/mAxWlf3gMynTezFAH7OAsB/9xxs
         OBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4mGp/RVFJWnTD/Q9wDJvqePP0STvNYmZjwcAHTYvGuA=;
        b=MsGVTh9WRUBBK28F9vO9dX/kaw7bu+HlDJgV5vAEkOYAKHXQUI6CPX40yCPb1/LnNB
         1XDDFWu/sYxYvIroMuAcsGOQBYn1H1yjKJdSNqvQ8s4O7UoO6xa/RdcFCfEHnlpYGZyy
         dXfqVOixngRBJYuNio3ysYzmdbG6a74BNpnVrcNFxPCqhy1V5AVGBSKJn5b3XBgXRvEt
         qWkBPLMoVykq3BSZzCBFUUpc/PIF7VCP0wu2plK8/P8baGYvIha8fUEoDkKFDCQOtfc3
         AXIrlIjvgSqV85sWJY9d+6KFUyh7opeejtNOfv9OYf+N01qhGLhxQYtuS75hPxscGLgV
         Ut6w==
X-Gm-Message-State: APjAAAXXkVAbFVxss2atm71XIRwe5uHhR66rzbpfBEWXihNsmKn2zegg
        U6vnE74/oc3cTZvjB86Ar2wPjw==
X-Google-Smtp-Source: APXvYqyxxgJtz0RRTL/pQYza0WCLUQaNTlpMqxmvsJFET/Ui7aM8FDqi8e7gpNNk3DXDhdkuhAaqhw==
X-Received: by 2002:a17:902:2aab:: with SMTP id j40mr64546756plb.238.1558497590003;
        Tue, 21 May 2019 20:59:50 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h13sm23043665pgk.55.2019.05.21.20.59.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 20:59:49 -0700 (PDT)
Date:   Tue, 21 May 2019 20:59:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, niklas.cassel@linaro.org,
        marc.w.gonzalez@free.fr, sibis@codeaurora.org,
        daniel.lezcano@linaro.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>, mkshah@codeaurora.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: sdm845: Add PSCI cpuidle low
 power states
Message-ID: <20190522035946.GO3137@builder>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <67d61032221b069082222347fb56effe17d4a7c3.1558430617.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67d61032221b069082222347fb56effe17d4a7c3.1558430617.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 May 02:35 PDT 2019, Amit Kucheria wrote:

> From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
> 
> Add device bindings for cpuidle states for cpu devices.
> 
> Cc: <mkshah@codeaurora.org>
> Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> [amit: rename the idle-states to more generic names and fixups]
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

Applied

Thanks,
Bjorn

>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 69 ++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 5308f1671824..a0ae6bf033ee 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -119,6 +119,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_0>;
> @@ -136,6 +137,8 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1
> +					   &CLUSTER_SLEEP_0>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_100>;
> @@ -150,6 +153,8 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x200>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1
> +					   &CLUSTER_SLEEP_0>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_200>;
> @@ -164,6 +169,8 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x300>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1
> +					   &CLUSTER_SLEEP_0>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_300>;
> @@ -178,6 +185,8 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x400>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1
> +					   &CLUSTER_SLEEP_0>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_400>;
> @@ -192,6 +201,8 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x500>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1
> +					   &CLUSTER_SLEEP_0>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_500>;
> @@ -206,6 +217,8 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x600>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1
> +					   &CLUSTER_SLEEP_0>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_600>;
> @@ -220,6 +233,8 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x700>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1
> +					   &CLUSTER_SLEEP_0>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_700>;
> @@ -228,6 +243,60 @@
>  				next-level-cache = <&L3_0>;
>  			};
>  		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "little-power-down";
> +				arm,psci-suspend-param = <0x40000003>;
> +				entry-latency-us = <350>;
> +				exit-latency-us = <461>;
> +				min-residency-us = <1890>;
> +				local-timer-stop;
> +			};
> +
> +			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "little-rail-power-down";
> +				arm,psci-suspend-param = <0x40000004>;
> +				entry-latency-us = <360>;
> +				exit-latency-us = <531>;
> +				min-residency-us = <3934>;
> +				local-timer-stop;
> +			};
> +
> +			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "big-power-down";
> +				arm,psci-suspend-param = <0x40000003>;
> +				entry-latency-us = <264>;
> +				exit-latency-us = <621>;
> +				min-residency-us = <952>;
> +				local-timer-stop;
> +			};
> +
> +			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "big-rail-power-down";
> +				arm,psci-suspend-param = <0x40000004>;
> +				entry-latency-us = <702>;
> +				exit-latency-us = <1061>;
> +				min-residency-us = <4488>;
> +				local-timer-stop;
> +			};
> +
> +			CLUSTER_SLEEP_0: cluster-sleep-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "cluster-power-down";
> +				arm,psci-suspend-param = <0x400000F4>;
> +				entry-latency-us = <3263>;
> +				exit-latency-us = <6562>;
> +				min-residency-us = <9987>;
> +				local-timer-stop;
> +			};
> +		};
>  	};
>  
>  	pmu {
> -- 
> 2.17.1
> 
