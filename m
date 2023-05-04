Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A77D6F6F05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 17:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbjEDPfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 11:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbjEDPf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 11:35:29 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF3BE40
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 08:35:18 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4efd6e26585so781409e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 08:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683214517; x=1685806517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wO3N6iL/5yVN5qO08Gu4AieSilemxIZA0548EzgWHo=;
        b=NJXTxMHWAOKi+KlHtQKjfP3EwKLDe5l7Q7SJMVlo90R4F1q2e968fifgj3vTvwS+sw
         BX6JkbaIFLBTCBEQQEw6Xl/IGz9DACsQVJbi5hE1KQ1pBG+Rt7SUOQ8/3kUzDQaXekyI
         b3kq0jWU+OOTTqh2H5WpfHSEN4cN0rs6Iw2aPI2dgQ0GqAWNdwvE/HbXZFlFcqAwbWnE
         ev2cCNGVC05FdQ/Moir6UmQc7noIkLBwhLGnoXgnqxS6YbgNRnobYDdy538yMuvnwuH+
         6hoN10XBMN+DtF60wHMAXHkTA8lCUVFe4rRcQFFDGt9Yct3ZLbQ3l14TAqrQSRD7Dx6V
         a6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683214517; x=1685806517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wO3N6iL/5yVN5qO08Gu4AieSilemxIZA0548EzgWHo=;
        b=j0Cg6PA6JbN3u9/LHZSW5fY9NQICAW16D1pRvp0Rsv6r3Nk/MQa0G8nD20jR0Vh/D8
         sgkl3r9vMJveFuTpZqqkOMPcwAhCkxX0qA/zav8qrPMdqTaoWWI5A8//etxwdIomlJQI
         ADR72hq4COUacUJpBSpiH0uR5oZEmMlv0LnEBmLh6z1dUV6l6WRjrJQQrZcz4RbJKPYo
         Dysow/qv3K3PRnLOMf0aqShlr2PZ0xN44FMV1GcxiXLw/+vaYFaqgyAy0cwaaWqJZIzB
         yeryVISz2NIkL24u6yG/ltoUE4So+1q32uqnehbtEQMcqNwbRCofAzzeNs832UsAuG6F
         FxlQ==
X-Gm-Message-State: AC+VfDzQZwM56KlQN5Aj+3lnLAgmftD0N+FlE+Y9+P7MsGxGl0nm/pKN
        oHoCXgN3kJ9F+qGSwa7iLnXn2w==
X-Google-Smtp-Source: ACHHUZ5+ZXklqDpU2s5mizLQ0s3lNjCFc+Plw6ihnlY9AjIkbHln8pW+1e5Q+9vTsgUHLaTfw/hvTQ==
X-Received: by 2002:ac2:43b2:0:b0:4ee:dafa:cb00 with SMTP id t18-20020ac243b2000000b004eedafacb00mr1530743lfl.60.1683214517114;
        Thu, 04 May 2023 08:35:17 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n15-20020a056512388f00b004e96afb1e9asm6608753lft.253.2023.05.04.08.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 08:35:16 -0700 (PDT)
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
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
Date:   Thu,  4 May 2023 18:35:09 +0300
Message-Id: <20230504153511.4007320-7-dmitry.baryshkov@linaro.org>
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

The array of rc_parameters contains a mixture of parameters from DSC 1.1
and DSC 1.2 standards. Split these tow configuration arrays in
preparation to adding more configuration data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c  | 127 ++++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_vdsc.c |  10 +-
 include/drm/display/drm_dsc_helper.h      |   7 +-
 3 files changed, 119 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index acb93d4116e0..35b39f3109c4 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -324,11 +324,81 @@ struct rc_parameters_data {
 
 #define DSC_BPP(bpp)	((bpp) << 4)
 
+static const struct rc_parameters_data rc_parameters_pre_scr[] = {
+	{
+		.bpp = DSC_BPP(8), .bpc = 8,
+		{ 512, 12, 6144, 3, 12, 11, 11, {
+			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
+			{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 10,
+		{ 512, 12, 6144, 7, 16, 15, 15, {
+			/*
+			 * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
+			 * VESA DSC 1.1 Table E-5 sets it to 4.
+			 */
+			{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
+			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
+			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 12,
+		{ 512, 12, 6144, 11, 20, 19, 19, {
+			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
+			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
+			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
+			{ 21, 23, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(12), .bpc = 8,
+		{ 341, 15, 2048, 3, 12, 11, 11, {
+			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
+			{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(12), .bpc = 10,
+		{ 341, 15, 2048, 7, 16, 15, 15, {
+			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
+			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
+			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(12), .bpc = 12,
+		{ 341, 15, 2048, 11, 20, 19, 19, {
+			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
+			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
+			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
+			{ 21, 23, -12 }
+			}
+		}
+	},
+	{ /* sentinel */ }
+};
+
 /*
  * Selected Rate Control Related Parameter Recommended Values
  * from DSC_v1.11 spec & C Model release: DSC_model_20161212
  */
-static const struct rc_parameters_data rc_parameters[] = {
+static const struct rc_parameters_data rc_parameters_1_2_444[] = {
 	{
 		.bpp = DSC_BPP(6), .bpc = 8,
 		{ 768, 15, 6144, 3, 13, 11, 11, {
@@ -388,22 +458,18 @@ static const struct rc_parameters_data rc_parameters[] = {
 		{ 512, 12, 6144, 3, 12, 11, 11, {
 			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
 			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
-			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
-			{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
+			{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
 			}
 		}
 	},
 	{
 		.bpp = DSC_BPP(8), .bpc = 10,
 		{ 512, 12, 6144, 7, 16, 15, 15, {
-			/*
-			 * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
-			 * VESA DSC 1.1 Table E-5 sets it to 4.
-			 */
-			{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
+			{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
 			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
-			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
-			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
+			{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
 			}
 		}
 	},
@@ -412,9 +478,9 @@ static const struct rc_parameters_data rc_parameters[] = {
 		{ 512, 12, 6144, 11, 20, 19, 19, {
 			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
 			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
-			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
-			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
-			{ 21, 23, -12 }
+			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
+			{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
+			{ 20, 21, -12 }
 			}
 		}
 	},
@@ -498,8 +564,8 @@ static const struct rc_parameters_data rc_parameters[] = {
 		{ 341, 15, 2048, 3, 12, 11, 11, {
 			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
 			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
-			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
-			{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+			{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
+			{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 11, -12 }
 			}
 		}
 	},
@@ -508,8 +574,8 @@ static const struct rc_parameters_data rc_parameters[] = {
 		{ 341, 15, 2048, 7, 16, 15, 15, {
 			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
 			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
-			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
-			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+			{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
+			{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
 			}
 		}
 	},
@@ -518,9 +584,9 @@ static const struct rc_parameters_data rc_parameters[] = {
 		{ 341, 15, 2048, 11, 20, 19, 19, {
 			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
 			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
-			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
-			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
-			{ 21, 23, -12 }
+			{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
+			{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
+			{ 18, 19, -12 }
 			}
 		}
 	},
@@ -602,7 +668,8 @@ static const struct rc_parameters_data rc_parameters[] = {
 	{ /* sentinel */ }
 };
 
-static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
+static const struct rc_parameters *get_rc_params(const struct rc_parameters_data *rc_parameters,
+						 u16 dsc_bpp,
 						 u8 bits_per_component)
 {
 	int i;
@@ -622,11 +689,13 @@ static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
  * function.
  *
  * @vdsc_cfg: DSC Configuration data partially filled by driver
+ * @kind: operating mode and standard to follow
  *
  * Return: 0 or -error code in case of an error
  */
-int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
+int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind)
 {
+	const struct rc_parameters_data *data;
 	const struct rc_parameters *rc_params;
 	int i;
 
@@ -634,7 +703,19 @@ int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
 			 !vdsc_cfg->bits_per_component))
 		return -EINVAL;
 
-	rc_params = get_rc_params(vdsc_cfg->bits_per_pixel,
+	switch (kind) {
+	case DRM_DSC_1_2_444:
+		data = rc_parameters_1_2_444;
+		break;
+	case DRM_DSC_1_1_PRE_SCR:
+		data = rc_parameters_pre_scr;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rc_params = get_rc_params(data,
+				  vdsc_cfg->bits_per_pixel,
 				  vdsc_cfg->bits_per_component);
 	if (!rc_params)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index d4340b18c18d..bd9116d2cd76 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -226,7 +226,15 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	if (DISPLAY_VER(dev_priv) >= 13) {
 		calculate_rc_params(vdsc_cfg);
 	} else {
-		ret = drm_dsc_setup_rc_params(vdsc_cfg);
+		if ((compressed_bpp == 8 ||
+		     compressed_bpp == 12) &&
+		    (vdsc_cfg->bits_per_component == 8 ||
+		     vdsc_cfg->bits_per_component == 10 ||
+		     vdsc_cfg->bits_per_component == 12))
+			ret = drm_dsc_setup_rc_params(vdsc_cfg, DRM_DSC_1_1_PRE_SCR);
+		else
+			ret = drm_dsc_setup_rc_params(vdsc_cfg, DRM_DSC_1_2_444);
+
 		if (ret)
 			return ret;
 
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 1681791f65a5..c634bb2935d3 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -10,12 +10,17 @@
 
 #include <drm/display/drm_dsc.h>
 
+enum drm_dsc_params_kind {
+	DRM_DSC_1_2_444,
+	DRM_DSC_1_1_PRE_SCR, /* legacy params from DSC 1.1 */
+};
+
 void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
 int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
 void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
 			      const struct drm_dsc_config *dsc_cfg);
 void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
-int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg);
+int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 
 #endif /* _DRM_DSC_HELPER_H_ */
-- 
2.39.2

