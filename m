Return-Path: <linux-arm-msm+bounces-98610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AUcHt90u2mckQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:00:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F2B2C5CAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7583F30ADB85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1C82E5B2D;
	Thu, 19 Mar 2026 04:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QfPzEGli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431FC2D7810;
	Thu, 19 Mar 2026 04:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773892809; cv=none; b=HWgL6rrjI0mVA/x5K/wQVJobRC82gxCriLQqOdnSlcasgrele9hOnMT4GKSq9ZN/WPSRKBOel9nZezejyn96+pihB6hoogrqtPWEZbxA8wdUd+mR1fs5x2ij8I/MK7ecaqd3hQJMc/I5LpnxzwqPj9IUMfjFL4AnC0guT58IFMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773892809; c=relaxed/simple;
	bh=dD/BPKC5aT9eeNrRI4lDwbK6ytFidptagGuSLLMES4o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QpC09eJAbdsmwq0ZC633XGsTkkPiwtKcU4eZHs4AzSpNwOAN8pVKghwaRBsUHOK6PE72Wlb0uS9sqdE+yUcuVZIM4oIGTMb5RZMmkLCnIQL45MR7KcNeM0JRzxVHY11IgWPQ8m99xwBzXy96PKpcjbgbaB+jebsxidO7poZ1nRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QfPzEGli; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773892806; x=1774152006;
	bh=dD/BPKC5aT9eeNrRI4lDwbK6ytFidptagGuSLLMES4o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QfPzEGliEXKb8VbfjeqZep2AZal6LNwmNkzmhnHj5N+JxyBuw0LTlI/64MruOC90J
	 1WQEZRfpRCnLJnmyLs4gf7xZ0IysuKkOMGwsgrdXAvcxByXDgJeZ3NXXvQ0K3aSAoy
	 dg7G8TlimFMYCNFEnRMsL/GiPx3B8vCL0q8lB4HdHLKSOt4jLL0fvp+oRi8hHqfErr
	 ZDVcvC8a0Dgpt+j5O6wg6K5wsVkPN/mV0AoHBKCoRDGTw9BizvH3+p3Wprog7WIefl
	 90Aj5LhzTFm6pPK6adLWgsxs0ShmyDApiVdgDEElY8CETET2Tc6VbLkW2pKQJ8CEqa
	 KRznc3Yjs13jg==
Date: Thu, 19 Mar 2026 04:00:01 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 1/3] drm/mipi-dsi: add RGB101010 pixel format
Message-ID: <20260318-dsi-rgb101010-support-v2-1-698b7612eaeb@pm.me>
In-Reply-To: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me>
References: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 885ab5d382f2949f45e29c33c5f5c86b683a34c0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98610-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: E6F2B2C5CAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add MIPI_DSI_FMT_RGB101010 for 30 bit (10,10,10 RGB) pixel format,
corresponding to the packed 30 bit pixel stream defined in MIPI DSI
v1.3 Section 8.8.17.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 include/drm/drm_mipi_dsi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380c8d..a822e9e876af 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -140,6 +140,7 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(str=
uct device_node *node);
 #define MIPI_DSI_HS_PKT_END_ALIGNED=09BIT(12)
=20
 enum mipi_dsi_pixel_format {
+=09MIPI_DSI_FMT_RGB101010,
 =09MIPI_DSI_FMT_RGB888,
 =09MIPI_DSI_FMT_RGB666,
 =09MIPI_DSI_FMT_RGB666_PACKED,
@@ -235,6 +236,9 @@ extern const struct bus_type mipi_dsi_bus_type;
 static inline int mipi_dsi_pixel_format_to_bpp(enum mipi_dsi_pixel_format =
fmt)
 {
 =09switch (fmt) {
+=09case MIPI_DSI_FMT_RGB101010:
+=09=09return 30;
+
 =09case MIPI_DSI_FMT_RGB888:
 =09case MIPI_DSI_FMT_RGB666:
 =09=09return 24;

--=20
2.53.0



