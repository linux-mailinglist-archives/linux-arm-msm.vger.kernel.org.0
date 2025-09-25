Return-Path: <linux-arm-msm+bounces-74960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A078B9DAE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96AFE1672F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2829B2F0C60;
	Thu, 25 Sep 2025 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjjOL4I1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D042EFD93
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782039; cv=none; b=d3la3DcYFUVdAAay068KGdbB8lxLMqA5IWSWd7ZRpNSKGXSehIIBf+Q69DlmZI4IC/xB1hiFCBP2yg4cV563Wi/WNp+AomFwH0Jymego+dmuhVuRkZc/SpHcAAtRjQxiRmXQ4FJZ5CbqXvJmTAiqT7aYoJyRSQgumiSPI4mgURQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782039; c=relaxed/simple;
	bh=yDgdM8Of2hyqaQlw4iDJh/MVPzu7jFD1m4YshkXg0a4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3XJIRv2nnMcHkL1rnDN+pJJW3XT/Ox5zHdRAPPmbhR1JoIxfAHiLrMFFTtYzD8IIry/NWy3PGS5Twk2lXOhch5M9MDJSi2Hg+hjtR8FnGeyalFvmuFZUhVYGCjAYEmSCRullFKjXw24Tm9snEzsEIsIgTljzIXO+4ItuWEekQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjjOL4I1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1DL0W018751
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pRUMfA49GMLn5RJ9Yoh5tMe7BcGYfvc9dHpNmBw4CMI=; b=OjjOL4I1y41jrzd5
	N+zp3P1gu3UMov8jjHxHqT9pGcWLlskQvbkUNdVMJzOvSDtwwilmS00SRyBjakeB
	OajgcwqpLKKN7Rxghdq12srKCkpMdjX8o5g7kFf8EMzBwbQ9Z3APsiX49djRE0Yp
	0p3t69RFxpxdFuOkPH212dctkG2XomimVAW6aiFyda0HBZovEBHvcVixbcRGF79u
	kubqXo0vyQ65601COQ8f5IZS754Gn1omU4zELhZvvEjlxwofXmh9VJT2btKAT6ZC
	e+RVnejL/iH++5r8o2tkyyJI7yw8XaBI8zgMjZMKMNh+Ec86XpPF6CIUT7eOTVHK
	XikcIQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0c77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244582bc5e4so6656305ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782036; x=1759386836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRUMfA49GMLn5RJ9Yoh5tMe7BcGYfvc9dHpNmBw4CMI=;
        b=Z4FK3RCbJM5w3t7/Ucc/p5GdNwSE5FeCzvO92MtQS5quppZ1N4XEqupSizvWBs1tJo
         QOUHMZe8b4Qo1ZlerMXB34bOwEzshaZdjTwn3A31eCgwc0P7Iz2wY1+beGZlnXZNrul+
         68KAsAI3wMCdw62HJmOgvApzIo6LSLjhUlprJ9VdDD9d4cEqU4z3WTqvDrPrrfvqGrx0
         lqG/2Hni2+elErNqoRwYI+9wRq/SFoAxOXsvTNlxrTgQjtgJQeTKVpAKpAvI8jDyuGLp
         Hjk8HoJ5T5GFDzg2VhfpjjkCqBS85IiCSs0+g3+ZMc1Lz6ABHfArgTfbrW6/LoETdeZE
         tfIA==
X-Gm-Message-State: AOJu0YxeDNy2NzvG5liIymxQ5/ayC7pKJojXm6uCgYnLIe916odHyfh6
	e/fXZLEUcgxmBX+L9r79B/GkrJ0DD3D/CuOjsE35fvQk+nVCeVe27r09jeGAkHAGvdNXzCso2zr
	qx6YGHRHBYzcJi20wLWbAykMQvit+Z+apmiCRgiuhbmfLvPV+jK5rMSMcEnTtQ5xFrMND
X-Gm-Gg: ASbGncud1v3lNTtwtO+Vx8ev4Mbs5E0zBjWby+/Rd2HFteLf0wj5ynT599eP1WJWVoe
	wR8h+UGn9KVXSEbqU8WkGHa9/BZaQTVS7z4g4gCgX3fF3QBVA6AivOXsPSjgUwJWFUgojFYYy0i
	XNv983hQ8HwLF2OXL1vEsDXGGKCAojpHF1le6UrF7xFoAcyrbC0kuMHyzzhUNV0oZUyJJppDod+
	NBKIizJBrsjjCw8HAZrA6UYne916ykEDmjiOTm+JctvRnARoC2Kl9K5Oy3znCubHdeIcdX2S69y
	0rVYbEQd32MhyUshS/Q//nJYxJa7iUIVysGK00f4C/d/fG2zFvzcDvtpo7erVq3KFvjukKHO3yS
	rU/SKUqM47VOQ4bQ8SfNDvoIbanhucJRxUfBAKECTX/pldaJHEGDOwsaTEE4n
X-Received: by 2002:a17:903:ac4:b0:25c:76f1:b024 with SMTP id d9443c01a7336-27ed4a0e498mr28589675ad.25.1758782035692;
        Wed, 24 Sep 2025 23:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2LvbtRU1TM+vT096Iuf+SpAzs8/uamGMv8ofQmta/LcDScBT6DUZzfTUwhbJe4wRHBkRkSw==
X-Received: by 2002:a17:903:ac4:b0:25c:76f1:b024 with SMTP id d9443c01a7336-27ed4a0e498mr28589325ad.25.1758782035198;
        Wed, 24 Sep 2025 23:33:55 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:33:54 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:19 +0530
Subject: [PATCH 11/24] arm64: dts: qcom: Add PMCX0102 pmic dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-11-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 4lqrimGdMsrXVVqoYe4IZaXapofp6GNi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX4sXEm1uH3GOD
 vH7EcPPgC0RoRMqlZZnTjpLy/4aFZMs5SkBsPa4AbJMojTfOAzokuc/FFCeg08oYF9htgMnswdG
 RvCs4G7brR83qEnyJlgrfoATr+0R11okEAluYW9U1RM7SqmPE9G7WYnPKOWyrfq5JptB3b3EVui
 MLlN8+dKf1f59OjL5/5rfb31xB5cg6V+jt0I6lY3dcDElzOnErUv0thY7qUyV57Hstb3hd8VO3M
 v5b2KJ21y1k5xEuhkrZrkOgg4GbcKcOzAWlmxPqy8dpKZ1RKMGbl92iJFhmQzy0amrC50YKo6/6
 NsAImVfjVwV+xes9rGxLCNMbfzOrq0mZswKxz67vN5Pxd0bf8MqArXeuudDTICMny+/6q8mbgu1
 +gXKm1c3
X-Proofpoint-GUID: 4lqrimGdMsrXVVqoYe4IZaXapofp6GNi
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4e254 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=u-g3E67TlB3pepnp-YkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add base DTS file for PMCX0102 along with temp-alarm and GPIO
nodes.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmcx0102.dtsi | 179 +++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmcx0102.dtsi b/arch/arm64/boot/dts/qcom/pmcx0102.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..839738dda6cd5016df134a2fddd92d3ae7c56133
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmcx0102.dtsi
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus0 {
+	pmcx0102_c_e0: pmic@2 {
+		compatible = "qcom,pmcx0102", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmcx0102_c_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmcx0102_c_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmcx0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmcx0102_c_e0_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmcx0102_d_e0: pmic@3 {
+		compatible = "qcom,pmcx0102", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmcx0102_d_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmcx0102_d_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmcx0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmcx0102_d_e0_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmcx0102_e_e0: pmic@4 {
+		compatible = "qcom,pmcx0102", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmcx0102_e_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmcx0102_e_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmcx0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmcx0102_e_e0_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmcx0102_g_e0: pmic@5 {
+		compatible = "qcom,pmcx0102", "qcom,spmi-pmic";
+		reg = <0x6 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmcx0102_g_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmcx0102_g_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmcx0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmcx0102_g_e0_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
+
+&spmi_bus1 {
+	pmcx0102_c_e1: pmic@2 {
+		compatible = "qcom,pmcx0102", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmcx0102_c_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmcx0102_c_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmcx0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmcx0102_c_e1_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmcx0102_d_e1: pmic@3 {
+		compatible = "qcom,pmcx0102", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmcx0102_d_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmcx0102_d_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmcx0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmcx0102_d_e1_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmcx0102_e_e1: pmic@4 {
+		compatible = "qcom,pmcx0102", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmcx0102_e_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmcx0102_e_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmcx0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmcx0102_e_e0_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};

-- 
2.34.1


