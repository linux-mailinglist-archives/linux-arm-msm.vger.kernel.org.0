Return-Path: <linux-arm-msm+bounces-49528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC0DA461EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 15:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFD2F7A1FDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB15221D9E;
	Wed, 26 Feb 2025 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PIDCdYmk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7372206B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579040; cv=none; b=YGiDqqE+dlipTCeRiVri7EoYz2INgzLutLbpCIWd4zJBvdOJU0+6u/uFiWCLTBwMY70UTQbLE8qGx+rqBbHfoD47u21Fr1T9G7cidQ8GNptm3mRihE+ZoCCMMLCfLYUZ7LwcQnz2+Gx/EeNXMHK/hnUXsSkOa+Cpi4m7jbOnHXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579040; c=relaxed/simple;
	bh=fn8elkgRSR/QPq4nFjI5143Zz5iXEhgsAPkbVKceBko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtbRI6o3//PX9kgdz3dzt6kv9Haf2ZWXdUTwMv80cKe25C+9ugOmDsIhYLI5wGl+2npWPjDpzGNCfWrQs9G7EJ2wf3k0efpEfch+6+1s5CUmPjTiv+0nosVoXSv7XfGBvXTM6xUcf18SmTbiB2JQOadmlTKuemjnuGYWNPFnvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PIDCdYmk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-390ddf037ffso289380f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 06:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740579036; x=1741183836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/K2OVzTJIisVIYeYej3QITbMMoKoqZpffJDULuTMdQ=;
        b=PIDCdYmkb+viuEaKGbYhv8RhEv7bB4X5HcqmHkAMSNwDmC20DLBSqgr20/i7DFYvTs
         TQmAz991JunpZkQfqV8QjmI+3YKDsMZt6Gnma6exmWMQ6qhZw9lgY9HCC36pAl2ifBdN
         N/oaoXuxwq7Dw903SRJRk+yWPWadJsD4+fd4c5z5yJzW485Ux3Vcx5AJZu093zwrOBqb
         X1xCxE6FFHltlc7vpQYT1EKo6jAI9UQK2iOEyOhVjqgNQWFNx3Hiy8VaynCJImCNitpY
         qh+mEy0r9hMHa9Z8qD9SRnRBR3LjSoOzATYQVEaya+YmhNykDBo7icK+71f327ZFtKvM
         Do0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579036; x=1741183836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/K2OVzTJIisVIYeYej3QITbMMoKoqZpffJDULuTMdQ=;
        b=u+/peEAplptXPg6r/+n4eYm9TCIjmRaND0xKDQ3SOEw6NHPZjTrwk4+wWgSfuwTLqA
         dTYfWUajYWv4y2+/Dtp6O9gVi644RR4C6N6RI6cUFbm2t/pyVw+ptUq3f6WtBG4nvvyy
         vEPcDhpw1rioRyHh4fm3JaRl/Mx4viXjNwBmXRgA5o6Mqz1ob7sq9lkggZQCIS7w5Umg
         aNxIaGKf3Z74zgKvVzU2HcVNI04bodvwRwcWqhExuvSKEbMzykTYS/wj1rPyBmDM+j6U
         eb5fnAYnX5daKmaRQ7a8mqf9XZTlq74FbXiB8FZVzYfRfvuaC3Yy9stiWH1a3ozdTsyO
         s1aw==
X-Forwarded-Encrypted: i=1; AJvYcCVzHP6J6f2eVJJgyW8NkLooIPF7GUrBi4vXjjmcLBWjQXcFq5uIywceRHPjOlDzL+Nwmyf5l7s900ODlHb8@vger.kernel.org
X-Gm-Message-State: AOJu0YzADSI3jcWb5lw+Y337H8vPiHIN23bSbGDxHN75Ym7cO3wGQn4i
	PY7n+mln6bt1MZW7bvwQvH10GqgiZxJgZAELIszSoNQLuvb+SmPrAJkALZgqEAA=
X-Gm-Gg: ASbGncu2Bs0EFKu06gjM1SThnCoHPwhgVKmAPqwVW5hyWb4aNjwMgnibM7mu2i3garW
	pwyC0g+zCQ3Y+h4qVfS9B2OGM+NpSGM7ewQdPqd4aUrcXYmjdOvdQV/D7C9gOoS9aqUD9N9aKia
	WbAGISzZUz+lLKwwVcwGLt6n4RBbLScdC4rHi742ViZiuHv+XAZ/c363UiYsQq3k0lxmU5805Ro
	qNP//PBXbmbiaRhiyMxbFfng54uOOwy7V6MABqi11KekFlcIXHSkMFNrnVBtzR7OIRqnMsLD4Es
	4mRQxOd7wF03agg81kGFMeLGghTl1wVEZHCDBs8jAaUxuj/IzJfUkVZFJuuv9qnlLtCnlnI2X5w
	=
X-Google-Smtp-Source: AGHT+IHoDmGXmyYKL/H0wIDHVZGgyglIAMrlTqOFlOQMhza3hOMOrfR6i0sWAbH8R3O6AiDzN0jNyA==
X-Received: by 2002:a05:6000:1fad:b0:390:dfbb:640 with SMTP id ffacd0b85a97d-390dfbb06dbmr443616f8f.45.1740579035700;
        Wed, 26 Feb 2025 06:10:35 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd70be4csm5755889f8f.0.2025.02.26.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:10:34 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 26 Feb 2025 15:10:18 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502
 redriver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-fp5-pmic-glink-dp-v1-1-e6661d38652c@fairphone.com>
References: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
In-Reply-To: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a node for the "Type-C USB 3.1 Gen 1 and DisplayPort v1.2 combo
redriver" found on this device.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 32 +++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 582b19277de414fa9cbb8f9929c6eebd697e8033..3c134d28e0c1965de55356af9c19c1331b029669 100644
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
@@ -747,7 +764,12 @@ &i2c2 {
 &i2c4 {
 	status = "okay";
 
-	/* PTN36502 USB redriver @ 1a */
+	typec-mux@1a {
+		compatible = "nxp,ptn36502";
+		reg = <0x1a>;
+
+		vdd18-supply = <&vreg_usb_redrive_1v8>;
+	};
 };
 
 &i2c9 {
@@ -1183,6 +1205,14 @@ sw_ctrl_default: sw-ctrl-default-state {
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
2.48.1


