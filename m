Return-Path: <linux-arm-msm+bounces-98996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAPNOWROvmnJMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:53:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 498BB2E4104
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0049300F51D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 07:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7C3337B99;
	Sat, 21 Mar 2026 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="i7rnNbQh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FA3242AB
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079585; cv=none; b=ZSVP96Ry3QzIRFD6DooZfx0Su9Fv0JKeOZjrbGZ8uBJKTQSlzbQyes4AbENnlIFaeZhJcYbtkuA/gnVDmN1AteKgnuAjipsnybccjA8bmyu63+Baq/EPtbogbRRYfA9ONLgYbvtLY/YNW1roDhTVIndim8c80ppZ7VgXO+qOCBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079585; c=relaxed/simple;
	bh=Mh1PNSDh4egjT99i3znVirqhMp1QvCuSXegWWStQiUI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+dWwwC36uFK07sV5Z2UCI1pdZiu1yI8he43ThgOChYOwmtBYZDHA5M19xewuN/FT7frjs5cHZQvGUZOD/+GXKfmuXww0hzPcHoOufmYH/xbHBBA1i3ThLa3P3NB57MJppjhA5hrLQlEjJOJOqtW/LOK87GcTBb3ZjsoJejb/ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=i7rnNbQh; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774079581; x=1774338781;
	bh=VIjFEoU5kuSs8on1xHPBMp4W/LcZNwtBH4t9BMnjpcM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=i7rnNbQhaPSKpF1d6rSWnhEXzbgrw/1jVTnJrwVzN3jy9f+6SqCdWm3jNcbNJOc+2
	 gm0DX4CRW2kPVdS7DnVmP4QcVibodGzYstXHgGrjH4Z5TnCy7jWkowmI8hhkPFpbBt
	 Dzlx8lluTxgzhepENH6nfYVo2d6sT5B38YUyEb8964Q+/phBxFBpSJ3hEBprFOLb/o
	 VD+L5bYRLT0RQZvYg780FIYCglhuGdh9B3tDRufMsMSZWuqY8JYsEtSf2T5JUWd48Y
	 RwGBIjUFDsnT+Y+anr8bWOguuS3StbobyFKbW7SmhxoZz7bcT+c5rLY7wwJ2+9PnKm
	 p9LfqeokhT0nA==
Date: Sat, 21 Mar 2026 07:52:55 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 5/5] drm/msm/dsi: Add support for RGB101010 pixel format
Message-ID: <20260321-dsi-rgb101010-support-v4-5-eb28ecebbfe8@pm.me>
In-Reply-To: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 74e88428093f1c2459eaaeb3576114a45fa4c3bd
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98996-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 498BB2E4104
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add video and command mode destination format mappings for RGB101010,
and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits to accommodate
the new format value.

Make sure this is guarded behind MSM_DSI_6G_VER >=3D V2.1.0 as anything
older does not support this.

Required for 10 bit panels such as the BOE BF068MWM-TD0.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 10 ++++++++++
 drivers/gpu/drm/msm/registers/display/dsi.xml |  5 ++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/d=
si_host.c
index b55ffe2fdec3..67b33f46a93c 100644
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
@@ -1706,6 +1708,14 @@ static int dsi_host_attach(struct mipi_dsi_host *hos=
t,
 =09if (dsi->lanes > msm_host->num_data_lanes)
 =09=09return -EINVAL;
=20
+=09if (dsi->format =3D=3D MIPI_DSI_FMT_RGB101010 &&
+=09    !msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
+=09=09=09=09     MSM_DSI_6G_VER_MINOR_V2_1_0)) {
+=09=09DRM_DEV_ERROR(&msm_host->pdev->dev,
+=09=09=09      "RGB101010 not supported on this DSI controller\n");
+=09=09return -EINVAL;
+=09}
+
 =09msm_host->channel =3D dsi->channel;
 =09msm_host->lanes =3D dsi->lanes;
 =09msm_host->format =3D dsi->format;
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



