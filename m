Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 567D729736
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2019 13:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390699AbfEXLdL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 May 2019 07:33:11 -0400
Received: from ns.iliad.fr ([212.27.33.1]:55942 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390654AbfEXLdL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 May 2019 07:33:11 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 709D0213CE;
        Fri, 24 May 2019 13:33:09 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 57DA11FF12;
        Fri, 24 May 2019 13:33:09 +0200 (CEST)
Subject: Re: [PATCH v3] arm64: dts: qcom: msm8998: Add PSCI cpuidle low power
 states
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Andy Gross <agross@kernel.org>
References: <346cd9f0-583d-f467-83d0-e73768bf5aac@free.fr>
 <20190523214619.GB25133@centauri>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <a40b368e-9ec1-5d3c-8d91-b87e8a15f269@free.fr>
Date:   Fri, 24 May 2019 13:33:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523214619.GB25133@centauri>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri May 24 13:33:09 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/05/2019 23:46, Niklas Cassel wrote:

> On Thu, May 23, 2019 at 10:36:51AM +0200, Marc Gonzalez wrote:
>
>> From: Amit Kucheria <amit.kucheria@linaro.org>
>>
>> Add device bindings for cpuidle states for cpu devices.
>>
>> [marc: rebase and fix arm,psci-suspend-param for power-collapse]
>> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>> ---
>> Bjorn, this is an updated/fixed (as documented above) version of
>> [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states
>> ---
>>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 50 +++++++++++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index 412195b9794c..224f84e39204 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -78,6 +78,7 @@
>>  			compatible = "arm,armv8";
>>  			reg = <0x0 0x0>;
>>  			enable-method = "psci";
>> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>>  			next-level-cache = <&L2_0>;
>>  			L2_0: l2-cache {
>>  				compatible = "arm,arch-cache";
>> @@ -96,6 +97,7 @@
>>  			compatible = "arm,armv8";
>>  			reg = <0x0 0x1>;
>>  			enable-method = "psci";
>> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>>  			next-level-cache = <&L2_0>;
>>  			L1_I_1: l1-icache {
>>  				compatible = "arm,arch-cache";
>> @@ -110,6 +112,7 @@
>>  			compatible = "arm,armv8";
>>  			reg = <0x0 0x2>;
>>  			enable-method = "psci";
>> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>>  			next-level-cache = <&L2_0>;
>>  			L1_I_2: l1-icache {
>>  				compatible = "arm,arch-cache";
>> @@ -124,6 +127,7 @@
>>  			compatible = "arm,armv8";
>>  			reg = <0x0 0x3>;
>>  			enable-method = "psci";
>> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>>  			next-level-cache = <&L2_0>;
>>  			L1_I_3: l1-icache {
>>  				compatible = "arm,arch-cache";
>> @@ -138,6 +142,7 @@
>>  			compatible = "arm,armv8";
>>  			reg = <0x0 0x100>;
>>  			enable-method = "psci";
>> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>>  			next-level-cache = <&L2_1>;
>>  			L2_1: l2-cache {
>>  				compatible = "arm,arch-cache";
>> @@ -156,6 +161,7 @@
>>  			compatible = "arm,armv8";
>>  			reg = <0x0 0x101>;
>>  			enable-method = "psci";
>> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>>  			next-level-cache = <&L2_1>;
>>  			L1_I_101: l1-icache {
>>  				compatible = "arm,arch-cache";
>> @@ -170,6 +176,7 @@
>>  			compatible = "arm,armv8";
>>  			reg = <0x0 0x102>;
>>  			enable-method = "psci";
>> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>>  			next-level-cache = <&L2_1>;
>>  			L1_I_102: l1-icache {
>>  				compatible = "arm,arch-cache";
>> @@ -184,6 +191,7 @@
>>  			compatible = "arm,armv8";
>>  			reg = <0x0 0x103>;
>>  			enable-method = "psci";
>> +			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>>  			next-level-cache = <&L2_1>;
>>  			L1_I_103: l1-icache {
>>  				compatible = "arm,arch-cache";
>> @@ -230,6 +238,48 @@
>>  				};
>>  			};
>>  		};
>> +
> 
> Hello Marc, Amit,
> 
> Looking at this line of code in msm-4.14:
> https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/drivers/cpuidle/lpm-levels.c?h=LA.UM.7.1.r1-14000-sm8150.0#n993
> 
> And seeing the equivalent in msm-4.4:
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/cpuidle/lpm-levels.c?h=msm-4.4#n1080
> 
> It becomes obvious that
> 
> qcom,time-overhead == entry-latency-us + exit-latency-us
> and
> qcom,latency-us == exit-latency-us
> 
> which means that
> 
> entry-latency-us == qcom,time-overhead - qcom,latency-us
> 
> 
> Using this formula, with the numbers from downstream SDM845:
> https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/arch/arm64/boot/dts/qcom/sdm845-pm.dtsi?h=msm-4.9#n123
> 
> qcom,latency-us = <621>;
> qcom,time-overhead = <885>;
> 
> 885 - 621 = 264
> 
> we end up with the same values that Raju
> has in his submission for upstream SDM845:
> https://patchwork.kernel.org/patch/10953253/
> 
> entry-latency-us = <264>;
> exit-latency-us = <621>;
> 
>> +		idle-states {
>> +			entry-method = "psci";
>> +
>> +			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "little-retention";
>> +				arm,psci-suspend-param = <0x00000002>;
>> +				entry-latency-us = <43>;
>> +				exit-latency-us = <86>;
> 
> Which for little cluster retention:
> 
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=msm-4.4#n153
> 
> qcom,latency-us = <86>;
> qcom,time-overhead = <167>;
> 
> gives:
> 
> entry-latency-us = <81>;
> exit-latency-us = <86>;
> 
>> +				min-residency-us = <200>;
>> +			};
>> +
>> +			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "little-power-collapse";
>> +				arm,psci-suspend-param = <0x40000003>;
>> +				entry-latency-us = <100>;
>> +				exit-latency-us = <612>;
> 
> Which for little power collapse:
> 
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=msm-4.4#n163
> 
> qcom,latency-us = <612>;
> qcom,time-overhead = <885>;
> 
> gives:
> 
> entry-latency-us = <273>;
> exit-latency-us = <612>;
> 
>> +				min-residency-us = <1000>;
>> +				local-timer-stop;
>> +			};
>> +
>> +			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "big-retention";
>> +				arm,psci-suspend-param = <0x00000002>;
>> +				entry-latency-us = <41>;
>> +				exit-latency-us = <82>;
> 
> Which for big retention:
> 
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=msm-4.4#n246
> 
> qcom,latency-us = <82>;
> qcom,time-overhead = <161>;
> 
> gives:
> 
> entry-latency-us = <79>;
> exit-latency-us = <82>;
> 
>> +				min-residency-us = <200>;
>> +			};
>> +
>> +			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "big-power-collapse";
>> +				arm,psci-suspend-param = <0x40000003>;
>> +				entry-latency-us = <100>;
>> +				exit-latency-us = <525>;
>> +				min-residency-us = <1000>;
> 
> Which for big power collapse:
> 
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=msm-4.4#n256
> 
> qcom,latency-us = <525>;
> qcom,time-overhead = <861>;
> 
> gives:
> 
> entry-latency-us = <336>;
> exit-latency-us = <525>;

Tangential:
I find it somewhat silly to specify the latencies to within a single microsecond.
I assume the margin of error is several microseconds?
How about rounding to the nearest multiple of 5 microseconds?
81 to 80, 86 to 85,
273 to 275, 612 to 610
79 to 80, 82 to 80
336 to 335


To summarize, all the entry-latency-us were underestimated:

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 224f84e39204..ac6bd32c0e7d 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -246,7 +246,7 @@
 				compatible = "arm,idle-state";
 				idle-state-name = "little-retention";
 				arm,psci-suspend-param = <0x00000002>;
-				entry-latency-us = <43>;
+				entry-latency-us = <81>;
 				exit-latency-us = <86>;
 				min-residency-us = <200>;
 			};
@@ -255,7 +255,7 @@
 				compatible = "arm,idle-state";
 				idle-state-name = "little-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
-				entry-latency-us = <100>;
+				entry-latency-us = <273>;
 				exit-latency-us = <612>;
 				min-residency-us = <1000>;
 				local-timer-stop;
@@ -265,7 +265,7 @@
 				compatible = "arm,idle-state";
 				idle-state-name = "big-retention";
 				arm,psci-suspend-param = <0x00000002>;
-				entry-latency-us = <41>;
+				entry-latency-us = <79>;
 				exit-latency-us = <82>;
 				min-residency-us = <200>;
 			};
@@ -274,7 +274,7 @@
 				compatible = "arm,idle-state";
 				idle-state-name = "big-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
-				entry-latency-us = <100>;
+				entry-latency-us = <336>;
 				exit-latency-us = <525>;
 				min-residency-us = <1000>;
 				local-timer-stop;



Regards.
