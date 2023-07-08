Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C74A74BAAA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbjGHBEN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjGHBEM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:12 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160E3211F
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:11 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b6fdaf6eefso38892381fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778249; x=1691370249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfadn5RYcxzW3bydxCOGekJMqYKQXpQf89DYILeFA6M=;
        b=VVnvzEdcmW8uqRQ2naUKeP+xREh7R1CLb6LvO8EK6PHEJZ4SXNWcAaIUBCLkpNJXfs
         q87m9hujz4HuqYnXxj+nYYBVv535XRkyQgDkpzn/2znBjNWNUegPLkk7rA6QKlpX0nUk
         3j1MERndvEbGEca39HEwCdfZFkk1+Ev1/2xUWOWjjzgvSDCnN8WKAD2ElBqzGvk0+SfL
         5+ZHNpEkDpbfOqUJajfO9HILx3faXeMqkFgSSES1L+lNhR4sIohISVeeKdozVVQN5po7
         PbnOqIJESnJy77DnfSvNPa2/85mljv3u4icHDCNe3Sy+kxoFoj43P3mjU8GZIbMZLIOT
         lULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778249; x=1691370249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfadn5RYcxzW3bydxCOGekJMqYKQXpQf89DYILeFA6M=;
        b=D4X0hevP3EGApjSYi6g27Ey7DNui8q0pKYwK4N5SMy9XzgOrT5cZs4D2Zu0NEYMnNR
         /aRp5WRPT8UpW6wTX1VrmTI16oZLY8K94DcV5fRiCfZfMX11AOM1IG+NSEYoVXeBNIab
         kcQGnP/wqCi6vknxpOffCoAJuE03+D9CXcmbpMKthDDmxcGFKcY2YkwZgf9iPoshVAtA
         wYXoVmLjXkGGyPnIKvRjUwETaVOPwXtqvxkOqRB4ODcekXQPmitIpxglCQFtOlOcZXq9
         i9laVPG17QncJ220NwOioI8T/PgMnUYnKXp/qCOxboIQ2twtJsHvNpV/7wxORLAuZa6/
         XYFg==
X-Gm-Message-State: ABy/qLY6OUAPAm54X56j1nL7hjVqhiHWfGGooNb1ZEsSeDqYhwh4KVjU
        luk50z7v3KiALr9+1GhB4RX/4g==
X-Google-Smtp-Source: APBJJlE+xRVv4dS/H8P6fWlSLRrpda5JAhkrbTbV8WAFn4HIJmu6gI791/v2Icmxj2rjkwU354w9kg==
X-Received: by 2002:a2e:8611:0:b0:2b6:9c1d:dea3 with SMTP id a17-20020a2e8611000000b002b69c1ddea3mr4958137lji.2.1688778249443;
        Fri, 07 Jul 2023 18:04:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:04:09 -0700 (PDT)
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
Subject: [PATCH 01/17] drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
Date:   Sat,  8 Jul 2023 04:03:51 +0300
Message-Id: <20230708010407.3871346-2-dmitry.baryshkov@linaro.org>
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

MDP4 and MDP5 drivers enumerate supported formats each time the plane is
created. As the list of supported image formats is constant, create
corresponding data arrays to be used by MDP4 and MDP5 drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 49 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/mdp_kms.h    |  5 +++
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 025595336f26..ba9abe8b3acc 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -81,8 +81,8 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 #define BPC0A 0
 
 /*
- * Note: Keep RGB formats 1st, followed by YUV formats to avoid breaking
- * mdp_get_rgb_formats()'s implementation.
+ * Note: Keep mdp_rgb_formats and mdp_rgb_yuv_formats in sync when adding
+ * entries to this array.
  */
 static const struct mdp_format formats[] = {
 	/*  name      a  r  g  b   e0 e1 e2 e3  alpha   tight  cpp cnt ... */
@@ -138,6 +138,51 @@ static const struct mdp_format formats[] = {
 			MDP_PLANE_PLANAR, CHROMA_420, true),
 };
 
+const uint32_t mdp_rgb_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+};
+
+size_t mdp_rgb_num_formats = ARRAY_SIZE(mdp_rgb_formats);
+
+const uint32_t mdp_rgb_yuv_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420,
+};
+
+size_t mdp_rgb_yuv_num_formats = ARRAY_SIZE(mdp_rgb_yuv_formats);
+
 /*
  * Note:
  * @rgb_only must be set to true, when requesting
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index b0286d5d5130..11402a859574 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -94,6 +94,11 @@ struct mdp_format {
 uint32_t mdp_get_formats(uint32_t *formats, uint32_t max_formats, bool rgb_only);
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
 
+extern const uint32_t mdp_rgb_formats[];
+extern size_t mdp_rgb_num_formats;
+extern const uint32_t mdp_rgb_yuv_formats[];
+extern size_t mdp_rgb_yuv_num_formats;
+
 /* MDP capabilities */
 #define MDP_CAP_SMP		BIT(0)	/* Shared Memory Pool                 */
 #define MDP_CAP_DSC		BIT(1)	/* VESA Display Stream Compression    */
-- 
2.39.2

