Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5522820A4BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406024AbgFYSWA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406016AbgFYSV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:21:58 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECA5C08C5C1;
        Thu, 25 Jun 2020 11:21:57 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dp18so6877513ejc.8;
        Thu, 25 Jun 2020 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mLiV2Xm7mdvGns4UhpSRX2p+DTCzoHG++quz1vD7S9o=;
        b=hfell9so75NLCpQ7OaQ8axRWNskfksS76RnSZ6UT3Os35cwfb2u00XXZiHvRsTvvzx
         FfQ1RE1esSnskPPXS93zOwvG/SYegp5a6YC2zdqhUUCFDtxFXWkp0XULduZv9rktD+6r
         87fltf8rD6dcdiHtNUDMhCOjP9N25vBFwXAQDdX+uK4FOvXFcwrmliMZEPk2kHqrMPzb
         NoYAydSIBCkdzyMUdlrqHfku59CQEWq/zS/VkDlYkxmxbXCzhgh802jfvysSfew5jlCV
         wUBQ+BzeflpG9uOsE2JypCTzCpyy5nWRXrR4hEUBtA1HSlO2pACTDCrPIHA9OvsQk2oy
         Da/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mLiV2Xm7mdvGns4UhpSRX2p+DTCzoHG++quz1vD7S9o=;
        b=LKexEf3WwkBu/7SNCExFLuZYIkmnT27vtis/HipzanldgCYZqCfRy3KSnkPxS1/iq6
         pr5Vuhqd7KynPk/6nPD1YGrw0xjSaiGBhMb3EA7xloK5u+qzHkN4dVG7B3GclU8ixTjs
         c6UmFiW4xfG0iY79dDDvCRz32OebIWw/SAoHiGPYnAJzcBfA/vcEaibrCKz07UiJX6aH
         rv096/W1LPCQA/JXmBiSfVHR+Blwo5Bv6AIOeJPzU3yYXgvW6bxANpo8TdK21OgLAXEU
         PBbEzBctmc9xkoQYlYWlXLVd/eSCVAjgqtGfzyKxVRQOBHH7uZgqFt6e8gtXxFE/OrNT
         zn2g==
X-Gm-Message-State: AOAM531X3M3nqPQJ1hOgPTeOWCPEsezQgdUptG1qhwxjdz90k/YfXn7Q
        wXzjAdFoHmhGMXCn2Rh+MYs=
X-Google-Smtp-Source: ABdhPJzAB1GNqTS1/EVlmpouqMRO2C8H5aosbEb+Mt5JfMaXq9ZP23qk4a6aV8JMNTF9CwAaiNejUQ==
X-Received: by 2002:a17:906:8381:: with SMTP id p1mr9062791ejx.280.1593109316578;
        Thu, 25 Jun 2020 11:21:56 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id lm22sm1523448ejb.109.2020.06.25.11.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:21:56 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/13] arm64: dts: qcom: Add Microsoft Lumia 950 (Talkman) device tree
Date:   Thu, 25 Jun 2020 20:21:17 +0200
Message-Id: <20200625182118.131476-14-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625182118.131476-1-konradybcio@gmail.com>
References: <20200625182118.131476-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree support for the Microsoft Lumia 950 smartphone.
It is based on msm8992 and supports booting Linux via a custom
EDK2 port.

Currently it supports:
* Screen console via EFIFB
* Booting via EFI_STUB
* SDHCI
* I2C
* PSCI core bringup

Please note that there is an implementation of EL2 startup
on this board, but it requires the user to resign from
PSCI and use spin-table instead. This revision sticks with
PSCI.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/msm8992-msft-lumia-talkman.dts   | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 344cdeb68b16..77256eef9520 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -9,6 +9,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-talkman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-xiaomi-libra.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts b/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
new file mode 100644
index 000000000000..3cc01f02219d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "msm8992.dtsi"
+#include "pm8994.dtsi"
+#include "pmi8994.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+/ {
+	model = "Microsoft Lumia 950";
+	compatible = "microsoft,talkman", "qcom,msm8992";
+
+	/* Most Lumia 950 users use GRUB to load their kernels,
+	 * hence there is no need for msm-id and friends.
+	 */
+
+	/* This enables graphical output via bootloader-enabled display.
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
+&sdhc_1 {
+	status = "okay";
+
+	mmc-hs200-1_8v;
+};
-- 
2.27.0

