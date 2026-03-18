Return-Path: <linux-arm-msm+bounces-98372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HidIBt0umkeWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:44:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F30092B9564
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBC643144A46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4C83BA248;
	Wed, 18 Mar 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TgCZIB3F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1733B3C14
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826882; cv=none; b=hVXKBVE/u383ojvGVCsYFckTZMRwDVXdnbOZPakGJ68P5SPLCcfUudtN3ZO3macaLep4V0OUO5TVmW0xCXEZzMHgExQlxZrr+RdgalMFTlrwISsber8TXmB+I/xUXCEiGwcStKBee/xyKXTO3Dc1Yq/3ndlSZoDNXXxgNR5q2jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826882; c=relaxed/simple;
	bh=aWHEptyM6a+34VtSHTwQvgBH2GrR4Nymj/lmmVkwGGY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aXLhEDnjramMkQL/9OD/hzmVRzs0y64EHNgGeJJUWpqyzZLfLs4KA3flBLlN5CTugtPm+W8ZROFPcAg7WwpPqP4H1QBhs6/jVr3lB0RPeyoU54cQAUpmbd4sBTIttynx6jIm5rvjynP7AUzygtAaJGRBAPIJwgopt4NiPj47AXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TgCZIB3F; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773826872; x=1774086072;
	bh=pp3XZb0ALhTP7LyMnVusUzUvvZEvNzyavN4uuB4T2gk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TgCZIB3FYcuhgLiyqxCnROt5SGZHW2ZV8qQddZd18qOJVzdSwxjMWNA3n2L33r3Kr
	 gRvXQdzzzSw4M/Tysrbp9S8j9Eq4IV8u9jHpC6cL/rREJOpEdV642dSzOvVye7eBOD
	 DG5QFLsXJuj7BDQcJG+Moc79u/mep3yUVrtqilAeWbz8G9jRxiE+qxwT2wbujAVU4S
	 1dfn72rfiokGqOGcBoTrzF7IgfP7ffv5k7ln4QK622S82ucCuf7KCBXmiB04AO+h0N
	 viSgKpaDH0AZm5ARdTgw0JgD4d0/irXbwWnZx6ng6P0wfFahBG7VHreGa5rL6lFBNx
	 /w5UneVSx1d0Q==
Date: Wed, 18 Mar 2026 09:41:09 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 3/3] drm/msm/dpu: fix video mode DSC INTF timing width for non 8 bit panels
Message-ID: <20260318-dsi-rgb101010-support-v1-3-6021eb79e796@pm.me>
In-Reply-To: <20260318-dsi-rgb101010-support-v1-0-6021eb79e796@pm.me>
References: <20260318-dsi-rgb101010-support-v1-0-6021eb79e796@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 00294e59a403e87f8b55690d224023b92ed5dd9a
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98372-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: F30092B9564
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using bits_per_component * 3 as the divisor for the compressed INTF
timing width produces constant FIFO errors for panels such as the BOE
BF068MWM-TD0 which is a 10 bit panel.

The downstream driver calculates the compressed timing width by
dividing the total compressed bytes per line by 3 which does not depend
on bits_per_component. Switch the divisor to 24 to match downstream.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 0ba777bda253..9b046a0e77aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -122,19 +122,21 @@ static void drm_mode_to_intf_timing_params(
 =09}
=20
 =09/*
-=09 * for DSI, if compression is enabled, then divide the horizonal active
-=09 * timing parameters by compression ratio. bits of 3 components(R/G/B)
-=09 * is compressed into bits of 1 pixel.
+=09 * For DSI, if DSC is enabled, use a fixed divisor of 24 rather than
+=09 * bits_per_component * 3 when calculating the compressed timing width.
+=09 *
+=09 * This matches the downstream driver and is required for panels with
+=09 * bits_per_component !=3D 8.
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



