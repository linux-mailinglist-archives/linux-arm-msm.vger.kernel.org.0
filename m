Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A2A4751BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 05:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239751AbhLOEf1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 23:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239726AbhLOEfZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 23:35:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07ACC06173E;
        Tue, 14 Dec 2021 20:35:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 82235617D2;
        Wed, 15 Dec 2021 04:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5570BC34608;
        Wed, 15 Dec 2021 04:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639542923;
        bh=Vd9kxCRzDbGb5FCo+00iF4zQOsjd4QYOTa28clj2axY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s0J9kR+TDDl4WDjiTluGePS9httKRvEU8WUe4S8ivQtOMTenl7BvH4HnP6rWqZeNR
         gk0j81yiXvkXvsiUOwqfZPjNcc0Qap6CS8mov5yi+HqYwpYRlFzGATPpze/YUOjJGR
         8aYPUwpbFgXNff9IpQkhk7wy5IrEoEPlgFo8XJhyG6actcid2gzzSXzn4nD/GZOdfK
         BBiBd6LQyU3idoMvJMzJ6UWJZCnguo0uDAZ8O4muOANbgdUpHayKYr+mNmPRPfKQHZ
         bSsE60ReLxApoSAfXtg00YmTghq3HbNYS/is+QRrdwMlHVxHjC0DBn74+s3WbtSJih
         CZPPnDOYBVNlg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 10/11] arm64: dts: qcom: sm8450: add cpufreq support
Date:   Wed, 15 Dec 2021 10:04:39 +0530
Message-Id: <20211215043440.605624-11-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215043440.605624-1-vkoul@kernel.org>
References: <20211215043440.605624-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

The change adds a description of a SM8450 cpufreq-epss controller and
references to it from CPU nodes.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8fff4d54933f..56e3e8f771bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -44,6 +44,7 @@ CPU0: cpu@0 {
 			next-level-cache = <&L2_0>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_0: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -61,6 +62,7 @@ CPU1: cpu@100 {
 			next-level-cache = <&L2_100>;
 			power-domains = <&CPU_PD1>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_100: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -75,6 +77,7 @@ CPU2: cpu@200 {
 			next-level-cache = <&L2_200>;
 			power-domains = <&CPU_PD2>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_200: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -89,6 +92,7 @@ CPU3: cpu@300 {
 			next-level-cache = <&L2_300>;
 			power-domains = <&CPU_PD3>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_300: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -103,6 +107,7 @@ CPU4: cpu@400 {
 			next-level-cache = <&L2_400>;
 			power-domains = <&CPU_PD4>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_400: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -117,6 +122,7 @@ CPU5: cpu@500 {
 			next-level-cache = <&L2_500>;
 			power-domains = <&CPU_PD5>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_500: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -132,6 +138,7 @@ CPU6: cpu@600 {
 			next-level-cache = <&L2_600>;
 			power-domains = <&CPU_PD6>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_600: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -146,6 +153,7 @@ CPU7: cpu@700 {
 			next-level-cache = <&L2_700>;
 			power-domains = <&CPU_PD7>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 2>;
 			L2_700: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -867,6 +875,21 @@ rpmhpd_opp_turbo_l1: opp10 {
 			};
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
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8450-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-- 
2.31.1

