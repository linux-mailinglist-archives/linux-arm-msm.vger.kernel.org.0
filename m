Return-Path: <linux-arm-msm+bounces-99641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C+OKD18wmnqdAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:57:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4537C307C27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1CAB304EF3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916C63F2115;
	Tue, 24 Mar 2026 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gglrElKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6493F0AB3;
	Tue, 24 Mar 2026 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352912; cv=none; b=GaAogzVXEFnjvzrYOt5oV+C+VLbcAomI+sxyhAav/qKXbOfY4K503eMb5rfFaddHzuCIIvP2y3z2P2CRnA1GZtvsbdojY7W3azHnps9qbmv/1DxlBgK0C8qB0njdWFLKowswhy5rjeLK92BHpPjC9xZK8f4hhdV6g+k3ETJWwvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352912; c=relaxed/simple;
	bh=VRl6+bQSrvvEcwcEsxNzNmjm4DwgoFEo/s2/NFGDH+Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQIRwmLLhS/hDyvXoci+G08RpwI9DqVZbpHJMIkXVQI2w2LMVlCJ6K2sYD3+sZpVoAiRLqAaT0wchsU04OzJNrQwzLF2xZZsT6JiCvZazfDd/hg9p1O0PKAqn+QKR1qg3NDI+MUbuUhGuqIDYZLQhQETsExjcPEiDjSdHAJ40fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gglrElKf; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352903; x=1774612103;
	bh=VRl6+bQSrvvEcwcEsxNzNmjm4DwgoFEo/s2/NFGDH+Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gglrElKfA4oKICZE9ZQA8V4KLVGciE1d5/9strNJ3CLEmQrS2r8PAi9z8o9ze0xtU
	 dwrjABH1jlnjC+mkvY6CVOR+yTK2mU5amOwUmR0PHmrHRuPt2vLdtahMob6OmBZiIp
	 QobebVRgQMeqh3rvG5DCoPBqfFVaPVkauG3GmYz00pAEi0EhGzb8TO+gm7hbEzGo7X
	 +jlJNX5H4GPGj47+ehvwRDL9GXHTwT6fYi+uh1uIH/cA0Ubo/TX2IRTOtEgUIY2hUB
	 nTihCRZKMhsGQtFMNt4gUoHj05GgUcD0gu9e47qzlHP1NpCJL6EgPgGkjdkIMrqabM
	 EKsd0lhRCy8yw==
Date: Tue, 24 Mar 2026 11:48:17 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v5 2/5] drm/meson: use default case for unsupported DSI pixel formats
Message-ID: <20260324-dsi-rgb101010-support-v5-2-ff6afc904115@pm.me>
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 8e6fb45145c770093500cd0a9292ca2a6ee94627
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99641-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4537C307C27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use default instead of listing unsupported formats explicitly, so the
switch statements don't need updating each time a new pixel format is
added.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/me=
son/meson_dw_mipi_dsi.c
index 66c73c512b0e..4412bd678108 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -119,8 +119,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 =09=09dpi_data_format =3D DPI_COLOR_18BIT_CFG_2;
 =09=09venc_data_width =3D VENC_IN_COLOR_18B;
 =09=09break;
-=09case MIPI_DSI_FMT_RGB666_PACKED:
-=09case MIPI_DSI_FMT_RGB565:
+=09default:
 =09=09return -EINVAL;
 =09}
=20
@@ -232,8 +231,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_dat=
a,
 =09=09break;
 =09case MIPI_DSI_FMT_RGB666:
 =09=09break;
-=09case MIPI_DSI_FMT_RGB666_PACKED:
-=09case MIPI_DSI_FMT_RGB565:
+=09default:
 =09=09dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
 =09=09return -EINVAL;
 =09}

--=20
2.53.0



