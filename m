Return-Path: <linux-arm-msm+bounces-22937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A35C790BCDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 23:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55079282ED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 21:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAABE18C321;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMs8iUc3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5371D953B;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718659398; cv=none; b=s+gruNTsj2vDFwknZQoTriKSX5D+kmNoBfIPI4LajqS+8W2QQWJ7KtUmdB76f0pX4LuJFKNYVlJdkBg6E+LYGhGholVIXBD71LXG1H8c4APPOJVlK1EoZLrDxgAX8QgZn2Vm9CSIVHEwApotgCOjLM5HepLkBJhpqFXX4ST1Q90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718659398; c=relaxed/simple;
	bh=NgvjfQGLFr6DjBTEVnXz0u3d1k1P/9ZsIsSaGq7/Bgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=javXd47A0/mIv2aq4oS0X/S/v5GvYoDn98v9F/7Jh0ihAarADMZjhzFK+JYSpwRc4YTAMS/zEQZPfNgaSOGqinzNnY6LePHoAjE92ZHVly3e0uuyVyTSvVS5r96Hq4J1NvLBkM7tghp5v1K6KPs8Ze3VUP6gAE7YmXSKskUN6mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMs8iUc3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27122C4AF51;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718659398;
	bh=NgvjfQGLFr6DjBTEVnXz0u3d1k1P/9ZsIsSaGq7/Bgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VMs8iUc3ky/5mzZITWIeZc3XxwONmcQd4oqMd9+fDflnTGXOdRdXCPj3kgncJoh71
	 JNtBjNFAzpGGEAk0E+KshJhwTP5muXTjnxLDXD90Or36Xo5vGkdG7Sk/o+5uk2x6TW
	 K5hIAQdJ7xfU8JVLfgp2MpUoGTWApdvlp8m6ajQK1RnGOdAznm7Pkpn175mY8qjVlQ
	 peYGyoMo3/aaAYa6L92mJH7PrVVb4J39II13f9ppjdzmk//RBm7fUDHBvEBOYkjzRD
	 w/2dPYS931SPZHQlgQeY1g6BvFTvI7v+SHFQVT8B9hYRrgh1arZ5zX+mTvVuPkkyL0
	 pcxyc+lYT9W2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D37C2BB9A;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 17 Jun 2024 23:22:28 +0200
Subject: [PATCH v2 2/3] ARM: dts: qcom: msm8926-motorola-peregrine: Update
 temperature sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-peregrine-v2-2-c8835d2da7af@apitzsch.eu>
References: <20240617-peregrine-v2-0-c8835d2da7af@apitzsch.eu>
In-Reply-To: <20240617-peregrine-v2-0-c8835d2da7af@apitzsch.eu>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718659400; l=1178;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=lioNlZR631NtRJ2JVy/65vxGGztyn3Q8Af+bbiSagJY=;
 b=ALfmy8RuBtkDBwdTpaCgtWG2bVt1y7mcXue/wSoGL8Th7XZNKTmqfjus459j0baMme4wdvZio
 X+ixkKI5DD+DUHF2suJRSwKU9b6QLD0cMmRpF9Mepl9wU034ioI0l/y
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Add alert interrupt for the temperature sensor of Motorola Moto G 4G
(2013), although not used by the driver yet.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
index 50ae3cfc95bb..cff9415baa46 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
@@ -125,6 +125,10 @@ reg_lcd_neg: outn {
 	sensor@48 {
 		compatible = "ti,tmp108";
 		reg = <0x48>;
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&temp_alert_default>;
+		pinctrl-names = "default";
+		#thermal-sensor-cells = <0>;
 	};
 };
 
@@ -361,6 +365,14 @@ reg_lcd_default: reg-lcd-default-state {
 		bias-disable;
 		output-high;
 	};
+
+	temp_alert_default: temp-alert-default-state {
+		pins = "gpio13";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-disable;
+	};
 };
 
 &usb {

-- 
2.45.2



