Return-Path: <linux-arm-msm+bounces-76782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C873CBCCC28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 13:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C3EE4FC825
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 11:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008CE287263;
	Fri, 10 Oct 2025 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Du9tIdLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6BD2F0690
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095439; cv=none; b=i8TOYfll6Zm/jRIdJVW+0wOnsn72WBNSMmkUIhJeXY+hDd4BYLaw9SltT+oou+t/bKDz1nLjCyhQISlv9RGQq8I2XnR3hkMcWGCeP4LSky5ttycJJuQ8/MoPw8ZqZwjFnSWDpjxDUcBaSNJULxgBG3qb2kU+1W08X9ckeI5d4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095439; c=relaxed/simple;
	bh=JpYLHBppDURESW3oGd0+8XBXaU0yfTl1Z8DessSgdAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S86WdTJN+MpVDYWtAe0VDHiQH1VGeQmc30+AMe77MvGfBD6yzgTeH9dRLxtlaKBKCmCUZnCKQ4iOv3lLQenIuwAh0w5Uh6jP06FQZTekmZhcDV69VdRjF+Ip430NHU/BoFVQWNiy/N9QlNPhZ29jEzbxcxsiBubuE62M1ZAts1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Du9tIdLH; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3da3b34950so319893466b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 04:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760095435; x=1760700235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlEbSwGOzNwkU6KFYMavrAYJ9rwkM5KnTfqRG4W7Yk0=;
        b=Du9tIdLHG5n4hWQXmqD0J6mBBfrCWf/jb6B1w6jPHyGyHRSzvgc/z8feaARj6l5HxQ
         omxK+ZpiYmBqoJJI0Bg0svNuDlP6jGDVTZLyODbX1Al6udzzX2QgfJII4qoqreE3m+nv
         F6Q55cRHMADNPFKFYjtz4yUwC8rWC0KawqnDBY8m4aloVevW3E0ZbTUJcqQof1O+FHTP
         sTo7d644fpYr04nG0eHGVjrRTTLHGKk45ZHCLtIvqmIwvZv0JdOh5/evT+3WQYI5HWbp
         M0Wd1tvrzlUTPiIdC7aluYE6CgknPtPX1jNsmi39O6Tt4yvIZ5KcuiNE7G+BukJQdk2x
         fcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095435; x=1760700235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlEbSwGOzNwkU6KFYMavrAYJ9rwkM5KnTfqRG4W7Yk0=;
        b=uN2Ytb8UQncbjcAHsa8VFId82UYpVDz3VVujcR6g4frO+Iys9b48KKrqraoFQySY4a
         pi5KZ1BkmaTvBFjiTxEPEcxWNiPE1Q5PUQauvETHtjcB1kJVQBcSebmOXmMRtgYUosF4
         gDSbeUhjMDv0oUMCZvEQebkmfcSrthKMG+0Ww9vjRMvHFG/mNwvartEUtZlZxzMu8Rtv
         6BfdecguwI3Bqt0Xd+D7OqEi2bTUixIG86hGP1+7uWXpqrOo0jtWiHWFfEcWfvA9sCYC
         gmYy9UYD9nEls06BlcFY2vlh118WphnaIFQngAHyFhTfGgeIiP+Y8KIVePVjHWph7djd
         JH/A==
X-Forwarded-Encrypted: i=1; AJvYcCVR1g/JA+SBDhlo9WwzJDVIWJ9GbHcG6yl2BeJQs9WAQsECOEzYAPR8ISvhQVsyO82lGIXiYA56fc/YCpYl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7X+NHrCfM93JcA33O3T1Pkpd46R4oIcf0ySlhpx1Gv+lUd+3+
	hNqUKt2of7D6xKc9KrmYZ/ll0EczCAmOJpTnnHUKcmwhrvlxLyY8S4sPR44b+h87NIo=
X-Gm-Gg: ASbGncvyOXW4Y+HGhbn6T+PfInfRc4xHWqSv/ssdoSjNW4EDkDwXrLahFmiDyEi5XM+
	7KzWcVEOA0BzD7CbUtHzbhy/TcsFjewqECtIMwrPfzehvl7lCuDmFpiFkBM+yj/qen8h715lITK
	YmKiY+3R61iW3VTXZXNcPO1k9bjJb6Fqvwk+ZDis+KiZOCisDAHh/n6+XRdr/+mY5HBWcnSaUv6
	GA8gPMA32fahI8Br2/vGS+zNEoOfVVpOKDDX9qWyF+WkmXsvgNVIGoKx0BQa4Wv07lg5TULmHoY
	YBzVxfWQMe1BtXTgg3xDGUhofuBq/eAc0GbRNcpU/LvTHsrM7DOVKfLuNYhD8j7WBmJeiXZ+Tea
	fQ5sCh8k+SkoCoMcM+dOhHUQf3YcbgMERE66UEl7+kBiw1jM2pbk74tOajBmIRPhI3qttbkWj31
	JS/tkFR92P51CIqWFJ/zrALgjhYjxRXA==
X-Google-Smtp-Source: AGHT+IFtOKOdgJ4dWifHMxzpmdJ6iqSE5R85wkeuGb0qbSbozu5nIiJKB5e4xe1EX1wTlhX9Ev6i4w==
X-Received: by 2002:a17:907:3f1c:b0:b47:2be3:bc75 with SMTP id a640c23a62f3a-b50ac5d1dd9mr1201041566b.60.1760095434892;
        Fri, 10 Oct 2025 04:23:54 -0700 (PDT)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900bf8csm209905766b.59.2025.10.10.04.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:23:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Oct 2025 13:22:03 +0200
Subject: [PATCH RFC 5/6] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-bat-temp-adc-v1-5-d51ec895dac6@fairphone.com>
References: <20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com>
In-Reply-To: <20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760095429; l=1351;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=JpYLHBppDURESW3oGd0+8XBXaU0yfTl1Z8DessSgdAI=;
 b=qaGcfuqMeIg0Gum2+/UPS5v4Y9LiQtlhFI2337haSWnu56uZivPuiS4BHaj9sRq1e3k7jqyHN
 I7QA72rmAs+AefjACqzZcd5Wft8+6p0hD4VGXSrzyDehfZ0EKOjSYQp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the definition for these ADC channels to the PM7250B definition.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 0761e6b5fd8d..c96089520548 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -156,6 +156,22 @@ channel@1e {
 				label = "chg_mid";
 			};
 
+			channel@2a {
+				reg = <ADC5_BAT_THERM_30K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_30k";
+			};
+
+			channel@4a {
+				reg = <ADC5_BAT_THERM_100K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_100k";
+			};
+
 			channel@4b {
 				reg = <ADC5_BAT_ID_100K_PU>;
 				qcom,hw-settle-time = <200>;
@@ -164,6 +180,14 @@ channel@4b {
 				label = "bat_id";
 			};
 
+			channel@6a {
+				reg = <ADC5_BAT_THERM_400K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_400k";
+			};
+
 			channel@83 {
 				reg = <ADC5_VPH_PWR>;
 				qcom,pre-scaling = <1 3>;

-- 
2.51.0


