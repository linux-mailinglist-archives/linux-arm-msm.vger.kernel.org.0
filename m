Return-Path: <linux-arm-msm+bounces-75450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB74BA7F41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE94217E8B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3077221FAC;
	Mon, 29 Sep 2025 05:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="iGpV5WF4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C40221271
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122343; cv=none; b=RQa0ln+nRbE+NeHsE7zyZqG/4aFvLZ49BgkSvhBEBjbCGCzyJUA+ZPvbzibYx3kwYn9jM2M8rNkE4Y+t6wtY34UGeRQExQcrV2WEmDsRGt25vtnrbQOW8DTYOq8diZ4SHxyvt+rBSGGWxZcF6cOx0MLydiJjmxgT5p9iAzYFqDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122343; c=relaxed/simple;
	bh=XctDP3M9KuQCNZOO5PgA73uOmOKIQIp6dP6sZbSBeG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uOwB4mfelHAhEF/ru+DV0czSSpry2HgxwMcaK3+vvN5VSuuqIZhexKknNZBGQTDzXIAwoMkU4IzuE3S4n9hB92qbwRQO10Cjti+yDtt1S1iGMh0JMEvTwTd4hhm/bU/OOpKrTiIG0Amldv9wfk0+qqZEJvWOQFEb9/82HYhGSdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=iGpV5WF4; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759122339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ypToI6YCkTeqo2J/64iLzp7ov/QktnIMaWCVBshdiQ=;
	b=iGpV5WF47CYmp4tpZhUUXQroyit/LRoeUugjWXQnLgjyW7nBxjOYPvEXa7SBraICcK69tg
	7/MQuyIWFbF327Adz3TydEkUkpEtMP22WifLRExy9w/PKpY+vCz0mMT6RA+oW8eRdqTT5a
	e36Jw4SHfjRMGMyzLsqbl/OCAGHZovDUd3E83GVmI04wsZTvzf0ZUgCfM+USRqtiuNSih9
	ZrT+nxFGVrFUxY8ZAdypeUUYhjgxgOvho3hyjXXOX96Y2mACAzr7/4HBShVrW/qnhKtr7H
	0sMuHFaQtedB9iaIqYABjaHOJDQfNqZMZxNt6luTTxMzceSOkSmc3chAMocxAQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 28 Sep 2025 22:05:25 -0700
Subject: [PATCH v3 02/11] arm64: dts: qcom: sdm845-lg-common: Add uarts and
 Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-judyln-dts-v3-2-b14cf9e9a928@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759122330; l=2306;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=XctDP3M9KuQCNZOO5PgA73uOmOKIQIp6dP6sZbSBeG0=;
 b=eaIWJk3jNr3Cf+IJdmLZrlGLTbArZb5xEPBwfuPwvo99FxhWukGOwdDF9f/F7aqrQFbN5G6PY
 ADOEebiK7XXDyKUXEj9tM2eqM0XJOu9xaOQwZjxl9sbMzJNnA/PEitj
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

uart9 is debug serial on USB SBU1/2

UART RX is SBU1 and UART TX is SBU2 of the USB-C port).
1.8V Logic Level
Tested using pololu usb07a https://www.pololu.com/product/2585
and CH340 USB-UART

uart6 is bluetooth

Add bluetooth firmware path

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 45 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  8 +++++
 2 files changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 82d6543835324ed92300c4ed24c51f4b79321f99..4c631df56f262ba9e730f6720abd94d374b14692 100644
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
+	bluetooth: bluetooth {
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
index a12723310c8b630a4961de671ea8b60f1f8b512b..f91578ce7195dc3bfd1ba0a722fb48f950816246 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -66,3 +66,11 @@ thinq_key_default: thinq-key-default-state {
 		bias-pull-up;
 	};
 };
+
+&bluetooth {
+		/*
+		 * This path is relative to the qca/
+		 * subdir under lib/firmware.
+		 */
+		firmware-name = "judyln/crnv21.bin";
+};

-- 
2.51.0


