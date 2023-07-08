Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F309574BAB7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbjGHBEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbjGHBET (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:19 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C470F210C
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:18 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b6b98ac328so38424991fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778257; x=1691370257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EISX21FWLXz1QXdvUtqFaW2f6EH0tEp3Z4D8cCpj34M=;
        b=kyv3hf8HJcSmH3fJ6FcMv408NUaNI/RTNg9GB4Sr1Qxgr/8bkMStJxWPqwPZcznOSy
         K67WzScQjeDRLWG/1PcT44R5NOn2ousY68HeQVAerhiffn0v8ELyh4LW2+vawwcRNuPw
         r0KLm4zmL8k/4f6hEfxjWnlrnxDPiUVaRP6qpHuEC0ySjaGxpjAI3pbNKyTJHSB9+upK
         ru7qz0mY67QH/eg0mnw3MgIUUjiZu2M4pqukk0srvN7EcQYK+Xb7f8/mw7Q5nJxvcQgM
         wQ4YzhLgO0rfOeoWKwNlSUt1WCEGVuKRBsKE1VjVbbp1N4S08x2gGpbJFtstbItDiii5
         MRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778257; x=1691370257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EISX21FWLXz1QXdvUtqFaW2f6EH0tEp3Z4D8cCpj34M=;
        b=WYsYy0TWkDWl4zR9AHP9iVw3iDL2wN+ybh1x/r7JXe5N6JJWa1S5WWD86ipf0qaGix
         7GM9DVyfMhMDSQow0zlaYc5brom5HHp6vgP8zsSrGtX/sRVKAP8+6Zx5GQEssd7G2jaN
         4bBC8abLPyWplA/xKCA9iSR/scmiA6EzQjFaZWlOayJTRlfsuZcVlB+XfppG9ZSo6bI4
         lpqvHo8lz5MF8XD8wzFfF56i8FHA9smopThEbc36NqAMcxkmRQzMW/y0ZM8n/MJcPY9k
         WDhaWy7wtxK/QtQxGR+Irdh9nLaL+LS+dVa9lTdg6YOjxOmCrk9zXurBtrjWCf+MAWUe
         Ny8g==
X-Gm-Message-State: ABy/qLaltYEhFknoPZOMTIeMZ1vXrTxwPzkgu7R8Zr7DS3Hhpucc9NPH
        +m05SLH0ATMfERsgdCRfMSFh1w==
X-Google-Smtp-Source: APBJJlEIW0FoNB5b9BrFSYf40N9wE3CqFzLjv77pyHHsHa8Ek607/fTd3Um2fmarqn1NQHBKYhLeCw==
X-Received: by 2002:a2e:a311:0:b0:2b6:fa42:1b1d with SMTP id l17-20020a2ea311000000b002b6fa421b1dmr5173406lje.29.1688778257194;
        Fri, 07 Jul 2023 18:04:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:04:16 -0700 (PDT)
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
Subject: [PATCH 12/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
Date:   Sat,  8 Jul 2023 04:04:02 +0300
Message-Id: <20230708010407.3871346-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change struct mdp4_crtc allocation to use drmm_crtc_alloc(). This
removes the need to perform any actions on CRTC destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 33 ++++++++++++-----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 169f9de4a12a..5e5c31b44a8a 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_flip_work.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -123,16 +124,6 @@ static void unref_cursor_worker(struct drm_flip_work *work, void *val)
 	drm_gem_object_put(val);
 }
 
-static void mdp4_crtc_destroy(struct drm_crtc *crtc)
-{
-	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
-
-	drm_crtc_cleanup(crtc);
-	drm_flip_work_cleanup(&mdp4_crtc->unref_cursor_work);
-
-	kfree(mdp4_crtc);
-}
-
 /* statically (for now) map planes to mixer stage (z-order): */
 static const int idxs[] = {
 		[VG1]  = 1,
@@ -475,7 +466,6 @@ static int mdp4_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 
 static const struct drm_crtc_funcs mdp4_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = mdp4_crtc_destroy,
 	.page_flip = drm_atomic_helper_page_flip,
 	.cursor_set = mdp4_crtc_cursor_set,
 	.cursor_move = mdp4_crtc_cursor_move,
@@ -616,6 +606,13 @@ static const char *dma_names[] = {
 		"DMA_P", "DMA_S", "DMA_E",
 };
 
+static void mdp4_crtc_flip_cleanup(struct drm_device *dev, void *ptr)
+{
+	struct mdp4_crtc *mdp4_crtc = ptr;
+
+	drm_flip_work_cleanup(&mdp4_crtc->unref_cursor_work);
+}
+
 /* initialize crtc */
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 		struct drm_plane *plane, int id, int ovlp_id,
@@ -623,10 +620,13 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 {
 	struct drm_crtc *crtc = NULL;
 	struct mdp4_crtc *mdp4_crtc;
+	int ret;
 
-	mdp4_crtc = kzalloc(sizeof(*mdp4_crtc), GFP_KERNEL);
-	if (!mdp4_crtc)
-		return ERR_PTR(-ENOMEM);
+	mdp4_crtc = drmm_crtc_alloc_with_planes(dev, struct mdp4_crtc, base,
+						plane, NULL,
+						&mdp4_crtc_funcs, NULL);
+	if (IS_ERR(mdp4_crtc))
+		return ERR_CAST(mdp4_crtc);
 
 	crtc = &mdp4_crtc->base;
 
@@ -648,9 +648,10 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 
 	drm_flip_work_init(&mdp4_crtc->unref_cursor_work,
 			"unref cursor", unref_cursor_worker);
+	ret = drmm_add_action_or_reset(dev, mdp4_crtc_flip_cleanup, mdp4_crtc);
+	if (ret)
+		return ERR_PTR(ret);
 
-	drm_crtc_init_with_planes(dev, crtc, plane, NULL, &mdp4_crtc_funcs,
-				  NULL);
 	drm_crtc_helper_add(crtc, &mdp4_crtc_helper_funcs);
 
 	return crtc;
-- 
2.39.2

