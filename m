Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0662450268
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 08:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfFXGe3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 02:34:29 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:49827 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726472AbfFXGe3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 02:34:29 -0400
X-Greylist: delayed 368 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Jun 2019 02:34:27 EDT
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Jun 2019 11:57:44 +0530
X-IronPort-AV: E=McAfee;i="6000,8403,9297"; a="10448682"
Received: from dhar-linux.qualcomm.com ([10.204.66.25])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Jun 2019 11:57:20 +0530
Received: by dhar-linux.qualcomm.com (Postfix, from userid 2306995)
        id 0BF223649; Mon, 24 Jun 2019 11:57:18 +0530 (IST)
From:   Shubhashree Dhar <dhar@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Shubhashree Dhar <dhar@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org,
        jshekhar@codeaurora.org
Subject: drm/msm/dpu: Correct dpu encoder spinlock initialization
Date:   Mon, 24 Jun 2019 11:57:12 +0530
Message-Id: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dpu encoder spinlock should be initialized during dpu encoder
init instead of dpu encoder setup which is part of commit.
There are chances that vblank control uses the uninitialized
spinlock if not initialized during encoder init.

Change-Id: I5a18b95fa47397c834a266b22abf33a517b03a4e
Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5f085b5..22938c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2195,8 +2195,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 	if (ret)
 		goto fail;
 
-	spin_lock_init(&dpu_enc->enc_spinlock);
-
 	atomic_set(&dpu_enc->frame_done_timeout, 0);
 	timer_setup(&dpu_enc->frame_done_timer,
 			dpu_encoder_frame_done_timeout, 0);
@@ -2250,6 +2248,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 
 	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
 
+	spin_lock_init(&dpu_enc->enc_spinlock);
 	dpu_enc->enabled = false;
 
 	return &dpu_enc->base;
-- 
1.9.1

