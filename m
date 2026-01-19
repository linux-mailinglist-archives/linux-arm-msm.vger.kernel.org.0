Return-Path: <linux-arm-msm+bounces-89673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F84D3A97E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEF083007275
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88B531D750;
	Mon, 19 Jan 2026 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBplRgoo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B46314D0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768827039; cv=none; b=MDLGMqHI44UxXra1kGWhWw7s1wxwq4/LoijhivXUPDDkMxUa570ufLtyRZkpfOSlop030tVQvKv+bg5wpR1NuZhB3tpSzuXDsLnzdU2XqK1HEHMMDxv9KVWIQYDew0qfmdH0nOZXtIJMPWfiu32foTIycfhC//m0mxWtKGl7hXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768827039; c=relaxed/simple;
	bh=SAR4DfPJD3TKkpeD6a81F0d/LFgqYTJUZhxwwVbTssQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpyViC2sOh2//r1xtaj27tEmUOVAaf1aOFHD6ha2D+N4uqIs13bHg7iFsajpGFkKG2fzz7t+GgvOjn3rBYpB286eu7nPxnarM8fqtZC+JAmLKIUCNtaVeoQVw2A6EGAe4GijbbrmCk+Vs6YzhwpePm6bkKAdSp1N8Ow0eOW760s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBplRgoo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4301EC116C6;
	Mon, 19 Jan 2026 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768827039;
	bh=SAR4DfPJD3TKkpeD6a81F0d/LFgqYTJUZhxwwVbTssQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XBplRgoo4mPLabI0HAVMEJfIYWfeJmyKUpWj69Ek3meSxOKaiYSEwSmISTqVBv70y
	 4oYRPwequ2ZSJA/w5WbGUrxA654JnEZlI3uzzHs10y3kD3KMRUDjNFAgCDNG1yu94X
	 4AsBMrLjlddWbvWbsCsacE01jJeimCsqXcG0ZFst7Jq57RRIGTligBKgjlmJI7qdlt
	 9TpARkHrKSnkDT0KcimxlInBUqIub6oSlNMwila0juU7YSIV2Wy5RyKukzm7SaVfxb
	 uXCUHqllX64AbP1AODOmkJ4MQlrn8hhGQq3fC2xu3wI9A8MEDqB9u8b0kqlgXADe2E
	 ObghAq4mOa0Xg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:06 +0100
Subject: [PATCH v3 10/15] drm/msm: mdp5: Switch private_obj initialization
 to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-10-b931abe3a5e3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3643; i=mripard@redhat.com;
 h=from:subject:message-id; bh=SAR4DfPJD3TKkpeD6a81F0d/LFgqYTJUZhxwwVbTssQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GnXMB5TnWor3nLR6vqrZ+Eb7B9Uk/cvNp946N8m8M
 3642sW7YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExkGx9jw/OHk7Pm2Zzgs1tR
 qFL5mW8dw68lX/VZX1+UNhBVPq/ZKbTS+tW52QL/Jq9Qivn22upaA2OdakX0v6XGz15v3CuwZtf
 LNRlf+rQ17e/vexH9MvKIsdq0D7sSrqr4rLNf8Szf9tZfRycjAA==
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The MSM mdp5 driver relies on a drm_private_obj, that is initialized by
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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 41 +++++++++++++++++---------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 61edf6864092664afe474cc8d1fd097ca495ebb8..1fc9671590762b800bdeb6cd440b1ae6ee634679 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -112,41 +112,44 @@ static void mdp5_global_destroy_state(struct drm_private_obj *obj,
 	struct mdp5_global_state *mdp5_state = to_mdp5_global_state(state);
 
 	kfree(mdp5_state);
 }
 
+static struct drm_private_state *
+mdp5_global_create_state(struct drm_private_obj *obj)
+{
+	struct drm_device *dev = obj->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
+	struct mdp5_global_state *mdp5_state;
+
+	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
+	if (!mdp5_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &mdp5_state->base);
+	mdp5_state->mdp5_kms = mdp5_kms;
+
+	return &mdp5_state->base;
+}
+
 static void mdp5_global_print_state(struct drm_printer *p,
 				    const struct drm_private_state *state)
 {
 	struct mdp5_global_state *mdp5_state = to_mdp5_global_state(state);
 
 	if (mdp5_state->mdp5_kms->smp)
 		mdp5_smp_dump(mdp5_state->mdp5_kms->smp, p, mdp5_state);
 }
 
 static const struct drm_private_state_funcs mdp5_global_state_funcs = {
+	.atomic_create_state = mdp5_global_create_state,
 	.atomic_duplicate_state = mdp5_global_duplicate_state,
 	.atomic_destroy_state = mdp5_global_destroy_state,
 	.atomic_print_state = mdp5_global_print_state,
 };
 
-static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)
-{
-	struct mdp5_global_state *state;
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
-	state->mdp5_kms = mdp5_kms;
-
-	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
-				    &state->base,
-				    &mdp5_global_state_funcs);
-	return 0;
-}
-
 static void mdp5_enable_commit(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	pm_runtime_get_sync(&mdp5_kms->pdev->dev);
 }
@@ -711,13 +714,13 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	u32 major, minor;
 	int ret;
 
 	mdp5_kms->dev = dev;
 
-	ret = mdp5_global_obj_init(mdp5_kms);
-	if (ret)
-		goto fail;
+	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
+				    NULL,
+				    &mdp5_global_state_funcs);
 
 	/* we need to set a default rate before enabling.  Set a safe
 	 * rate first, then figure out hw revision, and then set a
 	 * more optimal rate:
 	 */

-- 
2.52.0


