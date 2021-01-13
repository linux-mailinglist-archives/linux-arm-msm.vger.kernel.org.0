Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE742F4345
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 05:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbhAMEjF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 23:39:05 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34303 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725372AbhAMEi7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 23:38:59 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 3BF4A19E3;
        Tue, 12 Jan 2021 23:38:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 12 Jan 2021 23:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        date:from:subject:to:cc:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        i9/staYSBFGZwUeddOPpV/++fgURKB/7UUSC8iM5JZ4=; b=BwWKJ4n4Z9DL1Xmy
        Z4uLlBvcWqMwCvnTXyFGJB0ZgnLQSsnHXmLGdlksod/m7gb0CPqZxUZTEGI6GHkV
        5eJpcjbPqqR9dlVWoCfmiK+scv1+GZ9loE2BUgzB1kb7d4jNKyc8q5+0ug7AunI9
        v+RcgAlpgYysStQI94REztF5RHuB1uVFq3HPyVlslIxUn3Ag1Gthm+pVW72ZhkAd
        eSz8z6LtvB5spMadamaIDK6OjNgwAvQoptBeuofYVqgUregjO1nvYDjQMbuLUrhJ
        mc915EwUQIxKUptLqajOTHIahDQqadgSufRVVoZBlZm5obTtuaHjaqCFLRwSavod
        mQHbkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=i9/staYSBFGZwUeddOPpV/++fgURKB/7UUSC8iM5J
        Z4=; b=Ui0GuB4f+WZmUmf4evU5jyGlHXmpJL+v7TW6VoKiTlsN0pdojkYulVXVK
        kN+5wWTRtsdQcfRfZBBv9ywYJSbMs2Ng610bQjGxr0W4Fscsh9pO+qgao7/NSMwY
        9WX61TzjPtkVM1CbxCG74bTJ77WXYm+Nlrb9yl2HeUokph/1wuSJCEUvt+5JLCZG
        iFnme3bXmynn2wjh20AavQnp4Te1xYtTCuFuRjUgQhoQgiwMn4c2wBSeppXtvHCi
        YTBLETm1VFJxV+tCxPkm2Vy4G5NZQfsRCdSpk8QzS/jh+LC7BTLtcoogORzIk7M+
        6EJu3jSNyGE2kQNownqt8AGKYA+zQ==
X-ME-Sender: <xms:L3n-Xy8r2cBq6VqbVGBA-WZFVOqpMZOe5QxtqlrPlw-oXHVWi-dOjw>
    <xme:L3n-Xyu5jRJL8cFV4NK-N88o-EMq5xWnG4gtMxcnIpGez3KTRMG3GfCYSFfdxziBx
    VKw--Yt8YlBOrI2leg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdejhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffuvffkjghfofggtgfgsehtqhertdertdhinecuhfhrohhmpeffrghnnhih
    ucfnihhnuceouggrnhhnhieskhgurhgrghdtnhdruggvvheqnecuggftrfgrthhtvghrnh
    epteeufeetieejhfeikefhledtffekvdelueeludegfefgheeiieffheeltdehfeehnecu
    ffhomhgrihhnpegtohguvggruhhrohhrrgdrohhrghdpghhithhhuhgsrdgtohhmpdgvvg
    hmsggtrdhorhhgnecukfhppedutdegrddvtddtrdduvdelrddvuddvnecuufhprghmkfhp
    pfgvthifohhrkhepuddtgedrvddttddruddvledrvdduvdenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghnnhihsehkughrrghgtdhnrdgu
    vghv
X-ME-Proxy: <xmx:L3n-X4DRuC81AAYBRN9tdYMUkmM-RXCiUmwe3FoWqBvwh9t7QkmlBA>
    <xmx:L3n-X6efzcR489GI8XnhE6Cplq02AWqTKMhoSuEqzNvZY8l-h8QuHg>
    <xmx:L3n-X3PINMUY2Z8ZIHMIiNBG9Yl_3G3ZIcye7_I2Ky1r48ko_KEeow>
    <xmx:L3n-XzC6M4aZjmlnwNHuyPEvuutRs7sDlBOkRi-hGQXHdNJA6sWwEw>
Received: from [10.65.28.38] (unknown [104.200.129.212])
        by mail.messagingengine.com (Postfix) with ESMTPA id F3E411080057;
        Tue, 12 Jan 2021 23:38:04 -0500 (EST)
Date:   Tue, 12 Jan 2021 20:37:58 -0800
From:   Danny Lin <danny@kdrag0n.dev>
Subject: Re: [PATCH] arm64: dts: qcom: sdm660: Fix CPU capacities
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Alexey Minnekhanov <alexey.min@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexey Minekhanov <alexeymin@postmarketos.org>
Message-Id: <AJVUMQ.VZV51GZZZD7I2@kdrag0n.dev>
In-Reply-To: <c6ecc6c0-3a95-0a4e-6a4d-d753dfaa2748@somainline.org>
References: <20210112013127.414277-1-danny@kdrag0n.dev>
        <CANi4RBQCpWiyVLyBcevGcmRr=toPxVF2TrxFmM3vHHnYgaQVHg@mail.gmail.com>
        <c6ecc6c0-3a95-0a4e-6a4d-d753dfaa2748@somainline.org>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-5; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, Jan 12, 2021 at 8:04 pm, AngeloGioacchino Del Regno=20
<angelogioacchino.delregno@somainline.org> wrote:
> Il 12/01/21 15:59, Alexey Minnekhanov ha scritto:
>> Hi!
>> I always had a feeling something is not right in those cpu
>> definitions, so cpus with reg 100-103 are little cores, and 0-3 big
>> ones?
>> But downstream sdm660.dtsi has a property "efficiency" [1] with=20
>> values
>> which are larger for cores 100-103 than for 0-3 cores (1638 > 1024),
>> I'm confused...
>=20

It appears that in downstream, logical CPUs 0-3 are mapped to the=20
little CPUs (physical IDs 0x100-0x103) and logical CPUs 4-7 are mapped=20
to the big CPUs (physical IDs 0x0-0x3), while mainline has it reversed=20
unlike most other Qualcomm platforms. Thanks for catching the=20
discrepancy, I wasn't aware that the CPU reg values actually mattered=20
before this.

> All the SDM630, SDM636 and SDM660 smartphones I ever saw are booting=20
> off of the BIG cluster (and that's why cpu@100 is CPU0), and at 0x100=20
> you find the first BIG CPU.

It looks like the mainline logical CPU map for SDM660 was originally=20
copied from SDM630 and was not updated to match the conventional layout=20
for SDM660. I'm not familiar with SDM630, but on the SDM660 devices=20
I've seen, the boot CPU is CPU 0 on the little cluster (boot log is=20
from downstream but logical CPU numbers are not relevant here) as=20
indicated by the cpuid:

[    0.000000] Boot CPU: AArch64 Processor [51af8014]
[    0.029322] CPU1: Booted secondary processor [51af8014]
[    0.034276] CPU2: Booted secondary processor [51af8014]
[    0.039177] CPU3: Booted secondary processor [51af8014]
[    0.044637] CPU4: Booted secondary processor [51af8002]
[    0.049645] CPU5: Booted secondary processor [51af8002]
[    0.054926] CPU6: Booted secondary processor [51af8002]
[    0.059934] CPU7: Booted secondary processor [51af8002]

See downstream device trees for SDM630 [1] and SDM660 [2] - the cluster=20
order is different and only SDM630 matches the behavior you describe.

In either case, it works as long as the capacities are assigned to the=20
correct logical CPUs, so please disregard this patch if the current CPU=20
map is retained.

[1]=20
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts=
/qcom/sdm630.dtsi?h=3DLA.UM.6.2.c27-03100-sdm660.0#n49
[2]=20
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts=
/qcom/sdm660.dtsi?h=3DLA.UM.6.2.c27-03100-sdm660.0#n49

>=20
>>=20
>> Property "efficiency" is described in the same tree in [2].
>>=20
>> [1]=20
>> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/=
dts/qcom/sdm660.dtsi?h=3DLA.UM.7.2.c25#n155
>> [2]=20
>> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/Documentation/=
devicetree/bindings/arm/cpus.txt?h=3DLA.UM.7.2.c25#n216
>>=20
>> =D2=E2, 12 =EF=DD=D2. 2021 =D3. =D2 13:51, Danny Lin <danny@kdrag0n.dev>=
:
>>>=20
>>> sdm660 has a big.LITTLE 4+4 CPU setup with CPUs 0-3 being little=20
>>> cores
>>> and CPUs 4-7 being big cores. The big cores have higher IPC, so they
>>> should have the higher capacity-dmips-mhz, not the other way around=20
>>> as
>>> the device tree currently describes it. Fix the incorrect CPU map to
>>> improve EAS scheduling behavior.
>>>=20
>>> While we're at it, let's replace the old DMIPS/MHz values with new
>>> measurements that reflect the exact IPC of the CPUs as reported by
>>> CoreMark.
>>>=20
>>> Performance measurements were made using my freqbench [1]
>>> benchmark coordinator, which isolates, offlines, and disables the=20
>>> timer
>>> tick on test CPUs to maximize accuracy. It uses EEMBC CoreMark [2]=20
>>> as
>>> the workload and measures power usage using the PM660 PMIC's fuel
>>> gauge.
>>>=20
>>> Normalized DMIPS/MHz capacity scale values for each CPU were=20
>>> calculated
>>> from CoreMarks/MHz (CoreMark iterations per second per MHz), which
>>> serves the same purpose. For each CPU, the final capacity-dmips-mhz
>>> value is the C/MHz value of its maximum frequency normalized to
>>> SCHED_CAPACITY_SCALE (1024) for the fastest CPU in the system.
>>>=20
>>> A Xiaomi Redmi Note 7 device running a downstream Qualcomm 4.4=20
>>> kernel
>>> was used for benchmarking to ensure proper frequency scaling and=20
>>> other
>>> low-level controls.
>>>=20
> This is wrong, the downstream kernel may be doing "magic" to switch=20
> clusters the other way around, and this is likely... Please, run your=20
> benchmark on a upstream kernel: there may be differences.
>=20
>>> Raw benchmark results can be found in the freqbench repository [3].
>>> Below is a human-readable summary:
>>>=20
>>> Frequency domains: cpu1 cpu4
>>> Offline CPUs: cpu1 cpu2 cpu3 cpu4 cpu5 cpu6 cpu7
>>> Baseline power usage: 1130 mW
>>>=20
>>> =3D=3D=3D=3D=3D CPU 1 =3D=3D=3D=3D=3D
>>> Frequencies: 633 902 1113 1401 1536 1747 1843
>>>=20
>>>   633:  2058     3.2 C/MHz     48 mW    5.9 J   42.6 I/mJ   121.5 s
>>>   902:  2930     3.2 C/MHz     72 mW    6.2 J   40.6 I/mJ    85.3 s
>>> 1113:  3616     3.2 C/MHz     79 mW    5.4 J   46.0 I/mJ    69.1 s
>>> 1401:  4551     3.2 C/MHz    125 mW    6.9 J   36.3 I/mJ    54.9 s
>>> 1536:  4988     3.2 C/MHz    134 mW    6.7 J   37.1 I/mJ    50.1 s
>>> 1747:  5674     3.2 C/MHz    179 mW    7.9 J   31.7 I/mJ    44.1 s
>>> 1843:  5986     3.2 C/MHz    228 mW    9.5 J   26.3 I/mJ    41.8 s
>>>=20
>>> =3D=3D=3D=3D=3D CPU 4 =3D=3D=3D=3D=3D
>>> Frequencies: 1113 1401 1747 1958 2150 2208
>>>=20
>>> 1113:  5825     5.2 C/MHz    220 mW    9.4 J   26.5 I/mJ    42.9 s
>>> 1401:  7324     5.2 C/MHz    317 mW   10.8 J   23.1 I/mJ    34.1 s
>>> 1747:  9135     5.2 C/MHz    474 mW   13.0 J   19.2 I/mJ    27.4 s
>>> 1958: 10247     5.2 C/MHz    578 mW   14.1 J   17.7 I/mJ    24.4 s
>>> 2150: 11246     5.2 C/MHz    694 mW   15.4 J   16.2 I/mJ    22.2 s
>>> 2208: 11551     5.2 C/MHz    736 mW   15.9 J   15.7 I/mJ    21.7 s
>>>=20
>>> [1] https://github.com/kdrag0n/freqbench
>>> [2] https://www.eembc.org/coremark/
>>> [3]=20
>>> https://github.com/kdrag0n/freqbench/tree/master/results/sdm660/main
>>>=20
>>> Signed-off-by: Danny Lin <danny@kdrag0n.dev>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm660.dtsi | 16 ++++++++--------
>>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>>=20
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi=20
>>> b/arch/arm64/boot/dts/qcom/sdm660.dtsi
>>> index 4abbdd03d1e7..ca985c5429db 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
>>> @@ -40,7 +40,7 @@ CPU0: cpu@100 {
>>>                          compatible =3D "qcom,kryo260";
>>>                          reg =3D <0x0 0x100>;
>>>                          enable-method =3D "psci";
>>> -                       capacity-dmips-mhz =3D <1024>;
>>> +                       capacity-dmips-mhz =3D <636>;
>>>                          next-level-cache =3D <&L2_1>;
>>>                          L2_1: l2-cache {
>>>                                  compatible =3D "cache";
>>> @@ -59,7 +59,7 @@ CPU1: cpu@101 {
>>>                          compatible =3D "qcom,kryo260";
>>>                          reg =3D <0x0 0x101>;
>>>                          enable-method =3D "psci";
>>> -                       capacity-dmips-mhz =3D <1024>;
>>> +                       capacity-dmips-mhz =3D <636>;
>>>                          next-level-cache =3D <&L2_1>;
>>>                          L1_I_101: l1-icache {
>>>                                  compatible =3D "cache";
>>> @@ -74,7 +74,7 @@ CPU2: cpu@102 {
>>>                          compatible =3D "qcom,kryo260";
>>>                          reg =3D <0x0 0x102>;
>>>                          enable-method =3D "psci";
>>> -                       capacity-dmips-mhz =3D <1024>;
>>> +                       capacity-dmips-mhz =3D <636>;
>>>                          next-level-cache =3D <&L2_1>;
>>>                          L1_I_102: l1-icache {
>>>                                  compatible =3D "cache";
>>> @@ -89,7 +89,7 @@ CPU3: cpu@103 {
>>>                          compatible =3D "qcom,kryo260";
>>>                          reg =3D <0x0 0x103>;
>>>                          enable-method =3D "psci";
>>> -                       capacity-dmips-mhz =3D <1024>;
>>> +                       capacity-dmips-mhz =3D <636>;
>>>                          next-level-cache =3D <&L2_1>;
>>>                          L1_I_103: l1-icache {
>>>                                  compatible =3D "cache";
>>> @@ -104,7 +104,7 @@ CPU4: cpu@0 {
>>>                          compatible =3D "qcom,kryo260";
>>>                          reg =3D <0x0 0x0>;
>>>                          enable-method =3D "psci";
>>> -                       capacity-dmips-mhz =3D <640>;
>>> +                       capacity-dmips-mhz =3D <1024>;
>>>                          next-level-cache =3D <&L2_0>;
>>>                          L2_0: l2-cache {
>>>                                  compatible =3D "cache";
>>> @@ -123,7 +123,7 @@ CPU5: cpu@1 {
>>>                          compatible =3D "qcom,kryo260";
>>>                          reg =3D <0x0 0x1>;
>>>                          enable-method =3D "psci";
>>> -                       capacity-dmips-mhz =3D <640>;
>>> +                       capacity-dmips-mhz =3D <1024>;
>>>                          next-level-cache =3D <&L2_0>;
>>>                          L1_I_1: l1-icache {
>>>                                  compatible =3D "cache";
>>> @@ -138,7 +138,7 @@ CPU6: cpu@2 {
>>>                          compatible =3D "qcom,kryo260";
>>>                          reg =3D <0x0 0x2>;
>>>                          enable-method =3D "psci";
>>> -                       capacity-dmips-mhz =3D <640>;
>>> +                       capacity-dmips-mhz =3D <1024>;
>>>                          next-level-cache =3D <&L2_0>;
>>>                          L1_I_2: l1-icache {
>>>                                  compatible =3D "cache";
>>> @@ -153,7 +153,7 @@ CPU7: cpu@3 {
>>>                          compatible =3D "qcom,kryo260";
>>>                          reg =3D <0x0 0x3>;
>>>                          enable-method =3D "psci";
>>> -                       capacity-dmips-mhz =3D <640>;
>>> +                       capacity-dmips-mhz =3D <1024>;
>>>                          next-level-cache =3D <&L2_0>;
>>>                          L1_I_3: l1-icache {
>>>                                  compatible =3D "cache";
>>> --
>>> 2.29.2
>>>=20
>>=20
>>=20
>=20


