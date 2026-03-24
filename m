Return-Path: <linux-arm-msm+bounces-99644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICRUCEd/wmnqdAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:10:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219F307F26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02F9E306B5D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D193F6614;
	Tue, 24 Mar 2026 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TtcY3tm4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D43F7A80;
	Tue, 24 Mar 2026 11:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352945; cv=none; b=irUkjRYWh+7KZvwMrlPThmUH9jxZikvmGcy+4PWeEb7mlXlgyl57Gv48FwgjrvnasaNk+nUI+j/P/kADY0iPDtiwYEqM0m4J0b4uKoZ8yTR3l7cr5f0x7RN+gFZCky1izk/VY5hBjoTRKW5wHAnfz/N3QnljwZowZsnVfHdj33g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352945; c=relaxed/simple;
	bh=vLvgdi11VHKEU4eD6ghhcLjRoMzvQXs89IwaX9Ze+jk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nz6I7F2QHBbJYvNZQ9MrYffKhjo/sPa0+KdP/MHPOGMbCjfQ08OaUc/HTXx038UQkGX4U33bTTKTEA4Zf11BapS+AkQG5FY6Pu4UlrVWtKwPCtSfbzxXjSNa816UyaNAyCP2QEs77OAB5oN5Cmh78R897htZSNK1I7E1tWcTzQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TtcY3tm4; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352937; x=1774612137;
	bh=Fy41l+CjiLxNPt1yzWCa9yREYcMW6OvI12kT5kkLAYw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TtcY3tm4izlAS15nSq8Hs6ZPAm56+k3IEtsZ2JHiqlwUaD+TeYISztpIeXE651GGo
	 xbkwQLOhTTVg46bz1aq2Nm+pNV0UK6t5MOGv6DFk67sHiLJrwFfdxXwwZrdXlKlh8y
	 j0BMl8r8kHlKj3i3WoIBifCNCNU0VJN6JnN+pbN6U2yMi77HwgXPUblgExuMcdR4RW
	 Pw9qf42iRZDDgUnLbuNbOXkCNDKdIj2pFbVaIdUhTl7AwXO6Q3Y/9pn9HZSWYrNcJM
	 /v+b8mBvZ2uBieKZIhgutpsfX4Ad3ZoNL0IVeU8Crs/h74GcjEHe1hITPk7UOWiyym
	 bRfgSWumsvrgA==
Date: Tue, 24 Mar 2026 11:48:49 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 5/5] drm/msm/dsi: Add support for RGB101010 pixel format
Message-ID: <20260324-dsi-rgb101010-support-v5-5-ff6afc904115@pm.me>
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 28fd0706425e97bd489645195d5853b55e9e1c64
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99644-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1219F307F26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add video and command mode destination format mappings for RGB101010,
and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits to accommodate
the new format value.

Make sure this is guarded behind MSM_DSI_6G_VER >=3D V2.1.0 as anything
older does not support this.

Required for 10 bit panels such as the BOE BF068MWM-TD0 found on the
Nothing Phone (3a).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/registers/display/dsi.xml |  5 ++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/d=
si_host.c
index b55ffe2fdec3..992407bbea84 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -757,6 +757,7 @@ static inline enum dsi_vid_dst_format
 dsi_get_vid_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 =09switch (mipi_fmt) {
+=09case MIPI_DSI_FMT_RGB101010:=09return VID_DST_FORMAT_RGB101010;
 =09case MIPI_DSI_FMT_RGB888:=09return VID_DST_FORMAT_RGB888;
 =09case MIPI_DSI_FMT_RGB666:=09return VID_DST_FORMAT_RGB666_LOOSE;
 =09case MIPI_DSI_FMT_RGB666_PACKED:=09return VID_DST_FORMAT_RGB666;
@@ -769,6 +770,7 @@ static inline enum dsi_cmd_dst_format
 dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 =09switch (mipi_fmt) {
+=09case MIPI_DSI_FMT_RGB101010:=09return CMD_DST_FORMAT_RGB101010;
 =09case MIPI_DSI_FMT_RGB888:=09return CMD_DST_FORMAT_RGB888;
 =09case MIPI_DSI_FMT_RGB666_PACKED:
 =09case MIPI_DSI_FMT_RGB666:=09return CMD_DST_FORMAT_RGB666;
@@ -1713,6 +1715,26 @@ static int dsi_host_attach(struct mipi_dsi_host *hos=
t,
 =09if (dsi->dsc)
 =09=09msm_host->dsc =3D dsi->dsc;
=20
+=09if (msm_host->format =3D=3D MIPI_DSI_FMT_RGB101010) {
+=09=09if (!msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
+=09=09=09=09=09      MSM_DSI_6G_VER_MINOR_V2_1_0)) {
+=09=09=09DRM_DEV_ERROR(&msm_host->pdev->dev,
+=09=09=09=09      "RGB101010 not supported on this DSI controller\n");
+=09=09=09return -EINVAL;
+=09=09}
+
+=09=09/*
+=09=09 * Downstream overrides RGB101010 back to RGB888 when DSC is enabled
+=09=09 * but widebus is not. Using RGB101010 in this case may require some
+=09=09 * extra changes.
+=09=09 */
+=09=09if (msm_host->dsc &&
+=09=09    !msm_dsi_host_is_wide_bus_enabled(&msm_host->base)) {
+=09=09=09dev_warn(&msm_host->pdev->dev,
+=09=09=09=09 "RGB101010 with DSC but without widebus, may need extra chang=
es\n");
+=09=09}
+=09}
+
 =09ret =3D dsi_dev_attach(msm_host->pdev);
 =09if (ret)
 =09=09return ret;
diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/dr=
m/msm/registers/display/dsi.xml
index c7a7b633d747..e40125f75175 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
@@ -15,6 +15,7 @@ xsi:schemaLocation=3D"https://gitlab.freedesktop.org/free=
dreno/ rules-fd.xsd">
 =09=09<value name=3D"VID_DST_FORMAT_RGB666" value=3D"1"/>
 =09=09<value name=3D"VID_DST_FORMAT_RGB666_LOOSE" value=3D"2"/>
 =09=09<value name=3D"VID_DST_FORMAT_RGB888" value=3D"3"/>
+=09=09<value name=3D"VID_DST_FORMAT_RGB101010" value=3D"4"/>
 =09</enum>
 =09<enum name=3D"dsi_rgb_swap">
 =09=09<value name=3D"SWAP_RGB" value=3D"0"/>
@@ -39,6 +40,7 @@ xsi:schemaLocation=3D"https://gitlab.freedesktop.org/free=
dreno/ rules-fd.xsd">
 =09=09<value name=3D"CMD_DST_FORMAT_RGB565" value=3D"6"/>
 =09=09<value name=3D"CMD_DST_FORMAT_RGB666" value=3D"7"/>
 =09=09<value name=3D"CMD_DST_FORMAT_RGB888" value=3D"8"/>
+=09=09<value name=3D"CMD_DST_FORMAT_RGB101010" value=3D"9"/>
 =09</enum>
 =09<enum name=3D"dsi_lane_swap">
 =09=09<value name=3D"LANE_SWAP_0123" value=3D"0"/>
@@ -142,7 +144,8 @@ xsi:schemaLocation=3D"https://gitlab.freedesktop.org/fr=
eedreno/ rules-fd.xsd">
 =09</reg32>
 =09<reg32 offset=3D"0x0000c" name=3D"VID_CFG0">
 =09=09<bitfield name=3D"VIRT_CHANNEL" low=3D"0" high=3D"1" type=3D"uint"/>=
  <!-- always zero? -->
-=09=09<bitfield name=3D"DST_FORMAT" low=3D"4" high=3D"5" type=3D"dsi_vid_d=
st_format"/>
+=09=09<!-- high was 5 before DSI 6G 2.1.0 -->
+=09=09<bitfield name=3D"DST_FORMAT" low=3D"4" high=3D"6" type=3D"dsi_vid_d=
st_format"/>
 =09=09<bitfield name=3D"TRAFFIC_MODE" low=3D"8" high=3D"9" type=3D"dsi_tra=
ffic_mode"/>
 =09=09<bitfield name=3D"BLLP_POWER_STOP" pos=3D"12" type=3D"boolean"/>
 =09=09<bitfield name=3D"EOF_BLLP_POWER_STOP" pos=3D"15" type=3D"boolean"/>

--=20
2.53.0



