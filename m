Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB486F6EFD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 17:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbjEDPfY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 11:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjEDPfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 11:35:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C60544B8
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 08:35:15 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f1394cb0d1so775643e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 08:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683214514; x=1685806514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqGgu4Dq8CbrtExkjIjb7tdsKLrwoIcjoGCMDEsQeDA=;
        b=OhwoOI6QPBGT43zGKDabcaxxIH159JsHWRbP6Ab6bMCmhosWTDkK/PZVTv17KhM0P3
         ey6p4uHOE+Uz0GLMBAQoXDmt7ekxvln1CWsfFoIJTczPXQQHK7Po9nY9TYZarqMg9Lpl
         1dX+CxcyhSZLhwUJZ1CwjwfebTYXgNFl52xzXcfAqnznnF+J4I0QHZ7inzy+wPAHAgGF
         FIaLuF2KAayg78MvspsOY7zkxVJwGzj0aYoJ8heDrH9GQq+ktqBZ+OGjV2rz8+lbN1er
         LDR75CD/vd4P2PWXqBW82H0NkdkylUOVV1mFYc0AXlJ5qgc2/hiaB1ewzReP2mLs/b9P
         FSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683214514; x=1685806514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqGgu4Dq8CbrtExkjIjb7tdsKLrwoIcjoGCMDEsQeDA=;
        b=gxWF1L5jBXIzAa+n9XvQAoz6N/XHftFNxbWrsoa0WiMxqNfTruzIyDBxWtbEt3j9Ur
         P2jW9y9nkdtLVCfwS/BZRYWvyB8QNavD2sbXbSjXp9SBaoUcFkc8vVR6zVa6HKXhPgEl
         ocDHICS9M2zchLFSPmpwN9XGP3DbRC1OOycvowkhC6LjZkhgccwuOMtOHJc9i3kxj4JO
         kGnkhvnOUW028+ezpb3p6SpYOPMbmHu5JIliEOdWpq3rlEnVV1g0w7OYt/XH5mJz1wdg
         1Iyxm5LBjqwsuSCqYUe4zZrX/Y6O67KrZEGPs7t4S7vw6YwqXqPqA+S5DK1Jfur4q2In
         zaJA==
X-Gm-Message-State: AC+VfDwhFO1HSslGebb0URmsCBCl7ml0p2kIpDBkifLh+73hvaIAzfq8
        nodLt/5JQxIP/QPnKoasNwTg6A==
X-Google-Smtp-Source: ACHHUZ7LgHOzMD6gHh3YhZUwEpf0/g1ORmLjh58xbWn3XK9mLhkPpOWuR6hdAbm14fXm67vfT/NpnA==
X-Received: by 2002:ac2:53ac:0:b0:4ef:ec94:9678 with SMTP id j12-20020ac253ac000000b004efec949678mr2006373lfh.20.1683214513814;
        Thu, 04 May 2023 08:35:13 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n15-20020a056512388f00b004e96afb1e9asm6608753lft.253.2023.05.04.08.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 08:35:13 -0700 (PDT)
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
Subject: [PATCH v5 2/8] drm/i915/dsc: move rc_buf_thresh values to common helper
Date:   Thu,  4 May 2023 18:35:05 +0300
Message-Id: <20230504153511.4007320-3-dmitry.baryshkov@linaro.org>
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

The rc_buf_thresh values are common to all DSC implementations. Move
them to the common helper together with the code to propagage them to
the drm_dsc_config.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c  | 35 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c | 24 +---------------
 include/drm/display/drm_dsc_helper.h      |  1 +
 3 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index c869c6e51e2b..be91abe2cfb2 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -270,6 +270,41 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
 }
 EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
 
+/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
+static const u16 drm_dsc_rc_buf_thresh[] = {
+	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
+	7744, 7872, 8000, 8064
+};
+
+/**
+ * drm_dsc_set_rc_buf_thresh() - Set thresholds for the RC model
+ * in accordance with the DSC 1.2 specification.
+ *
+ * @vdsc_cfg: DSC Configuration data partially filled by driver
+ */
+void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
+{
+	int i;
+
+	BUILD_BUG_ON(ARRAY_SIZE(drm_dsc_rc_buf_thresh) !=
+		     DSC_NUM_BUF_RANGES - 1);
+	BUILD_BUG_ON(ARRAY_SIZE(drm_dsc_rc_buf_thresh) !=
+		     ARRAY_SIZE(vdsc_cfg->rc_buf_thresh));
+
+	for (i = 0; i < ARRAY_SIZE(drm_dsc_rc_buf_thresh); i++)
+		vdsc_cfg->rc_buf_thresh[i] = drm_dsc_rc_buf_thresh[i] >> 6;
+
+	/*
+	 * For 6bpp, RC Buffer threshold 12 and 13 need a different value
+	 * as per C Model
+	 */
+	if (vdsc_cfg->bits_per_pixel == 6 << 4) {
+		vdsc_cfg->rc_buf_thresh[12] = 7936 >> 6;
+		vdsc_cfg->rc_buf_thresh[13] = 8000 >> 6;
+	}
+}
+EXPORT_SYMBOL(drm_dsc_set_rc_buf_thresh);
+
 /**
  * drm_dsc_compute_rc_parameters() - Write rate control
  * parameters to the dsc configuration defined in
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 7003ae9f683a..2fd08375bbe3 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -37,12 +37,6 @@ enum COLUMN_INDEX_BPC {
 	MAX_COLUMN_INDEX
 };
 
-/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
-static const u16 rc_buf_thresh[] = {
-	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
-	7744, 7872, 8000, 8064
-};
-
 struct rc_parameters {
 	u16 initial_xmit_delay;
 	u8 first_line_bpg_offset;
@@ -543,23 +537,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 
 	vdsc_cfg->bits_per_component = pipe_config->pipe_bpp / 3;
 
-	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
-		/*
-		 * six 0s are appended to the lsb of each threshold value
-		 * internally in h/w.
-		 * Only 8 bits are allowed for programming RcBufThreshold
-		 */
-		vdsc_cfg->rc_buf_thresh[i] = rc_buf_thresh[i] >> 6;
-	}
-
-	/*
-	 * For 6bpp, RC Buffer threshold 12 and 13 need a different value
-	 * as per C Model
-	 */
-	if (compressed_bpp == 6) {
-		vdsc_cfg->rc_buf_thresh[12] = 0x7C;
-		vdsc_cfg->rc_buf_thresh[13] = 0x7D;
-	}
+	drm_dsc_set_rc_buf_thresh(vdsc_cfg);
 
 	/*
 	 * From XE_LPD onwards we supports compression bpps in steps of 1
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 8b41edbbabab..706ba1d34742 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -14,6 +14,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
 int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
 void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
 			      const struct drm_dsc_config *dsc_cfg);
+void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 
 #endif /* _DRM_DSC_HELPER_H_ */
-- 
2.39.2

