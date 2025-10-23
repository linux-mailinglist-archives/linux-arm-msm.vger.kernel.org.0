Return-Path: <linux-arm-msm+bounces-78565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4EBC00C45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C9D6E5065F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982F630DEBE;
	Thu, 23 Oct 2025 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VKvLSr2E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F3430E83C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219171; cv=none; b=DfoIdAU6gcTwB49mzTl/ufb3nDlV/fnaKZrXYohvPsZu/XiuaInyuXXitgPyBCgYqL5MB7YUosLOukY/SLdDGKzST1QXM75mBOkp84HB95fnMjn5gpPqROnEnEt3gaVk2BPBZbbmlvtvDprFK/tt+sNs/fz2ZUb3rv1RECfEsAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219171; c=relaxed/simple;
	bh=VrNwvQvfKelfjsNL39NDV/Pr5hRkFpgryYK23xxuGu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHAm8EeuTTNo6tMV1rAqACpKBbNiQVuz2mH7OtdRUpHwftKgHCLUwIJvINXwL4m4WVhY2Xui/VuOZixZymBgzTuVy/kQplT3ymMKQ8oxjIB8/q/yA3IwZfkomsbQmhB4dXGW2bR/PNjgDu69qthM8FzBB04O7tc9jZ7WXzL5XCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VKvLSr2E; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b5e19810703so116124566b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219167; x=1761823967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FvWczutByRQszn2cLDwkyaS9cC21yJeCI2ighUyDzM=;
        b=VKvLSr2ENU05eh3nOi4c7i1f5BhnT0JUwH0rJZGXChuflAHPGG7f1RZ4jcNUCvfyWn
         xd+Yid58NRkG3RttV5RjHKlIq9nw472mjw9GskxzqPaCTVFmJ+xFAVIVTDRNENVV2Wi5
         4itWNOIaU5uEkNE70WBKJ9fALdz9MTXlHGznWMIYNEVaY4PbrsPY2Mb8T3FrXd2hqwWJ
         Sq7ovF34yEPndI6HLK6b18eK8tCvB+B8xHpYYWICw10SV0/2VHtwidXhfkJaRTUrhvqv
         4yyeOQF/1RoH4iJMY54na5RwjjAvPgy/jscw8WRlU/2nMRjbj2++Ir0YAITUHlJpC93S
         vE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219167; x=1761823967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FvWczutByRQszn2cLDwkyaS9cC21yJeCI2ighUyDzM=;
        b=oEXXbq/nsLKiZqIUL7X5dN2Rd3ZeQPHBtsleCSGNLy+F0tuUJCdHr82FoUX9DeJ4bJ
         4PkKgn4taN6qp5p5iOfSV9/GpN3ooltjMpYzYJB3DR1e8UgoMJ2jez9QsqYxsTtYT7gh
         MF0HmwdtGZcFrYviYCkOQVKDbj+axIbMTqKZOAgO7Wf24839AUx+ZaqbgwWn4njZfE9H
         gruKZnXmXJ5QrS1og+AReuOo/9ve5Tof6SlEZ4aOZW3NDQHrb0hjfMPWjHJdSy9TIQkG
         vs/b3P1UOg4LqXK4zbLL7y/o+z9iGjOADzI49fC8FIeTROby/TPSr24Vohv7R0MIGvXM
         OjZw==
X-Forwarded-Encrypted: i=1; AJvYcCUr/j7fycq1P2NZowfABD5B/rsU/8IjLFOPE3oSpp13GWO2v7nEz1/Gx502x3P5CCaFK0DgN/ByuAcTtIfi@vger.kernel.org
X-Gm-Message-State: AOJu0YyaR2fZ4JZ2WI4WIgjzoX+XkdeQNmsNlPFNe2NPeHXJn0yZMRiP
	Hm94rG5hCYorRwKUtEeIHdKjMnCTDoo1yAVq97MnThWhkNw31UV6BKEADuA+ZI7ImPw=
X-Gm-Gg: ASbGncu1T1/T0ZYgSsQ9WnVIcGCLvTYLAl6xIBAmXO2w8t5rGja40PJY21cdxtLbpga
	HfWeFRKOh3JpEIch8Ad9dA84np1CXMPk1svmJdpSrBZSAq42KS+pbIIJBeoTIv7zdDmLrzwgwxa
	xDs1x8Op/n65GHnAZ2ozHHR9M6jCV2of2DA/V1safXxArfxVCwlssDNrEZBuaqIn/8jI7vf1Ngr
	t7csp0CqkZ4c2GPYEisyKeA7d4Ex5GC8xiFLC2bFcxu05cAJx1hXuJo51dXsWN5dRMV1cFQwxe2
	2yoFbv2tKuUhOUyHfirr0JeQbzPUIZx+mfJwaDabxrulE6QtvLQqdmMQOlz2qzi5uuGkgPA/aNO
	vQV81yn6pUMUe7ceTTWDNyksIaHGR5l9gwcg/KhyIBF7gokC5F8edQGwJw4K8zJzLsCs/v2jCyd
	Uby2kX3rqxuPpkgzpr96RiHX1D54lnNW30DlY+9Ks3NlLPmw==
X-Google-Smtp-Source: AGHT+IH9Dd5psNqWeEfzs5C5WDQnf+kwc7VZusjUHqTftWu4ybm3zPVgqZTXAL85Q+86yhvlI2NMXA==
X-Received: by 2002:a17:907:3e21:b0:b45:66f6:6a0a with SMTP id a640c23a62f3a-b6474940f13mr2873736566b.44.1761219167068;
        Thu, 23 Oct 2025 04:32:47 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471ef6sm183087866b.72.2025.10.23.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:32:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:32:27 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add PM7550 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251023-sm7635-pmxr2230-v3-3-f70466c030fe@fairphone.com>
References: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
In-Reply-To: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219151; l=2094;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=VrNwvQvfKelfjsNL39NDV/Pr5hRkFpgryYK23xxuGu0=;
 b=LITtwk2B2ra/A63gTBSxvj5T+8xvMhjvBIUq6RekYdT03g4nS4NJvFGWBL4db9lxly5R4rCM1
 IXGzn4EqsZpASHqeKavP7cdKOUaQUtybwgd1YFp4m4Awa7sL86odCK6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. with Milos SoC-based devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7550.dtsi | 67 ++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550.dtsi b/arch/arm64/boot/dts/qcom/pm7550.dtsi
new file mode 100644
index 000000000000..b886c2397fe7
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
2.51.1


