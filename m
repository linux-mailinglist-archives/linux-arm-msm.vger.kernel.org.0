Return-Path: <linux-arm-msm+bounces-62374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C13AE7CB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74B627B66E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60C02E62BC;
	Wed, 25 Jun 2025 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NUPWPYap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A150D2D8786
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843134; cv=none; b=XEE0jHGU2fKTyFePmA2D+OpwLVzoAaKfyKBjrqk40ftMrsdMDOF/lFDyHengGCN1YdlHRi792HFfVigvbL93vwYULw2h52xQC+JtdO90zPYmssjLKmARucT6qLxXC3/WiVzIhLlhBE3sC8wV/wQ9L1k89sI5jnd33xZuO7JAlFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843134; c=relaxed/simple;
	bh=P97hYk/Hj/7qjo1n+kRFwU7+E2ZGne+kwKH4G41eZXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=un6GcybkLjFeLMYcBT4jGwHzgFsuM9F9eHz26XsCLM5kU/SuURIkNzSTmOg35BVO33aLbSLQmQZ7VTrCVkqfEp/nGryy3xisfBHl+fr0vH68N5AAjuXkywp05BRCnzifRG41f2qW5YR+XO8GRjsJjXChc6Q8R1sPnUH7l4TMx1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NUPWPYap; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so677750a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843131; x=1751447931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TP0dDIATi4ERrUaMmJ+CWbb1W8kcq9VICfoUhwUDiY=;
        b=NUPWPYapldcPbk6SKz05L1rJ1Kx+L8QwhlKOuXfEf+RpD99OPI3glSQaDKVlXtJN5s
         gomXkHCnmDuaEuK/k10HbyUUrJbrOo3POsGhjA+zWi0y1gjiJHYa8E575SOfFrh8p1va
         adWSaTJB5/+lXjuTNc/YujVstlla42neF7Wn2xdRv6zjUKIcgJra/1Gu6y1J9usr/CV2
         y1TCSS69uMYJhwyE48wEL7ELAIG07TnH7C9Tih9xdVMOrS4L8qHJXlRWw8st77A+FdYA
         3oejs9phQSR9ZhZc6AZRT+UrPEOcL621ffHjzNRAs/I0kceuXDKAzbh9t6/qryYOdFXo
         m3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843131; x=1751447931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TP0dDIATi4ERrUaMmJ+CWbb1W8kcq9VICfoUhwUDiY=;
        b=qV4htM2MgLagGictIZUyHkoCnXvJFAOO+JLg4/ToscuTZTKm7PCULuGvdr0DrL7ytT
         2fxlLBo/3sBp/flXvCFWThOlzKd+uQoSbmzKChfuhjkyyuXwR3dPaijiaDF7YiiTt4hd
         q+bbNbB+XwA9BPW1k5U2R3+ZovJufTmGphasMYTc2DLGDdYd/+I47vJC/P9tt1nvRoLE
         FHUULrr2WfOenbM+yiHgmfx7MdV78PxRc3yAFxlHU82n0lRoZvsg8VZy7jk4dDEpu0oD
         cvbRla+omIxWSOkooz9VpsOEwAEQgYjgg2U93CT9AZv0nZ8aliUZKukg7QVWfgSYL+wO
         wnzA==
X-Forwarded-Encrypted: i=1; AJvYcCVaf6bU1rr+UuSn5Wzx4dt38R8u9tiH6CNn8k4gRRlvIfQDH42L97V61l/6ifpUcbjayF2n8AxHmdM1+YaD@vger.kernel.org
X-Gm-Message-State: AOJu0YwdzUyz3efg/SNjJCZbIF2Wg2DK9jMsL87xbPOTjUwOc2jv0rNE
	6rJnqPUAJAatuNXI9BGZ6gXjn4GyvTkFvqQQDJr8mKCbQ3Wy9h8uN/6CdIwHWgvHEAdfd68uypD
	YJytf
X-Gm-Gg: ASbGnctDY5AU5KN5dPmhTrgxVGYdwknqk846iC3cF7/l41zQeJTNGMjZvgiQuNKNreQ
	dGmEgXm9EEFdcSo8pSUjpanx3axQ3jMAHdtdu+rAbyT+THy8YW+afFtEAjsLF6Z3iakbCNWQTq5
	r+MDW9la2Wk3asjeG7pMxLhYzudzmvVhjfxNc4cPOZCjSRL2i22BYs1f27jCE+hbquLmjql+veV
	FynQ2cTo4bd1oeFyup9ZJlmZt7zMNdG++tCG8Fvgg6eEuZtymdMldCZtL2M/FdoiVo1fsY9m7ZF
	mlS++LebbOTaY4QI3qK8Vvl/ryqd5UKjpj9uCy15wUQZECf4gKzQ8nGoMRTOA38OwIDAQJtpqox
	3KattGQYEUh38vXpg4DI0Lix8Lo1S4ZBE1NqIvrgs/yw=
X-Google-Smtp-Source: AGHT+IEEGdscEMwvM+aessafAYILSx4LiZ9oh55JoG6lzWaD+B66L6MlI8IYziHgQ7LGeEr53zCpYA==
X-Received: by 2002:a17:907:940d:b0:ae0:b7c7:e181 with SMTP id a640c23a62f3a-ae0beea8657mr226509466b.41.1750843130955;
        Wed, 25 Jun 2025 02:18:50 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b81sm1029043866b.171.2025.06.25.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:39 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: Add PMXR2230 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
In-Reply-To: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843126; l=2003;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=P97hYk/Hj/7qjo1n+kRFwU7+E2ZGne+kwKH4G41eZXs=;
 b=5cKEHZVx1u5i2ve5fJgo3x1rCF2GP3PFrwvP2an7dIvDP5vrvjeu5ua9mRhBFWMTYswaRqpzW
 o4/U/Atpv/vBEvkmZ0W9XBJjxCziWpUp6mk/KFGJjWUSmvsQbZqtgPK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. with SM7635 devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pmxr2230.dtsi | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmxr2230.dtsi b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..a7650f3230c01422b76ef78e897e5e7ae2f20cc6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
@@ -0,0 +1,63 @@
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
+		pmxr2230_thermal: pmxr2230-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmxr2230_temp_alarm>;
+
+			trips {
+				pmxr2230_trip0: trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pmxr2230_crit: pmxr2230-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus {
+	pmxr2230: pmic@1 {
+		compatible = "qcom,pmxr2230", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmxr2230_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmxr2230_gpios: gpio@8800 {
+			compatible = "qcom,pmxr2230-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmxr2230_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmxr2230_flash: led-controller@ee00 {
+			compatible = "qcom,pmxr2230-flash-led", "qcom,spmi-flash-led";
+			reg = <0xee00>;
+			status = "disabled";
+		};
+	};
+};

-- 
2.50.0


