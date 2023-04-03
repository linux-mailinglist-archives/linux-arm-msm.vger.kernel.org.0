Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB8C6D4068
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 11:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbjDCJXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 05:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231947AbjDCJXk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 05:23:40 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F3EEC6E
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 02:23:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y15so37160941lfa.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 02:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680513801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/vvD74dTg6Ok9D3o7oMegz307H2NDMir9mYubi5ivw=;
        b=K1azTHao1MjTShcSN2oVWr5jewh1WrWWg/uSMSPj0cZSepspTsLsUE8yhji0HfGlfS
         Xve42Pem8Gr7gFEsGncWjK88pEu2u/i54aUpnGnXjzo8Gwvj3yFzOep9DoXyfwXT2Jit
         igZD8lH7oN4vqdNNl3G7fM5pnI/IhAVqrmckxc8lwS1+AQgJIc7Ku6fK3yyAOHqX3ZSr
         xTHl8NoZXJGgUAeu8KkoXVYT5m4+1DsEM+CHdnCF3zczgCJ+cr2bfYWtbBMDzkRNiLlP
         NuT9FxUS+CrO8IGrxTIWQ3IAEhN9rtrXvg14nnfc/pkPsaKuB48sSSizzX8124BUZiNp
         C7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680513801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/vvD74dTg6Ok9D3o7oMegz307H2NDMir9mYubi5ivw=;
        b=YfM90bF6ZMyBY/aRJkKYWWdAWzBxcBlv9ZOCGphPOcM75+sj5+jGMNSbAuAFfwTtp4
         XI8z4voHbpwZ9E/omvuP0kloQ6rZfbPqDPXIlQdNSEmw9WN5zZHGVhhwLV/w5xt6RpN9
         SUKr14EBrIIEDDtO9IsjJwrdT91CPgwMYpwYH5tf+NgLbYMd+vUz0VTo/PvoqZb3w+Kf
         bgCvH+wBbujzISIM/qMGuYpkn9P++nmwD73uqjDvPS9JlaMIPg2gvzM9Y5GpHFhudbzP
         kj4CYaGPzZfX30YHDtucJylsN1Xb8o54TOez/3P2mTPIGkh+hmONTk0QDvA6WlzQ6E1B
         +z/g==
X-Gm-Message-State: AAQBX9fzHRuoaNRZ1YBpF8oaytBpBNlEQ6j2dbttI+Zuqt8xDdadTVB6
        pB6tCyNPW/STMEn9I3m077SyIw==
X-Google-Smtp-Source: AKy350bJEhdvMEKnfbjk6VbrKH8zClgxGzO1FgBv9sn94U6YU1pIrLcBf8WPtHz6DgtOTGbP557o1Q==
X-Received: by 2002:ac2:54ae:0:b0:4ea:f8f0:545f with SMTP id w14-20020ac254ae000000b004eaf8f0545fmr10148214lfk.52.1680513801365;
        Mon, 03 Apr 2023 02:23:21 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w5-20020ac25985000000b004e844bb6939sm1680666lfn.2.2023.04.03.02.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 02:23:21 -0700 (PDT)
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
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v4 10/12] drm/display/dsc: Add flatness and initial scale value calculations
Date:   Mon,  3 Apr 2023 12:23:11 +0300
Message-Id: <20230403092313.235320-11-dmitry.baryshkov@linaro.org>
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

From: Jessica Zhang <quic_jesszhan@quicinc.com>

Add helpers to calculate det_thresh_flatness and initial_scale_value as
these calculations are defined within the DSC spec.

Changes in v2:
- Renamed det_thresh_flatness to flatness_det_thresh
- Set initial_scale_value directly in helper

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/display/drm_dsc_helper.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 4448c482b092..bfa7f3acafcb 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -26,5 +26,16 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 
+static inline void drm_dsc_set_initial_scale_value(struct drm_dsc_config *dsc)
+{
+	dsc->initial_scale_value = 8 * dsc->rc_model_size /
+		(dsc->rc_model_size - dsc->initial_offset);
+}
+
+static inline int drm_dsc_calculate_flatness_det_thresh(struct drm_dsc_config *dsc)
+{
+	return 2 << (dsc->bits_per_component - 8);
+}
+
 #endif /* _DRM_DSC_HELPER_H_ */
 
-- 
2.39.2

