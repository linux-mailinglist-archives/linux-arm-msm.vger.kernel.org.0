Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A0E347B78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236377AbhCXPA6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236380AbhCXPAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:43 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702A6C061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:43 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id f16so30642494ljm.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7/JcoSSNdqO7PElEe6AbikS7sscxIC3sZX1ald/3z+I=;
        b=JvtI2bVlxLQoDiRZK/t0NJtQyM8I0h0OM3t/MYSFbgFjhSyAEZl0NqjrNAOB3Ffdz8
         oEVTrb+hmX6LryiSjLNTogKTyeOYUMF7L0L9HYXMyzpLdRXIsbsuIa2k14Au01hD+3TQ
         hjsS9CJax55cN57L3d4FAScHCe4zRnzZfewORDXnctAqm6gQ40XO9otOMfSI6Mfmf5mO
         +A0Wow5IHyajSU5ItYgst716KgvEU+auV7zBNEcNr1+Bt9+1HesHBiP1Y9HpLjq16a2d
         ZXt8yh8N5sB1xxdq9b8vJwREDTxOUIH5OKN9J9avReYHaneT/jsX9JqSTG1PjXnQBzGs
         j1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7/JcoSSNdqO7PElEe6AbikS7sscxIC3sZX1ald/3z+I=;
        b=ZNBAdWzcc4YyhIpFbTH+LTEFGOXvQVAqPMd66CqW45znsYSSazXGnv4KVybA9Zu/4v
         wILkNf1IlHGSmwUtAUaUGXoV5Wnqudp6NF6zxPbpkcrDv+S9Qhb1MC0qOnTSFoZkDxrP
         naTNR4JiqAHQsV7TI804buS/uODbpl/DieGIVNfD5td8mSo7E/Ju5qw7zdiJTyRCiMF6
         Jg+p4iacXvXNbOIa2ZnUvAuQpMpnv4UrzLtlNyDZp3mzUiCjjlFKFqylljHYBH+bW/Tv
         3vKKycVBTPtySp5J8/jYoVqTor3ZTGzRyxwInNFG3gzMaCG5AIKxKajvVce1wiv2e/7h
         +SZA==
X-Gm-Message-State: AOAM531EnYQd+60yOnAIz8fp21CgIXuJhOB5fbA/c1tgjc7V/x+J9Ebx
        W83zsmlqPxkW72RKsMEADrJq6Q==
X-Google-Smtp-Source: ABdhPJyh950G3OeF9hXaRXY3S3niF3fuB2XcULkZzY8F9kb5gXutA3r087h0tGz3l2ZmNXEueYYyDA==
X-Received: by 2002:a2e:9a96:: with SMTP id p22mr2267680lji.167.1616598041781;
        Wed, 24 Mar 2021 08:00:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 09/21] drm/msm/dpu: drop dpu_encoder_phys's get_hw_resources() callback
Date:   Wed, 24 Mar 2021 18:00:12 +0300
Message-Id: <20210324150024.2768215-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop get_hw_resources() callback, by filling hw resource information
using data from dpu_encoder_phys itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 --------
 4 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d98b4e4097fb..f80694456fd6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -441,8 +441,7 @@ void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (phys->ops.get_hw_resources)
-			phys->ops.get_hw_resources(phys, hw_res);
+		hw_res->intfs[phys->intf_idx - INTF_0] = phys->intf_mode;
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index f8f25157f635..23493c680231 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -91,9 +91,6 @@ struct dpu_encoder_virt_ops {
  * @disable:			DRM Call. Disable mode.
  * @atomic_check:		DRM Call. Atomic check new DRM state.
  * @destroy:			DRM Call. Destroy and release resources.
- * @get_hw_resources:		Populate the structure with the hardware
- *				resources that this phys_enc is using.
- *				Expect no overlap between phys_encs.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
  *				current pending frames to hardware
@@ -129,8 +126,6 @@ struct dpu_encoder_phys_ops {
 			    struct drm_crtc_state *crtc_state,
 			    struct drm_connector_state *conn_state);
 	void (*destroy)(struct dpu_encoder_phys *encoder);
-	void (*get_hw_resources)(struct dpu_encoder_phys *encoder,
-				 struct dpu_encoder_hw_resources *hw_res);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b2be39b9144e..adbd59326b99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -541,13 +541,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
 	kfree(cmd_enc);
 }
 
-static void dpu_encoder_phys_cmd_get_hw_resources(
-		struct dpu_encoder_phys *phys_enc,
-		struct dpu_encoder_hw_resources *hw_res)
-{
-	hw_res->intfs[phys_enc->intf_idx - INTF_0] = INTF_MODE_CMD;
-}
-
 static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -747,7 +740,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->destroy = dpu_encoder_phys_cmd_destroy;
-	ops->get_hw_resources = dpu_encoder_phys_cmd_get_hw_resources;
 	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_cmd_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_cmd_prepare_for_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index e77a68c2fc73..b6a004ca3927 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -477,13 +477,6 @@ static void dpu_encoder_phys_vid_destroy(struct dpu_encoder_phys *phys_enc)
 	kfree(phys_enc);
 }
 
-static void dpu_encoder_phys_vid_get_hw_resources(
-		struct dpu_encoder_phys *phys_enc,
-		struct dpu_encoder_hw_resources *hw_res)
-{
-	hw_res->intfs[phys_enc->intf_idx - INTF_0] = INTF_MODE_VIDEO;
-}
-
 static int dpu_encoder_phys_vid_wait_for_vblank(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -663,7 +656,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->destroy = dpu_encoder_phys_vid_destroy;
-	ops->get_hw_resources = dpu_encoder_phys_vid_get_hw_resources;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
-- 
2.30.2

