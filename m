Return-Path: <linux-arm-msm+bounces-84185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF954C9E89D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B6BB3A8F47
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9642E54BB;
	Wed,  3 Dec 2025 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="pX+aKNnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D022E06EF
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754940; cv=none; b=XHKwmza7EnuWbeR0f3niqds1uIL++TMYe9Lz1Kr2dzXNE3ld5DBCr530wV2tat0jfTa7f/xiEoWtonaxhfgF3CW8vuaBiXpWiCwlqwMRZyNvMoZBBTvzX5qeXdsiIgu9GI2LEUrRd2Ui4AK9NLyr2K3w8LnhfC3JqG7ki97FQ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754940; c=relaxed/simple;
	bh=Bq58Ib5by9mVeEI0tNfI5tq/1v40vKDcrJk7dh7Xku4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fqVI5MOd02U8wA9lpVKoLdo0ly6MXkBkxFldrtnGg1y7LBJQIHCGLknAJbcl0tuirMTKorFjVPyKgGRIUvwS7bc3prw0TdGtmA17TPkp0rJAr84nzNtHMuncQrBNBEXsVwbWX/8WQtgd8xHrOp9Vo5Q0l32NBKLkGHdvBF/HmOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=pX+aKNnU; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764754935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GyRxK95eChOXunVlInniVr3+/iwX9+VqXFotKAyLfE8=;
	b=pX+aKNnU0b//hUNoJLRvVnmzjZu6quKwl6DRN7mFOcR+9T9PWMU+dB0SuhN/uaSp9Mse/3
	QLsCOPwU6z2E1Jafm0+aXdJafW9Bar2uWnehP33T9o4bL6ywIbVC2K9mC2f/O4BICWxKq+
	9TlpZU6W1IXkAsc48RNpy9YrlXOMf2VtCoFWNpoeQ9zGlLwbBDWJ8XLr41K4UvDAp2yypa
	2hy/eXu+j0a8RlwXmgE/q2Pbf+SEKVAXL3QgP+ylk5jkXAY9JfATNOCA2qrlhw7bm3Lj+D
	2gFzl7bOZxkDyFwtXq1pxpspjtEbVzy4dEzFCBBgl0aYUC3pW13klXrdH2B/cw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 03 Dec 2025 01:40:51 -0800
Subject: [PATCH v5 02/12] arm64: dts: qcom: sdm845-lg-common: Add uarts and
 Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-judyln-dts-v5-2-80c1ffca8487@postmarketos.org>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
In-Reply-To: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764754921; l=2853;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=Bq58Ib5by9mVeEI0tNfI5tq/1v40vKDcrJk7dh7Xku4=;
 b=L9/QvZYX9up0gLt4+70iOEex3ZtKNyf0ieNz9/QZXpiQZKRcwU808oAqIdks5ceyCIWE1ArQL
 cseai1jWnfSADix35je+HgwU43TB4GbSxM7gEmajCqpZvEgXkk8p99m
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

uart9 is debug serial on USB SBU1/2

UART RX is SBU1 and UART TX is SBU2 of the USB-C port).
1.8V Logic Level
Tested using pololu usb07a https://www.pololu.com/product/2585
and CH340 USB-UART

uart6 is bluetooth

Bluetooth: hci0: setting up wcn399x
Bluetooth: hci0: QCA Product ID   :0x0000000a
Bluetooth: hci0: QCA SOC Version  :0x40010214
Bluetooth: hci0: QCA ROM Version  :0x00000201
Bluetooth: hci0: QCA Patch Version:0x00000001
Bluetooth: hci0: QCA controller version 0x02140201
Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
Bluetooth: hci0: QCA Downloading qca/judyln/crnv21.bin
Bluetooth: hci0: QCA setup on UART is completed

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 39 ++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  8 ++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index b8ab64a8de1c..cbd57eee6ffc 100644
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
@@ -540,6 +547,36 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
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
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
 
@@ -597,6 +634,4 @@ &wifi {
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
 	qcom,snoc-host-cap-skip-quirk;
-
-	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 09bfcef42402..e530a08f5e27 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -43,6 +43,14 @@ &adsp_pas {
 	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
 };
 
+&bluetooth {
+	/*
+	 * This path is relative to the qca/
+	 * subdir under lib/firmware.
+	 */
+	firmware-name = "judyln/crnv21.bin";
+};
+
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
 };

-- 
2.52.0


