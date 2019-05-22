Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 781A926641
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 16:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729375AbfEVOs7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 10:48:59 -0400
Received: from ns.iliad.fr ([212.27.33.1]:45830 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729005AbfEVOs7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 10:48:59 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 1C4FE20BCE;
        Wed, 22 May 2019 16:48:57 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id EDFAF20BC5;
        Wed, 22 May 2019 16:48:56 +0200 (CEST)
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Andy Gross <agross@kernel.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
 <a7514c68-d2d3-ce9e-bc4b-f484bb5bf3cf@free.fr>
 <d1ca4d37-ce25-a285-a9ef-dfe831f3d1de@free.fr>
Message-ID: <23a49ebd-5cdb-4e89-029d-51891a51d387@free.fr>
Date:   Wed, 22 May 2019 16:48:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d1ca4d37-ce25-a285-a9ef-dfe831f3d1de@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed May 22 16:48:57 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/05/2019 11:17, Marc Gonzalez wrote:

> Could it be that this FW doesn't support PSCI?

I believe it works now.

Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

As pointed out by Niklas in v1:
	arm,psci-suspend-param needs to be 0x40000003 not 0x3

(If either local-timer-stop is removed, bad things happen.)

Below is the diff with next-20190521.

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 412195b9794c..224f84e39204 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -78,6 +78,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
 				compatible = "arm,arch-cache";
@@ -96,6 +97,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			next-level-cache = <&L2_0>;
 			L1_I_1: l1-icache {
 				compatible = "arm,arch-cache";
@@ -110,6 +112,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			next-level-cache = <&L2_0>;
 			L1_I_2: l1-icache {
 				compatible = "arm,arch-cache";
@@ -124,6 +127,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
 			next-level-cache = <&L2_0>;
 			L1_I_3: l1-icache {
 				compatible = "arm,arch-cache";
@@ -138,6 +142,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
 				compatible = "arm,arch-cache";
@@ -156,6 +161,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			next-level-cache = <&L2_1>;
 			L1_I_101: l1-icache {
 				compatible = "arm,arch-cache";
@@ -170,6 +176,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			next-level-cache = <&L2_1>;
 			L1_I_102: l1-icache {
 				compatible = "arm,arch-cache";
@@ -184,6 +191,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
 			next-level-cache = <&L2_1>;
 			L1_I_103: l1-icache {
 				compatible = "arm,arch-cache";
@@ -230,6 +238,48 @@
 				};
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-retention";
+				arm,psci-suspend-param = <0x00000002>;
+				entry-latency-us = <43>;
+				exit-latency-us = <86>;
+				min-residency-us = <200>;
+			};
+
+			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <100>;
+				exit-latency-us = <612>;
+				min-residency-us = <1000>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-retention";
+				arm,psci-suspend-param = <0x00000002>;
+				entry-latency-us = <41>;
+				exit-latency-us = <82>;
+				min-residency-us = <200>;
+			};
+
+			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <100>;
+				exit-latency-us = <525>;
+				min-residency-us = <1000>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {






# for F in $(find /sys/devices/system/cpu -type f); do echo $F; cat $F; done
/sys/devices/system/cpu/cpuidle/current_governor_ro
menu
/sys/devices/system/cpu/cpuidle/current_driver
arm_idle
/sys/devices/system/cpu/uevent
/sys/devices/system/cpu/cpu7/cpuidle/state1/disable
0
/sys/devices/system/cpu/cpu7/cpuidle/state1/above
1
/sys/devices/system/cpu/cpu7/cpuidle/state1/time
15749
/sys/devices/system/cpu/cpu7/cpuidle/state1/power
0
/sys/devices/system/cpu/cpu7/cpuidle/state1/residency
200
/sys/devices/system/cpu/cpu7/cpuidle/state1/latency
123
/sys/devices/system/cpu/cpu7/cpuidle/state1/usage
19
/sys/devices/system/cpu/cpu7/cpuidle/state1/desc
big-retention
/sys/devices/system/cpu/cpu7/cpuidle/state1/below
6
/sys/devices/system/cpu/cpu7/cpuidle/state1/name
cpu-sleep-1-0
/sys/devices/system/cpu/cpu7/cpuidle/driver/name
arm_idle
/sys/devices/system/cpu/cpu7/cpuidle/state2/disable
0
/sys/devices/system/cpu/cpu7/cpuidle/state2/above
8
/sys/devices/system/cpu/cpu7/cpuidle/state2/time
616012492
/sys/devices/system/cpu/cpu7/cpuidle/state2/power
0
/sys/devices/system/cpu/cpu7/cpuidle/state2/residency
1000
/sys/devices/system/cpu/cpu7/cpuidle/state2/latency
625
/sys/devices/system/cpu/cpu7/cpuidle/state2/usage
120
/sys/devices/system/cpu/cpu7/cpuidle/state2/desc
big-power-collapse
/sys/devices/system/cpu/cpu7/cpuidle/state2/below
0
/sys/devices/system/cpu/cpu7/cpuidle/state2/name
cpu-sleep-1-1
/sys/devices/system/cpu/cpu7/cpuidle/state0/disable
0
/sys/devices/system/cpu/cpu7/cpuidle/state0/above
0
/sys/devices/system/cpu/cpu7/cpuidle/state0/time
29077
/sys/devices/system/cpu/cpu7/cpuidle/state0/power
4294967295
/sys/devices/system/cpu/cpu7/cpuidle/state0/residency
1
/sys/devices/system/cpu/cpu7/cpuidle/state0/latency
1
/sys/devices/system/cpu/cpu7/cpuidle/state0/usage
11
/sys/devices/system/cpu/cpu7/cpuidle/state0/desc
ARM WFI
/sys/devices/system/cpu/cpu7/cpuidle/state0/below
8
/sys/devices/system/cpu/cpu7/cpuidle/state0/name
WFI
/sys/devices/system/cpu/cpu7/uevent
OF_NAME=cpu
OF_FULLNAME=/cpus/cpu@103
OF_TYPE=cpu
OF_COMPATIBLE_0=arm,armv8
OF_COMPATIBLE_N=1
MODALIAS=cpu:type:aarch64:feature:,0000,0001,0002,0003,0004,0005,0006,0007,000B

/sys/devices/system/cpu/cpu7/power/runtime_active_time
0
/sys/devices/system/cpu/cpu7/power/pm_qos_resume_latency_us
0
/sys/devices/system/cpu/cpu7/power/runtime_status
unsupported
/sys/devices/system/cpu/cpu7/power/autosuspend_delay_ms
cat: read error: Input/output error
/sys/devices/system/cpu/cpu7/power/runtime_suspended_time
0
/sys/devices/system/cpu/cpu7/power/control
auto
/sys/devices/system/cpu/cpu7/topology/physical_package_id
1
/sys/devices/system/cpu/cpu7/topology/core_siblings
f0
/sys/devices/system/cpu/cpu7/topology/core_siblings_list
4-7
/sys/devices/system/cpu/cpu7/topology/thread_siblings_list
7
/sys/devices/system/cpu/cpu7/topology/core_id
3
/sys/devices/system/cpu/cpu7/topology/thread_siblings
80
/sys/devices/system/cpu/cpu7/cpu_capacity
1024
/sys/devices/system/cpu/cpu7/cache/uevent
/sys/devices/system/cpu/cpu7/cache/index2/uevent
/sys/devices/system/cpu/cpu7/cache/index2/shared_cpu_list
4-7
/sys/devices/system/cpu/cpu7/cache/index2/type
Unified
/sys/devices/system/cpu/cpu7/cache/index2/level
2
/sys/devices/system/cpu/cpu7/cache/index2/shared_cpu_map
f0
/sys/devices/system/cpu/cpu7/cache/index0/uevent
/sys/devices/system/cpu/cpu7/cache/index0/shared_cpu_list
7
/sys/devices/system/cpu/cpu7/cache/index0/type
Data
/sys/devices/system/cpu/cpu7/cache/index0/level
1
/sys/devices/system/cpu/cpu7/cache/index0/shared_cpu_map
80
/sys/devices/system/cpu/cpu7/cache/index1/uevent
/sys/devices/system/cpu/cpu7/cache/index1/shared_cpu_list
7
/sys/devices/system/cpu/cpu7/cache/index1/type
Instruction
/sys/devices/system/cpu/cpu7/cache/index1/level
1
/sys/devices/system/cpu/cpu7/cache/index1/shared_cpu_map
80
/sys/devices/system/cpu/cpu7/regs/identification/revidr_el1
0x0000000000000001
/sys/devices/system/cpu/cpu7/regs/identification/midr_el1
0x0000000051af8001
/sys/devices/system/cpu/cpu5/cpuidle/state1/disable
0
/sys/devices/system/cpu/cpu5/cpuidle/state1/above
0
/sys/devices/system/cpu/cpu5/cpuidle/state1/time
19922
/sys/devices/system/cpu/cpu5/cpuidle/state1/power
0
/sys/devices/system/cpu/cpu5/cpuidle/state1/residency
200
/sys/devices/system/cpu/cpu5/cpuidle/state1/latency
123
/sys/devices/system/cpu/cpu5/cpuidle/state1/usage
28
/sys/devices/system/cpu/cpu5/cpuidle/state1/desc
big-retention
/sys/devices/system/cpu/cpu5/cpuidle/state1/below
5
/sys/devices/system/cpu/cpu5/cpuidle/state1/name
cpu-sleep-1-0
/sys/devices/system/cpu/cpu5/cpuidle/driver/name
arm_idle
/sys/devices/system/cpu/cpu5/cpuidle/state2/disable
0
/sys/devices/system/cpu/cpu5/cpuidle/state2/above
12
/sys/devices/system/cpu/cpu5/cpuidle/state2/time
616088023
/sys/devices/system/cpu/cpu5/cpuidle/state2/power
0
/sys/devices/system/cpu/cpu5/cpuidle/state2/residency
1000
/sys/devices/system/cpu/cpu5/cpuidle/state2/latency
625
/sys/devices/system/cpu/cpu5/cpuidle/state2/usage
248
/sys/devices/system/cpu/cpu5/cpuidle/state2/desc
big-power-collapse
/sys/devices/system/cpu/cpu5/cpuidle/state2/below
0
/sys/devices/system/cpu/cpu5/cpuidle/state2/name
cpu-sleep-1-1
/sys/devices/system/cpu/cpu5/cpuidle/state0/disable
0
/sys/devices/system/cpu/cpu5/cpuidle/state0/above
0
/sys/devices/system/cpu/cpu5/cpuidle/state0/time
30023
/sys/devices/system/cpu/cpu5/cpuidle/state0/power
4294967295
/sys/devices/system/cpu/cpu5/cpuidle/state0/residency
1
/sys/devices/system/cpu/cpu5/cpuidle/state0/latency
1
/sys/devices/system/cpu/cpu5/cpuidle/state0/usage
16
/sys/devices/system/cpu/cpu5/cpuidle/state0/desc
ARM WFI
/sys/devices/system/cpu/cpu5/cpuidle/state0/below
10
/sys/devices/system/cpu/cpu5/cpuidle/state0/name
WFI
/sys/devices/system/cpu/cpu5/uevent
OF_NAME=cpu
OF_FULLNAME=/cpus/cpu@101
OF_TYPE=cpu
OF_COMPATIBLE_0=arm,armv8
OF_COMPATIBLE_N=1
MODALIAS=cpu:type:aarch64:feature:,0000,0001,0002,0003,0004,0005,0006,0007,000B

/sys/devices/system/cpu/cpu5/power/runtime_active_time
0
/sys/devices/system/cpu/cpu5/power/pm_qos_resume_latency_us
0
/sys/devices/system/cpu/cpu5/power/runtime_status
unsupported
/sys/devices/system/cpu/cpu5/power/autosuspend_delay_ms
cat: read error: Input/output error
/sys/devices/system/cpu/cpu5/power/runtime_suspended_time
0
/sys/devices/system/cpu/cpu5/power/control
auto
/sys/devices/system/cpu/cpu5/topology/physical_package_id
1
/sys/devices/system/cpu/cpu5/topology/core_siblings
f0
/sys/devices/system/cpu/cpu5/topology/core_siblings_list
4-7
/sys/devices/system/cpu/cpu5/topology/thread_siblings_list
5
/sys/devices/system/cpu/cpu5/topology/core_id
1
/sys/devices/system/cpu/cpu5/topology/thread_siblings
20
/sys/devices/system/cpu/cpu5/cpu_capacity
1024
/sys/devices/system/cpu/cpu5/cache/uevent
/sys/devices/system/cpu/cpu5/cache/index2/uevent
/sys/devices/system/cpu/cpu5/cache/index2/shared_cpu_list
4-7
/sys/devices/system/cpu/cpu5/cache/index2/type
Unified
/sys/devices/system/cpu/cpu5/cache/index2/level
2
/sys/devices/system/cpu/cpu5/cache/index2/shared_cpu_map
f0
/sys/devices/system/cpu/cpu5/cache/index0/uevent
/sys/devices/system/cpu/cpu5/cache/index0/shared_cpu_list
5
/sys/devices/system/cpu/cpu5/cache/index0/type
Data
/sys/devices/system/cpu/cpu5/cache/index0/level
1
/sys/devices/system/cpu/cpu5/cache/index0/shared_cpu_map
20
/sys/devices/system/cpu/cpu5/cache/index1/uevent
/sys/devices/system/cpu/cpu5/cache/index1/shared_cpu_list
5
/sys/devices/system/cpu/cpu5/cache/index1/type
Instruction
/sys/devices/system/cpu/cpu5/cache/index1/level
1
/sys/devices/system/cpu/cpu5/cache/index1/shared_cpu_map
20
/sys/devices/system/cpu/cpu5/regs/identification/revidr_el1
0x0000000000000001
/sys/devices/system/cpu/cpu5/regs/identification/midr_el1
0x0000000051af8001
/sys/devices/system/cpu/possible
0-7
/sys/devices/system/cpu/offline

/sys/devices/system/cpu/present
0-7
/sys/devices/system/cpu/power/runtime_active_time
0
/sys/devices/system/cpu/power/runtime_status
unsupported
/sys/devices/system/cpu/power/autosuspend_delay_ms
cat: read error: Input/output error
/sys/devices/system/cpu/power/runtime_suspended_time
0
/sys/devices/system/cpu/power/control
auto
/sys/devices/system/cpu/cpu3/cpuidle/state1/disable
0
/sys/devices/system/cpu/cpu3/cpuidle/state1/above
0
/sys/devices/system/cpu/cpu3/cpuidle/state1/time
7453
/sys/devices/system/cpu/cpu3/cpuidle/state1/power
0
/sys/devices/system/cpu/cpu3/cpuidle/state1/residency
200
/sys/devices/system/cpu/cpu3/cpuidle/state1/latency
129
/sys/devices/system/cpu/cpu3/cpuidle/state1/usage
10
/sys/devices/system/cpu/cpu3/cpuidle/state1/desc
little-retention
/sys/devices/system/cpu/cpu3/cpuidle/state1/below
2
/sys/devices/system/cpu/cpu3/cpuidle/state1/name
cpu-sleep-0-0
/sys/devices/system/cpu/cpu3/cpuidle/driver/name
arm_idle
/sys/devices/system/cpu/cpu3/cpuidle/state2/disable
0
/sys/devices/system/cpu/cpu3/cpuidle/state2/above
8
/sys/devices/system/cpu/cpu3/cpuidle/state2/time
616684999
/sys/devices/system/cpu/cpu3/cpuidle/state2/power
0
/sys/devices/system/cpu/cpu3/cpuidle/state2/residency
1000
/sys/devices/system/cpu/cpu3/cpuidle/state2/latency
712
/sys/devices/system/cpu/cpu3/cpuidle/state2/usage
298
/sys/devices/system/cpu/cpu3/cpuidle/state2/desc
little-power-collapse
/sys/devices/system/cpu/cpu3/cpuidle/state2/below
0
/sys/devices/system/cpu/cpu3/cpuidle/state2/name
cpu-sleep-0-1
/sys/devices/system/cpu/cpu3/cpuidle/state0/disable
0
/sys/devices/system/cpu/cpu3/cpuidle/state0/above
0
/sys/devices/system/cpu/cpu3/cpuidle/state0/time
29256
/sys/devices/system/cpu/cpu3/cpuidle/state0/power
4294967295
/sys/devices/system/cpu/cpu3/cpuidle/state0/residency
1
/sys/devices/system/cpu/cpu3/cpuidle/state0/latency
1
/sys/devices/system/cpu/cpu3/cpuidle/state0/usage
11
/sys/devices/system/cpu/cpu3/cpuidle/state0/desc
ARM WFI
/sys/devices/system/cpu/cpu3/cpuidle/state0/below
8
/sys/devices/system/cpu/cpu3/cpuidle/state0/name
WFI
/sys/devices/system/cpu/cpu3/uevent
OF_NAME=cpu
OF_FULLNAME=/cpus/cpu@3
OF_TYPE=cpu
OF_COMPATIBLE_0=arm,armv8
OF_COMPATIBLE_N=1
MODALIAS=cpu:type:aarch64:feature:,0000,0001,0002,0003,0004,0005,0006,0007,000B

/sys/devices/system/cpu/cpu3/power/runtime_active_time
0
/sys/devices/system/cpu/cpu3/power/pm_qos_resume_latency_us
0
/sys/devices/system/cpu/cpu3/power/runtime_status
unsupported
/sys/devices/system/cpu/cpu3/power/autosuspend_delay_ms
cat: read error: Input/output error
/sys/devices/system/cpu/cpu3/power/runtime_suspended_time
0
/sys/devices/system/cpu/cpu3/power/control
auto
/sys/devices/system/cpu/cpu3/topology/physical_package_id
0
/sys/devices/system/cpu/cpu3/topology/core_siblings
0f
/sys/devices/system/cpu/cpu3/topology/core_siblings_list
0-3
/sys/devices/system/cpu/cpu3/topology/thread_siblings_list
3
/sys/devices/system/cpu/cpu3/topology/core_id
3
/sys/devices/system/cpu/cpu3/topology/thread_siblings
08
/sys/devices/system/cpu/cpu3/cpu_capacity
1024
/sys/devices/system/cpu/cpu3/cache/uevent
/sys/devices/system/cpu/cpu3/cache/index2/uevent
/sys/devices/system/cpu/cpu3/cache/index2/shared_cpu_list
0-3
/sys/devices/system/cpu/cpu3/cache/index2/type
Unified
/sys/devices/system/cpu/cpu3/cache/index2/level
2
/sys/devices/system/cpu/cpu3/cache/index2/shared_cpu_map
0f
/sys/devices/system/cpu/cpu3/cache/index0/uevent
/sys/devices/system/cpu/cpu3/cache/index0/shared_cpu_list
3
/sys/devices/system/cpu/cpu3/cache/index0/type
Data
/sys/devices/system/cpu/cpu3/cache/index0/level
1
/sys/devices/system/cpu/cpu3/cache/index0/shared_cpu_map
08
/sys/devices/system/cpu/cpu3/cache/index1/uevent
/sys/devices/system/cpu/cpu3/cache/index1/shared_cpu_list
3
/sys/devices/system/cpu/cpu3/cache/index1/type
Instruction
/sys/devices/system/cpu/cpu3/cache/index1/level
1
/sys/devices/system/cpu/cpu3/cache/index1/shared_cpu_map
08
/sys/devices/system/cpu/cpu3/regs/identification/revidr_el1
0x0000000000000180
/sys/devices/system/cpu/cpu3/regs/identification/midr_el1
0x0000000051af8014
/sys/devices/system/cpu/online
0-7
/sys/devices/system/cpu/cpu1/cpuidle/state1/disable
0
/sys/devices/system/cpu/cpu1/cpuidle/state1/above
3
/sys/devices/system/cpu/cpu1/cpuidle/state1/time
8494
/sys/devices/system/cpu/cpu1/cpuidle/state1/power
0
/sys/devices/system/cpu/cpu1/cpuidle/state1/residency
200
/sys/devices/system/cpu/cpu1/cpuidle/state1/latency
129
/sys/devices/system/cpu/cpu1/cpuidle/state1/usage
15
/sys/devices/system/cpu/cpu1/cpuidle/state1/desc
little-retention
/sys/devices/system/cpu/cpu1/cpuidle/state1/below
0
/sys/devices/system/cpu/cpu1/cpuidle/state1/name
cpu-sleep-0-0
/sys/devices/system/cpu/cpu1/cpuidle/driver/name
arm_idle
/sys/devices/system/cpu/cpu1/cpuidle/state2/disable
0
/sys/devices/system/cpu/cpu1/cpuidle/state2/above
6
/sys/devices/system/cpu/cpu1/cpuidle/state2/time
617122679
/sys/devices/system/cpu/cpu1/cpuidle/state2/power
0
/sys/devices/system/cpu/cpu1/cpuidle/state2/residency
1000
/sys/devices/system/cpu/cpu1/cpuidle/state2/latency
712
/sys/devices/system/cpu/cpu1/cpuidle/state2/usage
394
/sys/devices/system/cpu/cpu1/cpuidle/state2/desc
little-power-collapse
/sys/devices/system/cpu/cpu1/cpuidle/state2/below
0
/sys/devices/system/cpu/cpu1/cpuidle/state2/name
cpu-sleep-0-1
/sys/devices/system/cpu/cpu1/cpuidle/state0/disable
0
/sys/devices/system/cpu/cpu1/cpuidle/state0/above
0
/sys/devices/system/cpu/cpu1/cpuidle/state0/time
4704
/sys/devices/system/cpu/cpu1/cpuidle/state0/power
4294967295
/sys/devices/system/cpu/cpu1/cpuidle/state0/residency
1
/sys/devices/system/cpu/cpu1/cpuidle/state0/latency
1
/sys/devices/system/cpu/cpu1/cpuidle/state0/usage
8
/sys/devices/system/cpu/cpu1/cpuidle/state0/desc
ARM WFI
/sys/devices/system/cpu/cpu1/cpuidle/state0/below
4
/sys/devices/system/cpu/cpu1/cpuidle/state0/name
WFI
/sys/devices/system/cpu/cpu1/uevent
OF_NAME=cpu
OF_FULLNAME=/cpus/cpu@1
OF_TYPE=cpu
OF_COMPATIBLE_0=arm,armv8
OF_COMPATIBLE_N=1
MODALIAS=cpu:type:aarch64:feature:,0000,0001,0002,0003,0004,0005,0006,0007,000B

/sys/devices/system/cpu/cpu1/power/runtime_active_time
0
/sys/devices/system/cpu/cpu1/power/pm_qos_resume_latency_us
0
/sys/devices/system/cpu/cpu1/power/runtime_status
unsupported
/sys/devices/system/cpu/cpu1/power/autosuspend_delay_ms
cat: read error: Input/output error
/sys/devices/system/cpu/cpu1/power/runtime_suspended_time
0
/sys/devices/system/cpu/cpu1/power/control
auto
/sys/devices/system/cpu/cpu1/topology/physical_package_id
0
/sys/devices/system/cpu/cpu1/topology/core_siblings
0f
/sys/devices/system/cpu/cpu1/topology/core_siblings_list
0-3
/sys/devices/system/cpu/cpu1/topology/thread_siblings_list
1
/sys/devices/system/cpu/cpu1/topology/core_id
1
/sys/devices/system/cpu/cpu1/topology/thread_siblings
02
/sys/devices/system/cpu/cpu1/cpu_capacity
1024
/sys/devices/system/cpu/cpu1/cache/uevent
/sys/devices/system/cpu/cpu1/cache/index2/uevent
/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_list
0-3
/sys/devices/system/cpu/cpu1/cache/index2/type
Unified
/sys/devices/system/cpu/cpu1/cache/index2/level
2
/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_map
0f
/sys/devices/system/cpu/cpu1/cache/index0/uevent
/sys/devices/system/cpu/cpu1/cache/index0/shared_cpu_list
1
/sys/devices/system/cpu/cpu1/cache/index0/type
Data
/sys/devices/system/cpu/cpu1/cache/index0/level
1
/sys/devices/system/cpu/cpu1/cache/index0/shared_cpu_map
02
/sys/devices/system/cpu/cpu1/cache/index1/uevent
/sys/devices/system/cpu/cpu1/cache/index1/shared_cpu_list
1
/sys/devices/system/cpu/cpu1/cache/index1/type
Instruction
/sys/devices/system/cpu/cpu1/cache/index1/level
1
/sys/devices/system/cpu/cpu1/cache/index1/shared_cpu_map
02
/sys/devices/system/cpu/cpu1/regs/identification/revidr_el1
0x0000000000000180
/sys/devices/system/cpu/cpu1/regs/identification/midr_el1
0x0000000051af8014
/sys/devices/system/cpu/vulnerabilities/spectre_v2
Vulnerable
/sys/devices/system/cpu/vulnerabilities/mds
Not affected
/sys/devices/system/cpu/vulnerabilities/l1tf
Not affected
/sys/devices/system/cpu/vulnerabilities/spec_store_bypass
Vulnerable
/sys/devices/system/cpu/vulnerabilities/spectre_v1
Mitigation: __user pointer sanitization
/sys/devices/system/cpu/vulnerabilities/meltdown
Mitigation: PTI
/sys/devices/system/cpu/cpu6/cpuidle/state1/disable
0
/sys/devices/system/cpu/cpu6/cpuidle/state1/above
0
/sys/devices/system/cpu/cpu6/cpuidle/state1/time
7186
/sys/devices/system/cpu/cpu6/cpuidle/state1/power
0
/sys/devices/system/cpu/cpu6/cpuidle/state1/residency
200
/sys/devices/system/cpu/cpu6/cpuidle/state1/latency
123
/sys/devices/system/cpu/cpu6/cpuidle/state1/usage
9
/sys/devices/system/cpu/cpu6/cpuidle/state1/desc
big-retention
/sys/devices/system/cpu/cpu6/cpuidle/state1/below
2
/sys/devices/system/cpu/cpu6/cpuidle/state1/name
cpu-sleep-1-0
/sys/devices/system/cpu/cpu6/cpuidle/driver/name
arm_idle
/sys/devices/system/cpu/cpu6/cpuidle/state2/disable
0
/sys/devices/system/cpu/cpu6/cpuidle/state2/above
4
/sys/devices/system/cpu/cpu6/cpuidle/state2/time
617440536
/sys/devices/system/cpu/cpu6/cpuidle/state2/power
0
/sys/devices/system/cpu/cpu6/cpuidle/state2/residency
1000
/sys/devices/system/cpu/cpu6/cpuidle/state2/latency
625
/sys/devices/system/cpu/cpu6/cpuidle/state2/usage
385
/sys/devices/system/cpu/cpu6/cpuidle/state2/desc
big-power-collapse
/sys/devices/system/cpu/cpu6/cpuidle/state2/below
0
/sys/devices/system/cpu/cpu6/cpuidle/state2/name
cpu-sleep-1-1
/sys/devices/system/cpu/cpu6/cpuidle/state0/disable
0
/sys/devices/system/cpu/cpu6/cpuidle/state0/above
0
/sys/devices/system/cpu/cpu6/cpuidle/state0/time
28990
/sys/devices/system/cpu/cpu6/cpuidle/state0/power
4294967295
/sys/devices/system/cpu/cpu6/cpuidle/state0/residency
1
/sys/devices/system/cpu/cpu6/cpuidle/state0/latency
1
/sys/devices/system/cpu/cpu6/cpuidle/state0/usage
10
/sys/devices/system/cpu/cpu6/cpuidle/state0/desc
ARM WFI
/sys/devices/system/cpu/cpu6/cpuidle/state0/below
8
/sys/devices/system/cpu/cpu6/cpuidle/state0/name
WFI
/sys/devices/system/cpu/cpu6/uevent
OF_NAME=cpu
OF_FULLNAME=/cpus/cpu@102
OF_TYPE=cpu
OF_COMPATIBLE_0=arm,armv8
OF_COMPATIBLE_N=1
MODALIAS=cpu:type:aarch64:feature:,0000,0001,0002,0003,0004,0005,0006,0007,000B

/sys/devices/system/cpu/cpu6/power/runtime_active_time
0
/sys/devices/system/cpu/cpu6/power/pm_qos_resume_latency_us
0
/sys/devices/system/cpu/cpu6/power/runtime_status
unsupported
/sys/devices/system/cpu/cpu6/power/autosuspend_delay_ms
cat: read error: Input/output error
/sys/devices/system/cpu/cpu6/power/runtime_suspended_time
0
/sys/devices/system/cpu/cpu6/power/control
auto
/sys/devices/system/cpu/cpu6/topology/physical_package_id
1
/sys/devices/system/cpu/cpu6/topology/core_siblings
f0
/sys/devices/system/cpu/cpu6/topology/core_siblings_list
4-7
/sys/devices/system/cpu/cpu6/topology/thread_siblings_list
6
/sys/devices/system/cpu/cpu6/topology/core_id
2
/sys/devices/system/cpu/cpu6/topology/thread_siblings
40
/sys/devices/system/cpu/cpu6/cpu_capacity
1024
/sys/devices/system/cpu/cpu6/cache/uevent
/sys/devices/system/cpu/cpu6/cache/index2/uevent
/sys/devices/system/cpu/cpu6/cache/index2/shared_cpu_list
4-7
/sys/devices/system/cpu/cpu6/cache/index2/type
Unified
/sys/devices/system/cpu/cpu6/cache/index2/level
2
/sys/devices/system/cpu/cpu6/cache/index2/shared_cpu_map
f0
/sys/devices/system/cpu/cpu6/cache/index0/uevent
/sys/devices/system/cpu/cpu6/cache/index0/shared_cpu_list
6
/sys/devices/system/cpu/cpu6/cache/index0/type
Data
/sys/devices/system/cpu/cpu6/cache/index0/level
1
/sys/devices/system/cpu/cpu6/cache/index0/shared_cpu_map
40
/sys/devices/system/cpu/cpu6/cache/index1/uevent
/sys/devices/system/cpu/cpu6/cache/index1/shared_cpu_list
6
/sys/devices/system/cpu/cpu6/cache/index1/type
Instruction
/sys/devices/system/cpu/cpu6/cache/index1/level
1
/sys/devices/system/cpu/cpu6/cache/index1/shared_cpu_map
40
/sys/devices/system/cpu/cpu6/regs/identification/revidr_el1
0x0000000000000001
/sys/devices/system/cpu/cpu6/regs/identification/midr_el1
0x0000000051af8001
/sys/devices/system/cpu/cpu4/cpuidle/state1/disable
0
/sys/devices/system/cpu/cpu4/cpuidle/state1/above
4
/sys/devices/system/cpu/cpu4/cpuidle/state1/time
48576
/sys/devices/system/cpu/cpu4/cpuidle/state1/power
0
/sys/devices/system/cpu/cpu4/cpuidle/state1/residency
200
/sys/devices/system/cpu/cpu4/cpuidle/state1/latency
123
/sys/devices/system/cpu/cpu4/cpuidle/state1/usage
58
/sys/devices/system/cpu/cpu4/cpuidle/state1/desc
big-retention
/sys/devices/system/cpu/cpu4/cpuidle/state1/below
15
/sys/devices/system/cpu/cpu4/cpuidle/state1/name
cpu-sleep-1-0
/sys/devices/system/cpu/cpu4/cpuidle/driver/name
arm_idle
/sys/devices/system/cpu/cpu4/cpuidle/state2/disable
0
/sys/devices/system/cpu/cpu4/cpuidle/state2/above
19
/sys/devices/system/cpu/cpu4/cpuidle/state2/time
617566283
/sys/devices/system/cpu/cpu4/cpuidle/state2/power
0
/sys/devices/system/cpu/cpu4/cpuidle/state2/residency
1000
/sys/devices/system/cpu/cpu4/cpuidle/state2/latency
625
/sys/devices/system/cpu/cpu4/cpuidle/state2/usage
515
/sys/devices/system/cpu/cpu4/cpuidle/state2/desc
big-power-collapse
/sys/devices/system/cpu/cpu4/cpuidle/state2/below
0
/sys/devices/system/cpu/cpu4/cpuidle/state2/name
cpu-sleep-1-1
/sys/devices/system/cpu/cpu4/cpuidle/state0/disable
0
/sys/devices/system/cpu/cpu4/cpuidle/state0/above
0
/sys/devices/system/cpu/cpu4/cpuidle/state0/time
33524
/sys/devices/system/cpu/cpu4/cpuidle/state0/power
4294967295
/sys/devices/system/cpu/cpu4/cpuidle/state0/residency
1
/sys/devices/system/cpu/cpu4/cpuidle/state0/latency
1
/sys/devices/system/cpu/cpu4/cpuidle/state0/usage
19
/sys/devices/system/cpu/cpu4/cpuidle/state0/desc
ARM WFI
/sys/devices/system/cpu/cpu4/cpuidle/state0/below
9
/sys/devices/system/cpu/cpu4/cpuidle/state0/name
WFI
/sys/devices/system/cpu/cpu4/uevent
OF_NAME=cpu
OF_FULLNAME=/cpus/cpu@100
OF_TYPE=cpu
OF_COMPATIBLE_0=arm,armv8
OF_COMPATIBLE_N=1
MODALIAS=cpu:type:aarch64:feature:,0000,0001,0002,0003,0004,0005,0006,0007,000B

/sys/devices/system/cpu/cpu4/power/runtime_active_time
0
/sys/devices/system/cpu/cpu4/power/pm_qos_resume_latency_us
0
/sys/devices/system/cpu/cpu4/power/runtime_status
unsupported
/sys/devices/system/cpu/cpu4/power/autosuspend_delay_ms
cat: read error: Input/output error
/sys/devices/system/cpu/cpu4/power/runtime_suspended_time
0
/sys/devices/system/cpu/cpu4/power/control
auto
/sys/devices/system/cpu/cpu4/topology/physical_package_id
1
/sys/devices/system/cpu/cpu4/topology/core_siblings
f0
/sys/devices/system/cpu/cpu4/topology/core_siblings_list
4-7
/sys/devices/system/cpu/cpu4/topology/thread_siblings_list
4
/sys/devices/system/cpu/cpu4/topology/core_id
0
/sys/devices/system/cpu/cpu4/topology/thread_siblings
10
/sys/devices/system/cpu/cpu4/cpu_capacity
1024
/sys/devices/system/cpu/cpu4/cache/uevent
/sys/devices/system/cpu/cpu4/cache/index2/uevent
/sys/devices/system/cpu/cpu4/cache/index2/shared_cpu_list
4-7
/sys/devices/system/cpu/cpu4/cache/index2/type
Unified
/sys/devices/system/cpu/cpu4/cache/index2/level
2
/sys/devices/system/cpu/cpu4/cache/index2/shared_cpu_map
f0
/sys/devices/system/cpu/cpu4/cache/index0/uevent
/sys/devices/system/cpu/cpu4/cache/index0/shared_cpu_list
4
/sys/devices/system/cpu/cpu4/cache/index0/type
Data
/sys/devices/system/cpu/cpu4/cache/index0/level
1
/sys/devices/system/cpu/cpu4/cache/index0/shared_cpu_map
10
/sys/devices/system/cpu/cpu4/cache/index1/uevent
/sys/devices/system/cpu/cpu4/cache/index1/shared_cpu_list
4
/sys/devices/system/cpu/cpu4/cache/index1/type
Instruction
/sys/devices/system/cpu/cpu4/cache/index1/level
1
/sys/devices/system/cpu/cpu4/cache/index1/shared_cpu_map
10
/sys/devices/system/cpu/cpu4/regs/identification/revidr_el1
0x0000000000000001
/sys/devices/system/cpu/cpu4/regs/identification/midr_el1
0x0000000051af8001
/sys/devices/system/cpu/isolated

/sys/devices/system/cpu/kernel_max
255
/sys/devices/system/cpu/cpu2/cpuidle/state1/disable
0
/sys/devices/system/cpu/cpu2/cpuidle/state1/above
27
/sys/devices/system/cpu/cpu2/cpuidle/state1/time
80485
/sys/devices/system/cpu/cpu2/cpuidle/state1/power
0
/sys/devices/system/cpu/cpu2/cpuidle/state1/residency
200
/sys/devices/system/cpu/cpu2/cpuidle/state1/latency
129
/sys/devices/system/cpu/cpu2/cpuidle/state1/usage
142
/sys/devices/system/cpu/cpu2/cpuidle/state1/desc
little-retention
/sys/devices/system/cpu/cpu2/cpuidle/state1/below
6
/sys/devices/system/cpu/cpu2/cpuidle/state1/name
cpu-sleep-0-0
/sys/devices/system/cpu/cpu2/cpuidle/driver/name
arm_idle
/sys/devices/system/cpu/cpu2/cpuidle/state2/disable
0
/sys/devices/system/cpu/cpu2/cpuidle/state2/above
14
/sys/devices/system/cpu/cpu2/cpuidle/state2/time
617916929
/sys/devices/system/cpu/cpu2/cpuidle/state2/power
0
/sys/devices/system/cpu/cpu2/cpuidle/state2/residency
1000
/sys/devices/system/cpu/cpu2/cpuidle/state2/latency
712
/sys/devices/system/cpu/cpu2/cpuidle/state2/usage
614
/sys/devices/system/cpu/cpu2/cpuidle/state2/desc
little-power-collapse
/sys/devices/system/cpu/cpu2/cpuidle/state2/below
0
/sys/devices/system/cpu/cpu2/cpuidle/state2/name
cpu-sleep-0-1
/sys/devices/system/cpu/cpu2/cpuidle/state0/disable
0
/sys/devices/system/cpu/cpu2/cpuidle/state0/above
0
/sys/devices/system/cpu/cpu2/cpuidle/state0/time
36601
/sys/devices/system/cpu/cpu2/cpuidle/state0/power
4294967295
/sys/devices/system/cpu/cpu2/cpuidle/state0/residency
1
/sys/devices/system/cpu/cpu2/cpuidle/state0/latency
1
/sys/devices/system/cpu/cpu2/cpuidle/state0/usage
49
/sys/devices/system/cpu/cpu2/cpuidle/state0/desc
ARM WFI
/sys/devices/system/cpu/cpu2/cpuidle/state0/below
20
/sys/devices/system/cpu/cpu2/cpuidle/state0/name
WFI
/sys/devices/system/cpu/cpu2/uevent
OF_NAME=cpu
OF_FULLNAME=/cpus/cpu@2
OF_TYPE=cpu
OF_COMPATIBLE_0=arm,armv8
OF_COMPATIBLE_N=1
MODALIAS=cpu:type:aarch64:feature:,0000,0001,0002,0003,0004,0005,0006,0007,000B

/sys/devices/system/cpu/cpu2/power/runtime_active_time
0
/sys/devices/system/cpu/cpu2/power/pm_qos_resume_latency_us
0
/sys/devices/system/cpu/cpu2/power/runtime_status
unsupported
/sys/devices/system/cpu/cpu2/power/autosuspend_delay_ms
cat: read error: Input/output error
/sys/devices/system/cpu/cpu2/power/runtime_suspended_time
0
/sys/devices/system/cpu/cpu2/power/control
auto
/sys/devices/system/cpu/cpu2/topology/physical_package_id
0
/sys/devices/system/cpu/cpu2/topology/core_siblings
0f
/sys/devices/system/cpu/cpu2/topology/core_siblings_list
0-3
/sys/devices/system/cpu/cpu2/topology/thread_siblings_list
2
/sys/devices/system/cpu/cpu2/topology/core_id
2
/sys/devices/system/cpu/cpu2/topology/thread_siblings
04
/sys/devices/system/cpu/cpu2/cpu_capacity
1024
/sys/devices/system/cpu/cpu2/cache/uevent
/sys/devices/system/cpu/cpu2/cache/index2/uevent
/sys/devices/system/cpu/cpu2/cache/index2/shared_cpu_list
0-3
/sys/devices/system/cpu/cpu2/cache/index2/type
Unified
/sys/devices/system/cpu/cpu2/cache/index2/level
2
/sys/devices/system/cpu/cpu2/cache/index2/shared_cpu_map
0f
/sys/devices/system/cpu/cpu2/cache/index0/uevent
/sys/devices/system/cpu/cpu2/cache/index0/shared_cpu_list
2
/sys/devices/system/cpu/cpu2/cache/index0/type
Data
/sys/devices/system/cpu/cpu2/cache/index0/level
1
/sys/devices/system/cpu/cpu2/cache/index0/shared_cpu_map
04
/sys/devices/system/cpu/cpu2/cache/index1/uevent
/sys/devices/system/cpu/cpu2/cache/index1/shared_cpu_list
2
/sys/devices/system/cpu/cpu2/cache/index1/type
Instruction
/sys/devices/system/cpu/cpu2/cache/index1/level
1
/sys/devices/system/cpu/cpu2/cache/index1/shared_cpu_map
04
/sys/devices/system/cpu/cpu2/regs/identification/revidr_el1
0x0000000000000180
/sys/devices/system/cpu/cpu2/regs/identification/midr_el1
0x0000000051af8014
/sys/devices/system/cpu/cpu0/cpuidle/state1/disable
0
/sys/devices/system/cpu/cpu0/cpuidle/state1/above
42
/sys/devices/system/cpu/cpu0/cpuidle/state1/time
363386
/sys/devices/system/cpu/cpu0/cpuidle/state1/power
0
/sys/devices/system/cpu/cpu0/cpuidle/state1/residency
200
/sys/devices/system/cpu/cpu0/cpuidle/state1/latency
129
/sys/devices/system/cpu/cpu0/cpuidle/state1/usage
416
/sys/devices/system/cpu/cpu0/cpuidle/state1/desc
little-retention
/sys/devices/system/cpu/cpu0/cpuidle/state1/below
117
/sys/devices/system/cpu/cpu0/cpuidle/state1/name
cpu-sleep-0-0
/sys/devices/system/cpu/cpu0/cpuidle/driver/name
arm_idle
/sys/devices/system/cpu/cpu0/cpuidle/state2/disable
0
/sys/devices/system/cpu/cpu0/cpuidle/state2/above
189
/sys/devices/system/cpu/cpu0/cpuidle/state2/time
616567065
/sys/devices/system/cpu/cpu0/cpuidle/state2/power
0
/sys/devices/system/cpu/cpu0/cpuidle/state2/residency
1000
/sys/devices/system/cpu/cpu0/cpuidle/state2/latency
712
/sys/devices/system/cpu/cpu0/cpuidle/state2/usage
1661
/sys/devices/system/cpu/cpu0/cpuidle/state2/desc
little-power-collapse
/sys/devices/system/cpu/cpu0/cpuidle/state2/below
0
/sys/devices/system/cpu/cpu0/cpuidle/state2/name
cpu-sleep-0-1
/sys/devices/system/cpu/cpu0/cpuidle/state0/disable
0
/sys/devices/system/cpu/cpu0/cpuidle/state0/above
0
/sys/devices/system/cpu/cpu0/cpuidle/state0/time
7123
/sys/devices/system/cpu/cpu0/cpuidle/state0/power
4294967295
/sys/devices/system/cpu/cpu0/cpuidle/state0/residency
1
/sys/devices/system/cpu/cpu0/cpuidle/state0/latency
1
/sys/devices/system/cpu/cpu0/cpuidle/state0/usage
53
/sys/devices/system/cpu/cpu0/cpuidle/state0/desc
ARM WFI
/sys/devices/system/cpu/cpu0/cpuidle/state0/below
14
/sys/devices/system/cpu/cpu0/cpuidle/state0/name
WFI
/sys/devices/system/cpu/cpu0/uevent
OF_NAME=cpu
OF_FULLNAME=/cpus/cpu@0
OF_TYPE=cpu
OF_COMPATIBLE_0=arm,armv8
OF_COMPATIBLE_N=1
MODALIAS=cpu:type:aarch64:feature:,0000,0001,0002,0003,0004,0005,0006,0007,000B

/sys/devices/system/cpu/cpu0/power/runtime_active_time
0
/sys/devices/system/cpu/cpu0/power/pm_qos_resume_latency_us
0
/sys/devices/system/cpu/cpu0/power/runtime_status
unsupported
/sys/devices/system/cpu/cpu0/power/autosuspend_delay_ms
cat: read error: Input/output error
/sys/devices/system/cpu/cpu0/power/runtime_suspended_time
0
/sys/devices/system/cpu/cpu0/power/control
auto
/sys/devices/system/cpu/cpu0/topology/physical_package_id
0
/sys/devices/system/cpu/cpu0/topology/core_siblings
0f
/sys/devices/system/cpu/cpu0/topology/core_siblings_list
0-3
/sys/devices/system/cpu/cpu0/topology/thread_siblings_list
0
/sys/devices/system/cpu/cpu0/topology/core_id
0
/sys/devices/system/cpu/cpu0/topology/thread_siblings
01
/sys/devices/system/cpu/cpu0/cpu_capacity
1024
/sys/devices/system/cpu/cpu0/cache/uevent
/sys/devices/system/cpu/cpu0/cache/index2/uevent
/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_list
0-3
/sys/devices/system/cpu/cpu0/cache/index2/type
Unified
/sys/devices/system/cpu/cpu0/cache/index2/level
2
/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_map
0f
/sys/devices/system/cpu/cpu0/cache/index0/uevent
/sys/devices/system/cpu/cpu0/cache/index0/shared_cpu_list
0
/sys/devices/system/cpu/cpu0/cache/index0/type
Data
/sys/devices/system/cpu/cpu0/cache/index0/level
1
/sys/devices/system/cpu/cpu0/cache/index0/shared_cpu_map
01
/sys/devices/system/cpu/cpu0/cache/index1/uevent
/sys/devices/system/cpu/cpu0/cache/index1/shared_cpu_list
0
/sys/devices/system/cpu/cpu0/cache/index1/type
Instruction
/sys/devices/system/cpu/cpu0/cache/index1/level
1
/sys/devices/system/cpu/cpu0/cache/index1/shared_cpu_map
01
/sys/devices/system/cpu/cpu0/regs/identification/revidr_el1
0x0000000000000180
/sys/devices/system/cpu/cpu0/regs/identification/midr_el1
0x0000000051af8014
/sys/devices/system/cpu/modalias
cpu:type:aarch64:feature:,0000,0001,0002,0003,0004,0005,0006,0007,000B

