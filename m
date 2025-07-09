Return-Path: <linux-arm-msm+bounces-64223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13321AFE827
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90FB51C8098D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF6A2DCC1A;
	Wed,  9 Jul 2025 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="u+xMDE7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880062DA749
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061614; cv=none; b=eVBmXPWoJSgIkpsq9bRDPh64X6KsVndnG4DLPtO4e438EL8WuYLgaXtLAwwTfeKYnYWPknnUfL4cBOCabKVNdv5TqatWK6TaTMloj7iRc3oqjGBBJZegpfkEfllZzqy1d/YVOPhf5L9IuAh54dVKrDySd3RXKi3ngPoDsr+GU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061614; c=relaxed/simple;
	bh=hC4XiUyCXvfKUfUdujggOXgHdLNV4lf1H8qLCscQ3Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1o8JcPnU8sGnVFCp8HWVau4iGnsYeg1UjlPHoIefpd00d/a1VG6K9Z4+yJQaUIdHD188v6w/0wudyJ3RrGmaUIlgQuBirgslkfgZccDyU+hR59JxzdqNvs/FqeZN22hUAqIjxCvVFxUKDCOwmfANp0mWgVdP8LP0YhA84pBUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=u+xMDE7L; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acb5ec407b1so950886166b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061609; x=1752666409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bpa1qe4qe1U2tW+ccEjSHAObelYY5h6LZZSGvF+pGw=;
        b=u+xMDE7L0X3yoC4TxKZQvTud3oIy5LyXnoSeMEHz+v+9PjCqZnmkMHCSi4NTmBXxbU
         6Z3GE2APvlyDmqvoIzH8ohA/qOxz1FBCAJz7yN637L4WAnSUImeL87RqZ0GnuX2mdT6v
         AhPov5DkFGPPHXsQCRWiRajKyz0W+x7ZuXSCZUMSBIMvUaGUScJ6CG9xToal7gE8+k9p
         5h+oAm72VIWgQnwS31O+AS1ezIYUudUNO03QVY2vROv4tyaPpHIKxUcLl3Q3FML6BFdY
         LVlh0Q5za5gdLYYTXY5uyc5ZqFpmF65ma+J70yQi8yW2qlOx4gHC24JySM+UTeQGNcSr
         8ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061609; x=1752666409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bpa1qe4qe1U2tW+ccEjSHAObelYY5h6LZZSGvF+pGw=;
        b=Ozcuhy7LdyP6UoSHp8/Qau9khMd6AebW7KWpK7XwIkUyplYT2KodzFdor1gC1ZVYxH
         +b91nfaxk/9Xzq0ahhU5jikQQvEqQuKYVL8TOuuMyDsXELSYr9kRnKKCIj2b1JnSlf1F
         tvXulcMFyjOOJcZ072R53w+03o2+hOV06W5s2hHS4aN3VonDsNL2YAYOX7VsC8pacY/K
         PMeJdMT3nAaAKM03tR4MKJoSxeHqOe2YYcm1H01ZdNMtsHdB0QONXU48gsHCQoZ1D/Pm
         JEvAfxswMVpBbZ2v6mfQIlMGLWyPQSxzXavs6+Sm7BEc5jTNlRSUv0jaKIhelvZkm39T
         Mz9g==
X-Forwarded-Encrypted: i=1; AJvYcCXg/DuCKyCVqnfqtyb9WEY0LZU3fjR5/03Dozn8dyLCUAqLTwXr0yyhk2F2wjQ1OeD7d8S4IV4Z5aSgQ9Q0@vger.kernel.org
X-Gm-Message-State: AOJu0YwvLDOQe6zO7hOfLaAcTZ/JTTzpcnhDOX+tN8TdAC/Kw7ZZuglx
	y/AnhXl+HRbOxYkTHVnS3IFAHVK3AyRMNZ2B5/Yw4uXKRKD5tv7fSakSMM6Bawyj7fY=
X-Gm-Gg: ASbGncuYx45DMdrqv8xY22+Oje2MLK/8toY486Dz6fFWZWhYeAF9lzcKIXOYDQiwWFQ
	crIwDo89HKBRADc11nWQccBeK25Shj7hTu2ugbqUzokKn7OvT0BsUWv9Luaegma77u1H9b2xpVo
	iDeqrMiQhjsiYGVvcchYzIAHDuNMrczTshQgAsTAVt0fSF9g/HNg6LS/L1kTj/M/1/h31tQMYHL
	EPydFFOvdn6OAY48WIAIr1mbSTsPip8hXhB3FOs2lC9bLNjZZZDTWpVR7CpfYhY1Dae0NLG0C+M
	CvMZfs0a0hEm1d0scwd3tz0E7t4Avl6bx5cAsTPEojrvaacbVgIK5LENazdC1jUNQWvkGiAX8rm
	R67kxxvXvBxmFRjTQOcm3N2Io2rO9ni5O
X-Google-Smtp-Source: AGHT+IEa3VxKGGtmpJqSqUpaGE5jivuUSxb7qkbnXKu41EclZPptdV4vVLyJP7ntg8X8h5wcm0ceXQ==
X-Received: by 2002:a17:907:c283:b0:ae0:db23:e3e3 with SMTP id a640c23a62f3a-ae6cf5c0132mr248175366b.16.1752061609399;
        Wed, 09 Jul 2025 04:46:49 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:36 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: Add PM7550 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250709-sm7635-pmxr2230-v2-5-09777dab0a95@fairphone.com>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=2089;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=hC4XiUyCXvfKUfUdujggOXgHdLNV4lf1H8qLCscQ3Zg=;
 b=h+IOj2hBQ3I6W+a+vQJaatA2VbxLX/L6dXEb4kRe5+aHbi3nsUWGLE9ZKVDSnGLxp5qWzVFcG
 c3PpiaHPXufAZcvursiA5Rs+k8oJGNcZ1iri5Kab6VB9Dbrbl1zMCRE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. with Milos SoC-based devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7550.dtsi | 67 ++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550.dtsi b/arch/arm64/boot/dts/qcom/pm7550.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..b886c2397fe735edc92f2c3f307eb4d206961f11
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550.dtsi
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm7550_thermal: pm7550-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm7550_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					/*
+					 * Current Linux driver currently only supports up to
+					 * 125°C, should be updated to 145°C once available.
+					 */
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus {
+	pm7550: pmic@1 {
+		compatible = "qcom,pm7550", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7550_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7550_gpios: gpio@8800 {
+			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm7550_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm7550_flash: led-controller@ee00 {
+			compatible = "qcom,pm7550-flash-led", "qcom,spmi-flash-led";
+			reg = <0xee00>;
+			status = "disabled";
+		};
+	};
+};

-- 
2.50.0


