Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B37741B502
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242015AbhI1RXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:23:31 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.172]:20403 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242037AbhI1RXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849694;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QIw47FLLOn+KBvt/FSo5366cnFJ0U/sATIyQvR+hj6A=;
    b=gHybHLPlfgeQOSeTFmeXuSovzAuGM70olxrksdve0r2dI8u7I6BpBZxOo2lXfWyF0k
    n7wWX9U5Y3SmkK53I5dUMxaSfQzoU2gJa2+NVC0y3kxxYATLp+YwwX5/JHiQcu2lFlMN
    Ige+Hl9xcfpdEXZP7p0OtuXXl4CDKsCLUjD56iOXHe+PIxOcl0eOdIbUiuF3r/0mPu7S
    pEKi66QMlFIKzfQMOjVavcSLYXcpidKuifYv6KwRbW/woijTn0UZqyedXkqs5i/fPhVz
    p5Ts+6jgq1xsqlFg2w/GpRb78VTFAh85zU4wBY2A2/C/pb/+gsK2PphyQSelvSyrlc8x
    BX/A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLXoBT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:33 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 13/15] arm64: dts: qcom: msm8916: Add CPU ACC and SAW/SPM
Date:   Tue, 28 Sep 2021 19:12:29 +0200
Message-Id: <20210928171231.12766-14-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928171231.12766-1-stephan@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
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

This is necessary for some devices with outdated (signed) firmware
which is missing both PSCI and ARM64 support and can therefore only
boot ARM32 kernels.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
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

