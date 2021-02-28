Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E75327264
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Feb 2021 14:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhB1NKO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Feb 2021 08:10:14 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:41985 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhB1NKJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Feb 2021 08:10:09 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 2C2DB1F568;
        Sun, 28 Feb 2021 14:08:54 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] arm64: dts: qcom: msm8996: Disable Venus by default
Date:   Sun, 28 Feb 2021 14:08:25 +0100
Message-Id: <20210228130831.203765-7-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228130831.203765-1-konrad.dybcio@somainline.org>
References: <20210228130831.203765-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Disable Venus by default to allow booting without closed firmware and
enable it on the boards that didn't previously disable it. This commit
brings no functional difference.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts | 4 ++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 4 ++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 63c7cd0ad2ee..e6ef76971c31 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -1093,6 +1093,10 @@ &usb3phy {
 
 };
 
+&venus {
+	status = "okay";
+};
+
 &wcd9335 {
 	clock-names = "mclk", "slimbus";
 	clocks = <&div1_mclk>,
diff --git a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
index c6d7c6250de4..8c7a27e972b7 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
@@ -391,3 +391,7 @@ &ufsphy {
 	vdda-phy-max-microamp = <18380>;
 	vdda-pll-max-microamp = <9440>;
 };
+
+&venus {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index e0f042cf8295..d557fd5b9f82 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1624,7 +1624,7 @@ adreno_smmu: iommu@b40000 {
 			power-domains = <&mmcc GPU_GDSC>;
 		};
 
-		video-codec@c00000 {
+		venus: video-codec@c00000 {
 			compatible = "qcom,msm8996-venus";
 			reg = <0x00c00000 0xff000>;
 			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
@@ -1655,7 +1655,7 @@ video-codec@c00000 {
 				 <&venus_smmu 0x2d>,
 				 <&venus_smmu 0x31>;
 			memory-region = <&venus_region>;
-			status = "okay";
+			status = "disabled";
 
 			video-decoder {
 				compatible = "venus-decoder";
-- 
2.30.1

