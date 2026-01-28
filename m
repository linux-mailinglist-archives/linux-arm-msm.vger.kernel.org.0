Return-Path: <linux-arm-msm+bounces-91020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCXsCQAFemlg1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:45:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5C1A17C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CC14301F490
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD01E33F8C1;
	Wed, 28 Jan 2026 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kX1mxfoW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3172DFF19
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604270; cv=none; b=TN6qYrMQTxLjtKmdTcBKUS3KARLBPYjRcONFL/TTvWqnzLXD0pY5hpPtFgwCv/BTgc1qgzm8O7ZGsQgzfkUe7PNlgDleX5/lMAaXYOskIx3lEOEMmhfkiEnxOis6WWN6xVi4p8Bo81kOqtIXfKkaCWVfIIoHtXAzboHm8MBVvpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604270; c=relaxed/simple;
	bh=78/Dgr8BJATQjTnMs4f5IvT6gQmHQCaTMYfyRhFNgKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zs6DxrSHzz5QyhMP4y6x7FHJHmleHw3QLRhDOxEhO6Tf58/V2R0ghoxalg3OoHfvD7dNpGbCyeuRNCJS6kJloSv76KT7dpo6uS0jef/j1LnREwLt9cp6nxR5XrAZuYuXmBlfVztTwKRADD7lkz/4EPn/eEDAWb58kp98ITz+3cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kX1mxfoW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E64BC116C6;
	Wed, 28 Jan 2026 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769604270;
	bh=78/Dgr8BJATQjTnMs4f5IvT6gQmHQCaTMYfyRhFNgKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kX1mxfoWGDWEl0zc6xhGCX4W0BBTM8W/tKDMSvJKrMPMfYMkVmFLuIhOB2vMIimR3
	 HTRzyBQpj6SMduEdfaXH9OW/dexUdiQrEzO/lRQiBesE7PH1zCnsS7vvGubwa2b90S
	 VakQUNQXHgVLkBfCW6e3FDTUJvarwX2Klwn2XKg4NWU4IpViSid55BfYPNDeH+7KXT
	 4mWwJTEVuhBu4OWCAUdTbJuYzohHKfhFhuAYOMR/WE/Ee18gcLhbdkbUT+m6SRig3h
	 ibjmyZ1pfDr+l9nZacOXFWUz6fBN42WmCUnP0ropsunRzajLCaKzx/al8yJhRvAXqi
	 uQxTlGCLOyFyQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 28 Jan 2026 13:43:55 +0100
Subject: [PATCH v4 11/15] drm/msm: dpu1: Switch private_obj initialization
 to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-drm-private-obj-reset-v4-11-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
In-Reply-To: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3536; i=mripard@redhat.com;
 h=from:subject:message-id; bh=78/Dgr8BJATQjTnMs4f5IvT6gQmHQCaTMYfyRhFNgKo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLJ1pnWtvllQ0K33sdz6y+5bLNa1P4nnhCyXsHvqp6
 yz6+PR1x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIYChjw4X3n3s+bmzabhO8
 fXKhSDYb04WQE3Hsr2+I2vdt2c3kcS2uNkDxZHq0nMqviRpaN29cYmxYzHD6O7Mh+9HgN388uOK
 Fgl5MvmOuxHg2afszxzlWDJarFjhs/6vOf2beees/PJsP2AgAAA==
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-91020-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linux.dev:email,poorly.run:email,lists.freedesktop.org:email,somainline.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C5C1A17C4
X-Rspamd-Action: no action

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


