Return-Path: <linux-arm-msm+bounces-63434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB0EAF5DC1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 17:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C7357A98C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 15:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0BF2F2C65;
	Wed,  2 Jul 2025 15:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KQf9V0cF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4421E2E7BBB
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471801; cv=none; b=Xi4UAqWoLPsaSXYht89rVqIl0smd9Bn5Pm3ImgjeuR6aflqAx8+Ovi5ga6rz5dbDMCI2sqBAeOHLmv/MBQDto41JCrw1qjN2fKzc72E7rzMahEr0leKvy6z7p2K/v0Y3GZwCrv+4Fu8W4+lxJPWT4bV8ml/kQ7pFcq4eR57DDEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471801; c=relaxed/simple;
	bh=5M9hqzDbD+NjiWVoqaJKjz8iJ2A0eUS7imv+8oLkIhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PqDwGCd7J7Xy5u2EsfgIRF49b3JTnQHl+vkJCyczaY/2HjjrZvCVFhEEHAOZXjH2Wdp3yp9vjAVVDkWJQRO4ipLZ1z9yeo0KTGo85QJ7whImK3OgVt1ohla2GULnxMmZc5u/UrTBaAwOBVdDWqiGFed0VAjrVYELoEqTF2RtyV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KQf9V0cF; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so11592588a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 08:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751471797; x=1752076597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sijGuv0J5fB8Vzr/9vmlhKrZLedD7CG9VSAJJpn+Dz4=;
        b=KQf9V0cFOZZqWE15dHf2oXITffqIS348ZQ/rqu//czUAf7uOn2hwOqAntEZGuXQH0P
         zuzYrdqg25B/w3s+OLSwgPFeJVoFaS2fTGaj9vSaVmsZDAY59xCszogJJtup5C+WEhGm
         SkJciqniWFOzNXkO1F1J7RY9IfCla8Lat4WKzrMiQ08gl8fBXQY3Zh5PXiei2ObzBq1j
         pP9ZpG1SpXs46RceBiULOGqIUpxwbC9gqrdNVLZD+LsyuFz7l2zEtBXBD7LYyhP8H7cZ
         4VTlox6Tk9O9VIWkMHMPLgiEczWYXbEOC8acUbGnICN3xZ4hMpeZfJZiGXP3ZnGjC3O3
         NgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471797; x=1752076597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sijGuv0J5fB8Vzr/9vmlhKrZLedD7CG9VSAJJpn+Dz4=;
        b=Leno8/+nDbZAdQstjXHazBUnlKyCAdHPwgtcK/Y0HrWEZ7hmY+FKEoa2VIOWwMKmUY
         pZltg0Ty3Eg0wyQERZvDICI7ZxqUedsplCw3hExB7+IuZ/Lc/rJ0e/gBrfK4357L1JnK
         fF1z/fX+Nt+p7KSCHbHNRsmEZwWRrSHrOa23kclk38rMgLxnseOPh2jyzil9ng8s6uDp
         /S2+NU2DH1eC3NHYJdwefna+ycixlNLTJNIbzjlfOlLZiO/+pCQKUtpfxnnKUu/tATZG
         oFZPNDSUeXCdt9HfNdBRv1J9c/ZhHb+vsPKZzGQIck56b4/UHnYLC8OiZvfu6Uq2gxgt
         pgRg==
X-Forwarded-Encrypted: i=1; AJvYcCXaLgS7cWYfP5svLinSEVOxSQ14D9BQFidkOiS8h6V9py+huc0hfXD/xRMb83NrIpfZFejDnBzXmcTeIgQV@vger.kernel.org
X-Gm-Message-State: AOJu0YxlH7mrjrTnN+9FNq+PNLFRLmX+6coUZfk7KdgokA4f1FdfWTGB
	F9e4Pkr+FqaREsC7L6GdU/PgteIV55jg8jCmtFRfVCHG6WycCAD5XbllJr8j5lyv9eY=
X-Gm-Gg: ASbGncs+kzOz5Cn0ytGTXcYZl62NUZMUTPaG77grGUTlGp6htPVr/n1WWfRGHYqcsMg
	KehtQWoP9svWsjp+8RKORiJPduN0Wln6ecQbbDUV32WSdPaLYaN6RKQPEAiFMjlpCogy9G9USj0
	IqAc/+JxcqRIc6lgkP4B43tgC/VvRnBZdSDe4qgFqUYsz69doo8b+9RyNU6m0v2PU+Cla467375
	vsZXR0UA1z4KETSLsiU2q8Gh2IXnIQmJjFRLEKZG8pF4Kk8Bis3/bLQYPI4w4SqErYVoc2LK93F
	taaRpEnAr2Sos6+F+kbVw3VCr4t17TQ5yOmLsFsTlpnMDzJp+q5FsKU1+ihhEc1/m9QDGjEMkRY
	Wshv/Ew9cigdtgEm0S74rajvRhk6Z5j3lCKzOxuhIcdlg1tn3E+aMEW7qn31a1ga5b0596DXY
X-Google-Smtp-Source: AGHT+IG3hvlUU7eMQ7CSrmXR3VmSyCQkil087Xi4HGtR4+z3QI2IHlTDDH+JMq8imP3Laa4nh1pd0g==
X-Received: by 2002:a05:6402:50c6:b0:607:7aed:feef with SMTP id 4fb4d7f45d1cf-60e5361087amr3153404a12.34.1751471797304;
        Wed, 02 Jul 2025 08:56:37 -0700 (PDT)
Received: from otso.local (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82909b93sm9151109a12.29.2025.07.02.08.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:56:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 02 Jul 2025 17:56:16 +0200
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: document the Milos Top Level
 Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
In-Reply-To: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751471795; l=5120;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5M9hqzDbD+NjiWVoqaJKjz8iJ2A0eUS7imv+8oLkIhY=;
 b=LDc980X/VpxpZufZk+Mx78O4bRqR/y3NjspRS+hA+WGBwdBp4bbq/upFKp2XeRHajdmCunZQv
 9qBqILwoc9GDQX17QAL36ZIhFc0J0QPn9UW7pJQgqUlel5SnGG3aRu6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Top Level Mode Multiplexer on the Milos Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/pinctrl/qcom,milos-tlmm.yaml          | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0091204df20a0eca7d0d0e766afcb8d08042b015
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,milos-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Milos TLMM block
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Milos SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,milos-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 84
+
+  gpio-line-names:
+    maxItems: 167
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-milos-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-milos-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-milos-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-5][0-9]|16[0-7])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk0,
+                audio_ext_mclk1, audio_ref_clk, cam_mclk, cci_async_in0,
+                cci_i2c_scl, cci_i2c_sda, cci_timer, coex_uart1_rx,
+                coex_uart1_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
+                ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, dp0_hot,
+                egpio, gcc_gp1, gcc_gp2, gcc_gp3, host2wlan_sol, i2s0_data0,
+                i2s0_data1, i2s0_sck, i2s0_ws, ibi_i3c, jitter_bist, mdp_vsync,
+                mdp_vsync0_out, mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out,
+                mdp_vsync_e, nav_gpio0, nav_gpio1, nav_gpio2, pcie0_clk_req_n,
+                pcie1_clk_req_n, phase_flag, pll_bist_sync, pll_clk_aux,
+                prng_rosc0, prng_rosc1, prng_rosc2, prng_rosc3, qdss_cti,
+                qdss_gpio, qlink0_enable, qlink0_request, qlink0_wmss,
+                qlink1_enable, qlink1_request, qlink1_wmss, qspi0, qup0_se0,
+                qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5, qup0_se6,
+                qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4, qup1_se5,
+                qup1_se6, resout_gpio_n, sd_write_protect, sdc1_clk, sdc1_cmd,
+                sdc1_data, sdc1_rclk, sdc2_clk, sdc2_cmd, sdc2_data,
+                sdc2_fb_clk, tb_trig_sdc1, tb_trig_sdc2, tgu_ch0_trigout,
+                tgu_ch1_trigout, tmess_prng0, tmess_prng1, tmess_prng2,
+                tmess_prng3, tsense_pwm1, tsense_pwm2, uim0_clk, uim0_data,
+                uim0_present, uim0_reset, uim1_clk_mira, uim1_clk_mirb,
+                uim1_data_mira, uim1_data_mirb, uim1_present_mira,
+                uim1_present_mirb, uim1_reset_mira, uim1_reset_mirb, usb0_hs,
+                usb0_phy_ps, vfr_0, vfr_1, vsense_trigger_mirnat, wcn_sw,
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
+        compatible = "qcom,milos-tlmm";
+        reg = <0x0f100000 0x300000>;
+
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        gpio-ranges = <&tlmm 0 0 168>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        qup-uart5-default-state {
+            pins = "gpio25", "gpio26";
+            function = "qup0_se5";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...

-- 
2.50.0


