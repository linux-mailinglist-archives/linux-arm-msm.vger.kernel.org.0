Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7A6A2179
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 18:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbfH2Qxl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 12:53:41 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46666 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727248AbfH2Qxl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 12:53:41 -0400
Received: by mail-pf1-f196.google.com with SMTP id q139so2433706pfc.13;
        Thu, 29 Aug 2019 09:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ROI1h6BX8pjgc4LOx6piYuvxJZlEcDiZCUSCssETQu4=;
        b=umYgseE/IeMY4l4arKqAwbmSODhJ/VeVn3EFJswXmJNpSbkJchJgfXvHIH83VVwJwQ
         yCYvK9ytBhP3BHxuqQXyy64qEhljg2MbEZqVhv7m3uTWL0rIYAbCQU7cB3vajV6YMyIz
         f0wsG2c3x1lA+FuGW7YqfjYH48X5zEum+NEeUWe+n2JssQoyWaiLWOx/CpnYNr4IsApP
         UJwvlIpYGojqAitsRIASDdMQQLpsodbzAn8qLnH0+MKRNFOtpH3dq0xz6GHXv5xR/d04
         AejDSYGqxUmobdlfF2OSWPGeCZbcsH6oHZam0QtDtHfL/sph99u5kUEFnv0/3vALqX7Q
         9RtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ROI1h6BX8pjgc4LOx6piYuvxJZlEcDiZCUSCssETQu4=;
        b=oSsMEGAJ7E+BRe9B3P2mGb+nNlF1fetPeIyKoyNiYjEQ+ax0xkYab9KclpbZPiD5/M
         18Qx1NuDD4FYAj/mmJOVGEatn/mbjdig7nxucq/Q3HM1ClawoUh2wf90F4l+6/VWnSGU
         ER0tr+MfvsO/VI0WxJwaJ4dR+nTKJDYVkjYzORGeRYiCfIhprInxpov+Db4qkkPrN0+m
         RhPSzeO/ZkPdCehoRJQXxCzjc8E4Q3RxHTYXA6sObL1H7Y6JY8hmiRGd9rCLAjjfnp7a
         kMBeHimMEVfKKBXKdwFs60rj8NPf9KZ7CcEHgYb8ozlXgVD8NQu+z+uPxW/TGkDfAkCA
         w1UA==
X-Gm-Message-State: APjAAAXow/m5Gr3jkso0Ez1zbAHGgwfjAcj+pumqKDkl1nZylJLoB8hO
        cpOWEvaKJKxz2ijFEZ8cjto=
X-Google-Smtp-Source: APXvYqzs2mYLo/bTNzZZh5PG+LuBi+qAUwwV5VKV77PeHu8CnzLx7ZZPeu0/rN7i/RfGRdaixrXBhw==
X-Received: by 2002:a65:64c6:: with SMTP id t6mr9421160pgv.323.1567097620246;
        Thu, 29 Aug 2019 09:53:40 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id w2sm3023576pjr.27.2019.08.29.09.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 09:53:39 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bruce Wang <bzwang@chromium.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 02/10] drm/msm/dpu: add real wait_for_commit_done()
Date:   Thu, 29 Aug 2019 09:45:10 -0700
Message-Id: <20190829164601.11615-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829164601.11615-1-robdclark@gmail.com>
References: <20190829164601.11615-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Just waiting for next vblank isn't ideal.. we should really be looking
at the hw FLUSH register value to know if there is still an in-progress
flush without stalling unnecessarily when there is no pending flush.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 737fe963a490..7c73b09894f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -526,6 +526,26 @@ static int dpu_encoder_phys_vid_wait_for_vblank(
 	return _dpu_encoder_phys_vid_wait_for_vblank(phys_enc, true);
 }
 
+static int dpu_encoder_phys_vid_wait_for_commit_done(
+		struct dpu_encoder_phys *phys_enc)
+{
+	struct dpu_hw_ctl *hw_ctl = phys_enc->hw_ctl;
+	int ret;
+
+	if (!hw_ctl)
+		return 0;
+
+	ret = wait_event_timeout(phys_enc->pending_kickoff_wq,
+		(hw_ctl->ops.get_flush_register(hw_ctl) == 0),
+		msecs_to_jiffies(50));
+	if (ret <= 0) {
+		DPU_ERROR("vblank timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static void dpu_encoder_phys_vid_prepare_for_kickoff(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -676,7 +696,7 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->destroy = dpu_encoder_phys_vid_destroy;
 	ops->get_hw_resources = dpu_encoder_phys_vid_get_hw_resources;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
-	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_vblank;
+	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
 	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_vblank;
 	ops->irq_control = dpu_encoder_phys_vid_irq_control;
-- 
2.21.0

