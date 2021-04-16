Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABAE03629C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 22:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbhDPU6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 16:58:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:56947 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243509AbhDPU6b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 16:58:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618606686; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=GdqceOKrBIoEKipe2tzeetfrMK1ksjTf62RkhJlhZvg=; b=Bz7AwarrHkVzRgXd2nqoE48HnKgk6U3PJ0e2BXA1ZpikSmGFn4NsSqolcVpjAGUiuGK2JtKt
 WJ5aEyYpLnbOp5Nl/CB7WIyFM/bjE+9VDjR1qGUf4fHsNCVgn+LC26MadLhMoPA0/BeC/Lso
 gDO1pXDoSqLxCDwy58dp+atUpHU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6079fa48febcffa80fd7ab52 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 20:57:44
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1814C43464; Fri, 16 Apr 2021 20:57:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D505C433C6;
        Fri, 16 Apr 2021 20:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7D505C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org
Subject: [PATCH v5 6/7] drm/msm: add support to take dsi, dp and dpu snapshot
Date:   Fri, 16 Apr 2021 13:57:24 -0700
Message-Id: <1618606645-19695-7-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
References: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to take the register snapshot of dsi, dp and dpu
modules.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      |  1 +
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index 11dfa57..7e075e7 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -27,6 +27,7 @@
 #include <linux/devcoredump.h>
 #include <stdarg.h>
 #include "msm_kms.h"
+#include "dsi.h"
 
 #define MSM_DISP_SNAPSHOT_MAX_BLKS		10
 
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 024ca49..44dc682 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -130,9 +130,25 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 {
 	struct msm_drm_private *priv;
 	struct drm_device *drm_dev;
+	struct msm_kms *kms;
+	int i;
 
 	drm_dev = disp_state->drm_dev;
 	priv = drm_dev->dev_private;
+	kms = priv->kms;
+
+	if (priv->dp)
+		msm_dp_snapshot(priv->dp);
+
+	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
+		if (!priv->dsi[i])
+			continue;
+
+		msm_dsi_snapshot(priv->dsi[i]);
+	}
+
+	if (kms->funcs->snapshot)
+		kms->funcs->snapshot(kms);
 
 	msm_disp_capture_atomic_state(disp_state);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

