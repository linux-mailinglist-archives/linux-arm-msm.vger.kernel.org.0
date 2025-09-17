Return-Path: <linux-arm-msm+bounces-73833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E754AB7EAE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8338B4E1FC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1EC2690EC;
	Wed, 17 Sep 2025 01:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Br0p+H6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0305261B8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 01:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071459; cv=none; b=pEZqW8Ea7f40+Tjbp6EnpzoyxjVMbipfJwQwEfM0uqtehjExzapyb5WFmVWW5wIBijVWFCDun7AgOHhIVaR4Uy7XLkP5d6cCTQDr1255wD97UhDcZgN2a0xFO2LgrJYHB03xSLE3gG/bACoeeTzWaGyw7kr1VWe3NSP24xDNNrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071459; c=relaxed/simple;
	bh=MW7Zt0iXVXO8xBWph1Le9slDXbvYEFQUVxcY2SgzFBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i86wCVns4oogdOIxmHwCYOjRRScXD9aVp8sly6YVeFRJsBFaNEtYI2GUVKgVJNbLaqp2rh2PyWywcTDPIPUgGghDT2+CVSBeckqTtTKsjxuOzIZ+WAlWzVXNv0Cd8Uk3aTkmRxrmcT/mnHhWEKKr0hx4m3izd3f6rAwdNdum65k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Br0p+H6R; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758071456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HBKfgSyk7qbQDjn0PK37gt147MYbv2+Cz+tfg9NOFoA=;
	b=Br0p+H6RZ69v3qrkPUN6xCt+UVgaY5lJpWvui93/h8/hRgehoZ0NQM0z8moM68KxgkWohs
	mBztK2DNRPMR+VIdKhGENtDiTNcuRefa5g7BSvDznWOGpBjKirxITVeRHNkOXKuspNf+n1
	P+738FHGsfcCKZC6sgMIUVUdRx6YIH/vrfBM2bReJenT0e6wuJVEqY4inJmkpsG+jc+SjT
	S90q75DnTmj+R/2yQE+RH8yQyvhs8BBvmgjHM2yTe5NuWLAP7JkMmhmJWar05M0psafWEy
	+rnrfJKHY/RLqNI282iTf3gRQPh1U2yqxShatsxJ2Zm/TfnKpLOdR24vdCnBRQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 16 Sep 2025 18:09:52 -0700
Subject: [PATCH v2 06/13] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-judyln-dts-v2-6-5e16e60263af@postmarketos.org>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
In-Reply-To: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758071415; l=2681;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=MW7Zt0iXVXO8xBWph1Le9slDXbvYEFQUVxcY2SgzFBc=;
 b=VavDTnMkxayaGcygvOYp2tn/O1hR6x34NOVD8npBjCHCDiiWGUjKYESnax3h6MT2F00akDqPV
 hxI0mElLzRXC/QvtjJ+iLTBVqs5dTlcmauEQfkSaCmjV1Tz+l3lDUNd
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Add paths for Qualcomm firmware, including:
ipa, modem, bluetooth, venus, gpu

Enable adsp and cdsp nodes since their firmware is present

GPU and bluetooth are confirmed working, others may need more
testing/fixes

But regardless they will need the firmware paths specified here
and firmware added upstream before they will work, so might as well
get started on it now.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 16 ++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index ea4de09b549d1d436897ea6059d27556041a6b68..44a76e047c8faf71959ebf9a5b278e1f66000087 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -173,6 +173,10 @@ &adsp_pas {
 	status = "okay";
 };
 
+&cdsp_pas {
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8998-rpmh-regulators";
@@ -479,6 +483,8 @@ zap-shader {
 
 &ipa {
 	qcom,gsi-loader = "modem";
+	memory-region = <&ipa_fw_mem>;
+
 	status = "okay";
 };
 
@@ -668,3 +674,7 @@ bluetooth {
 &uart9 {
 	status = "okay";
 };
+
+&venus {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 8077a9fb0dc28237fc6ac0b70c8ef45a0d72876d..7d05698f1225d951804752b6fc062c1b4f583516 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -48,19 +48,23 @@ battery: battery {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/adsp.mbn";
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/cdsp.mbn";
 };
 
 &gpu {
 	zap-shader {
-		firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
+		firmware-name = "qcom/sdm845/LG/judyln/a630_zap.mbn";
 	};
 };
 
+&ipa {
+	firmware-name = "qcom/sdm845/LG/judyln/ipa_fws.mbn";
+};
+
 &mdss {
 	status = "okay";
 };
@@ -101,7 +105,7 @@ &mdss_dsi0_out {
 };
 
 &mss_pil {
-	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/mba.mbn", "qcom/sdm845/LG/judyln/modem.mbn";
 };
 
 &pmi8998_charger {
@@ -156,3 +160,7 @@ bluetooth {
 		firmware-name = "judyln/crnv21.bin";
 	};
 };
+
+&venus {
+	firmware-name = "qcom/sdm845/LG/judyln/venus.mbn";
+};

-- 
2.51.0


