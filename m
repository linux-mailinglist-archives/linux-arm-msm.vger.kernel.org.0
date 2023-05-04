Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713896F6EFE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 17:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbjEDPf0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 11:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbjEDPfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 11:35:24 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554F3273D
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 08:35:17 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f14468ef54so778451e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 08:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683214515; x=1685806515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXzqr/RToWqdSBilcBzB6Tyuh1xIOzUWMTLtgk6Ssoc=;
        b=p2vdRmJ3jm9xgc+pFTlJJ0qbx4/S7FIya2u98ezzt29lKvtxHTzn3yjf0OshmxsmCS
         i64VGN9QUps+rpZ1G6Qxyq8NJHBe4WxdsfZXK24ondJJFkxUTXX0ukt0ZWQw9RsciD1n
         zsQIybAyymtRjJV+CLX4vX3YW+yz47wIoYxLRZbxLS/5XMarke/pK+HR9o+AJtnPITjR
         o9rbnKf1d5e8iTDORzcvNiCqhrlS16TRi5t+WY2Dqe85OE67HgrVPsfu1Fm9YChid9sY
         NUIp/mLFNxBWolMP/VeTbGlD1UcNiTZUmmIg6LTSyKnjYfmLwMnsew7rNI8hyVFkA58f
         PHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683214515; x=1685806515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXzqr/RToWqdSBilcBzB6Tyuh1xIOzUWMTLtgk6Ssoc=;
        b=dAc9nVX6WMg1KIDee2Qv5LMsuE1zAUiwuIuoedtnwb/UuoOz74WSx7F/SXLlLJ82qp
         +C8AAUD5JzwQmwUm6ewq8VBkYEVWqQwEjzVwp/UsEPwYouraZtoIHvO4ArFUk46X8rvo
         fM1PotWfTRdYWA4/Kl82KljMqZOKw8uMTtv5Tmn5X7Fuy5pPz3nI7zmGZP1wNAttjUWp
         hUNkNK3Oc3bT1iF8xmqP2BaU+NDN3wAG4tcWV6iEXDkFQwy7Kh1jbR/rkD6Gb7uJdBHm
         wdj+QnagXFc/mZs8RiNOXw+yxeWvVrdQV9KJvuHH+VZGTlsgDS/1CZ+sB0t97csZ85So
         cy4Q==
X-Gm-Message-State: AC+VfDxmTpkq7v9YVBo8GAA9mhKvjgtl9aP+e9uf7VcZjRyv9Xvmyj/W
        owO25PU+KCXaa897cVDRNPfgwmKBCkw3WJUKJ/U=
X-Google-Smtp-Source: ACHHUZ7DfCIj6L0lKz2gRTcIn8s/N60VYCmphASs2Y/3lNf4rR++ir/W1i2Eaw0gvaWtcCKEgWXtxQ==
X-Received: by 2002:a05:6512:971:b0:4f1:2f5d:8679 with SMTP id v17-20020a056512097100b004f12f5d8679mr1796141lft.22.1683214515529;
        Thu, 04 May 2023 08:35:15 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n15-20020a056512388f00b004e96afb1e9asm6608753lft.253.2023.05.04.08.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 08:35:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
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
Subject: [PATCH v5 4/8] drm/i915/dsc: stop using interim structure for calculated params
Date:   Thu,  4 May 2023 18:35:07 +0300
Message-Id: <20230504153511.4007320-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
References: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
index d0536582e4b9..d4340b18c18d 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -19,17 +19,6 @@
 #include "intel_vdsc.h"
 #include "intel_vdsc_regs.h"
 
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
@@ -64,8 +53,7 @@ static bool is_pipe_dsc(struct intel_crtc *crtc, enum transcoder cpu_transcoder)
 }
 
 static void
-calculate_rc_params(struct rc_parameters *rc,
-		    struct drm_dsc_config *vdsc_cfg)
+calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 {
 	int bpc = vdsc_cfg->bits_per_component;
 	int bpp = vdsc_cfg->bits_per_pixel >> 4;
@@ -85,56 +73,57 @@ calculate_rc_params(struct rc_parameters *rc,
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
 			intel_lookup_range_min_qp(bpc, buf_i, bpp_i, vdsc_cfg->native_420);
-		rc->rc_range_params[buf_i].range_max_qp =
+		vdsc_cfg->rc_range_params[buf_i].range_max_qp =
 			intel_lookup_range_max_qp(bpc, buf_i, bpp_i, vdsc_cfg->native_420);
 
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
 
@@ -167,10 +156,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct drm_dsc_config *vdsc_cfg = &pipe_config->dsc.config;
 	u16 compressed_bpp = pipe_config->dsc.compressed_bpp;
-	const struct rc_parameters *rc_params;
-	struct rc_parameters *rc = NULL;
 	int err;
-	u8 i = 0;
 	int ret;
 
 	vdsc_cfg->pic_width = pipe_config->hw.adjusted_mode.crtc_hdisplay;
@@ -238,43 +224,12 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
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
@@ -288,7 +243,6 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 			vdsc_cfg->rc_range_params[0].range_bpg_offset = 0;
 	}
 
-out:
 	/*
 	 * BitsPerComponent value determines mux_word_size:
 	 * When BitsPerComponent is less than or 10bpc, muxWordSize will be equal to
@@ -303,8 +257,6 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	vdsc_cfg->initial_scale_value = (vdsc_cfg->rc_model_size << 3) /
 		(vdsc_cfg->rc_model_size - vdsc_cfg->initial_offset);
 
-	kfree(rc);
-
 	return 0;
 }
 
-- 
2.39.2

