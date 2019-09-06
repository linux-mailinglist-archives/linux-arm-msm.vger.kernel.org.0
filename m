Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70576AC068
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 21:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732468AbfIFTXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 15:23:53 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:47064 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731109AbfIFTXx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 15:23:53 -0400
Received: by mail-io1-f67.google.com with SMTP id x4so15179441iog.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 12:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AE6/toJbSfVkr1wiQ76oTdfqTgHlpEwnqu8Dl52qybo=;
        b=Yr22SN8b0+6K0mLDWoC2RcAMt2BSA+g2SJIZhWjnemfnUIXzIb9OfP5pwLy2SunBV0
         1mA0dkaunKNZD6NnQTCgqpZ+kfi0Kz3khBQI59IZsUPZ2n+ATm6MmAz9fG81bQHXpHwA
         DxRwDMxvuIrw2OwIStmmkKuWrbKeB04MPeufs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AE6/toJbSfVkr1wiQ76oTdfqTgHlpEwnqu8Dl52qybo=;
        b=jfhN7sTsZybxyIGL8f4X3ocdkcFgx2uMyLS0EPL+kbKayEX3reR006QwxR/yoZwSK4
         HHD9D3wmq7aTbN2n7GH03IZyuBmHi6UPCT+bczVx9MpxzgR13P4LPi6ZOTEtd+58I39E
         fyY9kVZftQafrIQ2MlQOebej5+dzIH1O3u62qJ9IgSolQ19IcPZb24XAhVl4EHv8xTSj
         ri+3bjdEgF5UxaxSClaMkpeWdMi2r6Y/tN4gnV/DQJLyZwSBOvnINMmDgRh82xSkKTua
         xvuDGEvJiUChaYS3O/cMNUAX5JqrYojES9IzBE+Vu0zKRyRt2RBgkPsrxPzhAYsznZKb
         W9Rw==
X-Gm-Message-State: APjAAAVS/LHe41X0n7ed/p872hYv4/yAo8L+Pj/PRSeLWOa1zfZc+vx6
        7m03/lBltIy4u/QUcFnKMfe5bQ==
X-Google-Smtp-Source: APXvYqxNdgUM84LcEYFHrtVVCkCw4B+04vJZJSOxcLjqGkPJJF2PCpuIaKSujUu3oHwmwt5ZIOC3fQ==
X-Received: by 2002:a5e:9509:: with SMTP id r9mr3806096ioj.100.1567797832607;
        Fri, 06 Sep 2019 12:23:52 -0700 (PDT)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id h70sm10931804iof.48.2019.09.06.12.23.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 12:23:52 -0700 (PDT)
From:   Drew Davenport <ddavenport@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Drew Davenport <ddavenport@chromium.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        Bruce Wang <bzwang@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Fritz Koenig <frkoenig@google.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/6] drm/msm/dpu: Remove unused variables
Date:   Fri,  6 Sep 2019 13:23:39 -0600
Message-Id: <20190906192344.223694-1-ddavenport@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 -------
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index ce59adff06aa..2ece11262943 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1288,13 +1288,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 {
 	struct drm_crtc *crtc = NULL;
 	struct dpu_crtc *dpu_crtc = NULL;
-	struct msm_drm_private *priv = NULL;
-	struct dpu_kms *kms = NULL;
 	int i;
 
-	priv = dev->dev_private;
-	kms = to_dpu_kms(priv->kms);
-
 	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
 	if (!dpu_crtc)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d82ea994063f..4d2cacd0ce3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1914,8 +1914,6 @@ static int _dpu_encoder_debugfs_status_open(struct inode *inode,
 static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	struct msm_drm_private *priv;
-	struct dpu_kms *dpu_kms;
 	int i;
 
 	static const struct file_operations debugfs_status_fops = {
@@ -1932,9 +1930,6 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 		return -EINVAL;
 	}
 
-	priv = drm_enc->dev->dev_private;
-	dpu_kms = to_dpu_kms(priv->kms);
-
 	snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
 
 	/* create overall sub-directory for the encoder */
@@ -2133,14 +2128,12 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 	struct dpu_encoder_virt *dpu_enc = from_timer(dpu_enc, t,
 			frame_done_timer);
 	struct drm_encoder *drm_enc = &dpu_enc->base;
-	struct msm_drm_private *priv;
 	u32 event;
 
 	if (!drm_enc->dev || !drm_enc->dev->dev_private) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
-	priv = drm_enc->dev->dev_private;
 
 	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc_frame_event_cb) {
 		DRM_DEBUG_KMS("id:%u invalid timeout frame_busy_mask=%lu\n",
-- 
2.20.1

