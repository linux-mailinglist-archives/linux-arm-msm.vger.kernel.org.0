Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D71353AACC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 18:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356038AbiFAQN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 12:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356036AbiFAQN5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 12:13:57 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BC341FA9
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 09:13:55 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id q1so2540696ljb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 09:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6P1Wa5YPp1teAJ/dKP3hCEeV4uIIm3lb36DEK4T0BVQ=;
        b=B2u2d9b/POleGIq7EY1e7Cztt/IGL0517QLi0Y8zPDaqn7SQrCv2J35XRkiDn0vrW0
         pF0YEnbY9LnhKVBekRfABxhFtBoRC3nk71SbEm3By3ANbRcqmhi9PkZEjbycU688fjQy
         7PRM1CYiviIINxf06Gxr5bFXRW40MDUvyzNxOCqAZXElPs4xDdo/9cXZEJl0oFUZ9ZfQ
         BYiiqoZn86K2OlyFaVz8XNkOyy8lfBRB7NJP4XBnOHCS9VAL4K9/wYzMoFV89VWvJV8/
         mSxlUE5bT2+pl4KY3uSdVBa3QjDHzo8/WxJ+22Z2H9btwbXW1FPWGk6sezVfVr/wMBxU
         0WgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6P1Wa5YPp1teAJ/dKP3hCEeV4uIIm3lb36DEK4T0BVQ=;
        b=ZH9hTiFTrtKgdGjMr8CUSHffi0MYW81lpWjMY1avgpML6q1WyFpq8E9LoW6T1OejXJ
         OG8I61bNJwBrDgD4G2SJe1tfD2BN69Yk3OQYUQXdOEuAr8hQJ9InJnp76ADSHfoQbQOe
         hGFvbiYYVCCOb+0a2W9DSv5WrYikEwTqnuRkugn0H8hzZilnh9mquhDwMPRtYMKYbbZV
         gX3lQ0/1BHZ/5OKtkeAoKY2aM/WV8Qn2DNO4qMCh1oPMYJL/6XgHM5tt5RB9AR3Be9yY
         AozPZwH3Xv5HUOppxSoIF//65mJm3orfPs5jEQ8wrVs0CfhARHAwG7OlsiyqIeMlYu7V
         RNWw==
X-Gm-Message-State: AOAM5311k+27NfZah16pYchN6R5EqIarUohOs1dcERDb7+V/IoyVT8S/
        Jl89M4N25dPkD79kcmOYe+6wIg==
X-Google-Smtp-Source: ABdhPJxDa35XMGNMS3vF5ibxcKNSKxwWSoDJChNGJvBMYN16FV2QIlUwoONqvz/apvkkKnj0fltjrA==
X-Received: by 2002:a05:651c:1690:b0:255:6cb6:662b with SMTP id bd16-20020a05651c169000b002556cb6662bmr2042335ljb.471.1654100033793;
        Wed, 01 Jun 2022 09:13:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k2-20020a05651239c200b00479066d45bcsm339545lfu.214.2022.06.01.09.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 09:13:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v1 4/4] drm/msm/dpu: move struct dpu_hw_blk definition to dpu_hw_utils.h
Date:   Wed,  1 Jun 2022 19:13:49 +0300
Message-Id: <20220601161349.1517667-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
References: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is little point in having a separate header just for a single
opaque struct definition. Drop it now and move the struct to the
dpu_hw_util.h header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |  1 -
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h    | 25 -------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  7 ++++++
 12 files changed, 7 insertions(+), 36 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b8785c394fcc..da64b0f639a9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -12,7 +12,6 @@
 #include <drm/drm_crtc.h>
 #include "dpu_kms.h"
 #include "dpu_core_perf.h"
-#include "dpu_hw_blk.h"
 
 #define DPU_CRTC_NAME_SIZE	12
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 53bb4639c8e9..1db6b75cd1f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -12,7 +12,6 @@
 #include "dpu_hw_top.h"
 #include "dpu_hw_wb.h"
 #include "dpu_hw_lm.h"
-#include "dpu_hw_blk.h"
 #include "dpu_hw_merge3d.h"
 #include "dpu_hw_interrupts.h"
 #include "dpu_core_irq.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
deleted file mode 100644
index 52e92f37eda4..000000000000
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DPU_HW_BLK_H
-#define _DPU_HW_BLK_H
-
-#include <linux/types.h>
-#include <linux/list.h>
-
-struct dpu_hw_blk;
-
-
-/**
- * struct dpu_hw_blk - definition of hardware block object
- * @list: list of hardware blocks
- * @type: hardware block type
- * @id: instance id
- * @refcount: reference/usage count
- */
-struct dpu_hw_blk {
-	/* opaque */
-};
-
-#endif /*_DPU_HW_BLK_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 5755307089b5..7d9ad6a3f9f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -10,7 +10,6 @@
 #include "dpu_hw_util.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_sspp.h"
-#include "dpu_hw_blk.h"
 
 /**
  * dpu_ctl_mode_sel: Interface mode selection
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
index 7fa189cfcb06..05ecfdfac93b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -5,8 +5,6 @@
 #ifndef _DPU_HW_DSPP_H
 #define _DPU_HW_DSPP_H
 
-#include "dpu_hw_blk.h"
-
 struct dpu_hw_dspp;
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 7b2d96ac61e8..c262430e4dbd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -8,7 +8,6 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 
 struct dpu_hw_intf;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index d8052fb2d5da..652ddfdedec3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -8,7 +8,6 @@
 
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 
 struct dpu_hw_mixer;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
index 870bdb14613e..81fd1d5f718e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
@@ -8,7 +8,6 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 
 struct dpu_hw_merge_3d;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 12758468d9ca..c00223441d99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -8,7 +8,6 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 
 #define DITHER_MATRIX_SZ 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 7f7338fcddeb..78b1bc9e004f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -8,7 +8,6 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 #include "dpu_formats.h"
 
 struct dpu_hw_pipe;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 3aa10c89ca1b..a1a9e44bed36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -8,7 +8,6 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 
 struct dpu_hw_mdp;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index d5338701fc2b..49d89d706200 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -25,6 +25,13 @@ struct dpu_hw_blk_reg_map {
 	u32 log_mask;
 };
 
+/**
+ * struct dpu_hw_blk - opaque hardware block object
+ */
+struct dpu_hw_blk {
+	/* opaque */
+};
+
 /**
  * struct dpu_hw_scaler3_de_cfg : QSEEDv3 detail enhancer configuration
  * @enable:         detail enhancer enable/disable
-- 
2.35.1

