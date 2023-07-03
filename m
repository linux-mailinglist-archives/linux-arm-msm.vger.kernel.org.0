Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E0374533D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 02:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjGCAh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 20:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjGCAh5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 20:37:57 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99591BF
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 17:37:56 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b6a5fd1f46so58598831fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 17:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688344675; x=1690936675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPFwCvRngaFzJ94U7CZjB/OGCFNsTWeZNPgu469jNjI=;
        b=zqc8yxn+85gSqrBDI0ZGz0xLVJhr/wm+fFHjv88VmquMMzqCImDdrX/yVEWaJfLtzt
         bztABFbB7IIrko9nWgeExVDNlF/vTz/DO161LfevnzAXu/oOonoHgsXdb7ALC2diIRvj
         XBiMjSITEDbUe0KEqpb0SvZCsHvzjcesL8v2TBuBBZcUsM+8aFSMjvQq9T7hooPriW/J
         pl+c71IxTFjUN8FE3xDbqMWksY+4nn4k2vGzj7WLcEPpIQK7woZlJ2oyrWsFXRCpCOOx
         9hpLz5de9zSnKhtQiWFjiek/mg08NFMGVp6PCWYDiF65EqWzyw6QVZn337z0jRRsDtwX
         otlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688344675; x=1690936675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPFwCvRngaFzJ94U7CZjB/OGCFNsTWeZNPgu469jNjI=;
        b=cTYKnflE3Avw5Pizo+QZwhzQIGnMjKlGpjqhBtoHAdTCQf6euRsH8WXVOfqmQ+kxfP
         QTvox4of8xUAhRbRU4NIqSFkY8Q+mePw/Vpir66aNSvh1kgoasW/nHQMDkIRk+aKcQLd
         jprqtu3Tfetq0dg2taNHPEpiuuVzHVZA1jpVpERWngiPpwse11y/n6zSyPhABLKo6CkA
         tlBXO7BLy7CdVTnXKcXNdpILXZNStjrXALPOWSGSNxiY7/O6RYv4k2vWCV4Iy3KgqDHg
         zeEW/uEvbCFs21SteBh9EDWBpRBykgg6rFXyGT2G0Bxy7NY+jh9FWwniEU4d3n4pL+wA
         BUsg==
X-Gm-Message-State: ABy/qLYNdeGMYmgTqDOPtWrrS8UhybCi1XGeXuDxTNur/w/Zwn90kE3f
        jEo63sjeu9pVWeEXHBBOYazdig==
X-Google-Smtp-Source: APBJJlGRBoBupoFRwJOOIXxbqzcof+LE14S8pxvp2t7NizJblaQDQ3CdluQZWpm+UEkjaCU7nqT9Fg==
X-Received: by 2002:a2e:2e04:0:b0:2b4:737c:e316 with SMTP id u4-20020a2e2e04000000b002b4737ce316mr6595190lju.14.1688344675238;
        Sun, 02 Jul 2023 17:37:55 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 17:37:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 10/13] drm/msm: switch to drmm_mode_config_init()
Date:   Mon,  3 Jul 2023 03:37:42 +0300
Message-Id: <20230703003745.34239-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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

Switch to drmm_mode_config_init() instead of drm_mode_config_init().
Drop drm_mode_config_cleanup() calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e929da9360e4..6b734be17f3f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -238,8 +238,6 @@ static int msm_drm_uninit(struct device *dev)
 	if (kms)
 		msm_disp_snapshot_destroy(ddev);
 
-	drm_mode_config_cleanup(ddev);
-
 	if (kms) {
 		pm_runtime_get_sync(dev);
 		msm_irq_uninstall(ddev);
@@ -439,11 +437,13 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	might_lock(&priv->lru.lock);
 	fs_reclaim_release(GFP_KERNEL);
 
-	drm_mode_config_init(ddev);
+	ret = drmm_mode_config_init(ddev);
+	if (ret)
+		goto err_destroy_wq;
 
 	ret = msm_init_vram(ddev);
 	if (ret)
-		goto err_cleanup_mode_config;
+		goto err_destroy_wq;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
@@ -551,8 +551,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 err_deinit_vram:
 	msm_deinit_vram(ddev);
-err_cleanup_mode_config:
-	drm_mode_config_cleanup(ddev);
+err_destroy_wq:
 	destroy_workqueue(priv->wq);
 err_put_dev:
 	drm_dev_put(ddev);
-- 
2.39.2

