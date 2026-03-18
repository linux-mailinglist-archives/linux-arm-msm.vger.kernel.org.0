Return-Path: <linux-arm-msm+bounces-98338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFn8IbVVumm8UQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:35:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ADF2B702A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAD24301ABA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 07:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA9B2AEF5;
	Wed, 18 Mar 2026 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Y2LADrkC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418B32DCF41
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819192; cv=none; b=ifQvpe53q9s93jrtVzWt3UaUEF1nTSDq5eChty+dVszF2HtB7Xb9ZMzDYGFSZrwr7F+iZTvrPFvCpc6dlCsuCpYJm0U3Mhw0DspSHZrbNJPJB1/JWAzNzLYDrUGRbCO+rYAi4ZWGGX0kXQymVI+mDBIWl0zi1EokSqAec9p7A2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819192; c=relaxed/simple;
	bh=Wy7pmybLcN2EzDYfooh+oiFyI7YbhcMFju9H5ENgtVI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmGzMIxjk4HHExPh4dSleqkVPO63IgEIQbKfPKv1+4n8ufrVPi8MCEgiRSAB4JqZs1nZuerrDsZhstJ79t2wm1nXkXVVCw3Fp2ySxZ9C8LgBAzDB9fZqrqNLSCHrZ2tgmkb81M04SlKXqez3yGn7FAvpMbc18joGMaQxxW+edqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Y2LADrkC; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773819182; x=1774078382;
	bh=Wy7pmybLcN2EzDYfooh+oiFyI7YbhcMFju9H5ENgtVI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Y2LADrkCf8lllWlZ9vKGIPTzW8ZRniVnXdoqByJztTOKg4HhBQBqZhPuhVv1Io7cq
	 IPBF7C53yR1e2YC/g/eOFWjlJKkDTOryK1T4bHI3ApXPrCGtfD3T4gUAOTJ4wATmQH
	 +piLr85kuSZY5rL0erFA487BND7Du9XQYsC0EBgMSMXKzLfmYL6ZT00BxREGODjh1/
	 4B8LHcPjmw17IlniRdJbPjDpNSp831gO23mu1kt/nUi2TLyjNys2ScUkLm4cdny23w
	 5C/93nUpWMjOHvn1IiGiju74r8Op7SIpj/rv5ryDre+kg15+GFgs0IKa67fq5BceHC
	 ayu+E3Kn/R/OA==
Date: Wed, 18 Mar 2026 07:32:58 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] drm/mipi-dsi: add flag for sending all DSC slices in one packet
Message-ID: <20260318-dsi-dsc-slice-per-pkt-v1-1-1bd66b7f9e0c@pm.me>
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v1-0-1bd66b7f9e0c@pm.me>
References: <20260318-dsi-dsc-slice-per-pkt-v1-0-1bd66b7f9e0c@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: e025ce9a6b601b1cd23397e38e9cee7c0f03c5db
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
	TAGGED_FROM(0.00)[bounces-98338-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	URIBL_MULTI_FAIL(0.00)[pm.me:server fail,sea.lore.kernel.org:server fail];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D3ADF2B702A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MIPI DSI v1.3 spec defines two modes for transporting compressed
pixel data: one slice per packet or multiple slice widths in a single
packet (Section 8.8.24 Figure 40).

Add a MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag that panel drivers can
set to indicate that all DSC slices for a line should be packed into a
single packet. When unset should default to 1 slice per packet.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380c8d..d3ad8c5d3ebe 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -138,6 +138,8 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(str=
uct device_node *node);
 #define MIPI_DSI_MODE_LPM=09=09BIT(11)
 /* transmit data ending at the same time for all lanes within one hsync */
 #define MIPI_DSI_HS_PKT_END_ALIGNED=09BIT(12)
+/* pack all DSC slices for a line into a single packet */
+#define MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT=09BIT(13)
=20
 enum mipi_dsi_pixel_format {
 =09MIPI_DSI_FMT_RGB888,

--=20
2.53.0



