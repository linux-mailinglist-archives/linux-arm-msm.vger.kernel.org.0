Return-Path: <linux-arm-msm+bounces-26699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3B39389AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F142CB21596
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5E41CA94;
	Mon, 22 Jul 2024 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="l2XX0njN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF3C1B7F4;
	Mon, 22 Jul 2024 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632268; cv=none; b=c+Fvt0Ow2WfqTPtwn/vkbdvIDDefbwAcsCNonPvH5cU4sq5ye4Ot8L4M20yU62GHvKARcvse0Fk1BjoRN652x4FhzHn28amDhsTffxlcH6kIw3wh/k0jTJGJUIDhO1kZQ3Woa6u5oMBxldjVNF8w8L1+1gx8qSOYzQ5u/Ul3EEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632268; c=relaxed/simple;
	bh=0i17fR7MkJO0xOYoBFBes8/uzxNaH2EUbsbbSWQ2LNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SE0d/lviyEwWI8s/5rGH4unI+ftkrILS4rFWUN0pIl9WlnZutqvtgsjs+qLCtCutvs43og2zeMalKqqlfAK4NU2KqCO5m0FOhrHuHwE31hDHbM9akn0P6BGTty9NGM9diVlOMbnm1pDjs0TuvafzyaKFjiFvGK4FA3uN+dhDX5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=l2XX0njN; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WSBJp3gyvzDqQ8;
	Mon, 22 Jul 2024 07:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721632266; bh=0i17fR7MkJO0xOYoBFBes8/uzxNaH2EUbsbbSWQ2LNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l2XX0njNDQFQN04j2Ax3wp7P03GROkFaPEJkoiP/tg4+iH6b7oZkWyZqMfgvz2ZA/
	 VIEhruPHFsZKNSW7hQ7pwFXA5pZPkmQdajv/AgxWgEpVIF48/9XEpUKT8g1KFMdbXq
	 CnXb/oIYey9LfLXfZ12MN0CjhOixY9XhhkzJdidY=
X-Riseup-User-ID: BE95F539B2D3CA41A834D4541C6F5B57F41B5113F25554295AE9D32EC7DD5DDE
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBJl4GqZzJmqy;
	Mon, 22 Jul 2024 07:11:03 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 22 Jul 2024 14:10:11 +0700
Subject: [PATCH 01/12] arm64: dts: qcom: sm6115-pro1x: Add Hall Switch and
 Camera Button
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-qx1050-feature-expansion-v1-1-c4d486435b96@riseup.net>
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
In-Reply-To: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
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
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 33 +++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 4a30024aa48f..5b7dd54be6b6 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -34,9 +34,24 @@ framebuffer0: framebuffer@5c000000 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-
-		pinctrl-0 = <&vol_up_n>;
 		pinctrl-names = "default";
+		pinctrl-0 = <&hall_sensor_n>, <&key_camera_n>, <&vol_up_n>;
+
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
 
 		key-volume-up {
 			label = "Volume Up";
@@ -212,6 +227,20 @@ &sleep_clk {
 
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


