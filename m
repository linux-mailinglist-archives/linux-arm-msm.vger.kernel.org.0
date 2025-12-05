Return-Path: <linux-arm-msm+bounces-84474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD616CA7B11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BFFA31124BD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4498633BBC0;
	Fri,  5 Dec 2025 13:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPEEmfdR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F9E33B958;
	Fri,  5 Dec 2025 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764939656; cv=none; b=LiOF9WS5mpM9SPllkmz+QTWCRMlwWdLU/c6C2nrIG2GTrtbf2vIR+78kSwXl1uk0bPORhG2I4tayS2LCDEhNb9FJatNTqbtFMvd97xXuORSYCoCvK4azpiZCcn6ddjZCevyHPCyimrcK6daC7pL31eU0V4WNiubDNIvAx1QeJaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764939656; c=relaxed/simple;
	bh=xGaM9lUhsd3cqaASlyXElunCDf1uELqRnXI/7Jc8VeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ef9YMfwDXveuDTCZ/T5KbkCusH/k7vNk0IDsPf/jCdOpFL13Qv+ElqWg7y19r5KJfutPKA1RP/PpaAR2CrGYPMItC22b7FTBMYviA75zHCy8AqKMyN8lcowK36zVo6k8Fl2E14g5KFTn0cf1a++kSDtihv5u4P9JmVo3IgIXERA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPEEmfdR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98D7AC19425;
	Fri,  5 Dec 2025 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764939655;
	bh=xGaM9lUhsd3cqaASlyXElunCDf1uELqRnXI/7Jc8VeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PPEEmfdRKCZHstfibwMvCRFIloKvE+j010c92F8sPwPMsUDq7NH7U+mejAk65uuJ3
	 8neSdbMZ683uwuk/LQ9o7wJHtNM1e3f9MHVU5gHJ8ynNovuOY4x0a+rK6SakM56Qto
	 m4nj6LCg+6XQ90cOJnvyGXlDNT5nHmQ9q/k5pgRWWPABpr0r6Ak8wl1rBxKSZWl0p8
	 1aUKHhX18a2h58sifEaYsif2DjI652kC6CSg40iyDDKahMsAQfiMlYT4Rgv0s74uBU
	 RitEAXJd6Fm788gb5Ye8zFm2DkUt6+szRsGD1mv4Ylj39aWuO89ZYjdgcwmplKGcmw
	 T/Xbf7stKF4qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7F7D2F7F2;
	Fri,  5 Dec 2025 13:00:55 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Date: Fri, 05 Dec 2025 22:00:05 +0900
Subject: [PATCH v2 2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Adjust
 firmware paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-slpi-v2-2-dfe0b106cf1a@gmail.com>
References: <20251205-slpi-v2-0-dfe0b106cf1a@gmail.com>
In-Reply-To: <20251205-slpi-v2-0-dfe0b106cf1a@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Robert Eckelmann <longnoserob@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=9gWceQNch+WtUQccnVFGua7dXEEd27z0WmImczxeGCw=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDKNrrd9FzkS+lv7/QbHWE5GmS8rHi64urVLSKG4WERjS
 YbCXVfmjlIWBjEuBlkxRZYdbsd0Ml2XRmzcvb8MZg4rE8gQBi5OAZiIiAHDf1ff/gP7w8xVNqm7
 pshKzWZjm7Ghf+tCo67vq1pLJzSbvGJkmKuas9khztirLpjnxryUH00uL596xUqWJ2x53fKT1c+
 KFwA=
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

From: Robert Eckelmann <longnoserob@gmail.com>

Firmware patht adjusted to include device maker "Xiaomi"

Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
---
 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index cadddcf63ef6..8ce592cabd35 100644
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



