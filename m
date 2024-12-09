Return-Path: <linux-arm-msm+bounces-41056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 052069E9378
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA0CC18864A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AD722A1EF;
	Mon,  9 Dec 2024 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUjcPoAI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B86C227BBA;
	Mon,  9 Dec 2024 12:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746195; cv=none; b=O0XE2KK/o9IRvoMZ8uLAu8JFRrAFyL/LUgPhKs5BpkDmG/yolKeQ8eIujXQX8xP7l5k4Ydcxqi8RcpnVv2JSFTuHeEkSuFqixxxQHMgo/ZQbFis5Rpfgwia2uy556Ia03O29Cu3R6nGwi+hHHgXIKcyZ8jRt3I+9IyJYKQrG90s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746195; c=relaxed/simple;
	bh=pDdgUcffI7JkVhftgo4PKCSQrf7+UwF10WP+KeGP6/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJyHbAcT2MNeRlL/XbByZfXOuvAQjiEAFWn6QxkC3NHWz9CyGRd+a8mKFvzxiOLD9lyO51xio2+zJyvkHElB9+5ArkXcY1l+DgCb7HQS/3RhRpksU8LBsVC4utnXV41OoZKVaNnHomHLH+ZasaGJRHe/S0eTbu9MNtG70EVTXIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUjcPoAI; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9e44654ae3so685762366b.1;
        Mon, 09 Dec 2024 04:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746192; x=1734350992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4MVcXicplEdCrwyQKAu4N/9PdxNpFPNbFlchUPxTzQ=;
        b=CUjcPoAIny+rhH0DewRrLHb+bt+rge12gaOlyCKfivVRjLv2fYT1M92s2gRKeI80Fs
         tHAr6natV8HHf2L6/FmHtuhmqSqOmvBjm/kXhnF07lRFFaokrtUpWlngzWKnFRVTyg10
         PNcefc9w4tNKiSyamdAU1PwOFbs7LZyzm8n1SC9LcaGoYMViO1vSUpVYF//40G63VNqH
         eP4UcLEjj8E+oXkp9g4mkNpkjIbipN8diBc/J9X3rvouetFF4a3NtUXKz2taJy3dKN9I
         99xppeAw2TahW3h6UqEc/qaMDHhci+0CYuQDmLgZ5gzwhEu+3vPhG9RPQq06wuxEqIwf
         n1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746192; x=1734350992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4MVcXicplEdCrwyQKAu4N/9PdxNpFPNbFlchUPxTzQ=;
        b=P06t3tVg2QUho7e3Q8aSsZ8+109WXKYR60T1meR77+W9iYqM5o08s5DdPbh3kXoW0p
         9Ak3fTf/SKjy5S5Vlo43Wae1GUHgkkwFb1YtOn4OBlyEH7l8RqJIdagU+fE8Tm8ovqzC
         yjXLfASO8nJQ5PXPquCBZOywh/GqbTEiH7T0QUKY4Cene4hI7gghp9dBiZUmsqhCtyWK
         j3OXjcwMNrLIM/ZWTvtK4aFIhQr9v+Xb27jIjrMB02nVbN9uAtwoLHl8GcdibuJ8o44y
         rIHP5mNztSy+ONvyMobX7coCPDhA5cijBjeFb/QoEYwfdZF3+amTLAJQthNAccNE+3WT
         C9kw==
X-Forwarded-Encrypted: i=1; AJvYcCUZNnl0yHWktIitSBNE1/PRfSf6SIp3B1Scj/efP2iTQSg4gw6v+W01hHCEo6JjH3hAllO7Zj2Fz5c+@vger.kernel.org, AJvYcCVk7FI+yI15TB/XR6m9dxdH0SeafowEagvyxefgJwnshev4NraXfUIVWCd3mLWKzlB3c8Bc4V4LWRc9LVwB@vger.kernel.org, AJvYcCXP4YIdi46P0sLbMEOeUBW9oQ/lPNx5Z9CK+8XYH7iuepafJxNzxlcGKDz/9Wedaok6zrBF9tjnR3y8Qak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyAXbFV37S0pZ+sBcc2H1nyS0hc23J0tgzA/+rhUg5jqfeA3va
	QkkPOz6cZvpcfhsapLYG2FFqgyimDO9BYsrstHTlpxonchORjKn7
X-Gm-Gg: ASbGncu5cPM58gqKRAcuX4WDDfjkOO4yGYOhw+jvXwUBbkxSyQGsW5p4UoVWtncfnoO
	pk3V6tYXdsEbnX9pC1xoRUJvY0RqwT8y7Ix0w3bRTUYargRZD6+1afCQ+pNvjbT98huAEt03RSa
	R2kUZgUPM8lFJwDyMHKiRq13VxdoVoNXas8AquU3zZshSvZBh1BKb8plfGsNUt13c/rKYXxflO0
	GZukTmZa2E7JUKaSpHqvsdb5DhcRmyas1PVTlvVxjMIvnAZ
X-Google-Smtp-Source: AGHT+IEpu4UxqnXpZVxf0EqhFXnT+HhHzwBnhHLCSKKVUsArCXx2gTbPnL8UNgIA0wFEo78dO0A4WA==
X-Received: by 2002:a17:906:31cd:b0:aa5:44a8:9ae7 with SMTP id a640c23a62f3a-aa69ce22259mr8134466b.47.1733746192420;
        Mon, 09 Dec 2024 04:09:52 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:52 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:15 +0300
Subject: [PATCH v8 11/14] arm64: dts: qcom: sdm845-starqltechn: add
 touchscreen support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-11-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=1542;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=pDdgUcffI7JkVhftgo4PKCSQrf7+UwF10WP+KeGP6/o=;
 b=X812Az663WTkM/CS2AbxlcFD7hGcUgjU0ls1OLqiFcDNnoRuRZCJ6s1153S4lxs/cVehFaUoN
 /6Vi3AzEK07AJsZgzQ7f+rMC8Ba8U+yxWd0koPd4BNvpgetML8WK6gd
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
index c4d8d7c0bf36..65f33be55da3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -573,6 +573,23 @@ &sdhc_2 {
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
@@ -677,4 +694,15 @@ sd_card_det_n_state: sd-card-det-n-state {
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


