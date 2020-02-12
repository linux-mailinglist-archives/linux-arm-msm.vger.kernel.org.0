Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B25B15AE68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 18:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgBLRKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 12:10:17 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42855 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728793AbgBLRKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 12:10:17 -0500
Received: by mail-lj1-f195.google.com with SMTP id d10so3184375ljl.9;
        Wed, 12 Feb 2020 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OuX98j86Ch4dS0yCqSb2Pt9fzt9ip/SvY8mHAnanoTo=;
        b=l1kW+okFviwV/mK0Skm3CDhTFSoJMBfU0JWqem3hWGTPh3M6Naixosu1yxCTeNkLNo
         ZH+TSDvbR8uFQoaPxnhGt3s1zV4j8aF8fvXKtvdjj/1fXby4OdEJ0uyHHTQIcOn8h0Od
         n545f8ZDX7dKRK3b9Hse2+ZtovEqYTBGh8PD66yue374DPsVvONYdpj5T0jej5Fh7JAe
         z8xOxtPh7gAxKQbzbVIgxI8z+iV71+Yke/nbvVieHnVE+m901tjmN6LFEUDzystKAqRy
         7neMz8Cs+0oVupEAx2jVhEWbSjZgx+OjDb1VZmUzAkaEml66oOdrF9N6Z3uTMOVb1TyO
         w3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OuX98j86Ch4dS0yCqSb2Pt9fzt9ip/SvY8mHAnanoTo=;
        b=EVCXXPhVR7NT5/y1g7Dt3knxkJb6Bf3/TFxkj/w5xaQVOnk1qd9ZALFLzR3z9vf9jL
         2f2WLA7OJsnZa2Xz6Ep4wI7PK7Y9f/I5o/sl9lltUW3evdW6MYFtJe0t9fEXOiVPxpjr
         sni1SlYHTGArgQBnLUHjQL2acVD7/npAphtgMw9JvgOwhm7fEBVsMWCIeFLUyorhJ5dD
         15eI989v/BB8rCwprpTIJpUd0rL0DEgVEmXv/NMPJ1GnPTCfcqz7Xr+bce71W8HEPGZB
         ybsxCgpKHB3Z6iO4NRyza/jz3Q55lm++8aUoYNBIfPplFWAnwwJluPMXtIRIMfCirVrU
         kapg==
X-Gm-Message-State: APjAAAUuvYVqD2cQIKEO1kvtahkP+2kIvO6Pbk2VB06JFt0VToynngUb
        inrX3r9EAHE70ThXTN3k+Ts=
X-Google-Smtp-Source: APXvYqwINlL4Q1/ftB7u6oRHMKGAOyh2CjdjmuZXbCSU0F46RUl1Q1a3ffsj0VUCpFxDNoLY1EVa1Q==
X-Received: by 2002:a05:651c:414:: with SMTP id 20mr7963298lja.165.1581527415378;
        Wed, 12 Feb 2020 09:10:15 -0800 (PST)
Received: from emb-minnehanov-OptiPlex-7060.collabio.net ([77.244.21.162])
        by smtp.gmail.com with ESMTPSA id b20sm607955ljp.20.2020.02.12.09.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 09:10:14 -0800 (PST)
From:   Alexey Minnekhanov <alexey.min@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Alexey Minnekhanov <alexey.min@gmail.com>
Subject: [PATCH 5/5] arm64: dts: qcom: Add Xiaomi Redmi Note 7 (lavender)
Date:   Wed, 12 Feb 2020 20:09:16 +0300
Message-Id: <20200212170916.7494-6-alexey.min@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212170916.7494-1-alexey.min@gmail.com>
References: <20200212170916.7494-1-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the initial device tree support for Xiaomi
Redmi Note 7 (lavender) phone. It is based on SDM660
SoC. Currently it can be booted into initrd with a
shell over UART and you can get kernel boot logs
from a pstore-ramoops.

Signed-off-by: Alexey Minnekhanov <alexey.min@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 973c0f079659..a61b1089bd9a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
new file mode 100644
index 000000000000..676efba0e16b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, Alexey Minnekhanov <alexey.min@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sdm660.dtsi"
+
+/ {
+	model = "Xiaomi Redmi Note 7";
+	compatible = "xiaomi,lavender", "qcom,sdm660";
+
+	aliases {
+		serial0 = &blsp1_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@a0000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xa0000000 0x0 0x400000>;
+			console-size = <0x20000>;
+			record-size = <0x20000>;
+			ftrace-size = <0x0>;
+			pmsg-size = <0x20000>;
+		};
+	};
+};
+
+&blsp1_uart2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart_console_active>;
+};
-- 
2.20.1

