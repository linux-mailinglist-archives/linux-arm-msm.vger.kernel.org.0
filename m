Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381CA2838E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgJEPEJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbgJEPDw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:03:52 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F078EC0613CE;
        Mon,  5 Oct 2020 08:03:51 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f21so3719675wml.3;
        Mon, 05 Oct 2020 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jrw4GdJfye35DMtkz+TyxdMl4D17q7ijU5dfq1fHwJM=;
        b=Jqcx/6HtC1u/paWHg2IVPCZFfHYdzGga9Xp+E/xjJMk5VSnuMejlbuPZqxQEyNphRT
         UnQZH0NRiYfS5ml6WLhYL5l353EK1S70MLLZC75yY0rdIKRKQdaGEF0cEZU6x9ajlH0s
         /E98HuvFE0Sq3u2SoInA5p4x52wc30iRtQq2ZMDDttnf2koysHjDjz3MMUCRSYlJ3UG1
         GnGI8gc2BhHSc8p6xtWgXE4U4YUkmC4teiZC5B0Do2ZXQaOjf79pL9nW+JZY9q/CyFf3
         L4RE9sjKWgZe4izw1JD1og/er2nC7YdMVNzbWbwT9bM8EyKdPW99vfLlxKecfPBkABte
         dxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jrw4GdJfye35DMtkz+TyxdMl4D17q7ijU5dfq1fHwJM=;
        b=r0bFm3ZlFiAPy8GKhuXVTWKq6G2607hSSL6+krQSR7AMYFpbBFDkArEFjP3QcfiXCf
         6fqVlK5RkU0dXYGgIX3sa6iqOroLlIYHidCBiOzjVhMGcqjQkj1ez/yFXktiKGvs4uas
         Ql4mRXvmNhj3pwcgAH9OYuq7g6Z5u3yCerFtaTCys+RZj5JqVu+7sejZoNMxwer1jSeY
         Xc9O6QS1saqwUWewcj716rwtt39jMIWo+uEnKBlDOtMcKj9pbkOS062CDu0PlsXOK5JB
         8C1mxSs8D7WlIlWvPoUNWcIesTIyxy3GNtOjMldyctnprOfv0kDMPHzTz7uQQqqtslPF
         DCaQ==
X-Gm-Message-State: AOAM530XTveljbQ1Vi9Qn5CMlE4a+3HzCPboYYc7O8ZHSxoLFKjHkNAp
        qn8H+61vKSo1z/j0uSMubUPXCNnyJ5majg==
X-Google-Smtp-Source: ABdhPJxAGaC7CIYAxHBJUtxfNHa6SrQLQBBxGs3gl1I2reEyVxOrehHnnO5rv0hVTiRABAfnkVBfHA==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr17481877wmj.171.1601910230620;
        Mon, 05 Oct 2020 08:03:50 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:50 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] arm64: dts: qcom: Add support for Microsoft Lumia 950 XL (Cityman)
Date:   Mon,  5 Oct 2020 17:03:11 +0200
Message-Id: <20201005150313.149754-12-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
References: <20201005150313.149754-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree support for Microsoft Lumia 950 XL smartphone.
It is based on the msm8994 chipset and is able to boot Linux
using a custom EDK2 implementation. EL2 core startup is possible
with spin-table, but for now, we'll stick with PSCI.

The board currently supports:
* Screen console via EFIFB
* SDHCI
* I2C
* UART
* PSCI core bringup

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/msm8994-msft-lumia-cityman.dts   | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fb4631f898fd..030d9648fb11 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-talkman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-xiaomi-libra.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-msft-lumia-cityman.dts
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-sumire.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
new file mode 100644
index 000000000000..ed9034b96013
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "msm8994.dtsi"
+#include "pm8994.dtsi"
+#include "pmi8994.dtsi"
+
+/ {
+	model = "Microsoft Lumia 950 XL";
+	compatible = "microsoft,cityman", "qcom,msm8994";
+
+	/*
+	 * Most Lumia 950XL users use GRUB to load their kernels,
+	 * hence there is no need for msm-id and friends.
+	 */
+
+	/*
+	 * This enables graphical output via bootloader-enabled display.
+	 * acpi=no is required due to WP platforms having ACPI support, but
+	 * only for Windows-based OSes.
+	 */
+	chosen {
+		bootargs = "earlycon=efifb console=efifb acpi=no";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+	};
+};
+
+&blsp_i2c1 {
+	status = "okay";
+
+	rmi4-i2c-dev@4b {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x4b>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+			syna,clip-x-low = <0>;
+			syna,clip-x-high = <1440>;
+			syna,clip-y-low = <0>;
+			syna,clip-y-high = <2660>;
+		};
+	};
+};
+
+&blsp1_uart2 {
+	status = "okay";
+};
+
+&blsp2_uart2 {
+	status = "okay";
+};
+
+&sdhc1 {
+	status = "okay";
+};
-- 
2.28.0

