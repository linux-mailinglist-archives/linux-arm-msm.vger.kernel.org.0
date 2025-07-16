Return-Path: <linux-arm-msm+bounces-65277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1F9B07949
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C830C1C44547
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12E32C08A8;
	Wed, 16 Jul 2025 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7L3Zb74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A13264602
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752678526; cv=none; b=fGmbg5+joBW+/zFjxCRC39KCthT8pYbpzDFkTtrCUgoMXRigXJ1o8+/BUlZkYB1Hrm+KadSPG/ceNzvxdRmkmciF1t6o2WrKVL+4fiaXX0T/cPp4dC6wQOSi7D1LNJva+XQMxdDs/KvusC9YV/inSNtgo6qr0uMRQ902HEM6HlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752678526; c=relaxed/simple;
	bh=ihxEo3F2oGvFSAfvy9ZRtQwJhHZpLy2gs3SPOW/Vg24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B1Wvjcfvwqme9rvTFNm71sYv6UUonQPSwW31GpiSCFZXao49UK896AJ018G4GbHYTJNPUuEJWq1L2H9GjGvaFx3tAFyBMgvSeoF0zTXTwB9xaoTTBuJ7xXfhB63VYlfvxFvdZrLWHM+FV+7XjCw85vF+FEwSsiVfrgftUpJG85M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7L3Zb74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G9EVwK015423
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+5ZTCNwIsI
	AtPOS8xEDMk0BGYkhezLOgVzMiDvz2cI=; b=d7L3Zb74R+E8dDbj5BIdkz6/YZK
	SiTaWum/J2dhO4C9kcC9KH5UkgSWZJ/WAfuX2mW2E7ouVz7arhfVUOB/gttY5XjE
	nFXQLSsltQh7HS9VT5jtKJZfIPy/U/mAGiVGs17tWeDTn6zSN1gwCL/kdNCMRYoe
	WJDQHPzTwDilJqv+vc93WqjhHCaqnP7pK/qYFrMNyL+gTG8hvYZyuZe+TagaQPi+
	i1CwbFCb3hdorwRoQ1CbZGKXRTSmrCybGvQzeR+HBzLooYGvUcMDqoefTRotXZTc
	3lEHXnkjKaD1crdmKzSGcHxz5T4jikCtdHxtDMICxvgcY0bCbYvVMK/DR8w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyqbrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:08:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso17788b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678523; x=1753283323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+5ZTCNwIsIAtPOS8xEDMk0BGYkhezLOgVzMiDvz2cI=;
        b=HpHc1d68qCrcvUHwSU51WHwKs7rSzqoIC4HPb8fmgPZop+9SSCUYcxFXldrnRZLJNm
         FbY1HYmlVJQBOhPJgG+AcrOeVr2YKGWDk7alObuz7UcmB+enzwP2yQMwa3trMIm+WRNT
         tmXJas3lRqSzXn64zrRNeQLHhXbHv5eYHYConArBj7ZLJV8UME96ssyqqC9IgIuufNiy
         jkjHkGGPE3Rs0tCPv5nvTQSzbYJOYFY3P91swbBnvvZgPbv7HyVO3EDdbEtA1vy6DQF9
         Rv3zOcWiwASRPmUMZmNPYYoJe/pDRoLmpeHhdazph9xFJSK5+2lEtebLMOBO9rR4UBf+
         1GVQ==
X-Gm-Message-State: AOJu0YwCWoTeNvjRaUDsDv8beCn53YbHBvZxDyeTBfaRDUuIooB5gj92
	5w5aYSYzIbRiH8A4+mYAMg3won0MkHwlpaw7OWinrXjjneLq/jpVug8Aiq2FCm0kjBev+zTc4AI
	o70OT1TMeT19PVvPMm1KmmEoMRabgPcrnULr3R2CEKqjXS/cjGo5IDFVfoS3Wpf3r35Is
X-Gm-Gg: ASbGnctc1SvXLWaghU4RaoCATSdcJqzlFHf7WRUp/Z/cn/6A6i5hFVF1yzwlPgwVrR7
	vn95sDAe0PkyMktEinzqYfXDVteTs8dKzFGlxztpssJap+Ye5ib/kw7Xh+bKd58WExNatzqCmDE
	Rklrg5nBjCstgUNWz85KOdzg6TP5C82HEa0/j3H3lRhKZVgsCHWj7LnZ5zlHV6ISyW23JaaOKor
	fO+tnmDcUgTCyLbBGplFzDnWfaNHg//Rmi4vsmkAKubu3sbQBKXxo8tXkacbd4EU1GnwcqE7Shs
	Q0DKTxyjr1aKDhJSiKERLv+FvpwNSYCBo2etb8RHANR51/3pTdZSk5NlRYeBhSzDFihouxkAWW1
	ItT5TZRXtdPwQ1uVekfwLnxuXg0AnW7eO+TMmu2QChL902gSEJZ9t1NjTYMp9
X-Received: by 2002:a05:6a20:a109:b0:232:1668:849f with SMTP id adf61e73a8af0-2381376841bmr4817151637.38.1752678522954;
        Wed, 16 Jul 2025 08:08:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGHNJXAOaeNOjSazGKGjs4TDK6pDqSGhXNbcwlHJ7ti5SgNtEhaR5S1i9hxf7bO4tF7J+uzA==
X-Received: by 2002:a05:6a20:a109:b0:232:1668:849f with SMTP id adf61e73a8af0-2381376841bmr4817106637.38.1752678522532;
        Wed, 16 Jul 2025 08:08:42 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6f56a9sm13713112a12.59.2025.07.16.08.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:08:42 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
Date: Wed, 16 Jul 2025 20:38:21 +0530
Message-Id: <20250716150822.4039250-2-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716150822.4039250-1-pankaj.patil@oss.qualcomm.com>
References: <20250716150822.4039250-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tLBddSlqguttztSO5n-cJwQpMFy75T3o
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6877c07c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=u--hiq7dTte3EtGYD-cA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNiBTYWx0ZWRfXz194IPxWl5hN
 LlLAuhh9VNbtjt8cVQl39jL5AgbJcfOW4yEKUAqygHH9WGwl74GCc6vI1tfLYi7miWnEFAgF3BC
 4w5uOVKu07tTBwaCfXYSzD0yusQ9dNDhu9pZ7PGcumMGkEkLDtWWVjroh/t5CenoKuIAMq07clF
 4e7j2KPw5QpyF5092wHeWl78ft63SrzdoG61807YWBw/OV+dg0ehLnjLcqEr7Oux74k9zYg5lEJ
 Pl6wAMaTZkX6zPR+k6DLT/qOol/t0OrxP5h3DMmsOEX++ttwHrBKeIWlq+HcWb8+us5dwIaeO+/
 j2BZQUlajcGwPpYzmF7N5hAOQgMIPl8cQO5i2+tEKlPgPSnLACFkkMrv+tvOdOvFMziiIcGc49M
 1nhcemiyPzspj66up0pCMFZuTP9MjU4M21J1pIZuJQzYggoZORP1vn5+mfhx4aKfD/V8FAyo
X-Proofpoint-GUID: tLBddSlqguttztSO5n-cJwQpMFy75T3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160136

Add DeviceTree binding for Glymur SoC TLMM block

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
new file mode 100644
index 000000000000..d767a6f5b5b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -0,0 +1,128 @@
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
+    maxItems: 238
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
+        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb, audio_ext_mclk0,
+                audio_ext_mclk1, audio_ref_clk, cam_asc_mclk4, cam_mclk, cci_async_in, cci_i2c_scl,
+                cci_i2c_sda, cci_timer, cmu_rng, cri_trng, dbg_out_clk, ddr_bist_complete,
+                ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi, edp0_hot, edp0_lcd,
+                edp1_lcd, egpio, eusb0_ac_en, eusb1_ac_en, eusb2_ac_en, eusb3_ac_en, eusb5_ac_en,
+                eusb6_ac_en, gcc_gp1, gcc_gp2, gcc_gp3, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
+                i2s0_data, i2s0_sck, i2s0_ws, i2s1_data, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,
+                mdp_vsync_out, mdp_vsync_e, mdp_vsync_p, mdp_vsync_s, pcie3a_clk, pcie3a_rst_n,
+                pcie3b_clk, pcie4_clk_req_n, pcie5_clk_req_n, pcie6_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, pmc_oca_n, pmc_uva_n, prng_rosc, qdss_cti, qdss_gpio,
+                qspi, qup0_se0, qup0_se1, qup0_se2, qup0_se3_l0, qup0_se3, qup0_se4, qup0_se5,
+                qup0_se6, qup0_se7, qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4, qup1_se5,
+                qup1_se6, qup1_se7, qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4, qup2_se5,
+                qup2_se6, qup2_se7, qup3_se0, qup3_se1, sd_write_protect, sdc4_clk,
+                sdc4_cmd, sdc4_data, smb_acok_n, sys_throttle, tb_trig_sdc2, tb_trig_sdc4,
+                tmess_prng, tsense_pwm, tsense_therm, usb0_dp, usb0_phy_ps, usb0_sbrx, usb0_sbtx,
+                usb0_tmu, usb1_dbg, usb1_dp, usb1_phy_ps, usb1_sbrx, usb1_sbtx, usb1_tmu, usb2_dp,
+                usb2_phy_ps, usb2_sbrx, usb2_sbtx, usb2_tmu, vsense_trigger_mirnat, wcn_sw,
+                wcn_sw_ctrl ]
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
+        reg = <0 0x0f100000 0 0xf00000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 249>;
+        wakeup-parent = <&pdc>;
+        gpio-reserved-ranges = <4 4>, <10 2>, <33 3>, <44 4>;
+        qup_uart21_default: qup-uart21-default-state {
+          tx-pins {
+            pins = "gpio86";
+            function = "qup2_se5";
+            drive-strength = <2>;
+            bias-disable;
+          };
+
+          rx-pins {
+            pins = "gpio87";
+            function = "qup2_se5";
+            drive-strength = <2>;
+            bias-disable;
+          };
+        };
+    };
+...
-- 
2.34.1


