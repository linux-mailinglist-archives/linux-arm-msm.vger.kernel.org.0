Return-Path: <linux-arm-msm+bounces-82760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A88E4C7694F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 00:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 6EBD828FB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 23:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC94A30F95E;
	Thu, 20 Nov 2025 23:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPS7EjBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D844330C353
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 23:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763680277; cv=none; b=NGYTsit7fHPSGIlqq/OUWf/94Oah477Uf7oW15TFi8bc5+flk0CPTirQy8kDIxaKdKc2ZxuR8bYqmK6y6ymrNIMm4o8yOQvHiA1DTeGMo6hUbpS/Mg0qq/OcobpcXDAsduLFuQPQukGrb+X+3hax7vGiA3pca5VXkSRMYRlMGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763680277; c=relaxed/simple;
	bh=RWbkz0FLNAqiFbTIDMPZWfStC9RZXbov6DV0vU/FWDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KzYmrX8E+HdwEwJD/2EYoFzfUZAzGVGmji7uglaW0URd6OdHdEyruRHsJfvVg46T2qtXwS04ZCgygtndNYxyz2T9Z8Zpd6UXlkMtlcCQgffAxFueh56x0FkVoCPEKQubB88Qu4hokTG8hkOMTJ55jbAbJiArpEPfiIYQPkeM7yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPS7EjBc; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7866aca9ff4so14705817b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763680275; x=1764285075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByHN86RKXbbjzL7Ln3obHD3GU9SMY5OMdZPiBZnxHUA=;
        b=TPS7EjBcboNVZe72bKawkMHSU3gQUHQ0ip1aX8M5+UqLIst3R42q1gKHE+KIBWzxVt
         ECOmJQ4M20+ZdO+knkAIRki92tFMGXt4dPVbW4QSCs1q04qAFgBEAmAxeR9TQ9SfTdJe
         xYBok/kataXs8QeJ+f3XaLd9986+nQgz/IZykPCA7m18XD4fH1wS7NiCMomgj1dEN3TM
         rrHlwgM8dpSmKMblBZQu04gTNd9Tq/gdis7Rccv3lvd2LtWpe/ujPA6rnQhrhNnxmteX
         TSr1L/yrIIL039jY/Rod7n4GxnTTPBnkZKF1NZX9zMqhmwUWkspao1AoGXxnfv1mdY6k
         wL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763680275; x=1764285075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ByHN86RKXbbjzL7Ln3obHD3GU9SMY5OMdZPiBZnxHUA=;
        b=o2Jdbcc3qDMUapNkRdXt1kNFUoaxZ4d+5j+itcy2GVG7EjzKh11A1C9IgcHFyVclIJ
         M2n/eNlP0F3cgm07Qsu5If7u5Hnx01k/RMFaSUZ+mL7RxtSzafUUWsF10It3md+Gwk0j
         BOqGXDOHFREBk+k5T3sLCzBiQdTqMNJ3tdfUUB4TjxpGicmGT8ARir22v6ZMiJ3I0aC3
         HcJgmxvxL1Il7vVLoPAEDnIWW71kMZohHqWtv+I5TcQAouP/wp2PV9MW30ZE2/NL91rz
         AWshV+G8kaAaQR/8XFF+Wn2Q7vr1FMTD2DQcK4TUT5m++s/nC7tPO7Sn6kdiUEgGOJ6h
         G+Vg==
X-Gm-Message-State: AOJu0YyfVfj0b2Id0XEPunk/TZH4xdpJ3jnVwre1Q4HDORuq6pzzPZaU
	DsrahnhnkiPp81Ckh+2/oP9S/D8d51MgyM1CrYeTttvNLiCa/0s8QyMY
X-Gm-Gg: ASbGncvt/bFK4mVFDT1ABEsYlSLOdY3jORTbJD/bOyRD/fjJGa0FEFKEMa1o7oXaLk5
	LoZs2BD4Pa2OLHYWIiDbH0GeQCKCcQVDZR04Mr1T4ghOvZRly6PPPE/oBAu7WhpjCD/TEs7rS/n
	5voi7QAxY8bDm11bo8jf6jQeGdc0OWlax7eDenu400srj28m9YAKtUq3asijthRPmQ6O7MsQ953
	yl4GXNyfUQxmziLDuEIgMVqEkPbOV5c7d4QZaUzv1AQli/HXxHXYvy4i2QIEKpPrH/v6JuX+umf
	jNC1CqEIwS2sPQ4Z2p99YBCCNJ7yi/h2xmyLv0vlYlgo0J3D2ftwp1SwLuzNoFozIyjSbY1skt3
	mcKO0kZDqIzCjmKFiiZHG0sA12QBfClNMXc0PTgD6pNo/2xWr6XfVBVlms8c5ivQqzXC5zcJ6gy
	UjoCHAehtJVe53HQ==
X-Google-Smtp-Source: AGHT+IHAqrI4OKxe6x7HzMwP3ZGJuM+Wn2lQgIYDF8LTfS7H2cC7/bDnF1Smik688KfunshhtI7BPw==
X-Received: by 2002:a05:690c:4c12:b0:786:68da:26d6 with SMTP id 00721157ae682-78a8b47f539mr1457147b3.2.1763680274745;
        Thu, 20 Nov 2025 15:11:14 -0800 (PST)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a7f19sm11356807b3.20.2025.11.20.15.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:11:14 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 21 Nov 2025 01:10:49 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: msm8939-asus-z00t: add hall
 sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-battery-hall-v2-2-d29e0828f214@gmail.com>
References: <20251121-battery-hall-v2-0-d29e0828f214@gmail.com>
In-Reply-To: <20251121-battery-hall-v2-0-d29e0828f214@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

This device uses ANPEC APX9131 hall sensor. It is a basic GPIO hall
sensor for which a generic "gpio-keys" device tree node configuration
suffices.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index b58f0a04abfd..7343fb00f986 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -46,7 +46,7 @@ chosen {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-0 = <&gpio_hall_sensor_default>, <&gpio_keys_default>;
 		pinctrl-names = "default";
 
 		button-volume-up {
@@ -62,6 +62,15 @@ button-volume-down {
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
@@ -265,6 +274,13 @@ gpio_keys_default: gpio-keys-default-state {
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


