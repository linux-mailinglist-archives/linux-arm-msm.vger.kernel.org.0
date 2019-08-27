Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6461A9F54A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 23:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730847AbfH0VlT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 17:41:19 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37437 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731122AbfH0VlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 17:41:18 -0400
Received: by mail-pl1-f193.google.com with SMTP id bj8so181745plb.4;
        Tue, 27 Aug 2019 14:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7+fSbMopRLMnridzw1P8dzUFCbFj/uVg1P8Nkx1MHXg=;
        b=Rcg7Rp6khY3tW2TmrSCr+uyiTa9Utqx+bbYWjGBT+biGN2/KR58GcsJewtRl+Ksm1c
         rPLdOQgtnUoFpEDQe2JU9NaZ8w0T0Xn0tpijmSPKor1eboA287tdio+SAA9uLqCoZWD/
         A7/sgqHFoDnxA2zVzwbVHEerzCXNOb974a0nWEi9nY+TxqxeJBlB5g7DQDe8yu9rl5iy
         1+IJmJnQakpvgl+IImkfCTSfi1vaL2HqoESEczvJ2rOsORMtO73nGi+TJ9zYn2qKHNOU
         7iQ0qNm9e5rnXRMTx/RP9nGT0yGSiaUKUkTWQkmQ+ydUhSGBckwUis8xVb5OxE2FRk19
         /IYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7+fSbMopRLMnridzw1P8dzUFCbFj/uVg1P8Nkx1MHXg=;
        b=YOd9bgm9EjY+VMT2rOLHGXJabCrZDO2fD0VeUN7HAZ16LBqprsYGixhQfrwsKYeTlu
         LFD+/7KUrnpz03HT781Fvnb/X7wfzb6E+u2BWBk8DYiBuROma6wsC8PSSE1s2uILzKT8
         ZTvRSVQM6JMgHtj93y1ljPM5L9fLFabsWBr3VzhxVnXNUG1nUcInM+vTEPPUHo0Tf36N
         DQrJDnHuR9O+2q/xo9AFTLWCwOftyglwE8WgXNOpo2v1sT7V8dtU6QRLE3FKpynOtk9A
         6PkwpdkTwWvNBY14HPupipGt2k86FxJmyPX74PYCjPPWK17150cJHF1SzOgXWNyQu6jl
         nHZQ==
X-Gm-Message-State: APjAAAX+ZVUdCe05MzrFUW33Z0er+5dbNHMFvJQmELrdmYpzVCjFCCQ9
        kJhWuUE2Og8SX3YFbeigZrRg/m2B8DQ=
X-Google-Smtp-Source: APXvYqynZaMt6R7MTGG7LcwrU+uap8vEDW0FRTXcMmh0PSz5vUl5+Xi9cvqe/DSDwOaBdjdm/XrYKg==
X-Received: by 2002:a17:902:b40f:: with SMTP id x15mr1040185plr.101.1566942077825;
        Tue, 27 Aug 2019 14:41:17 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id m19sm293202pff.108.2019.08.27.14.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 14:41:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Allison Randal <allison@lohutok.net>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/9] drm/msm/dpu: add real wait_for_commit_done()
Date:   Tue, 27 Aug 2019 14:33:32 -0700
Message-Id: <20190827213421.21917-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827213421.21917-1-robdclark@gmail.com>
References: <20190827213421.21917-1-robdclark@gmail.com>
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

