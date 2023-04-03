Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D21A6D4074
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 11:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbjDCJXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 05:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbjDCJXm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 05:23:42 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F76FEFB5
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 02:23:26 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y15so37161021lfa.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 02:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680513802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io1kFeahiBilX+dYbCKFWeEnlfidqy25m/9Relr1ARs=;
        b=FCIaAkDJ0n79m2fUn1fO9D1NLEjKIibCLE+t1nH/APZckdR6KwNJf9IMyRuSA6tS7H
         OOj7LxWksR8rTH6xe7p8NktCXITLnWWlzckow/3FEf+RzOb3W4JV9cGp6DUxh3IGvX5P
         rDephqe4z3qRJLZCQlaiSY0gGDMUfhNc5G+pQ4VhYhegCNLPlfsmnAFj5HgKW0JYyhR+
         Q3WBGdev9TEsPqOM8E9aIxXu0u/x4MMM1xpZGB4VtQzE9dP8A+6XZFqVNWPrPyPTk4IZ
         HOmBVnDcSEKb1/ESZVYgKHef/gDpziCpI7pvYH6m/KMgXaIrZcbbXT7uWQzLvX6QXapJ
         XggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680513802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=io1kFeahiBilX+dYbCKFWeEnlfidqy25m/9Relr1ARs=;
        b=LFkKNN2ePL04Lz47fdP9sKHh2Jxx5I7nNASlfxEcSDQzlVN+bWyfrnPi/YnNgZmSbr
         IjPFVqADuu8aqxvPJ1uS1f+eQ+coof7XTm37+uxv7EaZutLdhxp+TWJ0F2QYS0Fyza+a
         Uypo/kL3BfjMNncqvyJPLYN3zjCptQ6dVVrn5i9UgsSShlTZd/HqjisgEhDLNCv6yQpK
         sdWQZJEGJLNMm8GEMda5/WvOzEv1jj5jXj0/SrBGyF7In+RXy6E1BKEX/Czy8xGxXJ+T
         IN6RWBML6SOgoJfNrQu/Ls3IhYzAtXjyH5fp+kZEKUcAyrv1zO8PD9bEy41Go+F/caLZ
         XyJw==
X-Gm-Message-State: AAQBX9deO3dus3dgn3yXRVfGz8EbV0ORjMs03qsdDuBkxLTuqr/+TOLZ
        ItGYxqcaMukKt/uhrwR85r4rtg==
X-Google-Smtp-Source: AKy350YcO8+Zj1sJMDOFfeDVA20lVibKThKK9vn+ijwRH//g0IvSB2Cjx7HqJzOLFTWt7ZUTOeM5Wg==
X-Received: by 2002:ac2:532c:0:b0:4e9:a3b7:2360 with SMTP id f12-20020ac2532c000000b004e9a3b72360mr10242335lfh.8.1680513802578;
        Mon, 03 Apr 2023 02:23:22 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w5-20020ac25985000000b004e844bb6939sm1680666lfn.2.2023.04.03.02.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 02:23:22 -0700 (PDT)
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
Subject: [PATCH v4 12/12] drm/i915/dsc: make use of several params from drm_dsc_config
Date:   Mon,  3 Apr 2023 12:23:13 +0300
Message-Id: <20230403092313.235320-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
References: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The code was ignoring (up to some point for rc_model_size) the
rc_model_size, rc_tgt_offset_high, rc_tgt_offset_low and rc_edge_factor
parameters from struct drm_dsc_config. Actually use them instead of
resorting to predefined constants.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 2d4917ca1f14..76d956a01e2d 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -89,7 +89,7 @@ calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 		vdsc_cfg->initial_offset = 6144;
 
 	/* initial_xmit_delay = rc_model_size/2/compression_bpp */
-	vdsc_cfg->initial_xmit_delay = DIV_ROUND_UP(DSC_RC_MODEL_SIZE_CONST, 2 * bpp);
+	vdsc_cfg->initial_xmit_delay = DIV_ROUND_UP(vdsc_cfg->rc_model_size, 2 * bpp);
 
 	vdsc_cfg->flatness_min_qp = 3 + qp_bpc_modifier;
 	vdsc_cfg->flatness_max_qp = 12 + qp_bpc_modifier;
@@ -543,7 +543,7 @@ static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 	/* Populate PICTURE_PARAMETER_SET_9 registers */
 	pps_val = 0;
 	pps_val |= DSC_RC_MODEL_SIZE(vdsc_cfg->rc_model_size) |
-		DSC_RC_EDGE_FACTOR(DSC_RC_EDGE_FACTOR_CONST);
+		DSC_RC_EDGE_FACTOR(vdsc_cfg->rc_edge_factor);
 	drm_dbg_kms(&dev_priv->drm, "PPS9 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc, cpu_transcoder)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_9,
@@ -569,8 +569,8 @@ static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 	pps_val = 0;
 	pps_val |= DSC_RC_QUANT_INC_LIMIT0(vdsc_cfg->rc_quant_incr_limit0) |
 		DSC_RC_QUANT_INC_LIMIT1(vdsc_cfg->rc_quant_incr_limit1) |
-		DSC_RC_TARGET_OFF_HIGH(DSC_RC_TGT_OFFSET_HI_CONST) |
-		DSC_RC_TARGET_OFF_LOW(DSC_RC_TGT_OFFSET_LO_CONST);
+		DSC_RC_TARGET_OFF_HIGH(vdsc_cfg->rc_tgt_offset_high) |
+		DSC_RC_TARGET_OFF_LOW(vdsc_cfg->rc_tgt_offset_low);
 	drm_dbg_kms(&dev_priv->drm, "PPS10 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc, cpu_transcoder)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_10,
-- 
2.39.2

