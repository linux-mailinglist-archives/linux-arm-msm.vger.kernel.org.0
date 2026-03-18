Return-Path: <linux-arm-msm+bounces-98379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD0UMWx2ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:54:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5914A2B97FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A16B33012D03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6E03BA24B;
	Wed, 18 Mar 2026 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="To9GZ6FP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34DA382291
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827668; cv=none; b=ngaHmZp1OPAwvxijsjKNrBT4hgYSx6cSMWIVdt0BKR1E+VLcqbjD+Ph/HrVIzPJU0RNxECL0x2Siu8oE7XUYUphwStl2SOzVzLqLUpwBH21Cb7Usd6ugbmVANM2r779gMf/IQhKRnT88ktNOVNATG2rttE41tk2Ejm6/X7V84Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827668; c=relaxed/simple;
	bh=5qSjDne/iFsggNeLug5cvZNfuY3uHkfAcnxR73bBwss=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S9gS+taeLvtD1QbdfAACT8sAjXUCho+9O93qfTKmB0pOKLP5dXvdtDdurx/VaTG1I5beQ1c3xcm2DQjh5Ey1jW1O//RbruV7LAfx4TSZ4olTCh/PR3FfBl8+0f9BZpvIBd7vXBsKeKDNZImF9YHitSxhMZkkUGWAkdKJ/571Wlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=To9GZ6FP; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773827652; x=1774086852;
	bh=ZvJ/7shirC546tu3Qvvv+nTQ0LiLQyarVEjf06bBYsw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=To9GZ6FP8Qe55WfhBL0mP+v8hSJMObOShVbNLb4pJsM9D+zpUerZBR7Mg9O3rZPcY
	 2EBNNllFJD6Klk++xdfkN27RT79PdCtCO1FBqFJ0YhCiaxmG9S0n8Lu5H2aCLn5wGL
	 di5RCnXB0Doz303Z+6+LwZnUDxeYrPxAtOSa4aeN0yhxJoNiKCfT5sDfIhD4dVNNhf
	 ANw/Aa0b6iHXuFvOVcoK0Pt+h6fWlcc8xtNbTBiPggXlsxubOi9SJhE4IeJp3ns8+H
	 PnnhjxgyjREV83Gk7mslNr4w1cjt7YbdZWJHy/wqDbQAIo5vXH9U2DRQbxNGY40kGz
	 LCvFEuH7JIP9g==
Date: Wed, 18 Mar 2026 09:54:08 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>, Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v2 2/2] drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
Message-ID: <20260318-dsi-dsc-slice-per-pkt-v2-2-0a1b316f8250@pm.me>
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 946c12605bb56f903f60b9e6ca9f8a98b3a6cec4
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98379-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,marek.ca:email]
X-Rspamd-Queue-Id: 5914A2B97FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jonathan Marek <jonathan@marek.ca>

Some panels support multiple slice to be sent in a single DSC packet and
this feature is a must for specific panels, such as the JDI LPM026M648C.

Use the MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag to derive slice_per_pkt
from slice_count, note that most panels are expected to just work with
just one slice per packet.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/d=
si_host.c
index db6da99375a1..758b076ee4bf 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -166,6 +166,7 @@ struct msm_dsi_host {
=20
 =09struct drm_display_mode *mode;
 =09struct drm_dsc_config *dsc;
+=09unsigned int dsc_slice_per_pkt;
=20
 =09/* connected device info */
 =09unsigned int channel;
@@ -927,17 +928,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host=
 *msm_host, bool is_cmd_mod
 =09slice_per_intf =3D dsc->slice_count;
=20
 =09total_bytes_per_intf =3D dsc->slice_chunk_size * slice_per_intf;
-=09bytes_per_pkt =3D dsc->slice_chunk_size; /* * slice_per_pkt; */
+=09bytes_per_pkt =3D dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
=20
 =09eol_byte_num =3D total_bytes_per_intf % 3;
-
-=09/*
-=09 * Typically, pkt_per_line =3D slice_per_intf * slice_per_pkt.
-=09 *
-=09 * Since the current driver only supports slice_per_pkt =3D 1,
-=09 * pkt_per_line will be equal to slice per intf for now.
-=09 */
-=09pkt_per_line =3D slice_per_intf;
+=09pkt_per_line =3D slice_per_intf / msm_host->dsc_slice_per_pkt;
=20
 =09if (is_cmd_mode) /* packet data type */
 =09=09reg =3D DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_=
DCS_LONG_WRITE);
@@ -1088,12 +1082,8 @@ static void dsi_timing_setup(struct msm_dsi_host *ms=
m_host, bool is_bonded_dsi)
 =09=09else
 =09=09=09/*
 =09=09=09 * When DSC is enabled, WC =3D slice_chunk_size * slice_per_pkt +=
 1.
-=09=09=09 * Currently, the driver only supports default value of slice_per=
_pkt =3D 1
-=09=09=09 *
-=09=09=09 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
-=09=09=09 *       and adjust DSC math to account for slice_per_pkt.
 =09=09=09 */
-=09=09=09wc =3D msm_host->dsc->slice_chunk_size + 1;
+=09=09=09wc =3D msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_=
pkt + 1;
=20
 =09=09dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 =09=09=09DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
@@ -1702,8 +1692,13 @@ static int dsi_host_attach(struct mipi_dsi_host *hos=
t,
 =09msm_host->lanes =3D dsi->lanes;
 =09msm_host->format =3D dsi->format;
 =09msm_host->mode_flags =3D dsi->mode_flags;
-=09if (dsi->dsc)
+=09if (dsi->dsc) {
 =09=09msm_host->dsc =3D dsi->dsc;
+=09=09if (dsi->mode_flags & MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT)
+=09=09=09msm_host->dsc_slice_per_pkt =3D dsi->dsc->slice_count;
+=09=09else
+=09=09=09msm_host->dsc_slice_per_pkt =3D 1;
+=09}
=20
 =09ret =3D dsi_dev_attach(msm_host->pdev);
 =09if (ret)

--=20
2.53.0



