Return-Path: <linux-arm-msm+bounces-84686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D56CAD85F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 16:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8F5D3077308
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 14:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8E42EC563;
	Mon,  8 Dec 2025 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDFUx2yU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF392D7DD7
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765205978; cv=none; b=ROom0y/MZkbqXfVODGxXchyoQrBDD3qYkInhzqLLuwKcYAmZfcjjLBzs/JK/pV9Mw1Pv2LkYlGdnztWMjDQHuUB+dAk2OJaywNrh9yphFTLtl4i8na3YfY1keKoGt/8Gj1uVTMiWdbxNMfHXd+0ebmdh0QK1gw6GlSsZjgrSLKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765205978; c=relaxed/simple;
	bh=MlkWVUme++H5JcXF4dfTtEPbZdW9G8cP3Uen/uNsZkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JaiD2zbJg7nI+wc4LvZvGGRyhlnGeDOKHqg0bRiWS4CSV2GB1wFDMS2ahsYVzVy37Nn8XaNFyfTBV+pGUweo34qa2ATMV+ndXUm57Y0sa0gqJLSHvvdO4hNXl/FWUKCa/97DBYZVsJpzELOQWg+kaJo9hSlOoGBiD/3vgRaF1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDFUx2yU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6492e7891d2so1619094a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 06:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765205974; x=1765810774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5XIZU6P9UPthLQXJjeViPkZ0VrzVg6Co8k8yF7SCIc=;
        b=bDFUx2yUcsDCufwZYLEwqghFLfJqDOucF9JIpGskeh9eXl5rRPSLplMRSiKdjcqzx+
         iGj0/L1axj/YQpRrpBxEEuuc5DDs5arFgzdCpBzoP/LR3jD2MXx9yLuqIAJu26kcc3q8
         mU1iFfebELA8PjHncMI+tbVFCtf7Okv4mVU83Bi8pl7DCDHRFIIZ/Hjm/1YzWqGGnhgr
         oUOpyNxebYhjlNkn4kVy/a8rJxyu6pcDuWZ4y14cphFp/yLpgfInbO1naMAuRNR86XdC
         GzTk6VBfu3CKYsSXY/52HQ+vi38xN8i6chL4b81sAVucJock8LAQlYf/HZk1mtpBn22U
         gvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205974; x=1765810774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5XIZU6P9UPthLQXJjeViPkZ0VrzVg6Co8k8yF7SCIc=;
        b=SuheI1n3rko9iVCKEjLqLlkB63Q4JCWqazZtBDzSo7Mnf3WhTUJvWXnp5N0XUnP3Cu
         cDySO1D6Mmmxv5RKDaZM/bV6fK11ApAiE6/PCQwZWTshMBF9jtbq8Wiv89DqmcBNXlGq
         xo3TmNFmgxvPn6bX/eFkq4Vb6Ld9RzxymtQmJcMnmmvCfykJwzC9kPCm2ray4shExnRP
         IV+/km0j+6v6L8EniHZUcIXSzT8/s3i1IGi6/vqzicqT3yZkLhAyrqyALIE86t9nwV+Z
         K1xi5PMxGI2V1YTvdIQCVptHNpvsQXOX5NU0huqKb5iTFNeQvKor4lBN8K2wnDDIa3xj
         vpEQ==
X-Gm-Message-State: AOJu0Ywe/VbR31iNYvJDmE6bR/siL4qd9tKD6ehas4iyn7ONlwDrQuGm
	0Ws4hYCYZto3C9Y+kRtuC4GXIt3K2OHwnouk2QRM+OgrVBDHoCixJsftj4wurndY
X-Gm-Gg: ASbGncsFywY5ulwVVp/+j0W0GqmzScfXGVLO+D5V3O8v1mKQHSDRNvhyDOFWkxkgUTC
	1qoDnbJdTI1IecNVD6cVz6mPK9ukrCk3AGulBjEN8fWtct+p16BmyLPPcUKgWcEqYsbBLHCW3Hq
	ucame52Xi2rnCJ4uginIqriJU4lnmeIHlUddlP9EjjFoQAMQv3c42RF71mo3EZefr5vEnr3a80V
	30+X1eQ/nQPw6AkMWM1XvYT5GOHBuutESw6Ntrb78XJzeCUb4C9+5nJpCVkjGK47w8J2MfHtZtc
	3J16ytUDV+TKFY0w09rwSp3BDWvwFR2m6uwnJIy1UxircbVOLjE7W9AP8uHyXQdh+2nxmhUdBtA
	cIaCsMio1CDgLvXOY+KTrgE2jQlFUZOEtoGhxO0mVK52zmeZAmZ2a/mHkMM8I2myavcdkwyhE+q
	rtMJB2Vw1fAMiQyw==
X-Google-Smtp-Source: AGHT+IGczssAIpp9AksToXuOrtKAegtzYkcphYQq+Viwxf5QYrBRnJYVTuqq7Rj449rQXPSrsjhskw==
X-Received: by 2002:a05:6402:2392:b0:63c:1073:4a69 with SMTP id 4fb4d7f45d1cf-6491ae378fbmr4926950a12.34.1765205974372;
        Mon, 08 Dec 2025 06:59:34 -0800 (PST)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec300esm11365556a12.1.2025.12.08.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:59:33 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 08 Dec 2025 16:59:21 +0200
Subject: [PATCH v3 2/2] arm64: dts: qcom: msm8939-asus-z00t: add hall
 sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-b4-battery-hall-v3-2-84e2157705a4@gmail.com>
References: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
In-Reply-To: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This device uses ANPEC APX9131 hall sensor. It is a basic GPIO hall
sensor for which a generic "gpio-keys" device tree node configuration
suffices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index d0f0f80dd326..ea90b00a2c8a 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -82,7 +82,7 @@ chosen {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-0 = <&gpio_hall_sensor_default>, <&gpio_keys_default>;
 		pinctrl-names = "default";
 
 		button-volume-up {
@@ -98,6 +98,15 @@ button-volume-down {
 			linux,code = <KEY_VOLUMEDOWN>;
 			debounce-interval = <15>;
 		};
+
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			debounce-interval = <150>;
+		};
 	};
 
 	reg_sd_vmmc: regulator-sdcard-vmmc {
@@ -301,6 +310,13 @@ gpio_keys_default: gpio-keys-default-state {
 		bias-pull-up;
 	};
 
+	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
+		pins = "gpio108";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	usb_id_default: usb-id-default-state {
 		pins = "gpio110";
 		function = "gpio";

-- 
2.52.0


