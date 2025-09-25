Return-Path: <linux-arm-msm+bounces-74935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB69B9D9C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79CC51BC3633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A72D2E9EB5;
	Thu, 25 Sep 2025 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcMZnTJZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7A2EBB87
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781777; cv=none; b=Yc5tjMV4Y4DOgFHdpzGwARAu7pWJ+++l0psx6tELqLgrBA4DR/MA5yYAXUZOPq7bkWag0D8AzdAT/VLbcO9nwy3AlhSEs+26byBHnIXIZ6RFLM/+shno2yqPkBhbOMKFLxhzJ+BCynLneuzdjvjjIFyVXEnm4jivt9dYzp2x8rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781777; c=relaxed/simple;
	bh=yDgdM8Of2hyqaQlw4iDJh/MVPzu7jFD1m4YshkXg0a4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IaeGk07R/VXS8rdEnakaaZegfPNuD5Uw8RPb6usrLZAmhMdMqFVqGptHLk4SqovMKNBv8YMsOhIz77Rdphm+POAf/MUCfxCanE0F8o/VOUasv2BLx+Tsmjbu2ZMjZqakFL1qxjIB2c2SeWHpfAkwjRvE+OVgOPOWGc/crUGHCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZcMZnTJZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P04FT1023766
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pRUMfA49GMLn5RJ9Yoh5tMe7BcGYfvc9dHpNmBw4CMI=; b=ZcMZnTJZ82z3hasx
	XrzfMEOm9V/P8woxeTTJ5d3Gn8Gn2i/mJKpjf1G9RkTernl4j3Z0w6RM7wvKjQM0
	VppYdXyrYrE5rEwh6nQOF3tVTK0+xYU/mt21Nka19iemsHvvgo6q2afWL+XzO6mq
	IUoHlYlSzbJHBnPud3MuSLaE0Uka34gsI2Nw2UNoj7yyQfkVri4NL25B23vlziwY
	qBdPUqb8X0R2PVEC/xUs5vXfSdD9RCLQd/dXek2PJfJkDz+cuRaYj9JLEJl4vkDB
	9c5zsW0zspWntrF4I2FYgLDrTDgIIwwdjhIoF/oOwMxHEELV0vXb+J55XDkOnz7F
	KMOHuw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0e1vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5535902495so541232a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781773; x=1759386573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRUMfA49GMLn5RJ9Yoh5tMe7BcGYfvc9dHpNmBw4CMI=;
        b=AWXNYJ5iShwUMtsxQE+2M0vs1c9Kk8Qy3YFMNQezMmtLPUL7/zBc+KeFN/5HCF6sEU
         MDxxw3QS9ivM+wl+50e9B5eRpAXvEddHU66slRaRBMBtAH2pky00ghLNp8CvGx7hs3Z1
         puPdzJ01gR8dGM9xc+tgISUyF67F26M8ZDQRKZV1KBQ8EwmVYMpHZxh3xxacVKlcDo0i
         wt70m2dxsJ2n/l+UtNorD8+svPGzHNAzy89SxMtF4ACaPl9phy5hQopCmbuGeLpSv1wR
         /a3cKCk9hlrGCAa/A1SkHrVVZbjpm7jVwigotBfLYUtdpHgs6YCQxgeECHdHDwP1g3ri
         KfQQ==
X-Gm-Message-State: AOJu0YyWFIJCojrOBPC0Eh/Hk/CNTsZiAzCooRRDlZ5QwY6Ob15n5Rck
	wahTu9uAIXnZXgx56yrh5I0WaVtxtQMHigIfD2pbwJ5uWxZmMvBcSDIbOMh2EaLlFYTJFM3Y6UR
	aeDyTLMwefTJwpM7r+SOZcxoOi/wIeiVQjU6+D34Hbaxa4bif9quZal1zDlmRSHfyHYfPuJyMTx
	gA
X-Gm-Gg: ASbGncvIRHjxtb0Hkb3DN9dNUk5xiEXR2NKSnO5YZKs2MAnf1Z9YFr6oihevnWkTXsN
	hZBsNKGBx32TLq95ILWDRJboB/uXZWikt3skpiFMGl2GMfW1kc2po7A9ONsR4m6659IZYYIApdt
	MCI5SPqKD0+K0MjtRSi05AVzwj2Pe5A5eZU6HRHhwBBokEou2V3pdG8pKldag/AJ4CshY4rWMvL
	O3A7qSNkgO+4MEVxixF+lgqEa8w1QxeEvQvkdG1aVhjSMgD9JNsXCLhO6pBJ+adnUy/aYewgOfy
	mrT74EYnwlh5/riXyQyJlR6u4DjSrkbQXOqsQWnBfLZTAk4GWL9lylfWn1ywWpI1aR55Hawybwj
	T99qSxlQqgr1qBwpauXQnDsL6rWU+b6ISz5yBQP98p1k8OWLs8eCGyPRTEI4o
X-Received: by 2002:a05:6a20:3ca7:b0:25c:d1a3:9e11 with SMTP id adf61e73a8af0-2e7cdd9eb49mr2996062637.36.1758781772846;
        Wed, 24 Sep 2025 23:29:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBoJFwPh69kFkBioDjb0K67X53z4zIuShkhKpTzgKnxs3k0RnS51fGAJx2tTIFzYtTPZrRWg==
X-Received: by 2002:a05:6a20:3ca7:b0:25c:d1a3:9e11 with SMTP id adf61e73a8af0-2e7cdd9eb49mr2996035637.36.1758781772400;
        Wed, 24 Sep 2025 23:29:32 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:32 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:17 +0530
Subject: [PATCH v2 11/24] arm64: dts: qcom: Add PMCX0102 pmic dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-11-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4e14e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=u-g3E67TlB3pepnp-YkA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: C8_cGbnaQYHb7G7nbyOq4oUWe7oUO_9C
X-Proofpoint-ORIG-GUID: C8_cGbnaQYHb7G7nbyOq4oUWe7oUO_9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX13ne1X4Zal59
 kNTj7aXb93wJdeWLV5RQ8YBks0tIrYj4wpBWQTd/PQ0phVI+VkYSInqwyWKpFln6yjQkg5eJniV
 L9X5F8jkkVCdhHPJtKBHw0bMZ2qrym+6EQXo31bSHQSugB49igrw5lDMI/SBY1+hD9e8IWb5jnX
 9AVd+J5etVjx03foDrY4CCjpU0Ig4ozdumAsIWLk6cmdHeNn+cewwnxV9Qcmw7598cIMiHoXxVH
 YbjGXKvgpH2pm7Oms0ZAUCagjpiLtH+o9fLeilFKOaOyj+YBSbVHljzsxdVIye3EW3ysHF5FOkv
 /i/bLSMlQ7lRRsbshsnC5iJ7GXYhCE6NhNHG+kFSurVhB3emSYJjTQsfvjBNKUa7m1pgktSEVY3
 xwoKKKN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

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


