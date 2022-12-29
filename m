Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACEEB6590D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233981AbiL2TTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233989AbiL2TTF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:19:05 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C701409F
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:04 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bp15so28726630lfb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnhtYL/XQh1nJXsu1H+29shic9ChUEXdN4d56587xoI=;
        b=uZixQRHjio2ZX/MBXwsmrkxJ5DwGGs5wUZvqGRD3tqRgf259XGJV06+jm76MVyJFOG
         uusaget1p0Ne715SC0af6+oyVaET1fXrV8gtjFaYO8ROvb9Say8vrj4FiOoIJ489hoT9
         tReVP+RIbBZKaJb4V+RokJ7Tsx4Gqqk1s6Z++NADOOgn+blh4fklQbFc0L4TiTuT88Y8
         U5AkYLnho15vkblWMVAK4JfE3HbUswLi96n2eSHAW5xpCjKy9YtzRDGbgS9dJ0d3qeys
         aIh1zNYcrLfaubJaEtpp1yZtbo3+SSpheZzEr0a71G3Mtb5xuNS4WOdK7EB/H5NgqSyy
         6Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnhtYL/XQh1nJXsu1H+29shic9ChUEXdN4d56587xoI=;
        b=jYh51BYQ4ppA5Yux74gOfPnDZBMfcaMJmGQDTjQrcjBPsrMsqtUxtPgFmc53V4rrsB
         rW1QOciFlSv5sGlBM8jwqXEc3X+AuuiPoguIm8ElpJZftiILb5FNnECl6oj4QvYAkP5I
         PWs2ucCqXA9dL2jpMJ1ALf601xEusQLdziuclvoJSiG6NMiPgnlDnh5mXciCG95MBEPN
         i+eRtfORVY/+++qo9cDDgz5I3kZ6Cmonrbjy5m4FcPD61rK9MB6Rg6R8iCK24E6dhLro
         1tnDm/Bjfc2bQb89ln/C0HGSyaUbAmewJERvkEb/ybzEereniFDeIA5uA4czWJoZUVIn
         KOZA==
X-Gm-Message-State: AFqh2kqC3MX2WeXYSuGJCn/7bzt2BSXWvS452S9qA9535Q60LFrDfl/V
        AqWa6QLrAi01Rci3zQFt6SizbQ==
X-Google-Smtp-Source: AMrXdXsR1Gzb7o6x/qwidho1/o4YPb4ORhhJl/mCiEE8vPpBpKe1hK+YyEcCT/Xp0K2cI6kkraw1dA==
X-Received: by 2002:a05:6512:74:b0:4ca:fe23:7677 with SMTP id i20-20020a056512007400b004cafe237677mr5275661lfo.43.1672341544047;
        Thu, 29 Dec 2022 11:19:04 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:19:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 05/27] drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
Date:   Thu, 29 Dec 2022 21:18:34 +0200
Message-Id: <20221229191856.3508092-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
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
index cdde7b9ec882..43fb8e00ada6 100644
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
2.39.0

