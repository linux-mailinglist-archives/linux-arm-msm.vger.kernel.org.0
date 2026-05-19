Return-Path: <linux-arm-msm+bounces-108604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA2oFR/SDGrImQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 23:11:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0242458507C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 23:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D0A53023E46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 21:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4394B30C608;
	Tue, 19 May 2026 21:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="OKuD5zxU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EF62147F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 21:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779225117; cv=none; b=IHLrlaQC9UqpVWmtt6FEJfts7GpewRwRuwWws3m4yHgj0BTRwRJqbCOdW2pZG2c6t39xmLtpFN3VYWthGLjXugcsg9jwjYskiJqU88hlvd8fv+UBUy6HX9BAItKuyUt/Yn294TKk3LOZYdkeS/cs6C6YrBuJuaDqNPlqCRdprPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779225117; c=relaxed/simple;
	bh=oCX401crVI3DolScCcZ088PfI5EaucpvPbfHXj9Kpv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMcxmfFbQ6OE5zPxkmj869funmtbPPNGkPjI9gRQAuezho2csD7shwyplIkG6YJImoZ1CBjP9sIpj3UI1efqFQPNp6CwfrwqIyiExp1wCsEUto8ASxdr/EXU3HKn4qgjeiAdHVJb0e7JYJiJhwIx3Kv63rO2OSV+Qy+xDP8HMeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=OKuD5zxU; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bTFNlB2lEIz390/U2GSGLhZNHA23YFC+d55K4R2kv+A=; b=OKuD5zxUjmAdgz51Pg+aKaDqWQ
	+yCcn51wtmv1P285dqFEx97ix+33OCjw20DnviyM/s2dRK1k27m6dcwBml+rV+q+htXz4xzl5h5Xa
	ZFzP404UbRsTVkIpK6M0qQcS8UrOIRjEKlfqPziw/d5BqwIM1AkIg3lBVY1EL6/qFflMIaO2KHPVu
	SXo9St2Z6RVBlCE1UO32QEV3W0fCkyTSKK7yK2+ggoiJFzvVraxMqYWgmFBDOCb6nNRA7R2WtC8u+
	ggVGUflYE+RuekRg2xwY7DAL6X0vZcW0RZ110Gd/l2f7qKmICgJxM8UBo41HlrZqUDtnrHCGXuNvm
	Z768QwrA==;
Received: from [79.117.146.159] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wPRio-003Ppa-QN; Tue, 19 May 2026 23:11:26 +0200
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
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
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
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 3/6] drm/colorop: Remove read-only comments from interpolation fields
Date: Tue, 19 May 2026 23:09:06 +0200
Message-ID: <20260519211111.228303-4-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519211111.228303-1-mwen@igalia.com>
References: <20260519211111.228303-1-mwen@igalia.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108604-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.927];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0242458507C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alex Hung <alex.hung@amd.com>

The lut1d_interpolation and lut3d_interpolation fields and their
associated properties were marked as read-only, but userspace
can set them via drm_atomic_colorop_set_property().

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm/drm_colorop.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index c873199c60da..53a2148082d5 100644
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


