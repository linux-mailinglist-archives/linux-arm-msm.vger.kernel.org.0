Return-Path: <linux-arm-msm+bounces-21126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A65F8D4EA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 17:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DFF71C23C36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 15:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E7517F4F3;
	Thu, 30 May 2024 15:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="B9ay13eR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946AC17D89F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081577; cv=none; b=n1HPBH5rybmZI/vH0/By+AuQyVP4E5GGcdkAUWoVg03p46Bz27lTKpIepFKcZTWm8RL7nhBjlZtDkjNElfEHt7MVuGJR3XaZmy1an51/CXCEhB9+vyPb28VTxQ/M1sYZ0vrEPVF/TZtWvHsw85mtr3+bkUeXw0GWtSw9QXcs6YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081577; c=relaxed/simple;
	bh=r46t+UbdZsFkZ6PKeLxNyX7d6B5FRFqXFHDi3FXc7Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y88VRHnYim8E2ZaI2zYW1ZcWBBoKP8GqRRsb/NwnwF9AFc9HxM644cIfX/XhMrMs0xr3Nvwgd+ADd5aLhLndj9E0uzS4oiqvcbkkdzDyYQ5bH3C3Awkwlg7EltMM+twuNSgzl8kJQDLwgN3oUbsmfzfHTUKdFuSIZkbaHQV8ZL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=B9ay13eR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a634e03339dso118867966b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 08:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1717081574; x=1717686374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aktSMI6DpVcgUPsFDDefqr2n9jbKbhFj+3ua7mOz+48=;
        b=B9ay13eRHx2YCl3nG+tohHlpYLK+mHlifH3NfG7BLnAXHZ013P3Ra67NDaiwQE10ZU
         KKzidM1s4rPA+tOngVPHPQFrSWp7mtuzje2EcYrM2sMkglQSON0F8N1CC+bRrMori385
         JuFa8g7Xe0aZXrwg3sY+530fvHaOTM9pFh5G+1W7lwYstrllgMKbeW3UidBRFKzD8Lz1
         2EqPFUNLj7uOFieMhMLM1Z+3bwLzV98bKBpdmh/5ZgutccaUZ8L+mJ3ECg6HX44qCpuI
         vEMyJfh1JGD4fCp2zfbNkoR185MJh4qk9pYwhK1hQ9kUNGLIm33ud6FHvS9/De52nHDf
         L8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081574; x=1717686374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aktSMI6DpVcgUPsFDDefqr2n9jbKbhFj+3ua7mOz+48=;
        b=jcRaSV39mizNhF0GCC655cTzrquI2Mit7YNsFyBqwah0Tiey2eiEmoJkarJz2ztt66
         TUewz+kLxyalHBgRasUhktwSqfdg07muTGStQp9RFK83ZFtXTWhhrXpcaBxwyClc8RsY
         4gubATp1dNVULsc/uVarev95Q1q6QQNUcqpxYWIJSxmji3mfbjnKJ8e2barSzLjyvbCH
         gL1QzUV4PkC3Oz36CtZT7TjFgwbG713Y9eCoOxvuCdyRoRCPbWAk2gk6eDOoMSoowz0e
         8eIgpR50QJXPGnYsRovz/EOUhWsEAuE+y+WJFxsAU7rYvaIekkV3uWC1u65ii5i8GmH/
         EdbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCgfcfK0WnWAxXkjLjRwxy1xVSCqg7Mtl7b5YHL7Sr55D59i5M+eIBWnviRHVgtnx11d2p/etVAImC3zWnejbhUnyeoRfLdKDEzwnaKA==
X-Gm-Message-State: AOJu0YzUCMAXhoIruXFyUxFmWXmPC74eldfeP3bzyosRvMcji9DR8MHR
	TbaDOTyNFFbMtvR2WGKOl/qNcwcwBJTiZpjB9eQW+hSwkIHbLRCJck14+1ziESc=
X-Google-Smtp-Source: AGHT+IEHzFbX4tiyXk81YyWM3vVVyfjaUrcaS+9dBD1mfUbWUGyIFKKKPTITHm/gH/bQeokYyo4eyA==
X-Received: by 2002:a17:906:5904:b0:a63:41f7:d44 with SMTP id a640c23a62f3a-a65e8e6c5e8mr162513766b.34.1717081573882;
        Thu, 30 May 2024 08:06:13 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67430f8457sm13531066b.122.2024.05.30.08.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:06:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 May 2024 17:05:47 +0200
Subject: [PATCH v3 1/3] arm64: dts: qcom: pm7250b: Add node for PMIC VBUS
 booster
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-fp4-tcpm-v3-1-612d4bbd5e09@fairphone.com>
References: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
In-Reply-To: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13.0

Add the required DTS node for the USB VBUS output regulator, which is
available on PM7250B. This will provide the VBUS source to connected
peripherals.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 3bf7cf5d1700..4faed25a787f 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -45,6 +45,12 @@ pmic@PM7250B_SID {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm7250b_vbus: usb-vbus-regulator@1100 {
+			compatible = "qcom,pm7250b-vbus-reg", "qcom,pm8150b-vbus-reg";
+			reg = <0x1100>;
+			status = "disabled";
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.45.1


