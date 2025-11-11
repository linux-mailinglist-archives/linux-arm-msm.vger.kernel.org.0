Return-Path: <linux-arm-msm+bounces-81212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D83C4D293
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E239B4FD243
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D5934FF7E;
	Tue, 11 Nov 2025 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CC45D6IN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A9B34FF6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857779; cv=none; b=kiZ7fjF7ECz9qIYbv7PiyblceHNVw+j5Ppo8MTuT1BkjJBEIvkzOsPc1wYGvIvf5VzgNV0SinC2zuxu0ViPhbfRPAlC+scA9wzlt7sq6Blt9t2VS/O+2Xzy/Oqr36No9+dHSchhtLqLR5CSnrJ3KaotC/6qRCeAibEactQHuox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857779; c=relaxed/simple;
	bh=MPJETMYI7dWOLt6/n9IzJSMzQlKG2FVGqAgOqOZYvV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=skpmboY5uhdhSoJHtp5i9t6JWSnpqmoutW7w2pawCrXiz5ZLz7WG8QEsc38c4ZwzIn62OWPP7L28VGd6SXznC/N4w9n7zz6U0C3h3OGKGyOZqvYvRSLgw+qkcaFVpKmgXMVmNb/BkJJnZg+LpebdyXGOiyvm6zC8E7i7tNkL2rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CC45D6IN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29812589890so26877965ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762857777; x=1763462577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGRhGlZHAoccrsdkNElXy8I6EJeUpk9FFBinfWP92lw=;
        b=CC45D6IN4UzfG/BSstS2NCVKzWLqwNYvZ9QLgE6duLU9zSMx1DcJIrCgIJzMM9IZwh
         R8x6rU0ifQ7f4ssAs0AzqAutqzllL2xvi2cBaP1cikO++v01iOQfyp0Ra7PR+9cQ5vkB
         v8ysMbSsOgkQsAw4axslm/JJOrPH5jLcoxD9U8SnjJq6V5hwbHEmHXTeozQaO9hrOu7x
         ByEZileKrGyR1+QmRXJJ1mDu0DYYxU1R0FqfSUF6k12J4miMQGHQHcvILfnS4oh/qfUS
         fFmV7XEIp71bowxqr92VtiM5G4eofUTgo8sz6hGYuOrNw4FqknT1ECbVtlsApSI00U3/
         +YhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857777; x=1763462577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vGRhGlZHAoccrsdkNElXy8I6EJeUpk9FFBinfWP92lw=;
        b=SSIz19YxDN1n2fioRkiOMUCjsn5JR8QKjEGK3Ez/QHJ+G28LoSJSW1zZpmW0BU3RU+
         iacsmVWMnk+Cb8tPKdSEihmDRiP7SSlCpNVaLG1pq7iZ0bAk05iUa/2rIF7Jf5Uz+xoo
         NlI1u4BS6kEZl6EOpcfCLmmjQWhi/jIlepPTeUz1qqgRlT/wZ9ZFMIW0OWkWixJcE/9n
         GTlz+M0mYmPRgd+o0ibN3at61el00NVzg1K5/YULPfrhEuR06IKpeV99MZRg/2rPHl5h
         HtXRC9p4HM9QkNVTNM71nHkWJwLK35wRoy7IzRUOBmoU3so/gfH/T2AIe98PZN860HhG
         2mDA==
X-Forwarded-Encrypted: i=1; AJvYcCXMkfKxciQv67FE9mr73JW0R+e0dmVO0hjjq7jJteRNzxfBj9Qa6uEtdWPPXtmAjKXHhoyRamPE93hBGf5v@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWFdtv/MaDF2Guv5guG95ufHKnRZzKE/PYzwADWfYvQm2lYfU
	ZBSr6fkKS8XTgMFmOGSAwG0F/fECzAzn1kEPCuv5UKqQfkNsCIfmq/5E
X-Gm-Gg: ASbGncsJOIDDsZUUO1K4PYregMI988u6cZXlLy0P1tdcGnMfSBJ0PWmEyX28ljue8sq
	pPQyOetvmeC0HcmCQHwWzWMOqQ08pwULjtk5HuGhMLL6kD5Ak/WdNOSNQymfITo/b/rtm8mkC8Y
	wO/0sv+KB7X/52rYOZYSPl6FAEO2ja5qwXIM4BUQOpBRI9zD01XPI2cBSlqhO98QsQnq1cZp8Kj
	rwQCj+uwFeSHD0/03651BWhNfI7GPCsGasa9fiKhqyBVlaaQtiCqXXJv+z0sRIURFZ8+vxqKhlj
	qpGSddkYwwtG9SyItZESBTPex4/EugD72DeOVqg1kC/X7wNSGkCnBqvrDH8y25wiCijcOG39IUV
	5HvAfQbjBfo4VGg3wm7YoVDAPXzOZpVsqRjX/P1UqR6Q/cpMT5lMPLR7phb85ndrLRRXmuZoIz0
	gpoFVjvk9AiNaFqKDSPGT+SeXwHFqkBpEmQZdM
X-Google-Smtp-Source: AGHT+IHJsqK3225QNg/lHSnOP7SQXHe14YnI4hlpXDxBwQPf4by5o2ZcPMaK6uU7gFSHpt1eiaYvcQ==
X-Received: by 2002:a17:902:ce83:b0:298:ea9:5732 with SMTP id d9443c01a7336-2980ea95b02mr105165995ad.41.1762857777500;
        Tue, 11 Nov 2025 02:42:57 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29846334db5sm9875235ad.32.2025.11.11.02.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:42:57 -0800 (PST)
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
Subject: [PATCH v1 2/2] arm64: dts: qcom: Add support to validate direct DSI
Date: Tue, 11 Nov 2025 16:12:45 +0530
Message-Id: <20251111104245.3420041-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111104245.3420041-1-tessolveupstream@gmail.com>
References: <20251111104245.3420041-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds device tree support for the Waveshare 10.1-inch
MIPI-DSI panel on the QCS615 talos evk platform.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |  1 +
 arch/arm64/boot/dts/qcom/talos-evk-dsi.dts | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-dsi.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 282d744acd73..d5a3dd98137d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -306,6 +306,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-dsi.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-dsi.dts b/arch/arm64/boot/dts/qcom/talos-evk-dsi.dts
new file mode 100644
index 000000000000..8a6dc8b6bf8f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-dsi.dts
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "talos-evk-cb.dtsi"
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	display_mcu: display-mcu@45 {
+		compatible = "waveshare,touchscreen-panel-regulator";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		enable-gpio = <&display_mcu 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l11a>;
+	status = "okay";
+
+	dsi_panel: dsi-panel@1 {
+		reg = <1>;
+		compatible = "waveshare,10.1-dsi-touch-a";
+		reset-gpio = <&display_mcu 1 GPIO_ACTIVE_HIGH>;
+		backlight = <&display_mcu>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+};
-- 
2.34.1


