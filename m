Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECE028C98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 23:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387709AbfEWVq2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 17:46:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42224 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388145AbfEWVq2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 17:46:28 -0400
Received: by mail-lj1-f196.google.com with SMTP id 188so6844870ljf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L40m6i7tZPLQ9iKavhZnA3KH/2jvARjZyuhU2BI7O9M=;
        b=eH6C5Au10yB/Db3vJzqwisP1niVXIQN572MCacizn2RxCtX5QDzbIBkUWlDvKBt6kD
         17myI9dq+sJh+zL9kUGC8XSx1evF5EohHcXKOX16PQJlUdrDIADJzmXdcjqIVTolDwED
         c7yBRhIC2s7aKriP2coZbmhGdZTccPlbJSGry+U/bOOoo7mQ9oSztZ1LHdgTmru2iRci
         vS7VRe1FtVf3dEBE/FQmrb9S4+zdf73HAZSbyewEZTxL7wVsI+S09ARXmmlP5qdgWYiX
         ANl+4CnZxcK9MWL1zzyw9zncsPDed5HWimvN7JKk+uF+TdMCFfIWCY9JU+qPAaWE+PtN
         9sFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L40m6i7tZPLQ9iKavhZnA3KH/2jvARjZyuhU2BI7O9M=;
        b=as/HoYjOHtKyQ1DS4GF3Rj3sMc2XFR9AIkf52cDb9FMHDh5EDcy+ff81Tgu/r0Nu/f
         n7sBZgD8YPZmnR17d/HHW5hL1XBfdtCdTgDwTPJRFdPVlxGUBZyeV5Zy/MuPF908Pigc
         xltGhtDBRl32v8AdwXZb/mYqB3D49bqS4phd7uslhOFA0h2rVQY1akLJiSrhLigL4dbd
         pdzGy448Ka0Pi4I1r1YlH7L1+tppblxSFjEiaq+u3FPxiP68kiE6d/WjuYzGPGxjxyW7
         4k5UPUaUVRUO5x6dKKef2L961wmDZJUYwDVZbDNzmopePrxESBo/+Vri75iYRTPheRI3
         nauQ==
X-Gm-Message-State: APjAAAXCCQrIFMw4Ctn5N5H5ayPbyhdnhS2ezkROuITJon880HReEAFv
        Qbgx9UfB2KtjALieQFf1FWqUzpen/38=
X-Google-Smtp-Source: APXvYqzYvw3SYCpZLeTQhdYuLa1BZ5iuKOeS9LjFXv2gg3Fj0LwZzyEolhahK4KPdvbcvWcsu/7jCg==
X-Received: by 2002:a2e:8816:: with SMTP id x22mr21314386ljh.169.1558647984769;
        Thu, 23 May 2019 14:46:24 -0700 (PDT)
Received: from centauri (m83-185-80-163.cust.tele2.se. [83.185.80.163])
        by smtp.gmail.com with ESMTPSA id b29sm149132lfo.38.2019.05.23.14.46.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 23 May 2019 14:46:23 -0700 (PDT)
Date:   Thu, 23 May 2019 23:46:19 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: msm8998: Add PSCI cpuidle low power
 states
Message-ID: <20190523214619.GB25133@centauri>
References: <346cd9f0-583d-f467-83d0-e73768bf5aac@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <346cd9f0-583d-f467-83d0-e73768bf5aac@free.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 23, 2019 at 10:36:51AM +0200, Marc Gonzalez wrote:
> From: Amit Kucheria <amit.kucheria@linaro.org>
> 
> Add device bindings for cpuidle states for cpu devices.
> 
> [marc: rebase and fix arm,psci-suspend-param for power-collapse]
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
> Bjorn, this is an updated/fixed (as documented above) version of
> [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 50 +++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 412195b9794c..224f84e39204 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -78,6 +78,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>  			next-level-cache = <&L2_0>;
>  			L2_0: l2-cache {
>  				compatible = "arm,arch-cache";
> @@ -96,6 +97,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x1>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>  			next-level-cache = <&L2_0>;
>  			L1_I_1: l1-icache {
>  				compatible = "arm,arch-cache";
> @@ -110,6 +112,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x2>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>  			next-level-cache = <&L2_0>;
>  			L1_I_2: l1-icache {
>  				compatible = "arm,arch-cache";
> @@ -124,6 +127,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x3>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>  			next-level-cache = <&L2_0>;
>  			L1_I_3: l1-icache {
>  				compatible = "arm,arch-cache";
> @@ -138,6 +142,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>  			next-level-cache = <&L2_1>;
>  			L2_1: l2-cache {
>  				compatible = "arm,arch-cache";
> @@ -156,6 +161,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x101>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>  			next-level-cache = <&L2_1>;
>  			L1_I_101: l1-icache {
>  				compatible = "arm,arch-cache";
> @@ -170,6 +176,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x102>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>  			next-level-cache = <&L2_1>;
>  			L1_I_102: l1-icache {
>  				compatible = "arm,arch-cache";
> @@ -184,6 +191,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x103>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>  			next-level-cache = <&L2_1>;
>  			L1_I_103: l1-icache {
>  				compatible = "arm,arch-cache";
> @@ -230,6 +238,48 @@
>  				};
>  			};
>  		};
> +

Hello Marc, Amit,

Looking at this line of code in msm-4.14:
https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/drivers/cpuidle/lpm-levels.c?h=LA.UM.7.1.r1-14000-sm8150.0#n993

And seeing the equivalent in msm-4.4:
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/cpuidle/lpm-levels.c?h=msm-4.4#n1080

It becomes obvious that

qcom,time-overhead == entry-latency-us + exit-latency-us
and
qcom,latency-us == exit-latency-us

which means that

entry-latency-us == qcom,time-overhead - qcom,latency-us


Using this formula, with the numbers from downstream SDM845:
https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/arch/arm64/boot/dts/qcom/sdm845-pm.dtsi?h=msm-4.9#n123

qcom,latency-us = <621>;
qcom,time-overhead = <885>;

885 - 621 = 264

we end up with the same values that Raju
has in his submission for upstream SDM845:
https://patchwork.kernel.org/patch/10953253/

entry-latency-us = <264>;
exit-latency-us = <621>;

> +		idle-states {
> +			entry-method = "psci";
> +
> +			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "little-retention";
> +				arm,psci-suspend-param = <0x00000002>;
> +				entry-latency-us = <43>;
> +				exit-latency-us = <86>;

Which for little cluster retention:

https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=msm-4.4#n153

qcom,latency-us = <86>;
qcom,time-overhead = <167>;

gives:

entry-latency-us = <81>;
exit-latency-us = <86>;

> +				min-residency-us = <200>;
> +			};
> +
> +			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "little-power-collapse";
> +				arm,psci-suspend-param = <0x40000003>;
> +				entry-latency-us = <100>;
> +				exit-latency-us = <612>;

Which for little power collapse:

https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=msm-4.4#n163

qcom,latency-us = <612>;
qcom,time-overhead = <885>;

gives:

entry-latency-us = <273>;
exit-latency-us = <612>;

> +				min-residency-us = <1000>;
> +				local-timer-stop;
> +			};
> +
> +			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "big-retention";
> +				arm,psci-suspend-param = <0x00000002>;
> +				entry-latency-us = <41>;
> +				exit-latency-us = <82>;

Which for big retention:

https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=msm-4.4#n246

qcom,latency-us = <82>;
qcom,time-overhead = <161>;

gives:

entry-latency-us = <79>;
exit-latency-us = <82>;

> +				min-residency-us = <200>;
> +			};
> +
> +			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "big-power-collapse";
> +				arm,psci-suspend-param = <0x40000003>;
> +				entry-latency-us = <100>;
> +				exit-latency-us = <525>;
> +				min-residency-us = <1000>;

Which for big power collapse:

https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=msm-4.4#n256

qcom,latency-us = <525>;
qcom,time-overhead = <861>;

gives:

entry-latency-us = <336>;
exit-latency-us = <525>;

> +				local-timer-stop;
> +			};
> +		};
>  	};
>  
>  	firmware {
> -- 
> 2.17.1
