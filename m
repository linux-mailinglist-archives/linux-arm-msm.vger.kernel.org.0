Return-Path: <linux-arm-msm+bounces-79101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D7FC1319B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 89FA94F187D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2901C1DE8B5;
	Tue, 28 Oct 2025 06:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiDnYaKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA7378F29
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632210; cv=none; b=T+bzL6FcSUQtNoaCmhS7HbsMRj7ekSomEz46wofMQiUMmJe5dMQ4Qj1LVMgLwu0SjFroz9IutE+pklgjpLbl4bZrXJZGFUxNDQXlhUGlmG/gXHMy5zxsZBpFhGlO63UaJ1BTHDtTeFqH8jZ7x9JTR3nDiaEVLQSbMJy3I3sOaPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632210; c=relaxed/simple;
	bh=g1Z1Cmrw8IPRCJvHZBviSWAMUJdzKbL3Q6ByvBvKwqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qebq2+iVNsDZe3pZSBOpCXL6p1TTadT32CySnDtwgsBUMJ4znhuUV+lB7r1RUM2/o34dz9itPfsS59GlIgRRojYFkyNEjiXKlnBmQwoYcfdvi3jOQmEQtZmLSwuC6lWuIoERXCPLGVDCQ3Iy65p36BovT19kM6tx37BQBapNEH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiDnYaKt; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-290dc63fabbso53512395ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 23:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761632208; x=1762237008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANaguIGE6Mg1uan6Fo8/v5ye3Nl045G6s+p+P5Ycf1E=;
        b=eiDnYaKt1oiMKgHgRRF+KuYUQ1Pc3rGe8F+JTOR7DixOraskn1Klxj6+jQtPiWJEf8
         /VvX+q79y+3V/lP8BuNTs6EPvW7rgjWeobrcJ8qlSr1UoP10WXIWsXqhCDEbC1uy2pMS
         eEK6aYF69zmZnj1R2Pe/zf4znzI42mknbJR3OuTc2oU1BxBQ8Xz0A54CPGVS+abw6/Mj
         A6xFZSKJpg53LZaiTfiSI3OD4w6MUGZOKF9+H16AZBoRFevHGuFNq7suAW897TyNK75g
         4CmDi/wgPUtuMH/6lmYwg1Pz6hUcSMro+vuARR3CnPxJWW1iCD5zLgZciP4XeGeIjaSq
         iILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632208; x=1762237008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANaguIGE6Mg1uan6Fo8/v5ye3Nl045G6s+p+P5Ycf1E=;
        b=m7dQwzBo3BliOCtOSC1yrKsQpENTnn9qKimc4yL+S67wLdReg+nOoGsz9cWTW65vOQ
         OT8uCS3Tlmc3isHzrP2132pevFXzpPRMWlr9plWgD1eQlzdqBBOMB0dkL6A0oq1Gww+H
         LcSbzJtgSDEXEzFo5SqtLyJfD6hMjFFG8szfVTO1JOqJz0wslmalYan7cUDJTOtyrg6R
         L4j1Qe1VJZRpD+uTuxo/ynRI1cF6XGB96XZzHOBrdBZ9Xb/ctJFEdtNdi4SpJESfTWTa
         O3K+lKyaOYkCbGgJ1UpA37UV0SKBJ+yzl5oEOX61u1uSeHow4pEGIDCURtQLQXA93r5x
         IgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLTms7ac+cqOliSRmaomKoqPNlfouVOmompmirUGjjfWBAhGjKAIeaLvP5yHZ532FDKn0PZhpUW+15QTBv@vger.kernel.org
X-Gm-Message-State: AOJu0YxAuwFBjNJYN63XwpKs+zWrkYf4EsFxCl59oiQSN7QnI1ar8ez4
	vN60S9bIEaExLL+egP00Fj1osidDkKSlx/bCc1PelbgY60W9EVAhl8lJ
X-Gm-Gg: ASbGncvnVxjxibmVBqTsIMEULQeGgqlW0AUXNMRNvUON8SE2ax9/TnerFEWBWlL/gFn
	kKASV35Me+8OfZs4mJ1WENKN71VpZ22O13RIItc+/ZbAXJq7maIF/wf9YQq44Ai5QhET6h4+mtH
	lRFxIldBh8/Pp/pUMHWlf0HtfUPjNQzQfHdm2iuW6vxJdl2T8BBmXSW2H9CbU/hb4w+kDBSGvGN
	IRjk/76yVaK3S2he7BEJF0xg8+YzwZXhcTjWjxcavu7DmlVXx+qVg2fvR1bXRkJ9Jk/INBO3I7h
	QzoRwY7wPMPYFC9p+9aDqz8yu/6OZTbyTlJvCkjAi/+OSRO7tasZzQZBJfi6xsiPD24s66f2hBn
	bppIeaw4dtN+Tl3jgdXT5+FAP6WzCHA8/4QBrF9mwpICaTknp57pfyvEqL8derOTwnqgT5bxoVB
	B43nYRGRdpFH4KOvvJXh6emi5TMrpGCKVcG8Hy
X-Google-Smtp-Source: AGHT+IHujYfVX8t4cPvfxgD6Rg2cmQOZiEyisv8iRBSftzxCsJ6TT6aWfqaExapbVNwCJk45YYeZgQ==
X-Received: by 2002:a17:902:c943:b0:282:ee0e:5991 with SMTP id d9443c01a7336-294cb50e16dmr30682195ad.30.1761632207854;
        Mon, 27 Oct 2025 23:16:47 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e429d9sm102612935ad.100.2025.10.27.23.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:16:47 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: qcom: talos-evk: Add support for dual-channel LVDS panel
Date: Tue, 28 Oct 2025 11:46:36 +0530
Message-Id: <20251028061636.724667-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028061636.724667-1-tessolveupstream@gmail.com>
References: <20251028061636.724667-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a new device tree for the QCS615 Talos
EVK platform with dual-channel LVDS display support.

The new DTS file (`talos-evk-lvds.dts`) is based on the existing
`talos-evk.dts` and extends it to enable a dual-channel LVDS display
configuration using the TI SN65DSI84 DSI-to-LVDS bridge.

where channel-A carries odd pixel and channel-B carries even pixel
on the QCS615 talos evk platform.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/talos-evk-lvds.dts | 128 ++++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d5a3dd98137d..6e7b04e67287 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -307,6 +307,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-dsi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts b/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
new file mode 100644
index 000000000000..7ba4ab96ada6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+#include "talos-evk.dts"
+
+/ {
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tlmm 115 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+
+	lcd0_pwm_en {
+		compatible = "pwm-gpio";
+		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&lcd0_bklt_pwm>;
+		pinctrl-names = "default";
+		#pwm-cells = <3>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS A (Odd pixels) */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS B (Even pixels) */
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&adv7535 {
+	status = "disabled";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	sn65dsi84: sn65dsi84@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
+		ti,dsi-lanes = <4>;
+		ti,lvds-format = "jeida-24";
+		ti,lvds-bpp = <24>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sn65dsi84_in: endpoint {
+					data-lanes = <0 1 2 3>;
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				sn65dsi84_out_a: endpoint {
+					data-lanes = <0 1 2 3>;
+					remote-endpoint = <&lvds_panel_out_a>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				sn65dsi84_out_b: endpoint {
+					data-lanes = <0 1 2 3>;
+					remote-endpoint = <&lvds_panel_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l11a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&tlmm {
+	lcd0_bklt_en: lcd0-bklt-en-state {
+		pins = "gpio115";
+		function = "gpio";
+		bias-disable;
+	};
+
+	lcd0_bklt_pwm: lcd0-bklt-pwm-state {
+		pins = "gpio59";
+		function = "gpio";
+		bias-disable;
+	};
+};
-- 
2.34.1


