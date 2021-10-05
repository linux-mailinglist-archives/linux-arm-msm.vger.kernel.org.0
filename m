Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8192F423436
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 01:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237010AbhJEXNh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 19:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237004AbhJEXNg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 19:13:36 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B0AC061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 16:11:45 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso859826ota.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 16:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QY6GPV7em6GbdB8QFPFMnV8IsR7GqgdiCnHVLm46JKo=;
        b=czbLVy7V4PxpBxtM39OBGKdVsp1EBS0V2rOJh687j2I5NU8BFibGHkyjzLQylrpFeS
         C5uWNCNC0csiCj9oKnTfmeI03B7OTz0j0Fx6sfcM+JMtC5OGccTLtV1pltTeVWHaUrX2
         xiYupSUx4qNArEUiuo5oUcoG8lWYueNpcDbgc3SmZLddjfLSvOmJrXvpvATD7qMvZA6i
         YZfK3clTJA0UAYiWn8MOa2rkKbltJu0y/zVm07mA2+UtCOgAqX7KBjTJSs4JSi9KZHwG
         y4sOn2Ka9WFXrfwJTQk3CS2hdP+zWwtD6PPHHuNl/wr11qzuXeKjv2x0/7x+1DmhqLzy
         MGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QY6GPV7em6GbdB8QFPFMnV8IsR7GqgdiCnHVLm46JKo=;
        b=rSJ09DE5YABZpRi/xpkfjbaD2OOv7wTZi+S2vMCtHwT3Tc9hAguTOEAdfo6hGbWHaK
         Z3cVVtVcSoki4xXVXGjtGc006PrjKhfFEq9/LSSg/SWlmvytBMmDG8m+dbH0teptl7g5
         U6Q1IiuO23clwvgDbmIwD8ZNg0OmfJElaMUcYsSHcBQ3W6lyRRmXqQmzAKen6r5Fd+KF
         niYjXY9vumsGuxnnOcjbqC9YD7FrxFyDjpso0w0MAjiyWbnPoTp/6/j3EwyOcxhBU9IV
         drVizlzffplCFcVhKOgOcAwsrxn6I/9cK3kgMx9BAFjVpsLQzLRBNUUBZGbaHI4R0VF5
         MvkQ==
X-Gm-Message-State: AOAM531M8L5SWgXUYuKINgkug9yeHdB+0WnZDcqwWad+Ec/T9ow1vqzb
        niuMMlCp9Wtkp6F4gRh1XmGo9Q==
X-Google-Smtp-Source: ABdhPJwD0AaMshuxf5mwUFQg1Ze8PZVFCcNRnWko9+y+GAS8si5vpCjDPkxI0UyQEck6+/ADZ7m4bQ==
X-Received: by 2002:a9d:6c52:: with SMTP id g18mr16422705otq.75.1633475504618;
        Tue, 05 Oct 2021 16:11:44 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id v9sm1665141oth.62.2021.10.05.16.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 16:11:44 -0700 (PDT)
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
Subject: [PATCH v4 2/7] drm/msm/dp: Modify prototype of encoder based API
Date:   Tue,  5 Oct 2021 16:13:18 -0700
Message-Id: <20211005231323.2663520-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
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

Changes since v3:
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

