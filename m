Return-Path: <linux-arm-msm+bounces-23528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44801911CAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 09:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC92428171C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 07:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD80716A957;
	Fri, 21 Jun 2024 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sxJ0KF2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B7129A74
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 07:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718954418; cv=none; b=VE1oE0+hciZV63jaoXrbnyUiHLI9ruZXJygynS7tpJTivd5lbGo87/BcQXFWjUDbUU06xMIrG2lh9EP0PgJpHl8hI9h6otQ1u3FTXU+fcmb2sH6SLKhOtfmwAq74Zs85XNh6G+Viby1NGvaRm8yyKWOqo1PPPMgaH1B8vtxqIA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718954418; c=relaxed/simple;
	bh=t8jLlLaPt7HgQYzTiRKl94u6YcCd5WOFNW7BM1QEekI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZkberQzwV3QzrkGj7h1BnVTNCpSp9th3eHmiA614n4/HQrazEpGJ99sMEUxo1qjdmmbKDkm0jcK09ET5jkR0y5dDlCr4rhEVeRANIzYzKd1WCX0IVsWDSCaCD6C1OWmmK/lzsaTmZVA83+3LnG3iFiuGdDP5pp0/zJP+U2vEP/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sxJ0KF2x; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4218314a6c7so15268965e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 00:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718954413; x=1719559213; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bPTHtpvyjImpyOToTQ3GHfMQDmZuW36ZJz7nu4CIQJo=;
        b=sxJ0KF2xYwCYGfSjkm5P8yawZ1EVVe+gAJWzTZNNiyjbCQtl/BjyUZqCCY+SkSYoxV
         lM8KRuUAXpLuztscr2GDu4A68hgljNXgplvsXMCd86EJWUWu2bkwUoEHsFc4QOy4Sgtk
         DdyDKXRoPzfezhMSBBefMxzfq1yokgJNq3ATCnToYQ2snaH0Kf4b5U8u71SEBuMCCQJd
         miiYqHa7/1lGQRew9iwedL8089HJZb3s/6khNRrtaUfjTUBGe9lP8wF1rj0OFdY+TuLi
         zGxzXkJ+nv7sP2ZJVbuUUZQqFjvNk5jgoCYrZXG+dwq8YziBswokoFDBjjrS8RSs2Xnq
         v7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718954413; x=1719559213;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPTHtpvyjImpyOToTQ3GHfMQDmZuW36ZJz7nu4CIQJo=;
        b=GVKOHbYTplIpifI737C12R5AGaLevh1Sf9wSyVpb2i7PftVV7FnARXnJBouZ/+GHTa
         LCu90/CGxtTiauGQMb5+yrh02A/bb/SLox8znL1vgjVCO7Z4ISv3mbmGc/DEylyfZdCY
         AO4zq2MFV0hAv4ttC3ZxV34QfMAGjVAclw567G/3Io9EEQ/CJ8irGSZbdLww0983gYmd
         HVG5I8dV4KbpbrXpRpxWutNsXhvVaiO4yGM9dqalNvehujdxuWyJBhExTQN/V8azkTTF
         hE+I4NC1P0bkYwJS+j4XjL56DfBgN2+Cm2zrkQlf+NI5c5wdcpsR+V+bMQVfdhbFLXSV
         6O7g==
X-Forwarded-Encrypted: i=1; AJvYcCUMLlVyfbpjg+aatzO2LkfCbUWdi1ozvnpclM59+kEh5g8x0PFiA4kJizmRJD1G+Q3FlAeQNNrTUZddYNAQVXZ3UZYGSGHkAkxWPFG2Ng==
X-Gm-Message-State: AOJu0Yy7TJscXox2rnuruQ2knQw+pQmgihnntrLjiy0V5XdFQ0+osxiq
	rr55BP0rwMaPt4GxTlQoi0xXCsGXsEfDuVH9kZ/g2/Pq4K62WIEmYTLihbxGCYw=
X-Google-Smtp-Source: AGHT+IEowWpODQVp2CLvfDl/XBzzYXS2KvS0s7nb/1rAxtcfrgN3Yx/S1sNut++mNvHDIuBnAnizWQ==
X-Received: by 2002:a05:600c:4f07:b0:424:78c5:c560 with SMTP id 5b1f17b1804b1-42478c5c65cmr48319305e9.6.1718954412914;
        Fri, 21 Jun 2024 00:20:12 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248191fac8sm15384385e9.42.2024.06.21.00.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 00:20:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 21 Jun 2024 10:20:06 +0300
Subject: [PATCH v3] arm64: dts: qcom: x1e80100: Enable tsens and thermal
 zone nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240621-x1e80100-dts-thermal-v3-1-abd6f416b609@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKUpdWYC/3XNwQ6CMAyA4VcxO1uzjTHAk+9hPIytgyXIzEYWD
 OHdHXgwJnrr36RfFxIxOIzkfFhIwOSi82OO4ngguldjh+BMbsIpF5TRBmaGdR4omCnC1GO4qwF
 EZdpSSiVpq0k+fQS0bt7Z6y137+Lkw3P/kti2fYMlr36DiQEDVKxoa6uktfoyuFEFf/KhI5uY+
 EeRTPxReFaEEbZBa5XW8ktZ1/UFbgUnOf8AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=24430; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=1/sXkRQkaE5HvbLMpvD3FavRNc6rY+4l60tllRinq44=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmdSmmxkreuE/DEKm5vhCd7tYkoiuYG4I+l6Y37
 5v+6U1UyC+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZnUppgAKCRAbX0TJAJUV
 VrIpEACUS3bIGyHn287f/Xi+XF6Ctqf9CIb3VWDR88hPB2v4pvP7aIW8GZE6uBa+1pNBm1bmrLf
 M1pTYgW7/E//odYw7+SQdE7ZnfgfO1lUH8iI7XTJCAnljSzlnpgGJ3RGVFHH2E86kS2w6qudgv3
 KrBQd3B2wXeSlKy6KIqydmkBD8gpDCGJkLRQ09OOT0uUoLs38VTYuusWOllbzQWw1U3W0DoXT5j
 UvEEgcMKceWpf5YSFS+luqCImO78nM6oCWl/CoZUWb0LNGyXaEEioGXf6oSe+qL34TRmTQDic5S
 j4ikVYtlx+uSgiLrPe586d2loeQp0MSihhn96Li9hxqwJCAEDuNKbRPSMo3sfVmcQALehe/0egp
 f9pqGMiaBZxR0jknriKzvaoYFOYqdN2JgN6ZC4O95KzVBItroxoL5amgkziOv5EsGaKWN8hwhdt
 0YFKCPsWJsrLdyVY3viwpmgW3KXrgtKN8Nvd8xG4i9jndW0TmQ9bQ1XwuqCc6gFCNaa0WhxoHGJ
 BRZCZhUsFcL6GiJM3dy499QpExkQgjPHOjk+cnyllm/oswNahvKF/GBgDREiPsCD1D85vC/pUlR
 cZ2gRgbPNiZsPCbaOavyAEQmJwURaDBDCHD/Gyu9WGwkY3rVhKV8pHwRCy9GR3pkQD5ezOFzBau
 NyDEZtkUwchP5xA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add tsens and thermal zones nodes for x1e80100 SoC.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Changed the upper-lower tsense interrupts to PDC.
- Renamed the 'bottom' thermal zones to 'btm' due to name lenght
  limitation in thermal framework.
- Dropped the passive polling delay from zones where there are no
  passsive trip points.
- Link to v2: https://lore.kernel.org/r/20240614-x1e80100-dts-thermal-v2-1-4d4f9effacc6@linaro.org

Changes in v2:
- Dropped the thermal engine nodes.
- Dropped comments from tsens nodes.
- Droppd the polling-delay entirely and polling-delay-passive where not
  necessary.
- Added top/bottom location to all sensors (where applicable).
- Fixed trip points with duplicate values for same temp.
- Marked as critical the 125°C throughout all trip points.
- Link to v1: https://lore.kernel.org/r/20240527-x1e80100-dts-thermal-v1-1-ea13b8fa6ffc@linaro.org
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1214 ++++++++++++++++++++++++++++++++
 1 file changed, 1214 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9944c654851e..09fd6c8e53bb 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2505,6 +2505,66 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		tsens0: thermal-sensor@c271000 {
+			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c271000 0 0x1000>,
+			      <0 0x0c222000 0 0x1000>;
+
+			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <16>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c272000 {
+			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c272000 0 0x1000>,
+			      <0 0x0c223000 0 0x1000>;
+
+			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <16>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens2: thermal-sensor@c273000 {
+			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c273000 0 0x1000>,
+			      <0 0x0c224000 0 0x1000>;
+
+			interrupts-extended = <&pdc 28 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <16>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens3: thermal-sensor@c274000 {
+			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c274000 0 0x1000>,
+			      <0 0x0c225000 0 0x1000>;
+
+			interrupts-extended = <&pdc 29 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <16>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
 		usb_1_ss0_hsphy: phy@fd3000 {
 			compatible = "qcom,x1e80100-snps-eusb2-phy",
 				     "qcom,sm8550-snps-eusb2-phy";
@@ -5469,4 +5529,1158 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	thermal-zones {
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				aoss0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-0-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-0-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-1-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-1-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-2-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-2-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-3-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-3-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-top-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpuss2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-btm-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpuss2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mem-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				mem-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		aoss1-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				aoss0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-0-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-0-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-1-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-1-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-2-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-2-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-3-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-3-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-top-thermal {
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpuss2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-btm-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpuss2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss2-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				aoss0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-0-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-0-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-1-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-1-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-2-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-2-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-3-top-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-3-btm-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss2-top-thermal {
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpuss2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss2-btm-thermal {
+			thermal-sensors = <&tsens2 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpuss2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss3-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				aoss0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0-thermal {
+			thermal-sensors = <&tsens3 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				nsp0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1-thermal {
+			thermal-sensors = <&tsens3 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				nsp1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp2-thermal {
+			thermal-sensors = <&tsens3 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				nsp2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp3-thermal {
+			thermal-sensors = <&tsens3 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				nsp3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				trip-point2 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				trip-point2 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				trip-point2 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				trip-point2 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-4-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				trip-point2 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-5-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				trip-point2 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-6-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				trip-point2 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-7-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				trip-point2 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera0-thermal {
+			thermal-sensors = <&tsens3 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				camera0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera1-thermal {
+			thermal-sensors = <&tsens3 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				camera0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };

---
base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
change-id: 20240109-x1e80100-dts-thermal-47db566a60bc

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


