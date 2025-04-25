Return-Path: <linux-arm-msm+bounces-55554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5C7A9BF4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAD9B9A1A0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD65233134;
	Fri, 25 Apr 2025 07:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Fe4XRcHX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BDE20C46A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 07:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564939; cv=none; b=adfOMFXqLB4Bs7Vt3zQVz82uzoNzyu42hh2nbdVtkLMuY1i544aDpYABBephAj3WXs+zZ0ikMLfa+GxkQKVRhgsVFOVhuN7oxfebya9evuWqRu7MqRpGV1480Jy2fxbpZfEBMHGB89qlkoid7eFEuW0l/Jem+O8zIwi1IGXLLrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564939; c=relaxed/simple;
	bh=Fdj99F15NrodmliHWNzqnIaLNDZ9brmDoSEheiXAMlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XuaPdImMy+4xk6Fawg517hnXSdz0ewMAm/GBDdP1km5fSsASWmEdxM9aQQu25HJKHZEGAn7JNDeC6I3/jsE8+jF3hvRym1TbQbWqqxs19lvSxT62BPs4D6DVmCF39apHIhnaQG4syf3BHeBx9MV0x35loEU7zlYB7aZIJos4/cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Fe4XRcHX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so12309445e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 00:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745564934; x=1746169734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vypambs+vDzLekBB8IzM17TAuFHn0wmPd4bpg5X3/QI=;
        b=Fe4XRcHXWMTwmhtC6z8zpKW+zDzlBEGKcVobEE/yrz973VErnxHirWdTfYYvUEU/gY
         zHW+xM9IrAhOEr9vBWoc85a8dWkscwfCx2dj8Vq2a0lwBPwc9jXW7dX1mVyLAipobVKV
         NSPH7AVf1FPA7F12unKGm+1NxtkVs6bkSwXTtKpDNCWOG5gr4wvQKsMlGqpVBeGjMM8t
         nCqP4QFStDOX+sZGihVkIm5r4MJhp3fThLjstaw6wwt/w+1r2vi4Dg+vGJM8GEJouZMt
         U0lXiaEAXerDtMqZvxIiFd5rAAH496amvEcMJrg45SzdDcjZaTJ/MB04u3lG/tNmvkMa
         WO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564934; x=1746169734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vypambs+vDzLekBB8IzM17TAuFHn0wmPd4bpg5X3/QI=;
        b=TtttsPicymhMKBr8NLGAmOA/vq6dubHQJHq8COG/d8P6XrdVUqtfOQbw0v2lJJYMFi
         /nIa7QKWG5/xGiJ14o9JL3C9gwm8SJdHJc6+9yIZZi7DALQnrvaSuR+8C8iCoKRXEsPD
         AeHRczVVrhHf+vY8XKXMKgB1NPO184HjKWfVMDEdYkb0h7AukZ3wmpauH90ggwUR1BEl
         GDwadTbnFHSpwYC2B3xkvEZQSC3MwcqZPLxm7E2NoO/7LcVzyHHhfuH3PiE+JVSXBEQL
         q5pTvgbfkqTFmDy0rgyxLp/QfnZEWEeOtBX0i+j4CUuHs75Zj2J51l/LuP0hIfMvI5FV
         Eqqg==
X-Forwarded-Encrypted: i=1; AJvYcCUwrA+kcXHzoM7Un5/5P/OZ7tt/zZ0jv1aS5Tfcj25vkFhSrAwm++zryOsOpvbcblaJ1coJTP3wncu5IVc3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0BvPEkuIdSQ1w4WBwbYOuW9d1/2maozZVVdbf5P/BKjiBZdFr
	hyQMqtedw22MO2/uEN7mdjyoeQnWPTxR8p8DtoQ7uXB6dK96QXxfL7XSoTkDUCc=
X-Gm-Gg: ASbGnctr1SnW9YI5Rxvc8vYCQr9l5Vh86znm8JxvxZhFUwpn0jVqg347sds6fNd0zEY
	cL056EBlGReoB8O0fA/Bl0hsyE1AyNR0pk7VXimNavItmr6g5yBPpSqpo3RMy8sB8NJCsL6E/fp
	MyT8FczDKgt29j29b/4rEeWBBn12pE35CJpMBes07c2uRSlqRz8zRmc0GF2hefKtFfLVPdDmDJO
	BNLR6LE+QXff5HRcKZOADLFF6lR2Q8QuTeZQF6m1tAFciYrWFBMZqaKCAmDOm88l0lyEgTQvAV2
	uY7bU9M2IGaXHQ7ZklIqd1PcT12C7tjoyioIJr9jhwdJ1Yk+oGEjakFoq8SoXZdjM24cG9Xkvqr
	zw4BDxkCeH/fDDfMWto8qsaihiBeidZD9R6svaCGuo1125zcNbBwZMmzr
X-Google-Smtp-Source: AGHT+IGS9YIDgXntlFmkZIWZPmJJOfUr4x+N3jhTyetRa2YTZOmZBiwusqcoLISyjopO1bgF6+q5sg==
X-Received: by 2002:a05:600c:55c7:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-4409c4615e0mr38383615e9.6.1745564933891;
        Fri, 25 Apr 2025 00:08:53 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm46202735e9.24.2025.04.25.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 09:08:13 +0200
Subject: [PATCH v3 2/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 PTN36502 redriver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-pmic-glink-dp-v3-2-cc9c2aeb42fb@fairphone.com>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a node for the "Type-C USB 3.1 Gen 1 and DisplayPort v1.2 combo
redriver" found on this device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 35 +++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 0f1c83822f66f95b05d851a5d28b418ff048b09d..ea9f5517e8a083e37c4b7432322bd6d18fea84a5 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -166,6 +166,23 @@ vreg_oled_vci: regulator-oled-vci {
 		regulator-boot-on;
 	};
 
+	vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_REDRIVE_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_bob>;
+
+		regulator-boot-on;
+
+		pinctrl-0 = <&usb_redrive_1v8_en_default>;
+		pinctrl-names = "default";
+	};
+
 	reserved-memory {
 		cont_splash_mem: cont-splash@e1000000 {
 			reg = <0x0 0xe1000000 0x0 0x2300000>;
@@ -747,7 +764,15 @@ &i2c2 {
 &i2c4 {
 	status = "okay";
 
-	/* PTN36502 USB redriver @ 1a */
+	typec-mux@1a {
+		compatible = "nxp,ptn36502";
+		reg = <0x1a>;
+
+		vdd18-supply = <&vreg_usb_redrive_1v8>;
+
+		retimer-switch;
+		orientation-switch;
+	};
 };
 
 &i2c9 {
@@ -1182,6 +1207,14 @@ sw_ctrl_default: sw-ctrl-default-state {
 		function = "gpio";
 		bias-pull-down;
 	};
+
+	usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
 };
 
 &uart5 {

-- 
2.49.0


