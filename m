Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00FF04A52D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 00:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235916AbiAaXCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 18:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235910AbiAaXCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 18:02:23 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11881C06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 15:02:23 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id j23so30018804edp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 15:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Hu0/lD4MaWGlyfsPwM8nWV8Swc/99ghoLAOkSHX3Is=;
        b=FqKEWwXy8hYEntQSTecgzHrr1w6+AC2gPYBwozC8IiKz2TKjbQIObXGFVgF0s3hFkl
         EulF1zXXJ+rUda6qk11lrTJw4SwKTwOrgxellU65dKsxH9UO+HCP5X2oiwiK4pCcWIKA
         UnaT1ZRiNctyk/Q47ZUL6A156WP/V4MJdHgyoCH83WlZEgObeC3oTDaEke7BQdbFRzny
         jtL417iK8xYKH/1YisR1JJM9qup9iHiM5t8BvzM4esSzUsUOkaEnbjXcRAra9L0JeLTo
         wqYzHxB79GllbKiwHsjgtvjEbVv32hRQwSPrQ3aJEhicS1QLTpd7Q9ZU1Ut6WlUxlq1v
         SenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Hu0/lD4MaWGlyfsPwM8nWV8Swc/99ghoLAOkSHX3Is=;
        b=MfjASnn5u0KISCh8pc5jvvXSAXTcgTvpW6Se+ywMVfrnrsRNTrKnZUTu+oNUPP7HdQ
         Ig5rqdVk0toY5SiL992suUFSSAP8es4T0znG8L1MspE27aO81Csd4DffBptkfpSQorAC
         o+80cU1HUCKpb12A7k3Ow9wN+uHFtsIc4YMFK2rP8bU0GAO3vma/YmRiPlED2Syy32co
         P2cnKg3Af+y1tGDSfrr9uw6xywd4juwrFNc4MD6hwfIT+6d+tFQsn6NUSM4XxMM7/jIY
         GzqocMNT64n1Y8xzR/3PixKpl5qzgf4kgZOByvAP5FhiXsnjiBZz5gTkr6hm9jqTfDdO
         e+CA==
X-Gm-Message-State: AOAM5334+QIUlxC9ouRUcfoZgMi5HqsYzhpm1DmdQRtpVfra4O2JyQu2
        Cph51Wa4V1W5+5wKDpNbDMLXThFXQYumVe8i
X-Google-Smtp-Source: ABdhPJwfkrPFVat6+dr+MiH3LWXKKNwZvrTBbSOLVNWuCLVqn3ifpHFvToN/uLroOXQSGqxdAGXt5g==
X-Received: by 2002:aa7:d657:: with SMTP id v23mr1195059edr.443.1643670141668;
        Mon, 31 Jan 2022 15:02:21 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id c2sm18450500edj.24.2022.01.31.15.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 15:02:21 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 3/3] arm64: dts: qcom: msm8994-huawei-angler: Add sdhc{1,2} definitions
Date:   Tue,  1 Feb 2022 00:02:14 +0100
Message-Id: <20220131230214.123610-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Although downstream supports HS400, there are overclocking warnings when
using mmc-hs400-1_8v:

mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
mmc0: new HS400 MMC card at address 0001

Using HS200 (i.e. mmc-hs200-1_8v or mmc-ddr-1_8v) would reduce them:

mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
mmc0: new HS200 MMC card at address 0001

But as the problem is probably elsewhere (bullhead behaves the same),
keep mmc-hs400-1_8v.

Angler does not have SD card, thus sdhc2 kept disabled.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2->v3:
* update sdhc1 overclocking comment.

Kind regards,
Petr

 .../boot/dts/qcom/msm8994-huawei-angler-rev-101.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index 0e3dd48f0dbf..64f9dbee06a1 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
+ * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
 
 #include "msm8994.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 /* Angler's firmware does not report where the memory is allocated */
 /delete-node/ &cont_splash_mem;
@@ -41,3 +42,13 @@ serial@f991e000 {
 &tlmm {
 	gpio-reserved-ranges = <85 4>;
 };
+
+/*
+ * There are overclocking warnings (more for HS400 than for HS200), but
+ * downstream also supports also HS400 thus keep it (problem elsewhere?).
+ */
+&sdhc1 {
+	status = "okay";
+
+	mmc-hs400-1_8v;
+};
-- 
2.34.1

