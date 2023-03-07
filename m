Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 461176AE148
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjCGNuh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:50:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbjCGNuQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:50:16 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A6C85B2C
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:49:12 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id t14so13196764ljd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678196945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixPd/0T0IZDjopgHQRUdiTvL92X2OMAHYajXIhmyJ/Q=;
        b=KYtNROnClTHf21nQpJxv7Cj2b46r9r2JOClk0nf9e4weZePgZmpnRQVLc8urzzdlRA
         Zsz0nGmX4g/PymlFxN9NE5uTIBUR8Lqbqs0k44BMkJfc5VOXeGGRKxT1qtgJMwQ/9uYa
         dASfCPJ4zw+Iuv4uRSF2m/KzStaFbsCk43LmVI5JG15PKf7ixyuXN21vcBaHpBQlaj0v
         Oa8IqTXd1p4ays2sMBXhz49cKvVX6HE0W09U/CS3R5iC2DctbRvHqPAyNNLiX/aeNyfd
         WwTdHFmEyZXR/lU/MLOYTmQVZ7STSIxRCi6/tKYVQsxMOKpVvte2NkfPwOBpJbuDiqr2
         abww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixPd/0T0IZDjopgHQRUdiTvL92X2OMAHYajXIhmyJ/Q=;
        b=39xrJL84eVnw6fc9WKaimxrAdWCjRtBYbfqFVNAktudSyM8OanNtg/XyQiSOVmdLRy
         3dXJC8IEe1m3KCFLB38fKppyu12G3sI8EuXknkCtZ+fgDzxKofYuR1qi/u4Et+4TqRM9
         kkaLRJYr8Aj7CGnx/Xfy/rR01FwwFMXlCuHoVyQ4oQpiy4xdN1KnxtaZW9eMLvKvJ/f5
         1sI9qSIx0gj37bN2+E2rnoUvuw1fcjxk1kIdtNLho5cd1MNkm0r9Eq/+/QU5CzB46llL
         bOpz2UkuEHND/bXzYHNFARNq2gu2oNW9yO6HIQ+2l8/I9OvqJqIcTojc9WqiqyIeu3mz
         E9nw==
X-Gm-Message-State: AO0yUKXLq0fKoJDmZ0Emxwo2HxV/yYHXvU/XzBUYy4p9nFUsppQCEQh3
        E+9q9EsgbH4PaigPAJC5UZTCFA==
X-Google-Smtp-Source: AK7set8hrRqrctHjOAavQZivyUnfca9q2ZG6Xr7HAxUKUZYZ8K+p4RcvEmR9W1ot4iOzzWQojYBRLQ==
X-Received: by 2002:a2e:808e:0:b0:295:9ba2:8a78 with SMTP id i14-20020a2e808e000000b002959ba28a78mr4931597ljg.17.1678196945810;
        Tue, 07 Mar 2023 05:49:05 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u14-20020a2e91ce000000b0029597ebacd0sm2128991ljg.64.2023.03.07.05.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:49:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 04/10] drm/i915/dsc: stop using interim structure for calculated params
Date:   Tue,  7 Mar 2023 15:48:55 +0200
Message-Id: <20230307134901.322560-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307134901.322560-1-dmitry.baryshkov@linaro.org>
References: <20230307134901.322560-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stop using an interim structure rc_parameters for storing calculated
params and then setting drm_dsc_config using that structure. Instead put
calculated params into the struct drm_dsc_config directly.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 100 ++++++----------------
 1 file changed, 26 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 8f99434c4ebc..20a4c2f343fe 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -18,17 +18,6 @@
 #include "intel_qp_tables.h"
 #include "intel_vdsc.h"
 
-struct rc_parameters {
-	u16 initial_xmit_delay;
-	u8 first_line_bpg_offset;
-	u16 initial_offset;
-	u8 flatness_min_qp;
-	u8 flatness_max_qp;
-	u8 rc_quant_incr_limit0;
-	u8 rc_quant_incr_limit1;
-	struct drm_dsc_rc_range_parameters rc_range_params[DSC_NUM_BUF_RANGES];
-};
-
 bool intel_dsc_source_support(const struct intel_crtc_state *crtc_state)
 {
 	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -63,8 +52,7 @@ static bool is_pipe_dsc(struct intel_crtc *crtc, enum transcoder cpu_transcoder)
 }
 
 static void
-calculate_rc_params(struct rc_parameters *rc,
-		    struct drm_dsc_config *vdsc_cfg)
+calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 {
 	int bpc = vdsc_cfg->bits_per_component;
 	int bpp = vdsc_cfg->bits_per_pixel >> 4;
@@ -84,56 +72,57 @@ calculate_rc_params(struct rc_parameters *rc,
 	u32 res, buf_i, bpp_i;
 
 	if (vdsc_cfg->slice_height >= 8)
-		rc->first_line_bpg_offset =
+		vdsc_cfg->first_line_bpg_offset =
 			12 + DIV_ROUND_UP((9 * min(34, vdsc_cfg->slice_height - 8)), 100);
 	else
-		rc->first_line_bpg_offset = 2 * (vdsc_cfg->slice_height - 1);
+		vdsc_cfg->first_line_bpg_offset = 2 * (vdsc_cfg->slice_height - 1);
 
 	/* Our hw supports only 444 modes as of today */
 	if (bpp >= 12)
-		rc->initial_offset = 2048;
+		vdsc_cfg->initial_offset = 2048;
 	else if (bpp >= 10)
-		rc->initial_offset = 5632 - DIV_ROUND_UP(((bpp - 10) * 3584), 2);
+		vdsc_cfg->initial_offset = 5632 - DIV_ROUND_UP(((bpp - 10) * 3584), 2);
 	else if (bpp >= 8)
-		rc->initial_offset = 6144 - DIV_ROUND_UP(((bpp - 8) * 512), 2);
+		vdsc_cfg->initial_offset = 6144 - DIV_ROUND_UP(((bpp - 8) * 512), 2);
 	else
-		rc->initial_offset = 6144;
+		vdsc_cfg->initial_offset = 6144;
 
 	/* initial_xmit_delay = rc_model_size/2/compression_bpp */
-	rc->initial_xmit_delay = DIV_ROUND_UP(DSC_RC_MODEL_SIZE_CONST, 2 * bpp);
+	vdsc_cfg->initial_xmit_delay = DIV_ROUND_UP(DSC_RC_MODEL_SIZE_CONST, 2 * bpp);
 
-	rc->flatness_min_qp = 3 + qp_bpc_modifier;
-	rc->flatness_max_qp = 12 + qp_bpc_modifier;
+	vdsc_cfg->flatness_min_qp = 3 + qp_bpc_modifier;
+	vdsc_cfg->flatness_max_qp = 12 + qp_bpc_modifier;
 
-	rc->rc_quant_incr_limit0 = 11 + qp_bpc_modifier;
-	rc->rc_quant_incr_limit1 = 11 + qp_bpc_modifier;
+	vdsc_cfg->rc_quant_incr_limit0 = 11 + qp_bpc_modifier;
+	vdsc_cfg->rc_quant_incr_limit1 = 11 + qp_bpc_modifier;
 
 	bpp_i  = (2 * (bpp - 6));
 	for (buf_i = 0; buf_i < DSC_NUM_BUF_RANGES; buf_i++) {
+		u8 range_bpg_offset;
+
 		/* Read range_minqp and range_max_qp from qp tables */
-		rc->rc_range_params[buf_i].range_min_qp =
+		vdsc_cfg->rc_range_params[buf_i].range_min_qp =
 			intel_lookup_range_min_qp(bpc, buf_i, bpp_i);
-		rc->rc_range_params[buf_i].range_max_qp =
+		vdsc_cfg->rc_range_params[buf_i].range_max_qp =
 			intel_lookup_range_max_qp(bpc, buf_i, bpp_i);
 
-		/* Calculate range_bgp_offset */
+		/* Calculate range_bpg_offset */
 		if (bpp <= 6) {
-			rc->rc_range_params[buf_i].range_bpg_offset = ofs_und6[buf_i];
+			range_bpg_offset = ofs_und6[buf_i];
 		} else if (bpp <= 8) {
 			res = DIV_ROUND_UP(((bpp - 6) * (ofs_und8[buf_i] - ofs_und6[buf_i])), 2);
-			rc->rc_range_params[buf_i].range_bpg_offset =
-								ofs_und6[buf_i] + res;
+			range_bpg_offset = ofs_und6[buf_i] + res;
 		} else if (bpp <= 12) {
-			rc->rc_range_params[buf_i].range_bpg_offset =
-								ofs_und8[buf_i];
+			range_bpg_offset = ofs_und8[buf_i];
 		} else if (bpp <= 15) {
 			res = DIV_ROUND_UP(((bpp - 12) * (ofs_und15[buf_i] - ofs_und12[buf_i])), 3);
-			rc->rc_range_params[buf_i].range_bpg_offset =
-								ofs_und12[buf_i] + res;
+			range_bpg_offset = ofs_und12[buf_i] + res;
 		} else {
-			rc->rc_range_params[buf_i].range_bpg_offset =
-								ofs_und15[buf_i];
+			range_bpg_offset = ofs_und15[buf_i];
 		}
+
+		vdsc_cfg->rc_range_params[buf_i].range_bpg_offset =
+			range_bpg_offset & DSC_RANGE_BPG_OFFSET_MASK;
 	}
 }
 
@@ -143,9 +132,6 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct drm_dsc_config *vdsc_cfg = &pipe_config->dsc.config;
 	u16 compressed_bpp = pipe_config->dsc.compressed_bpp;
-	const struct rc_parameters *rc_params;
-	struct rc_parameters *rc = NULL;
-	u8 i = 0;
 	int ret;
 
 	vdsc_cfg->pic_width = pipe_config->hw.adjusted_mode.crtc_hdisplay;
@@ -169,43 +155,12 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	 * parameters
 	 */
 	if (DISPLAY_VER(dev_priv) >= 13) {
-		rc = kmalloc(sizeof(*rc), GFP_KERNEL);
-		if (!rc)
-			return -ENOMEM;
-
-		calculate_rc_params(rc, vdsc_cfg);
-		rc_params = rc;
+		calculate_rc_params(vdsc_cfg);
 	} else {
 		ret = drm_dsc_setup_rc_params(vdsc_cfg);
 		if (ret)
 			return ret;
 
-		goto out;
-	}
-
-	vdsc_cfg->first_line_bpg_offset = rc_params->first_line_bpg_offset;
-	vdsc_cfg->initial_xmit_delay = rc_params->initial_xmit_delay;
-	vdsc_cfg->initial_offset = rc_params->initial_offset;
-	vdsc_cfg->flatness_min_qp = rc_params->flatness_min_qp;
-	vdsc_cfg->flatness_max_qp = rc_params->flatness_max_qp;
-	vdsc_cfg->rc_quant_incr_limit0 = rc_params->rc_quant_incr_limit0;
-	vdsc_cfg->rc_quant_incr_limit1 = rc_params->rc_quant_incr_limit1;
-
-	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
-		vdsc_cfg->rc_range_params[i].range_min_qp =
-			rc_params->rc_range_params[i].range_min_qp;
-		vdsc_cfg->rc_range_params[i].range_max_qp =
-			rc_params->rc_range_params[i].range_max_qp;
-		/*
-		 * Range BPG Offset uses 2's complement and is only a 6 bits. So
-		 * mask it to get only 6 bits.
-		 */
-		vdsc_cfg->rc_range_params[i].range_bpg_offset =
-			rc_params->rc_range_params[i].range_bpg_offset &
-			DSC_RANGE_BPG_OFFSET_MASK;
-	}
-
-	if (DISPLAY_VER(dev_priv) < 13) {
 		/*
 		 * FIXME: verify that the hardware actually needs these
 		 * modifications rather than them being simple typos.
@@ -219,7 +174,6 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 			vdsc_cfg->rc_range_params[0].range_bpg_offset = 0;
 	}
 
-out:
 	/*
 	 * BitsPerComponent value determines mux_word_size:
 	 * When BitsPerComponent is less than or 10bpc, muxWordSize will be equal to
@@ -234,8 +188,6 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	vdsc_cfg->initial_scale_value = (vdsc_cfg->rc_model_size << 3) /
 		(vdsc_cfg->rc_model_size - vdsc_cfg->initial_offset);
 
-	kfree(rc);
-
 	return 0;
 }
 
-- 
2.39.2

