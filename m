Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA0E05500D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 01:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380549AbiFQXdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 19:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383301AbiFQXdh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 19:33:37 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D94663F9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:33:36 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e4so6219407ljl.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ciSZb04u5diyzQzEI55UEzHKzWeHoRKJSsrCyWf1zjQ=;
        b=uXOip5LVACBzuQom3i6xPr24Kq1WLFoqH6x96i4z9r29CfoycHm0VqqGL0o+Nlu2TA
         iMkBLtLHxaGrnezwqdMDPAoBa9EwcOJB6J/q2Rq9UyolM/x+D4mz1XCuoGJZC85TZULi
         1ODpfBAVuLSRDYgBzpItSTPBdoGQJgORbbynt5cDFAb2dUtePLJsGP5ZODen4Nrd2sZa
         RkVTRpIkvWKkgmPZc7eX6JcgQkwjzyW3I8L933j6uAn4L5Sj54Ec4afJwYe1f/fZ8HtQ
         RMiKyQl6Tha/QlxJzGNLQ0dWCgvqaLybPfBtx0N10RJHFOr84A99HSh2q4m4v/DK2QPA
         aFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ciSZb04u5diyzQzEI55UEzHKzWeHoRKJSsrCyWf1zjQ=;
        b=jsYqHOLaIIwpt9bgkPZBTLfQq2+saq9ON7V7o8aG1W4VBi21CKZwvYtGLre8bnhrfe
         nDvsKqswi8ejzocVPOBqwgM3kPiyczZRyp/0PavzMAkV4wyRRioHOcufQgh+BHiQtz9F
         HwJ/9shdnIQyIYiGvBgDVPUxde943X89/eZc29uWSNWBdSrBF6ITd0n2NMYHYb0JID59
         qdGq7EbmBPiHtksIF2LZTo2B24lcaOT6OoDbDwL6r/m1e8G3FMcSiUEk6A8Jo6YkvIKh
         jUoCVyMORjq0D42ZWNqGDjLraiaObxGPLvHS3grLOltCMIZgiJeknIozXi5fGy+dAEMF
         Edbw==
X-Gm-Message-State: AJIora+1cDmLUsrmFrgMzkzlKxYXj6xE0ZHhEU9E7wGK5yyQ2YwHah7K
        Y8zvcaBIw9PJiQx+GoaVWopx/w==
X-Google-Smtp-Source: AGRyM1sISrUt1kbB6StZM60t0OHoTqRl5RnE0oat78jpp5a4CTOZq9EvMN8iYjren+rnE8Qakwk/3g==
X-Received: by 2002:a05:651c:a11:b0:255:af78:48d9 with SMTP id k17-20020a05651c0a1100b00255af7848d9mr6305328ljq.508.1655508814862;
        Fri, 17 Jun 2022 16:33:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b2-20020a056512060200b004787d3cbc67sm800138lfe.219.2022.06.17.16.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:33:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v6 4/4] drm/msm: stop storing the array of CRTCs in struct msm_drm_private
Date:   Sat, 18 Jun 2022 02:33:28 +0300
Message-Id: <20220617233328.1143665-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
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

The array of CRTC in the struct msm_drm_private duplicates a list of
CRTCs in the drm_device. Drop it and use the existing list for CRTC
enumeration.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 44 +++++++++++++-----------
 drivers/gpu/drm/msm/msm_drv.h            |  3 +-
 5 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e23e2552e802..e79f0a8817ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -806,7 +806,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
-		priv->crtcs[priv->num_crtcs++] = crtc;
+		priv->num_crtcs++;
 	}
 
 	/* All CRTCs are compatible with all encoders */
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index fb48c8c19ec3..7449c1693e45 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -337,7 +337,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			goto fail;
 		}
 
-		priv->crtcs[priv->num_crtcs++] = crtc;
+		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3d5621a68f85..36808990f840 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -497,7 +497,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
 			goto fail;
 		}
-		priv->crtcs[priv->num_crtcs++] = crtc;
+		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1aab6bf86278..567e77dae43b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -149,7 +149,7 @@ static void msm_irq_uninstall(struct drm_device *dev)
 
 struct msm_vblank_work {
 	struct work_struct work;
-	int crtc_id;
+	struct drm_crtc *crtc;
 	bool enable;
 	struct msm_drm_private *priv;
 };
@@ -162,15 +162,15 @@ static void vblank_ctrl_worker(struct work_struct *work)
 	struct msm_kms *kms = priv->kms;
 
 	if (vbl_work->enable)
-		kms->funcs->enable_vblank(kms, priv->crtcs[vbl_work->crtc_id]);
+		kms->funcs->enable_vblank(kms, vbl_work->crtc);
 	else
-		kms->funcs->disable_vblank(kms,	priv->crtcs[vbl_work->crtc_id]);
+		kms->funcs->disable_vblank(kms,	vbl_work->crtc);
 
 	kfree(vbl_work);
 }
 
 static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
-					int crtc_id, bool enable)
+					struct drm_crtc *crtc, bool enable)
 {
 	struct msm_vblank_work *vbl_work;
 
@@ -180,7 +180,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
 
 	INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
 
-	vbl_work->crtc_id = crtc_id;
+	vbl_work->crtc = crtc;
 	vbl_work->enable = enable;
 	vbl_work->priv = priv;
 
@@ -354,7 +354,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
 	struct msm_kms *kms;
-	int ret, i;
+	struct drm_crtc *crtc;
+	int ret;
 
 	if (drm_firmware_drivers_only())
 		return -ENODEV;
@@ -427,20 +428,23 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	ddev->mode_config.funcs = &mode_config_funcs;
 	ddev->mode_config.helper_private = &mode_config_helper_funcs;
 
-	for (i = 0; i < priv->num_crtcs; i++) {
+	drm_for_each_crtc(crtc, ddev) {
+		struct msm_drm_thread *ev_thread;
+
 		/* initialize event thread */
-		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
-		priv->event_thread[i].dev = ddev;
-		priv->event_thread[i].worker = kthread_create_worker(0,
-			"crtc_event:%d", priv->event_thread[i].crtc_id);
-		if (IS_ERR(priv->event_thread[i].worker)) {
-			ret = PTR_ERR(priv->event_thread[i].worker);
+		ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
+		ev_thread->crtc = crtc;
+		ev_thread->dev = ddev;
+		ev_thread->worker = kthread_create_worker(0,
+			"crtc_event:%d", ev_thread->crtc->base.id);
+		if (IS_ERR(ev_thread->worker)) {
+			ret = PTR_ERR(ev_thread->worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
-			priv->event_thread[i].worker = NULL;
+			ev_thread->worker = NULL;
 			goto err_msm_uninit;
 		}
 
-		sched_set_fifo(priv->event_thread[i].worker->task);
+		sched_set_fifo(ev_thread->worker->task);
 	}
 
 	ret = drm_vblank_init(ddev, priv->num_crtcs);
@@ -563,25 +567,23 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return -ENXIO;
-	drm_dbg_vbl(dev, "crtc=%u", pipe);
-	return vblank_ctrl_queue_work(priv, pipe, true);
+	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	return vblank_ctrl_queue_work(priv, crtc, true);
 }
 
 void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return;
-	drm_dbg_vbl(dev, "crtc=%u", pipe);
-	vblank_ctrl_queue_work(priv, pipe, false);
+	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	vblank_ctrl_queue_work(priv, crtc, false);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 08388d742d65..0e98b6f161df 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -102,7 +102,7 @@ struct msm_display_topology {
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;
-	unsigned int crtc_id;
+	struct drm_crtc *crtc;
 	struct kthread_worker *worker;
 };
 
@@ -178,7 +178,6 @@ struct msm_drm_private {
 	struct workqueue_struct *wq;
 
 	unsigned int num_crtcs;
-	struct drm_crtc *crtcs[MAX_CRTCS];
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
-- 
2.35.1

