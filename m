Return-Path: <linux-arm-msm+bounces-26990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A2193BA45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 03:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AA02283E09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 01:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A323010A2A;
	Thu, 25 Jul 2024 01:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="LQhh0VcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCFA8480;
	Thu, 25 Jul 2024 01:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721871795; cv=none; b=t0zJCSLXhxzFoAMJAlMFQrD871pIs/qm/+0rtkrD9Dt7/hnP3KSJ2bCSRPLLDHMCVRoHrtE1DvpPHKXMoCqiDPuYdZvGqyTcLzUUQjc6l0iXd1jhVr5R9IZwwcA/u4CaXuoP93HAyTm47PgjLy8wFZdml6pfeRRfOFmKaQqChQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721871795; c=relaxed/simple;
	bh=5LcLgw7tpjDDLHX6hP4In6SOOPwrOgqloDQ0UOQXJ+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hb8so8i7ONZvdPclFtzmbgH8DoCyXP4PSztmSmOW0BeMwNxq1vxrjJJxslOm8tc5McIbn/gt7A3LCmVk2/RbNMSOk71FlwJOiXuM/6ApKVwRtfVXowX/DFrJRo1FKzIuX9buoAlDP6/5GqUJXUijbJjRjJFLESF7jneiXbAtD9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=LQhh0VcE; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WTtv44nLLzDq89;
	Thu, 25 Jul 2024 01:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721871793; bh=5LcLgw7tpjDDLHX6hP4In6SOOPwrOgqloDQ0UOQXJ+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LQhh0VcEQSWEoazu7zyqlvtv9B3ceJfUg7u2hpblDKpsedUiBptbhyCZAZBUprZV+
	 mm64c3wOX0oNHkyHgfx1KyVBFpIMPS+M8AIQ1KaqEsMPKYclGUgZyaDh1jg6G6VqvL
	 zgjgPYiCCkbew7waLF80g/F/iswi9/n7nwkQmlBk=
X-Riseup-User-ID: 3D213ADC9C650FD7D9A045BE216F0204E78E125B85D784CA931FBEB526D74BA9
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WTtv16JB6zJrWZ;
	Thu, 25 Jul 2024 01:43:09 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Thu, 25 Jul 2024 08:42:10 +0700
Subject: [PATCH v2 01/11] arm64: dts: qcom: sm6115-pro1x: Add Hall Switch
 and Camera Button
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-qx1050-feature-expansion-v2-1-5fac4bbd946f@riseup.net>
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
In-Reply-To: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
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
index 4a30024aa48f..3eecdc76bcac 100644
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
+	hall_sensor_n: hall-sensor-n {
+		pins = "gpio96";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	key_camera_n: key-camera-n {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &ufs_mem_hc {

-- 
2.45.2


