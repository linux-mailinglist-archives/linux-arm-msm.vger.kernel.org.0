Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0252DF746
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 01:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727678AbgLUAam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Dec 2020 19:30:42 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53303 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726619AbgLUAal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Dec 2020 19:30:41 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id A37685C012C;
        Sun, 20 Dec 2020 19:29:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 20 Dec 2020 19:29:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        6NZcU0rk9Atsk8f+ku2gZv4pmTbxyFMMstlSQkIIexc=; b=ACqh7TZ8RHtOmPPo
        TH/rQBvnyd3/aXiqIqdWZKR8VUUFQphubo3vioFOzEdiSCJgxPJRlRZrR9Wsj5Du
        3ZTx3O2rheZ7YAuFTeSpJEFNSASjOFDnnv+rfoTzhiuyv2f83GugWrUUGixf9ski
        RVf2Yauxjh8Kroz8392jBziwQWSqNFmFfqsByAPeisPTaJMjyO+8e6wq7OWDjeAJ
        fp2F1p7ylcdkU8sNy/p0FV7DaUtLmaxYkAvemymjKBKRreoxavRGzgy5Xu4zjCz7
        vGCVV7eyL6wcZcRIt/Og2+8SwoCuZooGTmJbQzlIuVF6QrPCzOSfy6sroUjRvp7i
        IQBzYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=6NZcU0rk9Atsk8f+ku2gZv4pmTbxyFMMstlSQkIIe
        xc=; b=auRg2OjdW2OBXfFwO9mrEQHmd6vTOiwCS+KmA2guq2ZbK7MJDbCEjWpCr
        UHUwh0+9RxA1E8O5hutQKbgQ3hEmkC2fhYkXs4gtvTnkOntBQ6SKC9u5DPIJOLLn
        /DQvQrGoR2Zvq8pFDLPCrwifsW+XztznI4t6I4poLLwNpXqAgGAcMXObzlAjvw1p
        /cwqH8k4oxhcLGUcoXWh4KIrLKvCcHv3l1UfhAgrshYMkPtsqs5aYDUdpvRwQucN
        ETsi87WHONVJFoOWKs5Wb1V3t+BayYUlzlSJYqFgBGTwPLf1UJAIxgCFWCsTUUoh
        DgB5f+yshV7fpyVPOqGvNtjLNqFng==
X-ME-Sender: <xms:buzfX6y35EUv_rHgcocwCoXZSWdr5iTYl5RXOAi_QRqE4G-ZinkrVw>
    <xme:buzfX2TY7AHJafAJ0S0gI99QOCpHCpbmrfUjeuoSqkarVEBvGuptKqxyR6flu0r6-
    fw9JwvX1rr60KqnLv0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
    necujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgrnh
    hnhicunfhinhcuoegurghnnhihsehkughrrghgtdhnrdguvghvqeenucggtffrrghtthgv
    rhhnpedvkedvvdektdejjedtudefueekgfefvedttdfggefgvdetgeehvefgkedufeehue
    enucffohhmrghinhepghhithhhuhgsrdgtohhmpdgvvghmsggtrdhorhhgnecukfhppedu
    tdegrddvtddtrdduvdelrddvuddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepuggrnhhnhieskhgurhgrghdtnhdruggvvh
X-ME-Proxy: <xmx:buzfX8VS0sc21KEJcl0pfy3nS_CTNVC6gKn1xrXxNpUB82cnMB43og>
    <xmx:buzfXwioaXOML61MDe2NnNaZ3inaCqGImbeGx6FFSwoi6vap74pk6Q>
    <xmx:buzfX8B_lyTj99E-4BAaPflqx9Ahu5-rzM5PWHuVwu-Okzz_levXkw>
    <xmx:buzfX_9WnC1HuROFxIB1TNSqv9O7aFJKnqkwkc1ei0io2xQFhtrm4w>
Received: from pinwheel.localdomain (unknown [104.200.129.212])
        by mail.messagingengine.com (Postfix) with ESMTPA id CE98E240062;
        Sun, 20 Dec 2020 19:29:33 -0500 (EST)
From:   Danny Lin <danny@kdrag0n.dev>
Cc:     Danny Lin <danny@kdrag0n.dev>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm8150: Add CPU capacities and energy model
Date:   Sun, 20 Dec 2020 16:29:07 -0800
Message-Id: <20201221002907.2870059-4-danny@kdrag0n.dev>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221002907.2870059-1-danny@kdrag0n.dev>
References: <20201221002907.2870059-1-danny@kdrag0n.dev>
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

An Asus ZenFone 6 device running a downstream Qualcomm 4.14 kernel
(LA.UM.8.1.r1-15600-sm8150.0) was used for benchmarks to ensure proper
frequency scaling and other low-level controls.

Raw benchmark results can be found in the freqbench repository [3].
Below is a human-readable summary:

Frequency domains: cpu1 cpu4 cpu7
Offline CPUs: cpu1 cpu2 cpu3 cpu4 cpu5 cpu6 cpu7
Baseline power usage: 1400 mW

===== CPU 1 =====
Frequencies: 300 403 499 576 672 768 844 940 1036 1113 1209 1305 1382 1478 1555 1632 1708 1785

 300:  1114     3.7 C/MHz     52 mW   11.8 J   21.3 I/mJ   224.4 s
 403:  1497     3.7 C/MHz     57 mW    9.5 J   26.2 I/mJ   167.0 s
 499:  1854     3.7 C/MHz     73 mW    9.8 J   25.5 I/mJ   134.9 s
 576:  2139     3.7 C/MHz     83 mW    9.7 J   25.8 I/mJ   116.9 s
 672:  2495     3.7 C/MHz     65 mW    6.5 J   38.6 I/mJ   100.2 s
 768:  2852     3.7 C/MHz     72 mW    6.3 J   39.4 I/mJ    87.7 s
 844:  3137     3.7 C/MHz     77 mW    6.2 J   40.5 I/mJ    79.7 s
 940:  3493     3.7 C/MHz     84 mW    6.0 J   41.8 I/mJ    71.6 s
1036:  3850     3.7 C/MHz     91 mW    5.9 J   42.5 I/mJ    64.9 s
1113:  4135     3.7 C/MHz     96 mW    5.8 J   43.2 I/mJ    60.5 s
1209:  4491     3.7 C/MHz    102 mW    5.7 J   44.2 I/mJ    55.7 s
1305:  4848     3.7 C/MHz    110 mW    5.7 J   44.0 I/mJ    51.6 s
1382:  5133     3.7 C/MHz    114 mW    5.5 J   45.2 I/mJ    48.7 s
1478:  5490     3.7 C/MHz    120 mW    5.5 J   45.7 I/mJ    45.5 s
1555:  5775     3.7 C/MHz    126 mW    5.5 J   45.8 I/mJ    43.3 s
1632:  6060     3.7 C/MHz    131 mW    5.4 J   46.1 I/mJ    41.3 s
1708:  6345     3.7 C/MHz    137 mW    5.4 J   46.3 I/mJ    39.4 s
1785:  6630     3.7 C/MHz    146 mW    5.5 J   45.5 I/mJ    37.7 s

===== CPU 4 =====
Frequencies: 710 825 940 1056 1171 1286 1401 1497 1612 1708 1804 1920 2016 2131 2227 2323 2419

 710:  2765     3.9 C/MHz    126 mW   11.4 J   22.0 I/mJ    90.4 s
 825:  6432     7.8 C/MHz    206 mW    8.0 J   31.2 I/mJ    38.9 s
 940:  7331     7.8 C/MHz    227 mW    7.7 J   32.3 I/mJ    34.1 s
1056:  8227     7.8 C/MHz    249 mW    7.6 J   33.0 I/mJ    30.4 s
1171:  9127     7.8 C/MHz    261 mW    7.2 J   34.9 I/mJ    27.4 s
1286: 10020     7.8 C/MHz    289 mW    7.2 J   34.6 I/mJ    25.0 s
1401: 10918     7.8 C/MHz    311 mW    7.1 J   35.1 I/mJ    22.9 s
1497: 11663     7.8 C/MHz    336 mW    7.2 J   34.7 I/mJ    21.4 s
1612: 12546     7.8 C/MHz    375 mW    7.5 J   33.5 I/mJ    19.9 s
1708: 13320     7.8 C/MHz    398 mW    7.5 J   33.5 I/mJ    18.8 s
1804: 14069     7.8 C/MHz    456 mW    8.1 J   30.9 I/mJ    17.8 s
1920: 14909     7.8 C/MHz    507 mW    8.5 J   29.4 I/mJ    16.8 s
2016: 15706     7.8 C/MHz    558 mW    8.9 J   28.1 I/mJ    15.9 s
2131: 16612     7.8 C/MHz    632 mW    9.5 J   26.3 I/mJ    15.1 s
2227: 17349     7.8 C/MHz    698 mW   10.1 J   24.8 I/mJ    14.4 s
2323: 18088     7.8 C/MHz    717 mW    9.9 J   25.2 I/mJ    13.8 s
2419: 18835     7.8 C/MHz    845 mW   11.2 J   22.3 I/mJ    13.3 s

===== CPU 7 =====
Frequencies: 825 940 1056 1171 1286 1401 1497 1612 1708 1804 1920 2016 2131 2227 2323 2419 2534 2649 2745 2841

 825:  3215     3.9 C/MHz    158 mW   12.3 J   20.3 I/mJ    77.8 s
 940:  7330     7.8 C/MHz    269 mW    9.2 J   27.3 I/mJ    34.1 s
1056:  8227     7.8 C/MHz    291 mW    8.8 J   28.2 I/mJ    30.4 s
1171:  9125     7.8 C/MHz    316 mW    8.7 J   28.9 I/mJ    27.4 s
1286: 10024     7.8 C/MHz    338 mW    8.4 J   29.6 I/mJ    25.0 s
1401: 10922     7.8 C/MHz    365 mW    8.4 J   29.9 I/mJ    22.9 s
1497: 11674     7.8 C/MHz    383 mW    8.2 J   30.4 I/mJ    21.4 s
1612: 12564     7.8 C/MHz    406 mW    8.1 J   30.9 I/mJ    19.9 s
1708: 13317     7.8 C/MHz    427 mW    8.0 J   31.2 I/mJ    18.8 s
1804: 14062     7.8 C/MHz    446 mW    7.9 J   31.5 I/mJ    17.8 s
1920: 14966     7.8 C/MHz    498 mW    8.3 J   30.1 I/mJ    16.7 s
2016: 15711     7.8 C/MHz    513 mW    8.2 J   30.6 I/mJ    15.9 s
2131: 16599     7.8 C/MHz    599 mW    9.0 J   27.7 I/mJ    15.1 s
2227: 17353     7.8 C/MHz    622 mW    9.0 J   27.9 I/mJ    14.4 s
2323: 18095     7.8 C/MHz    704 mW    9.7 J   25.7 I/mJ    13.8 s
2419: 18849     7.8 C/MHz    738 mW    9.8 J   25.5 I/mJ    13.3 s
2534: 19761     7.8 C/MHz    824 mW   10.4 J   23.9 I/mJ    12.7 s
2649: 20658     7.8 C/MHz    882 mW   10.7 J   23.4 I/mJ    12.1 s
2745: 21400     7.8 C/MHz   1003 mW   11.7 J   21.3 I/mJ    11.7 s
2841: 22147     7.8 C/MHz   1092 mW   12.3 J   20.3 I/mJ    11.3 s

[1] https://github.com/kdrag0n/freqbench
[2] https://www.eembc.org/coremark/
[3] https://github.com/kdrag0n/freqbench/tree/master/results/sm8150/main

Signed-off-by: Danny Lin <danny@kdrag0n.dev>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index edc1fe6d7f1b..5cadab1e052a 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -50,6 +50,8 @@ CPU0: cpu@0 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <488>;
+			dynamic-power-coefficient = <232>;
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_0>;
@@ -69,6 +71,8 @@ CPU1: cpu@100 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <488>;
+			dynamic-power-coefficient = <232>;
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_100>;
@@ -86,6 +90,8 @@ CPU2: cpu@200 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <488>;
+			dynamic-power-coefficient = <232>;
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_200>;
@@ -102,6 +108,8 @@ CPU3: cpu@300 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <488>;
+			dynamic-power-coefficient = <232>;
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_300>;
@@ -118,6 +126,8 @@ CPU4: cpu@400 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <369>;
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_400>;
@@ -134,6 +144,8 @@ CPU5: cpu@500 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <369>;
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_500>;
@@ -150,6 +162,8 @@ CPU6: cpu@600 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x600>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <369>;
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_600>;
@@ -166,6 +180,8 @@ CPU7: cpu@700 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x700>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <421>;
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_700>;
-- 
2.29.2

