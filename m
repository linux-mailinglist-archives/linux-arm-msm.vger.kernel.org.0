Return-Path: <linux-arm-msm+bounces-98736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKVWLIbmu2njpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:05:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1935A2CADD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54E01326D2DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6923CD8C4;
	Thu, 19 Mar 2026 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="CL7/GhWa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE9D3CD8D2;
	Thu, 19 Mar 2026 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921506; cv=none; b=f1ENqob2N+sxKm2M119mY9z+8kZmIRM6ody0S2CNRYrhaEtb2wTtPaoz3HC6NsduFDhBkZtWHW1gNUXAsm/RCa1m7ogwzW2ki7Jvn200knoYdp/x5mxXDlvrJ5XYQbg2leexwQmp5kdCFZeM22uHwWk7G/qioklpmRQNz0xyy+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921506; c=relaxed/simple;
	bh=xLekykE+oQCZgjI63S34rfV/MqQr2aCYwrFIvG4hSXY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxRZdsum3AKtfW+/trD67DSgcep+Gr7pbIwRvthdKnT1Ls5QcDMyTf2qYuD9hEo5UhHpsMi2mEV/AIeONY8J+VZoIHVNMhvQLozF7DwjFBrt/KMQhIA2rGGoYg3eqA4b3GJhxF/kkMStD8+YZAfCt1lV5x9gBlGmgXXMg4lDfEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=CL7/GhWa; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773921486; x=1774180686;
	bh=o9A8V2N6oCWL2uEYqKxQQ9YkXJRzeIHenXvajLxOdHI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CL7/GhWauv06VTKSKXH0j2wvtTWlShxLzBP1R99jqRJKcKKA00yLKBqG3hBqKYNOW
	 /B3LI7vNasYp/o6udzkRgbCFEvOtYLOz9/XQJ2N6zDKUsjeZ752mJ0Ar83JIKRp3oi
	 x4ztO7Vlq6FZSjMBpsD/DDmXArDOwu6kdmgcy3hzg+ETLc6XWa1KmHBPCkBwWrdXRG
	 jl2GvmaIbru9TvuqygXX6HCz0W0O8khw+809u/rKUOtlxLV9rfw5TT3D7hwCWlZX8c
	 F2asJsOGzmIMBvArwwlGCAq0fAgP3Zi4R0EdpEQgzPgrZhIXfKgVzTjxZ5j2VdvIjd
	 0qF7BtU8nvxRg==
Date: Thu, 19 Mar 2026 11:58:01 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width calculation
Message-ID: <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me>
In-Reply-To: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: d81a0ea6272180f431473f1ede9984010f0a9144
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98736-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1935A2CADD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using bits_per_component * 3 as the divisor for the compressed INTF
timing width produces constant FIFO errors for the BOE BF068MWM-TD0
panel due to bits_per_component being 10 which results in a divisor
of 30 instead of 24.

Regardless of the compression ratio and pixel depth, 24 bits of
compressed data are transferred per pclk, so the divisor should
always be 24.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 0ba777bda253..5419ef0be137 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -122,19 +122,18 @@ static void drm_mode_to_intf_timing_params(
 =09}
=20
 =09/*
-=09 * for DSI, if compression is enabled, then divide the horizonal active
-=09 * timing parameters by compression ratio. bits of 3 components(R/G/B)
-=09 * is compressed into bits of 1 pixel.
+=09 * For DSI, if DSC is enabled, 24 bits of compressed data are
+=09 * transferred per pclk regardless of the source pixel depth.
 =09 */
 =09if (phys_enc->hw_intf->cap->type !=3D INTF_DP && timing->compression_en=
) {
 =09=09struct drm_dsc_config *dsc =3D
 =09=09       dpu_encoder_get_dsc_config(phys_enc->parent);
+
 =09=09/*
 =09=09 * TODO: replace drm_dsc_get_bpp_int with logic to handle
 =09=09 * fractional part if there is fraction
 =09=09 */
-=09=09timing->width =3D timing->width * drm_dsc_get_bpp_int(dsc) /
-=09=09=09=09(dsc->bits_per_component * 3);
+=09=09timing->width =3D timing->width * drm_dsc_get_bpp_int(dsc) / 24;
 =09=09timing->xres =3D timing->width;
 =09}
 }

--=20
2.53.0



