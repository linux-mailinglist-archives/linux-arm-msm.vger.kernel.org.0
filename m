Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4FF41F886
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 02:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbhJBAPy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 20:15:54 -0400
Received: from m-r2.th.seeweb.it ([5.144.164.171]:44183 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbhJBAPx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 20:15:53 -0400
Received: from localhost.localdomain (83.6.167.124.neoplus.adsl.tpnet.pl [83.6.167.124])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 75E9F3F3F1;
        Sat,  2 Oct 2021 02:14:06 +0200 (CEST)
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
Subject: [PATCH 3/5] arm64: dts: qcom: sdm845: Don't disable MDP explicitly
Date:   Sat,  2 Oct 2021 02:13:56 +0200
Message-Id: <20211002001358.45920-4-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211002001358.45920-1-konrad.dybcio@somainline.org>
References: <20211002001358.45920-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DPU/MDSS is borderline useless without MDP, so disabling
both of them makes little sense. With this change, enabling
mdss will be enough.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi           | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts              | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi  | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 4 ----
 arch/arm64/boot/dts/qcom/sdm845.dtsi                 | 2 --
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ----
 7 files changed, 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 1f8a26f36f2e..0251afc7f7c6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -637,10 +637,6 @@ &mdss {
 	status = "okay";
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 /*
  * Cheza fw does not properly program the GPU aperture to allow the
  * GPU to update the SMMU pagetables for context switches.  Work
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 2d5533dd4ec2..2755cc8525fa 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -485,10 +485,6 @@ &mdss {
 	status = "okay";
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index bccc90a469ab..5ad934fcc718 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -466,10 +466,6 @@ &mdss {
 	status = "okay";
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 2f8942542788..d6ca69e5af71 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -421,10 +421,6 @@ &mdss {
 	status = "okay";
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 /* Modem/wifi*/
 &mss_pil {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 51cfe6f31bec..1fddf4a6af12 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -290,10 +290,6 @@ &mdss {
 	status = "okay";
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mdt";
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 970e92188503..18f92e4ba12a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4228,8 +4228,6 @@ mdss_mdp: mdp@ae01000 {
 				interrupt-parent = <&mdss>;
 				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
 
-				status = "disabled";
-
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 6e084f14289a..164d2a93a30b 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -461,10 +461,6 @@ &mdss {
 	status = "okay";
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 &mss_pil {
 	firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/LENOVO/81JL/qcdsp2850.mbn";
 };
-- 
2.33.0

