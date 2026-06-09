Return-Path: <linux-arm-msm+bounces-112160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vh82AgwFKGqi7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:20:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B93865FFB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:20:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=dHdgXvPY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112160-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112160-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACE913066269
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4995340C5CA;
	Tue,  9 Jun 2026 12:13:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC6E40C5C0
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:13:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007206; cv=none; b=tCaVV8AXI4Ec4VjQiwIKGOpe2PJQ5X6YGKPhb/Ei5e1IEIlp37wgb+Bkm4FwFe1Jh1d2u+/bvmg/jQtT3ImP0UoUYa+upT7OWVCd9B9P3AIU2V+R7Sbqakvhi4EUfAmjnQypMQ0y2m5sOcgBRHO6t+0C90IL42bauCZGDssWD3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007206; c=relaxed/simple;
	bh=mgrEOODszckkiaDQ+fORfgRKar/Hk52ptq0PkZ1yklA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFH8I2rt99JjS02Fhm+JOjrcL7gDl2IBBbgDLrTuMWHnk366hSx/U4SG5V/fIuAKvGBI8IeITJH9rLG8gUhPTMiK2KkqymTuGytQLj5lf/bE50KWWQVt+yxWbMjh1TL2mwA/GjRp7AXi25KABKhB99nM66emed7vUMo3RTrYmJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=dHdgXvPY; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ikACEHqK7RAp0bcHEYZhDcy+OQfVfJlwz8ORPNyWES0=; b=dHdgXvPY00divB/pYLbCcy1fIL
	8otNd2G8wB/8GbXQ2k0hzh6sVzJagJb2gC16rVwL14fehirSmoEkU0cEcOV00npFvFzWxRNyv2mbP
	abAFZeG6Um72Ub5FHq5f+A6T1AlHdOIPyTzddOcPbn1WXbpf3TdhJGvkJ5x4HViMhNp+B89mv1aSH
	VGlKM0cbciklw2FiIa30EIE7If4TlGaTX2BFwScM07x9UlCW8Q9WRacgyG/i11hXARbUXqXcyG/Cm
	BIga9kISJGp0kfb2VTPeEfKGMqBxB76SV1fqOAP4Q3vJFXJXEUoAIv9x+kGYF7+1TMSNoBi+VBdyy
	eKcQlsxg==;
Received: from [79.117.146.159] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wWvKA-00EvWP-KB; Tue, 09 Jun 2026 14:12:54 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	alex.hung@amd.com,
	aurabindo.pillai@amd.com,
	christian.koenig@amd.com,
	contact@emersion.fr,
	daniels@collabora.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tzimmermann@suse.de
Cc: Uma Shankar <uma.shankar@intel.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	amd-gfx@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/amd/display: allow individual colorop changes
Date: Tue,  9 Jun 2026 13:51:41 +0200
Message-ID: <20260609121230.1358786-8-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609121230.1358786-1-mwen@igalia.com>
References: <20260609121230.1358786-1-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.14 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:alexander.deucher@amd.com,m:alex.hung@amd.com,m:aurabindo.pillai@amd.com,m:christian.koenig@amd.com,m:contact@emersion.fr,m:daniels@collabora.com,m:harry.wentland@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:tzimmermann@suse.de,m:uma.shankar@intel.com,m:chaitanya.kumar.borah@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:louis.chauvet@bootlin.com,m:matthew.schwartz@linux.dev,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,emersion.fr,collabora.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_SENDER(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112160-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B93865FFB6

Every AMD colorop helper requires new colorop state to update a single
active colorop, i.e. if the userspace modifies a single property of a
colorop, but doesn't resubmit the whole color pipeline, the driver
rejects the atomic commit, instead of just restore colorop settings from
committed state. Change all colorop helpers to get the committed state
if there's no new state for a given colorop. It keeps walking in the
active color pipeline and update a color block if the related colorop
changed.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 182 +++++++-----------
 1 file changed, 65 insertions(+), 117 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 2dc3951c8e39..08cbe3b862d4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1497,24 +1497,13 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 			       struct dc_plane_state *dc_plane_state,
 			       struct drm_colorop *colorop)
 {
-	struct drm_colorop *old_colorop;
-	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_colorop_state *colorop_state;
 	struct drm_atomic_commit *state = plane_state->state;
-	int i = 0;
-
-	old_colorop = colorop;
 
 	/* 1st op: 1d curve - degamma */
-	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
-		if (new_colorop_state->colorop == old_colorop &&
-		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_degam_tfs)) {
-			colorop_state = new_colorop_state;
-			break;
-		}
-	}
-
+	colorop_state = drm_atomic_get_new_colorop_state(state, colorop);
 	if (!colorop_state)
-		return -EINVAL;
+		colorop_state = colorop->state;
 
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
@@ -1524,43 +1513,37 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
 				  struct dc_plane_state *dc_plane_state,
 				  struct drm_colorop *colorop)
 {
-	struct drm_colorop *old_colorop;
-	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_colorop_state *colorop_state;
 	struct drm_atomic_commit *state = plane_state->state;
 	const struct drm_device *dev = colorop->dev;
 	const struct drm_property_blob *blob;
 	struct drm_color_ctm_3x4 *ctm = NULL;
-	int i = 0;
 
 	/* 3x4 matrix */
-	old_colorop = colorop;
-	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
-		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->colorop->type == DRM_COLOROP_CTM_3X4) {
-			colorop_state = new_colorop_state;
-			break;
-		}
+	colorop_state = drm_atomic_get_new_colorop_state(state, colorop);
+	if (!colorop_state)
+		colorop_state = colorop->state;
+
+	if (colorop_state->colorop->type != DRM_COLOROP_CTM_3X4)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		dc_plane_state->gamut_remap_matrix.enable_remap = false;
+		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
+		return 0;
 	}
 
-	if (colorop_state && colorop->type == DRM_COLOROP_CTM_3X4) {
-		if (colorop_state->bypass) {
-			dc_plane_state->gamut_remap_matrix.enable_remap = false;
-			dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
-			return 0;
-		}
-
-		drm_dbg(dev, "3x4 matrix colorop with ID: %d\n", colorop->base.id);
-		blob = colorop_state->data;
-		if (blob->length == sizeof(struct drm_color_ctm_3x4)) {
-			ctm = (struct drm_color_ctm_3x4 *) blob->data;
-			__drm_ctm_3x4_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
-			dc_plane_state->gamut_remap_matrix.enable_remap = true;
-			dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
-		} else {
-			drm_warn(dev, "blob->length (%zu) isn't equal to drm_color_ctm_3x4 (%zu)\n",
-				 blob->length, sizeof(struct drm_color_ctm_3x4));
-			return -EINVAL;
-		}
+	drm_dbg(dev, "3x4 matrix colorop with ID: %d\n", colorop->base.id);
+	blob = colorop_state->data;
+	if (blob->length == sizeof(struct drm_color_ctm_3x4)) {
+		ctm = (struct drm_color_ctm_3x4 *) blob->data;
+		__drm_ctm_3x4_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
+		dc_plane_state->gamut_remap_matrix.enable_remap = true;
+		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
+	} else {
+		drm_warn(dev, "blob->length (%zu) isn't equal to drm_color_ctm_3x4 (%zu)\n",
+			 blob->length, sizeof(struct drm_color_ctm_3x4));
+		return -EINVAL;
 	}
 
 	return 0;
@@ -1571,29 +1554,23 @@ __set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
 				  struct dc_plane_state *dc_plane_state,
 				  struct drm_colorop *colorop)
 {
-	struct drm_colorop *old_colorop;
-	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_colorop_state *colorop_state;
 	struct drm_atomic_commit *state = plane_state->state;
 	const struct drm_device *dev = colorop->dev;
-	int i = 0;
 
 	/* Multiplier */
-	old_colorop = colorop;
-	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
-		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->colorop->type == DRM_COLOROP_MULTIPLIER) {
-			colorop_state = new_colorop_state;
-			break;
-		}
-	}
+	colorop_state = drm_atomic_get_new_colorop_state(state, colorop);
+	if (!colorop_state)
+		colorop_state = colorop->state;
 
-	if (colorop_state && colorop->type == DRM_COLOROP_MULTIPLIER) {
-		if (colorop_state->bypass) {
-			dc_plane_state->hdr_mult = dc_fixpt_one;
-		} else {
-			drm_dbg(dev, "Multiplier colorop with ID: %d\n", colorop->base.id);
-			dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);
-		}
+	if (colorop_state->colorop->type != DRM_COLOROP_MULTIPLIER)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		dc_plane_state->hdr_mult = dc_fixpt_one;
+	} else {
+		drm_dbg(dev, "Multiplier colorop with ID: %d\n", colorop->base.id);
+		dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);
 	}
 
 	return 0;
@@ -1604,29 +1581,23 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
 			      struct drm_colorop *colorop)
 {
-	struct drm_colorop *old_colorop;
-	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_colorop_state *colorop_state;
 	struct drm_atomic_commit *state = plane_state->state;
 	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
 	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
 	const struct drm_color_lut32 *shaper_lut;
 	struct drm_device *dev = colorop->dev;
 	u32 shaper_size;
-	int i = 0, ret = 0;
+	int ret = 0;
 
 	tf->type = TF_TYPE_BYPASS;
 
 	/* 1D Curve - SHAPER TF */
-	old_colorop = colorop;
-	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
-		if (new_colorop_state->colorop == old_colorop &&
-		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs)) {
-			colorop_state = new_colorop_state;
-			break;
-		}
-	}
+	colorop_state = drm_atomic_get_new_colorop_state(state, colorop);
+	if (!colorop_state)
+		colorop_state = colorop->state;
 
-	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE) {
+	if (!colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE) {
 		drm_dbg(dev, "Shaper TF colorop with ID: %d\n", colorop->base.id);
 		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
 		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
@@ -1637,22 +1608,17 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	}
 
 	/* 1D LUT - SHAPER LUT */
-	colorop = old_colorop->next;
+	colorop = colorop->next;
 	if (!colorop) {
 		drm_dbg(dev, "no Shaper LUT colorop found\n");
 		return -EINVAL;
 	}
 
-	old_colorop = colorop;
-	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
-		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
-			colorop_state = new_colorop_state;
-			break;
-		}
-	}
+	colorop_state = drm_atomic_get_new_colorop_state(state, colorop);
+	if (!colorop_state)
+		colorop_state = colorop->state;
 
-	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT) {
+	if (!colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT) {
 		drm_dbg(dev, "Shaper LUT colorop with ID: %d\n", colorop->base.id);
 		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
 		tf->tf = default_tf;
@@ -1707,8 +1673,7 @@ __set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
 			     struct dc_plane_state *dc_plane_state,
 			     struct drm_colorop *colorop)
 {
-	struct drm_colorop *old_colorop;
-	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_colorop_state *colorop_state;
 	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
 	struct drm_atomic_commit *state = plane_state->state;
 	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
@@ -1716,19 +1681,14 @@ __set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
 	const struct drm_device *dev = colorop->dev;
 	const struct drm_color_lut32 *lut3d;
 	uint32_t lut3d_size;
-	int i = 0, ret = 0;
+	int ret = 0;
 
 	/* 3D LUT */
-	old_colorop = colorop;
-	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
-		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->colorop->type == DRM_COLOROP_3D_LUT) {
-			colorop_state = new_colorop_state;
-			break;
-		}
-	}
+	colorop_state = drm_atomic_get_new_colorop_state(state, colorop);
+	if (!colorop_state)
+		colorop_state = colorop->state;
 
-	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
+	if (!colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
 		if (!has_3dlut) {
 			drm_dbg(dev, "3D LUT is not supported by hardware\n");
 			return -EINVAL;
@@ -1763,29 +1723,22 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 			     struct dc_plane_state *dc_plane_state,
 			     struct drm_colorop *colorop)
 {
-	struct drm_colorop *old_colorop;
-	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_colorop_state *colorop_state;
 	struct drm_atomic_commit *state = plane_state->state;
 	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
 	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
 	const struct drm_color_lut32 *blend_lut = NULL;
 	struct drm_device *dev = colorop->dev;
 	uint32_t blend_size = 0;
-	int i = 0;
 
 	tf->type = TF_TYPE_BYPASS;
 
 	/* 1D Curve - BLND TF */
-	old_colorop = colorop;
-	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
-		if (new_colorop_state->colorop == old_colorop &&
-		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
-			colorop_state = new_colorop_state;
-			break;
-		}
-	}
+	colorop_state = drm_atomic_get_new_colorop_state(state, colorop);
+	if (!colorop_state)
+		colorop_state = colorop->state;
 
-	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE &&
+	if (!colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE &&
 	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
 		drm_dbg(dev, "Blend TF colorop with ID: %d\n", colorop->base.id);
 		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
@@ -1795,22 +1748,17 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	}
 
 	/* 1D Curve - BLND LUT */
-	colorop = old_colorop->next;
+	colorop = colorop->next;
 	if (!colorop) {
 		drm_dbg(dev, "no Blend LUT colorop found\n");
 		return -EINVAL;
 	}
 
-	old_colorop = colorop;
-	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
-		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
-			colorop_state = new_colorop_state;
-			break;
-		}
-	}
+	colorop_state = drm_atomic_get_new_colorop_state(state, colorop);
+	if (!colorop_state)
+		colorop_state = colorop->state;
 
-	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT &&
+	if (!colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT &&
 	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
 		drm_dbg(dev, "Blend LUT colorop with ID: %d\n", colorop->base.id);
 		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-- 
2.53.0


