Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8CE4768331
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjG3BTi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjG3BTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:19:38 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFF7171F
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:37 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99bcd6c0282so505389866b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690679975; x=1691284775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEqKNUOrM2L+80YPOgtY08Y0Fw+LsJW6C8aftNoGlfs=;
        b=ezlIi8o0wDmpD8BLtzs1y3P0RpINq9ceQmJBKDVhYmnAZPPJQvRNwnYHbXEuMe39Sa
         7jeZCq7Dj3qCmLKvoEjMUyafjwXOxL5UU9JQSJjcHDgzpeMonxUBJuJHx00AeWeuhgi1
         S7ct7QZn6s/gqRoFvZxOmnBwknzyamGugQ+N6iDAo5Cl4yotC2XVWeIIMjzxidjPg37N
         u4ZUZ9iBreoVQ6GRl6TcR5/DnvUFnJhom7TZ6yIgKkxAYQqUYI/i6y1cR8TRWS1wIMJg
         HAEYMJzRB0ODg9pxsXXZXdh19ae05GuL+u97p7V1Li6q/fe16FA3tn4K9AuKpCgBsAbf
         KJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690679975; x=1691284775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XEqKNUOrM2L+80YPOgtY08Y0Fw+LsJW6C8aftNoGlfs=;
        b=ByYUQXIGsvbHyZEgO38LgjK3/nEJNpl/yDyLgV8OQno40VORI1nscHWZYsaCF7q5Hx
         5yLAN2SzKTN0UZt26jz2Tr/wwzaUq0w0x9/iQYBigCQOHkVtPxfrEdDX7flXpX/VFyk+
         j8AFJq3HFbsHWyA6lPqgYLWe08PvfDxXbFApXvn+9YMsPFbtbH53Eqx1/V6UEN5lXMp6
         SBiUn4SsqQ9CChSxL6JEqf8GIcN82kIrJjH3MreLR8To7zgWg1yqT703SA2e8Yh08+jG
         RXwaTg4EqvfE1x08XFpIz7C5QY2Ke9GyX7U7JiHN2lepBysyogBDjD4j3eZT3TXF5HPt
         doXw==
X-Gm-Message-State: ABy/qLbnoYY1iPL6RFWzNKNuN9H0jLqA6oF+fUPQySHwWc+9aqMP4OFf
        hvAsFkqqtY8bJzrLh8Kw/JZaFw==
X-Google-Smtp-Source: APBJJlGo0fAu8KduEjgWRljCEUjAANGS8gG8GB+VtjICcVfefHfEw1jmSpga825KU8ftXathjjiFNw==
X-Received: by 2002:a17:907:1dc9:b0:99b:c2b2:e498 with SMTP id og9-20020a1709071dc900b0099bc2b2e498mr3385466ejc.52.1690679975533;
        Sat, 29 Jul 2023 18:19:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:19:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v3 09/13] drm/msm/dpu: use drmm-managed allocation for dpu_plane
Date:   Sun, 30 Jul 2023 04:19:16 +0300
Message-Id: <20230730011920.354575-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
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

Change struct dpu_plane allocation to use drmm_universal_plane_alloc().
This removes the need to perform any actions on plane destruction.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 46 +++++------------------
 1 file changed, 10 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f114efee1b57..9d9e1cbf0dd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1170,20 +1170,6 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	}
 }
 
-static void dpu_plane_destroy(struct drm_plane *plane)
-{
-	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
-
-	DPU_DEBUG_PLANE(pdpu, "\n");
-
-	if (pdpu) {
-		/* this will destroy the states as well */
-		drm_plane_cleanup(plane);
-
-		kfree(pdpu);
-	}
-}
-
 static void dpu_plane_destroy_state(struct drm_plane *plane,
 		struct drm_plane_state *state)
 {
@@ -1353,7 +1339,6 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 static const struct drm_plane_funcs dpu_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
-		.destroy = dpu_plane_destroy,
 		.reset = dpu_plane_reset,
 		.atomic_duplicate_state = dpu_plane_duplicate_state,
 		.atomic_destroy_state = dpu_plane_destroy_state,
@@ -1381,35 +1366,28 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_hw_sspp *pipe_hw;
 	uint32_t num_formats;
 	uint32_t supported_rotations;
-	int ret = -EINVAL;
-
-	/* create and zero local structure */
-	pdpu = kzalloc(sizeof(*pdpu), GFP_KERNEL);
-	if (!pdpu) {
-		DPU_ERROR("[%u]failed to allocate local plane struct\n", pipe);
-		ret = -ENOMEM;
-		return ERR_PTR(ret);
-	}
-
-	/* cache local stuff for later */
-	plane = &pdpu->base;
-	pdpu->pipe = pipe;
+	int ret;
 
 	/* initialize underlying h/w driver */
 	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
 	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
 		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
-		goto clean_plane;
+		return ERR_PTR(-EINVAL);
 	}
 
 	format_list = pipe_hw->cap->sblk->format_list;
 	num_formats = pipe_hw->cap->sblk->num_formats;
 
-	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
+	pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
+				0xff, &dpu_plane_funcs,
 				format_list, num_formats,
 				supported_format_modifiers, type, NULL);
-	if (ret)
-		goto clean_plane;
+	if (IS_ERR(pdpu))
+		return ERR_CAST(pdpu);
+
+	/* cache local stuff for later */
+	plane = &pdpu->base;
+	pdpu->pipe = pipe;
 
 	pdpu->catalog = kms->catalog;
 
@@ -1439,8 +1417,4 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
 	return plane;
-
-clean_plane:
-	kfree(pdpu);
-	return ERR_PTR(ret);
 }
-- 
2.39.2

