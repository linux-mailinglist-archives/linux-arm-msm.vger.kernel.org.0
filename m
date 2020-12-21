Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B682DF742
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 01:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgLUAaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Dec 2020 19:30:24 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:58099 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726896AbgLUAaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Dec 2020 19:30:19 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 99DF15C0132;
        Sun, 20 Dec 2020 19:29:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 20 Dec 2020 19:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=XfXwBu1lAywXz
        Oqe8KLsmzFtPHG5VX9dz1KKhwLxkNw=; b=JRROtOIMJzhZWcpF4Kuk/PJuFQNum
        3sLBR6StlSNRqInPqDE3Gw87PnUZ6OXQ/MrZhEutoSDKqr9EYt/kua6AKnhQU8OZ
        LbYz+ydP7Kyxf0G79v3LkXE/DHbKOUJSLA5aTsOxV5g7yRI9d2qJkDviEDdteiey
        xbZuaGrI2/Pl4stRjqNm8AUTB9JXvFr7VSyesBHdUJt8DxQ5gFbrenUyrSRhUHfd
        qbf7ewMQyl6DzxZb7JEprG0Jsq5EdHYSb5E+vrzI1dTqjaIC+5b/DcXOIcL88thp
        oANpbL4YUFCAYceiVnAMj7Ub6GDhk5pi+lQknPPJkso6xqAWLS8DJwMqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=XfXwBu1lAywXzOqe8KLsmzFtPHG5VX9dz1KKhwLxkNw=; b=RSaD2Uwd
        5xTunwFMIvdUobimshgSAGjiUeg1ZEeqyyzKch7l/eZlSZlTosGdJuw7/KUYNKcS
        Win67Rfnf2u7+uhtmSXYNxcdh6l5wHIf241XN1rwv4jmzFkGulbCWZYNXevxQOtD
        216fdvyR72RFjkyqlov3vyQ8/ThUBnpdgrGGUbZBOD6xdkmBMhBnvmtOKI2CCqMb
        WVO9o1DeBpP3h17NMmxrfYL4bdFPpIa8bTQ2hmyc5RtGoqRgJQGeyNx0f5IFTE2m
        k5eQXUqL+FQJQHxgbKj5h3ImnKLlvleZjKygnkclnj4EKQFZMo9WAf3nZqFVEY3z
        4Y3UkMia2ElQew==
X-ME-Sender: <xms:bOzfXwUH42CUKTCIg8wXBy4FuTIIKkdGJjDvMPsf9BmUswjO-548mg>
    <xme:bOzfX0mXik8x3ZT4uwSXcJaKv15_W7WYbVuxTNvYPdG6BoRd0kJpeoBQJnLDdXCOR
    kqOg6AV_vL6vmhhLvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
    necujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnnh
    ihucfnihhnuceouggrnhhnhieskhgurhgrghdtnhdruggvvheqnecuggftrfgrthhtvghr
    nheptefghfehteeugefgueeviedutdduheetheeghfevjeelvefhgfetleduheduuedune
    cukfhppedutdegrddvtddtrdduvdelrddvuddvnecuvehluhhsthgvrhfuihiivgepuden
    ucfrrghrrghmpehmrghilhhfrhhomhepuggrnhhnhieskhgurhgrghdtnhdruggvvh
X-ME-Proxy: <xmx:bOzfX0ZYmh6HE46hl_tRPxjZl3AKIlar4fLwSQE6-ZpQLH3DxSYjMA>
    <xmx:bOzfX_XlcQxQL1uxlIxkq9UvglOiw0T6tC_pmqVaj5oLToett6X2vQ>
    <xmx:bOzfX6nLOFHMKVNsnhbx0fjw4e96qNic_QW9N4xs0WLerfvXthm-bg>
    <xmx:bOzfX7A0lrqOSQBjuNANxIzyehfkEBq6rdVhrvK5AEJq3IfUMpW0FQ>
Received: from pinwheel.localdomain (unknown [104.200.129.212])
        by mail.messagingengine.com (Postfix) with ESMTPA id C47E0240057;
        Sun, 20 Dec 2020 19:29:31 -0500 (EST)
From:   Danny Lin <danny@kdrag0n.dev>
Cc:     Danny Lin <danny@kdrag0n.dev>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sm8150: Add PSCI idle states
Date:   Sun, 20 Dec 2020 16:29:06 -0800
Message-Id: <20201221002907.2870059-3-danny@kdrag0n.dev>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221002907.2870059-1-danny@kdrag0n.dev>
References: <20201221002907.2870059-1-danny@kdrag0n.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Like other Qualcomm SoCs, sm8150 exposes CPU and cluster idle states
through PSCI. Define the idle states to save power when the CPU is not
in active use.

These idle states, latency, and residency values match the downstream
4.14 kernel from Qualcomm as of LA.UM.8.1.r1-15600-sm8150.0.

It's worth noting that the CPU has an additional C3 power collapse idle
state between WFI and rail power collapse (with PSCI mode 0x40000003),
but it is not officially used in downstream kernels due to "thermal
throttling issues."

Signed-off-by: Danny Lin <danny@kdrag0n.dev>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 50 ++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 75ed38ee5d88..edc1fe6d7f1b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -50,6 +50,8 @@ CPU0: cpu@0 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
+					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -67,6 +69,8 @@ CPU1: cpu@100 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
+					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -82,6 +86,8 @@ CPU2: cpu@200 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
+					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_200>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -96,6 +102,8 @@ CPU3: cpu@300 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
+					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_300>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -110,6 +118,8 @@ CPU4: cpu@400 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0
+					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_400>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -124,6 +134,8 @@ CPU5: cpu@500 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0
+					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_500>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -138,6 +150,8 @@ CPU6: cpu@600 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x600>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0
+					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_600>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -152,6 +166,8 @@ CPU7: cpu@700 {
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x700>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0
+					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_700>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			#cooling-cells = <2>;
@@ -196,6 +212,40 @@ core7 {
 				};
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <355>;
+				exit-latency-us = <909>;
+				min-residency-us = <3934>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <241>;
+				exit-latency-us = <1461>;
+				min-residency-us = <4488>;
+				local-timer-stop;
+			};
+
+			CLUSTER_SLEEP_0: cluster-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "cluster-power-collapse";
+				arm,psci-suspend-param = <0x400000F4>;
+				entry-latency-us = <3263>;
+				exit-latency-us = <6562>;
+				min-residency-us = <9987>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {
-- 
2.29.2

