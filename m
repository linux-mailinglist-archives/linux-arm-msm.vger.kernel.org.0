Return-Path: <linux-arm-msm+bounces-98994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCsnIE1OvmntMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:52:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E142E40B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40E353017DE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 07:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1378523BCF7;
	Sat, 21 Mar 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="rM5Tj8HX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7C3254A0
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079561; cv=none; b=JxvEv2NcKsPr/smGjDfCMXgS5/OtkocXjCqUlT08X+BtJqjxkYJ56AP0hFCLW4jZcw3IXGwnIY0woIWnxRbn/qSXAVgeRjLM+4ZThHxc0GRqbpnDWZ5UCjA2X9n76kFRtBahAKBSqH0PDNMiB6RJvvjti+EIqpSELbGMvn5iB7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079561; c=relaxed/simple;
	bh=gircwKOW0ywrfXjrpGmIf8114zj09cFmRcezKwqZ3MA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RozvkF054si5UwpbQqQb25i7Mqm6S7KDHZRswIH7WFM4U+p84FmvEem2/PAI83YPr2gvZd9nGULYlhM/mF3RDujdg07M3+Sr6P5Grg87K6iNt1Gtl2ofhiE1fSxs0gqQ3gWh5WMDt9khn9RskfdwytMEpLJbKzrJeXh4dFyDVFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=rM5Tj8HX; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774079557; x=1774338757;
	bh=gircwKOW0ywrfXjrpGmIf8114zj09cFmRcezKwqZ3MA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rM5Tj8HXmcx6/twMmRZ16BVflRRl984vDLQj+4hTRIJlzAFvOxANnCrI6v8wtzBNv
	 BPTqgvU4ieqM7yGcySgF65i8gcIOim9qKgfvJMmSs5e7rLAqOxxfYiyV6W65WRWqgw
	 liF6mM413dB0NxjPlL79maMuxy+A/OTuwp5zImwFrcGWz9dnZfze684p3giuAdvpKJ
	 8/OiOP06fzD2oNCd0sbFn1CH9H0XqqVylhBEjiaU5wAS+hrqkIjRUyUccgOuC8HFzn
	 wNcOn/Fnb2bK3RPjDyWv77qrDoJIaI+P1GpkeJZnh+6PhJUWPP49yEEv8EX0Ni2gbY
	 gvYExjNlwwg4w==
Date: Sat, 21 Mar 2026 07:52:30 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v4 2/5] drm/meson: handle RGB101010 in format switches
Message-ID: <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
In-Reply-To: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 827c3af36e90d8440263c62eaf3d19cb861b9eb9
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98994-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 27E142E40B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add RGB101010 to the unsupported format cases to fix -Wswitch warnings
introduced by the addition of the new pixel format.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/me=
son/meson_dw_mipi_dsi.c
index 66c73c512b0e..59fc0083d318 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -119,6 +119,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 =09=09dpi_data_format =3D DPI_COLOR_18BIT_CFG_2;
 =09=09venc_data_width =3D VENC_IN_COLOR_18B;
 =09=09break;
+=09case MIPI_DSI_FMT_RGB101010:
 =09case MIPI_DSI_FMT_RGB666_PACKED:
 =09case MIPI_DSI_FMT_RGB565:
 =09=09return -EINVAL;
@@ -232,6 +233,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_dat=
a,
 =09=09break;
 =09case MIPI_DSI_FMT_RGB666:
 =09=09break;
+=09case MIPI_DSI_FMT_RGB101010:
 =09case MIPI_DSI_FMT_RGB666_PACKED:
 =09case MIPI_DSI_FMT_RGB565:
 =09=09dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);

--=20
2.53.0



