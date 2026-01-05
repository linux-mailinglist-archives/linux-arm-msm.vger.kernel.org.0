Return-Path: <linux-arm-msm+bounces-87447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E28CF3E72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAC1F30A6EBC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BAD2566F7;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6nT3vfF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6AB1946BC;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619964; cv=none; b=c5yqLF3yY8jsVkqHz/QG5KTUv32JDm5vg+tXyoqWfQByUI4TBvSJfk66JJT0HJZSFMZCuGJ2Lrr4IWvIrXWoHrdNeaQ9hnu4siJkS9Co9ERhTtbDQrOCLshpktri8545IiCT/Ha5DYkycn1tPkrmUzVL1QL5jXON4qLZskXNTRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619964; c=relaxed/simple;
	bh=vfpSpNaaW8cUkHOIwHaqQBhJA7mgEDJkZhS1CBz1vl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tCQOEDEcbrubZcRYiXIG4jziPwRB8ZvYDKuMPgI+KBd/EFQ28JrvCinyw89uwg1QN9gj80LldbLRq7TV5Sl0mLO+qeRS4aNnX9NPv/jYpFlkqwOXG63uG39H2edZi3G/gNshY5GooQW0psGFBeL26MDaXP1Vo3EEENH0qPDWQpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6nT3vfF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40306C19424;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767619964;
	bh=vfpSpNaaW8cUkHOIwHaqQBhJA7mgEDJkZhS1CBz1vl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f6nT3vfFXDOdmGbH831HRNIkucdXal/u/CqXqYDQrLApuyImpeZsz0AMGMj0/FawN
	 XvFuJZNTS9PICWGhLL4ha3giBs/MUATNEfcXqlldXL+aCVR/jnX/QtPscSXq+n/2Vf
	 c71fH4IlvpD1kj84FlePa2Dy9+fjodP6zIOilKipro7ZPzZkkWl5RoCIuUVH7la0QZ
	 MWkltXP8gQ4yrQP6BhRlUAdnuTd0TdVQfiJrvJ0O9YtLjI0+z/7qc39wCx3puTE43K
	 E05qYlwBfVtOgnNJXg6QZBr3nVGwrq2LXpFup36/J8uBTvAOoj3WO3/S1ypHFeZ8cZ
	 N2j4PvLRyQfvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3017FC79F90;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Date: Mon, 05 Jan 2026 22:31:52 +0900
Subject: [PATCH v4 2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Adjust
 firmware paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-slpi-v4-2-e6e0abfad3a4@gmail.com>
References: <20260105-slpi-v4-0-e6e0abfad3a4@gmail.com>
In-Reply-To: <20260105-slpi-v4-0-e6e0abfad3a4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Robert Eckelmann <longnoserob@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=PpbomeXtgM2jtbrjHMFQcHR/tVjQzbWdgEA3bO+8pi4=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDKj91attj93ecOplZ/9d5/9mtOQG6ISvUJg25PpDZL2p
 Y0eGZ3fO0pZGMS4GGTFFFl2uB3TyXRdGrFx9/4ymDmsTCBDGLg4BWAiQfoM/yNjFh8M3bx471mH
 w3LXpc7Ypno5v1L58etGyPqWl7mOGryMDH3GbQueCqpOEROU6+W/zu6mWllkYXXLUfJ/SceW7Nc
 /mQA=
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

From: Robert Eckelmann <longnoserob@gmail.com>

Firmware patht adjusted to include device maker "Xiaomi"

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
---
 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 57af560e35ce..ab450d44b3f6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -136,7 +136,7 @@ vreg_s4a_1p8: vreg-s4a-1p8 {
 
 &adsp_pas {
 	status = "okay";
-	firmware-name = "qcom/sdm845/beryllium/adsp.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/beryllium/adsp.mbn";
 };
 
 &apps_rsc {
@@ -229,7 +229,7 @@ vreg_l26a_1p2: ldo26 {
 
 &cdsp_pas {
 	status = "okay";
-	firmware-name = "qcom/sdm845/beryllium/cdsp.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/beryllium/cdsp.mbn";
 };
 
 &gcc {
@@ -249,7 +249,7 @@ &gpu {
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/sdm845/beryllium/a630_zap.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/beryllium/a630_zap.mbn";
 };
 
 &ibb {
@@ -308,13 +308,14 @@ &mdss_dsi0_phy {
 
 &mss_pil {
 	status = "okay";
-	firmware-name = "qcom/sdm845/beryllium/mba.mbn", "qcom/sdm845/beryllium/modem.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/beryllium/mba.mbn",
+	"qcom/sdm845/Xiaomi/beryllium/modem.mbn";
 };
 
 &ipa {
 	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
-	firmware-name = "qcom/sdm845/beryllium/ipa_fws.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/beryllium/ipa_fws.mbn";
 	status = "okay";
 };
 
@@ -618,7 +619,7 @@ &usb_1_qmpphy {
 
 &venus {
 	status = "okay";
-	firmware-name = "qcom/sdm845/beryllium/venus.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/beryllium/venus.mbn";
 };
 
 &wcd9340 {

-- 
2.52.0



