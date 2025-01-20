Return-Path: <linux-arm-msm+bounces-45637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BEDA17526
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 01:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 965A41887B15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 00:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3503AA55;
	Tue, 21 Jan 2025 00:01:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E90819
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 00:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737417693; cv=none; b=QMK9M1jVzJNzDMpp7l8YWlVGBp1H4q0pVo2PzWaDx6R5NIL964s1ufDeyCanEA73UA+IE2byZU+qaZ8SGnNZ9bYDg+ww1spW5XfY+iqMDMUexnq1pndKzoPG+n5dqQ/UbN7MMHnqG1rSg7H6CY26X+CR9Nk9RvVHrvQpSOmwjko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737417693; c=relaxed/simple;
	bh=x6YM04caIr+QNGcZcKJzRVmJyNc6WfrpwCRhHy2/nvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BWZEszI4FQ+nXeZKm2Ij6w+PJy7SZThfvqAeJNWqu/fjX6UBousWE4RjidAoXDztazbQINo5JbwptJ1bMoNkKLfjBLYh76HX6OtAkfqZFcYCA8a7c/eApln2gkN1eV4mDXJ0tgDpkTVEHslQhSfNXG4KqfBJlBuqOJBCK5N9maQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A3E093FBF6;
	Tue, 21 Jan 2025 00:06:16 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 21 Jan 2025 00:06:15 +0100
Subject: [PATCH RFC] drm/msm/dpu: Fall back to a single DSC encoder (1:1:1)
 on small SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org>
X-B4-Tracking: v=1; b=H4sIAObWjmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDIwMT3ZSCUl1DQ0PdkvyC/Jz89ErdJEOjZMOUVAujZItEJaC2gqLUtMw
 KsJHRSkFuzkqxtbUALuIjS2cAAAA=
X-Change-ID: 20240204-dpu-111-topology-b12c1de82c8a
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.14.2

Some SoCs such as SC7280 (used in the FairPhone 5) have only a single
DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
(2 LM and 2 DSC for a single interface) make it impossible to use
Display Stream Compression panels with mainline, which is exactly what's
installed on the FairPhone 5.

By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
1` when the catalog only contains one entry, we can trivially support
this phone and unblock further panel enablement on mainline.  A few
more supporting changes in this patch ensure hardcoded constants of 2
DSC encoders are replaced to count or read back the actual number of
DSC hardware blocks that are enabled for the given virtual encoder.
Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.

Cc: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
Note that this doesn't paint the full picture in case there are SoCs
with more DSC hardware blocks, but when multiple virtual encoders
have already allocated most of them.  My initial plan was to code
ahead for dynamically tracking and reallocating these blocks in RM, if
some virtual encoder could potentially be using too many DSC encoders
which, while "power optimal", may not be able to support the number of
requested displays/interfaces.  Such a solution would automatically
ensure DSCmerge is *not* used when there are not enough hardware blocks
available in the first place.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5172ab4dea995a154cd88d05c3842d7425fc34ce..dcf17b5e8ac8eb76f5ba038fcce48e47f32299d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -622,9 +622,10 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+			if (dpu_enc->hw_dsc[i])
+				num_dsc++;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -664,7 +665,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	/* Datapath topology selection
 	 *
 	 * Dual display
-	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
+	 * 2 LM, 2 INTF (split display using 2 interfaces)
 	 *
 	 * Single display
 	 * 1 LM, 1 INTF
@@ -686,13 +687,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	if (dsc) {
 		/*
-		 * In case of Display Stream Compression (DSC), we would use
-		 * 2 DSC encoders, 2 layer mixers and 1 interface
-		 * this is power optimal and can drive up to (including) 4k
-		 * screens
+		 * Use 2 DSC encoders and 2 layer mixers per single interface
+		 * when Display Stream Compression (DSC) is enabled,
+		 * and when enough DSC blocks are available.
+		 * This is power-optimal and can drive up to (including) 4k
+		 * screens.
 		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
+		if (dpu_kms->catalog->dsc_count >= 2) {
+			topology.num_dsc = 2;
+			topology.num_lm = 2;
+		} else {
+			topology.num_dsc = 1;
+			topology.num_lm = 1;
+		}
 		topology.num_intf = 1;
 	}
 
@@ -2020,32 +2027,32 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 				 struct drm_dsc_config *dsc)
 {
-	/* coding only for 2LM, 2enc, 1 dsc config */
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
 	int this_frame_slices;
 	int intf_ip_w, enc_ip_w;
-	int dsc_common_mode;
+	int dsc_common_mode = 0;
 	int pic_width;
 	u32 initial_lines;
+	int num_dsc = 0;
 	int i;
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
 
-		if (!hw_pp[i] || !hw_dsc[i]) {
-			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
-			return;
-		}
+		if (!hw_pp[i] || !hw_dsc[i])
+			break;
+		num_dsc++;
 	}
 
 	dsc_common_mode = 0;
 	pic_width = dsc->pic_width;
 
-	dsc_common_mode = DSC_MODE_SPLIT_PANEL;
+	if (num_dsc > 1)
+		dsc_common_mode |= DSC_MODE_SPLIT_PANEL;
 	if (dpu_encoder_use_dsc_merge(enc_master->parent))
 		dsc_common_mode |= DSC_MODE_MULTIPLEX;
 	if (enc_master->intf_mode == INTF_MODE_VIDEO)
@@ -2054,14 +2061,10 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	this_frame_slices = pic_width / dsc->slice_width;
 	intf_ip_w = this_frame_slices * dsc->slice_width;
 
-	/*
-	 * dsc merge case: when using 2 encoders for the same stream,
-	 * no. of slices need to be same on both the encoders.
-	 */
-	enc_ip_w = intf_ip_w / 2;
+	enc_ip_w = intf_ip_w / num_dsc;
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < num_dsc; i++)
 		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
 					 dsc, dsc_common_mode, initial_lines);
 }

---
base-commit: 1573c8d4cb206a2d1454ff711e79f8df2353290b
change-id: 20240204-dpu-111-topology-b12c1de82c8a

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>


