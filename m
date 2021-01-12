Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2AC2F2590
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 02:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730782AbhALBeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 20:34:08 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58815 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729339AbhALBeI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 20:34:08 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id B55ED5C0192;
        Mon, 11 Jan 2021 20:33:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 11 Jan 2021 20:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        voTnLTzBsZGDIMooctHaO1el6B6hxcPoAAYnbvPfMEk=; b=g/hsn7AVDY/PbwGG
        aKeKQk/xJ4I61jQldklkfff9fS/rpd3ZRH24zN8f3v5Q0dTRYx8pGLUK4TAWXF6U
        58bYFnU4mGpPOmt/A1i6OaO6sTbGa+xCna76PMQV2RcPx9HzFC2V4uRy8qBZGmHX
        fUA9OJmemphNfDPcboKhmQGT7KxKZJpNFPbLf6WIHBhh3gCmgePJTPhlEpkkYto2
        WmJTih7v6hqpBCbfDDth7azlisn+5NJ8BQWQ3YKw5P0cT5tVFJ7D5rte8EoveGVy
        DDPnEZKV8js+seJmNvAgNBGP3PuvgVJWNuhed5MvgzZQYzdXbCQGCPIBvpbHyKuf
        C3Yw4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=voTnLTzBsZGDIMooctHaO1el6B6hxcPoAAYnbvPfM
        Ek=; b=lUzKx4UX822TJhD3woF0vjOCgeViDuf8AS2RP6ypmv3M04xGGSv+2vfXR
        MuHRcGnR60qmpZmnLGRAcs2TSWQUoUQGOsVWoQfDgELQFL55aCwl3P7/3VcXsToE
        XJJ2h1wTknRuRA2KNfiRaMS0WZ4cJ3htKM9q8mVf6dwCaP8jFNUQ9TzT9RNeO0FH
        KbcjlPSBs6ZwzAHdWgJTGqFlTdNMD6++kte05t90aYZPlJ++yWuu8BtK8r4+Xjym
        oj8s86DzcT9Mgn9Lre7iG9PJ5VPAoT33BM0BEI1+zoGCZxEZy1Grl0eGuo+22T/D
        TQ9uGduMhNUu1vJDruPsWbDHNoY7g==
X-ME-Sender: <xms:YPz8Xy44gZjKyeIJgujbuwnx0z50CTMOZHrMizMoeXFA1coUu5E2hg>
    <xme:YPz8X75b3P2s-5qmwVKuhwyInf9HX_aETc9iS7GYSRRDiQxKPk_eatha2cCtgc90r
    L0b9xFi3xdhd-4IIK4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehvddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
    necujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgrnh
    hnhicunfhinhcuoegurghnnhihsehkughrrghgtdhnrdguvghvqeenucggtffrrghtthgv
    rhhnpedvkedvvdektdejjedtudefueekgfefvedttdfggefgvdetgeehvefgkedufeehue
    enucffohhmrghinhepghhithhhuhgsrdgtohhmpdgvvghmsggtrdhorhhgnecukfhppedu
    tdegrddvtddtrdduvdelrddvuddvnecuufhprghmkfhppfgvthifohhrkhepuddtgedrvd
    dttddruddvledrvdduvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegurghnnhihsehkughrrghgtdhnrdguvghv
X-ME-Proxy: <xmx:YPz8XxccyF8unTuzPJ5SAwt8rOHjdYNtltblVe6BxTZrOxQYj1Nseg>
    <xmx:YPz8X_ILiK32Y5FcWjaT3naL7GoHXkO88DcchJIsP7G49UUWKLb-1A>
    <xmx:YPz8X2JGBDnCfDDl0_rBrEFdM57TuBvnfGUwficFZ0Bw9n5-8SS4YQ>
    <xmx:YPz8X7F_KvHV49uMb5u00PECpuFxBUB2ICg2IUFS1l05W3RiXfhvNQ>
Received: from pinwheel.localdomain (unknown [104.200.129.212])
        by mail.messagingengine.com (Postfix) with ESMTPA id BE8D124005E;
        Mon, 11 Jan 2021 20:33:19 -0500 (EST)
From:   Danny Lin <danny@kdrag0n.dev>
Cc:     Danny Lin <danny@kdrag0n.dev>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: Add CPU capacities and energy model
Date:   Mon, 11 Jan 2021 17:32:54 -0800
Message-Id: <20210112013255.415253-2-danny@kdrag0n.dev>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112013255.415253-1-danny@kdrag0n.dev>
References: <20210112013255.415253-1-danny@kdrag0n.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Power and performance measurements were made using my freqbench [1]
benchmark coordinator, which isolates, offlines, and disables the timer
tick on test CPUs to maximize accuracy. It uses EEMBC CoreMark [2] as
the workload and measures power usage using the PM8150B PMIC's fuel
gauge.

The energy model dynamic-power-coefficient values were calculated with
    DPC = µW / MHz / V^2
for each OPP, and averaged across all OPPs within each cluster for the
final coefficient. Voltages were obtained from the qcom-cpufreq-hw
driver that reads voltages from the OSM LUT programmed into the SoC.

Normalized DMIPS/MHz capacity scale values for each CPU were calculated
from CoreMarks/MHz (CoreMark iterations per second per MHz), which
serves the same purpose. For each CPU, the final capacity-dmips-mhz
value is the C/MHz value of its maximum frequency normalized to
SCHED_CAPACITY_SCALE (1024) for the fastest CPU in the system.

A Xiaomi Redmi K30S Ultra device running a downstream Qualcomm 4.19
kernel was used for benchmarking to ensure proper frequency scaling and
other low-level controls.

Raw benchmark results can be found in the freqbench repository [3].
Below is a human-readable summary:

Frequency domains: cpu1 cpu4 cpu7
Offline CPUs: cpu1 cpu2 cpu3 cpu4 cpu5 cpu6 cpu7
Baseline power usage: 1223 mW

===== CPU 1 =====
Frequencies: 300 403 518 614 691 787 883 979 1075 1171 1248 1344 1420 1516 1612 1708 1804

 300:  1114     3.7 C/MHz     29 mW    6.4 J   39.0 I/mJ   224.5 s
 403:  1497     3.7 C/MHz     33 mW    5.5 J   45.2 I/mJ   167.0 s
 518:  1925     3.7 C/MHz     48 mW    6.3 J   39.7 I/mJ   129.9 s
 614:  2281     3.7 C/MHz     73 mW    8.0 J   31.1 I/mJ   109.6 s
 691:  2566     3.7 C/MHz     46 mW    4.5 J   55.2 I/mJ    97.4 s
 787:  2923     3.7 C/MHz     86 mW    7.4 J   33.8 I/mJ    85.5 s
 883:  3279     3.7 C/MHz     77 mW    5.9 J   42.5 I/mJ    76.2 s
 979:  3635     3.7 C/MHz     65 mW    4.4 J   56.2 I/mJ    68.8 s
1075:  3992     3.7 C/MHz     71 mW    4.4 J   56.2 I/mJ    62.6 s
1171:  4348     3.7 C/MHz    121 mW    6.9 J   36.0 I/mJ    57.5 s
1248:  4633     3.7 C/MHz     79 mW    4.2 J   58.9 I/mJ    54.0 s
1344:  4990     3.7 C/MHz     81 mW    4.0 J   61.7 I/mJ    50.1 s
1420:  5275     3.7 C/MHz     85 mW    4.0 J   61.8 I/mJ    47.4 s
1516:  5632     3.7 C/MHz     88 mW    3.9 J   64.3 I/mJ    44.4 s
1612:  5988     3.7 C/MHz     92 mW    3.8 J   65.4 I/mJ    41.7 s
1708:  6346     3.7 C/MHz     96 mW    3.8 J   66.3 I/mJ    39.4 s
1804:  6701     3.7 C/MHz    105 mW    3.9 J   63.5 I/mJ    37.3 s

===== CPU 4 =====
Frequencies: 710 825 940 1056 1171 1286 1382 1478 1574 1670 1766 1862 1958 2054 2150 2246 2342 2419

 710:  6022     8.5 C/MHz    123 mW    5.1 J   49.1 I/mJ    41.5 s
 825:  7001     8.5 C/MHz    142 mW    5.1 J   49.4 I/mJ    35.7 s
 940:  7987     8.5 C/MHz    164 mW    5.1 J   48.7 I/mJ    31.3 s
1056:  8954     8.5 C/MHz    185 mW    5.2 J   48.3 I/mJ    27.9 s
1171:  9944     8.5 C/MHz    212 mW    5.3 J   46.9 I/mJ    25.2 s
1286: 10926     8.5 C/MHz    235 mW    5.4 J   46.4 I/mJ    22.9 s
1382: 11735     8.5 C/MHz    253 mW    5.4 J   46.4 I/mJ    21.3 s
1478: 12531     8.5 C/MHz    277 mW    5.5 J   45.2 I/mJ    20.0 s
1574: 13335     8.5 C/MHz    306 mW    5.7 J   43.6 I/mJ    18.8 s
1670: 14169     8.5 C/MHz    335 mW    5.9 J   42.2 I/mJ    17.7 s
1766: 14969     8.5 C/MHz    353 mW    5.9 J   42.3 I/mJ    16.7 s
1862: 15800     8.5 C/MHz    444 mW    7.0 J   35.6 I/mJ    15.8 s
1958: 16630     8.5 C/MHz    463 mW    7.0 J   35.9 I/mJ    15.0 s
2054: 17428     8.5 C/MHz    480 mW    6.9 J   36.3 I/mJ    14.4 s
2150: 18238     8.5 C/MHz    496 mW    6.8 J   36.8 I/mJ    13.7 s
2246: 19053     8.5 C/MHz    578 mW    7.6 J   32.9 I/mJ    13.1 s
2342: 19873     8.5 C/MHz    625 mW    7.9 J   31.8 I/mJ    12.6 s
2419: 20522     8.5 C/MHz    675 mW    8.2 J   30.4 I/mJ    12.2 s

===== CPU 7 =====
Frequencies: 844 960 1075 1190 1305 1401 1516 1632 1747 1862 1977 2073 2169 2265 2361 2457 2553 2649 2745 2841

 844:  7172     8.5 C/MHz    155 mW    5.4 J   46.4 I/mJ    34.9 s
 960:  8148     8.5 C/MHz    172 mW    5.3 J   47.4 I/mJ    30.7 s
1075:  9116     8.5 C/MHz    197 mW    5.4 J   46.2 I/mJ    27.4 s
1190: 10105     8.5 C/MHz    220 mW    5.4 J   46.0 I/mJ    24.8 s
1305: 11084     8.5 C/MHz    242 mW    5.5 J   45.8 I/mJ    22.6 s
1401: 11888     8.5 C/MHz    262 mW    5.5 J   45.4 I/mJ    21.0 s
1516: 12859     8.5 C/MHz    297 mW    5.8 J   43.2 I/mJ    19.5 s
1632: 13840     8.5 C/MHz    335 mW    6.1 J   41.3 I/mJ    18.1 s
1747: 14827     8.5 C/MHz    369 mW    6.2 J   40.1 I/mJ    16.9 s
1862: 15800     8.5 C/MHz    395 mW    6.3 J   40.0 I/mJ    15.8 s
1977: 16786     8.5 C/MHz    443 mW    6.6 J   37.9 I/mJ    14.9 s
2073: 17566     8.5 C/MHz    488 mW    6.9 J   36.0 I/mJ    14.2 s
2169: 18395     8.5 C/MHz    620 mW    8.4 J   29.7 I/mJ    13.6 s
2265: 19223     8.5 C/MHz    621 mW    8.1 J   30.9 I/mJ    13.0 s
2361: 20040     8.5 C/MHz    672 mW    8.4 J   29.8 I/mJ    12.5 s
2457: 20852     8.5 C/MHz    696 mW    8.3 J   29.9 I/mJ    12.0 s
2553: 21684     8.5 C/MHz    738 mW    8.5 J   29.3 I/mJ    11.5 s
2649: 22458     8.5 C/MHz    793 mW    8.8 J   28.3 I/mJ    11.1 s
2745: 23314     8.5 C/MHz    875 mW    9.4 J   26.6 I/mJ    10.7 s
2841: 24103     8.5 C/MHz    928 mW    9.6 J   26.0 I/mJ    10.4 s

[1] https://github.com/kdrag0n/freqbench
[2] https://www.eembc.org/coremark/
[3] https://github.com/kdrag0n/freqbench/tree/master/results/sm8250/k30s

Signed-off-by: Danny Lin <danny@kdrag0n.dev>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 30ccadb753a5..0c5491c2fa2e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -89,6 +89,8 @@ CPU0: cpu@0 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <448>;
+			dynamic-power-coefficient = <205>;
 			next-level-cache = <&L2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -106,6 +108,8 @@ CPU1: cpu@100 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <448>;
+			dynamic-power-coefficient = <205>;
 			next-level-cache = <&L2_100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -120,6 +124,8 @@ CPU2: cpu@200 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <448>;
+			dynamic-power-coefficient = <205>;
 			next-level-cache = <&L2_200>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -134,6 +140,8 @@ CPU3: cpu@300 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <448>;
+			dynamic-power-coefficient = <205>;
 			next-level-cache = <&L2_300>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -148,6 +156,8 @@ CPU4: cpu@400 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <379>;
 			next-level-cache = <&L2_400>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -162,6 +172,8 @@ CPU5: cpu@500 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <379>;
 			next-level-cache = <&L2_500>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -177,6 +189,8 @@ CPU6: cpu@600 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x600>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <379>;
 			next-level-cache = <&L2_600>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -191,6 +205,8 @@ CPU7: cpu@700 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x700>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <444>;
 			next-level-cache = <&L2_700>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			#cooling-cells = <2>;
-- 
2.29.2

