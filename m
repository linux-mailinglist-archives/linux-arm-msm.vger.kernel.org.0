Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE6A20A489
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407078AbgFYSNn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407074AbgFYSNm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:13:42 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1715C08C5C1;
        Thu, 25 Jun 2020 11:13:41 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w6so6866237ejq.6;
        Thu, 25 Jun 2020 11:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mLiV2Xm7mdvGns4UhpSRX2p+DTCzoHG++quz1vD7S9o=;
        b=PahT+4XIh+ZCkxwD159puAV+xtrWhNCRF2idwIMFNsX7193zMKswKCPNBRKW2xj7tB
         LZ4/AB2z4phuDkBMPsLrrAQzoLhyPfLP4vmCBlsxtDvZqbVUm/ww5gpi0AZghfmwCZ6m
         DdZNzLh4DiMjxg9Xl2YXU1hYGVl99fFl2KdqoKW5mEXVAsJE6ug3J8un+4JCbS0GQLCH
         DoVLwccUfDDyxzgaAkRBMvfFiePAV92an1cVfYXfd3JeUHVuyXJSa224WlTW3OKRpua8
         MbQUe3Py9AtKVAlSbv0B9IXOXuRJ/cLyuRJguGE/kf6nuH5if7Br/RMHW9ZFHZiI5L6z
         8WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mLiV2Xm7mdvGns4UhpSRX2p+DTCzoHG++quz1vD7S9o=;
        b=Js/D8bwLBImBGyFW4iApF2ZKmPQyOpKnf3YfCPka/WeKhdg+HE1rYtUPPMVcyUmUVe
         QuSAS8OKkNJeuPdMFwkFB8YiFmeuxJ4hihPobMexD1XzzLoBJQzUwXHpD6o3IG8JZYTb
         Ot00VFyvu2Yo6pjxFqsq/+Q86Caqxihfjc8Vh7vpeF4TS1Zh+7tBVs7+Sb7T9qhNkLv5
         R4ULQV0HC4SyMCqglHK38f1R8JWRjTPMAM7ULBzY21jreJZ54AkiUiKgeSBhQKn7SYBZ
         tMfjy16XjrNV1PR7AIjvm3nCaB8KB5g0PlCKkiTNaEDZVn6QQ4Gb/AQecGwpB2nhGpUl
         yj6Q==
X-Gm-Message-State: AOAM5335Ff1+N3QAY+a6RL3MH4zbEX1OiDIGAs7AlMpqVtMp20GkqTcs
        fzRmqpouJ2B23Ma81+DjPk4=
X-Google-Smtp-Source: ABdhPJy2gZzpNoq7nCyrGqfwEWjurVYbvJEz6IqA1pvr4ByZjtUDRCTJOHDp4e7Yni+ONXNVzR4zrA==
X-Received: by 2002:a17:906:fc20:: with SMTP id ov32mr28848453ejb.531.1593108820684;
        Thu, 25 Jun 2020 11:13:40 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id p4sm19511112edj.64.2020.06.25.11.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:13:40 -0700 (PDT)
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
Subject: [PATCH v2 13/13] arm64: dts: qcom: Add Microsoft Lumia 950 (Talkman) device tree
Date:   Thu, 25 Jun 2020 20:13:01 +0200
Message-Id: <20200625181303.129874-14-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625181303.129874-1-konradybcio@gmail.com>
References: <20200625181303.129874-1-konradybcio@gmail.com>
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

