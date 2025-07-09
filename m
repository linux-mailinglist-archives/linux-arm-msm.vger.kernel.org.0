Return-Path: <linux-arm-msm+bounces-64214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB50AFE79D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A64103B420D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B83E295DA5;
	Wed,  9 Jul 2025 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I0s71cy4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E5B293C63
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060164; cv=none; b=AZiciJuzenxGnSOAk49Uc8WBlmNuHPIKdGaNIihTKY+gn1YL6fWrWEvnz2+2eW6uD8fAe+cY9euuXfkyNqYPHa9+/7O2fmsSd08C8Gcas/92jpN+OsYZ2zjWyIp2Kv4Hvl6Buza+s3gH83K1GA4eh8RLWPpwvAAyAO2AkP1xqeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060164; c=relaxed/simple;
	bh=BJ8xB4hb+tykRRjusqg1Tz73bBRJQquK/5arYt0BGeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ahrwhHBDAddbCkqQnXX16LwzZxgrQTGmjWKRvtDkjxSNSBxTHjWTEOfxFvbsBHLWivGbdBMSix02wOrbyTlzK8MfWEWEyfUAETL45TQ6vGoQLD9LGuFBCoC+ifW0t5QdQAXBG9ETK6lJTBz8qoIOrdB7H/Sij9as2EBbGpzxwgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I0s71cy4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae3a604b43bso857638466b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752060160; x=1752664960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5w5k+HV8sFNIt4Z8WUuVtI/36kvxiu7k+wZWXpkHCE=;
        b=I0s71cy4G9Ejk+Z7lA4QbqusERLNd2Cu5aLmY6EYT/OQk5d+k7MXJlRzeP/qBneo4B
         yoxZpPwLCkZwM4ami1e22WlYoIY4t5q7Mup+Gzg0vzNmSstUTIMpk5hMvrI51L/efRmm
         cplHi1hI55WivQE1hSLN1L1/941/OWFRcGJCJDffZTOSr8hYUrG9e8YNhiUoNoDz38PK
         1nwJAscHR/Q3dlXpt96TrJXkfBusL0lkWqc0exJD9WyTFHpij8SK6pLIerONwOqXHpT+
         O5s18OmnqoXXDh9JCG7FdcbrP+rF4yu8OYCILjuZ+jh3KdGRfhHzbmv4NinRnWJ95rl1
         +X3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060160; x=1752664960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5w5k+HV8sFNIt4Z8WUuVtI/36kvxiu7k+wZWXpkHCE=;
        b=h9vNXmyftnymFQUeAYgkd451Hylr3cocc9ZiIrrbMCxPlKc47MB2vsHUdGBT45gw8K
         GAA6eBYLdkNBlK3c5bSeqcNWCHGjBLMQwCz3MDE3ZxT3wcDOLfo9HWeZVqfujKmt4+z6
         jLUCI1bWe8hvWTTTJpT9SaaVoi1hZeF+4SVdy8otoKi8XV2A6M2cKbRhmKTro+thc1AL
         h2hsO5jiBXgNImc65OzN0KUHA5rJMcKyK8Fb1dW6jhMszNFo6nsMLqdRjyHbDWWw7T4p
         Sp8wnmbUil5oLS12gBRK5jpC2KeZnZkNGU3ZlMBeXN+NAVnMiGai4GMiCB9+lvWpy4AX
         yo8g==
X-Forwarded-Encrypted: i=1; AJvYcCVEyvvnLTZPEXHsslhJrlD6miawwb1looHbyewlveAfgaAugIJHpwKKhTJAxcFdNqCFW0cnGQCbk/6hwIpw@vger.kernel.org
X-Gm-Message-State: AOJu0YxiHOuFYeEPcPIvNobpMlJ850uOXVviP3nMz9d+SngxqD24Mjtb
	pDIrQKVJu3dldNqjw/8aYxGMa4HyPygDmd6QJyPWZVLHdxPENtrUiimKYungoexIbic=
X-Gm-Gg: ASbGnctkeDcw91wfA4bfX66MBLSjatvg6NeGIAQpyFWnCmiGFe7r7q/oM7Qpb1aKLcg
	+VH6wJ2Ag8SBcnbRfCTzs7CXutiIV+kxwi/6N7oAcWYAHmrssMLA4Y6FcUutUGyQyiXolIHpJrq
	HKl5SIm+mYqnLFNEk0BqtG6yYu2QICXr1TqJ2AqKbS682tWYhuL5TTPHbll/ml8uIQ1igHqWJcd
	K8UNGz20f49dIahSETgbr0B1Pc7Rr5zoPoAoEQ+inZLAeSwogIQpP3TYyEWeSUsntuGiVjFX74e
	M5RF1rCabreLOJI+LC8g91LL6cxHkP4l/Qx0l1KhuegbhQ1BWLF2o5iwGPICDaK53tlMQ4AnhSQ
	PdFAIpyZdZdPwvvaT0tmgi2ikVuwW6Sxh
X-Google-Smtp-Source: AGHT+IE/cYuqI4vT6pQgasChnZtvTh9J7UXPtPCMD7zDsylvBEkqznTwLOLiwtQ6YL0FyhhxPxWwWg==
X-Received: by 2002:a17:907:97c5:b0:ae3:5d36:aa6b with SMTP id a640c23a62f3a-ae6cf76d14amr222432666b.36.1752060160435;
        Wed, 09 Jul 2025 04:22:40 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93basm1079861066b.4.2025.07.09.04.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:22:40 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:22:29 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add PMIV0104 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250709-sm7635-pmiv0104-v2-4-ebf18895edd6@fairphone.com>
References: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
In-Reply-To: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752060155; l=2260;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BJ8xB4hb+tykRRjusqg1Tz73bBRJQquK/5arYt0BGeo=;
 b=sOru2oGeILUyEs8AZfZlxdJBi6QurntuA+Qc9mtV5d8zfpnOFfQBawp3ZrLfZDQ13dZpOZUdj
 mn8scrOcHD2BZpAYui9TkwB+yt50J7Dqf7h8lcLqA1M2ccd+PZHk8HE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. on devices with the Milos SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pmiv0104.dtsi | 73 ++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmiv0104.dtsi b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..85ee8911d93eae5fce512146a8e2c56d79dee398
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
@@ -0,0 +1,73 @@
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
+		pmiv0104-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmiv0104_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
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
+	pmic@PMIV0104_SID {
+		compatible = "qcom,pmiv0104", "qcom,spmi-pmic";
+		reg = <PMIV0104_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmiv0104_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMIV0104_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmiv0104_gpios: gpio@8800 {
+			compatible = "qcom,pmiv0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmiv0104_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmiv0104_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pmiv0104-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.50.0


