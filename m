Return-Path: <linux-arm-msm+bounces-49333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB674A4467B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91A1E19E2912
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865F21A3154;
	Tue, 25 Feb 2025 16:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dv2DtPu6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C931A238B;
	Tue, 25 Feb 2025 16:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501575; cv=none; b=SSJhjwPipe2BoxDLloUqVcjxMTMJZjLQuADZvOgpS6y6z66N1owKmDWk4CxiuRoo0lvxIpW5WWSpT1I1xPNMLBLeh9N+FYOUw8qwf5WGn05HnEzfsqvYSBy5h39o4WEjuzwS76FXWWFjP+Rx6fSD1EDqQ5ttmdZN9hoQSnKnyKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501575; c=relaxed/simple;
	bh=pImQGlbdyypojs9fWHExr/+QeFW3UQD3jnHzExnpI6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEfBQvM6IOBt2Oy60BpWRJBjl7aiuWZ06Rhp/4n7ducNueCUGEoddpxp4lDl2i7tPCNObOsYm+ODjelK2AscZZl8y0PYQxXzMZ+nwIiZZFHlefa87/G4ugz/VWD1puq3vY5hDZNh1pVRbqQskxMHdyYqlX25uqoYysjn3p+4fGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dv2DtPu6; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab744d5e567so985045666b.1;
        Tue, 25 Feb 2025 08:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501572; x=1741106372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+vOSFDleHTplNjoORfs9+3/khPaSV5MfypLLV50ehc=;
        b=dv2DtPu6OHwSmIL8QD+TsuMGIX9sLRm5G5fHOHTCsQMm+p+rbOHvyuXeeih2ErHvQ+
         8jOQCK/pU+SvuyKXKVnws4vLypUyWFQPryE24j6gns0hqtH5I6tihvSXM/XV/IFv/wox
         3DGrKzIv31pzdpwSA5NXrpJwUX0mnuUVgFFZrTPentYGFK5KYF3TM+pdmBqxWfGh6/Uw
         JIDOEAKCb6h8MKyZ6V4917Jsj1oc2jX9fe+T186lwxss+fqkL0VWBYV26v+2HXWZ2phV
         yLdGP9s9r3Oz/Vq9K2L0TeJUGXfX2nzVxOLvM2NSfNQDFs4JvujtFUYMqzfG/oIWdEh3
         Ln1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501572; x=1741106372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+vOSFDleHTplNjoORfs9+3/khPaSV5MfypLLV50ehc=;
        b=YFWvmrxVkFrftVJztPz00JDbFHIP2X5dsjIxkIsAVOlRa42dAdbc5GizqcfD1RPTqz
         TlbVqnWMzl5EJMCugSbWwr521RWK4JI3gytrT9K43xQPdPH5dT6WHgdkcmA3uMWhYR8q
         pXDx6nCES5ee8+QonewZlSR8scS1JzPUETwERr/pp662a6ZQw7tuSW01+HSgKq/1tH+s
         h+NbDX8HSsyqBJHRqEbigmzMd/3VRMTnD8L2uhRMykp0f42r9DnW/kCPnRrNCHqPcbo6
         NnaVQ6GLQFR6TSBGY/ajnrNdLB3jlQF7qSsOWjb7XwVYK7fgrcYcLLc4Q0VgJ17DdRDS
         uMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx6ZggahwxDVDF7fjxahcVCJgTUVUFTKft82JrInjQZwZ5r/K1MguEyEuoQ6r/UNBRfCBdrn7/XUN7fg81@vger.kernel.org, AJvYcCW1Vt3QbOStyUO38i9krilgXO73O5TcCW8yz2nZOCciv1RoWkxf8M5Td3KsaTy2F6rJEdyppckxQTs9@vger.kernel.org, AJvYcCWs8O7f1goqh7kcrMFmdRCkh+TXSboPwK0oBTE6DR/tAjdu6IkooK9JkD178YF0/tko53N4w2ZX2ENJVyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy4Jy9uGQtI3Y+xrZYqKjGB8FIAp7RrGdNx6QyLYByNBk5L6aS
	Z+ObAHUDYBEUIv+e5nuDY7ovIV+YSLXZHkxdnygfjvjYrrlhUtqj
X-Gm-Gg: ASbGnctaL8SV5Wxnh3H0EkKFIcdemHluw4z4feaqRoExdd9XvHrYheA8uCdv3sxl4s5
	82lK/SFxnA3Kgj+aQ/ONmZaYYAIKRxu05mAHNGA9K4swXJcU99tr6Nm1CoEuGg2YbfKt6YjOiYI
	k/57m+yJqzp/ZRUouX+S71VW+yAVyuZBrpRIogxDbEq+1+n1NkIvoICznQ4TsSo2HZWkEgBBHdl
	lqURnJNafKz2hxiRtk+C1reE/IqbO2rVxYge/lln6IdlWNAlHSV2gbkQH8Kbb/IW3y+D48650LL
	ycvVk0lgdtNUfMivjJjQTCwa
X-Google-Smtp-Source: AGHT+IHnorYG4d0KKBo0s7oWN+5LvkgtEW3ZnmvR+ltR6GZlsE6fEGV2k5/fX502psAQg4FPtvpvFw==
X-Received: by 2002:a17:907:d9f:b0:ab2:f6e5:3f1 with SMTP id a640c23a62f3a-abc0ae54e08mr2109462866b.8.1740501571867;
        Tue, 25 Feb 2025 08:39:31 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:31 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:39:00 +0300
Subject: [PATCH v9 09/12] arm64: dts: qcom: sdm845-starqltechn: add
 touchscreen support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-9-a5d80375cb66@gmail.com>
References: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
In-Reply-To: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=1542;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=pImQGlbdyypojs9fWHExr/+QeFW3UQD3jnHzExnpI6M=;
 b=jxbsc0TuPdtP5zjJLwLKFExKH2InAAhzWVjRa4kAURfLohwvx2uZ7YDVJkHZSVbwRNNlKEtVl
 O3Y6+E80nh/DYqi4jIN+vXOUZmcqTf/MVcOg18b+jB+DIZfAZ6q34/X
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for samsung,s6sy761 touchscreen.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v8:
- add tag: Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 77abfadb4cc5..320add4697bf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -578,6 +578,23 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&i2c11 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "samsung,s6sy761";
+		reg = <0x48>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <120 IRQ_TYPE_LEVEL_HIGH>;
+		vdd-supply = <&s2dos05_ldo2>;
+		avdd-supply = <&s2dos05_ldo3>;
+
+		pinctrl-0 = <&touch_irq_state>;
+		pinctrl-names = "default";
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };
@@ -682,4 +699,15 @@ sd_card_det_n_state: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	touch_irq_state: touch-irq-state {
+		pins = "gpio120";
+		function = "gpio";
+		bias-disable;
+	};
+};
+
+&qup_i2c11_default {
+	drive-strength = <2>;
+	bias-disable;
 };

-- 
2.39.5


