Return-Path: <linux-arm-msm+bounces-75455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49459BA7F6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 402FE17F7A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6971230BF8;
	Mon, 29 Sep 2025 05:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="GbDQr1sT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4322D7B6;
	Mon, 29 Sep 2025 05:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122355; cv=none; b=VghL1m3C62WuoPj38FuUTOcMuwLo8ObRhFK4caX5dbXtUVsrWOhuSvqd3h+UmvdKNk1aT/bBqqxGvRoM/90sNy2pYBufS52l7cpE93St6KItOfJXBmGK3OtpTQJjIcz8KM/9n6n6Q5RYAe0viXu8+eswSGbdM4FBOOmttRvNmCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122355; c=relaxed/simple;
	bh=jG5j8DX2/Tr4PfP4C6h38ZHqbGudDrL3l1tq/NmENfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TYRbVFhhb0vjySyJuMdzo77SSi0zJH5xrY03UjKFj07iYT/sxAM5V3/gX2X+/x2+RjnfQ1Fn0W7tw5k2CUD0GN55UNHzH1jgsh9uAlZQZZDbAUmyeYI9jcY4FvCkm1jn43g3pumiL2AoXpBEgGuMg6tG0Tzh9P2DJiM0+fiqo+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=GbDQr1sT; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759122351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CrMSRwY/SYPC+K09rCHXXyMh6dFeKgel+EjOEaCimik=;
	b=GbDQr1sTaIGr3dB/pvvegCR8vuMOakh7Y2yULDCj8833vDkBXtjGrctWVLi9yAUC01UhIY
	v0tHa2a+AzeGdW8xbz38H12YrJBKoOI8bNh3HjRIZhAANkClAihigrkWiHP2QU+QKDkNBQ
	/D/uy820K4umq3+UpGTwUewFA5wtI5ps+IqyMKgsGW/U1hxdgwl86ukRPZdDOKo68YBFaH
	nziA8+UR8QgCaNAiy6vbzdMAX3B7x9F/cXxPpOdE4rpinwtYALy84IqRElex2F0suj4nJ7
	TGXGs+1oKQxdiUZWs6BHlnYNN5eZPUh6EMMbq4bKnY3onC2S642ST04ompvphA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 28 Sep 2025 22:05:29 -0700
Subject: [PATCH v3 06/11] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes, change path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-judyln-dts-v3-6-b14cf9e9a928@postmarketos.org>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
In-Reply-To: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759122330; l=2995;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=jG5j8DX2/Tr4PfP4C6h38ZHqbGudDrL3l1tq/NmENfA=;
 b=mJiyc6PTFB6cFkZjcukIdebHLD0fVsZr/xME0kjEFCxcar+tGJiPGnsSCZwGA3UPWgXoFWE5+
 gj/80Q7MZ6UBMshCOBy/fkKuIItMzr9bJROBeYSzcQc0Sc1Anc7adtp
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

Paths changed to qcom/sdm845/lg/judyln

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 26 +++++++++++++++++---------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index aa338612433f9ac3b07363b79d8a3b8e0eedd98b..0f0a3f471f48e26cc48feb1551093599fcb35d7f 100644
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
 
@@ -668,3 +674,7 @@ bluetooth: bluetooth {
 &uart9 {
 	status = "okay";
 };
+
+&venus {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index f45eb1dfe55c562142092a4239758609fa3f2e47..d60094f864605f7e454693d73efb63b9a099ecad 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -35,19 +35,23 @@ battery: battery {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
+	firmware-name = "qcom/sdm845/lg/judyln/adsp.mbn";
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
+	firmware-name = "qcom/sdm845/lg/judyln/cdsp.mbn";
 };
 
 &gpu {
 	zap-shader {
-		firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
+		firmware-name = "qcom/sdm845/lg/judyln/a630_zap.mbn";
 	};
 };
 
+&ipa {
+	firmware-name = "qcom/sdm845/lg/judyln/ipa_fws.mbn";
+};
+
 &mdss {
 	status = "okay";
 };
@@ -90,7 +94,7 @@ &mdss_dsi0_out {
 };
 
 &mss_pil {
-	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
+	firmware-name = "qcom/sdm845/lg/judyln/mba.mbn", "qcom/sdm845/lg/judyln/modem.mbn";
 };
 
 &pmi8998_charger {
@@ -137,9 +141,13 @@ sde_te_sleep: sde-te-sleep-state {
 };
 
 &bluetooth {
-		/*
-		 * This path is relative to the qca/
-		 * subdir under lib/firmware.
-		 */
-		firmware-name = "judyln/crnv21.bin";
+/*
+ * This path is relative to the qca/
+ * subdir under lib/firmware.
+ */
+	firmware-name = "judyln/crnv21.bin";
+};
+
+&venus {
+	firmware-name = "qcom/sdm845/lg/judyln/venus.mbn";
 };

-- 
2.51.0


