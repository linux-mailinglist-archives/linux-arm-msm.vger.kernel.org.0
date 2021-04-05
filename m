Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB8135474D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 22:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbhDEUDR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 16:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbhDEUDR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 16:03:17 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA17C061756;
        Mon,  5 Apr 2021 13:03:10 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id w3so18406702ejc.4;
        Mon, 05 Apr 2021 13:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l2r5xpqBxPdoX4BFUkxb3XsKvWxRSxdMaDCbCTJRu1w=;
        b=lTWnuxE61Y/JJoVGNQZFpyWzJJO3IaronmJ37ay78cq7PjoeeBWkr0yrmwwN2M/kO2
         FL+hNmCbXG15B/q+TE59yEhe4K+F9ZS8oetROE9gE7BfU2xAaMKL8FGw2xdmuL48xcDO
         Ox+kj5CXMioBCU1hGKYkjhuPeU5yziGdscVFD21Ad5YHMXJFve9qXVyWfkVTOv7HenW8
         hISGAGRQVcRTuEsGHieJXRZr80OdFoOQMK4jCJN3855Qia8VlvoA+HNAQO8uYUDBkMsb
         pJ2T5kVlqAvAO/GB0ojpnBVwuns+kY8jU8Y/h5A/DsPYMc3KfufJSLI9GMM8V0A4cll3
         eRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l2r5xpqBxPdoX4BFUkxb3XsKvWxRSxdMaDCbCTJRu1w=;
        b=WK3G5Dc6/91EcsJiKSRtTi2bDhm7AMcI5boJygXeX5pKgu+2tkuSTIb6vWW65lQIWQ
         uJxkp9t10pjv0H2id4lBUAwAv3QT0b6enwEdIBnesn27oVto8Jt7ucz3iBcZWbBGNg4e
         xYEqfsTwoSJJN65hfR47qirdwyTVlcsFDNuREiPQtgXtM/8D7eV5Sc2PF24T2sE+daIu
         SawTJ+flBtTxNCwvdoPuz70bFIb4PmTBwp6gDm6uYRvd6lJA7vw249RxwFwxnRsV5gzG
         d+LUT7hZCAUe9rGty1lsVZ9Dkd0sqSwY9PUBMoE6MelPLQbwNw4g+5PSJgmZBD6ULwy7
         Vgvw==
X-Gm-Message-State: AOAM530rwMXvqcr46OsldRxlb2GB5/QTVfxpZEczqSMuDWmKifYr27vs
        V4r0SyiYs1a1UMx3MaBArKdB45GkRMTgOA==
X-Google-Smtp-Source: ABdhPJy41b0aFigVZSDGNT13cSHtum2FZcK0hKD5I1gZsD6MshQ5EyQo7/fBlNQ4BHDjaE9GiGCkZg==
X-Received: by 2002:a17:907:105c:: with SMTP id oy28mr11849496ejb.552.1617652989026;
        Mon, 05 Apr 2021 13:03:09 -0700 (PDT)
Received: from localhost.localdomain ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id bo19sm5203932edb.17.2021.04.05.13.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 13:03:07 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
Date:   Mon,  5 Apr 2021 22:02:59 +0200
Message-Id: <20210405200259.23525-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reserve pins 0-3 and 85-88 as these aren't meant to be accessible
from the application CPUs. Fix similar to 9134586715e3.

Fixes: 3edfb7bd76bd ("gpiolib: Show correct direction from the beginning")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

tested on latest qcom/for-next.

Simple testing with /sys/class/gpio/export showed that 85-88.
3 disables UART. I expect 0-2 are also reserved as on other msm8998.

for i in $(seq 0 146); do echo $i > /sys/class/gpio/export; done

I expect it's just angler specific, thus I haven't added it to msm8994.dtsi
(otherwise Konrad would have fixed it).

Kind regards,
Petr

 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index baa55643b40f..0dc94101d5de 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
@@ -32,3 +33,7 @@ serial@f991e000 {
 		};
 	};
 };
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <85 4>;
+};
-- 
2.30.2

