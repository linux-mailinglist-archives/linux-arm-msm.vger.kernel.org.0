Return-Path: <linux-arm-msm+bounces-83190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 052E2C83E8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5C03C3418B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A427D2D9EFC;
	Tue, 25 Nov 2025 08:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="MaWRH351"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA212D97B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058389; cv=none; b=JbRE7eZVuDQgrbO1rc4iTkrMElwAtov3si9P8bcNfOo2iQymBZyWTVzGmfdaxmAFOCUcIbPhbEtLP2RK1WVlq25o5Nyq32rvJKGYlL+Oj0L7H5cKFQY0urOPY/6MdcrT+otqTq6wLSMUFOuyPwLmIuGKnQ9g5rTsuP0yNg9ymm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058389; c=relaxed/simple;
	bh=Bq58Ib5by9mVeEI0tNfI5tq/1v40vKDcrJk7dh7Xku4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1SdSnOlNsCs5w1ToitOr7umV7MaUOPaHXfXVm9UwrJxeztCkmZ+iH1m8a8Tyu3/SSVKZYtS6c13/h+VPyXBrlzzstSO+WhIYt8pWsHXXZWugi9WhGfAaWhVss2/vGWHXZeJhm65kqFb9IbMlgdt2DKcpYm56FMx8shePWMDjAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=MaWRH351; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GyRxK95eChOXunVlInniVr3+/iwX9+VqXFotKAyLfE8=;
	b=MaWRH351m7UVJTj6SRUrsPTLCiGq2m6W2cotR8NeYjuZuENT/fwpY0qAk9+UScIS9rhC7H
	L6oz+Ra/uQzaSeYNWKtrXhD+ZteLK4ZQGzlBNZIWiIR8L9nvm7BMabVY3L/WD9O6X5Giul
	4cZCarG6kJ2XpjYKvPA9A888xcuFKqpsgdrv9a9c/y0WMSi0TaCm2kXo+lp50kUE8+NljW
	8oTSyoABSLC62n6br1zvwm1ZJac5vefZdDY3qhHv4Y0zuZMCCIMmaEfV3RG68IxDgCKbzA
	avj4BSOBIKmv27lBE9HWpdY6k9SBTXhEC6w6liHbwx0pONi4wri3aqtDrGLYDw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:32 -0800
Subject: [PATCH v4 02/12] arm64: dts: qcom: sdm845-lg-common: Add uarts and
 Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-2-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=2853;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=Bq58Ib5by9mVeEI0tNfI5tq/1v40vKDcrJk7dh7Xku4=;
 b=+wrqpKtWtuUW2DygmSvTYD2vfm/TdC+Yy286f43iOSB3eTKb2t91YoqWnUtn4JiULxTJ3YI90
 WPvITKQOCBsB/pPk2Nh1Y/fjdCXomiuLPQ52u3i45RgqOSnF+IEYsOM
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


