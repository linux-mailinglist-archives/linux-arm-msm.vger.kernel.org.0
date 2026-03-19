Return-Path: <linux-arm-msm+bounces-98734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAWyIVPmu2njpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:04:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E65692CADAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CE853195ABF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E2C3CE48B;
	Thu, 19 Mar 2026 11:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="C29Cr/53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A483CE4AE;
	Thu, 19 Mar 2026 11:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921487; cv=none; b=gBAs715cfSsA41yPmQcSOztxWkvYQZT9eGF1GPCtRsjkWc+6zR2qVuvbq71FJ9Q8ZZESxKSIUPy7S2twa56qkxGGGPAQrHfuzN8mkPc23cPq6wdGOIkCJPCzHilFn3w/n7OqFtHd6FotMRd0B1UtlQI471lQ9x+ZIgRaIK7bqxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921487; c=relaxed/simple;
	bh=DL0GpW+kzDsrrxyOK4gNn0MpqXFnrkD1jnMQBttZGyA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jrDU1sJT/3hqc5m4/+9rakAGtDE0Gd7+4U40cUEji6wLdP8O3eK1EeFdpMvOol6/bPQ2El2dtGzwQrUHhd+5KJEwXuc8kAbDVHArUJCxYmP65euC5HlvgiPHap46kTsY2KgvvN8PbUtXU/Spz0qu0D5YOqo/Y9PIjl/II5hYI6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=C29Cr/53; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773921477; x=1774180677;
	bh=ico9fmTabz68G+Eocm9YW0/Chfw5+TodJeMB9fAJtSo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=C29Cr/535XN0PgjM03LuMD4k6Fk6ua0Bf2Rm+SWr+GWnHWbpR2zWw3CZ1ctNo963w
	 bxnkzH9ToJJpImrg1mF6mwKnE+Hp8SmMSa0wqVrGjJVkonKFmb2s0/pTTglQjci6WW
	 9JZKmXDkZDLew+Aton9F0W64kAWF3EvBTusA2ti7AH1u66PScwYbOL5YxfTHzrQuZ3
	 VcNznwX3PhM556jdyqzcdsuiUzxv8fSoAfnzQdoieOgK3z++JJ62W01Y85qWXa0vI/
	 Mo8ZU++SXF7Af3yvImEJivZuwRUfWkfWlg5N8h6bfaHzditKeJXGe03/G2IPM8Me0z
	 opCxdapP0ooQQ==
Date: Thu, 19 Mar 2026 11:57:52 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 2/4] drm/msm/dsi: add DSI version >= comparison helper
Message-ID: <20260319-dsi-rgb101010-support-v3-2-85b99df2d090@pm.me>
In-Reply-To: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 77a4d8c657b172cb5f3f3be2d412197045375a61
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
	TAGGED_FROM(0.00)[bounces-98734-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E65692CADAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a helper for checking if the DSI hardware version is greater
than or equal to a given version, for use in a future change.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/d=
si_host.c
index db6da99375a1..6fad9a612d4d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -782,13 +782,20 @@ static void dsi_ctrl_disable(struct msm_dsi_host *msm=
_host)
 =09dsi_write(msm_host, REG_DSI_CTRL, 0);
 }
=20
+static bool msm_dsi_host_version_ge(struct msm_dsi_host *msm_host,
+=09=09=09=09    u32 major, u32 minor)
+{
+=09return msm_host->cfg_hnd->major =3D=3D major &&
+=09       msm_host->cfg_hnd->minor >=3D minor;
+}
+
 bool msm_dsi_host_is_wide_bus_enabled(struct mipi_dsi_host *host)
 {
 =09struct msm_dsi_host *msm_host =3D to_msm_dsi_host(host);
=20
 =09return msm_host->dsc &&
-=09=09(msm_host->cfg_hnd->major =3D=3D MSM_DSI_VER_MAJOR_6G &&
-=09=09 msm_host->cfg_hnd->minor >=3D MSM_DSI_6G_VER_MINOR_V2_5_0);
+=09=09msm_dsi_host_version_ge(msm_host, MSM_DSI_VER_MAJOR_6G,
+=09=09=09=09=09MSM_DSI_6G_VER_MINOR_V2_5_0);
 }
=20
 static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,

--=20
2.53.0



