Return-Path: <linux-arm-msm+bounces-26992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A99093BA4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 03:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C467F1F222E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 01:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83246FB8;
	Thu, 25 Jul 2024 01:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="JBfugMC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BE518633;
	Thu, 25 Jul 2024 01:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721871800; cv=none; b=t0IKsUZouaBx1MTgkUVqwp5SQwnZE8OCqKiGUK7yC7Kqrei2i3xLI6c2Jlt8R683/P9iVD8D5oFEBVs7tt+jmFqQa69nz5wjqPJZT4HS03Krvr5ppyY3pgUyEUPZt7ORUAKCcaYS9G9sHvW/bQxfVxMR8LH0uaMQylIsIJethPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721871800; c=relaxed/simple;
	bh=6lCJaPJ40pomLk/cYW5r7d9xZfOrojS5vHQnJusUVQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NykSOuft32JiaOLWWqskslUmPqZci/hGkeVF6EYtTii6wE7dXOs+oqnwKUZED4wmURPvXf4mfSoRnvf6Vicd46B92jqR8W9PEV8F+xQuKdACWQmofubJRDQMOOI5u0d6e326zBa3WP20D/GEGl/AVOf1+hP4Pit9lE4YMfJQwTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=JBfugMC6; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WTtvB46l2z9t9m;
	Thu, 25 Jul 2024 01:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721871798; bh=6lCJaPJ40pomLk/cYW5r7d9xZfOrojS5vHQnJusUVQo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JBfugMC6AE07fWqda1QSTjmINBTc9/L00XHnaG45o2zwwtypS2A5yWU/jZfSSWgw5
	 TYg1x3STMk47RpwiNuiQYw/jRWdFwEl0qEg2h6bGBk/kCd4qGH+CesJiZzpe+uV57k
	 0AnN4n+8fh3Ie+OsPyMyiw9J1nE+y5CVhRp3uALU=
X-Riseup-User-ID: 14AF3757B28CCC9951E09770AF72B1EF77C32B91F2A84FCF600013BD49F64F47
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WTtv75mxZzJrWZ;
	Thu, 25 Jul 2024 01:43:15 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Thu, 25 Jul 2024 08:42:12 +0700
Subject: [PATCH v2 03/11] arm64: dts: qcom: sm6115-pro1x: Add Goodix
 Touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-qx1050-feature-expansion-v2-3-5fac4bbd946f@riseup.net>
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
In-Reply-To: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
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
index 993e7cfffae2..3be70beb9562 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -63,6 +63,20 @@ key-volume-up {
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
@@ -87,6 +101,27 @@ pca9534: gpio@21 {
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
+
+		interrupts-extended = <&tlmm 80 IRQ_TYPE_LEVEL_LOW>;
+
+		irq-gpios = <&tlmm 80 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 71 GPIO_ACTIVE_HIGH>;
+		AVDD28-supply = <&ts_vdd_supply>;
+		VDDIO-supply = <&ts_vddio_supply>;
+
+		pinctrl-0 = <&ts_int_n>, <&ts_rst_n>;
+		pinctrl-names = "default";
+	};
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -263,6 +298,20 @@ key_camera_n: key-camera-n {
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


