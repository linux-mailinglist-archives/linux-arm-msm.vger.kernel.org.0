Return-Path: <linux-arm-msm+bounces-73413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF30AB563D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 01:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66F23189D9EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 23:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A092D1936;
	Sat, 13 Sep 2025 23:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="bWXKDYma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1222D12EA;
	Sat, 13 Sep 2025 23:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757807865; cv=none; b=r2gct4KZYBVXO6Dm2CkEGuVWUJQhOhzCIBO8jal44YNEe1nNOJ/aHEvq3dGT3m9y69do4JAEPrYjFP8rYqnp1TaN5iXNOBvixjRgi2Oaz0deLnVVTHelPYxPG8RG/vDhlEGvK/3B6+D+tO4azbnjR7sxCRknjJRjkHMT4wLFDfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757807865; c=relaxed/simple;
	bh=Kd+l3u9nbAcBnuKUFmCIOnaGRokA5ArvevoL3S28EF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPuUp6xm6Hw22FF5Y486GpU9yTHmSzMnyje9XfmEj8YcWaozEJNNSdB+N0785iRSQQ3YwZfsa38wxYqzjISAy/vsxPP+K4pUetjt+crT9eLCRLQLCwMdiZqJ5iisp32H8Swml+Ndv5VUUZTXBlerJpQdN8EQpBO8RMRk0XDsJCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=bWXKDYma; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757807862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PUAmkQif1HYkJuXbssoPfl3LYKhkzCmQJn3ynPYfzN4=;
	b=bWXKDYmad8snbGpMpfdHPmtf1wDuMAuASXLlwdnfGKY8ZAkRGrdP4A8YPbdplbMVeX10oj
	MXqvCSSaebxFw00+7vglMd+IrahY76PVk8KcnBF5Zj3PU5aFHFQIkE0OjHJa4+tsz5fteJ
	pZLblL65N/34l+fFvZwNH0F3HgVRpBkuSQYlHr5MT0wek4P1oB+bW+NkfDvr78R+tD2ySW
	3UqUZRdZ0GgJWvKdH60dCcAgcePbKbwFW4Lz/FhACYEV3gCX+8eiYAXsoviQWOVLc5sKHW
	VADCzYOnjCnkXLiDxapK94ZtS1G84/NDL7Ohoq930dvvA1wgti9twHgpkknAvQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 13 Sep 2025 16:56:40 -0700
Subject: [PATCH 07/11] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-judyln-dts-v1-7-23b4b7790dce@postmarketos.org>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
In-Reply-To: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757807839; l=1837;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=Kd+l3u9nbAcBnuKUFmCIOnaGRokA5ArvevoL3S28EF4=;
 b=CbNdfZa0thJ3klsswALoSIo63CtWHZV8w1uYmb2h38q3aKH6CoKe4842QE+ophbVabLM4Y19M
 Xh1oCfJGhguCUHtfQFKL8oBRG6aYmfFHeZWaIyEDvVmfP+PNduegoxa
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Firmware nodes added for ipa, modem, bluetooth, venus

adsp and cdsp enabled

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 585582ff4e0bbe8c994328278d5e5dd3a280ddb6..cc1c78162eedd50d30a70810ac3790efe6c0492f 100644
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
@@ -483,6 +487,8 @@ zap-shader {
 
 &ipa {
 	qcom,gsi-loader = "modem";
+	memory-region = <&ipa_fw_mem>;
+
 	status = "okay";
 };
 
@@ -683,6 +689,10 @@ &uart9 {
 	status = "okay";
 };
 
+&venus {
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
 	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index fae85d4c1520e044d8166bb22a8f5762fda250b2..1596a3408659323d60f1b7c395098ed628782dfa 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -70,6 +70,10 @@ zap-shader {
 	};
 };
 
+&ipa {
+	firmware-name = "qcom/sdm845/judyln/ipa_fws.mbn";
+};
+
 &mss_pil {
 	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
 };
@@ -190,3 +194,7 @@ bluetooth {
 		firmware-name = "judyln/crnv21.bin";
 	};
 };
+
+&venus {
+	firmware-name = "qcom/sdm845/judyln/venus.mbn";
+};

-- 
2.51.0


