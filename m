Return-Path: <linux-arm-msm+bounces-98611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH3fGex0u2mckQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:00:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1952C5CC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 559B6301BA55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF432D877C;
	Thu, 19 Mar 2026 04:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="bRiJ6h6G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E831ED68
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773892819; cv=none; b=hWYljIeawSxfu5k0GaeK8nEElZqbWV6zoQ9W4nXKR9NMZxEuhlKs6ibsxcmWg03dHQ1o3DavKcIt95NK5Q2opTI4DMEDvtAuPcxqmVXv6q22OdgICjNYb982iVyWRGDzM4akPCdBcnC+XRx5rGN2dlH/fxLiBymZXybl5I/VDTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773892819; c=relaxed/simple;
	bh=KytQ7DJApb7Lu6sR9iaCe4J/geuHSwUOzeOrHrLg7EQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dn9pog9I6LV6zpOGDkDkwty+ELh2sVxhuBEeFKyEBYDzwI3Y7hilkFYQr+J5JzHxNmqRA0xDTaeQgEdF4tQNDGCZMLPNf4yvQY/MbrmkKI/6HV5+CJRIu3gHRR7oMBrm8EQs92BlATU0RCoqjxZuN8twszlUVmYmDRALLXsPq+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=bRiJ6h6G; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773892810; x=1774152010;
	bh=FIhqYnvDqEqh4gLmHXirrSB58x2I5CZdQyjrMqWKARE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bRiJ6h6GjafcuLXpdRNN3yMXVTX20R+K1o6gxuUj94OzzguM7/st66UTjCRNLI6xz
	 yqgSDgQjUQZFHd/mUj78CJCaPTYNJBUBAT4mm7QmXGBGYL5hk6Eq9Vq46oIDtfHfi+
	 tRZ8Jsj942bc99Mpl/ItCyUU79AtsWqokxOyfBXOd/aeS4ZuV1Dk+UjDjnnp4z+lqp
	 orPkXRyFXZ3ECYTptRCX5DsdVg9Ybfqi1UBshyzFwEsanDbDUEvf+rTChXYvjN9/s4
	 cWDp9RhxDf/Zn2E1Q2CORzbUoTKb0CXx9rs5/djmOoMmeCaa13cIcZq48aGtZ8HYnI
	 A13F6Mc0xCyRw==
Date: Thu, 19 Mar 2026 04:00:05 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 2/3] drm/msm/dsi: Add support for RGB101010 pixel format
Message-ID: <20260318-dsi-rgb101010-support-v2-2-698b7612eaeb@pm.me>
In-Reply-To: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me>
References: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 333f197c982a3645d0cf94f99cb8a44c643d3a4c
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98611-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gitlab.freedesktop.org:url,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 6C1952C5CC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add video and command mode destination format mappings for RGB101010,
and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits to accommodate
the new format value.

Make sure this is guarded behind MSM_DSI_6G_VER >=3D V2.1.0 as anything
older does not support this.

Required for 10 bit panels such as the BOE BF068MWM-TD0.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 8 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             | 1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 9 +++++++++
 drivers/gpu/drm/msm/registers/display/dsi.xml | 5 ++++-
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/ds=
i_cfg.c
index bd3c51c350e7..6a7ea2183a3b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -133,6 +133,7 @@ static const struct msm_dsi_config msm8998_dsi_cfg =3D =
{
 =09.io_start =3D {
 =09=09{ 0xc994000, 0xc996000 },
 =09},
+=09.has_rgb30 =3D true,
 };
=20
 static const char * const dsi_sdm660_bus_clk_names[] =3D {
@@ -152,6 +153,7 @@ static const struct msm_dsi_config sdm660_dsi_cfg =3D {
 =09.io_start =3D {
 =09=09{ 0xc994000, 0xc996000 },
 =09},
+=09.has_rgb30 =3D true,
 };
=20
 static const char * const dsi_v2_4_clk_names[] =3D {
@@ -173,6 +175,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg =3D {
 =09=09{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 */
 =09=09{ 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6375 */
 =09},
+=09.has_rgb30 =3D true,
 };
=20
 static const struct regulator_bulk_data sm8550_dsi_regulators[] =3D {
@@ -188,6 +191,7 @@ static const struct msm_dsi_config sm8550_dsi_cfg =3D {
 =09.io_start =3D {
 =09=09{ 0xae94000, 0xae96000 },
 =09},
+=09.has_rgb30 =3D true,
 };
=20
 static const struct regulator_bulk_data sm8650_dsi_regulators[] =3D {
@@ -203,6 +207,7 @@ static const struct msm_dsi_config sm8650_dsi_cfg =3D {
 =09.io_start =3D {
 =09=09{ 0xae94000, 0xae96000 },
 =09},
+=09.has_rgb30 =3D true,
 };
=20
 static const struct msm_dsi_config kaanapali_dsi_cfg =3D {
@@ -214,6 +219,7 @@ static const struct msm_dsi_config kaanapali_dsi_cfg =
=3D {
 =09.io_start =3D {
 =09=09{ 0x9ac0000, 0x9ac3000 },
 =09},
+=09.has_rgb30 =3D true,
 };
=20
 static const struct regulator_bulk_data sc7280_dsi_regulators[] =3D {
@@ -230,6 +236,7 @@ static const struct msm_dsi_config sc7280_dsi_cfg =3D {
 =09.io_start =3D {
 =09=09{ 0xae94000, 0xae96000 },
 =09},
+=09.has_rgb30 =3D true,
 };
=20
 static const struct regulator_bulk_data sa8775p_dsi_regulators[] =3D {
@@ -246,6 +253,7 @@ static const struct msm_dsi_config sa8775p_dsi_cfg =3D =
{
 =09.io_start =3D {
 =09=09{ 0xae94000, 0xae96000 },
 =09},
+=09.has_rgb30 =3D true,
 };
=20
 static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops =3D {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/ds=
i_cfg.h
index 5dc812028bd5..15cb9b46fadf 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -48,6 +48,7 @@ struct msm_dsi_config {
 =09const char * const *bus_clk_names;
 =09const int num_bus_clks;
 =09const resource_size_t io_start[VARIANTS_MAX][DSI_MAX];
+=09bool has_rgb30;
 };
=20
 struct msm_dsi_host_cfg_ops {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/d=
si_host.c
index db6da99375a1..34fd0dc5f7c7 100644
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
@@ -1698,6 +1700,13 @@ static int dsi_host_attach(struct mipi_dsi_host *hos=
t,
 =09if (dsi->lanes > msm_host->num_data_lanes)
 =09=09return -EINVAL;
=20
+=09if (dsi->format =3D=3D MIPI_DSI_FMT_RGB101010 &&
+=09    !msm_host->cfg_hnd->cfg->has_rgb30) {
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



