Return-Path: <linux-arm-msm+bounces-20529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B9C8CF98E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00CBC1C209FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 06:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DF214A90;
	Mon, 27 May 2024 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DitgxQW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169D9134B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716792689; cv=none; b=i+UowDrkbPPNnfOvNVLj6xlyi2XGuXnf1sH7Z7DnBHCMuGRl8NUTuJsabPnRA/96Xny3GTaZTJNF5mjAqLQRXXTtjM6flGwbbwuiPyvvp6xe4hSPuTZ8q5HMgMf2xyZv7xcjbgf5uRGKQqXYnl9chTXYUZF7Qq3zf2BHTTbypVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716792689; c=relaxed/simple;
	bh=6HnIu0XBID2Kb56pbvmmcJ0SRPFrS/UYEgl4j908a4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j7Q4ZwaK4T2Jt2sU+dvFBK0CP9JR/L2AomDwxNT0qdamQRta3FpR2essAK/2LGXter4rEmZbRRItmx7K51pwG1I+8+a0m71Wjd5/dXkCkMJHLmDQWeGjlz3LHQBZKN9rqTsfXGKc+aJLBz9Wkt1k4imj2E+mQxvsXqsPkqX6ZUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DitgxQW1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6266ffc751so307752766b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 May 2024 23:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716792685; x=1717397485; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=728n+8CvX1AundXNTAIXaol+VOf9pumfUFFeAE+ZoYE=;
        b=DitgxQW1q2dfsE24m5b5Uxa57pcFEn814xhHZPRZSF0d6mM5A7HW/NwoD3rk/3ab1s
         VmCA+dCeydWVoFgv04BrIKFx4qEtn+YskwkUAfa82qJnQPbfdexPzaXtYV8gxfUMzfoi
         bNW116BAzQdzvAiKSRvvytKcezNbXtQl4ZelQOlhMYR+DQ3m5iKksRbOBcuIbcejRBU7
         LLaGgW7HWTybuPk5FcjIUmuvD4hiMGG6CyNO6vIJcighAKZVR/KgOCHaUKJ9VmMWr9eu
         SY5MgaiGUTkhY3994GXwFCvMaLmQWqGypvuMURQQReCurZm/V58ZXGb5+lfB6gAZioq2
         oGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716792685; x=1717397485;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=728n+8CvX1AundXNTAIXaol+VOf9pumfUFFeAE+ZoYE=;
        b=tjqj/zkC82vzDZVWWyDh9+HRYKDt1uZmQaKyUC5nraZ5kGe8MawHJstthNu+rLW2oi
         vi2+SF9eFhcDhLaAYjKIlH8Qm+uuXpmvTVRWUpT0rIYIR5lXgLs7/iU0WOFY6I+VQM9n
         +uhKAjQqyx1//s4cJimXBK0ZU8kCMvhwHeiHO+eX5Kklr7H7PDV8s7c64fmtyunRXqpn
         ES9ua3FIHaeSkrm9F96AYLcnAcyFYFTbGwCk87ygnZ6BpR2zv8aWNtEhti4HnAMEIUmv
         XDEaAL4sLm7HMNqg58ONtFVmcg0o/TLe6DSIj2jfAPi6gtQ6RZWpYANi1daLtLMFIjJi
         tbHw==
X-Gm-Message-State: AOJu0YyBQTzASgGcbstDzSwhfxxSCHFeGufwbH/9y1Pv7vWgWjWspZNL
	VNl9q1LsuYN5ktfxJfNCTp01P0xYgDj7hzGojXxagpldyvz6sqfcSS0svecRDPvh64++JekXEFM
	M
X-Google-Smtp-Source: AGHT+IEgEptgFGZbVMfW2uVgvV2U7OxkpnnWt8yHM2IfJd2rKDZ+Y1tlj7ru2/3jcKXG0brbsyvqzw==
X-Received: by 2002:a17:907:7751:b0:a5c:ea85:b1e0 with SMTP id a640c23a62f3a-a62642d8d1cmr450610666b.22.1716792684720;
        Sun, 26 May 2024 23:51:24 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc519cesm455959566b.113.2024.05.26.23.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 23:51:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 May 2024 09:51:17 +0300
Subject: [PATCH] arm64: dts: qcom: x1e80100: Enable tsens and thermal nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-x1e80100-dts-thermal-v1-1-ea13b8fa6ffc@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGQtVGYC/x2MSQqAMAwAvyI5G0hF6/IV8VBt1IAbrUih+HeLt
 5nDTATPTthDl0Vw/IiX80ii8gym1RwLo9jkUFBRkqIWg+ImAaG9Pd4ru91sWNZ2rLQ2msYJUno
 5niX823543w9mh+WGZgAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=29450; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=1oJOnD888ZSLu9mynXgb0qGKfUjFtGrA3YyYldIBhb0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmVC1mnfj8PEK8RMQ6Z86ZVefZ2W3dWoyQ7wgLH
 Wbj3aePl/GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZlQtZgAKCRAbX0TJAJUV
 VkwGD/9q+ao4Ypf26IV70uYkNYmEUGCYVVNYUd8OknqC2R+3aphb5NjFpckhk9Zqtn3WPrdlLGu
 AbvotnRpgOLdAW+ntOzR/YPu/KrgWr55pQ8FaRyPD9CYlS9LKf0Q+8YBRYQSPPP0mTEofbfE7ri
 hmtgmfkBtrMX/NU8afL10VNJOvJJxd8ShWaI89Hi2SMzQDwZ2Obny+WAGhtSXsdlgHhLNCOnDDT
 Jsp+lcWL+nsbEVeiQw0Au6CirMyZsc2qyDFcnYOmsedzPcRWavLsFYP+uCItPv/ZyfEFygVqb/U
 gnNQ12TkhNlAPCJ1k2p704fdanBm9t9cPGAfczUAfI7ZLbvrrzxAn3oax7BKk/jEmBUwraZtt5s
 bSHIsA0muy8EUxUDchNkYRyhu9t59umVN/nG0JBEF7j+euCRnVj5LSDO+9PhE/noFvuvJ1EafDU
 8LNyAN/eJBE6h73FO7DPEqTPjM1JqarO3hMkTs0Q0B/xAMJfxYGTLPToVKhry2wPx59YlgeFum8
 gqsy2iHH5gYVX9MhfhcufZ0tW9O2GMlCJU92dn76vCy4NiCQ3E3x3I446sOMZVohboMtt90UzOa
 LGVpDBPNukPK07aoCh4h3/c7v5k7mWx1ixEr1X6fItoUcmwUXnu2OF+M6IJfCKCm6xQ4FTrDUlb
 3dfTVYYegXDLkyQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add tsens and thermal nodes for x1e80100 SoC.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1356 ++++++++++++++++++++++++++++++++
 1 file changed, 1356 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 5f90a0b3c016..2e34086b0ddd 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2505,6 +2505,66 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		tsens0: thermal-sensor@c271000 {
+			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c271000 0 0x1000>, /* TM */
+			      <0 0x0c222000 0 0x1000>; /* SROT */
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
+			reg = <0 0x0c272000 0 0x1000>, /* TM */
+			      <0 0x0c223000 0 0x1000>; /* SROT */
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
+			reg = <0 0x0c273000 0 0x1000>, /* TM */
+			      <0 0x0c224000 0 0x1000>; /* SROT */
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
+			reg = <0 0x0c274000 0 0x1000>, /* TM */
+			      <0 0x0c225000 0 0x1000>; /* SROT */
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
@@ -5325,4 +5385,1300 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	thermal-zones {
+		aoss0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu0-0-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpu0_0_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_0_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_0_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-0-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				cpu0_0_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_0_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_0_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-1-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				cpu0_1_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_1_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_1_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-1-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				cpu0_1_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_1_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_1_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-2-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				cpu0_2_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_2_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_2_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-2-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				cpu0_2_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_2_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_2_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-3-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				cpu0_3_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_3_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_3_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-3-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				cpu0_3_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_3_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_3_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss0-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		mem-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				ddr_config0: ddr0-config {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		video-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		aoss1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu1-0-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu1_0_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_0_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_0_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-0-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				cpu1_0_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_0_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_0_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-1-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				cpu1_1_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_1_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_1_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-1-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				cpu1_1_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_1_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_1_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-2-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				cpu1_2_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_2_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_2_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-2-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				cpu1_2_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_2_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_2_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-3-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				cpu1_3_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_3_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_3_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-3-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				cpu1_3_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_3_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_3_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss1-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		aoss2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu2-0-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				cpu2_0_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_0_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_0_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-0-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				cpu2_0_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_0_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_0_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-1-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				cpu2_1_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_1_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_1_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-1-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				cpu2_1_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_1_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_1_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-2-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				cpu2_2_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_2_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_2_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-2-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				cpu2_2_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_2_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_2_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-3-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 7>;
+
+			trips {
+				cpu2_3_0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_3_0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_3_0_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-3-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 8>;
+
+			trips {
+				cpu2_3_1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_3_1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_3_1_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss2-0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss2-1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens2 10>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		aoss3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp0-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 1>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				nsp0_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp1-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 2>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				nsp1_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp2-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 3>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				nssp2_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp3-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 4>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				nsp3_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 5>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpu0_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 6>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpu1_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 7>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpu2_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 8>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpu3_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-4-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 9>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpu4_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-5-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 10>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpu5_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-6-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 11>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpu6_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-7-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 12>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpu7_junction_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		camera0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 13>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		camera1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens3 14>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-config {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+	};
 };

---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240109-x1e80100-dts-thermal-47db566a60bc

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


