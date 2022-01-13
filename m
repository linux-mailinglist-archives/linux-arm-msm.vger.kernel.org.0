Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B51048E0F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 00:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238225AbiAMXeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 18:34:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbiAMXeL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 18:34:11 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D22C061574;
        Thu, 13 Jan 2022 15:34:11 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id s1so12867777wra.6;
        Thu, 13 Jan 2022 15:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TCO6Vi8mgWr9oxLizz6TAJIStLaTjVKYmUCn5e+EwX4=;
        b=hLaniOyWl6zgbRMR7fjtXKBnvsO7xdoxHQ/fQd9B1IBfc7FcUfxYaZBNv/j9sYgQly
         YdZHWQw3f74I+25nMR2jM5GJdWPpwRrUQb63u+r2JgkGzXss4Txud3amOvpZzRbUHVmR
         pyq63LGuIatElO25zmhno77Cw4SI7t+jYRx+zxmqmwEEqCVWHy2mZKymjGSOD9UQCOvR
         Jvn8ys2A3GSduADWxQecCsQGiSMBWaAc3KITSYZZfFtKbaM1B84YNmZ/EAPzryDOwzU2
         HK8h9EWVtPUOaDkyglSjDtj/tRj6V0PoNSGzoB392XxY+Suc1ohJwOK8yrdAFVkNO8C/
         LBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TCO6Vi8mgWr9oxLizz6TAJIStLaTjVKYmUCn5e+EwX4=;
        b=vfE2uJb4SwAhYQg4V19J+12gQ+G+EY/DoKVg/rurHVuoST9dODuc4k33o45Febos7J
         AdBO77QrNJ/BwWmN66hsMi6EDx9JDpMJCqSsoMFQ1X8YyqHjHXBZLOXTeYBNyEAR4No2
         EYOwHN7Jl3U9dlNrlTiQenLEpfALIFLbjRyXuS+fLHu0ghQkhXsOTvMT8aBMdAQl6dk6
         imXug2iBWFg8yN267vEimJCO+aMdITbpVJME/ECLo9JgkEVvm6DGIFYey2hN88RQHeVg
         rC3yJwLpEJxlx7rEdTxxXQsf0ctfRJoEN8+xSs62l/nOZ0e4bRenf93FkuNDRHTLgPdw
         eAWg==
X-Gm-Message-State: AOAM531UdmAwPAbARb6kfcflU+5ITM9i5GsMCxIQ1MOpAplYqtZHe2Qc
        0Rli8PzC2MQGZdEhI8KbSMVqJkoNo5MDww==
X-Google-Smtp-Source: ABdhPJwd0KrHMAm0RbStsNI4tg+jcg2SYxKKEw1KDqcSBaMgiIDkO7N24LwzSDGiPimxL+osAhh3qQ==
X-Received: by 2002:adf:fac2:: with SMTP id a2mr5677040wrs.401.1642116849712;
        Thu, 13 Jan 2022 15:34:09 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id u17sm3724748wrt.37.2022.01.13.15.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 15:34:09 -0800 (PST)
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
Subject: [PATCH 1/6] arm64: dts: qcom: msm8992-lg-bullhead: Place LG Bullhead generic code into a DTSI file
Date:   Fri, 14 Jan 2022 00:33:53 +0100
Message-Id: <20220113233358.17972-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113233358.17972-1-petr.vorel@gmail.com>
References: <20220113233358.17972-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jean THOMAS <virgule@jeanthomas.me>

This patch puts the generic code common across all hardware revisions
into a DTSI file.

It also prefixes the DTS filename with the vendor name, to follow the
naming convention used by other DTS files.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Jean THOMAS <virgule@jeanthomas.me>
[ pvorel: rebased on current qcom/for-next ]
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +-
 .../boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts  | 14 ++++++++++++++
 ...llhead-rev-101.dts => msm8992-lg-bullhead.dtsi} |  2 --
 3 files changed, 15 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts
 rename arch/arm64/boot/dts/qcom/{msm8992-bullhead-rev-101.dts => msm8992-lg-bullhead.dtsi} (98%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f7232052d286..ee8e81f1c449 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -18,7 +18,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-j5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-octagon-talkman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-xiaomi-libra.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts
new file mode 100644
index 000000000000..e6a5ebd30e2f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts
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
+	model = "LG Nexus 5X rev 1.01";
+
+	/* required for bootloader to select correct board */
+	qcom,board-id = <0xb64 0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
similarity index 98%
rename from arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
rename to arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index 4da6c44bf532..3b0cc85d6674 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -18,9 +18,7 @@ / {
 	compatible = "lg,bullhead", "qcom,msm8992";
 	chassis-type = "handset";
 
-	/* required for bootloader to select correct board */
 	qcom,msm-id = <251 0>, <252 0>;
-	qcom,board-id = <0xb64 0>;
 	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
 
 	/* Bullhead firmware doesn't support PSCI */
-- 
2.34.1

