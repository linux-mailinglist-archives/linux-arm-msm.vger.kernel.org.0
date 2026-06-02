Return-Path: <linux-arm-msm+bounces-110851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WEtBLM5SH2rekQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:01:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E816324EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:01:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=Tgwx7vlo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110851-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110851-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3313300B07E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 21:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321023A3E9C;
	Tue,  2 Jun 2026 21:58:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F2335E1CE
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 21:58:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437518; cv=none; b=G3wYEutWrZDzUQ4TXDj6bKwgv28fkgn4z1HbsXPBpxrBM41GsltO4w6ljsxYb4IhET//1krTLUqhvsGma8O6Br5aKPHYLX3gkPVCHro8t9u7I3O+Wv6EEgIcLakcNyjOfrt1BwWm5sNSuogm9bgx2hLrXczpCkmqUJJswgEiNls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437518; c=relaxed/simple;
	bh=zw/Mww6geAV+GwTMTHC762EL40MWWt+gpzG5gX6TAnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikttwA/zbF9IzRpE/hfZ23PplL/lnEvfI1ORDZPmCqaAoVvvX2Om6/ar43Tn8365Dm9vuvXz4y36m5vjrG7CfO0SCZFTPAreacEEdU2HsPJ30ZCqWV/TyzIfh3DLzx1z8hQgRSvmUCgwHs2KtX3uYIvXwSqw/k0BG+BBmu39cr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Tgwx7vlo; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wIQdz4iLfZpC+LKLV3pfcR8c7zT7fxM4g00Wn+wXD70=; b=Tgwx7vlo1cGAH/ND277yUE5zm7
	Yt/sM9K4IDE0D6H3nBlh995ZqXfJd9XoThmRJJSHY1esLr2Bzzl6/4e+f0y9eCSjSvZzBLWvelzHH
	ZXfnmJ6vjx3iu2ByqKE490oP94o4sthw74IjbRGj4hl//B6LJ0qAFmelSfGKsQPz+jrM8eS2smc2X
	KezqfFj0qkrkL0ih0w2PWggeQcdM/omCB37SYCb3e4pxnGzO0fW+WjlBk0p3gqoJZlUwBSVteZ+a1
	zZ5F1MmkSY9USaLla+1QPIo3mvCRqkylRRJt3JBfaZsYRX/uYRfeC9CQyZVIJF7huzK+egsk4CEUy
	nLjqJ3Cg==;
Received: from [79.117.146.159] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wUX7T-00BuCE-VB; Tue, 02 Jun 2026 23:57:56 +0200
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
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 1/4] drm/colorop: Remove read-only comments from interpolation fields
Date: Tue,  2 Jun 2026 23:53:53 +0200
Message-ID: <20260602215743.914265-2-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602215743.914265-1-mwen@igalia.com>
References: <20260602215743.914265-1-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110851-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:alexander.deucher@amd.com,m:alex.hung@amd.com,m:christian.koenig@amd.com,m:contact@emersion.fr,m:daniels@collabora.com,m:harry.wentland@amd.com,m:louis.chauvet@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwen@igalia.com,m:sebastian.wick@redhat.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:tzimmermann@suse.de,m:uma.shankar@intel.com,m:chaitanya.kumar.borah@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:matthew.schwartz@linux.dev,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,emersion.fr,collabora.com,bootlin.com,linux.intel.com,kernel.org,igalia.com,redhat.com,ffwll.ch,suse.de];
	FORGED_SENDER(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[intel.com,kde.org,collabora.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,igalia.com:mid,igalia.com:from_mime,igalia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05E816324EE

From: Alex Hung <alex.hung@amd.com>

The lut1d_interpolation and lut3d_interpolation fields and their
associated properties were marked as read-only, but userspace
can set them via drm_atomic_colorop_set_property().

Fixes: 7fa3ee8c0a79 ("drm/colorop: Define LUT_1D interpolation")
Fixes: db971856bbe0 ("drm/colorop: Add 3D LUT support to color pipeline")
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 include/drm/drm_colorop.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index b4b9e4f558ab..5cea4d7c4efa 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -309,7 +309,6 @@ struct drm_colorop {
 	/**
 	 * @lut1d_interpolation:
 	 *
-	 * Read-only
 	 * Interpolation for DRM_COLOROP_1D_LUT
 	 */
 	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
@@ -317,7 +316,6 @@ struct drm_colorop {
 	/**
 	 * @lut3d_interpolation:
 	 *
-	 * Read-only
 	 * Interpolation for DRM_COLOROP_3D_LUT
 	 */
 	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
@@ -325,7 +323,7 @@ struct drm_colorop {
 	/**
 	 * @lut1d_interpolation_property:
 	 *
-	 * Read-only property for DRM_COLOROP_1D_LUT interpolation
+	 * Property for DRM_COLOROP_1D_LUT interpolation
 	 */
 	struct drm_property *lut1d_interpolation_property;
 
@@ -353,7 +351,7 @@ struct drm_colorop {
 	/**
 	 * @lut3d_interpolation_property:
 	 *
-	 * Read-only property for DRM_COLOROP_3D_LUT interpolation
+	 * Property for DRM_COLOROP_3D_LUT interpolation
 	 */
 	struct drm_property *lut3d_interpolation_property;
 
-- 
2.53.0


