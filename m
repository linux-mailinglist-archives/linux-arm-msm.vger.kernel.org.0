Return-Path: <linux-arm-msm+bounces-26701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4709389B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0ABB1C20FC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068C0224FD;
	Mon, 22 Jul 2024 07:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="A9BH9qcv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E9D2E3F7;
	Mon, 22 Jul 2024 07:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632274; cv=none; b=fyNZY7miBfnbrFra96REuAzxG5odm4bX1aL9BX4QB+VxGOD2LapsTv2Ao0Ve+IFaHyEN5iIfto8eDebY4Dhppdv3G44/uTm8sVobsvA025WHhojc8/zq02fVm5UdbgGDf9tw9WOsY4Qb57iesTKyHy4aWMc/rcwNR6DaKfSNSwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632274; c=relaxed/simple;
	bh=h8Euqhb97+Bz0/Ll+6/8ichuSZtZkS5o+d22paiug2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKUdiROT7HtHDqnyMEpkx7RZinrQb4qoiirTQYyjp7WBcwdhtD8AigqPCq11zxhJKh4y7n0RljtZesqCTiZJkKE4eFVMRHMzEnzqVKEH0KeHuBaccr/g9Y9HCqjstTJgcUl3iQOWZEZeYBHbRpVhjDNlhZqtpBrn6LRCgB1hF/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=A9BH9qcv; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WSBJw5RvVz9v89;
	Mon, 22 Jul 2024 07:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721632272; bh=h8Euqhb97+Bz0/Ll+6/8ichuSZtZkS5o+d22paiug2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A9BH9qcvCkNh50+eZT4VBVMgf3zQJCZtKXM7q6AyvrLzPaqwhQTeyZdsrU9U6d1n+
	 BzXtgXOzRl+FrFtNZ9WOCETZQuhSnB3xqURR/mzHmtt+rJx/FhWiZ4Ptp+kNXMgzJg
	 Eoyz8R+VbXe9f2AqWx0SHJxj1huxynDdqPOHkl6Y=
X-Riseup-User-ID: 1B349F001B19F7B62335CA1E7204DAFB91F54665BCE2597B92627E4B1D653422
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBJs6Sm0zJmqy;
	Mon, 22 Jul 2024 07:11:09 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 22 Jul 2024 14:10:13 +0700
Subject: [PATCH 03/12] arm64: dts: qcom: sm6115-pro1x: Add Goodix
 Touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-qx1050-feature-expansion-v1-3-c4d486435b96@riseup.net>
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
In-Reply-To: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

The Fxtec Pro1X touchscreen uses Goodix GT9286 chip.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 49 +++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 43b4bee72dd8..d91d31646b29 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -62,6 +62,20 @@ key-volume-up {
 			wakeup-source;
 		};
 	};
+
+	ts_vdd_supply: ts-vdd-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "ts_vdd_supply";
+		gpio = <&pca9534 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	ts_vddio_supply: ts-vddio-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "ts_vddio_supply";
+		gpio = <&pca9534 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &dispcc {
@@ -86,6 +100,27 @@ pca9534: gpio@21 {
 	};
 };
 
+&i2c2 {
+	status = "okay";
+	/* Clock frequency was not specified downstream, let's park it to 100 KHz */
+	clock-frequency = <100000>;
+
+	touchscreen@14 {
+		compatible = "goodix,gt9286";
+		reg = <0x14>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_n>, <&ts_rst_n>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <80 IRQ_TYPE_LEVEL_LOW>;
+
+		irq-gpios = <&tlmm 80 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 71 GPIO_ACTIVE_HIGH>;
+		AVDD28-supply = <&ts_vdd_supply>;
+		VDDIO-supply = <&ts_vddio_supply>;
+	};
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -262,6 +297,20 @@ key_camera_n: key-camera-n {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	ts_int_n: ts-int-n {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_rst_n: ts-rst-n {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &ufs_mem_hc {

-- 
2.45.2


