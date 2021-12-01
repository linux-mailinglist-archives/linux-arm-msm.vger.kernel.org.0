Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5029D464883
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 08:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347578AbhLAHdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 02:33:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347613AbhLAHd1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 02:33:27 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747D8C06175E
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 23:30:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C206ACE1759
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 07:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F67FC53FCC;
        Wed,  1 Dec 2021 07:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638343803;
        bh=H/dTdR1cSXRx+8KP5/7NW7SGJuPWfxGPG0s/mP3JcNI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qu6HI3BJQx5iYoq16IWR+A02qi6fmB0wxR0iA4qt4awh4dUriLfNh7tqP8oLKZLEF
         e/1vsrGHhmDhkUY0VRjuVLSYmcRmqSRydgX7tthJBN7zoIE3vFylPRb5jvZA67eqnw
         aMCOui8iTrSvCMaVwx09tox0KbtC7wnA9iGQtadCabMIq2n98rMcFYpsjELNsVulyK
         HReo5dd3RomBkSN4cokFJ22qFaNzGcAB81Bdi+Z+mjZBar/eHYf8NpMBL64dKruh60
         pb1d9CNIOyVAbdyo8ktPE/KNjiJXEfrrJHSXe39Q1sDY0bdqzz+R3puUwd/q2EyCeU
         QvlWaQnlt21ZA==
From:   Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 14/15] arm64: dts: qcom: sm8450: add cpufreq support
Date:   Wed,  1 Dec 2021 12:59:14 +0530
Message-Id: <20211201072915.3969178-15-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201072915.3969178-1-vkoul@kernel.org>
References: <20211201072915.3969178-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

The change adds a description of a SM8450 cpufreq-epss controller and
references to it from CPU nodes.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8f0819df8039..29c5abcfa074 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -45,6 +45,7 @@ CPU0: cpu@0 {
 			next-level-cache = <&L2_0>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_0: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -62,6 +63,7 @@ CPU1: cpu@100 {
 			next-level-cache = <&L2_100>;
 			power-domains = <&CPU_PD1>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_100: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -76,6 +78,7 @@ CPU2: cpu@200 {
 			next-level-cache = <&L2_200>;
 			power-domains = <&CPU_PD2>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_200: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -90,6 +93,7 @@ CPU3: cpu@300 {
 			next-level-cache = <&L2_300>;
 			power-domains = <&CPU_PD3>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_300: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -104,6 +108,7 @@ CPU4: cpu@400 {
 			next-level-cache = <&L2_400>;
 			power-domains = <&CPU_PD4>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_400: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -118,6 +123,7 @@ CPU5: cpu@500 {
 			next-level-cache = <&L2_500>;
 			power-domains = <&CPU_PD5>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_500: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -133,6 +139,7 @@ CPU6: cpu@600 {
 			next-level-cache = <&L2_600>;
 			power-domains = <&CPU_PD6>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_600: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -147,6 +154,7 @@ CPU7: cpu@700 {
 			next-level-cache = <&L2_700>;
 			power-domains = <&CPU_PD7>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 2>;
 			L2_700: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -170,7 +178,9 @@ core2 {
 				core3 {
 					cpu = <&CPU3>;
 				};
+			};
 
+			cluster1 {
 				core4 {
 					cpu = <&CPU4>;
 				};
@@ -182,7 +192,9 @@ core5 {
 				core6 {
 					cpu = <&CPU6>;
 				};
+			};
 
+			cluster2 {
 				core7 {
 					cpu = <&CPU7>;
 				};
@@ -943,6 +955,21 @@ rpmhpd_opp_turbo_l1: opp10 {
 
 		};
 
+		cpufreq_hw: cpufreq@17d91000 {
+			compatible = "qcom,sm8450-cpufreq-epss", "qcom,cpufreq-epss";
+			reg = <0 0x17d91000 0 0x1000>,
+			      <0 0x17d92000 0 0x1000>,
+			      <0 0x17d93000 0 0x1000>;
+			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1", "dcvsh-irq-2";
+			#freq-domain-cells = <1>;
+		};
+
 		gem_noc: interconnect@19100000 {
 			reg = <0 0x19100000 0 0xbb800>;
 			compatible = "qcom,sm8450-gem-noc";
-- 
2.31.1

