Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A99D48E0F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 00:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238190AbiAMXeN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 18:34:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235609AbiAMXeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 18:34:12 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9E6C06173E;
        Thu, 13 Jan 2022 15:34:12 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id k18so12827754wrg.11;
        Thu, 13 Jan 2022 15:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8hqe6jXoXNhcyFzYzqsIs/6PsAukIAAN1Kbs4DiPAqs=;
        b=ZYasOc31Utvft2Xo85b7fC5CYIAi3krLwEYkNY/k/dWw4hBR8RxNuLeKP4yMtzbDgZ
         bzIs4tC0xcUZaEAjC/uDUNdcJQ09OyuayZiZi9jNRbBNmKHE6A9UiZTGHS8kc6FYVSGM
         8KhngiutYRH2F1fg5gpwW+DwuaDvWCQUpF5t32+0uHjT3OxDrQovTh5b9yaBHb40JXZm
         mhklY10FXUGTDd0LmgjJwCbiCS2Si/P72hUDovRijU6tQAWW/uBJ1ZPMbIwp1KewA3Lc
         dG+OwDKvRYwuRPZQADaF0u+tWSKtNdX2sASvwEv3H8VLsK1QYt98IYcVuC7loMHYABKk
         Yoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8hqe6jXoXNhcyFzYzqsIs/6PsAukIAAN1Kbs4DiPAqs=;
        b=BJlx8C6Q/FdikjkF9CdMPtlwWCgHy4tjBBnW10KtEA38DqiaJ+shY0bbbkPToZOIE8
         +N2OIXKvyKfvmL0Ms+nCCiXk0DxcUccJQd6p4yXgrgPrkHUtbcEWcC6v/jfodOrKZ/mK
         wZrzEPk/EP0kUm2AxmkHx0rkaqeiK1URvqtmhc7sWW5S/VGajmWVH2bQnVJOxW3Pc+cr
         67JYfno11hga0pZo5vt9Mng7/Vaoe9EaGMMAcjI8QpkGg3Vn4LCFDDFIiB61/v6XyGV5
         xYIZ9V1tbEnzj+MsFEaYDo8YOBRXR0r04fRy1wAvDFnxuNhJ+lOyWS5YPVPgepEUcUPa
         dljw==
X-Gm-Message-State: AOAM531LfiH/6FQ6jV0pC66cPwNOYJq/ZBwXLy+TdpkKn62lc1G4byCq
        IfxZSTPPE9mna96wDt0h2db6vHeM4+NGlg==
X-Google-Smtp-Source: ABdhPJz/JWa3zbdIgZ3Pr7Qqc9tIZP9x5aF753Prn0vgF9MNfHnH71JQGi7u1t/csf+6bRdQVvsIrQ==
X-Received: by 2002:a5d:4451:: with SMTP id x17mr852401wrr.505.1642116850813;
        Thu, 13 Jan 2022 15:34:10 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id u17sm3724748wrt.37.2022.01.13.15.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 15:34:10 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Jean THOMAS <virgule@jeanthomas.me>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, linux-mmc@vger.kernel.org,
        Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH 2/6] arm64: dts: qcom: msm8992-lg-bullhead: Add support for LG Bullhead rev 1.0
Date:   Fri, 14 Jan 2022 00:33:54 +0100
Message-Id: <20220113233358.17972-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113233358.17972-1-petr.vorel@gmail.com>
References: <20220113233358.17972-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jean THOMAS <virgule@jeanthomas.me>

This commit implements a DTS file for LG Bullhead (Nexus 5X) rev 1.0
with its matching "qcom,board-id" property.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Jean THOMAS <virgule@jeanthomas.me>
[ pvorel: rebased on current qcom/for-next ]
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  1 +
 .../boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts   | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ee8e81f1c449..0f983400d60c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-j5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-octagon-talkman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-xiaomi-libra.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts
new file mode 100644
index 000000000000..7e6bce4af441
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) Jean Thomas <virgule@jeanthomas.me>
+ */
+
+/dts-v1/;
+
+#include "msm8992-lg-bullhead.dtsi"
+
+/ {
+	model = "LG Nexus 5X rev 1.0";
+
+	/* required for bootloader to select correct board */
+	qcom,board-id = <0xa64 0>;
+};
-- 
2.34.1

