Return-Path: <linux-arm-msm+bounces-76391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED0BC4B35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D687A3A532F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55EF2F6186;
	Wed,  8 Oct 2025 12:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QX12AYWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02002F60CC
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759925085; cv=none; b=Lw0b9E8YpfUutvLJ6I0Q89U13pBb1AFYa+Xc07XtUXRvqMntWePMI7ssoXhXszFL+Mi2erX1ysZcX9Jh/lqz5eibPk6HWAUIdFc5qx6nnCpzwao7xFLPluTzDpxgMkK/TbQs8iredRJMrPgWGevdzwKICJ2R9TSji1CL7I7Mh/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759925085; c=relaxed/simple;
	bh=EEqrXHeQyUV5KhyidWTHlNQZBT90TP2mQNaogHzkeos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bo+GO9SGnU2UUJwd5A4yxzaK+dXRknKRZtg7/IT4StVonwRlNDV5C3c+4FHse0JJM+pwOKX0q4aHSvZbWXbSscAxFL1v/Wx6HcpZfeCdXJcpQf5mC9DggMWwIhxloa3x5FDnpd9DGSqJvafk7eON3WGumMc8sOy7DuCvyeRpkaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QX12AYWH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F9AC113D0;
	Wed,  8 Oct 2025 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759925085;
	bh=EEqrXHeQyUV5KhyidWTHlNQZBT90TP2mQNaogHzkeos=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QX12AYWH+LaKdhUBuEk7NBcF0Td7wWj6ZwkpF36pqVyWdFw+dVl+ChVsnVnvVouhk
	 V3fnSeulqXxaODStVWtzFLp0PWz55+v1EeJebh3eVAM9VpAqpR/q4tNpp9A4ltiia4
	 VAsYYEx+Cp1J4L2bR0iVWI3GDS+srguDptQR+zypJtfP33BauDvkEtXfvqznnyikGO
	 B00K2phiHjcnIJfsv2c16dBhsrnsXoAorR8u7XNTjsmbTHEw70Km3qK9kYmdmlszL9
	 qShW+n+ik3KH6GQeHYc6uVTBApwZ0JevilKV0e971oze6mQistFGTGod+Nxg6NU6MM
	 qu5VaFX5hmfKA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:09 +0200
Subject: [PATCH 11/16] drm/msm: dpu1: Switch private_obj initialization to
 reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-11-805ab43ae65a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2948; i=mripard@kernel.org;
 h=from:subject:message-id; bh=EEqrXHeQyUV5KhyidWTHlNQZBT90TP2mQNaogHzkeos=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgs2V931i3HpDZ/cE5f+x179On18aFjH/aECCYXXWj
 KKVrz/qd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJbF7L2NB4qLbmacLZO80z
 GwU+23J3+vEaLZkSuuxUVPklM9bur9u2nNC5LX2fO+Xt5Efaz8pUwxjry++q+lbMD90iNkOj+93
 9yZtStU7+iLSOFbks13psj/jzHxauIauyp8+Xdfn1+vIshfXeAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The MSM dpu1 driver relies on a drm_private_obj, that is initialized by
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a306077647c317af9345eeff13082230906b5767..04baf072e8510ce8260f1ec609ba8f2b22f7c11e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -365,10 +365,30 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
 	struct dpu_global_state *dpu_state = to_dpu_global_state(state);
 
 	kfree(dpu_state);
 }
 
+static void dpu_kms_global_reset(struct drm_private_obj *obj)
+{
+	struct drm_device *dev = obj->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
+	struct dpu_global_state *dpu_state;
+
+	if (obj->state) {
+		dpu_kms_global_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	dpu_state = kzalloc(sizeof(*dpu_state), GFP_KERNEL);
+	if (!dpu_state)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &dpu_state->base);
+	dpu_state->rm = &dpu_kms->rm;
+}
+
 static void dpu_kms_global_print_state(struct drm_printer *p,
 				       const struct drm_private_state *state)
 {
 	const struct dpu_global_state *global_state = to_dpu_global_state(state);
 
@@ -377,26 +397,19 @@ static void dpu_kms_global_print_state(struct drm_printer *p,
 
 static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
 	.atomic_duplicate_state = dpu_kms_global_duplicate_state,
 	.atomic_destroy_state = dpu_kms_global_destroy_state,
 	.atomic_print_state = dpu_kms_global_print_state,
+	.reset = dpu_kms_global_reset,
 };
 
 static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 {
-	struct dpu_global_state *state;
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
 	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
-				    &state->base,
+				    NULL,
 				    &dpu_kms_global_state_funcs);
 
-	state->rm = &dpu_kms->rm;
-
 	return 0;
 }
 
 static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)
 {

-- 
2.51.0


