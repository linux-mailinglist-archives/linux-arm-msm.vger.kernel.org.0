Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530CF6B99C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjCNPhc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbjCNPhL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:37:11 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878B1ADC34
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:04 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a32so16444507ljq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=demNi9tY5y1rcHkWi3Rdcd6GdqUqaXSgbS47QqrmYDw=;
        b=nUvr0P7d/LVi575KjvQnzMqgnxYrsKxdbM4uVBEFiUSVUJzncfEzNYA3T68qc3zFx0
         zBylrxHHGqrkbkhHnCByNUED9QdbqNBePUbms9N5HUayDDlXqdnQC8rdwSPqTuCxziiq
         hHyGY+UV5jburwc4eVeMXg/1QvOfr+1xw+FLVLqyhsUGXE9x5WVgX+45Hd/C3ypdwidk
         4PT9D6g2mO1ddyKIUIEuHXZ1xHTAaJLTSlDYtBkJQBo4+XF/yAHseKCsinCLUkrAy8+e
         4wfqU4+ZjXEExtRCwMHzSFqLMrISZMez1wPCAAvXWg01wjGlt0Aj1qlgzN1XPJRonFAf
         i+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=demNi9tY5y1rcHkWi3Rdcd6GdqUqaXSgbS47QqrmYDw=;
        b=i1bdWo9J3ISC2Inbwtu7XcmN4XGHxn2CgXb/iSVxAraTM2iJ3yQGumX3LvIpM7tnuu
         eukykHzqdx441BVtAxOLEPMR2g8LqqjhoBhBoHqExP0V+5Rcwmd7n2LGoYPM9xdJeIXO
         cfyy8KJ2fWN3NQtquVh/LhAx8j/EtNugYau42Vp1sFBglUlNEb2l7GZsUsYeyyMaXXuX
         Yf1n9kb/w9Q+sNs8lORHhS5Pj5Mnax6FVb3f2cac8r56p9yyriz7RLGL1JwNfRsK8r6d
         MJkaO6cKhLqIOgTXwLrDJtgUaiw+T2mshHo4POqZP+aJFOhOYRM2S0ISVHBus51mdA5G
         jb3g==
X-Gm-Message-State: AO0yUKXmbt6MLGBsPyPhjK/zzAc9ZCHgNdqn1Kp6x7qR5KjoT8W7IfYb
        gTgme/cKYiNQ7vyySvtNAQy4mw==
X-Google-Smtp-Source: AK7set+y/LQFDBwhtv1fMYkhSiPbToBHbFyzweRpHLfqV7qRT2hCubGz9Ag7usJPySn7h5SWnbdb7A==
X-Received: by 2002:a05:651c:301:b0:295:9d32:a195 with SMTP id a1-20020a05651c030100b002959d32a195mr10165678ljp.32.1678808149178;
        Tue, 14 Mar 2023 08:35:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:35:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 04/32] drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
Date:   Tue, 14 Mar 2023 18:35:17 +0300
Message-Id: <20230314153545.3442879-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
2.30.2

