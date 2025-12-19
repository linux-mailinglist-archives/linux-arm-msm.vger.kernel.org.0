Return-Path: <linux-arm-msm+bounces-85840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B66CCF762
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5AAD301B80B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4C73019BE;
	Fri, 19 Dec 2025 10:49:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBF02FF672
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766141396; cv=none; b=JfzS80eE2pIPgyxPVml5v2683ZodysnWyyi1A38sw/T3GmFF6KiTwVMhS2VnAB9CK2KCgtwm5hzLUua/EP3+I7+3kke48IkSA9Z9KG7rEZGYhGSazKNttJZRqLwYfDMHTiheOL7mfDFmsnw1TXdG7yjlmZYJOXL1UZYxbaCS4nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766141396; c=relaxed/simple;
	bh=x14TnMloN3yyTfFH5pw/8/Pu3LLUQu6AUZDikEFwmjg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JFeKswkXiHnlQduDj/Q8WpWNGSgl5M8fRgV8mICoFLesXCJcgy7Z9uIiF2a5cFS5N/KZqvjfdsyU3YbCF8XvzTJwhY79XkaIJGy8xTehAFJXwjmFmLAnGjSWK399y9xYYFxii+mcQN1d3BnlWflAbqhZU2PR4ltvxrZ/PYXZK1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from ehlo.thunderbird.net (161-51-78-170.static.ef-service.nl [161.51.78.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D3E9020386;
	Fri, 19 Dec 2025 11:49:49 +0100 (CET)
Date: Fri, 19 Dec 2025 11:49:51 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/2=5D_Revert_=22drm/msm/dpu=3A_Ena?=
 =?US-ASCII?Q?ble_quad-pipe_for_DSC_and_dual-DSI_case=22?=
User-Agent: Thunderbird for Android
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com> <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
Message-ID: <A6CA2415-5FCE-4DE3-9E3B-2F68913F898B@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19 December 2025 11:39:02 CET, Abel Vesa <abel=2Evesa@oss=2Equalcomm=2Ec=
om> wrote:
>This reverts commit d7ec9366b15cd04508fa015cb94d546b1c01edfb=2E
>
>The dual-DSI dual-DSC scenario seems to be broken by this commit=2E
>
>Reported-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>
>Closes: https://lore=2Ekernel=2Eorg/r/aUR2b3FOSisTfDFj@SoMainline=2Eorg
>Signed-off-by: Abel Vesa <abel=2Evesa@oss=2Equalcomm=2Ecom>

Thanks! That kicks off one dependency for actually sending this 2:2:2 pane=
l and DTS for the Sony Xperia 1 III and onwards=2E

Reviewed-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>

>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Ec         | 27 ++++++----------=
------
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Eh         |  6 ++---
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder=2Ec      | 29 ++++++++++++++++=
--------
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys=2Eh |  2 +-
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh   |  2 +-
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss=2Eh      |  2 +-
> 6 files changed, 33 insertions(+), 35 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Ec b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc=2Ec
>index 011946bbf5a2=2E=2E2d06c950e814 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Ec
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Ec
>@@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
> 		struct dpu_crtc_state *crtc_state)
> {
> 	struct dpu_crtc_mixer *m;
>-	u32 crcs[CRTC_QUAD_MIXERS];
>+	u32 crcs[CRTC_DUAL_MIXERS];
>=20
> 	int rc =3D 0;
> 	int i;
>@@ -1328,7 +1328,6 @@ static struct msm_display_topology dpu_crtc_get_top=
ology(
> 	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> 	struct msm_display_topology topology =3D {0};
> 	struct drm_encoder *drm_enc;
>-	u32 num_rt_intf;
>=20
> 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
> 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>@@ -1342,14 +1341,11 @@ static struct msm_display_topology dpu_crtc_get_t=
opology(
> 	 * Dual display
> 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> 	 *
>-	 * If DSC is enabled, try to use 4:4:2 topology if there is enough
>-	 * resource=2E Otherwise, use 2:2:2 topology=2E
>-	 *
> 	 * Single display
> 	 * 1 LM, 1 INTF
> 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> 	 *
>-	 * If DSC is enabled, use 2:2:1 topology
>+	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
> 	 *
> 	 * Add dspps to the reservation requirements if ctm is requested
> 	 *
>@@ -1361,23 +1357,14 @@ static struct msm_display_topology dpu_crtc_get_t=
opology(
> 	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check=2E
> 	 */
>=20
>-	num_rt_intf =3D topology=2Enum_intf;
>-	if (topology=2Ecwb_enabled)
>-		num_rt_intf--;
>-
>-	if (topology=2Enum_dsc) {
>-		if (dpu_kms->catalog->dsc_count >=3D num_rt_intf * 2)
>-			topology=2Enum_dsc =3D num_rt_intf * 2;
>-		else
>-			topology=2Enum_dsc =3D num_rt_intf;
>-		topology=2Enum_lm =3D topology=2Enum_dsc;
>-	} else if (num_rt_intf =3D=3D 2) {
>+	if (topology=2Enum_intf =3D=3D 2 && !topology=2Ecwb_enabled)
>+		topology=2Enum_lm =3D 2;
>+	else if (topology=2Enum_dsc =3D=3D 2)
> 		topology=2Enum_lm =3D 2;
>-	} else if (dpu_kms->catalog->caps->has_3d_merge) {
>+	else if (dpu_kms->catalog->caps->has_3d_merge)
> 		topology=2Enum_lm =3D (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>-	} else {
>+	else
> 		topology=2Enum_lm =3D 1;
>-	}
>=20
> 	if (crtc_state->ctm)
> 		topology=2Enum_dspp =3D topology=2Enum_lm;
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Eh b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc=2Eh
>index 2c83f1578fc3=2E=2E94392b9b9245 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Eh
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Eh
>@@ -210,7 +210,7 @@ struct dpu_crtc_state {
>=20
> 	bool bw_control;
> 	bool bw_split_vote;
>-	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
>+	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
>=20
> 	uint64_t input_fence_timeout_ns;
>=20
>@@ -218,10 +218,10 @@ struct dpu_crtc_state {
>=20
> 	/* HW Resources reserved for the crtc */
> 	u32 num_mixers;
>-	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
>+	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
>=20
> 	u32 num_ctls;
>-	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
>+	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
>=20
> 	enum dpu_crtc_crc_source crc_source;
> 	int crc_frame_skip_count;
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder=2Ec b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder=2Ec
>index d1cfe81a3373=2E=2E9f3957f24c6a 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder=2Ec
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder=2Ec
>@@ -55,7 +55,7 @@
> #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
>=20
>-#define MAX_CHANNELS_PER_ENC 4
>+#define MAX_CHANNELS_PER_ENC 2
> #define MAX_CWB_PER_ENC 2
>=20
> #define IDLE_SHORT_TIMEOUT	1
>@@ -661,6 +661,7 @@ void dpu_encoder_update_topology(struct drm_encoder *=
drm_enc,
> 	struct dpu_encoder_virt *dpu_enc =3D to_dpu_encoder_virt(drm_enc);
> 	struct msm_drm_private *priv =3D dpu_enc->base=2Edev->dev_private;
> 	struct msm_display_info *disp_info =3D &dpu_enc->disp_info;
>+	struct dpu_kms *dpu_kms =3D to_dpu_kms(priv->kms);
> 	struct drm_connector *connector;
> 	struct drm_connector_state *conn_state;
> 	struct drm_framebuffer *fb;
>@@ -674,12 +675,22 @@ void dpu_encoder_update_topology(struct drm_encoder=
 *drm_enc,
>=20
> 	dsc =3D dpu_encoder_get_dsc_config(drm_enc);
>=20
>-	/*
>-	 * Set DSC number as 1 to mark the enabled status, will be adjusted
>-	 * in dpu_crtc_get_topology()
>-	 */
>-	if (dsc)
>-		topology->num_dsc =3D 1;
>+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
>+	if (dsc) {
>+		/*
>+		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
>+		 * when Display Stream Compression (DSC) is enabled,
>+		 * and when enough DSC blocks are available=2E
>+		 * This is power-optimal and can drive up to (including) 4k
>+		 * screens=2E
>+		 */
>+		WARN(topology->num_intf > 2,
>+		     "DSC topology cannot support more than 2 interfaces\n");
>+		if (topology->num_intf >=3D 2 || dpu_kms->catalog->dsc_count >=3D 2)
>+			topology->num_dsc =3D 2;
>+		else
>+			topology->num_dsc =3D 1;
>+	}
>=20
> 	connector =3D drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> 	if (!connector)
>@@ -2169,8 +2180,8 @@ static void dpu_encoder_helper_reset_mixers(struct =
dpu_encoder_phys *phys_enc)
> {
> 	int i, num_lm;
> 	struct dpu_global_state *global_state;
>-	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>-	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
>+	struct dpu_hw_blk *hw_lm[2];
>+	struct dpu_hw_mixer *hw_mixer[2];
> 	struct dpu_hw_ctl *ctl =3D phys_enc->hw_ctl;
>=20
> 	/* reset all mixers for this encoder */
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys=2Eh b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_encoder_phys=2Eh
>index 09395d7910ac=2E=2E61b22d949454 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys=2Eh
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys=2Eh
>@@ -302,7 +302,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_help=
er_get_3d_blend_mode(
>=20
> 	/* Use merge_3d unless DSC MERGE topology is used */
> 	if (phys_enc->split_role =3D=3D ENC_ROLE_SOLO &&
>-	    (dpu_cstate->num_mixers !=3D 1) &&
>+	    dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS &&
> 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
> 		return BLEND_3D_H_ROW_INT;
>=20
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh
>index 336757103b5a=2E=2E4964e70610d1 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh
>@@ -24,7 +24,7 @@
> #define DPU_MAX_IMG_WIDTH 0x3fff
> #define DPU_MAX_IMG_HEIGHT 0x3fff
>=20
>-#define CRTC_QUAD_MIXERS	4
>+#define CRTC_DUAL_MIXERS	2
>=20
> #define MAX_XIN_COUNT 16
>=20
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss=2Eh b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss=2Eh
>index 31451241f083=2E=2E046b683d4c66 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss=2Eh
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss=2Eh
>@@ -34,7 +34,7 @@
> #define DPU_MAX_PLANES			4
> #endif
>=20
>-#define STAGES_PER_PLANE		2
>+#define STAGES_PER_PLANE		1
> #define PIPES_PER_STAGE			2
> #define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
> #ifndef DPU_MAX_DE_CURVES
>


