Return-Path: <linux-arm-msm+bounces-73408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C573EB563C7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 01:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A10F7AEB5C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 23:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3811326FA57;
	Sat, 13 Sep 2025 23:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="KRJfiEaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB5A22DF9E
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 23:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757807852; cv=none; b=dSC1DgGZ3PAjJbHfVEk+LGGB1JpiU8bVDHCixza3YGhBGZfWKh66/h0LWf0eX9gHB5LuFgoboY7rJFxIE31Tr1rD50smREDBsD1TdHkFnWURP8WgW/1MmyE7WHHJ6bU6wb/NynQb6smifqBepdsm6/+KX9CMRlDBZBXF5LeaSW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757807852; c=relaxed/simple;
	bh=wAdUAWGgwoJKL4AWuuiWTl+309LMdhz1va3lGo+uyGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FVJYbzQI3fcLFXOjt5IacbpLMwJ7krX7u5FmmLndLuFGv4Szud1jyMnReDtpKUgH6o9/4N4WfhLH+EvAj1pwJi94fXE93JwFsI/wmTy5Ng4zEsPndjCmmL0N6INavNwhNgcUXnWjV3bY+Gsc8eMkhExrFZmhPPczxg56tEk23sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=KRJfiEaF; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757807845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yHJwT687E1RvrfCDz69hQOgqvKNEYbDXWFwNFiU8yd0=;
	b=KRJfiEaF96+oTHmCh4DNqftaiNUnIzTy3qTd2AVg8OfIlb6UfNlBASMRDeBGN+nI9cekwW
	alScedJHoMP9JmrQsXGBsb3aXGKikt0xpRhxCC1XtmGo7Stuvq5f8PxM/o13NeG35nbj/W
	zoVsWhsAmHXXnei8TgpAsuiYk+Vh8Ef01me7PFMLwPWBsdE2z3aBHXxS/UGaY5NoloTjQ+
	+aGbZSrc0Ck07okAPxg+jLUHG8UObuWXlmXk3tLI4q10MBi6hSX6z3n1rDuStKhzl9B/Lf
	+xC6APMM3Rm7aHgjvXda/shM0pXaXj5PbvK11DvAEhOOEBrmPVKd0LlSjh2PXw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 13 Sep 2025 16:56:34 -0700
Subject: [PATCH 01/11] arm64: dts: qcom: sdm845-lg-common: Add uarts and
 Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-judyln-dts-v1-1-23b4b7790dce@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757807839; l=2275;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=wAdUAWGgwoJKL4AWuuiWTl+309LMdhz1va3lGo+uyGs=;
 b=phH31J3FXpTSlV/k4bqwLheUGRPphUYgS/dRUbL11MAkZLBm5svj8kDeA1HG4jX3h7YyXK2qR
 j4rVHMcQFT9BEQ7VDoMU9Cm89Qvo/xtuTgB/V/lXFdMJfTsCwe4odqd
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

uart9 is debug serial on USB SBU1/2
uart6 is bluetooth

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 47 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 10 ++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 99dafc6716e76e25aad0755e6004dc952779689f..1acc418b943443f3ba4f8a8a1cfe2c575da11876 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -31,6 +31,8 @@ chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+
+		stdout-path = "serial0:115200n8";
 	};
 
 	reserved-memory {
@@ -159,6 +161,11 @@ vreg_s4a_1p8: pm8998-smps4-regulator {
 
 		vin-supply = <&vph_pwr>;
 	};
+
+	aliases {
+		serial0 = &uart9;
+		serial1 = &uart6;
+	};
 };
 
 &adsp_pas {
@@ -595,3 +602,43 @@ vol_up_pin_a: vol-up-active-state {
 		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
 	};
 };
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&qup_uart9_rx {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qup_uart9_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&uart6 {
+	pinctrl-0 = <&qup_uart6_4pin>;
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&uart9 {
+	label = "LS-UART1";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index a12723310c8b630a4961de671ea8b60f1f8b512b..49225e4fa80e5f45a36964d5d733dc238e4413f8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -66,3 +66,13 @@ thinq_key_default: thinq-key-default-state {
 		bias-pull-up;
 	};
 };
+
+&uart6 {
+	bluetooth {
+		/*
+		 * This path is relative to the qca/
+		 * subdir under lib/firmware.
+		 */
+		firmware-name = "judyln/crnv21.bin";
+	};
+};

-- 
2.51.0


