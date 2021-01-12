Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66C72F258A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 02:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbhALBcm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 20:32:42 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51381 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726837AbhALBcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 20:32:41 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 2FCF05C00E3;
        Mon, 11 Jan 2021 20:31:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 11 Jan 2021 20:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=SmWgOTC1ISTGfoipEcBc42lK31
        SmIZzOe1MtblmDSoQ=; b=zOK5mRz2YeDbNhu/ZNzJNlfKXc4iNHYn+nksDWY+8K
        40V43lNwQT5cu1Lt48oma1FOlC+sryPPmZhHbACYMn88d0EgCXyNEoZCJS1z8nCU
        b5WRrwr+88dKD9+QbKVYbjG15vhTEcmdf/vVJ8eFVEBI9QzpjRSUBD6QyWvVJ4XS
        XUSUd9QMFyqTXrhiYt61GKaGQOyZkhuHIsUTRBQAFlMgpfq3h6I2F3iF42bPZDy7
        zS47yXKOHK7oha+PdCHa5kKyR/hZ4T1bvMOFWWarE0+0w3B320yT26Hbc/r2uZif
        PbLMe2lqExaVzsn6SNw9SctczMn/hYjUdH6h+EEDcqzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SmWgOTC1ISTGfoipE
        cBc42lK31SmIZzOe1MtblmDSoQ=; b=MoxXY0PAeHobBNoCZOhNRJDwvs+EtSNEH
        AuZwmHk3yd1EPdpNYU6v0po2QVcbULfmmMBobMsqzeAvwjgZDOajiIsI0vS6Rx/t
        m2CYgr7TS8hb8TquS7b8SntDcD4wwuCZ2mLhKkMyiWjKkLTnrAf87DLBcFInnFgq
        YV6Hz/A4wWziFgrvFRigLkIvl8SPT5k4AqSq0DMyjGDBrHy38/tAw/oAhIBv4+Am
        Eg1vhJVdEhU2ko/QoMiz/uAZHq23miU+LfmCeSb1S0s8+nOSr3ghxg+hFyb1OmJG
        hV99dKcS63d3Ns6KEHBCD4F2v40FnMK3ac4b4p+9WKAHw1dXWloag==
X-ME-Sender: <xms:Bfz8X_yNK96OpQBI0Mde7wALcRbJ4Uix-27C0SWalGPE2DmlQ6I5Hw>
    <xme:Bfz8X3T4YW5vN9JmOV5my8R7k5pz8_v3b56UyBtsOoSNv0eo1Zx5FSFKT2JwQPs-p
    S4ZLuGyzyLNkxTS0u4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehvddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
    necujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghnnhihuc
    fnihhnuceouggrnhhnhieskhgurhgrghdtnhdruggvvheqnecuggftrfgrthhtvghrnhep
    kefgkeevgfejffekgeeiieefgeeiuddvtdekieeghfelgfekveevjeekgeefheeunecuff
    homhgrihhnpehgihhthhhusgdrtghomhdpvggvmhgstgdrohhrghenucfkphepuddtgedr
    vddttddruddvledrvdduvdenucfuphgrmhfkphfpvghtfihorhhkpedutdegrddvtddtrd
    duvdelrddvuddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepuggrnhhnhieskhgurhgrghdtnhdruggvvh
X-ME-Proxy: <xmx:Bfz8X5VZP58STfHd0RKpJXLpURfvHLwM4zJNlwsWXuYB8Bd123riFA>
    <xmx:Bfz8X5hutMjh0vOrFdooB-C2BYg1_O-yQHgbfHaV-4hugt4vBb51hA>
    <xmx:Bfz8XxBrk5BiR2W6pNNyW1aGiS-eocOnYTIOIMa3j6SIsKjiFc5WhA>
    <xmx:Bvz8X8-kg_xtUzQWN1pKXe5YV-tM2TyecVzYiWgRbWVJx1m7ascQ5A>
Received: from pinwheel.localdomain (unknown [104.200.129.212])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1CF3D1080066;
        Mon, 11 Jan 2021 20:31:49 -0500 (EST)
From:   Danny Lin <danny@kdrag0n.dev>
Cc:     Danny Lin <danny@kdrag0n.dev>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm660: Fix CPU capacities
Date:   Mon, 11 Jan 2021 17:31:26 -0800
Message-Id: <20210112013127.414277-1-danny@kdrag0n.dev>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

sdm660 has a big.LITTLE 4+4 CPU setup with CPUs 0-3 being little cores
and CPUs 4-7 being big cores. The big cores have higher IPC, so they
should have the higher capacity-dmips-mhz, not the other way around as
the device tree currently describes it. Fix the incorrect CPU map to
improve EAS scheduling behavior.

While we're at it, let's replace the old DMIPS/MHz values with new
measurements that reflect the exact IPC of the CPUs as reported by
CoreMark.

Performance measurements were made using my freqbench [1]
benchmark coordinator, which isolates, offlines, and disables the timer
tick on test CPUs to maximize accuracy. It uses EEMBC CoreMark [2] as
the workload and measures power usage using the PM660 PMIC's fuel
gauge.

Normalized DMIPS/MHz capacity scale values for each CPU were calculated
from CoreMarks/MHz (CoreMark iterations per second per MHz), which
serves the same purpose. For each CPU, the final capacity-dmips-mhz
value is the C/MHz value of its maximum frequency normalized to
SCHED_CAPACITY_SCALE (1024) for the fastest CPU in the system.

A Xiaomi Redmi Note 7 device running a downstream Qualcomm 4.4 kernel
was used for benchmarking to ensure proper frequency scaling and other
low-level controls.

Raw benchmark results can be found in the freqbench repository [3].
Below is a human-readable summary:

Frequency domains: cpu1 cpu4
Offline CPUs: cpu1 cpu2 cpu3 cpu4 cpu5 cpu6 cpu7
Baseline power usage: 1130 mW

===== CPU 1 =====
Frequencies: 633 902 1113 1401 1536 1747 1843

 633:  2058     3.2 C/MHz     48 mW    5.9 J   42.6 I/mJ   121.5 s
 902:  2930     3.2 C/MHz     72 mW    6.2 J   40.6 I/mJ    85.3 s
1113:  3616     3.2 C/MHz     79 mW    5.4 J   46.0 I/mJ    69.1 s
1401:  4551     3.2 C/MHz    125 mW    6.9 J   36.3 I/mJ    54.9 s
1536:  4988     3.2 C/MHz    134 mW    6.7 J   37.1 I/mJ    50.1 s
1747:  5674     3.2 C/MHz    179 mW    7.9 J   31.7 I/mJ    44.1 s
1843:  5986     3.2 C/MHz    228 mW    9.5 J   26.3 I/mJ    41.8 s

===== CPU 4 =====
Frequencies: 1113 1401 1747 1958 2150 2208

1113:  5825     5.2 C/MHz    220 mW    9.4 J   26.5 I/mJ    42.9 s
1401:  7324     5.2 C/MHz    317 mW   10.8 J   23.1 I/mJ    34.1 s
1747:  9135     5.2 C/MHz    474 mW   13.0 J   19.2 I/mJ    27.4 s
1958: 10247     5.2 C/MHz    578 mW   14.1 J   17.7 I/mJ    24.4 s
2150: 11246     5.2 C/MHz    694 mW   15.4 J   16.2 I/mJ    22.2 s
2208: 11551     5.2 C/MHz    736 mW   15.9 J   15.7 I/mJ    21.7 s

[1] https://github.com/kdrag0n/freqbench
[2] https://www.eembc.org/coremark/
[3] https://github.com/kdrag0n/freqbench/tree/master/results/sdm660/main

Signed-off-by: Danny Lin <danny@kdrag0n.dev>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 4abbdd03d1e7..ca985c5429db 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -40,7 +40,7 @@ CPU0: cpu@100 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <1024>;
+			capacity-dmips-mhz = <636>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
 				compatible = "cache";
@@ -59,7 +59,7 @@ CPU1: cpu@101 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <1024>;
+			capacity-dmips-mhz = <636>;
 			next-level-cache = <&L2_1>;
 			L1_I_101: l1-icache {
 				compatible = "cache";
@@ -74,7 +74,7 @@ CPU2: cpu@102 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <1024>;
+			capacity-dmips-mhz = <636>;
 			next-level-cache = <&L2_1>;
 			L1_I_102: l1-icache {
 				compatible = "cache";
@@ -89,7 +89,7 @@ CPU3: cpu@103 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <1024>;
+			capacity-dmips-mhz = <636>;
 			next-level-cache = <&L2_1>;
 			L1_I_103: l1-icache {
 				compatible = "cache";
@@ -104,7 +104,7 @@ CPU4: cpu@0 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <640>;
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
 				compatible = "cache";
@@ -123,7 +123,7 @@ CPU5: cpu@1 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <640>;
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_1: l1-icache {
 				compatible = "cache";
@@ -138,7 +138,7 @@ CPU6: cpu@2 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <640>;
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_2: l1-icache {
 				compatible = "cache";
@@ -153,7 +153,7 @@ CPU7: cpu@3 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <640>;
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_3: l1-icache {
 				compatible = "cache";
-- 
2.29.2

