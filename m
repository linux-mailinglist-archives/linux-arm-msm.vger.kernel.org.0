Return-Path: <linux-arm-msm+bounces-77185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B5BD92E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2158D3BE99B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2F22417E0;
	Tue, 14 Oct 2025 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fS+VbDCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ACB12E1E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443249; cv=none; b=M8CZZzNsKKnuI+71IGhast/6/HlML0TrDpreky8Maxb7VbJ83kyf6uHtBCElg9iJ01wIyll2Gu7fMCH+IdmZtxNfVMwGunuP/ETo4w73A3Q8PbrB8EAguLOFeQRaj0bWHsQXyaLFvDiJzeWrihyUYELbP5kBHL9WqhTYVdvbey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443249; c=relaxed/simple;
	bh=jAIW3dBL6UYMjB0mOSoCqB+njMs2MEvG8K+bjNkUqX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSLj2CL7vLpFzK0FiJMeCNptpt0ugxNPLLP71E3wvf7C+3rZOxM1NmSm+G2HqA2L9wydCk/BIqPlJg95jsAEYal0XXgcA3MKxhqY3B24QlM98PflIr+Q65y8aGPLCmDQJLKNRr+qEHTjeElY0A6Nw06Uw+blWzpcccLSoM3WaIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fS+VbDCl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29059C4CEFE;
	Tue, 14 Oct 2025 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760443248;
	bh=jAIW3dBL6UYMjB0mOSoCqB+njMs2MEvG8K+bjNkUqX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fS+VbDCllR8PL3z+RrWO/4Xqs5SLYrKDf62ZkV3q0llNEMyBaIOMffpIHxbpLSzp+
	 /8m3ggQt+gDcsxJ2VP1QMXhWXKRm3VfKwaW3q1+ai6iDy4cy37QjpI4YHc9zfe+mDx
	 6tej2bR/iQKVE73hL9VYQo0o/04f8BUI4z05uXvirSg0BVERyNNuGXufKWTF/Hy35d
	 qkUtJqvfT21p8aIrB62qa+wJW0+SF6rhR1mHm4NRdoOdi2LtyWq9eYIKLHd8EaVV7q
	 pRBqWKSkJVWEKLEhcV9td4lGGjFolOvJvXPowm8wsv47e7UvadmbypO/Zj2VK2j2z2
	 OWT3dU31Uyl3w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:56 +0200
Subject: [PATCH v2 12/16] drm/msm: dpu1: Switch private_obj initialization
 to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-12-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3469; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jAIW3dBL6UYMjB0mOSoCqB+njMs2MEvG8K+bjNkUqX4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrD3ubWFyEA2J5vh3mDes+Nue8sX2pb8sd+lwrd/5j
 j9f8mZ1x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIP0bGejfrxqQnLT7dnV2/
 XSbd3hb73GJ64D3uOcyaa+XOf7gYoNx6rnlJ6uE9zHLpr9/G8G6RZ2xY/uKzoeJLxaaivm/WRxL
 rA/P6Fy/3tO2TWx/Gpx8bf/WAqujSqNpHgWFpSbqp7W3PTAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The MSM dpu1 driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---

Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 42 +++++++++++++++++----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a306077647c317af9345eeff13082230906b5767..28a79e7836c0fb5c3f8a27ea5dda6f677e330bf1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -365,41 +365,43 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
 	struct dpu_global_state *dpu_state = to_dpu_global_state(state);
 
 	kfree(dpu_state);
 }
 
+static struct drm_private_state *
+dpu_kms_global_create_state(struct drm_private_obj *obj)
+{
+	struct drm_device *dev = obj->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
+	struct dpu_global_state *dpu_state;
+
+	dpu_state = kzalloc(sizeof(*dpu_state), GFP_KERNEL);
+	if (!dpu_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &dpu_state->base);
+	dpu_state->rm = &dpu_kms->rm;
+
+	return &dpu_state->base;
+}
+
 static void dpu_kms_global_print_state(struct drm_printer *p,
 				       const struct drm_private_state *state)
 {
 	const struct dpu_global_state *global_state = to_dpu_global_state(state);
 
 	dpu_rm_print_state(p, global_state);
 }
 
 static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
+	.atomic_create_state = dpu_kms_global_create_state,
 	.atomic_duplicate_state = dpu_kms_global_duplicate_state,
 	.atomic_destroy_state = dpu_kms_global_destroy_state,
 	.atomic_print_state = dpu_kms_global_print_state,
 };
 
-static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
-{
-	struct dpu_global_state *state;
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
-	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
-				    &state->base,
-				    &dpu_kms_global_state_funcs);
-
-	state->rm = &dpu_kms->rm;
-
-	return 0;
-}
-
 static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)
 {
 	drm_atomic_private_obj_fini(&dpu_kms->global_state);
 }
 
@@ -1156,13 +1158,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dev = dpu_kms->dev;
 
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
 
-	rc = dpu_kms_global_obj_init(dpu_kms);
-	if (rc)
-		return rc;
+	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
+				    NULL,
+				    &dpu_kms_global_state_funcs);
 
 	atomic_set(&dpu_kms->bandwidth_ref, 0);
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
 	if (rc < 0)

-- 
2.51.0


