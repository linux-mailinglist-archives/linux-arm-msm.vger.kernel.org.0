Return-Path: <linux-arm-msm+bounces-36641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCD89B87F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 01:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE936B22D32
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 00:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BE32EAEA;
	Fri,  1 Nov 2024 00:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u7fqDdkS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF77143C40
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 00:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422186; cv=none; b=jWteFpD14fG847jN/GrE0GAT9e8fUwkvY5jPiKQtzdgREhzYJX2kmjwd7o42k61zCN3dpWTiyoj+V7wx3Mg3ntzR+ApKg5MDefCfhfI3WbUbZ4MlyTs0CnlfLQu0coVb+EfF8ArxGHPgLfdYCM1GM7mzPDII/HRRDrWSeWghnik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422186; c=relaxed/simple;
	bh=NKAIDk88fRxbk1aniGyJcLFMvYupa5MdlxK5Gu+xftk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcIOPPfufrzYOnAtA7vN6k+mf5tBrbKtVefhNA4780dMjzwKKgCeSWrmT8C4afHFeyMeT75LXqCd68sAF3mLzw+grOV1Z5b00+hdEnoIS/mtn67wB4z3r0M7+3jAN1HpNdizb9rXgi1nrVyfMPZ4KtXLWIZNLBHmfiV9DhTe4CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u7fqDdkS; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e59dadebso1867271e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730422178; x=1731026978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZEeMNgusIZTWzz2i9vViIz6mo9IrlvlUg/Uj7ZADwY=;
        b=u7fqDdkStBcX7ULZLPrAUPHKaEvX8DkliGg1NNetnoVrqFkro/+uZFUXd/PHWfHEem
         hh+Lpv5Gt7WUqfGjKEdcMUzsYyzha2nb/rTQi+OgYT9PXEi4GTmx1hG4EtDytdP+snFd
         QAnb/E1oop12ZNvI0QEkul9GH/l8BxliQboPoTWbWB5zJrThnPHvee+sYRRkrLOCtgtl
         aqa+dNbPX8akRh4cQQyEuUv1vBnWlrzSTB24UVgkSF133Q4fNaXnCONQgiXZtajpaiQG
         ahS0/UOElfFmSCa5T6sliP2pX1gUYL1YRIyA4f4rXNX+x+VbDHjpWN9+WRUL5oPjJFvS
         fI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422178; x=1731026978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZEeMNgusIZTWzz2i9vViIz6mo9IrlvlUg/Uj7ZADwY=;
        b=AlLhRROeensrHPXGHSHiBFo+Sfs1+0nS0lhiKPfNAVMdRlkLlAMargJUHEkt2yU/1I
         Q31bNxlz0nLjQ7ejWXNDX/DyKJj8SejtQNvVrl0vmoXQlzOLKwm0C/2HK8rn7bGZta+E
         7CW3yjuPoCKiD3Tseq5AQ0pkoOCuYZhD7PgP6Q7/tLQQLTOv/oQdRhzz0zL2qINY77S2
         eSBJcYpUhO0ZSG4E+rl5JSjHLo/QaTDU49xlyxy1HbUeXU4K2hII1Fxp9tzAkax+hz4K
         PWltOSqdhxKjj5XhqfC2HGcWg56q0n8FPoARofXeMZODHy+5p8+T1aix8fb98SLy7iye
         mzEg==
X-Forwarded-Encrypted: i=1; AJvYcCVjKJZUQTe9TkH7vZZ478lacSw+XPeKwOZc8IXpBd9zqkXVeEaEc7xA4tJG797254ZtCazL3APD9usEhViQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8FdY2y7LST4Stm5piJB35MNEg8FDQ4WdvzlNlZ2wJ3oaeF8yz
	wtgtG3eCD+QaoRpAS6SHwmxUPkcbQQkSIAikMsQNJ+qikoLEgB3XOwT/jLPhDbg=
X-Google-Smtp-Source: AGHT+IF+AWUz7JPyGiZmOQ8CXcCPEMcA4q3M2a61rl6wo4UXZg5+ftzMsK5GULCrYyNlUz8YPqEvNQ==
X-Received: by 2002:a05:6512:b22:b0:539:e8c6:7c1c with SMTP id 2adb3069b0e04-53b348f9d60mr10435008e87.20.1730422177532;
        Thu, 31 Oct 2024 17:49:37 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc958c0sm374510e87.28.2024.10.31.17.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:49:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:49:25 +0200
Subject: [PATCH v3 4/4] arm64: dts: qcom: sar2130p: add QAR2130P board file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-sar2130p-dt-v3-4-61597eaf0c37@linaro.org>
References: <20241101-sar2130p-dt-v3-0-61597eaf0c37@linaro.org>
In-Reply-To: <20241101-sar2130p-dt-v3-0-61597eaf0c37@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13733;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NKAIDk88fRxbk1aniGyJcLFMvYupa5MdlxK5Gu+xftk=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnJCWVfN0bWZkm+UDwP3xCw1bN70FkIYM0LIlLc
 yCC0U7/wkuJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZyQllQAKCRAU23LtvoBl
 uOBtEACnMznYjY+h7owZK6Y8xe3clK5FNFLM2nNVQkSj6BjMB29zHCdePHXZLfnA7cMPkSBSLh8
 XAWCqOYCybRW2apCBQ0AwnOEf+LKjAcDtwNlg0ygY9Na2aN3Fka4wY+2Rw/Y9yKlUaV1upQkqb6
 m+v0nbIeg4njMEFTF35WhdimGXvXiBDNeSZ90gIx+kMcQD0VFXj98lSEgqM5vUECF5FGMCjLDXo
 Aeh8/5JAyIa61AAr4NGLdNU4e+NUKhmRu8i9qPMjCUM66ibscrEULEu64gN8QFnQ8qe3Sh+WOeu
 5uBh3HA1OFlZq/Iz0HSDWaNiHQhIQeWflkVGpmKcwlC0Ds28DT88QNQZxj09R7VNPQ5BVRkq80T
 Zg9FcSNZMIr20z2/inBSuWWjHM5tMh+vQ6pxwRyUXVyUQ2+Xu305Y2qpgJOk9BYeXOOXV0rJC0G
 T+VYRr0ue+0+AARRQexmpN08bLXa40ELIR1mbIsxLDIc8qGrUB2ERxEobHogL/P4phTo03SpJNd
 oSExaqGHTOVkL6LWiUsA7Ujk17px7gZJC2imWs/++3W2ytKxxlbbbONXiNpsUHTGkVwJtBU6+NC
 pjJfSav/gzWcw2MN3ui7+B8SDjvYC17q7QZAsOCekrkWUuEyLBBC3Du/ykiop3ppc7Yx0Laj9SS
 4m2BflmQ4oBljrQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add board DT file for the Qualcomm Snapdragon AR2 Gen1 Smart Viewer
Development Kit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile              |   2 +
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts | 558 +++++++++++++++++++++++++
 2 files changed, 560 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ac199f809b0d4e514878518604a23b4f1ab8ef79..fc4ab86895441fb3832e43eed758719cee73a250 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -3,6 +3,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
 
 apq8016-sbc-usb-host-dtbs	:= apq8016-sbc.dtb apq8016-sbc-usb-host.dtbo
 
+dtb-$(CONFIG_ARCH_QCOM) += sar2130p-qar2130p.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-usb-host.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-d3-camera-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-schneider-hmibsc.dtb
diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
new file mode 100644
index 0000000000000000000000000000000000000000..74778a5b19ba6df11db9f66df52140e2decabf04
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sar2130p.dtsi"
+#include "pm8150.dtsi"
+
+/ {
+	model = "Qualcomm Snapdragon AR2 Gen1 Smart Viewer Development Kit";
+	compatible = "qcom,qar2130p", "qcom,sar2130p";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &uart11;
+		serial1 = &uart7;
+		i2c0 = &i2c8;
+		i2c1 = &i2c10;
+		mmc1 = &sdhc_1;
+		spi0 = &spi0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+	};
+
+	/* pm3003a on I2C0, should not be controlled */
+	vreg_ext_1p3: regulator-ext-1p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_ext_1p3";
+		regulator-min-microvolt = <1300000>;
+		regulator-max-microvolt = <1300000>;
+		regulator-always-on;
+		vin-supply = <&vph_pwr>;
+	};
+
+	/* EBI rail, used as LDO input, can not be part of PMIC config */
+	vreg_s10a_0p89: regulator-s10a-0p89 {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_s10a_0p89";
+		regulator-min-microvolt = <890000>;
+		regulator-max-microvolt = <890000>;
+		regulator-always-on;
+		vin-supply = <&vph_pwr>;
+	};
+
+	thermal-zones {
+		sar2130p-thermal {
+			thermal-sensors = <&pm8150_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <100000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		wifi-thermal {
+			thermal-sensors = <&pm8150_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <52000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+
+		xo-thermal {
+			thermal-sensors = <&pm8150_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <50000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-0 = <&wlan_en_state>, <&bt_en_state>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 46 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4a_0p95>;
+		vddio-supply = <&vreg_l15a_1p8>;
+		vddaon-supply = <&vreg_s4a_0p95>;
+		vdddig-supply = <&vreg_s4a_0p95>;
+		vddrfa1p2-supply = <&vreg_s4a_0p95>;
+		vddrfa1p8-supply = <&vreg_s5a_1p88>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-l1-l8-l11-supply = <&vreg_s4a_0p95>;
+		vdd-l3-l4-l5-l18-supply = <&vreg_ext_1p3>;
+		vdd-l6-l9-supply = <&vreg_s10a_0p89>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_1p88>;
+
+		vreg_s4a_0p95: smps6 {
+			regulator-name = "vreg_s4a_0p95";
+			regulator-min-microvolt = <950000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a_1p88: smps5 {
+			regulator-name = "vreg_s5a_1p88";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1a_0p91: ldo1 {
+			regulator-name = "vreg_l1a_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a_3p1: ldo2 {
+			regulator-name = "vreg_l2a_3p1";
+			regulator-min-microvolt = <3080000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a_1p2: ldo3 {
+			regulator-name = "vreg_l3a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* ldo4 1.26 - system ? */
+
+		vreg_l5a_1p13: ldo5 {
+			regulator-name = "vreg_l5a_1p13";
+			regulator-min-microvolt = <1128000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_0p6: ldo6 {
+			regulator-name = "vreg_l6a_0p6";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <650000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-name = "vreg_l7a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a_0p88: ldo8 {
+			regulator-name = "vreg_l8a_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* ldo9 - LCX */
+
+		vreg_l10a_2p95: ldo10 {
+			regulator-name = "vreg_l10a_2p95";
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* ldo11 - LMX */
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-name = "vreg_l12a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* no ldo13 */
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-name = "vreg_l14a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-name = "vreg_l15a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* no ldo16 - system */
+
+		vreg_l17a_3p26: ldo17 {
+			regulator-name = "vreg_l17a_3p26";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_1p2: ldo18 {
+			regulator-name = "vreg_l18a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sar2130p/a620_zap.mbn";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	ptn3222: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+
+		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l2a_3p1>;
+		vdd1v8-supply = <&vreg_l15a_1p8>;
+
+		#phy-cells = <0>;
+	};
+};
+
+&i2c10 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l8a_0p88>;
+	vdda-pll-supply = <&vreg_l3a_1p2>;
+
+	status = "okay";
+};
+
+&pm8150_adc {
+	channel@4c {
+		reg = <ADC5_XO_THERM_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		label = "xo_therm";
+	};
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "skin_therm";
+	};
+
+	channel@4e {
+		/* msm-5.10 uses ADC5_AMUX_THM2 / 0x0e, although there is a pullup */
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "wifi_therm";
+	};
+};
+
+&pm8150_adc_tm {
+	status = "okay";
+
+	xo-therm@0 {
+		reg = <0>;
+		io-channels = <&pm8150_adc ADC5_XO_THERM_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	skin-therm@1 {
+		reg = <1>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	wifi-therm@2 {
+		reg = <2>;
+		/* msm-5.10 uses ADC5_AMUX_THM2, although there is a pullup */
+		io-channels = <&pm8150_adc ADC5_AMUX_THM2_100K_PU>;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sar2130p/adsp.mbn";
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l10a_2p95>;
+	vqmmc-supply = <&vreg_l7a_1p8>;
+
+	status = "okay";
+};
+
+&tlmm {
+	bt_en_state: bt-enable-state {
+		pins = "gpio46";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		perst-pins {
+			pins = "gpio55";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio56";
+			function = "pcie0_clkreqn";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio57";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		perst-pins {
+			pins = "gpio58";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio59";
+			function = "pcie1_clkreqn";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio60";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	wlan_en_state: wlan-enable-state {
+		pins = "gpio45";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
+
+&uart7 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+
+		max-speed = <3200000>;
+	};
+};
+
+&uart11 {
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l8a_0p88>;
+	vdda12-supply = <&vreg_l3a_1p2>;
+
+	phys = <&ptn3222>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3a_1p2>;
+	vdda-pll-supply = <&vreg_l1a_0p91>;
+
+	status = "okay";
+};

-- 
2.39.5


