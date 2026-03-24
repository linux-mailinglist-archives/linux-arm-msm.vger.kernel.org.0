Return-Path: <linux-arm-msm+bounces-99640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJU2N4l+wmnqdAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:07:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C1307E4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13086313FC8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1580A3EF644;
	Tue, 24 Mar 2026 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VSi97/XK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BB83EFD06
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352902; cv=none; b=QWy+QFCwwS3P/jevfr+N+qcmmhG5buKgxWqvY+KFwu5k/v+J7A2KDcsVkesV8XpEVnOmMFj31Wip/Ow6IaFLet6zv0spfYD35FFljVymjiIW9jV6AGGviSDVa7O+3pUbtU0Mb8SL6N69OtZLOWwYDgoHthFIx8d7EQvB5dscj1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352902; c=relaxed/simple;
	bh=dD/BPKC5aT9eeNrRI4lDwbK6ytFidptagGuSLLMES4o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YGX1KJLhQE/kOoXSp9SsgRNe3cCATOEJj3rceBCvo9pBnJy7LQrUkxxx3GAm28u/RTkVXvdrpJbcURX4CMiGfWBq3n2uiPMhQP/c15TZELIUgPMMtPbMO3FK7MmIMWh15Jo9eSb99PquRw7rGSjAAdlznsppEOo4mVUhTpgjteI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VSi97/XK; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352897; x=1774612097;
	bh=dD/BPKC5aT9eeNrRI4lDwbK6ytFidptagGuSLLMES4o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VSi97/XKzyknr6pKLMO8PCBs/Epej648nUMYbEv4763G4GWoh6ut/ZBaIFDoVAFnX
	 jvrvY2SDqjUvmbC0MTkGFGs5PpvPdrI9yaOgy++nsyK7Ao0qTw4KP1Ngl6KBdxwb+n
	 ZsJJne7rMRCxuudjzj5CeOd7Rj7pPNmgRxnlGNAYkMYAviQi29Xl9SczqV1PoYA1j4
	 QyG/Y6rChOU7lkWwNltMNZRQetMC7TAnwxgnjTlCh7ytRQ2rRnVpO67M8VpflU2iLH
	 kyn7nBWnYBJO9aD4o18xWY+winb6EB41R/YhTT3TLYb/DTdfbgd4RxYPQUnsh6TeGt
	 lPASGEVSaxZjg==
Date: Tue, 24 Mar 2026 11:48:09 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 1/5] drm/mipi-dsi: add RGB101010 pixel format
Message-ID: <20260324-dsi-rgb101010-support-v5-1-ff6afc904115@pm.me>
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 480ba65b63d0fe3f5e4b245ea6887b6232cd3b75
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99640-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 639C1307E4A
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



