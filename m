Return-Path: <linux-arm-msm+bounces-36156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6DB9B2F32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 12:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 326781C212E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7167D1D7E4C;
	Mon, 28 Oct 2024 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qtA07yv/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D408F1D3648
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730116166; cv=none; b=A03jfjWRJs12KZHYpFU7hs7orz7fLXtGOJEdVUn6ctxg/dy/QR+WTd1psfxZ2/wIF39WBuhouOh4a2J9dnB/DLxdyAdxAP7mPdGDEiWn9x0/qovVODBYQoMBJtv4IevgxxakxDj9i7pGSL1EUuBonHdbLRxxDejelw2gYxCBcLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730116166; c=relaxed/simple;
	bh=VcEaWSEj4fkAOPz67z969jHnCNLhbQcbOf0NHJf7h0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0eKTFE98ESo38McAvstkkD0VSmTZOdMgTXH1g7C/YQU1TlV4QQM6CFkzXpW6h3sn7ahb0dr19Fl27zEtcwLhh1SL/T09C8swRYtsVy44x7Ilm9n8KOQ6lqHyTS1v52fUdkHbv9uJU7fLtYBwPiXgju6YKDAXdEoIRZUnebSoo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qtA07yv/; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb58980711so36563841fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 04:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730116162; x=1730720962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywWb6UG3R7MbDFwKiKVkTMsZ23NPlCDkNt6Bjg3cqTk=;
        b=qtA07yv/YtPLnnfkHtglwtBXWWKv9wShNVHhoS7X1s5scxctvqGUfmdfHn4+s5rv9i
         ssb3n1RcO99Yy4Y1hCJwVdci2qSl4V3S94inu5mpIZcZNhXY2xfl5eoIe488y5Qy0Z/E
         YPyo3Rwxd6LF6VOVOYjr16Dz3MdWUvqCgBYQBoPIRgD+Bq5qqGMV6dd5Jici9Ko2zGPt
         q2wCo+pHFqyvwtSOUbcicS93PMLTHhciIRyx6CRg1GWdehoZyr8QRsrpRbIHf5CgKbrJ
         GgxspySdnNRyFZHvNRYRGn/LKkIosvhT6U2D+0D4GI/oIbHcEq0+MXq/IUr6ViEAVHXq
         z2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730116162; x=1730720962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywWb6UG3R7MbDFwKiKVkTMsZ23NPlCDkNt6Bjg3cqTk=;
        b=Z3DmW02/IeoyP3GTqN3wtsgXQAOONw1oCjTP71XfyPj4zXOAcNgJpv5f8p19rY/4kC
         3ndAQn60YD6V6h+U0iDTsRejMY/oF8HzsssgX2vmHeRWKnJHOyB7vEcS3NltqWeyN8eq
         Itkmyy/HAEuS3pOBDjqd9LUp32WjBmFG8p5x0Wv4mZTUGZhecw62HM/mwXHmOAWejoYQ
         KLGIqLfHkEAdk2LgKLR8yhrwBhzQgvQbyO9vjXWSDUP1AE7hXSMvx20/5gSU9ErMyejd
         ewZs2/OyffDzli/RykNKuEjGVNm7qHTYAhAhL4IS/TKDGn23X4sdmpSPwsz1k20uWUKq
         CM4A==
X-Gm-Message-State: AOJu0YwczxRuljrHU5DMsdpb2W0QIOr0A+MwreWNGqIExYGN+N+lL/TR
	kAyEIaHtgk9yvNRzNW1mgTL8pzLVcQ9z+B9sfGA+MWKiXvThpKhTwFEHWVcMRI8=
X-Google-Smtp-Source: AGHT+IHsK96DIputJTSrSnNgco0JesKaJqeZ6HX5dUgWhWKP0bivQgrJXq2ZKYwF5m6W07BmG80sYw==
X-Received: by 2002:a05:6512:3ba0:b0:52c:e17c:3741 with SMTP id 2adb3069b0e04-53b348b7c07mr2947300e87.5.1730116161956;
        Mon, 28 Oct 2024 04:49:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a5c6sm1042385e87.19.2024.10.28.04.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 04:49:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 13:49:15 +0200
Subject: [PATCH 2/3] drm/msm/dp: rename edp_ bridge functions and struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-msm-dp-rename-v1-2-a2564e9457b0@linaro.org>
References: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
In-Reply-To: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6119;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VcEaWSEj4fkAOPz67z969jHnCNLhbQcbOf0NHJf7h0k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnH3o93re7sCpk52kOEh8zbQcpdPG1Me4BLl5n7
 zlGXzsPuC6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZx96PQAKCRCLPIo+Aiko
 1WHHB/9RlC/AJyhc1rQ8t1qwPKTy9caNxibdStUe7hoyh2MrFwVMItiD8zpBzsFLBcCbsHX0axW
 KtZWH5yOxHdx2DTh4AaSd0K0VevhKCIZitqsyPNi6vZofxGe+aH5ak3MM8/f4XIT6yDHIpQCK/F
 R/tnSGLwvBrS7HZXM1Cr/eRK46WV9Farr3XouIxEYdApguiqlO9gOoJ6uWTf0fjuGwtiJvjEQKc
 i2e4uL58zIQU0w2qXhqhqXMxHplTZzJcdv8zNgIaoxMAoO9SrVJBp4NvNR+ovr6+Lgo2U5Zeph0
 U3ZU/jIN8HBkd1WQdDas/luESY8R7gUwaGybifQp8Y0jqh7m
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the estalished prefix and rename eDP bridge symbols to use
msm_dp_ prefix, moving the edp to the end of the symbol name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6a0840266c0f..ff9ce9b15234 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -115,7 +115,7 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.debugfs_init = msm_dp_bridge_debugfs_init,
 };
 
-static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
+static int msm_dp_bridge_atomic_check_edp(struct drm_bridge *drm_bridge,
 				   struct drm_bridge_state *bridge_state,
 				   struct drm_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state)
@@ -136,7 +136,7 @@ static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
 	return 0;
 }
 
-static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+static void msm_dp_bridge_atomic_enable_edp(struct drm_bridge *drm_bridge,
 				     struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -147,7 +147,7 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	/*
 	 * Check the old state of the crtc to determine if the panel
-	 * was put into psr state previously by the edp_bridge_atomic_disable.
+	 * was put into psr state previously by the msm_dp_bridge_atomic_disable_edp.
 	 * If the panel is in psr, just exit psr state and skip the full
 	 * bridge enable sequence.
 	 */
@@ -166,7 +166,7 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	msm_dp_bridge_atomic_enable(drm_bridge, old_bridge_state);
 }
 
-static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+static void msm_dp_bridge_atomic_disable_edp(struct drm_bridge *drm_bridge,
 				      struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -194,7 +194,7 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	 * If old crtc state is active, then this is a display disable
 	 * call while the sink is in psr state. So, exit psr here.
 	 * The eDP controller will be disabled in the
-	 * edp_bridge_atomic_post_disable function.
+	 * msm_dp_bridge_atomic_post_disable_edp function.
 	 *
 	 * We observed sink is stuck in self refresh if psr exit is skipped
 	 * when display disable occurs while the sink is in psr state.
@@ -211,7 +211,7 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	msm_dp_bridge_atomic_disable(drm_bridge, old_bridge_state);
 }
 
-static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+static void msm_dp_bridge_atomic_post_disable_edp(struct drm_bridge *drm_bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -228,7 +228,7 @@ static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 		return;
 
 	/*
-	 * Self refresh mode is already set in edp_bridge_atomic_disable.
+	 * Self refresh mode is already set in msm_dp_bridge_atomic_disable_edp.
 	 */
 	if (new_crtc_state->self_refresh_active)
 		return;
@@ -237,13 +237,13 @@ static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 }
 
 /**
- * edp_bridge_mode_valid - callback to determine if specified mode is valid
+ * msm_dp_bridge_mode_valid_edp - callback to determine if specified mode is valid
  * @bridge: Pointer to drm bridge structure
  * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
+static enum drm_mode_status msm_dp_bridge_mode_valid_edp(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode)
 {
@@ -268,24 +268,24 @@ static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void edp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+static void msm_dp_bridge_debugfs_init_edp(struct drm_bridge *bridge, struct dentry *root)
 {
 	struct msm_dp *dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	msm_dp_display_debugfs_init(dp, root, true);
 }
 
-static const struct drm_bridge_funcs edp_bridge_ops = {
-	.atomic_enable = edp_bridge_atomic_enable,
-	.atomic_disable = edp_bridge_atomic_disable,
-	.atomic_post_disable = edp_bridge_atomic_post_disable,
+static const struct drm_bridge_funcs msm_dp_bridge_ops_edp = {
+	.atomic_enable = msm_dp_bridge_atomic_enable_edp,
+	.atomic_disable = msm_dp_bridge_atomic_disable_edp,
+	.atomic_post_disable = msm_dp_bridge_atomic_post_disable_edp,
 	.mode_set = msm_dp_bridge_mode_set,
-	.mode_valid = edp_bridge_mode_valid,
+	.mode_valid = msm_dp_bridge_mode_valid_edp,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_check = edp_bridge_atomic_check,
-	.debugfs_init = edp_bridge_debugfs_init,
+	.atomic_check = msm_dp_bridge_atomic_check_edp,
+	.debugfs_init = msm_dp_bridge_debugfs_init_edp,
 };
 
 int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
@@ -302,7 +302,7 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	msm_dp_bridge->msm_dp_display = msm_dp_display;
 
 	bridge = &msm_dp_bridge->bridge;
-	bridge->funcs = msm_dp_display->is_edp ? &edp_bridge_ops : &msm_dp_bridge_ops;
+	bridge->funcs = msm_dp_display->is_edp ? &msm_dp_bridge_ops_edp : &msm_dp_bridge_ops;
 	bridge->type = msm_dp_display->connector_type;
 	bridge->ycbcr_420_allowed = yuv_supported;
 

-- 
2.39.5


