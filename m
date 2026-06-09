Return-Path: <linux-arm-msm+bounces-112153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m1fnHsEEKGqP7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:19:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3965FF89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:19:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=ASveM78L;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112153-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112153-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2E03300C581
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853B13FFFA5;
	Tue,  9 Jun 2026 12:13:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9167408608
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:13:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007204; cv=none; b=WsUVFGZ5vXw8kgaOXoO5iX/BrHlh+BZ2DeOk9Qlc++lb5/MRToIwHLFs7cKuLm6zBFfQtQHSoVF8E/is9J9yC6wbhARWHvr1G1ekS8eQZQaaXrNaQBtBBmeNdUWGD5CmukR5yuF8/ni48gWF77mNpr/3VVDbF3MgNLZ27opvyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007204; c=relaxed/simple;
	bh=s44aAJgRF3+tABMQizNJ+QTCvRzVmZ6878fqlg2yKaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZoP0E2a5n+U0vDgqKINApacTOD/MlqMQfGGhouwprJ9O2b2XEZaeqc8He/Uzt16RTCL8ddmElrY2GCJc0bEbauGvDQYpkAuPQ3BoSibv3LogJxIumbtzQyFNcQGcaQXrna6Hl1JF130rfUHGOd2pztk1Xw/H/O/UjQfEHkfy/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ASveM78L; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qmlJi/qdHLqPjbUxZpc3UcGGMVP8OZZ5OmPbfVTXTng=; b=ASveM78LHq23CtvM8Mwf1xBHDD
	71lcZ48I/sXfAOmFUsbjivGoAJ50OuGxqioe9GBwb7VI/LemcLs2UF9RwGwIt34XPj/4oD4quhyhM
	uHc+tVtcUlkgnKNhTQn9omV1tJx5YTL1kGaYYq24mZUabIytiJxticEbPeWWnvgfqy6U0W9OaU/Fu
	noOsJ2EDOTCOL1+Vh6zqQJikD4cCLhCWvYV5puWsZvxkZOr+bOUOnlbho0pHqonKxeVFFpzanyBjn
	ZUqPHYVXDGoWLjhJYGWOTLIfpIeBw9LrlF4v1BorJJIpya5IILtvuhdbIe9XoRMhnFDGs+py6ZKAb
	aNk4GbjQ==;
Received: from [79.117.146.159] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wWvK6-00EvWP-I3; Tue, 09 Jun 2026 14:12:50 +0200
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
Subject: [PATCH v3 5/7] drm/amd/display: make shaper bypass mode cleaner
Date: Tue,  9 Jun 2026 13:51:39 +0200
Message-ID: <20260609121230.1358786-6-mwen@igalia.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112153-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:alexander.deucher@amd.com,m:alex.hung@amd.com,m:aurabindo.pillai@amd.com,m:christian.koenig@amd.com,m:contact@emersion.fr,m:daniels@collabora.com,m:harry.wentland@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:tzimmermann@suse.de,m:uma.shankar@intel.com,m:chaitanya.kumar.borah@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:louis.chauvet@bootlin.com,m:matthew.schwartz@linux.dev,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,emersion.fr,collabora.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7D3965FF89

Start shaper tranfer function setup in bypass mode, i.e. tf->type ==
TF_TYPE_BYPASS and let the helper checks set it to a different mode
according to userspace request.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 84ff136183ee..2f51009b2978 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1611,10 +1611,11 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
 	const struct drm_color_lut32 *shaper_lut;
 	struct drm_device *dev = colorop->dev;
-	bool enabled = false;
 	u32 shaper_size;
 	int i = 0, ret = 0;
 
+	tf->type = TF_TYPE_BYPASS;
+
 	/* 1D Curve - SHAPER TF */
 	old_colorop = colorop;
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
@@ -1633,7 +1634,6 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		ret = __set_output_tf(tf, 0, 0, false);
 		if (ret)
 			return ret;
-		enabled = true;
 	}
 
 	/* 1D LUT - SHAPER LUT */
@@ -1665,13 +1665,9 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			ret = __set_output_tf_32(tf, shaper_lut, shaper_size, false);
 			if (ret)
 				return ret;
-			enabled = true;
 		}
 	}
 
-	if (!enabled)
-		tf->type = TF_TYPE_BYPASS;
-
 	return 0;
 }
 
-- 
2.53.0


