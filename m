Return-Path: <linux-arm-msm+bounces-77184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BD0BD92D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E738188C56A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7FC2BEFE3;
	Tue, 14 Oct 2025 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hODl7Rop"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB55512E1E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443245; cv=none; b=KzQeaGAhN7aebYS0gpOAQLO4PMq8NKUhRMOhoI9ZR6D7DNZPY8AbTHeDRcvDvbwqqiioAeyf8pbbhkx2IUNRFIPVC9Y2qki3F3TrmzzZFBmy7avhnG3sp8f0wfwqLkIikYw/h0S3+SzdqYRC2h6Lo0CIQSUuoqKgZv86Bvm2xYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443245; c=relaxed/simple;
	bh=muR8akMYIBsJHxWXSGrYJ0fpHlj2lMjBV6pX18Dssto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kscidvh8nRsyy/QA+PARihZk/oFZgbMO8x1rUq8k9wYwfWKqGZljyG9rZYJq4tvFIZQczOI0KU7d4rJgKLXOKncquxA3UhOFzQHs32kWIIBmvYErmLVhwaD8hFiaIaVkoHR82j+ISPVilYkm1Mfg8GiAUHMsme/RdjS/AAicUoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hODl7Rop; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDFCC4CEFE;
	Tue, 14 Oct 2025 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760443245;
	bh=muR8akMYIBsJHxWXSGrYJ0fpHlj2lMjBV6pX18Dssto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hODl7RopVSuYFVJL2sbvmlOw6dRuUzMmuqBhmJS2H8JFF9zSC1KMWrRR4YyXgu7oI
	 qVx7J+hZxwiKFgAZxq3/hVBZN9G2MxkKG1WkzIcanJgWFZLv/3V0ZZEgIDQEAABUI1
	 6k6jahcVRlhP4cQJMMJl0FmNU+iZSqCi/DUweWeSZTNqMCE82zV+GnrsfcZ/HmHmjb
	 YwGIt7JJWj4hUceRzArl8WiT/GYH2Ch2idpapJbnSXo4WUybnBcpsYUSv2R2edaniB
	 OLAQrgfDDMfPjCENo2i+ZRXo7pGPVUeuzXZSaRmULfpSPrboncTUB3n4cVRFF8Soys
	 viYIjHN7VDVug==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:55 +0200
Subject: [PATCH v2 11/16] drm/msm: mdp5: Switch private_obj initialization
 to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-11-6dd60e985e9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3578; i=mripard@kernel.org;
 h=from:subject:message-id; bh=muR8akMYIBsJHxWXSGrYJ0fpHlj2lMjBV6pX18Dssto=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGjuO0ijdNBxMH9YHc6vQGlbS7gX6EPAOxcDevfBhxstAIhUr
 oiVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmjuO0gACgkQJ1/OGaI9vnacMQF/QMzq
 kTd1YPXQjp6fpoDv6eJit32OrH0k07VtsUYpCV24FnxmQmvCdNTKk0TYXR9ZAYCOZvJFtlxJRIn
 GTvXrZ+2VAXzMVj7PAIRlD/NWzIY3L1Dv/ynIvZwq8GAcR0rzX/Y=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The MSM mdp5 driver relies on a drm_private_obj, that is initialized by
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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 41 +++++++++++++++++---------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 5b6ca8dd929e1870b7228af93da03886524f5f20..80e1a331dbf7deae4f039ddcae1e5770e882728d 100644
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
2.51.0


