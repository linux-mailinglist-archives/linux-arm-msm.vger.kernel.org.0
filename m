Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988FE3B31FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbhFXPAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 11:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhFXPAM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 11:00:12 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BEFC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:52 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id r16so8138749ljk.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7LSD+0UwStyFklWVh+hnsHGUn+QhdxgAc/M+GEYmbyE=;
        b=QgPVQOTtH26cXlqMiPK4vS6KzVyPJcDWVVUHj7L3iv/KjvaBF5FwCpaFl/9VPlnEGQ
         sZZT3Lf952DxjZAy4AWzu3g5REwDFnBhH8G0r9w7rOYJM1HZP/EF1UfT7pMsGsOnBYbv
         f+waMK10AUUAncvmNnzalptUejc0COvBtu551LzFJUmro2pNjxATyopoClq6PgJIpHVc
         a124A2dGbhvyzkbgMGxmrV5+annKHc+epI4eBoQwzkjNwlukiOTnHS559YEmERg29V27
         fUH90KAOu04JnUWj40DCYlQ06nnewiHVA5BXumteyePNtpIOenJhCsmLnmspIXpYZfS3
         Ao1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7LSD+0UwStyFklWVh+hnsHGUn+QhdxgAc/M+GEYmbyE=;
        b=HDvoahJ/0JstF7UN6cjWnqImIbyg7fUdiVHAM2v0afpIN2gVz55vmw1MCMRnpfc3Iu
         8Jh2XlXqd5aeUGtrf6nh5Ld5v+6Fk11As/+bvTQ3OL3tzRYcfvPZGjIjrSTVOAqvgn0g
         OY6tIgvquWKEeViSK8KFy20jMTocW9A/LzW6e7EXsn/zYanbevXcq9QBExpUBl5+LXtC
         8i+d2yGflxo1sxgDcp0ywMxdwV6GtbKTTs/4yF9qfPEWJNu2hB843RkTU0NB4b0VpFwl
         h7VaA74lh9OvCuAtRkEIfpJmZ4VCI7JxqmnHbcL/pgGLmRgaAf8pTAV24NOqqrw6Ppt+
         qm2w==
X-Gm-Message-State: AOAM53309nItLPFOrAg8NNzgJGtKr0s5YgSs1/c1BbmHiMFj+dSV+HcS
        zs4QElDBoCBQ4fCT8QxztbhxDQ==
X-Google-Smtp-Source: ABdhPJwA3u1lfwhABHDdSmtduAEq/8vtdNBzloSloIzE0i7sm7viYZEwKQqjku5laUXEXohfYsAHBg==
X-Received: by 2002:a2e:9088:: with SMTP id l8mr4188125ljg.144.1624546671130;
        Thu, 24 Jun 2021 07:57:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 07:57:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 17/17] drm/msm/dpu: switch into using virtual planes
Date:   Thu, 24 Jun 2021 17:57:33 +0300
Message-Id: <20210624145733.2561992-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a compile time #if for now, to be converted into proper module
parameter (or dropped if there is no more need for that).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 66a1c8889cf3..08b47609a315 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -611,6 +611,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	for (i = 0; i < catalog->sspp_count; i++) {
 		enum drm_plane_type type;
 
+#if 0
 		if ((catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR))
 			&& cursor_planes_idx < max_crtc_count)
 			type = DRM_PLANE_TYPE_CURSOR;
@@ -625,6 +626,19 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 
 		plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
 				       (1UL << max_crtc_count) - 1);
+#else
+		if (primary_planes_idx < max_crtc_count)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else if (cursor_planes_idx < max_crtc_count)
+			type = DRM_PLANE_TYPE_CURSOR;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		DPU_DEBUG("Create virtual plane type %d \n", type);
+
+		plane = dpu_plane_init(dev, SSPP_NONE, type,
+				       (1UL << max_crtc_count) - 1);
+#endif
 		if (IS_ERR(plane)) {
 			DPU_ERROR("dpu_plane_init failed\n");
 			ret = PTR_ERR(plane);
-- 
2.30.2

