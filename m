Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 341D619DEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 15:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbfEJNPs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 09:15:48 -0400
Received: from ns.iliad.fr ([212.27.33.1]:52308 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727258AbfEJNPs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 09:15:48 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 0B7521FF3E;
        Fri, 10 May 2019 15:15:46 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id E96A11FF1D;
        Fri, 10 May 2019 15:15:45 +0200 (CEST)
Subject: Re: [PATCHv1 7/8] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <0afe77d25490b10250f9eac4b4e92ccac8c42718.1557486950.git.amit.kucheria@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <3de9c573-5971-15fc-1632-706fc30e90c2@free.fr>
Date:   Fri, 10 May 2019 15:15:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0afe77d25490b10250f9eac4b4e92ccac8c42718.1557486950.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri May 10 15:15:46 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/05/2019 13:29, Amit Kucheria wrote:

> Add device bindings for cpuidle states for cpu devices.
> 
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 3fd0769fe648..208281f318e2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -78,6 +78,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD>;

For some reason, I was expecting the big cores to come first, but according
to /proc/cpuinfo, cores 0-3 are part 0x801, while cores 4-7 are part 0x800.

According to https://github.com/pytorch/cpuinfo/blob/master/src/arm/uarch.c

0x801 = Low-power Kryo 260 / 280 "Silver" -> Cortex-A53
0x800 = High-performance Kryo 260 (r10p2) / Kryo 280 (r10p1) "Gold" -> Cortex-A73

>  			efficiency = <1024>;
>  			next-level-cache = <&L2_0>;
>  			L2_0: l2-cache {
> @@ -97,6 +98,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x1>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD>;
>  			efficiency = <1024>;
>  			next-level-cache = <&L2_0>;
>  			L1_I_1: l1-icache {
> @@ -112,6 +114,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x2>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD>;
>  			efficiency = <1024>;
>  			next-level-cache = <&L2_0>;
>  			L1_I_2: l1-icache {
> @@ -127,6 +130,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x3>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD>;
>  			efficiency = <1024>;
>  			next-level-cache = <&L2_0>;
>  			L1_I_3: l1-icache {
> @@ -142,6 +146,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD>;
>  			efficiency = <1536>;
>  			next-level-cache = <&L2_1>;
>  			L2_1: l2-cache {
> @@ -161,6 +166,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x101>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD>;
>  			efficiency = <1536>;
>  			next-level-cache = <&L2_1>;
>  			L1_I_101: l1-icache {
> @@ -176,6 +182,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x102>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD>;
>  			efficiency = <1536>;
>  			next-level-cache = <&L2_1>;
>  			L1_I_102: l1-icache {
> @@ -191,6 +198,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x103>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD>;
>  			efficiency = <1536>;
>  			next-level-cache = <&L2_1>;
>  			L1_I_103: l1-icache {
> @@ -238,6 +246,30 @@
>  				};
>  			};
>  		};
> +
> +		idle-states {
> +			entry-method="psci";
> +
> +			LITTLE_CPU_PD: little-power-down {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "little-power-down";
> +				arm,psci-suspend-param = <0x00000002>;
> +				entry-latency-us = <43>;
> +				exit-latency-us = <43>;

Little cores have higher latency (+5%) than big cores?

> +				min-residency-us = <200>;
> +				local-timer-stop;
> +			};
> +
> +			BIG_CPU_PD: big-power-down {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "big-power-down";
> +				arm,psci-suspend-param = <0x00000002>;
> +				entry-latency-us = <41>;
> +				exit-latency-us = <41>;
> +				min-residency-us = <200>;
> +				local-timer-stop;
> +			};
> +		};

What is the simplest way to test this patch?

Regards.
