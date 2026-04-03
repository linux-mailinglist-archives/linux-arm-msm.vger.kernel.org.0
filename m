Return-Path: <linux-arm-msm+bounces-101662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAR1HQnKz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:09:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE504394F9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9225430CC934
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 14:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFAA39C645;
	Fri,  3 Apr 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="clG8OcYp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E852332EA2
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224819; cv=none; b=rKuQeLsfRVXGJyUFlSo1s4wN9lX+uKx+1CX5WPslkNrbRl3b26/I5URSGVrPIwfqM3Ykmbg/vsPJXlkGChLHfEG3TNNoL8Hg0Q9XUQqhrWIKFycAJBHbW7c+Qah6j3uxojmriiCB79rMUFmJX8AynzhX3z63LDpYNOhAwclJoKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224819; c=relaxed/simple;
	bh=x/rmlynNVej+SP0wBLhuNz+D4dO6zwdWtCLL9LZz5rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rH2h26/vJHuFY2kOOhdrKd4rfKpTNUe+uIFEntzgZbcRekgMe3R5UBmJSMfmEcvKgGdrG0v/ee3SinZ+G/AEzwl7THofQQRdWxVBadconBiVVmWAOQR/+dX1AKCz+BQPLgHvRVgQdiSnyz2DJmn3L5SiUb8PasHDaqNGQ9V2qVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=clG8OcYp; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TSPa3Yd5acObIh82pF3owI2lAlpsxt4srm/wQTOY7Sc=; b=clG8OcYp3oxXeVXCtB1/lbaqxu
	RmArCIg8A7vSzg/doFfvdY0P0ZjEoEgQ4iEiI6T5jBNtCJghvns4FALhlQizuZHN1LgoBLSmQoBvL
	sTtuhttugjwoNKbU+U4GlvnPm4pH3TNqDOH3CdY2t9u0EvRgZXnHIjQ4TNzT1u9JEYk40bsGtQjWM
	+0LP30MkaQWDjPw9lwe61lFHXxtBJDnUV4BXKgPdINJlBsgadrML3KRucf8mT3sj704+ePzqdz5D7
	cLRz9mz8qc118T43YPHK8e8J7S6NZskHgAyIE0/8T0MckwvRzUm2vR3Pnrp/zRVhrBpPA8eTSR4Kn
	DK+SoQpg==;
Received: from [189.89.58.26] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w8f3c-00AtJL-E1; Fri, 03 Apr 2026 15:59:32 +0200
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
Subject: [PATCH v3 1/6] drm/atomic: only add colorop state from active color pipeline
Date: Fri,  3 Apr 2026 10:58:25 -0300
Message-ID: <20260403135909.214378-2-mwen@igalia.com>
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
	TAGGED_FROM(0.00)[bounces-101662-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: CE504394F9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of adding colorop state of all colorops of a given plane, only
get those from an active color pipeline of this plane.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c        | 39 ++++++++++++++---------------
 drivers/gpu/drm/drm_atomic_helper.c |  9 +++----
 include/drm/drm_atomic.h            |  2 +-
 3 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 41c57063f3b4..6b214b61008b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1591,26 +1591,25 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 		if (IS_ERR(plane_state))
 			return PTR_ERR(plane_state);
 
-		if (plane_state->color_pipeline) {
-			ret = drm_atomic_add_affected_colorops(state, plane);
-			if (ret)
-				return ret;
-		}
+		ret = drm_atomic_add_affected_colorops(plane_state, plane);
+		if (ret)
+			return ret;
 	}
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_add_affected_planes);
 
 /**
- * drm_atomic_add_affected_colorops - add colorops for plane
- * @state: atomic state
+ * drm_atomic_add_affected_colorops - add active colorops for plane
+ * @state: DRM plane state
  * @plane: DRM plane
  *
  * This function walks the current configuration and adds all colorops
- * currently used by @plane to the atomic configuration @state. This is useful
- * when an atomic commit also needs to check all currently enabled colorop on
- * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
- * to avoid special code to force-enable all colorops.
+ * currently used by an active color pipeline set for a @plane to the atomic
+ * configuration @state. This is useful when an atomic commit also needs to
+ * check all currently enabled colorop on @plane, e.g. when changing the mode.
+ * It's also useful when re-enabling a plane to avoid special code to
+ * force-enable all colorops.
  *
  * Since acquiring a colorop state will always also acquire the w/w mutex of the
  * current plane for that colorop (if there is any) adding all the colorop states for
@@ -1622,23 +1621,23 @@ EXPORT_SYMBOL(drm_atomic_add_affected_planes);
  * sequence must be restarted. All other errors are fatal.
  */
 int
-drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
+drm_atomic_add_affected_colorops(struct drm_plane_state *plane_state,
 				 struct drm_plane *plane)
 {
 	struct drm_colorop *colorop;
 	struct drm_colorop_state *colorop_state;
 
-	WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
+	if (!plane_state || !plane_state->color_pipeline)
+		return 0;
 
 	drm_dbg_atomic(plane->dev,
-		       "Adding all current colorops for [PLANE:%d:%s] to %p\n",
-		       plane->base.id, plane->name, state);
+		       "Adding all current active colorops for [PLANE:%d:%s] to %p\n",
+		       plane->base.id, plane->name, plane_state->state);
 
-	drm_for_each_colorop(colorop, plane->dev) {
-		if (colorop->plane != plane)
-			continue;
-
-		colorop_state = drm_atomic_get_colorop_state(state, colorop);
+	for (colorop = plane_state->color_pipeline;
+	     colorop;
+	     colorop = colorop->next) {
+		colorop_state = drm_atomic_get_colorop_state(plane_state->state, colorop);
 		if (IS_ERR(colorop_state))
 			return PTR_ERR(colorop_state);
 	}
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 481f92a03683..ce7bdd6a4051 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3752,12 +3752,9 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
 			goto free;
 		}
 
-		if (plane_state->color_pipeline) {
-			err = drm_atomic_add_affected_colorops(state, plane);
-			if (err)
-				goto free;
-		}
-
+		err = drm_atomic_add_affected_colorops(plane_state, plane);
+		if (err)
+			goto free;
 	}
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 8883290cd014..8916923f32b8 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -919,7 +919,7 @@ int __must_check
 drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 			       struct drm_crtc *crtc);
 int __must_check
-drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
+drm_atomic_add_affected_colorops(struct drm_plane_state *state,
 				 struct drm_plane *plane);
 
 int __must_check drm_atomic_check_only(struct drm_atomic_state *state);
-- 
2.53.0


