Return-Path: <linux-arm-msm+bounces-86262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FC4CD6EC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 20:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6460B301B2D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 19:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6174A33A9CF;
	Mon, 22 Dec 2025 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8riaZgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2875F3346B2;
	Mon, 22 Dec 2025 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766430342; cv=none; b=M5K45INakApgh3dWfPDaHNrWE8WjY5dhhN3kHgu6jHBJSIPxfEZb5xZlZwUNEDBB9JvaHCPnqcck+g2uOebthblV6JYwlfCJXQKMn7J0CRRG/JTePZBuiLjkYda19JU8IF6qBTZXvp20XRqqAzA8IojwO5TDRQ4cE/m0X50BHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766430342; c=relaxed/simple;
	bh=+hilqDfSk+Dch6hbyd1+mAZm1rL51lrawpW7VUgF+QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lEMtYyyo879mwKxJPW5/c6RsF/i+6KlU2SetfBqxQ0cAcHugxGbaH6MQLbepObzrdhpF5KmGjagWI9RTPp07vfGm/a91p7p+CQoCvDwfwHUr7s+ReejKuR3op9gtQL3rOVolzWxuZB9Kj3NVe1McFYfPL/bBp7pWqq2KjU+7mr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8riaZgN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C38C5C2BC9E;
	Mon, 22 Dec 2025 19:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766430341;
	bh=+hilqDfSk+Dch6hbyd1+mAZm1rL51lrawpW7VUgF+QQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n8riaZgNgDsbduQAzTC9zkvh0i1PtCtCut59s39HKX6OPgLZrU4L8+gTYXqzEa1MV
	 QOJgL45S+V/S6q4fMej9/GXF9X9Nb65uoNU1263FDDTteu/ZvTj7eXomVadhhCYLOm
	 duOmTt2KivridQK0axHHlBUPSo1+FiMWahcq051jXrCxRZd9W5noEvE9bGtjurf6v+
	 l2aidIY+27ANEck10qqFHR5ZhjufQTm4iQFlU7kEmOtrZLTqF+zo/AC/PPmknFb0Gk
	 soqFrHF1AXe7VHtQQ2XpGyfP29bqJ3RDobEkR7mGyxzeIdxXZiYqJKNuc4OAFJrAYA
	 CvEsJgmST5VBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAADDE67818;
	Mon, 22 Dec 2025 19:05:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 22 Dec 2025 20:05:40 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: sdm845-xiaomi-polaris: Update
 firmware paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-oneplus6-new-fw-path-v1-4-a2d366f9eb89@ixit.cz>
References: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
In-Reply-To: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=swo1m05oF0FryQny/dPEvXTSWQ2ExoATh0LQPAguHY8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpSZaEjThxymd2HU+OyUtmH2TtgYnJ2vMbiwLE5
 aq48HzzNGiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUmWhAAKCRBgAj/E00kg
 ckK5EACxhfvbyXN6+MVL71FVM6xZKFmKqSJdit/YydNpJrCUSe2S5egjBO9fKW8myySOKL3y0Wy
 ZJuGx7+gyu1zwP/6bUAfJvjdeQ9EMjr3OW3mAyYJh7bewwaMpIW7J+DPtNJDb/JLwSqz7vNK0lP
 iYen25A8+vCHAXCbmyBo5VHPWG16P13fk4Hc13VRJWiA8oiI4I/DoMQVvInTDQORWyJsWB+dc/q
 e2GgFw5GnyNuCIvLvHtbKAkDb0fm3nYRld5UfOplQ4cTFuYPOuJmo6G51fHY+x79ooug1NzG5lq
 sp5XVvqbOq6pYgdZivJjobku9Q6E92m5p6t0Bs+9qxUcyPAAqZou0R2M1GtiPLsz5bbxMXcgpv6
 lphOF79CadMwyfgdYIysZOTY65QhfieYUhvk0O5TZgOjF9fzSBBZc1/lcs+TN0Dwif4tDV7uTpa
 uq1AmV9L6XTMwnnBB0aRZhUyR8TViiZNMU5isL5F+FAK4dDaFBMkkJ3TNu/zdZKVCp9I+YZCDtm
 W9hOzl4cPKe7mjYDt9NBcK31JEJfwnmwnixeSOj19EspUF7lWqOASA+FrXA1PU3VnOs4o0P7pCh
 KyapvW+DkcXN6TE+7Jnlj1Bg3W7RGB3A6GvB8Fi3Fm5iMi791WjTXdBFdpolRaeJxC0bVkDIhlb
 jUNX93kd1ZM6okw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Conform to the new firmware path scheme.
Includes cosmetic cleanups.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index 30e88ff010a39..a44d6e776c82e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -370,7 +370,8 @@ vreg_smp3c_0p6: smps3 {
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/sdm845/polaris/cdsp.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/polaris/cdsp.mbn";
+
 	status = "okay";
 };
 
@@ -395,7 +396,7 @@ &gpu {
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/sdm845/polaris/a630_zap.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/polaris/a630_zap.mbn";
 };
 
 &ibb {
@@ -410,7 +411,8 @@ &ibb {
 &ipa {
 	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
-	firmware-name = "qcom/sdm845/polaris/ipa_fws.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/polaris/ipa_fws.mbn";
+
 	status = "okay";
 };
 
@@ -502,7 +504,9 @@ &mdss_dsi0_phy {
 };
 
 &mss_pil {
-	firmware-name = "qcom/sdm845/polaris/mba.mbn", "qcom/sdm845/polaris/modem.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/polaris/mba.mbn",
+			"qcom/sdm845/Xiaomi/polaris/modem.mbn";
+
 	status = "okay";
 };
 
@@ -623,7 +627,7 @@ bluetooth {
 		compatible = "qcom,wcn3990-bt";
 
 		/* This path is relative to the qca/ subdir under lib/firmware. */
-		firmware-name = "polaris/crnv21.bin";
+		firmware-name = "Xiaomi/polaris/crnv21.bin";
 
 		vddio-supply = <&vreg_s4a_1p8>;
 		vddxo-supply = <&vreg_l7a_1p8>;
@@ -683,7 +687,8 @@ &ufs_mem_phy {
 };
 
 &venus {
-	firmware-name = "qcom/sdm845/polaris/venus.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/polaris/venus.mbn";
+
 	status = "okay";
 };
 

-- 
2.51.0



