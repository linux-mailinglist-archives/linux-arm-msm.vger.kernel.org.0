Return-Path: <linux-arm-msm+bounces-47825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4072A33260
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47D613A9AD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 22:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909212054E0;
	Wed, 12 Feb 2025 22:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CxPlMeL5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7931FFC4A;
	Wed, 12 Feb 2025 22:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739398918; cv=none; b=eaaSm8JP3GOD+vkFRGHKVlnBDYm0uyLSC9OfKsOzydBtfNQMDdC0xT9h/m2gsxk4uMewIKPj22T7bM70oNM8bQ+1sp3FW6t2Tee3ewAzlXkPFlrk31notfdnwvH/SWijq5nS9PoqyF1ZMNKigvw3lqsjeIadqVmW2op2XdhHaSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739398918; c=relaxed/simple;
	bh=RirCIYtA6MaJ7gcEWQuqa331X8Y+fvPvZb9sjazFIgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dWeCjgysoJgOEeNATw0K5PfZumaV6N3J6EH/IAo7PV+1uUnqf4BdPcFtcw42HQdeFuSfm3Nfc2eoWKkskNarEQmKfRpqhhTOjijBsET4jXQ0J5xltaEHvFlQ9dukgc9eF9hVWWX12q+OMWS3tebX5555ByoDHrGm48iuTtmn1vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CxPlMeL5; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C23D7.nat.pool.telekom.hu [37.76.35.215])
	by mail.mainlining.org (Postfix) with ESMTPSA id 8163DBB83A;
	Wed, 12 Feb 2025 22:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739398915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ScU4C5kD2FXBNDVEfbcMvkNhcY06xzpF/lYTFbynkHs=;
	b=CxPlMeL53kB4JPJF8qzPo4E9bjaEbj1RuC46omXLsNNXQ/DhjTvoOu8Vi5Z/Szc0u97Qwy
	c6eDXyuyyOjNzvfWgzpCmaHo2KzaacPKIY5/3vERz5WNgPwfLFRxkS5r2p+efprXWmYiJo
	4HMuJtNtbuKf12xO7DwPCiTAKTEgYpQPOxnZ7y++56GYIuIG8sSetUqxABv/irgdyDaPFi
	pbX4eEmcuBKYGmg3v5TOVAxp8VbyAvcA9uxlEJtFimM6Y89gc2Pm2SBfY5Vp1OEWLSwQCJ
	BmXNt+nmnkfn3luR1YNp/GWALJrGnuYaxLr6cVF6oCq96qpNfKEKD5zzW0tfZA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 12 Feb 2025 23:21:51 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: msm8917-xiaomi-riva: Add display
 backlight
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-pm8937-pwm-v1-2-a900a779b4ad@mainlining.org>
References: <20250212-pm8937-pwm-v1-0-a900a779b4ad@mainlining.org>
In-Reply-To: <20250212-pm8937-pwm-v1-0-a900a779b4ad@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739398912; l=1432;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=RirCIYtA6MaJ7gcEWQuqa331X8Y+fvPvZb9sjazFIgA=;
 b=W3w5PG8RMqJCtm8eFAKww4eLA1aIQMLpQ2Osgf+HEcZI24xdtGwaEBWeoRHjnPFvl4VZSb7d1
 u61OcYUBad1DqVUqWo0tWxsUmOiR/aCP31Itob9bZZilQ7Es6jHYCma
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Redmi 5A display uses pwm backlight, add support for it.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index f1d22535fedd94467ba3f0a88b2110ce5360e7e1..8808306c989f54116052667887f9bf36b63c4c64 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -20,6 +20,14 @@ / {
 	qcom,msm-id = <QCOM_ID_MSM8917 0>;
 	qcom,board-id = <0x1000b 2>, <0x2000b 2>;
 
+	pwm_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pm8937_pwm 0 100000>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+	};
+
 	battery: battery {
 		compatible = "simple-battery";
 		charge-full-design-microamp-hours = <3000000>;
@@ -131,6 +139,23 @@ bq25601@6b{
 	};
 };
 
+&pm8937_gpios {
+	pwm_enable_default: pwm-enable-default-state {
+		pins = "gpio8";
+		function = "dtest2";
+		output-low;
+		bias-disable;
+		qcom,drive-strength = <2>;
+	};
+};
+
+&pm8937_pwm {
+	pinctrl-0 = <&pwm_enable_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &pm8937_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 

-- 
2.48.1


