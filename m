Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FAB409B7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 19:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344544AbhIMSAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 14:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344584AbhIMR7z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 13:59:55 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E036C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:39 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id t4so11495154qkb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WixXNmtyoiXEy7RQ0nNgxkRw7PoZo3ZaXRRkl9iKMJ8=;
        b=I/UaVMecvcM+k2gT3PjP5wddh3bQ8UHcCogsdvqPwDESDz4vXOPqouC4J/HswClhM1
         d7VgageqVVw3F3yoX/VwRZNgqjxZY/xi1KQEMLbtZjrdHveFiOLos5RX3OL6cA70PeI4
         xmE3pojIcPkkFl7sb7HHWcV+8TYFPvS8F7rpM+W0FNBRc8c8XX2Zd2JVn2UptM3NJu4N
         kOihGA+pf8REnoqXEWNfEbVwrrLN7R4dy824jeTyjdiLsHkupY6x97PAv7aTClzvusUB
         h+xUW93HzkQUpdPF7HAk6y8UuspU2IOerfI4bEDGtW/7L0P8m7kZ8UcunUxOAHBZ4qae
         NQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WixXNmtyoiXEy7RQ0nNgxkRw7PoZo3ZaXRRkl9iKMJ8=;
        b=Szj+TqpnW5BcF5bBciOmphfM4mhbL6fen4+KshzLaZ/KTWysrGTyiMjXx2eGsxnvup
         JEjeMr5e/EE0cNi1KuoS4aDgC/v8cfmZIpQEjP1ZPSjBBELbyrgeazE5Hc/NXWDiZfy9
         RrmUpwIAJ5l++UeEHB+7VYHPU2yR1MbJMtvz2k0abKENZ6BD+ilmLyAxD9SUGykU4fT8
         p/bsaLjd9mibmcpfaHIbicVnmal+MkQcc/Jk/KQGqK141DjHl7J+WbanogzCY6klEUg3
         3mcAsfMdq5ov9LCHqntwqEzOjKwpLkfE6mxVJpNPahZ6cY0mS41N5y1POOJF6cPRUuBb
         SBcg==
X-Gm-Message-State: AOAM532XfZ3l25JxOqOrpW/pGU4CTcjUCXAPf/pp+bdvAJ91hTWIpJO5
        ETgYbA6FNG893j1VqwhgD923sQ==
X-Google-Smtp-Source: ABdhPJxV4HKhaM+RdqnvexrMa34TdLzrTDhr6eL6BIPJw40Fwr/H+NzEhdf5G9qmgDNHQTsXq8g5JA==
X-Received: by 2002:a05:620a:1aaa:: with SMTP id bl42mr828693qkb.469.1631555918441;
        Mon, 13 Sep 2021 10:58:38 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id z11sm4358476qtw.8.2021.09.13.10.58.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 10:58:38 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 10/14] drm/msm/dpu: Remove encoder->enable() hack
Date:   Mon, 13 Sep 2021 13:57:41 -0400
Message-Id: <20210913175747.47456-11-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

encoder->commit() was being misused because there were some global
resources which needed to be tweaked in encoder->enable() which were not
accessible in dpu_encoder.c. That is no longer true and the redirect
serves no purpose any longer. So remove the indirection.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 22 ---------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 ----
 4 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 984f8a59cb73..ddc542a0d41f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2122,11 +2122,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.mode_set = dpu_encoder_virt_mode_set,
 	.disable = dpu_encoder_virt_disable,
-	.enable = dpu_kms_encoder_enable,
+	.enable = dpu_encoder_virt_enable,
 	.atomic_check = dpu_encoder_virt_atomic_check,
-
-	/* This is called by dpu_kms_encoder_enable */
-	.commit = dpu_encoder_virt_enable,
 };
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fb0d9f781c66..4a0b55d145ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -381,28 +381,6 @@ static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 	}
 }
 
-/*
- * Override the encoder enable since we need to setup the inline rotator and do
- * some crtc magic before enabling any bridge that might be present.
- */
-void dpu_kms_encoder_enable(struct drm_encoder *encoder)
-{
-	const struct drm_encoder_helper_funcs *funcs = encoder->helper_private;
-	struct drm_device *dev = encoder->dev;
-	struct drm_crtc *crtc;
-
-	/* Forward this enable call to the commit hook */
-	if (funcs && funcs->commit)
-		funcs->commit(encoder);
-
-	drm_for_each_crtc(crtc, dev) {
-		if (!(crtc->state->encoder_mask & drm_encoder_mask(encoder)))
-			continue;
-
-		trace_dpu_kms_enc_enable(DRMID(crtc));
-	}
-}
-
 static void dpu_kms_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 323a6bce9e64..f1ebb60dacab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -248,8 +248,6 @@ void *dpu_debugfs_get_root(struct dpu_kms *dpu_kms);
 int dpu_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 
-void dpu_kms_encoder_enable(struct drm_encoder *encoder);
-
 /**
  * dpu_kms_get_clk_rate() - get the clock rate
  * @dpu_kms:  pointer to dpu_kms structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 37bba57675a8..54d74341e690 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -266,10 +266,6 @@ DEFINE_EVENT(dpu_drm_obj_template, dpu_crtc_complete_commit,
 	TP_PROTO(uint32_t drm_id),
 	TP_ARGS(drm_id)
 );
-DEFINE_EVENT(dpu_drm_obj_template, dpu_kms_enc_enable,
-	TP_PROTO(uint32_t drm_id),
-	TP_ARGS(drm_id)
-);
 DEFINE_EVENT(dpu_drm_obj_template, dpu_kms_commit,
 	TP_PROTO(uint32_t drm_id),
 	TP_ARGS(drm_id)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

