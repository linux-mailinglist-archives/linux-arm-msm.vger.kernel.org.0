Return-Path: <linux-arm-msm+bounces-36340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6859B53AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 21:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCABEB21ADC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 20:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93868207A3A;
	Tue, 29 Oct 2024 20:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XT+slQHH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4407209684
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730233718; cv=none; b=aCQNQE3R2Bu/3PzTNqgx4yP3MQRN52RPer8c5OyR0rYisuFwMiu3xMZ8sr1++k3KEcUwkkqiuAN1IZ9uvBxI9HEskS48U12/bSBHP+7IymePRlQ/+d3X0hzcuAvlEydv2i0PGeuxeXSZ7fcBNUp0EkRKVquRsu7yN0P6d1ZIvXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730233718; c=relaxed/simple;
	bh=F+8jifR+xPt2YPVuJz3hU8WMRLTwfsEcnnvlZI6xjCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ss39wn+YEZUYLN++vJ2Ht178nODG5nPyKlJlRlWgNxhTG6XmNe6dogOVwF0B5stDCdnQpVF35DjFmd0NTQ5LUPRxQY9a5Vq+Twp19p3jqdFUVnSK72DsnaWH1mcdynkqNLi8tLoksSzmjTnbPwPPFgG/1FdjQoHKXaEiMpGYfW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XT+slQHH; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53b9406ace1so429622e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 13:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730233714; x=1730838514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okL6Htptn3WmNRDIbzbj3SlxrMQsUP6Is5kTunjhLD4=;
        b=XT+slQHH0QM/KtpEfBtoF22wTvnHBw5awCA2PJFOl1RvNo8/5wYJWfqZR98Zqwj1Ex
         GGCftNdHcHqP/MtgfWRTOvE1+7rNMI2GkTwCl3a7fYD8ri492dhdhUI7v5GHHBBihaAo
         j2efGAB94bIy5XPN4dEofFzjDAsOpL+zx/Gn+ohCbBCy5cGCt6N6/rpNPkcoMRD9IZQx
         FM+musgivAP/ybciL43HawWT3cfDzBQVfCawN3PPfkJHD9xiUiuGutSMDT9BAhQ6IXQq
         uZ5RrvMmZF1m5FT4nKDV9uQ6dgaWJ+A67X1j5QwxAXE3uYp1D+ARtUpKQ7+Yeuv/3Rne
         +tzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233714; x=1730838514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okL6Htptn3WmNRDIbzbj3SlxrMQsUP6Is5kTunjhLD4=;
        b=FsYhNo5g8JUANMgqN2i+rjsrrK8IAFjrj7d7cv6eqMMoRUXrLVLWyoZoZ8FOo1velb
         SlvXk7EDGXpZshSlOZ/DX8HvkGD8EQmGuu6SmD/kaOndeuvMiAFQUjaYKhM5XgNPhXSo
         6t0LoOrSCHo74uuCWtJ7gJhziNwdY53TA6ipFO96sgCRK7UFqgA8BUTQUd17QL/DUMVw
         ezppGg2tCaLi1b1r1pO785sMYODybwksqBfCYbQ93Hjzgit6Pi7KI2SCY9J3xELGH3Lw
         sugMajfK0QG+lldmHMTAw3ETmH/iBhm+miNGuuJExENX4twpzp4ROwoHs/L/WLLBpjEp
         ChOw==
X-Gm-Message-State: AOJu0YxLb4jf4rjgv4Lbh6a/zRWe0w5rrp3RaBJP5JFXpcoPXCGaJJye
	bfG8OQvRA4QYDKQP+EOnaUKv3jxesAgTch6AovHfXGm3qOhfGLc61/LdvvsaWpA=
X-Google-Smtp-Source: AGHT+IEGGoPq8Pa3p6m1L3sUcznppS2fepgRVEY6jETOOfJxL5W0VkhZKZXj/xj79xujkJe5wpdemQ==
X-Received: by 2002:a05:6512:3d14:b0:539:fc86:ce0e with SMTP id 2adb3069b0e04-53b348e58c7mr6398176e87.35.1730233713882;
        Tue, 29 Oct 2024 13:28:33 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb81a597fsm46449e87.96.2024.10.29.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:28:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 22:28:25 +0200
Subject: [PATCH v2 2/3] drm/msm/dp: rename edp_ bridge functions and struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-msm-dp-rename-v2-2-13c5c03fad44@linaro.org>
References: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
In-Reply-To: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=F+8jifR+xPt2YPVuJz3hU8WMRLTwfsEcnnvlZI6xjCs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnIUVs8pWc8w67OUVciezGOH4i6/g69J03OEa/G
 kCw7sVcWOSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyFFbAAKCRCLPIo+Aiko
 1W8pCACtflGcGZZiN1kFzjfpSrI1bUCnzAkG9wwFNa6jeRpIhPRHtnXsNmgSUJnhsjpyBZvMjtH
 Wwc5E9a540J0L6d9BzZvxzjVzzv4G0Gc4HU24yKauG5CdE2MZ1uCBTBjBBWn8w8lwtjWLMdsbzW
 OHhP9EfzDdvloKZkdDVe1ymT1Qe9XQ9lqduH1wO49a6qpmJO5K28+kVR2MYnhCrb5fh0XmqwkZU
 LQI8ZE6kIRbzyIyb1E/bULQZgKBYAS9tLl7hA2zV8iRHxgIAjnOn1yEsZvwhvnD3tdQZoTla2wt
 CL/5S6lDMMm0akifTXizP1Ak/+Yd+BJbcbZ08DtV+1+mBrZA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the estalished prefix and rename eDP bridge symbols to use
msm_edp_ prefix, moving the edp to the end of the symbol name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6a0840266c0f..d3e241ea6941 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -115,7 +115,7 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.debugfs_init = msm_dp_bridge_debugfs_init,
 };
 
-static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
+static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
 				   struct drm_bridge_state *bridge_state,
 				   struct drm_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state)
@@ -136,7 +136,7 @@ static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
 	return 0;
 }
 
-static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				     struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -147,7 +147,7 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	/*
 	 * Check the old state of the crtc to determine if the panel
-	 * was put into psr state previously by the edp_bridge_atomic_disable.
+	 * was put into psr state previously by the msm_edp_bridge_atomic_disable.
 	 * If the panel is in psr, just exit psr state and skip the full
 	 * bridge enable sequence.
 	 */
@@ -166,7 +166,7 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	msm_dp_bridge_atomic_enable(drm_bridge, old_bridge_state);
 }
 
-static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 				      struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -194,7 +194,7 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	 * If old crtc state is active, then this is a display disable
 	 * call while the sink is in psr state. So, exit psr here.
 	 * The eDP controller will be disabled in the
-	 * edp_bridge_atomic_post_disable function.
+	 * msm_edp_bridge_atomic_post_disable function.
 	 *
 	 * We observed sink is stuck in self refresh if psr exit is skipped
 	 * when display disable occurs while the sink is in psr state.
@@ -211,7 +211,7 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	msm_dp_bridge_atomic_disable(drm_bridge, old_bridge_state);
 }
 
-static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+static void msm_edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -228,7 +228,7 @@ static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 		return;
 
 	/*
-	 * Self refresh mode is already set in edp_bridge_atomic_disable.
+	 * Self refresh mode is already set in msm_edp_bridge_atomic_disable.
 	 */
 	if (new_crtc_state->self_refresh_active)
 		return;
@@ -237,13 +237,13 @@ static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 }
 
 /**
- * edp_bridge_mode_valid - callback to determine if specified mode is valid
+ * msm_edp_bridge_mode_valid - callback to determine if specified mode is valid
  * @bridge: Pointer to drm bridge structure
  * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
+static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode)
 {
@@ -268,24 +268,24 @@ static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void edp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+static void msm_edp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
 {
 	struct msm_dp *dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	msm_dp_display_debugfs_init(dp, root, true);
 }
 
-static const struct drm_bridge_funcs edp_bridge_ops = {
-	.atomic_enable = edp_bridge_atomic_enable,
-	.atomic_disable = edp_bridge_atomic_disable,
-	.atomic_post_disable = edp_bridge_atomic_post_disable,
+static const struct drm_bridge_funcs msm_edp_bridge_ops = {
+	.atomic_enable = msm_edp_bridge_atomic_enable,
+	.atomic_disable = msm_edp_bridge_atomic_disable,
+	.atomic_post_disable = msm_edp_bridge_atomic_post_disable,
 	.mode_set = msm_dp_bridge_mode_set,
-	.mode_valid = edp_bridge_mode_valid,
+	.mode_valid = msm_edp_bridge_mode_valid,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_check = edp_bridge_atomic_check,
-	.debugfs_init = edp_bridge_debugfs_init,
+	.atomic_check = msm_edp_bridge_atomic_check,
+	.debugfs_init = msm_edp_bridge_debugfs_init,
 };
 
 int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
@@ -302,7 +302,7 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	msm_dp_bridge->msm_dp_display = msm_dp_display;
 
 	bridge = &msm_dp_bridge->bridge;
-	bridge->funcs = msm_dp_display->is_edp ? &edp_bridge_ops : &msm_dp_bridge_ops;
+	bridge->funcs = msm_dp_display->is_edp ? &msm_edp_bridge_ops : &msm_dp_bridge_ops;
 	bridge->type = msm_dp_display->connector_type;
 	bridge->ycbcr_420_allowed = yuv_supported;
 

-- 
2.39.5


