Return-Path: <linux-arm-msm+bounces-73829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA8B7ED64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F554524C52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A499B22F764;
	Wed, 17 Sep 2025 01:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="C91EPZT/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E7021D596
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 01:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071434; cv=none; b=LtsiuxCeqDPPHUElj0SasjIoSVZ18eDl2hQ06xFAoWe1g5vyjTVLs+fyx4kL2vTykCvU90ScUZY7kLThNMxgbWFgA2NmGq58rekQ5RO4sT5flxna6Y5RU38ntKsVvDJ+wQ4oobH4P7z+91LhgIVaoIkifVjCqNqGe7FQrVzTQiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071434; c=relaxed/simple;
	bh=PNCFzd1VbBHKRGs4QtYe5HT+Dt7SzfVU7/ig+WLOVW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uKbO+bqpYI76982ZEDlt0SVYNwi6Cj6vcANc3ZSXRN5Pn8QsQWrjFP5WBRy09lBuitfk1jkCN/Ldn/AWp8SkVkgQIqHa8sr5ZvNn1OWPY+AeW4NS0gpCnjG+TkojrvHt0snjNILcQ6Mttt8lF98ASVNqwY9d8HxSUWEB5TlSe+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=C91EPZT/; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758071430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ealdVdLZ+IyANpbv1SBjZZRQLnL41Am0TGbFhXY6ok8=;
	b=C91EPZT/3FIktJojIUjv1fgd9z7waBWij3DVtT6rQtF74/zSWYdRJbZrdQpuUquSKtZL3U
	Tjn+zPpXgTn83RsoNUZvmEBQaxBVwfRJxgKQA7dzX34hjcuBjUe6VlMKC+siLL/ZJDXUrZ
	1UhgaJyNNHuYz5QSzZUK+i32OyEq++/qf3dNBM2DR8a4JtctDrySCm12x6iVBXb40qSpRE
	U74DJXmvbPCgowMIPXFsVl8cXENKY02FEf3ir+vBYiTfAIebFNH/ODK1ZKQVL6ItSitPCo
	8WLqNpuLtLxgj6/+zEsOyeuiu+N8BNFkMDWuTjN+vER++bATpbQWP5+WLRDB2g==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 16 Sep 2025 18:09:48 -0700
Subject: [PATCH v2 02/13] arm64: dts: qcom: sdm845-lg-common: Add uarts and
 Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-judyln-dts-v2-2-5e16e60263af@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758071415; l=2119;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=PNCFzd1VbBHKRGs4QtYe5HT+Dt7SzfVU7/ig+WLOVW4=;
 b=I1QbhDk9QAI7C/aYzyPjQTVzM9EyFvhnXLlrRKu7kV7VeOuHJn+dxGqK5bgzG/cDxaA+hLBiC
 h6jJco8XgqhBbhm4+0u05HZ1OTWrRvurBrR5qTpA3S69r5uwOBChY1h
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

uart9 is debug serial on USB SBU1/2
uart6 is bluetooth

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 45 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 10 ++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 82d6543835324ed92300c4ed24c51f4b79321f99..911f5e614d0a4a85da61570ce400a85efa08623b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -27,10 +27,17 @@
 /delete-node/ &wlan_msa_mem;
 
 / {
+	aliases {
+		serial0 = &uart9;
+		serial1 = &uart6;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+
+		stdout-path = "serial0:115200n8";
 	};
 
 	reserved-memory {
@@ -595,3 +602,41 @@ &usb_1_qmpphy {
 
 	status = "okay";
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


