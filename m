Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E506543053F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 00:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244741AbhJPWTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 18:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244726AbhJPWTG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 18:19:06 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD592C061765
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 15:16:57 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id c29-20020a4ad21d000000b002b6cf3f9aceso566856oos.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 15:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lsn56pxPLZU351QYQn0nyUl+5C+c+5Byaba7lRhCMeo=;
        b=PSfhPtYRVYX4Ue7DIC7G/NdehnLVI1sh2DUAUD/5NLhVk+liaHLuEhvdy8STPhDgAQ
         Z8MBp6rcDneZUl4DXuOX4Tg/C7u696tqCejhmZxi0mno9V2ZvK+CfL8kO1gqsIWTt1lm
         lpe5JD50gmAF2/QiFi4B+jOrxuj8CXTvBFh4myZluL4aBQEZyUyraUT8wbl2sM+tCKwp
         fdlSvxGusYYcaFZwIOTTygQXrxwTutr7EIGpQeHVjH1VgU3CsbMsFEu1WrihW/i743OS
         QVlH873sg0cIOmSRD2GJYX5fvOfGyUi4HT7JzMJ1lZFA+uYll424jMdIRvxjX15Lzrc8
         a3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lsn56pxPLZU351QYQn0nyUl+5C+c+5Byaba7lRhCMeo=;
        b=rurdY3AeB86hnzwG0pfi3l/9clwTW2oioJPxTexSLqarizrIVU8nAGQfKfNFAP7PUj
         DLrPBWa5UmXyKXgzoES61AzrZUCeL5mzOeqaPBM/DGoJIoWYCJaD0eN3b2qheV2+V7hC
         UpJbQaTsaqApwfhxmzR2yBxJ/tFYZuhMSxBMkezkGOVoi1ph94o2vtcQ660WK45KoVgF
         RHQheVgnJyINes8AYoFr5kIsLjYDD3c2Oa8DXYot9xSRkc6OBOmBgjv6iw6HkwA8F2mu
         hQMnKkTPSafj9T6iyw2OvVswXUJI/dlYe3S1deKwLcQEiNBZA5ZcOd+g7BKUQy0BdHDg
         NfzA==
X-Gm-Message-State: AOAM533oR7it0Vvdo6FmnAEgHlq01/b5z9GlfkvgZBZFRa5sTZ3hVMtY
        qCjRCWuiwUpRxB9vaXm2c17aAg==
X-Google-Smtp-Source: ABdhPJyCiQ8F8q9Z/wpt0QvvtXY64d/69gKeg+jd/iqudpfKRIdptcNlqLStox6xIICNjbpsNc7PDA==
X-Received: by 2002:a4a:b501:: with SMTP id r1mr15021788ooo.20.1634422617017;
        Sat, 16 Oct 2021 15:16:57 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id d15sm1747058oic.32.2021.10.16.15.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 15:16:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/7] drm/msm/dp: Modify prototype of encoder based API
Date:   Sat, 16 Oct 2021 15:18:38 -0700
Message-Id: <20211016221843.2167329-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Functions in the DisplayPort code that relates to individual instances
(encoders) are passed both the struct msm_dp and the struct drm_encoder.
But in a situation where multiple DP instances would exist this means
that the caller need to resolve which struct msm_dp relates to the
struct drm_encoder at hand.

Store a reference to the struct msm_dp associated with each
dpu_encoder_virt to allow the particular instance to be associate with
the encoder in the following patch.

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- None

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++++---------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0e9d3fa1544b..b7f33da2799c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -168,6 +168,7 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @dp:				msm_dp pointer, for DP encoders
  */
 struct dpu_encoder_virt {
 	struct drm_encoder base;
@@ -206,6 +207,8 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+
+	struct msm_dp *dp;
 };
 
 #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
@@ -1000,8 +1003,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp)
-		msm_dp_display_mode_set(priv->dp, drm_enc, mode, adj_mode);
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS)
+		msm_dp_display_mode_set(dpu_enc->dp, drm_enc, mode, adj_mode);
 
 	list_for_each_entry(conn_iter, connector_list, head)
 		if (conn_iter->encoder == drm_enc)
@@ -1182,9 +1185,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_virt_enable_helper(drm_enc);
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		ret = msm_dp_display_enable(priv->dp,
-						drm_enc);
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		ret = msm_dp_display_enable(dpu_enc->dp, drm_enc);
 		if (ret) {
 			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
 				ret);
@@ -1224,8 +1226,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	/* wait for idle */
 	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		if (msm_dp_display_pre_disable(priv->dp, drm_enc))
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		if (msm_dp_display_pre_disable(dpu_enc->dp, drm_enc))
 			DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
 	}
 
@@ -1253,8 +1255,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		if (msm_dp_display_disable(priv->dp, drm_enc))
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		if (msm_dp_display_disable(dpu_enc->dp, drm_enc))
 			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
 	}
 
@@ -2170,7 +2172,8 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-
+	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
+		dpu_enc->dp = priv->dp;
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
-- 
2.29.2

