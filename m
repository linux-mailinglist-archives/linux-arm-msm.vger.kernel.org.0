Return-Path: <linux-arm-msm+bounces-27478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366A94266A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E3812836B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBB816B390;
	Wed, 31 Jul 2024 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="ZERhdFPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503EA1662E4;
	Wed, 31 Jul 2024 06:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406767; cv=none; b=UlslqpLaa8J8e3JSl605CZkJzWHoz6x0sqSnJZdEtO/StwqAsYIcptgpC4LKq3XrrlPNxvASefhVMV9I1Ja72Df6QwYjaJ9hXfC7LDIH3f86vHP2vPy6v57PK20cuJMtkO+m+kggbi+YxH6nS7GZU4Avhxn+pi0flkB3a4eTdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406767; c=relaxed/simple;
	bh=cUSGKsIFxCyeNPbg5c8vgwhFGGNRrlqC8mF33tDfnFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ug7EATZTgJSUCD3UMerWjAHK+FKv4uC59pc8xh2cG+vuiw7RCi0uCdxv27CrGgo1+7S0qLn7C4Fma0TqtX0Ll4YwA+q679a8kK8yO7EvkSb9KjAeaLWvw3GunO8kcuXGP1VyeJo2cb5WGJN2/losuTg4+0cggyFUiF91QNIXOwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=ZERhdFPi; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WYhl02MgKz9wVl;
	Wed, 31 Jul 2024 06:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722406764; bh=cUSGKsIFxCyeNPbg5c8vgwhFGGNRrlqC8mF33tDfnFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZERhdFPi1qPyC8g7UMIuRj7ZOlvDAK9gIRMInGAI5JVbMRQMbCuU4YV6lDMu16IYw
	 dDw5DjDiXFa9dGO/UScd1QEz/FaBZC6YBEeVozKabXIb49ookJab9kLUKdIXtyk3VF
	 TU0v4DQ4YvqmVOO8bfyzEumba5rU8Q57zW9SSffY=
X-Riseup-User-ID: 9CE9222DC1411C00A954B18B5849673D27258BD325A47F047CACE6485FFB592F
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYhkx3qpJzJrXc;
	Wed, 31 Jul 2024 06:19:21 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Wed, 31 Jul 2024 13:18:42 +0700
Subject: [PATCH v3 01/11] arm64: dts: qcom: sm6115-pro1x: Add Hall Switch
 and Camera Button
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-qx1050-feature-expansion-v3-1-b945527fa5d2@riseup.net>
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

The Pro1X has a flip keyboard and a single-state camera button.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 34 +++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 4a30024aa48f..70f479a63f2e 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright (c) 2023, Dang Huynh <danct12@riseup.net>
+ * Copyright (c) 2023 - 2024, Dang Huynh <danct12@riseup.net>
  */
 
 /dts-v1/;
@@ -35,9 +35,25 @@ framebuffer0: framebuffer@5c000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&vol_up_n>;
+		pinctrl-0 = <&hall_sensor_n>, <&key_camera_n>, <&vol_up_n>;
 		pinctrl-names = "default";
 
+		hall-switch {
+			label = "Hall Switch";
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_KEYPAD_SLIDE>;
+			gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+			debounce-interval = <90>;
+			wakeup-source;
+		};
+
+		key-camera {
+			label = "Camera Button";
+			linux,code = <KEY_CAMERA>;
+			gpios = <&tlmm 18 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+		};
+
 		key-volume-up {
 			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
@@ -212,6 +228,20 @@ &sleep_clk {
 
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <14 4>;
+
+	key_camera_n: key-camera-n-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	hall_sensor_n: hall-sensor-n-state {
+		pins = "gpio96";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &ufs_mem_hc {

-- 
2.46.0


