Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B0F1AD421
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 03:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgDQB3Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 21:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725858AbgDQB3X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 21:29:23 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC60FC061A0C;
        Thu, 16 Apr 2020 18:29:21 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z26so312884ljz.11;
        Thu, 16 Apr 2020 18:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K1Hzn/BJMd0rZNhmMM0WORg4+BlKP3lZ+87qqyTGVGI=;
        b=bD+BrHKWQCbi4Cov5cPm3m8VIPjV4RTOzjRv6XK+clbbcklw3QhvZ254LptzCx0m4A
         +OHKDMDSXKi6vOapkNq7MVzYgOIYQ2hl8uxiVOiC7KnRHSyeSS2h6pfVDbqlqqMZEicC
         foUhx4hRK99+fYaK495jgqnETQP18lwJV5G2MfbMaJU17AkNhPY0R1M3wx3ZvX+pIhYW
         SbqI96d6ND+6L+1GgYMNDW6HZMiWkT8OowdUZqRXKhAozSF7UhzA5e2BwrrougtSK74B
         tp//gwO4IJTzKS4JY11ytCb8L0gC7LyZDsgDcbp15+nCZaLGe+JwkST7OYQpRequuoUW
         rBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K1Hzn/BJMd0rZNhmMM0WORg4+BlKP3lZ+87qqyTGVGI=;
        b=L6K+PocdZYtIDvMe58yd+FrHWq9m+IO+ssYidDJZhldAUBS8r+Xbed5ioy42kQQPq4
         PjoZ3LXxeRdKbdXQBYCutzgsjlG22dMzcBQlMzPSUuMFeoBhrCgmLcOnhXu4LR1c/Df8
         vEBnolPJ5ItPov12HH4EJBY/uiM7W2T5Yh86GiQ2Wm+y8+3NSgV7dEPeG+comkG6R65d
         hS1JzQCejLVi2b7bEDOGovRGvPIpnAebRtJy4s3/sazO7O+8z/F+epYrDuQ1YotOlKk1
         9Nw++Dc6s6z8M0QnoJTVU3Rw9z92jThRMp+tlnCVpWGS5/HHSQHcIjBzaM+4olRIQf+X
         kkwg==
X-Gm-Message-State: AGi0PuYRsEQmCX60R/47tcrviJlsCiBxWhP2io6HsdKHMNudlPputRQp
        koC0R8ovIBHrGFAN4mt+B/4=
X-Google-Smtp-Source: APiQypKSznxxFKKxYmll0N0ptqpUHhMrxB6TfVg5YPC9D8/p2/yBlhsdESVWguTz+aY/qiTUCljEoQ==
X-Received: by 2002:a2e:89cb:: with SMTP id c11mr550755ljk.121.1587086960482;
        Thu, 16 Apr 2020 18:29:20 -0700 (PDT)
Received: from localhost.localdomain ([94.229.111.13])
        by smtp.gmail.com with ESMTPSA id w25sm14644650ljo.78.2020.04.16.18.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 18:29:19 -0700 (PDT)
From:   Alexey Minnekhanov <alexey.min@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Alexey Minnekhanov <alexey.min@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: Add Xiaomi Redmi Note 7 (lavender)
Date:   Fri, 17 Apr 2020 04:26:30 +0300
Message-Id: <20200417012630.222352-4-alexey.min@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200417012630.222352-1-alexey.min@gmail.com>
References: <20200417012630.222352-1-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the initial device tree support for Xiaomi
Redmi Note 7 (codename lavender) phone. It is based on
SDM660 SoC. Currently it can be booted into initrd with
a shell over UART and you can also get kernel boot logs
from a pstore-ramoops.

Signed-off-by: Alexey Minnekhanov <alexey.min@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cc103f7020fd..0f2c33d611df 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
new file mode 100644
index 000000000000..76533e8b2092
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -0,0 +1,46 @@
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
+
+&tlmm {
+	gpio-reserved-ranges = <8 4>;
+};
-- 
2.25.3

