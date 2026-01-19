Return-Path: <linux-arm-msm+bounces-89674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 098F8D3A96B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 341C230049E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A219A31D750;
	Mon, 19 Jan 2026 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gduTYoUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6A9314D0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768827042; cv=none; b=EW1lexxgObC9ZYzwBEySM54+uxCxERK7q1w/E62oYo07+JA7eqLWhOj3XeTdyI+RG7DwaMLbi30DNPJ5KkCU0SFyNnx2ZoMnmHo8bWhalcxsxnuMVkRTyUl25Kxc5UwVIhfKxi/32buuRyq3cudOVAlY4e5XPjwCdUBqCh0AizM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768827042; c=relaxed/simple;
	bh=78/Dgr8BJATQjTnMs4f5IvT6gQmHQCaTMYfyRhFNgKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omjYL94UW3oGXVIzJeOqfJzL2AROk1/59zVO9iWMVNjnvZRwQZuN+zUTJOBB33EVlGMK/Hke+ljuISR4zGjKPglvUZgGEMNbosm0KkOEd0NUb35jDHLdMDjPRbcMIEaR/OpAbxinQ+y1jwbbLk3aFk9JAdM39E3fzC6THH6NlB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gduTYoUY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D265C116C6;
	Mon, 19 Jan 2026 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768827042;
	bh=78/Dgr8BJATQjTnMs4f5IvT6gQmHQCaTMYfyRhFNgKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gduTYoUYBFzd8KtLffExHBmapLCMu+IdQWmKTU8RyGbFrahFhBq4Q19UHyYzLKBU2
	 nJvsC/VtuFhNQTdkcpOrFsr8FOBmjNQIBX4eJMlfZRwPvsWL3UK+pMupBjYoEMbTNC
	 MZz3XmivdrZu6n3V873Q7gd8fHbi6Hvc/ScRLmvmcCoqeKd2vKN3YqwnJ/uoR2a9cf
	 Gtgd/PRHkRdKJ1WjFE86KplLJi0S5k1QqWLFm75hPaVRMaNxSLiAdUTeCX8vGoa1bD
	 BIRq8msnJFvAZSXFlNyTShlNQ/irPEsoI76iHtGGVRxARhvf2Zw1xsiKMc+BElEifw
	 7DHDIAesDU7OQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:07 +0100
Subject: [PATCH v3 11/15] drm/msm: dpu1: Switch private_obj initialization
 to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-11-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3536; i=mripard@redhat.com;
 h=from:subject:message-id; bh=78/Dgr8BJATQjTnMs4f5IvT6gQmHQCaTMYfyRhFNgKo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GnUf5oq8Nvo5PZ1V/K//7l/vJ27SubdlkUZSeJW6A
 /tmleayjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRtumM1WxRGzZ6mWXW2sUr
 JAn8ufiSS35Xx20fJy77041bo9T/vMr99MhhyeJkJufAO4E3DUz/MjasE2EsTd8q/1Bx96ml65l
 3tKSE8mW8T9+utprhunSSR6fq0/WXk51q5v8WF1o7XXdx4ncA
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The MSM dpu1 driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
index f4c9767c418d38eb487934da03b352ce7063df16..e33995a9522d2a9e8d0627069f7b5f44902278de 100644
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
2.52.0


