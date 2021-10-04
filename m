Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5760B4218C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237061AbhJDUxS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:53:18 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.103]:9000 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237089AbhJDUxQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:53:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633380680;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=4ep6ai6Ln+jJh0LgouoZwvg0x9S3eHBE38lFwTBns3k=;
    b=m1PZrmuJJaqpQfqSGBIYecbqx2g0LcPB8ncMSb7gt2+GNd1q5qncDKYLtdPdxWPQRU
    map1kbKZXufcx01CRna6zUeC9E8eRZNHRwvy+0Rk3kixvheRVDQLW7FMVAQ70CmAvdkn
    PrcaLX4D7mlAWmCyd/E7yTmVsBE1EGQ6bxqSLEJRD207f6bCgvfANrx8posbV/twPrR+
    jgfQou/zqkLE7S6N1q5kMgMDoMwez4UcYO5ErenAX3pGN2HbJya3ag4SJF3qyJnFaMQu
    +HG702+zKaNMTgA/2Qdcg56NLNTiRzoYyf4QOPvDywd+ciGo82FRrGFmRpBslpFuG5+j
    8eSQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KpJKSq
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:51:19 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 13/15] arm64: dts: qcom: msm8916: Add CPU ACC and SAW/SPM
Date:   Mon,  4 Oct 2021 22:49:53 +0200
Message-Id: <20211004204955.21077-13-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the device tree nodes necessary for SMP bring-up and cpuidle
without PSCI on ARM32. The hardware is typically controlled by the
PSCI implementation in the TrustZone firmware and is therefore marked
as status = "reserved" by default (from the device tree specification):

  "Indicates that the device is operational, but should not be used.
   Typically this is used for devices that are controlled by another
   software component, such as platform firmware."

Since this is part of the MSM8916 SoC it should be added to msm8916.dtsi
but in practice these nodes should only get enabled via an extra include
on ARM32.

This is necessary for some devices with signed firmware which is missing
both ARM64 and PSCI support and can therefore only boot ARM32 kernels.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: None.
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 56 +++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 6b06b387b021..3e7e5c9e6f1b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -124,6 +124,8 @@ CPU0: cpu@0 {
 			#cooling-cells = <2>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
+			qcom,acc = <&cpu0_acc>;
+			qcom,saw = <&cpu0_saw>;
 		};
 
 		CPU1: cpu@1 {
@@ -137,6 +139,8 @@ CPU1: cpu@1 {
 			#cooling-cells = <2>;
 			power-domains = <&CPU_PD1>;
 			power-domain-names = "psci";
+			qcom,acc = <&cpu1_acc>;
+			qcom,saw = <&cpu1_saw>;
 		};
 
 		CPU2: cpu@2 {
@@ -150,6 +154,8 @@ CPU2: cpu@2 {
 			#cooling-cells = <2>;
 			power-domains = <&CPU_PD2>;
 			power-domain-names = "psci";
+			qcom,acc = <&cpu2_acc>;
+			qcom,saw = <&cpu2_saw>;
 		};
 
 		CPU3: cpu@3 {
@@ -163,6 +169,8 @@ CPU3: cpu@3 {
 			#cooling-cells = <2>;
 			power-domains = <&CPU_PD3>;
 			power-domain-names = "psci";
+			qcom,acc = <&cpu3_acc>;
+			qcom,saw = <&cpu3_saw>;
 		};
 
 		L2_0: l2-cache {
@@ -1877,6 +1885,54 @@ frame@b028000 {
 				status = "disabled";
 			};
 		};
+
+		cpu0_acc: power-manager@b088000 {
+			compatible = "qcom,msm8916-acc";
+			reg = <0x0b088000 0x1000>;
+			status = "reserved"; /* Controlled by PSCI firmware */
+		};
+
+		cpu0_saw: power-manager@b089000 {
+			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b089000 0x1000>;
+			status = "reserved"; /* Controlled by PSCI firmware */
+		};
+
+		cpu1_acc: power-manager@b098000 {
+			compatible = "qcom,msm8916-acc";
+			reg = <0x0b098000 0x1000>;
+			status = "reserved"; /* Controlled by PSCI firmware */
+		};
+
+		cpu1_saw: power-manager@b099000 {
+			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b099000 0x1000>;
+			status = "reserved"; /* Controlled by PSCI firmware */
+		};
+
+		cpu2_acc: power-manager@b0a8000 {
+			compatible = "qcom,msm8916-acc";
+			reg = <0x0b0a8000 0x1000>;
+			status = "reserved"; /* Controlled by PSCI firmware */
+		};
+
+		cpu2_saw: power-manager@b0a9000 {
+			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b0a9000 0x1000>;
+			status = "reserved"; /* Controlled by PSCI firmware */
+		};
+
+		cpu3_acc: power-manager@b0b8000 {
+			compatible = "qcom,msm8916-acc";
+			reg = <0x0b0b8000 0x1000>;
+			status = "reserved"; /* Controlled by PSCI firmware */
+		};
+
+		cpu3_saw: power-manager@b0b9000 {
+			compatible = "qcom,msm8916-saw2-v3.0-cpu", "qcom,saw2";
+			reg = <0x0b0b9000 0x1000>;
+			status = "reserved"; /* Controlled by PSCI firmware */
+		};
 	};
 
 	thermal-zones {
-- 
2.33.0

