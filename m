Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0EB29FA33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 02:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgJ3BCj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 21:02:39 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:28774 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ3BCi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 21:02:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604019696; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=J1HPpQZ9qKoiP3yWBEUXeGMKJONcI5AQ29AQ64ceNhI=; b=O8RAxVX+rGe/U13ZqAot4/NpC7M8d/ginbsVlESEQIvjhnc9Sy6ASrf1bswUCA5I6uZZir9p
 lQikzi1oiMg54/Rbi2wyXogp0TQOFN3WWG0xcGz4TOdKmWezM8/GOfzRZyQM8HBJa7XM3x2M
 VS/ntBRfNI16mkoMGycj1hbKtfg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f9b65f08335df16577668a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 01:01:36
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76FFDC433C9; Fri, 30 Oct 2020 01:01:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A1D0C43385;
        Fri, 30 Oct 2020 01:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A1D0C43385
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, khsieh@codeaurora.org, daniel@ffwll.ch
Subject: [PATCH v2 4/4] drm/msm/dpu: add dpu_dbg points across dpu driver
Date:   Thu, 29 Oct 2020 18:01:01 -0700
Message-Id: <20201030010101.4345-5-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201030010101.4345-1-abhinavk@codeaurora.org>
References: <20201030010101.4345-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dpu_dbg points across dpu driver to trigger dumps when critical
errors are hit.

changes in v2: none

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 12 ++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  5 ++++-
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f7f5c258b553..a2ee1af73c9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2014-2018, 2020 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -26,6 +26,7 @@
 #include "dpu_crtc.h"
 #include "dpu_trace.h"
 #include "dpu_core_irq.h"
+#include "dpu_dbg.h"
 
 #define DPU_DEBUG_ENC(e, fmt, ...) DPU_DEBUG("enc%d " fmt,\
 		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
@@ -1313,6 +1314,11 @@ static void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
 
 	DPU_ATRACE_BEGIN("encoder_underrun_callback");
 	atomic_inc(&phy_enc->underrun_cnt);
+
+	/* trigger dump only on the first underrun */
+	if (atomic_read(&phy_enc->underrun_cnt) == 1)
+		DPU_DBG_DUMP("all");
+
 	trace_dpu_enc_underrun_cb(DRMID(drm_enc),
 				  atomic_read(&phy_enc->underrun_cnt));
 	DPU_ATRACE_END("encoder_underrun_callback");
@@ -1553,8 +1559,10 @@ static void dpu_encoder_helper_hw_reset(struct dpu_encoder_phys *phys_enc)
 		      ctl->idx);
 
 	rc = ctl->ops.reset(ctl);
-	if (rc)
+	if (rc) {
 		DPU_ERROR_ENC(dpu_enc, "ctl %d reset failure\n",  ctl->idx);
+		DPU_DBG_DUMP("all");
+	}
 
 	phys_enc->enable_state = DPU_ENC_ENABLED;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 8493d68ad841..58f79557b560 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -9,6 +9,7 @@
 #include "dpu_core_irq.h"
 #include "dpu_formats.h"
 #include "dpu_trace.h"
+#include "dpu_dbg.h"
 
 #define DPU_DEBUG_CMDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
 		(e) && (e)->base.parent ? \
@@ -213,7 +214,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 			  phys_enc->hw_ctl->idx - CTL_0,
 			  cmd_enc->pp_timeout_report_cnt,
 			  atomic_read(&phys_enc->pending_kickoff_cnt));
-
+		DPU_DBG_DUMP("all");
 		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_RDPTR);
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 805e059b50b7..46c5320150fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -8,6 +8,7 @@
 #include "dpu_core_irq.h"
 #include "dpu_formats.h"
 #include "dpu_trace.h"
+#include "dpu_dbg.h"
 
 #define DPU_DEBUG_VIDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
 		(e) && (e)->parent ? \
@@ -467,6 +468,7 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 		"update pending flush ctl %d flush_mask 0%x intf_mask 0x%x\n",
 		ctl->idx - CTL_0, flush_mask, intf_flush_mask);
 
+	atomic_set(&phys_enc->underrun_cnt, 0);
 
 	/* ctl_flush & timing engine enable will be triggered by framework */
 	if (phys_enc->enable_state == DPU_ENC_DISABLED)
@@ -549,6 +551,7 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 	if (rc) {
 		DPU_ERROR_VIDENC(phys_enc, "ctl %d reset failure: %d\n",
 				ctl->idx, rc);
+		DPU_DBG_DUMP("all");
 		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_VSYNC);
 	}
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

