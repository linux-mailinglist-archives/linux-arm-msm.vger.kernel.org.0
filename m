Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4449541F88B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 02:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbhJBAP4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 20:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhJBAPz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 20:15:55 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5197DC061775;
        Fri,  1 Oct 2021 17:14:10 -0700 (PDT)
Received: from localhost.localdomain (83.6.167.124.neoplus.adsl.tpnet.pl [83.6.167.124])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 9E3613F3F5;
        Sat,  2 Oct 2021 02:14:07 +0200 (CEST)
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
Subject: [PATCH 4/5] arm64: dts: qcom: sdm845: Add size/address-cells to dsi[01]
Date:   Sat,  2 Oct 2021 02:13:57 +0200
Message-Id: <20211002001358.45920-5-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211002001358.45920-1-konrad.dybcio@somainline.org>
References: <20211002001358.45920-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the aforementioned properties in the SoC DTSI so that everybody doesn't
have to copy that into their device DTs, effectively reducing code
duplication.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts              | 3 ---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi  | 3 ---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 3 ---
 arch/arm64/boot/dts/qcom/sdm845.dtsi                 | 6 ++++++
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 5ad934fcc718..588f899d40f2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -361,9 +361,6 @@ &dsi0 {
 	qcom,dual-dsi-mode;
 	qcom,master-dsi;
 
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	ports {
 		port@1 {
 			endpoint {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index d6ca69e5af71..3e9448ac1912 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -315,9 +315,6 @@ &dsi0 {
 	status = "okay";
 	vdda-supply = <&vdda_mipi_dsi0_1p2>;
 
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	/*
 	 * Both devices use different panels but all other properties
 	 * are common. Compatible line is declared in device dts.
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 1fddf4a6af12..93717749037f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -215,9 +215,6 @@ &dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l26a_1p2>;
 
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	panel@0 {
 		compatible = "tianma,fhd-video";
 		reg = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 18f92e4ba12a..0e64538da7cb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4303,6 +4303,9 @@ dsi0: dsi@ae94000 {
 
 				status = "disabled";
 
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -4372,6 +4375,9 @@ dsi1: dsi@ae96000 {
 
 				status = "disabled";
 
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.33.0

