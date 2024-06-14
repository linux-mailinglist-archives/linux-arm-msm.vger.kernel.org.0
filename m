Return-Path: <linux-arm-msm+bounces-22728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1074A908A7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 12:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FEFF2897B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 10:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D367D195805;
	Fri, 14 Jun 2024 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tUN+DnOJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF671957E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 10:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718362218; cv=none; b=T+732voq9vWVbXsSDFjQXstSNLsfHL0jkGL0Uz2CFuaywIt2u+KjHDwcAvfjL+VtLg2WP5V+aCAxDsBAIOiSHfGF24K5NfRHzhTTc+CuSD5YmJd3XmUY3LfE9hClG9uEUqcxxkkqKS/UydClr/IGGCzXjZ9nqi9Ib2iqtPkZYIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718362218; c=relaxed/simple;
	bh=/gQWO++YHZgX99DTxGQc3BWqrwjCHS2zRIQsO9zTxZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zfz/cglVr8peL/kzz1im++ZwNZmqswLr5PnEyItfWb1DmCYCPFbS8cKlsbnvk52J02Z0k10E8rVuazvGnw0mUR+8MNgwjtlbgFkKU2VanO6t9v9VF/NNEecUJWQRc8eF30UTjyG2/FhTB3DRPJMicXwD/2JISMSs2G5IswHdOiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tUN+DnOJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52c9034860dso2545967e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718362214; x=1718967014; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCJoDOhUssVM6+Y2RBhvWlf+mDExbgEkwr4P2FqcMHU=;
        b=tUN+DnOJuCfQQc9v4/RDSiFt0LFm1z0u8acmPrYuJaaC+7YNydtqGCKi06AOicttom
         V9mm/SGKPPxkjFOfYBq04BEBlWv4Vul+ZqWm7VCX8Pak5RMZ1BO56EISSl6ybRgv5zqG
         IJQLhE6l2TVL1A61ZTIXK8l8aTQh7c8GyMEm8rXhqTDGqRnaqUS+fBIIQYMxVZd2EkU5
         zU3OHyb1tja9rGq67up9M3rmj8+I0VIKwhdbWiBheExElZ4x6u6rf2SlAusOg+BX0Cj9
         F7o1F9jWhAstOv4nSTZNR/9fZ5NlLMyXuNX4iL7xdMRF7bNwVCiy8YARpIi2cd926qyQ
         9gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718362214; x=1718967014;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCJoDOhUssVM6+Y2RBhvWlf+mDExbgEkwr4P2FqcMHU=;
        b=Fy0YxEvpQ5DxYUYbsSotFkpY/eayotIq8HlqHHTEAaPzMZPLHI53Snu4V1PMRzfx/J
         4posLx53auI0y76M6EhFHIOOX97nnCUkR38y2dGVzo55CHxD6g0jnFswwdwdvnAp/6P2
         oETeC7LC78jogpKDyDuXnTpsTthJgGkLO+IMWIE9Z/ig4jN/w4MQzclCfdjum/12MBtn
         WxizchbkgZ1c+yruClk94oV18guzBHRp2t3vtizVogfwEIHwGHYwKQd+BtcAoTh6A4Sb
         e2E2TbMazs2M9FbMhEe667Fb2VHyQy1N2z7aoFFxQEGNK3hSIZbHZeDg2vZ5TIfZzj7/
         D9WA==
X-Gm-Message-State: AOJu0YzKoXPO4nei1qgVwhUceWRVPhxxkQUGiGvBlZrkNgZ7GAOMz6Hm
	paF1RE4R2Lq5WoyIL3ZB5ZtDXGZCg/woV2cVVXMKnJCsbwpi5FWVkifAparbXtI=
X-Google-Smtp-Source: AGHT+IG6A/pIGScItJpp3TjiyYdxKXWMcaG0Eepdogf7Dw2tcjKQaUf+MfIxkTCRrBwNKat6G4W9pQ==
X-Received: by 2002:a05:6512:b9c:b0:52c:aea5:9e09 with SMTP id 2adb3069b0e04-52caea5a347mr814131e87.20.1718362214162;
        Fri, 14 Jun 2024 03:50:14 -0700 (PDT)
Received: from [127.0.1.1] ([188.24.162.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ecd5a4sm170581666b.110.2024.06.14.03.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:50:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 14 Jun 2024 13:50:07 +0300
Subject: [PATCH v2] arm64: dts: qcom: x1e80100: Enable tsens and thermal
 zone nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240614-x1e80100-dts-thermal-v2-1-4d4f9effacc6@linaro.org>
X-B4-Tracking: v=1; b=H4sIAF4gbGYC/22NwQ6CMBBEf4Xs2TVthYKe/A/DocAWNkFqtoRgC
 P9uxau3eZPMmw0iCVOEW7aB0MKRw5TAnDJoBzf1hNwlBqNMrrS64qqpSkFhN0ecB5KnGzEvu6a
 w1lnVtJCmLyHP66F91IkHjnOQ9/Gy6G/7Exam/C9cNGokpy9N5Z31vr2PPDkJ5yA91Pu+fwDXa
 NN+uQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=23313; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=eaIf67ERJLwvEbRU0gZ1zoNLBmsy0BlYH6WvZxbUxWk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmbCBgCED8/zQtvWMwZ+1rgshZWhvltDvxDhV/m
 /bR7PEnFseJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZmwgYAAKCRAbX0TJAJUV
 VkrnEACbg1rMu17IuVpPz3AQvw1zW64DfTJrLq9t2Hm669eml3E9lUlWZy+rRQivB6sIpGHYSzo
 KZ6eKw7q4nhL0A6oxXXt9+JzlDw9c9gKask4x5X8+TZXwN/vcQd3CaeWeQ1QVB5BqHkUCUIeqdm
 0xxx6gh2pehkH5A0FFkiYe1guW+sMvxCFqiCxuX0oErhrZKRUiXkXOJhCdZveexVBSzFceU2dPz
 xuMf5pqwiHasaTRag6Bph1d3/in3Cmlefn3Wp6oJX9w85H2k8RA6xvUgWHx7F/o+8lx8cs0fK/R
 NYRq1Y719ohwL9RZpb4vEm93NDgrZPu/gwvd8VeFK7JPDJP6ZhGXqU9SR/xl3i3zdszOcdGoBic
 pDqn3M/dHBePEEdAUW2ULjx0b33LzjMikS0qEatLKoiqh6EiL71G8BqtWHiDSC1DLuDOxfmKlu4
 1jt/fsk/DNEQq9HN/KBKIEev3jJXJiIc/ee5Y0QArVTIw74bmXXy1Q78rvRHX4iZmU7d415iVfj
 7q2IZ8XNEgL3pFCFRlOnYh/rS7dCuHOP14gPiMtTsmHhDw8LSvUIBS/j+VYwd+SvTf9gl1fwPYS
 DlpypQ2vN1Zo7wqRDd5k4DF+H0y18MdxqdhS3qHfE63v5yt6qYaaCC2CehCmxq3IYrZ2YfXOdaK
 3XLBuyyhrved6Kw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add tsens and thermal zones nodes for x1e80100 SoC.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
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
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1176 ++++++++++++++++++++++++++++++++
 1 file changed, 1176 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9944c654851e..df13df7967db 100644
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
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupts = <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
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
@@ -5469,4 +5529,1120 @@ timer {
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
+		cpu0-0-bottom-thermal {
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
+		cpu0-1-bottom-thermal {
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
+		cpu0-2-bottom-thermal {
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
+		cpu0-3-bottom-thermal {
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
+		cpuss0-bottom-thermal {
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
+			polling-delay-passive = <250>;
+
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
+		cpu1-0-bottom-thermal {
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
+		cpu1-1-bottom-thermal {
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
+		cpu1-2-bottom-thermal {
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
+		cpu1-3-bottom-thermal {
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
+		cpuss1-bottom-thermal {
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
+		cpu2-0-bottom-thermal {
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
+		cpu2-1-bottom-thermal {
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
+		cpu2-2-bottom-thermal {
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
+		cpu2-3-bottom-thermal {
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
+		cpuss2-bottom-thermal {
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
+			polling-delay-passive = <10>;
+
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
+			polling-delay-passive = <10>;
+
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
+			polling-delay-passive = <10>;
+
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
+			polling-delay-passive = <10>;
+
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
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240109-x1e80100-dts-thermal-47db566a60bc

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


