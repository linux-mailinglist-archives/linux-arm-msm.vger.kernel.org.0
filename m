Return-Path: <linux-arm-msm+bounces-76390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C76BC4B1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D2AC4F0552
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCED2F6186;
	Wed,  8 Oct 2025 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYb/Mjop"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D12EC54A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759925082; cv=none; b=haeV7ifP2250B5IN9ybuFYssFHz/ligTjPTLxcgT+68tamaWz42Z/FHfQMcuuwk+IV5v7xs1CtLvHQNZyw0NVZKtUrZiuIFpPPLOBbxA0FUSBlkOhF1TtSy3+5p3SN4DTwuAZI/pT7zrBo3ABFMkPN+exCmg9ACZOwFqibItSQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759925082; c=relaxed/simple;
	bh=dQpb2inAQE2qi53VS4O7rZWQ0ePvv4XDjSAml3tTFxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2962F30qVb/M7X05BkPtlyTYJV6PH5tP5quIvTbf0u9/0reOVWkXTuXujMh2UXJ7jjBGAdUrlOH57JVR8B+zOe0WljMXzRLCxzmgELtibbDgeCKpqUGtACY0AqM0d3DVjQTrHrTaZcYLNhsL4brspi+sYaVTE69GKE/YpE2RZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYb/Mjop; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22037C4CEF5;
	Wed,  8 Oct 2025 12:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759925082;
	bh=dQpb2inAQE2qi53VS4O7rZWQ0ePvv4XDjSAml3tTFxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EYb/Mjopp05tLsacamO4L4ckBNGXM/zxqJdMW82uEnfE5VJBmrSd2ilqLJAST+uu/
	 R3tacZ3fEJQ4pFb7h+y6us8JUOtofSIML7g2Z5J5rsr514Bhoq3Lah9xogLd3ymt3l
	 BPbfmu2A6TU5xZgcRrmYN/A9qhtciLn+HfwCZWtbp3jHFAHLcv388usGSVeRdflqJ2
	 HLGUYqvrPvrbvRvHINI0M4wepDY/qjBg4oL/1NkbXOnPE7tdAHfNit3Q1Q3WVWqh6z
	 StHby/emEtsZ/ZWWZdMRAnnhHARPplDh8JUxhKdwEBBiLvisN85SAipq1yneVnSXyb
	 ubmdipKrWa3gQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:08 +0200
Subject: [PATCH 10/16] drm/msm: mdp5: Switch private_obj initialization to
 reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-10-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2925; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dQpb2inAQE2qi53VS4O7rZWQ0ePvv4XDjSAml3tTFxM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgs3vf1fr+j01PUXxiu/0XXHhZzd+ztVJ8L7xbv+Cb
 KUqqavRHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi1g2MDZcK66wfiZ2p0Jj6
 +dPk06b65Z3Ho71VbHxa9PwDhOoXFzww3mrYMed51syNNU80j+45xljF5NawaUoe0/RPyQoL4i5
 zM4a0d1umCK7smdi6sPbjvSIm2+Nz3n6Mk+h+0HbhWajljVAA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The MSM mdp5 driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a reset implementation, let's migrate this
instance to the new pattern.

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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 5b6ca8dd929e1870b7228af93da03886524f5f20..44aef7eb8e9073bc9a4bab03c1d6c41313c56ac7 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -112,10 +112,30 @@ static void mdp5_global_destroy_state(struct drm_private_obj *obj,
 	struct mdp5_global_state *mdp5_state = to_mdp5_global_state(state);
 
 	kfree(mdp5_state);
 }
 
+static void mdp5_global_reset(struct drm_private_obj *obj)
+{
+	struct drm_device *dev = obj->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
+	struct mdp5_global_state *mdp5_state;
+
+	if (obj->state) {
+		mdp5_global_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
+	if (!mdp5_state)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &mdp5_state->base);
+	mdp5_state->mdp5_kms = mdp5_kms;
+}
+
 static void mdp5_global_print_state(struct drm_printer *p,
 				    const struct drm_private_state *state)
 {
 	struct mdp5_global_state *mdp5_state = to_mdp5_global_state(state);
 
@@ -125,24 +145,17 @@ static void mdp5_global_print_state(struct drm_printer *p,
 
 static const struct drm_private_state_funcs mdp5_global_state_funcs = {
 	.atomic_duplicate_state = mdp5_global_duplicate_state,
 	.atomic_destroy_state = mdp5_global_destroy_state,
 	.atomic_print_state = mdp5_global_print_state,
+	.reset = mdp5_global_reset,
 };
 
 static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)
 {
-	struct mdp5_global_state *state;
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
-	state->mdp5_kms = mdp5_kms;
-
 	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
-				    &state->base,
+				    NULL,
 				    &mdp5_global_state_funcs);
 	return 0;
 }
 
 static void mdp5_enable_commit(struct msm_kms *kms)

-- 
2.51.0


