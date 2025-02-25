Return-Path: <linux-arm-msm+bounces-49330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 068EFA446B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55627881065
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0A219E98B;
	Tue, 25 Feb 2025 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWLlHJIr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF3719D892;
	Tue, 25 Feb 2025 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501570; cv=none; b=U4XynhDD4+OETOj2/h+rZLry4Ez+7p073N7mWjfuHGoDry7SCfwbE2ODQRqPF91Um7frIsPl5O9tlObfNHd/3lJ1efobZ3xP9FRW256kkAsw6wu3TXo5tBW0wnjWVKpkk0mc43/uPm57lSz1mo+wRyfSryXcdf2d/YNh7B67jR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501570; c=relaxed/simple;
	bh=dlgcmmRAJ3MoneeImOkiyCmgGQmRXGdsz+RvU9rtPRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D2CrjW5C1/ea4Jb73axpMKeIGZBr5TSPb018hNCJSEEDmAniPVZPMqmiVKNepEhVFt7XQ2lLGziIr7HK/MykeT7Dmn/MHhfyr7DU+mGtFe6xLhc3wAzjWHxlMLqCphUaNIYxXiZgwRqBJVW0IZGcAg3v089LjauGna9/jzra7BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWLlHJIr; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abee50621ecso67646766b.0;
        Tue, 25 Feb 2025 08:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501567; x=1741106367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2f7ELYVZ6i0Dpu4rh7kF+9M0py46gZ2QUyL5S6CNu4E=;
        b=PWLlHJIrSYHenHBM8EyZzX7NxZ2sJ7w6cK5FTHUIACfk1H1h6t8lGRp9S6l/SCIWWS
         FZvqaRdRzsZKIqV3LlD4/7hOw+cjbCSWzBDNpyB8Y42yxLh0Y6FtoEjHx9NfFOfI+wjM
         f9MyDWUpgzhAuB8hXjzHzXYDdR/+QGTEJZ86kEnJLuDyZiCtSzwMlt2nBSb4YzpM0qvI
         BmoeZFoVRE06sIOSok0bJrWrPmndE8tcnC57VvNAkGMu/+Og4NfRbHruK1IkUBaW7Sp5
         1L5b3wrZl0Y5DRAx+5bUQ4dBVe9jJz5mpnRHXWOimFBOxhLj7hqvMnbRNLSEoxgzdG7/
         yk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501567; x=1741106367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2f7ELYVZ6i0Dpu4rh7kF+9M0py46gZ2QUyL5S6CNu4E=;
        b=DN/RkDwIcUmq6s0Ok17lo0W5kmAYNd+NGLdFgvcNqBpYV32fDwwnRzIt7fbJPvXYgv
         Kc0LEY70gX1Y5o2vJliCrxqXvhMraDZEArhJ8O2GK0RIWz7e7lhwesmTNuXuW5SYU0bg
         QU647oV1Ny54j+t/cbwXlJLrnAuZyJDk7agnQi+C3NUmsYYCpevscpGjdCC52q3Qx9jT
         z06cqT8MHHVd0oFyoGjjxzs/k1bW5QrfRfVZOZwKw97m165VvIHSTJUz/fJLuRfClauW
         fD5yWtiTDTiPf6wO1/x7fxmB4lc11PwC2svV6oFD5+lj5n76qM0vWZV535OWBMhBvBED
         hsCg==
X-Forwarded-Encrypted: i=1; AJvYcCVcLhnM+U9d8ZRQu+0I4X8WnZ1lD7WpDOCQRMYcJg0yhh9hbAYiCOYrmfa2GmRB7cItuVYGxKUdd4AN6/ir@vger.kernel.org, AJvYcCVfuH4UA0jhMAwy6IdODWxFX7kgxznOtIPpMJ5hp8/nWAW1c1342X838y8Fdo44OoteglhQ2ItSe1xp@vger.kernel.org, AJvYcCWogPteEjjYudPnjyUJYl3O8MZ9cDHOzrYA8E/Bf7276XSKmdJGljxwS5vA2MCkbtAVR8BZdoNl45LlkR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdAmn9uqUrMCr26oQPaoeO99wOQta5JWU/GhD0+IqwvN+MrmNn
	69Mo9cZYcE1LJTv36XNbBerYUcxr+SoU8geYQ9ibpDPs2kkC6SZ2czSE1Prh
X-Gm-Gg: ASbGncsmgVIRhonnotAx6UHkl5eQs4k5IBSDcMzy8qNH0LTR/LqZdQdWn95yFKTDX4V
	+V9TeD9ejHRyJQHGQV/byTK8tpyTKpxbX8vFMqCo8gO/dYjRVqE4ENTbOVpW2G8iind/mhfuwB3
	tEqWYwoxAbsISQ2rxcAhTKjWHdO9bd7a3TNdh5KVSvGL1cSGCAheRf5tYkDvqb86UCG7Tp204od
	7xt/dA/pgLb30if8guWkf7lOraYowMMv1qQocdvyDTafZEdFRIhVKFB7xBDdFVzTNGz1XOIdMc7
	6a5nREpXBpWpvynicBhfTT6+
X-Google-Smtp-Source: AGHT+IGF4yyW4f5btd8dj8kwWjdtS2hNOnzo+chzCMPgRXxopPYKcipoyhA0cS1HVSZ8LAtXOm8mQw==
X-Received: by 2002:a17:907:1c07:b0:ab7:f221:f7a0 with SMTP id a640c23a62f3a-abc09bf5687mr1684148066b.46.1740501566533;
        Tue, 25 Feb 2025 08:39:26 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:26 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:38:57 +0300
Subject: [PATCH v9 06/12] arm64: dts: qcom: sdm845-starqltechn: add gpio
 keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-6-a5d80375cb66@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=1907;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=dlgcmmRAJ3MoneeImOkiyCmgGQmRXGdsz+RvU9rtPRQ=;
 b=UuMZC1opvRVv0HZTUYAXDjosMR4N9e5Jstq81s0aW/J0NHU4df/fYQg6xviaIBrlR0naK/R6+
 Nhqs8n6nL7RC/7jl4TvYq2HWWbVDa8fhY0sQCHAPPuT1HAsvOJZCj1e
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for phone buttons.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v8:
- add tag: Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Changes in v7:
- s/_/-/ in node name
- rename key labels
- move pm8998_gpios with chg_int_default pin

Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 5948b401165c..38c09e50ccfb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -7,9 +7,11 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
+#include "pm8998.dtsi"
 
 / {
 	chassis-type = "handset";
@@ -69,6 +71,25 @@ memory@a1300000 {
 			pmsg-size = <0x40000>;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		key-vol-up {
+			label = "Volume Up";
+			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+
+		key-wink {
+			label = "Bixby";
+			gpios = <&pm8998_gpios 19 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_ENTER>;
+			debounce-interval = <15>;
+		};
+	};
 };
 
 
@@ -417,6 +438,11 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&pm8998_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
 			       <85 4>; /* SPI (fingerprint reader) */

-- 
2.39.5


