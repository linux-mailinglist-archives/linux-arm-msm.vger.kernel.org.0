Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49FF31C98C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 12:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhBPLSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 06:18:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:37472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230203AbhBPLR5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 06:17:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4981564DDA;
        Tue, 16 Feb 2021 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613474235;
        bh=4V2U/z8BogReCgHyBWSvZkjIKdtYA2RLgt81IN7Hs34=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mLm6BEduKdJUpu2Q8xrnhemcuHrH6kLhboY/IyyHrV0B+h0rr1f0ZJztS3bVQK6rm
         j88rc1d4gXvgPeIAJ1LAqQQwYqqXDVH208G6iwQcXRs7q3ZS61wCH+5EVi+E5HrM5P
         EBgs8By+R1UmF0gz4lxYDwAiuvlO1Wi6qY/GYp0eFRE/Irb7e4RPx/FlWOY8Z5CW8M
         6suUETSB1wtLQHvLHcTaNIJeTjPDcsEQt93ntDku8RMP2ksRwqlTeg3BulFB1Hl8VM
         DfKRkzmLMaV9lkop+LFyOiXuqrLXAB9JFqxt+BPvJ3fuHzTgcVfk7r3HivTPS5k2z4
         MfrZ2qlswiUtQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 7/6] arm64: dts: qcom: sm8350: Add cpufreq node
Date:   Tue, 16 Feb 2021 16:47:03 +0530
Message-Id: <20210216111703.1838663-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212115532.1339942-8-vkoul@kernel.org>
References: <20210212115532.1339942-8-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add cpufreq node and reference it for the CPUs.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 - appended this to dts patch series

 arch/arm64/boot/dts/qcom/sm8350.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 1aa2a9e00a75..91d4cbbe38dc 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -45,6 +45,7 @@ CPU0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_0: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -60,6 +61,7 @@ CPU1: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_100>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_100: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -72,6 +74,7 @@ CPU2: cpu@200 {
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			next-level-cache = <&L2_200>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_200: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -84,6 +87,7 @@ CPU3: cpu@300 {
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			next-level-cache = <&L2_300>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_300: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -96,6 +100,7 @@ CPU4: cpu@400 {
 			reg = <0x0 0x400>;
 			enable-method = "psci";
 			next-level-cache = <&L2_400>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_400: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -108,6 +113,7 @@ CPU5: cpu@500 {
 			reg = <0x0 0x500>;
 			enable-method = "psci";
 			next-level-cache = <&L2_500>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_500: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -121,6 +127,7 @@ CPU6: cpu@600 {
 			reg = <0x0 0x600>;
 			enable-method = "psci";
 			next-level-cache = <&L2_600>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_600: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -133,6 +140,7 @@ CPU7: cpu@700 {
 			reg = <0x0 0x700>;
 			enable-method = "psci";
 			next-level-cache = <&L2_700>;
+			qcom,freq-domain = <&cpufreq_hw 2>;
 			L2_700: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -852,6 +860,19 @@ apps_bcm_voter: bcm_voter {
 			};
 		};
 
+		cpufreq_hw: cpufreq@18591000 {
+			compatible = "qcom,sm8350-cpufreq-epss", "qcom,cpufreq-epss";
+			reg = <0 0x18591000 0 0x1000>,
+			      <0 0x18592000 0 0x1000>,
+			      <0 0x18593000 0 0x1000>;
+			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-- 
2.26.2

