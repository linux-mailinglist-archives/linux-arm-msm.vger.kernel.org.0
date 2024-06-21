Return-Path: <linux-arm-msm+bounces-23596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B0D9127B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B411D1F26B5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 14:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FBE38DF2;
	Fri, 21 Jun 2024 14:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDVqMwCh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297412BB1B;
	Fri, 21 Jun 2024 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718979993; cv=none; b=smhmXvZbDG9Do94awBcDaMSecXWMMsQXZU8SQ6z0+T6FC9J3MSCei2YWBUSHojvxJJ3zUaJCly6GStQ1E9VAEF8Qk6IgSymFDmGOMlPBOzIXn2plNArq0Kkuslkx2hhyDx/E1d9/wRANHT6ITV4RUgCzSGBEj037EKCZzjhQnCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718979993; c=relaxed/simple;
	bh=sx6zZUy5VIB9SBJJVKUEdpEHLOHf8uoUi+agdxjrXRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2xtOEkl1wnpGolSqKWdsq1bLj6rWAfXZUAGDoGuQ0MCDDUFrjRN7FpywNENnq/x6XYdMtGznEyVCMKoo4KFPJ4HyzOm80HLEh6FVZwjZzeQZjOrcjUCRHo54Fq8+D4e9tKTt1CKay7hx5HeuuRmcaOCJZV2WyQWyFToyJe8sBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDVqMwCh; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c4b92c09bso2899795e87.1;
        Fri, 21 Jun 2024 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718979989; x=1719584789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dN7pbOIeGB+YAOoJEuREJAb+fbKo2GeRrfkVrjvMfn8=;
        b=WDVqMwChrUwzC2a+nKwqCQ8fVviQsz+47JorUzzAMv+vi9Y3zGxgvc2ZDaEVbXyhxd
         egAklrqffcl/WlX40j6kiaViHKAd9Xhbm5ehSY4sq+joU9La7haXq2lV40qNfrEjeiq6
         SO7lJguE7imfeB8Aw4Bl+aPyYbV6+cQjV4FNcoIXjO9nVO+C0dMCcc8yx4LJEk+NE4di
         4z6TlqldcTtnaOY8hkSHtSbX06wkeMzrarmp08/fVVwY0V5B33xLvZwO0F9ozjLtgoZZ
         UPm1nMQJXRWpeDOTw+nuqrs1Oa2rbAa+/qg158SM4/ccwxa7Dqig7a1deMycKiWAunKN
         M8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718979989; x=1719584789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN7pbOIeGB+YAOoJEuREJAb+fbKo2GeRrfkVrjvMfn8=;
        b=by4yVgK6Dq7tGWLZK8wPftnF9N26p8aJkJTONvxnSaDCZnvvjr7RHEeNUXQGzEOqSQ
         mFhQuuHrfM0w7dEtf+J0wGqc0QNw1xEoc1R0GeNzGg4c/fJuPOs8rsfDcJ58cd1ww9Pg
         n5rOBWeuF7NCEL3s8x6bui8KKFgtRy+cAUC9ZcRwF40wu/BXSDv/hdV3SKefeJslW0mA
         0lEE0n9hUy9IFlH5FUdpn6FsrZ4fT0m3vtsHSa42IFNxz0upj3o9JCeu+BgQAsUAuEqe
         ly+uiLoY5W7hV0R1/hXcVdnZO8JX5/zZe2uwmVE83YZt6ZCzdZgw8Raa2LOGUUW9FNPX
         i31A==
X-Forwarded-Encrypted: i=1; AJvYcCXnUq6HWJ4b/zW5lNyUp3VFWo8lnbYZ9k45DMA2PgMXM4s9w0yGK4dzJ2W8miSnjn2SjXqsV0YNaFL1CJ9PJTtdpDmX819aKNOI8QuKAZc36k/Z639knoKpWJ0en59J5/oGTMjwUqx83whtGBGh4WVWq2Fww6waIHGzkk2H+duDwcztZTmc
X-Gm-Message-State: AOJu0Yy9UZob2WvrsZ6Z7M5afLitSgiyz9AHkMzmuHT5y8ilU8esNmsQ
	NsEMu1u9j/SONstTHsnquyrOHBvbL22lBQd4OW3BLzKeJ5V4gYbV
X-Google-Smtp-Source: AGHT+IHkwO2P9tATK6aGRG9fGsYo6wQqTRLCALr9EGYZMLwYJBpBOF+GMgGHW2sRbaeSrEnGzW4rmg==
X-Received: by 2002:ac2:4303:0:b0:52c:d7e6:8d73 with SMTP id 2adb3069b0e04-52cd7e69e76mr1277432e87.18.1718979988900;
        Fri, 21 Jun 2024 07:26:28 -0700 (PDT)
Received: from deepthought.lan ([2a00:1e88:40c0:c300::729])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd6452602sm210890e87.298.2024.06.21.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:26:28 -0700 (PDT)
From: Valeriy Klimin <vdos63@gmail.com>
Date: Fri, 21 Jun 2024 17:26:43 +0300
Subject: [PATCH v2 2/3] ARM: dts: qcom: Add Sony Xperia Z3 Compact
 smartphone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-sony-aries-v2-2-dddf10722522@gmail.com>
References: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>
In-Reply-To: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQ4Juwrzgg1aAcsmYgBmdY20Kb7cR5CXC2j9Fu8n5Kv+HSNoRK8quglmb
 mwXawBox7OJAjMEAAEIAB0WIQT/ENLr7ksLn/+UbhAOCbsK84INWgUCZnWNtAAKCRAOCbsK84IN
 WoKDD/9HTTZt2WW357I7QjD9jVjDsKydAO6GkHEZYIf/SwbbvixZ3RIEf1a6ZXJI21uCxezGKOC
 6HVPeS3o9eeca0Yw+FCFivfbFRVf8pVR+BCYZmuLeP4+Jz+i34DOm0dhTKThTePt0cmOwafzCil
 hKdY6Fyosbs2fOKDQn9oAL/0swxa4+BJkN/BRrlmmwJUJiSTrXKMAFMi6yRUBAUCsCD1CrqNtLJ
 xl6eu/e/63bW7+sjZZ+kCBibnh5GZiyakjypcAlOHL92l/Bb/6hvTiNV20ju0V6Q2FlCHKl4TMW
 wRo9f9IvwYrPad6th3Sx1a/XeZ2ltFNGKMqH+BYWZAQ7fZq6JyRhoKTQbUIIoQWRYkgEr1l9uW4
 gsz3RSBbaUV68VzIbMsSoM8u9sZQK9HLBgbsJhqSFsAzTA36Tend4LCHeAyy7QNfctKPAOsonwM
 beBpmSMq6TWu6QFOhYVVUPyvsYvlezyEhwxwi3Grqb+QY3FVux1BNgyLXe0Kk8x3Tzagoal7X50
 Rq9zLb/yPw8MwFV1J4j2QmJ9/QqMp+zWiPoSI7kgzcam4sCNOn9kDl3AdkWqqgaq6ote7yIwIFq
 o75n25EMTDsSSXfH6LQekNAQMOCO82ziK68BuXYn9F2749kMeirvtRzs4kGFuh6m0pcV7f4wct3
 p1iB6h5QqcgS9/w==
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


