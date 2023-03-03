Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A769D6A97B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 13:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjCCM5h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 07:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjCCM5b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 07:57:31 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680A95D75C
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 04:57:30 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id d36so304858lfv.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 04:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lC959/HwMpiS2uwIlrKavXLY4c7ReN699YonwKpSQeo=;
        b=rKxchwyG/3z0FYQvHBKt8igrl4CRU5nZEA+r/0vI27U4+sZB2Va4CPRJRg0aQbWtGR
         /Wtbvom4FyW30oB4r8M/jt1UzQT195yHtKqiystjHYiQNZE7tKtpwgqlCQZdXuASqhlI
         OWe1oM9N/RN67HUFgxZ98lJPMj5ptv1kG1APfpBBN0jK0F5txdp+nyYz5kvDq6C5ikQl
         VykBZAnuW0fs5Vn0Dk1V9pqatKm2WKmJeyhjqrtzOQX9IlYi6QYmVrRj6pkZSm0ae9h2
         prBR40VJpa/HIYTpV7JPy6WgAw/LobtYJwYWI+kTV5yxge+FhyUEuCMT4MtaNf4qCX/z
         HQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lC959/HwMpiS2uwIlrKavXLY4c7ReN699YonwKpSQeo=;
        b=6vF4lWYqBgYP2MW3pAbnqu1AtI7pGDFNyEd8gICcV0tTgDoL516bsAU5CbXFJqAxtY
         z94BFIAzjkBQNR//ptmpkgPO5s+Mi9PKAz+Uc0pNp73yP8EH7RCcYb2zwv2kCOk6+D23
         U2BIdHXTrRWdH5ylWj62QPIvu5xLCAQracnjwleH9CnS1A6dN6KUTurCuIvupDBHjZGL
         OWUES3U75i8nQG1OW7Iwl+oMVdhjjsdFw7FhwrfMven7SPYVkMheQ/Tc+C8okyA95H9P
         a9IxqMwjiDU85KvaINkAHlscpO58VDdf1mSVKWO65HCtFd+YWSi5HMh9FGufaA0asXxq
         HYGQ==
X-Gm-Message-State: AO0yUKUGOVDUgE+iJMu4AuMIkE1t1+2sJGhAuGd40yQxNknsEO8kLVrf
        RhSpKrEOcLFbyYzizx4mLiSELA==
X-Google-Smtp-Source: AK7set8QaahbEMH1T0PjQnwTqZctubG5lLxbb81czH5E1ImfvYnaqpqSVWA+vxYGtV+AZQsxFRKfnA==
X-Received: by 2002:ac2:53ac:0:b0:4dd:a772:8d24 with SMTP id j12-20020ac253ac000000b004dda7728d24mr462620lfh.32.1677848248825;
        Fri, 03 Mar 2023 04:57:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:57:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 04/30] drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
Date:   Fri,  3 Mar 2023 14:56:59 +0200
Message-Id: <20230303125725.3695011-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pipe's layout is not cached, corresponding data structure is zeroed
out each time in the dpu_plane_sspp_atomic_update(), right before the
call to _dpu_plane_set_scanout() -> dpu_format_populate_layout().

Drop plane_addr comparison against previous layout and corresponding
EAGAIN handling.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 10 +---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +---
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index d95540309d4d..ec1001e10f4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -918,8 +918,7 @@ int dpu_format_populate_layout(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	uint32_t plane_addr[DPU_MAX_PLANES];
-	int i, ret;
+	int ret;
 
 	if (!fb || !layout) {
 		DRM_ERROR("invalid arguments\n");
@@ -940,9 +939,6 @@ int dpu_format_populate_layout(
 	if (ret)
 		return ret;
 
-	for (i = 0; i < DPU_MAX_PLANES; ++i)
-		plane_addr[i] = layout->plane_addr[i];
-
 	/* Populate the addresses given the fb */
 	if (DPU_FORMAT_IS_UBWC(layout->format) ||
 			DPU_FORMAT_IS_TILE(layout->format))
@@ -950,10 +946,6 @@ int dpu_format_populate_layout(
 	else
 		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
 
-	/* check if anything changed */
-	if (!ret && !memcmp(plane_addr, layout->plane_addr, sizeof(plane_addr)))
-		ret = -EAGAIN;
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 2b0ebdd4c207..d6518ef1beb2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -476,9 +476,7 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
 	int ret;
 
 	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
-	if (ret == -EAGAIN)
-		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
-	else if (ret)
+	if (ret)
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 	else if (pdpu->pipe_hw->ops.setup_sourceaddress) {
 		trace_dpu_plane_set_scanout(pdpu->pipe_hw->idx,
-- 
2.39.2

