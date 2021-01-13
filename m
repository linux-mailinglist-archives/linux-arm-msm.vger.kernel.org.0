Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48FC32F4655
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 09:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbhAMIXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 03:23:23 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:35033 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbhAMIXW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 03:23:22 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F16563ED4C;
        Wed, 13 Jan 2021 09:22:36 +0100 (CET)
Subject: Re: [PATCH] arm64: dts: qcom: sdm660: Fix CPU capacities
To:     Danny Lin <danny@kdrag0n.dev>
Cc:     Alexey Minnekhanov <alexey.min@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexey Minekhanov <alexeymin@postmarketos.org>
References: <20210112013127.414277-1-danny@kdrag0n.dev>
 <CANi4RBQCpWiyVLyBcevGcmRr=toPxVF2TrxFmM3vHHnYgaQVHg@mail.gmail.com>
 <c6ecc6c0-3a95-0a4e-6a4d-d753dfaa2748@somainline.org>
 <AJVUMQ.VZV51GZZZD7I2@kdrag0n.dev>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <3398b6af-1a3f-0e1d-eeac-cd4159d2f037@somainline.org>
Date:   Wed, 13 Jan 2021 09:22:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <AJVUMQ.VZV51GZZZD7I2@kdrag0n.dev>
Content-Type: text/plain; charset=iso-8859-5; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 13/01/21 05:37, Danny Lin ha scritto:
> 
> On Tue, Jan 12, 2021 at 8:04 pm, AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@somainline.org> wrote:
>> Il 12/01/21 15:59, Alexey Minnekhanov ha scritto:
>>> Hi!
>>> I always had a feeling something is not right in those cpu
>>> definitions, so cpus with reg 100-103 are little cores, and 0-3 big
>>> ones?
>>> But downstream sdm660.dtsi has a property "efficiency" [1] with values
>>> which are larger for cores 100-103 than for 0-3 cores (1638 > 1024),
>>> I'm confused...
>>
> 
> It appears that in downstream, logical CPUs 0-3 are mapped to the little 
> CPUs (physical IDs 0x100-0x103) and logical CPUs 4-7 are mapped to the 
> big CPUs (physical IDs 0x0-0x3), while mainline has it reversed unlike 
> most other Qualcomm platforms. Thanks for catching the discrepancy, I 
> wasn't aware that the CPU reg values actually mattered before this.
> 
>> All the SDM630, SDM636 and SDM660 smartphones I ever saw are booting 
>> off of the BIG cluster (and that's why cpu@100 is CPU0), and at 0x100 
>> you find the first BIG CPU.
> 
> It looks like the mainline logical CPU map for SDM660 was originally 
> copied from SDM630 and was not updated to match the conventional layout 
> for SDM660. I'm not familiar with SDM630, but on the SDM660 devices I've 
> seen, the boot CPU is CPU 0 on the little cluster (boot log is from 
> downstream but logical CPU numbers are not relevant here) as indicated 
> by the cpuid:
> 
> [††† 0.000000] Boot CPU: AArch64 Processor [51af8014]
> [††† 0.029322] CPU1: Booted secondary processor [51af8014]
> [††† 0.034276] CPU2: Booted secondary processor [51af8014]
> [††† 0.039177] CPU3: Booted secondary processor [51af8014]
> [††† 0.044637] CPU4: Booted secondary processor [51af8002]
> [††† 0.049645] CPU5: Booted secondary processor [51af8002]
> [††† 0.054926] CPU6: Booted secondary processor [51af8002]
> [††† 0.059934] CPU7: Booted secondary processor [51af8002]
> 
> See downstream device trees for SDM630 [1] and SDM660 [2] - the cluster 
> order is different and only SDM630 matches the behavior you describe.
> 
> In either case, it works as long as the capacities are assigned to the 
> correct logical CPUs, so please disregard this patch if the current CPU 
> map is retained.
> 
> [1] 
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/sdm630.dtsi?h=LA.UM.6.2.c27-03100-sdm660.0#n49 
> 
> [2] 
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/sdm660.dtsi?h=LA.UM.6.2.c27-03100-sdm660.0#n49 
> 
> 
Hah! That's a nice catch.
Apparently, the SDM630 configuration is confusing literally too many people.

Your proposed patch is still wrong though, because you're lowering the 
DMIPS/MHz for BIG...
At this point, I can only agree about the CPU ordering being wrong 
upstream: in this case, the fix would be to just move the nodes around 
without changing the DMIPS/MHz values (your 636 vs 640 is something 
within margin of error).

>>
>>>
>>> Property "efficiency" is described in the same tree in [2].
>>>
>>> [1] 
>>> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/sdm660.dtsi?h=LA.UM.7.2.c25#n155 
>>>
>>> [2] 
>>> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/Documentation/devicetree/bindings/arm/cpus.txt?h=LA.UM.7.2.c25#n216 
>>>
>>>
>>> “‚, 12 Ô›“. 2021 ”. “ 13:51, Danny Lin <danny@kdrag0n.dev>:
>>>>
>>>> sdm660 has a big.LITTLE 4+4 CPU setup with CPUs 0-3 being little cores
>>>> and CPUs 4-7 being big cores. The big cores have higher IPC, so they
>>>> should have the higher capacity-dmips-mhz, not the other way around as
>>>> the device tree currently describes it. Fix the incorrect CPU map to
>>>> improve EAS scheduling behavior.
>>>>
>>>> While we're at it, let's replace the old DMIPS/MHz values with new
>>>> measurements that reflect the exact IPC of the CPUs as reported by
>>>> CoreMark.
>>>>
>>>> Performance measurements were made using my freqbench [1]
>>>> benchmark coordinator, which isolates, offlines, and disables the timer
>>>> tick on test CPUs to maximize accuracy. It uses EEMBC CoreMark [2] as
>>>> the workload and measures power usage using the PM660 PMIC's fuel
>>>> gauge.
>>>>
>>>> Normalized DMIPS/MHz capacity scale values for each CPU were calculated
>>>> from CoreMarks/MHz (CoreMark iterations per second per MHz), which
>>>> serves the same purpose. For each CPU, the final capacity-dmips-mhz
>>>> value is the C/MHz value of its maximum frequency normalized to
>>>> SCHED_CAPACITY_SCALE (1024) for the fastest CPU in the system.
>>>>
>>>> A Xiaomi Redmi Note 7 device running a downstream Qualcomm 4.4 kernel
>>>> was used for benchmarking to ensure proper frequency scaling and other
>>>> low-level controls.
>>>>
>> This is wrong, the downstream kernel may be doing "magic" to switch 
>> clusters the other way around, and this is likely... Please, run your 
>> benchmark on a upstream kernel: there may be differences.
>>
>>>> Raw benchmark results can be found in the freqbench repository [3].
>>>> Below is a human-readable summary:
>>>>
>>>> Frequency domains: cpu1 cpu4
>>>> Offline CPUs: cpu1 cpu2 cpu3 cpu4 cpu5 cpu6 cpu7
>>>> Baseline power usage: 1130 mW
>>>>
>>>> ===== CPU 1 =====
>>>> Frequencies: 633 902 1113 1401 1536 1747 1843
>>>>
>>>> † 633:† 2058†††† 3.2 C/MHz†††† 48 mW††† 5.9 J†† 42.6 I/mJ†† 121.5 s
>>>> † 902:† 2930†††† 3.2 C/MHz†††† 72 mW††† 6.2 J†† 40.6 I/mJ††† 85.3 s
>>>> 1113:† 3616†††† 3.2 C/MHz†††† 79 mW††† 5.4 J†† 46.0 I/mJ††† 69.1 s
>>>> 1401:† 4551†††† 3.2 C/MHz††† 125 mW††† 6.9 J†† 36.3 I/mJ††† 54.9 s
>>>> 1536:† 4988†††† 3.2 C/MHz††† 134 mW††† 6.7 J†† 37.1 I/mJ††† 50.1 s
>>>> 1747:† 5674†††† 3.2 C/MHz††† 179 mW††† 7.9 J†† 31.7 I/mJ††† 44.1 s
>>>> 1843:† 5986†††† 3.2 C/MHz††† 228 mW††† 9.5 J†† 26.3 I/mJ††† 41.8 s
>>>>
>>>> ===== CPU 4 =====
>>>> Frequencies: 1113 1401 1747 1958 2150 2208
>>>>
>>>> 1113:† 5825†††† 5.2 C/MHz††† 220 mW††† 9.4 J†† 26.5 I/mJ††† 42.9 s
>>>> 1401:† 7324†††† 5.2 C/MHz††† 317 mW†† 10.8 J†† 23.1 I/mJ††† 34.1 s
>>>> 1747:† 9135†††† 5.2 C/MHz††† 474 mW†† 13.0 J†† 19.2 I/mJ††† 27.4 s
>>>> 1958: 10247†††† 5.2 C/MHz††† 578 mW†† 14.1 J†† 17.7 I/mJ††† 24.4 s
>>>> 2150: 11246†††† 5.2 C/MHz††† 694 mW†† 15.4 J†† 16.2 I/mJ††† 22.2 s
>>>> 2208: 11551†††† 5.2 C/MHz††† 736 mW†† 15.9 J†† 15.7 I/mJ††† 21.7 s
>>>>
>>>> [1] https://github.com/kdrag0n/freqbench
>>>> [2] https://www.eembc.org/coremark/
>>>> [3] 
>>>> https://github.com/kdrag0n/freqbench/tree/master/results/sdm660/main
>>>>
>>>> Signed-off-by: Danny Lin <danny@kdrag0n.dev>
>>>> ---
>>>> † arch/arm64/boot/dts/qcom/sdm660.dtsi | 16 ++++++++--------
>>>> † 1 file changed, 8 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi 
>>>> b/arch/arm64/boot/dts/qcom/sdm660.dtsi
>>>> index 4abbdd03d1e7..ca985c5429db 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
>>>> @@ -40,7 +40,7 @@ CPU0: cpu@100 {
>>>> †††††††††††††††††††††††† compatible = "qcom,kryo260";
>>>> †††††††††††††††††††††††† reg = <0x0 0x100>;
>>>> †††††††††††††††††††††††† enable-method = "psci";
>>>> -†††††††††††††††††††††† capacity-dmips-mhz = <1024>;
>>>> +†††††††††††††††††††††† capacity-dmips-mhz = <636>;
>>>> †††††††††††††††††††††††† next-level-cache = <&L2_1>;
>>>> †††††††††††††††††††††††† L2_1: l2-cache {
>>>> †††††††††††††††††††††††††††††††† compatible = "cache";
>>>> @@ -59,7 +59,7 @@ CPU1: cpu@101 {
>>>> †††††††††††††††††††††††† compatible = "qcom,kryo260";
>>>> †††††††††††††††††††††††† reg = <0x0 0x101>;
>>>> †††††††††††††††††††††††† enable-method = "psci";
>>>> -†††††††††††††††††††††† capacity-dmips-mhz = <1024>;
>>>> +†††††††††††††††††††††† capacity-dmips-mhz = <636>;
>>>> †††††††††††††††††††††††† next-level-cache = <&L2_1>;
>>>> †††††††††††††††††††††††† L1_I_101: l1-icache {
>>>> †††††††††††††††††††††††††††††††† compatible = "cache";
>>>> @@ -74,7 +74,7 @@ CPU2: cpu@102 {
>>>> †††††††††††††††††††††††† compatible = "qcom,kryo260";
>>>> †††††††††††††††††††††††† reg = <0x0 0x102>;
>>>> †††††††††††††††††††††††† enable-method = "psci";
>>>> -†††††††††††††††††††††† capacity-dmips-mhz = <1024>;
>>>> +†††††††††††††††††††††† capacity-dmips-mhz = <636>;
>>>> †††††††††††††††††††††††† next-level-cache = <&L2_1>;
>>>> †††††††††††††††††††††††† L1_I_102: l1-icache {
>>>> †††††††††††††††††††††††††††††††† compatible = "cache";
>>>> @@ -89,7 +89,7 @@ CPU3: cpu@103 {
>>>> †††††††††††††††††††††††† compatible = "qcom,kryo260";
>>>> †††††††††††††††††††††††† reg = <0x0 0x103>;
>>>> †††††††††††††††††††††††† enable-method = "psci";
>>>> -†††††††††††††††††††††† capacity-dmips-mhz = <1024>;
>>>> +†††††††††††††††††††††† capacity-dmips-mhz = <636>;
>>>> †††††††††††††††††††††††† next-level-cache = <&L2_1>;
>>>> †††††††††††††††††††††††† L1_I_103: l1-icache {
>>>> †††††††††††††††††††††††††††††††† compatible = "cache";
>>>> @@ -104,7 +104,7 @@ CPU4: cpu@0 {
>>>> †††††††††††††††††††††††† compatible = "qcom,kryo260";
>>>> †††††††††††††††††††††††† reg = <0x0 0x0>;
>>>> †††††††††††††††††††††††† enable-method = "psci";
>>>> -†††††††††††††††††††††† capacity-dmips-mhz = <640>;
>>>> +†††††††††††††††††††††† capacity-dmips-mhz = <1024>;
>>>> †††††††††††††††††††††††† next-level-cache = <&L2_0>;
>>>> †††††††††††††††††††††††† L2_0: l2-cache {
>>>> †††††††††††††††††††††††††††††††† compatible = "cache";
>>>> @@ -123,7 +123,7 @@ CPU5: cpu@1 {
>>>> †††††††††††††††††††††††† compatible = "qcom,kryo260";
>>>> †††††††††††††††††††††††† reg = <0x0 0x1>;
>>>> †††††††††††††††††††††††† enable-method = "psci";
>>>> -†††††††††††††††††††††† capacity-dmips-mhz = <640>;
>>>> +†††††††††††††††††††††† capacity-dmips-mhz = <1024>;
>>>> †††††††††††††††††††††††† next-level-cache = <&L2_0>;
>>>> †††††††††††††††††††††††† L1_I_1: l1-icache {
>>>> †††††††††††††††††††††††††††††††† compatible = "cache";
>>>> @@ -138,7 +138,7 @@ CPU6: cpu@2 {
>>>> †††††††††††††††††††††††† compatible = "qcom,kryo260";
>>>> †††††††††††††††††††††††† reg = <0x0 0x2>;
>>>> †††††††††††††††††††††††† enable-method = "psci";
>>>> -†††††††††††††††††††††† capacity-dmips-mhz = <640>;
>>>> +†††††††††††††††††††††† capacity-dmips-mhz = <1024>;
>>>> †††††††††††††††††††††††† next-level-cache = <&L2_0>;
>>>> †††††††††††††††††††††††† L1_I_2: l1-icache {
>>>> †††††††††††††††††††††††††††††††† compatible = "cache";
>>>> @@ -153,7 +153,7 @@ CPU7: cpu@3 {
>>>> †††††††††††††††††††††††† compatible = "qcom,kryo260";
>>>> †††††††††††††††††††††††† reg = <0x0 0x3>;
>>>> †††††††††††††††††††††††† enable-method = "psci";
>>>> -†††††††††††††††††††††† capacity-dmips-mhz = <640>;
>>>> +†††††††††††††††††††††† capacity-dmips-mhz = <1024>;
>>>> †††††††††††††††††††††††† next-level-cache = <&L2_0>;
>>>> †††††††††††††††††††††††† L1_I_3: l1-icache {
>>>> †††††††††††††††††††††††††††††††† compatible = "cache";
>>>> -- 
>>>> 2.29.2
>>>>
>>>
>>>
>>
> 
> 

