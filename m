Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 865121CCAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 18:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfENQNQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 May 2019 12:13:16 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38525 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbfENQNP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 May 2019 12:13:15 -0400
Received: by mail-lj1-f194.google.com with SMTP id 14so14877080ljj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2019 09:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jJJCaVS4lPxJYxaLNQ+iv/bMBu+kfDQ/UJdt3AXAx5E=;
        b=iW4OEc2rJ4QO4VnOBaL8xzRhnyhTRak2BlUQrGqE5M5auFWHY1YulA5xf+x1nkHyok
         oDRe3VTC7WnCntVoDnHUV8xd990AlEH7uWDFMQHRGl7Spmx/K7o57VJjbYMms5tNP3Jb
         x1PyOTuJvR2N0rnxJQSKzTIE/Nd9tDcRiPvb+OMIOkWKIKCAL+8EirHChcOFMF733Nmm
         Yhf04FPv0w3mqU+ruLJDQ3x8liRyBOf+NLcW0ovyNDA6JouvYOvcRlhs2T1ZyEbnPQVa
         DJRQ3AHxqbx9OCtbBWfKQtNLSydWyK6fPBFSc9vviCcFFdvwXlDk+Xmo/4JLKVHRDz8Q
         WWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jJJCaVS4lPxJYxaLNQ+iv/bMBu+kfDQ/UJdt3AXAx5E=;
        b=dwQKjueF6Af4aOkDzyO/YIIAIs8ll2UhSkMpTifiReTePnGfD7JZW60MR8GkGMlRKE
         O0IH95fqt2gpLUe0HMlklv40qzdZ6MsAks+aROS9o39TZvM/bzTTJWf8QJRWZa3gDs4v
         cBE7Ddyu1GhKySnD645fIDkA/EdbMkJepvf/Q2bsT0heR96npJgUWw3Y8hsPD2Xdat0e
         RKyC6bVnyIiw2C7zeFP+c1E+41K0MCizycy/Z1RQc0xo69uhriZmMgJDshO+BN3KlC/T
         EuXvYjHHVisEoV2z1irUOxjHqyCMlgTYg5P4c3Yzv0ecPfVG9XHbXP0E5VOsml7/2mOP
         SpAA==
X-Gm-Message-State: APjAAAW9XPR4WORJ4f0eVPAG0/Md7fGbwi8i/IRAvkiFWDscbs6IWiT7
        ebeSxglVOgJdTKEHMu1bpa/3xw==
X-Google-Smtp-Source: APXvYqxmu3kWObdwNZS5YelZ+E71aDrwR9sJP+/sCPOgK6Pv7WqN3F5TA6Vq76gx3WiCa7R72QAGjg==
X-Received: by 2002:a2e:9116:: with SMTP id m22mr2570114ljg.12.1557850393261;
        Tue, 14 May 2019 09:13:13 -0700 (PDT)
Received: from centauri.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id f189sm2274791lfe.66.2019.05.14.09.13.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 09:13:12 -0700 (PDT)
Date:   Tue, 14 May 2019 18:13:10 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>,
        devicetree@vger.kernel.org, mkshah@codeaurora.org,
        ulf.hansson@linaro.org
Subject: Re: [PATCHv1 8/8] arm64: dts: qcom: sdm845: Add PSCI cpuidle low
 power states
Message-ID: <20190514161310.GF1824@centauri.ideon.se>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <044cd74e461a1dd7934f44531802f4b557264365.1557486950.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <044cd74e461a1dd7934f44531802f4b557264365.1557486950.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 10, 2019 at 04:59:46PM +0530, Amit Kucheria wrote:
> From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
> 
> Add device bindings for cpuidle states for cpu devices.
> 
> [amit: rename the idle-states to more generic names and fixups]
> 
> Cc: <devicetree@vger.kernel.org>
> Cc: <mkshah@codeaurora.org>
> Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 62 ++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 5308f1671824..2c8c54e4bd77 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -119,6 +119,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_0>;
> @@ -136,6 +137,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_100>;
> @@ -150,6 +152,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x200>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_200>;
> @@ -164,6 +167,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x300>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_300>;
> @@ -178,6 +182,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x400>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_400>;
> @@ -192,6 +197,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x500>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_500>;
> @@ -206,6 +212,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x600>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_600>;
> @@ -220,6 +227,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x700>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_700>;
> @@ -228,6 +236,60 @@
>  				next-level-cache = <&L3_0>;
>  			};
>  		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			LITTLE_CPU_PD: little-power-down {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "little-power-down";
> +				arm,psci-suspend-param = <0x40000003>;
> +				entry-latency-us = <350>;
> +				exit-latency-us = <461>;
> +				min-residency-us = <1890>;
> +				local-timer-stop;
> +			};
> +
> +			LITTLE_CPU_RPD: little-rail-power-down {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "little-rail-power-down";
> +				arm,psci-suspend-param = <0x40000004>;
> +				entry-latency-us = <360>;
> +				exit-latency-us = <531>;
> +				min-residency-us = <3934>;
> +				local-timer-stop;
> +			};
> +
> +			BIG_CPU_PD: big-power-down {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "big-power-down";
> +				arm,psci-suspend-param = <0x40000003>;
> +				entry-latency-us = <264>;
> +				exit-latency-us = <621>;
> +				min-residency-us = <952>;
> +				local-timer-stop;
> +			};
> +
> +			BIG_CPU_RPD: big-rail-power-down {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "big-rail-power-down";
> +				arm,psci-suspend-param = <0x40000004>;
> +				entry-latency-us = <702>;
> +				exit-latency-us = <1061>;
> +				min-residency-us = <4488>;
> +				local-timer-stop;
> +			};
> +
> +			CLUSTER_PD: cluster-power-down {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "cluster-power-down";
> +				arm,psci-suspend-param = <0x400000F4>;
> +				entry-latency-us = <3263>;
> +				exit-latency-us = <6562>;
> +				min-residency-us = <9987>;
> +				local-timer-stop;

I'm surprised that this power state is not defined in downstream node qcom,pm-cluster@0
https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/arch/arm64/boot/dts/qcom/sdm845-pm.dtsi?h=msm-4.9

Also note that Ulf and Lina's cluster idling patch series:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=117055
hasn't been merged yet.

Is it really safe to add a cluster power state without this series?

If the firmware fails to enter this cluster power state, won't the
cpuidle governor continue to try to enter this power state?
Thus basically disabling cpuidle, since the governor will never try
to enter the per cpu power states?

It would be interesting with statistics of how many times we've tried
to enter this power state, together with how many times entering this
power state has failed. If this percentage is very high, then we probably
need the cluster idling patch series before enabling this power state.

> +			};
> +		};
>  	};
>  
>  	pmu {
> -- 
> 2.17.1
> 
