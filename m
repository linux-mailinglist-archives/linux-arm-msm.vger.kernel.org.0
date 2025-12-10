Return-Path: <linux-arm-msm+bounces-84853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1706CCB1A02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F635302CCAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855D7230BCB;
	Wed, 10 Dec 2025 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EJ4uS21z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2C2264CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331058; cv=none; b=C2FUbLuirF+0bFyV034U0MdgrONWxaRZ7po1A/NCLBj7CYxjmjfPcmd6Hs338pyrFpRm0ouoq03SPn3x/b9EkT4Oc5JsA3NtBRvf+jm3toH+zejeDTGgkbKCb3fltrqYz9Q+Dz0Y3cehGstf6FX5OLywilGdbvSiQ+RE4+2ueU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331058; c=relaxed/simple;
	bh=/3f0t4BZ1kTyyQ6hLM2p+V6L+8Ptg1VnPTNQ3bym2iE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdO8ad8ZlZmrkTRcE3SfG9S1XB46/KHkkTW5m2fnw+7awOZ7b2DMIddv/cIR0/reIf6qzUrXOeSQUknk/tCJi8HwmXSW28WkhAmgzw2K8jjDKke8vnmRTAAtR0zHA0Z/FzZ0Jh/cEEqxNP5gkp8tNeimv2hNEHJEioNRJD68GRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EJ4uS21z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477632d9326so42275705e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 17:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765331055; x=1765935855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzEHSBM8EKEFfz+/7Xm+vBx/uKXNxWFQzQb23oP1Qig=;
        b=EJ4uS21zhi2/KLhQygJ2Ct9XRFBcIJYjURja7fPGml6kdXkeI9cAqhJ8Wm6CwCOOon
         5MmCmdyheBkka5nCeQmvbYqNIGB2EdSy8Yi+KPMKiqiHlvG2B9ZxT4muAilLZzx6AK9o
         47Y16D/SMBv5k4Mo1l+yrzUZdUzU9btj9N3PvPOvUD1qwJKGO5jGe6BidWZdXMAyh854
         trM+CrDLK9T4o0uKCVyFf8cS/3qEsr04ogmJmd657IE3lCrMckAbDwQBDqzTSbrlxxAL
         NAlIh0vy1c8te2NeRSYc8gOR7B7v2uIepnZjJDqOEtC5v9jClqblxXtMQ/BKCSOgf5Wm
         36Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331055; x=1765935855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xzEHSBM8EKEFfz+/7Xm+vBx/uKXNxWFQzQb23oP1Qig=;
        b=nS45CponJdPq00BHJYbW5GCqIY9WVvTRmyCwwGbj45wnIVtLUuMKuqlgj/SDOf1cK9
         1msImpjpNMVUUId9yiPL4ruoDLwkMGCF7TZ6k3KHFkVt1qszsIog1cmm/nYOTvy8V89u
         4vK0SpRhxYGGNx6NEHuIlrz8yt+TV4gku4HwxX8RRZCILOujoZZJLLFYmGwBMQbswuNl
         CEo6MBEAdHXZVWQ86/QeOcHOUZyVIbPNX1wp2kDSZykhS5fX3xhLCXjqjAoo//NK4xzJ
         dSKCcQlrzCsyTqmFShmBxE/iibrAz5mYogZaKz8coXjZeIUXU/6It5jA1xX1SclAcZWv
         Kw5A==
X-Forwarded-Encrypted: i=1; AJvYcCX0y/1UGCfhAaenV5eft9m6uz/wVP9hnvIgg6RIyWTGlj6YVziGmShrSdTFa/6czAHbcufLof54yggPEgFK@vger.kernel.org
X-Gm-Message-State: AOJu0YzSyF67i2fJ8EevtCp4sTy44cCxV1sY1kAb6zWWfmozSkk41SKY
	3V0gK775GpPKcTZvSoBHAQBMUR8pxKY7w5vLlmxP7hvIe7+dofqKSP5rroAYrmG8XqQ=
X-Gm-Gg: ASbGnctwsrhz0DwfTSeFOjwhi5AQ9f0ET9V0CFqUUcucDtA11YgOIooYba6o/u3t5TR
	k/YHE2Fw/59YQKEbd6Se/Zstck25xT0bwsg+jzgidr5wvthWSLJ7zBn91ilr2mV5gZ5JxI5ayL7
	2kRmAIdTjhzUTJp3wGOuwRf193zl3M1UUPj1WrGnnqfujSTp88N6JIE1u+L67j11WioabGt2xnG
	MHv6z0322tpG7tQ4r1YzWDQ4ypl/teoXwoeGclJ2ahYQxyQkk7dfK+gycVGKmy4i1x84YEIMwlV
	wo3TtTGodSGR/XK/OEyiR4242gbrz+ZzkuMHYZxry141op2rQXGLZp9acFwdDcjr/PeMN4q3coi
	H+Tw/nyEbCbOiCc3Ku0KfYAgDzggbjP911jeUevfKdmc9JQT/rYBaxXg9IVDiaJsa7E6k7C2+bs
	XI3ZtUgPe8lGOvJHrFaqE5X77EAXnnbptWbuapz28VyIGBiquBSQ==
X-Google-Smtp-Source: AGHT+IEpb8pZkLOZmhq99p0rKl8a6UhTcVeHwd5tDv1ixcq9g2mK9P+mksQcDeiot2w3P8jiZMQnmQ==
X-Received: by 2002:a05:600c:198f:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-47a8384c2d6mr7043475e9.18.1765331055026;
        Tue, 09 Dec 2025 17:44:15 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7000c984sm705234a91.6.2025.12.09.17.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:44:14 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:43:31 +0900
Subject: [PATCH v4 7/9] arm64: dts: qcom: Add PMIV0104 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251210-sm7635-fp6-initial-v4-7-b05fddd8b45c@fairphone.com>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765331010; l=2204;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=/3f0t4BZ1kTyyQ6hLM2p+V6L+8Ptg1VnPTNQ3bym2iE=;
 b=JHks+wlOz9dw6vQB0HKk0ZK3dlNr3cs4hUE/f7/+7JcDmpcSweHGNYwVniHnAzAT6bx7wHkUE
 qyEky8Ll/afB0lSIPzc346s8Fr8ngztmwAkkRKXRKhaL34MDBrehFKH
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
index 000000000000..85ee8911d93e
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
2.52.0


