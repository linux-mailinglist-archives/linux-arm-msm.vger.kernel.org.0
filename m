Return-Path: <linux-arm-msm+bounces-101663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK4BIArKz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:09:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26579394FB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D0CA3118052
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 14:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ADC3B3BFA;
	Fri,  3 Apr 2026 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Gwe1F5p5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058839658B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224828; cv=none; b=Mn5wNXrJKbjM+2DrFKb12qXsIWWyOQnFIeW8QJyP5PsPgtaj5tkZAA1CF7r6KM5Z36jOSfP0wVv7r2Hzxtj5+pAv6StL+Ii+T/IQoQPerX8yD4nfbzhyX296Fm1BdbzEWlCDwYXFXKnatcemqXmloeLYg2ezAcgDQGXBDeycpR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224828; c=relaxed/simple;
	bh=6OV4+0uyeE0hb2dbHaGXdK+MccuSKegNMXgptwn8mWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prsKHxsXBVZVJ+cYEg2J4y4KzP9tbHVFVIibmgpcBKJ9UxjqfQDvKoOCw+qwxoEuXNS8894Y9IYJGHNiGAEgmqeFaud60P6OryH+44qPwSVEoTf3vMfY0qzbfQPxmN7z+TyU6PT4F7ydEO6rdE2STdJ4d8yYqgbu6OvxFdmFykg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Gwe1F5p5; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=l0nLPefN3ocKn13eTFBm3fonIhPB7SgbdgsFMqUAAYI=; b=Gwe1F5p53HHcuGWmI8IK8zPG32
	0ckWc+k6RBw+Uo3P7M2xi+vX28yPsaZi672ACQlHNwYekDeMpYIrynC/lzPJgIMi0WbG41tj5PLR7
	Iks+Ou+nhvr8dKUYRTMUpMRy6yJeOT1jkQnq9xp/QntZTgYqbM0dcMUZs/nsQZQ+a43C37TfIaXDv
	fnANjTHVVt/bcHG1xpTXm7nHT1Rejpx52W9EJVmi/ZnHStKymIMm2JM/M1q0b9lRCdijDSAujm5kX
	ZiuIOeaslzjs4L3QhdnKr2ywlXMJJzF2JQ3mBdxOHgRvwJWR5l9ltT4GGQjW0q4MKzLkLyXI62ByZ
	hVsNRKTA==;
Received: from [189.89.58.26] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w8f3v-00AtJL-7J; Fri, 03 Apr 2026 15:59:51 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tzimmermann@suse.de
Cc: Alex Hung <alex.hung@amd.com>,
	Simon Ser <contact@emersion.fr>,
	Uma Shankar <uma.shankar@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	amd-gfx@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/6] drm/colorop: make lut(1/3)d_interpolation mutable
Date: Fri,  3 Apr 2026 10:58:28 -0300
Message-ID: <20260403135909.214378-5-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403135909.214378-1-mwen@igalia.com>
References: <20260403135909.214378-1-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.14 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101663-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 26579394FB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As it's not immutable anymore, any changes should be handled by
drm_colorop_state. Move their enum and make it correctly behaves as
mutable.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c      |  4 ++--
 drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++----
 drivers/gpu/drm/drm_colorop.c     | 16 ++++++++++++++--
 include/drm/drm_colorop.h         | 28 ++++++++++++++--------------
 4 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 6b214b61008b..6dc5e5f82669 100644
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
index bff8d58f8f12..25fe94410af7 100644
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
index 566816e3c6f0..0ee35c7101c8 100644
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
+		drm_object_property_get_default_value(&colorop->base,
+						      colorop->lut1d_interpolation_property,
+						      &val);
+		colorop_state->lut1d_interpolation = val;
+	}
+
+	if (colorop->lut3d_interpolation_property) {
+		drm_object_property_get_default_value(&colorop->base,
+						      colorop->lut3d_interpolation_property,
+						      &val);
+		colorop_state->lut3d_interpolation = val;
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


