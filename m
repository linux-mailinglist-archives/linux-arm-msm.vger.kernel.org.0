Return-Path: <linux-arm-msm+bounces-112144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VxcfIjH3J2q76QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:21:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA465F6F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:21:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=JpkZc9hd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112144-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112144-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F23E6304F228
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 11:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010133FDC1A;
	Tue,  9 Jun 2026 11:05:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6473FB055
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 11:05:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003122; cv=none; b=Mvb7jAgfmZRgvYCaL8eK9OkAOarP0fNA/kWx3o970IE8mWgv0ZuWlWjGmmAb9vXVT6RKtRdUYfT10A8iM0JnYqmnYhtC+9ejnXC5LrGojZJKsm1JH77AoHSRDKMrPB5CdMNIrbTpgS+DQX/MSL23cLiA8A99HA6/DINmaAFVc+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003122; c=relaxed/simple;
	bh=bFpHPosuW9hq1N7LxwBfiVpNcA3Xtx1GXRDCbKZ/1eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvVkoUQIa//Gqd9bKemWGhugQ47eTFv4BlaCNG6UbPy/iXP2nZQ9IfXXB0VKGstuO0dljuEnxiRfqucQEKV/yObSjleugSanx3aM8aEYiO62LaOVOA6cAEEagINbZKSUAbREEUHEgNxVXU9SJf0yD8RLuy1fCWSntOlqLPS0MP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=JpkZc9hd; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H/Rir3hgfFUvZMJD+gSxYcl1pkwtmNMKfLWQ7X9NzEc=; b=JpkZc9hdOk4h8mNcyP2PfQbvoM
	Ki6MEH3Q1HMtzq8wNQ6jh6eBZgMRqqVO2+gneZyZJJf7/8borNYDYeU0RZK1mMuxqFu3FUfdvA34c
	iuxZHlntwIWqd2YlgpZv80EIPJmMKRon/LeG7Rx9nylb+ADpEVf6ugbb4E8QpSegHb32Usan0C/TX
	/k90a9TQGXBxbn+KLFIFILNis57vmiDE1fYuH9suuGJKyCqojd8pzoty3Cy8fUp1sxi697nkoMNur
	PVzTpkWVJ/Pr6HUsMq+5v9EBJWgSBOUtfCLSq/zWcpzJBD9KPOYlsDa2Z6xzwep6i1CV2OlHFCG7k
	SBgZA2+w==;
Received: from [79.117.146.159] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wWuG4-00Etww-56; Tue, 09 Jun 2026 13:04:36 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	alex.hung@amd.com,
	christian.koenig@amd.com,
	contact@emersion.fr,
	daniels@collabora.com,
	harry.wentland@amd.com,
	louis.chauvet@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	mwen@igalia.com,
	sebastian.wick@redhat.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tzimmermann@suse.de
Cc: Uma Shankar <uma.shankar@intel.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
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
Subject: [PATCH v9 2/4] drm/colorop: make lut(1/3)d_interpolation props correctly behave as mutable
Date: Tue,  9 Jun 2026 12:20:19 +0200
Message-ID: <20260609110420.1298352-3-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609110420.1298352-1-mwen@igalia.com>
References: <20260609110420.1298352-1-mwen@igalia.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112144-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:alexander.deucher@amd.com,m:alex.hung@amd.com,m:christian.koenig@amd.com,m:contact@emersion.fr,m:daniels@collabora.com,m:harry.wentland@amd.com,m:louis.chauvet@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwen@igalia.com,m:sebastian.wick@redhat.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:tzimmermann@suse.de,m:uma.shankar@intel.com,m:chaitanya.kumar.borah@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:matthew.schwartz@linux.dev,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,emersion.fr,collabora.com,bootlin.com,linux.intel.com,kernel.org,igalia.com,redhat.com,ffwll.ch,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,igalia.com:email,igalia.com:mid,igalia.com:from_mime,intel.com:email,amd.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78FA465F6F6

As interpolation props are actually mutable props, any changes should be
handled by drm_colorop_state. Move their enum and make it correctly
behaves as mutable.

Fixes: 7fa3ee8c0a79 ("drm/colorop: Define LUT_1D interpolation")
Fixes: db971856bbe0 ("drm/colorop: Add 3D LUT support to color pipeline")
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
Fixes: 9ba25915efba ("drm/amd/display: Add support for sRGB EOTF in DEGAM block")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c      |  4 ++--
 drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++----
 drivers/gpu/drm/drm_colorop.c     | 16 ++++++++++++++--
 include/drm/drm_colorop.h         | 28 ++++++++++++++--------------
 4 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 41c57063f3b4..0eb52d1d5af2 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -830,7 +830,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_1D_LUT:
 		drm_printf(p, "\tsize=%d\n", colorop->size);
 		drm_printf(p, "\tinterpolation=%s\n",
-			   drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
+			   drm_get_colorop_lut1d_interpolation_name(state->lut1d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
 	case DRM_COLOROP_CTM_3X4:
@@ -842,7 +842,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_3D_LUT:
 		drm_printf(p, "\tsize=%d\n", colorop->size);
 		drm_printf(p, "\tinterpolation=%s\n",
-			   drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
+			   drm_get_colorop_lut3d_interpolation_name(state->lut3d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
 	default:
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 5bd5bf6661df..b81dbba4d8c3 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -751,13 +751,13 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 	if (property == colorop->bypass_property) {
 		state->bypass = val;
 	} else if (property == colorop->lut1d_interpolation_property) {
-		colorop->lut1d_interpolation = val;
+		state->lut1d_interpolation = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
 	} else if (property == colorop->multiplier_property) {
 		state->multiplier = val;
 	} else if (property == colorop->lut3d_interpolation_property) {
-		colorop->lut3d_interpolation = val;
+		state->lut3d_interpolation = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -782,7 +782,7 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 	else if (property == colorop->bypass_property)
 		*val = state->bypass;
 	else if (property == colorop->lut1d_interpolation_property)
-		*val = colorop->lut1d_interpolation;
+		*val = state->lut1d_interpolation;
 	else if (property == colorop->curve_1d_type_property)
 		*val = state->curve_1d_type;
 	else if (property == colorop->multiplier_property)
@@ -790,7 +790,7 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 	else if (property == colorop->size_property)
 		*val = colorop->size;
 	else if (property == colorop->lut3d_interpolation_property)
-		*val = colorop->lut3d_interpolation;
+		*val = state->lut3d_interpolation;
 	else if (property == colorop->data_property)
 		*val = (state->data) ? state->data->base.id : 0;
 	else
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 566816e3c6f0..509678e5371f 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -342,7 +342,6 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 
 	colorop->lut1d_interpolation_property = prop;
 	drm_object_attach_property(&colorop->base, prop, interpolation);
-	colorop->lut1d_interpolation = interpolation;
 
 	/* data */
 	ret = drm_colorop_create_data_prop(dev, colorop);
@@ -442,7 +441,6 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
 
 	colorop->lut3d_interpolation_property = prop;
 	drm_object_attach_property(&colorop->base, prop, interpolation);
-	colorop->lut3d_interpolation = interpolation;
 
 	/* data */
 	ret = drm_colorop_create_data_prop(dev, colorop);
@@ -521,6 +519,20 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 						      &val);
 		colorop_state->curve_1d_type = val;
 	}
+
+	if (colorop->lut1d_interpolation_property) {
+		if (!drm_object_property_get_default_value(&colorop->base,
+							   colorop->lut1d_interpolation_property,
+							   &val))
+			colorop_state->lut1d_interpolation = val;
+	}
+
+	if (colorop->lut3d_interpolation_property) {
+		if (!drm_object_property_get_default_value(&colorop->base,
+							   colorop->lut3d_interpolation_property,
+							   &val))
+			colorop_state->lut3d_interpolation = val;
+	}
 }
 
 /**
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 61cc8206b4c4..d5b45339333f 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -183,6 +183,20 @@ struct drm_colorop_state {
 	 */
 	struct drm_property_blob *data;
 
+	/**
+	 * @lut1d_interpolation:
+	 *
+	 * Interpolation for DRM_COLOROP_1D_LUT
+	 */
+	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
+
+	/**
+	 * @lut3d_interpolation:
+	 *
+	 * Interpolation for DRM_COLOROP_3D_LUT
+	 */
+	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -306,20 +320,6 @@ struct drm_colorop {
 	 */
 	uint32_t size;
 
-	/**
-	 * @lut1d_interpolation:
-	 *
-	 * Interpolation for DRM_COLOROP_1D_LUT
-	 */
-	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
-
-	/**
-	 * @lut3d_interpolation:
-	 *
-	 * Interpolation for DRM_COLOROP_3D_LUT
-	 */
-	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
-
 	/**
 	 * @lut1d_interpolation_property:
 	 *
-- 
2.53.0


