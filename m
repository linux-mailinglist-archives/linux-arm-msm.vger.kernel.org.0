Return-Path: <linux-arm-msm+bounces-67924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E6CB1C85E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C94316FF79
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED90291C2B;
	Wed,  6 Aug 2025 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2PXialas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145B9290BCD
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493027; cv=none; b=jNakTnEwlkRws8uGkHHJWk6zYCdsmx3dUqnYyxzmYFhdP2KKfPGexuKAqsOAJsUVQvR/yxkE6gQw/RVnKWeAqWfeGZGLUilBqc+mnPyRaCVFEZ5BvqaA6WeSmMvHhqlRwBaaeseLtxNw/WzqLOSvK5xh/HIbPr0h+rPa7vSF7+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493027; c=relaxed/simple;
	bh=mkMKBwz5BKx3M5ukHVq0U7xYjHmmJcHQfBYE9D9pbLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aKIdnhvd6/zE/j700eNfxqO+x7x5NizsyRe9ldBNNZRgrId4bbvejFmcpwenOQYClAIoiTOpi4lv2dLRe5YxhNoVCBtAMNGXDAzrHjDDjBLc3uWSkQWL5RmNAMOSCut+n3oA/3KNR1GNaSWW7D7xwQMP9zGqfudXotQdD2GHjhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2PXialas; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-615aa7de35bso14394426a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 08:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754493023; x=1755097823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKHJowmVjOKhweg/31XcJuN1dKyemiZUjq/gTTEI0D4=;
        b=2PXialasG8bkbX+e6ZXi6/K+FfbcqiYwOlqmKxEAuXZu8Z4oRyhTOfAg5r3+/qbsRE
         krBoAFDROQG6rgi3n3tHn9I+SsItHpX9iyxw4cDh8s+e690tzdapc2oOM7pXoqXPnVVY
         pGEJdIdFLBO47THcJuGqF/u1ZcwcXVnldhQBavIM7RIdfGhMlm1U99yZeiXpobagr5SM
         zy/5yf7MxU1o4GZ606EfzUCXxxp6Rqtyd7qHqMmNGxpjVDy7SsJ1diUQqmivJtmdsNxr
         D8wsBcJPTxpwFQKLhgaWg0flcMHGASl0EgA5+SjhCgRG5Hbi6fg6G8ItVNivFsy9kc16
         f1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493023; x=1755097823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKHJowmVjOKhweg/31XcJuN1dKyemiZUjq/gTTEI0D4=;
        b=RjcBXxSv1BsE6bn4nQJsSTurv8m7piGtjMH6AdLD1Vq/vLBaA0f7yVlg7POMqLiZ5N
         atcpFl11fJ7XysCvxBSS2U2NIk+DmuqsPdw//dx7/MrBu3hLmgnpjruIbl6Ktaoa5SaL
         TX5fXF6fuz06WhSItxYiwRO2rYZ+D6uoMz6Scoahfnk6wCsGsU68Fee8v83FlxLpZx1y
         VzvRn7NEUfmueLx58eExcf4v29D3L3zGW69xvAi9J0xwWIF065pIV7RqakU5rZ/uH4SY
         HRiHRKtC4xugyGfIfe7PGaycOMoAKsr4+lNOxehoOKk95TFFgSwASXIQrO7Tsgiix7PN
         FXFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPaYmbPf6yPE8PR7Hs3WqJauoR4Q+UzbE+S6dkUWEvrfaWohSP4oeEleKy5bnWASzIHud+pDRAcXmL3By7@vger.kernel.org
X-Gm-Message-State: AOJu0YwYmLpZmhROLYVCzMDwBJ5V37PxUGSiYAmKWdONd2BklOGS12zr
	NtFLOtH6ig+Di6Aw/uK6A2vOB7ZqzWYzf+PWWe7HCz1E73+MpFIvKN+MHh4TURPMMg8=
X-Gm-Gg: ASbGncsAEF6jLUea8xJxMHlgfiq40vNMn1HM9a9qak7r6NL2CtZXVLEvjCGZTfMWrCL
	Hh3GDXL+tGDAYiDrrx13Eu1Hfg/tAWehvcD4eJvfJXS4I75ss6hLJzSu424PgruK4AR+8QOuV4H
	ycAof4RACe0N20SYlNu3yxPZlsaMZbPGD6bAEoOhR9wjHFUaYpKzGQ3gl0oQrfZSZdyXV4X1okE
	riIpMv1ua+4onlnAfr4sm4Im5aVn33UhXyGrpZ+XwzCeqKHJcMANMqJYtPwGvWsDFVV+XjL7HhF
	eCwUuEX7CIq1rA0LledYub/P4BY8Dza7P7bVVO0wmFdzVbKH2GuSCgHCwAAD/xJ+nO8IDmVBzya
	lhNQ6Y+9EU+XuGn6cIYkdb48koF7zhcaq6WJFT7ziB0E9aaun02bsyuTG5H20UWtDPDwiuTRu5o
	2A2UM=
X-Google-Smtp-Source: AGHT+IH8DW2Kp/036um5fo54X/6vueOzgFt3fBIYDww6nDeVymURksuNRfJrnIRDzmfw+vtApSseXg==
X-Received: by 2002:a17:907:3e8f:b0:af9:8c1f:c2b9 with SMTP id a640c23a62f3a-af99005c7fcmr299707266b.8.1754493023342;
        Wed, 06 Aug 2025 08:10:23 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b77sm1120100666b.51.2025.08.06.08.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 08:10:23 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Wed, 06 Aug 2025 17:10:10 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-aw86927-v1-3-23d8a6d0f2b2@fairphone.com>
References: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
In-Reply-To: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754493019; l=1231;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mkMKBwz5BKx3M5ukHVq0U7xYjHmmJcHQfBYE9D9pbLY=;
 b=9xF1MNdjywzjYsOry9BBTU5wVDy08shUSv+1t+tc7ZOPISwDvFFGeWrjsLPziUTQaGleWWHxj
 eKbNhajwzcvBH3spUvKXYq7qI+fSiQrEEGSljDAwdNNMJPjI2rtiqCV
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the required node for haptic playback (Awinic AW86927).

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 4c6cb4a644e2..9576efdf1e8d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -866,7 +866,16 @@ ocp96011_sbu_mux: endpoint {
 		};
 	};
 
-	/* AW86927FCR haptics @ 5a */
+	vibrator@5a {
+		compatible = "awinic,aw86927";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw86927_int_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c2 {
@@ -1415,6 +1424,13 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
 		bias-disable;
 		output-high;
 	};
+
+	aw86927_int_default: aw86927-int-default-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart5 {

-- 
2.43.0


