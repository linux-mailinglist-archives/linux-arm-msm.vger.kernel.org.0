Return-Path: <linux-arm-msm+bounces-61256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4183EAD93F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85DD03BA176
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 17:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0394522A4E9;
	Fri, 13 Jun 2025 17:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="l5CChMCV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B30F22A4DA;
	Fri, 13 Jun 2025 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.246
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837042; cv=pass; b=KyAtLlyMCBxPOJJ5ckVWm6VjVly5qlAi1Qm1wdlk4vSmn+BaE7dt2AZ911WjSUJ+C2kx2viPnqwMWnq/VFNN4uV8eSBkNscsf8zhzetcQieDfIq0Q76wgQsojDRln2vPr+9Wqt/DjT0/m9S1KRsZPB7fcMX1McJhw3gnHLVeo10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837042; c=relaxed/simple;
	bh=mMbuhG5M5MjgPwPZDdhn7Bnu54/QNw51sxgmPLKKeRQ=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=qj675FdL3Fw3xRsatYasDkk2sFVdCu7EUyhM1teEW1tf0ocbtvNGw6w/dqF6L8fz/DoecKZZAXMhYb2r09z/YbJ/AjroTnnSA5EKiJoM8nz8/V7WYoeUhoI09sv7U9+K/wA1z6/7jaxScaMtAGU6sEBY5AJRYeK7N0haaQET2k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=l5CChMCV; arc=pass smtp.client-ip=23.83.218.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 3C64A1A5DEA;
	Fri, 13 Jun 2025 17:50:33 +0000 (UTC)
Received: from fr-int-smtpout9.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.96.77.9])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E22851A5DDF;
	Fri, 13 Jun 2025 17:50:28 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1749837030; a=rsa-sha256;
	cv=none;
	b=tEyMgWb4rNBHZMqYtuwpEWO5HqWubDVEmI+f+NvuyHSCMCJjlGfzR1jsqz4pXJw3llzTKC
	rXm6MiZot9RM0/VyFJ1LyimS+ryzmI8mJgfnae/Pn6Z01Djkbve5oNV47LYQmV8zPtGaYp
	wD86MKAzSrK8Im+7N6+PBlcOvJNaFCTwm8snSeZ07Fm6wiQX8MxWGUo5z2f/dqKjD9iKZu
	EQhKpsbv1mDriBwyTbT5nEJ7YMob3czanSTOyp9MdrhYGKYzBuIuk7cs7hWgH0JtjA9P8Y
	Qf8dq3V+sjoaZyVMZLBBeWOrCjei3UpzS++cYWtGT4LQDp3k9pn/6pJWEwrq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1749837030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=/wVaJOWMrCKy8CZhjyvvC1TmXBJXZhcdxwzpCjeMP5o=;
	b=M99Hu2yB6q3DPPBbSKWNK7wlziSoHy5L3cNJvZrCkQXypFKvwi6vHk2ti0jsra8qzGbm6b
	cdlicoxVQzbSaPmNk7ublWGwKHFQ+WMHTCUnBnj5UCe3LH0Ouy32hxKFT3315O+r7/NLGO
	OruTLCLtDeXRSgDRx+hYT8FxitUsF1WaaTQktJxzuRgUuyBWacQEH4SZlckc8P5+mUsrs+
	rZj1nJHLng/BYoa/Lm41g6GY4CNAtHbjkYoJeOvbk042XZ6+5UWoWtutZMEeuAczHAeF1j
	FhCThOvAe5xT3ELgv8Xd6A8tqpmxs0Ln3nYUjYA1IDqnWxGIhA2Z9Unuhvr0hQ==
ARC-Authentication-Results: i=1;
	rspamd-5859dfb5d9-9fv9s;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Wipe-Skirt: 6ccb5f2d396fa091_1749837033118_700915500
X-MC-Loop-Signature: 1749837033118:913053760
X-MC-Ingress-Time: 1749837033118
Received: from fr-int-smtpout9.hostinger.io (fr-int-smtpout9.hostinger.io
 [89.116.146.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.77.9 (trex/7.0.3);
	Fri, 13 Jun 2025 17:50:33 +0000
Received: from [172.17.0.2] (unknown [36.79.97.133])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bJn3w4BDgzH9gL7;
	Fri, 13 Jun 2025 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1749837023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wVaJOWMrCKy8CZhjyvvC1TmXBJXZhcdxwzpCjeMP5o=;
	b=l5CChMCVeTvJx8zKCF3kr7VC29mYLJqA9AF/idTwx0kXAozdPKJTFkb10B6dpvtqOjY3Ji
	01CfbiCRfyOe82emtFU6JX4WP9OBmyv9Adxu9i42l5u0Ysu1d0zgiv54Wcf+7vZNlEEY75
	GZ2N6yV1fydYitzDXDC+3um+LqhTBnAjvPjMpK0f7jP3HbWV7PgR7hBLU+9WlsNCugR4Gp
	aKSC+dNs1I6dGxI79WcRcS09EqhaJyh/3B6lFcdcsEIgt3KarBJXAPaaL1rws5lq4kRs9H
	+oxFzI+VY49E0XU3IT249IX4s6C0dFLl41WpTekMr50aa+O9XCn706NFYMSwgQ==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 2/5] ARM: dts: qcom: msm8960: add gsbi8 and its serial
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-msm8960-sdcard-v1-2-ccce629428b6@smankusors.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
In-Reply-To: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749837006; l=1517;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=mMbuhG5M5MjgPwPZDdhn7Bnu54/QNw51sxgmPLKKeRQ=;
 b=CT39wkZv4CqlDf7jQPRjUDMNf685u8UBwnTsQF7MUwqYv2MD5GmViLVzHLoav8RBoz8vAVh08
 YGZ/HqYZgYoD0BI/Kw3EKlQbFqGqfsLVXwyemwx2OcFJqjmwMItGLbS
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Fri, 13 Jun 2025 17:50:20 +0000 (UTC)
X-CM-Envelope: MS4xfN9YQb6bIzKk9s+Ayf+MfEml4wDlGrR+ByaXxCBseD2pE/NqdjVkJbIIzG7Hl4zb5y2kmvs5Wb6xkOrd20k/lc2lp9Us665QmRnkKQ8M1gdTgdYeozhK 1YrzGb3pVr6Rx6lr5dqrMOdbZ/JbploYrWt8+lt3hou2Np7IpQhFoXNowBm6YNDFrlehfsD4OZ48l8QimiltHLt7tp2virXDwM8KD5jwx0tfOnDBeODHDxTa y6PFni7utU4vQhx0AhP1w5xr2Nrzsf3Id5uB9xso9b+bxMH8UdoTXPcCxMGs/gmr3JatIJkBeNKMkhSeg+qtmG9V00qYgwjAmMVmKruw0sgPRlCtCVVmPK5x iHpn88U1yC4bnUrk85z4s2jL0LYQvp2hizjCDpFWYAW23pIAp3Q6iulxeK1EEr+RmYhiVl0AF5TdNtuh/AYqsPJTGQHVbDHZ+YXF2oZWj6mQ1kSIK48lzrO3 9jDcf6RkH3PNcCb7+G0D1UemBNENgHgOwVSLHhxVf6AXChNNsU4jlvuRDWk=
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=684c64df a=/sUT9SOQbq9tkq2xjVjq6Q==:117 a=/sUT9SOQbq9tkq2xjVjq6Q==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=dPS0CNwDI8gHXBqWMWoA:9 a=QEXdDO2ut3YA:10 a=bNUbUmQ3fjJCcntIu9VZ:22 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

The LTE variant of the MSM8960 SoC has a gsbi8 node used for the
serial console.

That's if the downstream kernel is to be believed, as Xperia SP has
a serial console on gsbi8 even on the non-LTE variant.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 4babd0bbe5d638b228e05cdfe6b068b4ea16335f..66071ad498e49c4f54ba105fa94640575fe08da6 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -333,6 +333,30 @@ gsbi5_serial: serial@16440000 {
 			};
 		};
 
+		gsbi8: gsbi@1a000000  {
+			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <8>;
+			reg = <0x1a000000 0x100>;
+			clocks = <&gcc GSBI8_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			syscon-tcsr = <&tcsr>;
+			status = "disabled";
+
+			gsbi8_serial: serial@1a040000 {
+				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
+				reg = <0x1a040000 0x1000>,
+							<0x1a000000 0x1000>;
+				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI8_UART_CLK>, <&gcc GSBI8_H_CLK>;
+				clock-names = "core", "iface";
+				status = "disabled";
+			};
+		};
+
 		ssbi: ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;

-- 
2.34.1


