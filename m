Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2694ECFB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 00:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351629AbiC3Wb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 18:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233684AbiC3Wb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 18:31:58 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4115BD2A
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:30:12 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id v12so16922196ljd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hEoGB+086W5qFtT7rpPO+CifXhForrv5VQW9zjQHAzY=;
        b=r2czRJ6lFFJB2jjTDUGrBJXjNs1cv56H9XE9cc4UJIUZlHKG/hoteI8hC3i8boYzIt
         mhWssaWHa+RuXkz/LPEbMMDULib4GbH7j4QAqCxwzDHoXc6LoIKsHg/Y0zaXenoZyjtI
         /5SB6F3FA5uhgKHEFnvzngC4voA0Hvj8MXGPdePwRvHxFlqDnTq38Q2Ctbcugva5m/HW
         hYH51ShKItJ4xae1iN/HQxCo6tUMQGc6tTvtkVa26ZSktZjtX06xxmdIwBnIMykvuD8y
         QlsBYXlwchcarb77C90cuT4Ca/RsmN8ab7Uflp6SoVN5brhnirQ1GmAog3WzvqWes3zm
         Kz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hEoGB+086W5qFtT7rpPO+CifXhForrv5VQW9zjQHAzY=;
        b=6oiQ4/o8+8BtfNWdWpvjtMkaZkR4DWPycD4aGtwT446LabjtAN/z0NoLcUjEey+bPe
         dqJPzw97OvhV0piTCBcI0j4Q3c3fLI4ovrDlgumxcj+DtIG1BHunhtnpvTlId1fKluKi
         ljdoUdHgt16+Jr0HWrvJ50+aZOI85ACEItwE7qG1Pq3/lixDFD2c0O64O7f96na8Yq4B
         geo1lSWGSVLvZIKQMrfW0QO+ft8Wu5oPkWbaOchb/oClmHUAsjc4snPhZn/b/vBUjJPS
         hMCKdpFl//Dn65+VBUneBsUPS9zjNCZoa7gE5PcWMKsG2WzneR9/cOgnIEMsfbZjk8fz
         ckjA==
X-Gm-Message-State: AOAM531bBeHQQaRnDBKmP2iqxszOtderZQyxSv3IUrSBiAFSVUR1g6kG
        3k8x8OU4Gnk+US8wxwfTX1jPRA==
X-Google-Smtp-Source: ABdhPJxJ1FjV8WRE578fZwzltmDLODh7k28/q+RvdGrwZ6exKjgFg/B+RWR6Vl2ucR/KSHRs+GKI6Q==
X-Received: by 2002:a05:651c:150a:b0:249:a0b1:2e15 with SMTP id e10-20020a05651c150a00b00249a0b12e15mr8469748ljf.182.1648679410591;
        Wed, 30 Mar 2022 15:30:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 15:30:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 1/4] drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
Date:   Thu, 31 Mar 2022 01:30:05 +0300
Message-Id: <20220330223008.649274-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
References: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
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

Since the commit ab205927592b ("drm/msm/dp: remove mode hard-coding in
case of DP CTS") the function dp_panel_get_modes() doesn't use (or fill)
the dp_mode argument. Drop it completely.

Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 2 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 178b774a5fbd..3dd790083cf7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1013,7 +1013,7 @@ int dp_display_get_modes(struct msm_dp *dp,
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
 	ret = dp_panel_get_modes(dp_display->panel,
-		dp->connector, dp_mode);
+		dp->connector);
 	if (dp_mode->drm_mode.clock)
 		dp->max_pclk_khz = dp_mode->drm_mode.clock;
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index f1418722c549..8d7662028f30 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -259,7 +259,7 @@ u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
 }
 
 int dp_panel_get_modes(struct dp_panel *dp_panel,
-	struct drm_connector *connector, struct dp_display_mode *mode)
+	struct drm_connector *connector)
 {
 	if (!dp_panel) {
 		DRM_ERROR("invalid input\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9023e5bb4b8b..9fa6e524832c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -64,7 +64,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
 int dp_panel_get_modes(struct dp_panel *dp_panel,
-		struct drm_connector *connector, struct dp_display_mode *mode);
+		struct drm_connector *connector);
 void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
 void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
 
-- 
2.35.1

