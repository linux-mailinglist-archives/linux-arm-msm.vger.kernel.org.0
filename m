Return-Path: <linux-arm-msm+bounces-68899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E63AB24204
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 08:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A38D6189F6E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 06:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7092D660C;
	Wed, 13 Aug 2025 06:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjWwb0n6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349562D63E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755068147; cv=none; b=km9Iv3E4IK1Y6/aeFQ87W6VO5boANPyGq4Vbryoik6bvaEm5bsiJbFcDlZhtwC56lkwS1X33xKiS/MqrNpRJbGK8IYBrsQvmisDAEsbp3Ox12RK2gfvznqDibdgCLWyQfHj8pmjbzb1O3D1EUfzmqgpLpjYX6S+ssSJqmxrYtXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755068147; c=relaxed/simple;
	bh=fZRjkfryGLDhunCUT4Zm4JZR0xAp7bxFln/eaoRRZTE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fw3dnvwQ0++sAmL4qP7MdlPTCBkeloUzRjuN741ZhRXcJQA2b8OHai2XZVca7B20AiErMMDFQUSd2P9YMb9CTxtHazwz7uChKgi7qUco249a/5RX2mhnjhJRdHoslOvofgrNHHQCZ1yVtNL37BYQmFCfZUJ5Jvk4ZrNXBwysBUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjWwb0n6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mIIv020458
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O96nRpCTZB+
	fHvrTBkpEIpXYmLmfqZGI8qQehacpjpk=; b=KjWwb0n6RDZMN7CY8oDMgJnTWL5
	FU7Dyf80+nF0IWjXothLx3q1qKVNcJz1hM66eg1VWEf5crE3rb0Yk/BzjaN0g74B
	EKp6yfFH9l8XQPymOp+M3mZO7NgyljK4Y44cScBo5ctS8hdeNQt6UrwrJh7OMayw
	5peK7MwUEp7zQqJreaC9P9T/X2NMbnSQ4Q0EXTDadIZ3a85YWNuiS8EYAjAJ7Tio
	S2/Q82iCyDQY0VSC54TQKIM/Q7auiUzSHP2p/hNJAbWW1Ak1e4g99jg3E+WbE69s
	8a3GMT/Cq6vXi3EAqXLbVgL6sRMy5B3hkyyqTUysrHU/Vtji8f3fl29srUg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx8y9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:55:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b42bcfe9c89so9125758a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 23:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755068144; x=1755672944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O96nRpCTZB+fHvrTBkpEIpXYmLmfqZGI8qQehacpjpk=;
        b=Z60jWv3XjM+T/4BZEwailZwp3y43DYqcvvIVirQDV0xEx+okCa5O9srihkSVIpcsS3
         lbGq92wVS4RZQLWB29CZfyU00F4B8U96Lsm9lI8JWa1/Ey1iVaw4NpuqWJhhTy3XxA/L
         dZHNyKSz2p4l5GU8Gkar9/q76zIBX9M5c7COFUMDbXOKgMwnhUKZYH+B6YWrhp8QsvUK
         QlyOD/+d/uVbzDLvZtjVvhw5AEJ7hu06dtsYH0Y6lb054U6RpFEPtAIMpXdymxFbwBBr
         v6FI9fGddknd1Y/JUJMpeKoG/ZKsqkAxK7+VWXH+72ar0459l2pnugtg1MQYf/8hvHvM
         4Jbg==
X-Gm-Message-State: AOJu0YyBln5P/ouDMBvXqs73vlzNJ8QlPV2DconmSwY0BPPq79k3ix7f
	dw3mcLIvyxP3A/naUbeeduSd5LvXafg0i8FTNl5I3+dyeXZPYe7M32/VL4HjHhyTrPlIK4lIeLq
	6UmUO4VIf4QRv460v7/e586n3/21v9xYGD1+JWSNqSrHWH84Mp/0CdP2bNKlsU/fi8cEC
X-Gm-Gg: ASbGnctWvAQNzqc+J9SIAMD9tYyNkR61Wpu+cBnHQF7C2mgop/1p+aFGhLWa/O09cQL
	Q4NYg9e1lP3EjyGTPR698FeUlQerZxJtpW6YBwfZdy3UrSFPJj+JYIBbkI/0rN4GDPTCW13x+QK
	uVR12U3QBur7yyZRgS5kn0FJssk29n+5h3s5VQqcosKfnCVdAQMNgFuDmZi68WGrhkBYumjlDHQ
	OOIJ/nIEJh98ZAJkH4eY0a/duGznBV8Ln32PsnvUrLXv0VxBzV9VSgsHPVvNCERdKeC7SHxjFoN
	XB0Yo82J/qOOLYQtOBsseJD+avFDqbk874dr2EZjNOORdktCONZr1sBhsBEFDKTP/i2gj7gef0c
	J15Los8qTmL1JPhRo+XYxh7nsrjKAva8Hop0LnjltAiQ7CJjNORdpBeGxIvrm
X-Received: by 2002:a17:902:e542:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-2430d1a1154mr25320245ad.30.1755068143759;
        Tue, 12 Aug 2025 23:55:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFByh8s6wGqnmZ4DTELrCUwP7wwp9NTsvOVewRWRxJMawj3doZwZWp5ApV+EJhQM+WIPz+xwg==
X-Received: by 2002:a17:902:e542:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-2430d1a1154mr25319925ad.30.1755068143275;
        Tue, 12 Aug 2025 23:55:43 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899aa1asm315958875ad.122.2025.08.12.23.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:55:42 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        rajendra.nayak@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
Date: Wed, 13 Aug 2025 12:25:32 +0530
Message-Id: <20250813065533.3959018-2-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
References: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX0s/b5gS5lV2g
 x7S2A32cgttmiIEBVcJWMYkedmdgNgvj/8wpyUehbvo0DHo+KZ/zPjYdBgRVcP1ZIHW5wCBhvcn
 7D6aTrb0Kg3vcLZXsw33tXIVzHYl0LsayeoYf6g2LEaTkNxzJKfmyeKEV7qQTJJIcn10l0K94Kj
 /of705vSexOb7pseTh9PbBBJGco+ECnHZhuL5xOESE4ACrtI4nxCUC67mOE4yovxzqyxaxH8NY6
 ib/NUT/YdRUEbGD+MqSG1Bt46F1mfPcA+LF9NVK+R/xwjj4vlUsdjWUBXGfkpyQy96L+CrGiHzC
 zh7XX4lrV7bA7nYJBLk4wMu3f8SXjboCeO6F/rk4W9DkBlQmwz24zW2KsLMA1NdXZUqN8dAYDvU
 wmHVzswd
X-Proofpoint-GUID: SP_3OFVwichVSfE6YwEnHaeETqpoWgZ5
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c36f1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=MZc3Y3F7moGl6OQG0A0A:9
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: SP_3OFVwichVSfE6YwEnHaeETqpoWgZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

Add DeviceTree binding for Glymur SoC TLMM block

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v5:
Rebased on top of v6.17-rc1
Updated RESOUT_GPIO_N function in enum to lowercase

Changes in v4:
Updated enum in bindings to line length of 80 char

Changes in v3:
Fixed indentation for example tlmm node

Changes in v2:
Updated gpio-line-names maxItems to 250
Fixed example node reg property

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
new file mode 100644
index 000000000000..daa5e94fc3fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,glymur-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Glymur TLMM block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Glymur SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,glymur-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 119
+
+  gpio-line-names:
+    maxItems: 250
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-glymur-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-glymur-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-glymur-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, resout_gpio_n, aoss_cti, asc_cci, atest_char, atest_usb,
+                audio_ext_mclk0, audio_ext_mclk1, audio_ref_clk, cam_asc_mclk4,
+                cam_mclk, cci_async_in, cci_i2c_scl, cci_i2c_sda, cci_timer,
+                cmu_rng, cri_trng, dbg_out_clk, ddr_bist_complete,
+                ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi,
+                edp0_hot, edp0_lcd, edp1_lcd, egpio, eusb0_ac_en, eusb1_ac_en,
+                eusb2_ac_en, eusb3_ac_en, eusb5_ac_en, eusb6_ac_en, gcc_gp1,
+                gcc_gp2, gcc_gp3, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
+                i2s0_data, i2s0_sck, i2s0_ws, i2s1_data, i2s1_sck, i2s1_ws,
+                ibi_i3c, jitter_bist, mdp_vsync_out, mdp_vsync_e, mdp_vsync_p,
+                mdp_vsync_s, pcie3a_clk, pcie3a_rst_n, pcie3b_clk,
+                pcie4_clk_req_n, pcie5_clk_req_n, pcie6_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, pmc_oca_n, pmc_uva_n, prng_rosc,
+                qdss_cti, qdss_gpio, qspi, qup0_se0, qup0_se1, qup0_se2,
+                qup0_se3_l0, qup0_se3, qup0_se4, qup0_se5, qup0_se6, qup0_se7,
+                qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4, qup1_se5,
+                qup1_se6, qup1_se7, qup2_se0, qup2_se1, qup2_se2, qup2_se3,
+                qup2_se4, qup2_se5, qup2_se6, qup2_se7, qup3_se0, qup3_se1,
+                sd_write_protect, sdc4_clk, sdc4_cmd, sdc4_data, smb_acok_n,
+                sys_throttle, tb_trig_sdc2, tb_trig_sdc4, tmess_prng,
+                tsense_pwm, tsense_therm, usb0_dp, usb0_phy_ps, usb0_sbrx,
+                usb0_sbtx, usb0_tmu, usb1_dbg, usb1_dp, usb1_phy_ps, usb1_sbrx,
+                usb1_sbtx, usb1_tmu, usb2_dp, usb2_phy_ps, usb2_sbrx, usb2_sbtx,
+                usb2_tmu, vsense_trigger_mirnat, wcn_sw, wcn_sw_ctrl ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,glymur-tlmm";
+        reg = <0x0f100000 0xf00000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 249>;
+        wakeup-parent = <&pdc>;
+        gpio-reserved-ranges = <4 4>, <10 2>, <33 3>, <44 4>;
+        qup_uart21_default: qup-uart21-default-state {
+            tx-pins {
+                pins = "gpio86";
+                function = "qup2_se5";
+                drive-strength = <2>;
+                bias-disable;
+            };
+
+            rx-pins {
+                pins = "gpio87";
+                function = "qup2_se5";
+                drive-strength = <2>;
+                bias-disable;
+            };
+        };
+    };
+...
-- 
2.34.1


