Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6398E52EC76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 14:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245575AbiETMpJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 08:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240986AbiETMpG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 08:45:06 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F0B16669F
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 05:45:03 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id n10so15410876ejk.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B/mZ7MFm1dOVaCLYGQEi4EQ8ExNWz/5KR67NVfFoY0g=;
        b=SakBP01uPEnc5oblt4gIOYRw2LvQ4rSm3K4ceAYFJOEMPxodtzQp915jFKpjndAJA6
         mG+6e0qdIr1aNaoIk+pU7Ayx64SBcXezEmGJXSJO3fRaBeZtj6Q7lowwNLFR0fgfc2mm
         gR3ykuZGi9rj/J656663d0E0/vs+Mg0X5x2KKgr+QcGR/vw7KWlBad1RNL9Ibez6MzWz
         4HrQ6TM/V0O3QG9UV9ug6V7UwEj/s86YRrl3PwLqhSQXVG37yH+Ue63jbRkTj0BDUDAM
         CZObf2oAmCZcLcTUJK4EsfXM62l6Z0/m+aQ5vaVgfXJDE2mIQEKuF3VXEOuUQexntWJt
         ipdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B/mZ7MFm1dOVaCLYGQEi4EQ8ExNWz/5KR67NVfFoY0g=;
        b=5mHWcWiNfbCvhhKtsXhCBFP9PijF2+1leTRHqBCajad/Se7Z7f9VD1HuWDpwbnNQRs
         UnG3guia1N4haFZbW8Q53O0P9wyz7qcrvGp5SSThjcFuliT11U+CBJLTKVHvLoJZkFg5
         Xt66czQUuQdq7BW8vmZteOzpV5kV2sqXkyqZS84rAeHIW0ocYUAO9pzl9fsl8AuctXme
         xO0MNYFGniadjVQPgxaluMTQ7PMUuGcDmb1Z241DlbMP1NNHoR3jpHjLtT99jQhpQKvE
         AXa34J/u5JazuRNbPP/mbvwhzQEniDkBLFGATRn5hbYcjG9ARbOoVFoOVMKSa3KyV68c
         jZVA==
X-Gm-Message-State: AOAM533yPphiphnu9a6QNFE6jDi/+kK6PSR0dczlXEI6kZQQGr0BkZZR
        LRSBna7hdRI3NH2XltqFLF/q0Q==
X-Google-Smtp-Source: ABdhPJyR1/rLHZpVTdcjEHT7B/WAnFCVRCR0K6KbpXZORfk4Tg5GqrVerAf7bsJ2t4JecApZUmCrcg==
X-Received: by 2002:a17:906:90c9:b0:6fe:9e40:5cc with SMTP id v9-20020a17090690c900b006fe9e4005ccmr6042055ejw.367.1653050702344;
        Fri, 20 May 2022 05:45:02 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id g19-20020aa7c853000000b0042ac0e79bb6sm4257495edt.45.2022.05.20.05.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 05:45:01 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1] dt-bindings: clock: qcom: Relicense to GPL2 + BSD
Date:   Fri, 20 May 2022 14:44:47 +0200
Message-Id: <20220520124447.31289-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm has given permission for all the dt-bindings to be dual
licensed. All of the Linaro authored bindings are easy to change, in
terms of the permissions & copyrights, so they've been bundled in this
commit.

Additionally clean up the syntax of some of the copyright statements.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

There are more Qcom bindings that should have the license updated
to GPL2+BSD, but since they haven't been authored or copyrighted
by Linaro, I think I'll have to hunt down the authors individually.

 include/dt-bindings/clock/qcom,dispcc-sm8250.h        | 2 +-
 include/dt-bindings/clock/qcom,gcc-msm8916.h          | 2 +-
 include/dt-bindings/clock/qcom,gcc-msm8939.h          | 2 +-
 include/dt-bindings/clock/qcom,gcc-msm8996.h          | 2 +-
 include/dt-bindings/clock/qcom,gcc-msm8998.h          | 2 +-
 include/dt-bindings/clock/qcom,gcc-qcs404.h           | 2 +-
 include/dt-bindings/clock/qcom,gcc-sm8150.h           | 2 +-
 include/dt-bindings/clock/qcom,rpmcc.h                | 2 +-
 include/dt-bindings/clock/qcom,rpmh.h                 | 6 ++++--
 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h   | 2 +-
 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h | 2 +-
 include/dt-bindings/clock/qcom,turingcc-qcs404.h      | 2 +-
 12 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8250.h b/include/dt-bindings/clock/qcom,dispcc-sm8250.h
index ce001cbbc27fb..c139b7f7be203 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sm8250.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8250.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
  */
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8916.h b/include/dt-bindings/clock/qcom,gcc-msm8916.h
index 5630344061841..52db6cd222c96 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8916.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8916.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Copyright 2015 Linaro Limited
  */
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8939.h b/include/dt-bindings/clock/qcom,gcc-msm8939.h
index 0634467c4ce5a..338b93ba75182 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8939.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8939.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Copyright 2020 Linaro Limited
  */
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8996.h b/include/dt-bindings/clock/qcom,gcc-msm8996.h
index 03bf49d43d24c..fb1523c3b44ee 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8996.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
index 1badb4f9c58fd..6566881f7056e 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  */
diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
index bc30515433470..c8d4c7f993418 100644
--- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
+++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  */
diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-bindings/clock/qcom,gcc-sm8150.h
index dfefd5e8bf6e9..614ab995de4c0 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8150.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Copyright (c) 2019, The Linux Foundation. All rights reserved.
  */
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index 015db95303d19..c0c21762b2340 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Copyright 2015 Linaro Limited
  */
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d1246..2d882cb44e8bf 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -1,5 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2018, 2020, The Linux Foundation. All rights reserved. */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018, 2020, The Linux Foundation. All rights reserved.
+ */
 
 
 #ifndef _DT_BINDINGS_CLK_MSM_RPMH_H
diff --git a/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h b/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
index f5a1cfac86129..35e952aa00fcd 100644
--- a/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
+++ b/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 
 #ifndef _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H
 #define _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H
diff --git a/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h b/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
index a1aa6cb5d8400..9d4eca95a8984 100644
--- a/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
+++ b/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 
 #ifndef _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H
 #define _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H
diff --git a/include/dt-bindings/clock/qcom,turingcc-qcs404.h b/include/dt-bindings/clock/qcom,turingcc-qcs404.h
index 838faef57c670..cea4894089729 100644
--- a/include/dt-bindings/clock/qcom,turingcc-qcs404.h
+++ b/include/dt-bindings/clock/qcom,turingcc-qcs404.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Copyright (c) 2019, Linaro Ltd
  */
-- 
2.34.1

