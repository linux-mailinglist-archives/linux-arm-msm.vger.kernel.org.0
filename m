Return-Path: <linux-arm-msm+bounces-65907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D5B0C659
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 16:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83B353BFFD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 14:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF39A1E7C1C;
	Mon, 21 Jul 2025 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkdNyGHs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6DD1E1DF2
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753108264; cv=none; b=jDnADMQJCti8u4ZKrJYATLFgif+FwxRehYdQtj3EVP5ez5nOKZKm3oFmUpNuNE7FzDiYGmqbU8/HwfpWOrI10pFnyhecfQSz45YnVDERnbO3ILB5PiGwp82ABce7FkOeUpRynTxW7dg2GoolLWvWWFeqKP9IxzPISwHzTnNtLmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753108264; c=relaxed/simple;
	bh=TxCQVjHu8v/XTD779R/K9bsguolEscatCSuaO2Tvim0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JF8mBIOo2ql3qqDktDB7KY3ont7cky4VnsTG3v6czu80aCUPdT7R0demSChuWX2HpUyXW+se3ow2pjTvDr0F6yLemLKwA/5eEUgz/bCxwAnkQOZkjDa9gjfzWiOQ3SRtkMwNJiltYKwBbt5FDBScXxSDvAl/br3DLyO17/Wqglo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkdNyGHs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LEM5lP031553
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 14:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ItGq+wqYysW
	OIQQZgquamzbiff6QYWhmEITX7yLzkG4=; b=YkdNyGHsVNdObJ3SRnu5TAx5jAS
	ApY474zRgTXRO4eUyDGftyI8wWlAxgItUbFAj4Tou+Y27L595+qjxjO+S4n+bF5o
	SRIbXMFjrKCgvOFPYSi2clUXIYiIGLkOtrQbtV5Abs/Tac43ry2/9/lI5mEJi++8
	ksPkDkkRa5UT4ON5Xv1pPebkpmdYsd3BCFHuHAbLCQ0zqI7PqHE4ALXhgT+esWxQ
	Ub1uU7LMyaUMdjwF/EnDj/kF0vSxrSrgVsyP2k5yFMs74Rrv1fTlkHbnu19FrKHu
	AdH1Xfbb5I+CVCACe4yd8FWhn1IznFovfhGz6iDVqh8zHQe7WSw1zhsVO6A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459n4m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 14:31:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b00e4358a34so2814702a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 07:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753108261; x=1753713061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItGq+wqYysWOIQQZgquamzbiff6QYWhmEITX7yLzkG4=;
        b=BUO/8GXl5qZeqJKv9dXs9PV7v1EQhwEAy7oM/fOZcMp+qDRWcMSxOnuyyUxrKwg93d
         mMj2M9xZtn2bFKLShZWkHo4tiMGHhSpcdIYtigytxt39fiQ65e2/s+zYtnLZC3b0nqSp
         aD+oI/aaLuKlF6dnz5wRF0L15qIHz1V8qaaMI5hPvWvdIwljlsAtzwLWX4IgoPhrJz3F
         G8+Ei+7BFvu/GHBFWw1aJkpAwrdZw7/vZMdoXnVYXhPDoBb+e4CFm5ig4ILaQhdWrmWf
         92v1pszvTLbUwoD9mlfKM3pzifxVY+UQPk6fqF87D5gjFQznhHA4g9MXZmTmwNuSdWPQ
         aNLA==
X-Gm-Message-State: AOJu0Yy0LX9exY2ijL9FmIasNeowcQCVRqyGgO88Ga3HuJ2rny4qHyoj
	kyaKrBgQOaYffzEdAtqXwt+hN6fDxtEeD//XieT5jMCeQWhxCYKNdSgB+2wJ4Uzua8XNpsXeoL4
	9wq3uatXlJYTcY0tvhwnV1lTYqlpOFLQu5o1L3SwmiDVcM1rEDKi0uayhlcu/AbliogPE
X-Gm-Gg: ASbGncsm8qsuD9iYIH3MbAJTHPXiXtzoH/RExyujaIaTbmNhchQdqFUJCXDkh8jDcrN
	onGPZXh/+zOA8JIeMUmJB4ktw/3o9qRp0MjMQoSrcUAraLaSLue+vEE8omQXNvFLMe8ylm0uBOe
	wTR409mXkVBVs1tBc0lUeeygA/kgSdLcCeaJr6vc+VHMMMT3X5+drDBvs0itkpkAnU1E+uJBe1P
	lgP4IsnlvFpDjwYQ32AjFIThsxosxzRjM9de+hYg2UyQvCERxcSXMCoFCSZXvPKVRUZvDMAgVJn
	3HQKxBlFZnmiVfvx7xdydkEjS6GsCAi7ukgVZ8q0rEP/OhN9j7045rX0o8grcoHku3M+Z3Caetf
	MSSmmONz9hHkjMkj949JqhIiqIYqRqdoeQy+g3oWT+qL6ITqEQ66Zbr7BA7hp
X-Received: by 2002:a05:6a21:6197:b0:235:e7b6:6a04 with SMTP id adf61e73a8af0-23813c6d6abmr32725207637.24.1753108261026;
        Mon, 21 Jul 2025 07:31:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfJ82Z7ZMT2wqlnDmQL1Ll4asKY19DVfgK4q1KM0phmb0LBk6pLCfbexRyFKZOsb3xPjwcSQ==
X-Received: by 2002:a05:6a21:6197:b0:235:e7b6:6a04 with SMTP id adf61e73a8af0-23813c6d6abmr32725148637.24.1753108260538;
        Mon, 21 Jul 2025 07:31:00 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb155e1asm5750110b3a.74.2025.07.21.07.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 07:31:00 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
Date: Mon, 21 Jul 2025 20:00:36 +0530
Message-Id: <20250721143037.20983-2-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250721143037.20983-1-pankaj.patil@oss.qualcomm.com>
References: <20250721143037.20983-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 61w7vMhQ0e1dbblmdrP1AEwB7kXiudjC
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687e4f26 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=u--hiq7dTte3EtGYD-cA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 61w7vMhQ0e1dbblmdrP1AEwB7kXiudjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEyOSBTYWx0ZWRfX1XgH6u/QYsOX
 4lGBTZNK9zaMKv8xWpsd1AYivRNFcPGrZCPkxg25bn0+cnZY2VLEdWXnGSvHCNOGFdcUJHlow0l
 DADFI0SkxFVTUEk4Rp8VmlU3UaYsPQ2vV673Uqop8pW6uBMvDYCl6zuGn/4IcrlYbL/xPytanSU
 iHU704mHZMBSPUYtxQHtZpxSIhM8dklE7dNgcAJqMN5rQ+aV3onnnl8IsMr0muDcg3KuXvNEtgw
 No9Gw0FgKgRT4phYhqDmj7SkySGCxu2pVvRNoFEcdOLr+JeUwmtHPszXb1GxW0jamZqU+LBMSgH
 cYEFnykcZD9Uh7XIaCkpYnqpXnJTSBOBVKJeTBuroh/jgYmqlLqwULyd6Vx06T61y2B+qajiPb/
 Uk/OMvkIB1tlqYWA7au0kWQkwA5haXl/BfhZ1jbQKh/wri2EqTL0U+ixyozaWJO8p+OQIrmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210129

Add DeviceTree binding for Glymur SoC TLMM block
---
Changes in v2:
Updated gpio-line-names maxItems to 250
Fixed example node reg property

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
new file mode 100644
index 000000000000..67c1de62afe2
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


