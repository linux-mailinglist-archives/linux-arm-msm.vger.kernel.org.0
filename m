Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A006B4AF809
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238138AbiBIRZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238141AbiBIRZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:23 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAFA4C05CB82
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:25 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id n24so1744496ljj.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1/ATy1SER9Rft7B49K84iltLuTk/P0va3Tz7LA1Pnkg=;
        b=IqG7ATjnxOef+EGAmIBzFkZpr3VGQI8n1YxhsSjR2oK/919PYBxL1+WBGyRZMqhjbj
         y8qpYq5GXxIO2FQ747SLGQ5Y5Ew7VgoxOLaHpalMs0keAVb25PHAxldR9VmKfvKvPdpD
         ZfdggSY8xCsBodClGtri3nGKTPBwYwRjiM6+YdfwabZxnfNoFv7VdTzdgVWtzq3d1MBS
         BMYt6ayNuaqwhy0b8QFNCZwvgXMnrgsVqJY0vUkEm2vjIDbsA0YJdAAcB78bCOsOBGN9
         1YgVWbpN0AwcHvrkfx1mYg+n+hPAFASbxQrQbflPPEfwWXF4QyTdF7oTSpha9r7GiBP4
         qPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1/ATy1SER9Rft7B49K84iltLuTk/P0va3Tz7LA1Pnkg=;
        b=KfYY1ThXDxAG0ThTSzoVbh/wGomOM6bB+diVjz1iqivpjPg8lSqUZVRmx092YsKYmJ
         reRzmnAy9UmuMMr6a1mBJxLTx5Gv5w3KbOfgm0ujaX4V5K89neWpv30vSuLc+cNAsynO
         15gWJwUNBODtEsFF6fbKBvp6WX6U/Mv6xGknaqDWQ1qgh2tPMypbEEVpLKFLXOHrRuqe
         5OIJs8IjOEQe4rvldP1z+wWUm9k5hpRIOIYwnFouqUE8ZJE0TDELVxPRXNiafjvdRj5f
         8e9oGpzOV9ydG9Fnur1ecOwUWVFNgcJpxgCukCAv36wHqLnstI/GhxEHNhq6y4Tu2cl0
         p/Kw==
X-Gm-Message-State: AOAM533Q747tv6nwHnaa3LzwghJNtDg3yR/gCjCv4zvySRA3u4dJAFdo
        jgovf92xbcDUzYQgATZIivK3Rw==
X-Google-Smtp-Source: ABdhPJxLWF5f9R0XQgNxir3+ThLX3no3g0rzkJKSvEttlfX9xwkNse3OCf3pewdaJnO7F7P78DPH6Q==
X-Received: by 2002:a2e:9916:: with SMTP id v22mr2187751lji.382.1644427524297;
        Wed, 09 Feb 2022 09:25:24 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 02/25] drm/msm/dpu: do not limit the zpos property
Date:   Wed,  9 Feb 2022 20:24:57 +0300
Message-Id: <20220209172520.3719906-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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

Stop limiting zpos property values, we use normalized_zpos anyway. And
nothing stops userspace from assigning several planes to a single zpos
(it is a userspace bug, but the kernel is forgiving about it).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3fcc964dec0a..c04c3be16d85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1429,7 +1429,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
-	int zpos_max = DPU_ZPOS_MAX;
 	uint32_t num_formats;
 	int ret = -EINVAL;
 
@@ -1467,14 +1466,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	pdpu->catalog = kms->catalog;
 
-	if (kms->catalog->mixer_count &&
-		kms->catalog->mixer[0].sblk->maxblendstages) {
-		zpos_max = kms->catalog->mixer[0].sblk->maxblendstages - 1;
-		if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 1)
-			zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 - 1;
-	}
-
-	ret = drm_plane_create_zpos_property(plane, 0, 0, zpos_max);
+	ret = drm_plane_create_zpos_property(plane, 0, 0, DPU_ZPOS_MAX);
 	if (ret)
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
-- 
2.34.1

