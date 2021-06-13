Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF923A5881
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jun 2021 14:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhFMMyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Jun 2021 08:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbhFMMyU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Jun 2021 08:54:20 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1EBC061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jun 2021 05:52:19 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 6035C1F5EB;
        Sun, 13 Jun 2021 14:52:14 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8[12]50-pm8150: Move RESIN to pm8150 dtsi
Date:   Sun, 13 Jun 2021 14:48:22 +0200
Message-Id: <20210613124822.124039-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's not worth duplicating the same node over and over and over and over again,
so let's keep the common bits in the pm8150 DTSI, making only changing the
status and keycode necessary.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi    |  9 +++++++++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 18 +++++++-----------
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 18 +++++++-----------
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 20 ++++++++------------
 4 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index 3b5e80dce5d2..7d5a35f52df1 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -59,6 +59,15 @@ pon_pwrkey: pwrkey {
 
 				status = "disabled";
 			};
+
+			pon_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 0x1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+
+				status = "disabled";
+			};
 		};
 
 		pm8150_temp: temp-alarm@2400 {
diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 50ee3bb97325..335aa0753fc0 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -362,18 +362,14 @@ &gpu {
 	status = "okay";
 };
 
-&pon {
-	pwrkey {
-		status = "okay";
-	};
+&pon_pwrkey {
+	status = "okay";
+};
 
-	resin {
-		compatible = "qcom,pm8941-resin";
-		interrupts = <0x0 0x8 0x1 IRQ_TYPE_EDGE_BOTH>;
-		debounce = <15625>;
-		bias-pull-up;
-		linux,code = <KEY_VOLUMEDOWN>;
-	};
+&pon_resin {
+	status = "okay";
+
+	linux,code = <KEY_VOLUMEDOWN>;
 };
 
 &qupv3_id_1 {
diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 7de54b2e497e..53edf7541169 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -357,18 +357,14 @@ &gpu {
 	status = "okay";
 };
 
-&pon {
-	pwrkey {
-		status = "okay";
-	};
+&pon_pwrkey {
+	status = "okay";
+};
 
-	resin {
-		compatible = "qcom,pm8941-resin";
-		interrupts = <0x0 0x8 0x1 IRQ_TYPE_EDGE_BOTH>;
-		debounce = <15625>;
-		bias-pull-up;
-		linux,code = <KEY_VOLUMEDOWN>;
-	};
+&pon_resin {
+	status = "okay";
+
+	linux,code = <KEY_VOLUMEDOWN>;
 };
 
 &qupv3_id_1 {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 397359ee2f85..e911a254aa0b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -373,22 +373,18 @@ &gpu {
 	status = "okay";
 };
 
-&qupv3_id_1 {
+&pon_pwrkey {
 	status = "okay";
 };
 
-&pon {
-	pwrkey {
-		status = "okay";
-	};
+&pon_resin {
+	status = "okay";
 
-	resin {
-		compatible = "qcom,pm8941-resin";
-		interrupts = <0x0 0x8 0x1 IRQ_TYPE_EDGE_BOTH>;
-		debounce = <15625>;
-		bias-pull-up;
-		linux,code = <KEY_VOLUMEDOWN>;
-	};
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
+&qupv3_id_1 {
+	status = "okay";
 };
 
 &tlmm {
-- 
2.32.0

