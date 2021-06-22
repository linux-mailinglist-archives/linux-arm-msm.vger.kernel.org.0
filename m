Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94DB83B0D7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 21:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhFVTMv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 15:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhFVTMv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 15:12:51 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9B4C061574;
        Tue, 22 Jun 2021 12:10:34 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id a13so3107733wrf.10;
        Tue, 22 Jun 2021 12:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rX6KIvYnLjrPDo/eaefN8OjY3RSfelT8qPY3zziO7bo=;
        b=a1WX3f6TzwkauIrHoo2NMwjXcBeQe7WmRfhuIJVvrgRKzuismp1I/+qEUmC7//lqte
         90u6gKGt60Ps0iYVijXYAbVPMhxFW6GjwI4ztaaLhucXj+CtU51BxYlBm2CyfPBsilGO
         eS4ZQz2gU92GKweNDJaDDo12nr9i093XI+GnjwnCUttJvpe0ISLOdURqAm6ls52pzh2l
         A2SRYqNurjDClsNGjHDgLTvB3+TdtokLZcYz+7KG9FAQPmWGuDoldNM0hZixB595Qm0M
         WhUNWzMuiQOt4u7zMlDTwL/gy93LpMJWUOtJElYluFrIj9p8EgB0cOo4XtV71wfxYv1t
         fv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rX6KIvYnLjrPDo/eaefN8OjY3RSfelT8qPY3zziO7bo=;
        b=kg+HLJWE0SfawC5roawfTlqP4eVBO1T1rAaiNfe5Rgd6np6M0wC427dZSBDom8zxNs
         yNIOQ8NIneQxb8wrZc5PUWVXrwd9EPjJCjhIgI4i8CLwVh0n8cIGKyv6w6ZSX0f/1dLa
         yzacj5OxCORKfuMDDsrUwZ+GcchYS85LDKOiEdU1dihncDpBT4L7PEVYVFdmSPQqozOn
         jBMicOFmob+ARnb1haLjmv+iqT6YJCEzKN8Z0qNTJ3pi4wp3s/7KT/7YVlHGzr6wm0Nx
         okBlQ5x6wkNmHANlpnI9WHPJf9yH/ulr+eMReRCBSpE9/R4Xg6aK85FZj33+MzjfMbL8
         WVyQ==
X-Gm-Message-State: AOAM532X1LbuPa8Qb4KRTickxDz9jZz2ppDXN2QVdX8DXPPz9+0VvCfE
        T0fOWFBPC1krmHRkMJLgFqdgTctPsCKJHA==
X-Google-Smtp-Source: ABdhPJxjJMJF51K+qxzDXc7DqHgtetS7uVmcOQez8ncBMjmjk2b2b0Ds0L5XCR23eEfcmUvZgJ54dw==
X-Received: by 2002:a5d:6daf:: with SMTP id u15mr6720139wrs.400.1624389032596;
        Tue, 22 Jun 2021 12:10:32 -0700 (PDT)
Received: from dell5510.suse.de (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id f12sm284021wru.81.2021.06.22.12.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 12:10:32 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v4 1/1] arm64: dts: qcom: msm8994-angler: Disable cont_splash_mem
Date:   Tue, 22 Jun 2021 21:10:19 +0200
Message-Id: <20210622191019.23771-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the default definition breaks booting angler:
[    1.862561] printk: console [ttyMSM0] enabled
[    1.872260] msm_serial: driver initialized
D -     15524 - pm_driver_init, Delta

cont_splash_mem was introduced in 74d6d0a145835, but the problem
manifested after 86588296acbf ("fdt: Properly handle "no-map" field
in the memory region").

Disabling it because Angler's firmware does not report where the memory
is allocated (dmesg from downstream kernel):
[    0.000000] cma: Found cont_splash_mem@0, memory base 0x0000000000000000, size 16 MiB, limit 0x0000000000000000
[    0.000000] cma: CMA: reserved 16 MiB at 0x0000000000000000 for cont_splash_mem

Similar issue might be on Google Nexus 5X (lg-bullhead). Other MSM8992/4
are known to report correct address.

Fixes: 74d6d0a145835 ("arm64: dts: qcom: msm8994/8994-kitakami: Fix up
the memory map")

Suggested-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v3->v4:
* add a comment in dts (asked by Konrad)

Kind regards,
Petr

 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index ffe1a9bd8f70..c096b7758aa0 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -1,12 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
 
 #include "msm8994.dtsi"
 
+/* Angler's firmware does not report where the memory is allocated */
+/delete-node/ &cont_splash_mem;
+
 / {
 	model = "Huawei Nexus 6P";
 	compatible = "huawei,angler", "qcom,msm8994";
-- 
2.32.0

