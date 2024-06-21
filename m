Return-Path: <linux-arm-msm+bounces-23536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E750911E5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 10:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B7E81F2117E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF4616D4EF;
	Fri, 21 Jun 2024 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoVwv/u2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C6716C874;
	Fri, 21 Jun 2024 08:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718957679; cv=none; b=f+zUMMS0RdihkegPEVaEiRIR7Yyl5IB6x5vbEbR116DsX8fkCXSZWDL+iBH0HeX6TuVt48/uOhqv3T+ZreeiO/8mBTIAnHT2MV/+GT8XHKLGXxNBA2IJMUX5buPJ8Dh2YiS3jYgsewnBkE60NZnFJF1RhIaBfJCvtSg0jINDEGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718957679; c=relaxed/simple;
	bh=sx6zZUy5VIB9SBJJVKUEdpEHLOHf8uoUi+agdxjrXRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HfnLHFDwnGlvTaDEEaB1TgXEXKevvPyejBGHV/WUTPJez7Unwq2xa5Kd6VSgPD1K+PxSrE6jUrWMHadEBTUcBU3YXCRiEQfmTgEyIQxpHCBwv6Fy9F4XiiPU32kBmg0ixU//D2a79jXpz8nhT7nJ2DXwyQDYm4PEL5GYikkJk+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoVwv/u2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso1993527e87.1;
        Fri, 21 Jun 2024 01:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718957676; x=1719562476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dN7pbOIeGB+YAOoJEuREJAb+fbKo2GeRrfkVrjvMfn8=;
        b=JoVwv/u2rGIeh726r4xhV1XLJCROxF1UoYgJy5X5FdakcGgOFLLEE43OXRhnxtF4/Y
         eY30aRWnOOLGbQwumskCPB9HZHKBJ07u6K5ZIgk4FdDRtSh6cWGcLzZlN+mc82kt/3z2
         85QjkjrKuIbxSUCmS1MOrvOlfZB2yjY0r5Nsnyrr/tks4EijxI5ZNkcQLFGSuWIYUxsJ
         7WaVQ2zvaXlTVEetYf9IMW9apKXW7qjox6WLnjLYbrpEfgVotdT7qx8k4JtUkvaA+Xj8
         mxeu69tXiC6aNphnfw1JjUxeiQSA08RO60P1D/xbN2nUWSZIOJEgDMSRLQ46iXLO33Ad
         a50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718957676; x=1719562476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN7pbOIeGB+YAOoJEuREJAb+fbKo2GeRrfkVrjvMfn8=;
        b=bZBITOXF0RTFrtY/fHXXwOHG32GPv05oczYIoGcm6TAE0YpKSWE/8dhEdM8SgDbPAT
         gK1tf4tTMPOCIKMwGI3IsikFytQZtHLe9j+zv0K7+kUAFuF3BKRYWizG0RGO5SsDI9/U
         4TJsrJ8jDX2oAWzmTkNEovvB9f9m4fonE4T5EXRdj7xtSe9lhKPE3a3EXVieN/sSXI56
         vvkfo9eWfO0vLGTDJxcwsppH4sEpQ2Op8mmQVNCUMPGDty+OCL9i9ANz7bo2c8aCRmcI
         9DwKwVBuxANDMxTD8HIjUggSwzxkExeF/5pr0klyNwZfXghIjyF2+oCdPSEVkGmAKhYA
         RRoA==
X-Forwarded-Encrypted: i=1; AJvYcCVxlJDjhf/F+u/2guFtl/drU+l2OgvSQjTgK6xwmWt2QKhJthVvOjUdW9FbW5sKZKbcwjWilgr6ucEyVsJCX7In1bQzCpp2XbbpJ1L3xO5vDwj+upubfnpiq645B2y4N4MStedTtTemnrgTl+/b5z1t8CsI2yXgiI6YF28iT8V/6tSNe6eq
X-Gm-Message-State: AOJu0YwVvgnl/abDjNhBi70iMaXZ+ft1cyubEo0sVx27JEpgbomrt9y5
	jBNoS3jjEo7XPmdYB3X+wOkPzd6oZ37Cl2ufxZ8PXX23TIBojdlCIWb1ueGq+uw=
X-Google-Smtp-Source: AGHT+IFToMLTDsbNWUqa1S95WWcT2xRiuaQSi2Q65EAvHKeFzZ6Ry3FNrm8CiFpbD2600hwAlBoK4w==
X-Received: by 2002:a05:6512:280e:b0:52c:8b69:e039 with SMTP id 2adb3069b0e04-52ccaa2a937mr6722555e87.4.1718957675371;
        Fri, 21 Jun 2024 01:14:35 -0700 (PDT)
Received: from deepthought.lan ([2a00:1e88:40c0:c300::729])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd643e419sm125548e87.243.2024.06.21.01.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 01:14:35 -0700 (PDT)
From: Valeriy Klimin <vdos63@gmail.com>
Date: Fri, 21 Jun 2024 11:14:46 +0300
Subject: [PATCH 1/3] ARM: dts: qcom: Add Sony Xperia Z3 Compact smartphone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-sony-aries-v1-1-bcf96876980e@gmail.com>
References: <20240621-sony-aries-v1-0-bcf96876980e@gmail.com>
In-Reply-To: <20240621-sony-aries-v1-0-bcf96876980e@gmail.com>
To: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>, 
 phone-devel <phone-devel@vger.kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Valeriy Klimin <vdos63@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448; i=vdos63@gmail.com;
 h=from:subject:message-id; bh=sx6zZUy5VIB9SBJJVKUEdpEHLOHf8uoUi+agdxjrXRo=;
 b=owEBbQKS/ZANAwAIAQ4Juwrzgg1aAcsmYgBmdTaLyfN7SvOresfUVz4EHjsny78ta/QBAk2+o
 sliDU++Eq+JAjMEAAEIAB0WIQT/ENLr7ksLn/+UbhAOCbsK84INWgUCZnU2iwAKCRAOCbsK84IN
 WvrKD/0bZHAvuLdQ/1rAdeSeyKypy35SlLX72ppxgzbHefckIduPMNKl++h48cLVkETw/BYWAvf
 C1P486jBYhl0BLP17VJ0n9TRGr+4txrn9oWKNBlgLXfAYcsOD+ODWhXpqodFpAQZ/DCYtpaOq0D
 9H+TjJWhkEJTBqkmCorLM/TbG53SgoP2j08sH1XCHNtOFQ0GXsr4llzW2Av8a7LfWkcADMw4KMY
 9h7H88yx5eXk8XwX1heRfiDoNd/1381iMansapbFt1XIZrlkvoWerqJARGJRdZYEQjd/XV0g5o1
 6dZZiiZRWJLjiu0vdwjCgwXEJ11nYw93kHI1wazG38qWYfDtWbTxyQNOXTERe0bp78V4kt08oAv
 0Ve/p0psHLjMF7Y9OBVTnLw3dUFxP1ACiEjaUs5wkX8JzqXVHoXxQmbtfhyjRjYdAGtaCU88SQ0
 f3s+P721Kqao6ERQKr1fUuzpRs1HKS5SAxeqz4lUJoujNG7ADvGn3IJRXUoguSG4P/q5xgtxwqW
 zv9FiqvMFZstN0a8tv2/wyO75stfjkln9eGvoYu9SLJH1qk+fYbjBZK65pPSBwK5VxNGD9UjcTC
 RavSYOxiU82+hKjrlmmb96cTgQd4QAa4L7UrienVV6sU5bsqkJBG/ER8HqjLpVgO19IjvSM+y3U
 E3+w7Yh8qq5psOw==
X-Developer-Key: i=vdos63@gmail.com; a=openpgp;
 fpr=FF10D2EBEE4B0B9FFF946E100E09BB0AF3820D5A

Add the dts for the Z3 Compact. This is currently almost the same
as the plain Z3 as they share almost the same hardware and
nothing device-specific is currently supported.

Signed-off-by: Valeriy Klimin <vdos63@gmail.com>
---
 arch/arm/boot/dts/qcom/Makefile                    |  1 +
 .../qcom-msm8974pro-sony-xperia-shinano-aries.dts  | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index e2e922bdc9e9..d057396cfeef 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -47,6 +47,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8974pro-oneplus-bacon.dtb \
 	qcom-msm8974pro-samsung-klte.dtb \
 	qcom-msm8974pro-samsung-kltechn.dtb \
+	qcom-msm8974pro-sony-xperia-shinano-aries.dtb \
 	qcom-msm8974pro-sony-xperia-shinano-castor.dtb \
 	qcom-msm8974pro-sony-xperia-shinano-leo.dtb \
 	qcom-mdm9615-wp8548-mangoh-green.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dts
new file mode 100644
index 000000000000..2621c5928b6a
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "qcom-msm8974pro-sony-xperia-shinano-common.dtsi"
+
+/ {
+	model = "Sony Xperia Z3 Compact";
+	compatible = "sony,xperia-aries", "qcom,msm8974pro", "qcom,msm8974";
+	chassis-type = "handset";
+
+	gpio-keys {
+		key-camera-snapshot {
+			label = "camera_snapshot";
+			gpios = <&pm8941_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_CAMERA>;
+			debounce-interval = <15>;
+		};
+
+		key-camera-focus {
+			label = "camera_focus";
+			gpios = <&pm8941_gpios 4 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_CAMERA_FOCUS>;
+			debounce-interval = <15>;
+		};
+	};
+};
+
+&gpio_keys_pin_a {
+	pins = "gpio2", "gpio3", "gpio4", "gpio5";
+};
+
+&smbb {
+	usb-charge-current-limit = <1500000>;
+	qcom,fast-charge-safe-current = <2100000>;
+	qcom,fast-charge-current-limit = <1800000>;
+	qcom,fast-charge-safe-voltage = <4400000>;
+	qcom,fast-charge-high-threshold-voltage = <4350000>;
+	qcom,auto-recharge-threshold-voltage = <4280000>;
+	qcom,minimum-input-voltage = <4200000>;
+
+	status = "okay";
+};
+
+&synaptics_touchscreen {
+	vio-supply = <&pm8941_s3>;
+};

-- 
2.43.2


