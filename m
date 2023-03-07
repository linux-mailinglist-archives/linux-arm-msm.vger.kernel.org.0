Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAE86AE149
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjCGNuk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:50:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjCGNuQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:50:16 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C54285B3E
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:49:11 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id f16so13177781ljq.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678196945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUdM6gcvVPoYAicEfspkc+pYHN7j7urkjBC5SuHpoQ0=;
        b=JbDeO36va4c1p9/R8l+kvcktzL7ud9au5b8L7L21lGD5rWhlwF/boHC/90ql6ls4xt
         ZioEW3FjaL9Ex30zICx121LA/3w1aMv8J1S8GfvF7oijGmxxUBXsHMSIMXEgofzHIFaw
         FNn9JvanIMM58UHtQFu+9EerxVOtOnXTnMZQbTqOXt6IUWYy5B0qYFuLpbHbQ1M1WV0l
         0TbP57+DWxrGNNxr/P+DPI93sqcW22Il/xRF9ixJyYa6kHFA7IWgDPKJ2yMPJPNW5FdX
         c3a1jBsqcXWThZTc+bPzgSr+Lq6p38HDZyG3ZmVuinyqD09td2RAQTFfhWMFaWttpO9F
         Cyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUdM6gcvVPoYAicEfspkc+pYHN7j7urkjBC5SuHpoQ0=;
        b=pysggoNWc+LlRTrs5TwovDYdDgVA2tN4NKFJlKtA7ymB4Z9tdYEUq1iojqSNyDvPC0
         LaCv8hNxh0FQHh2oE1PF4TNyuQHzALMqW5CSxDF/NKBaFdHKe+A9/hWS7Vg9ZuUkz+bo
         J+jdyP/JVNcZZQVZ82BO5odwB45pQSFuAk02XWw2yEvpT+0CJiLTOcEpvVWoJ4aidb06
         tbOrxQgfL+39di3Wbssserjq9Hnd9z75fkguLKNx+87Zd/R2rtiKasst9cCrXnAMFmlv
         ATCkMS4v32SQAIz1zuGWPB21rlPD2KvMo5J3bF37qrMmSH6OocAS4u+8zKOge3Mvs6Y6
         qHOw==
X-Gm-Message-State: AO0yUKVpaCYVjGsipyS4rNw182HrS359t5L6/u2pIPmaGIInjUNtKGU7
        nCOjklIoyxjRZl0pF5dLOGXYPg==
X-Google-Smtp-Source: AK7set8GlCEjL8vddH5SM4px28VNcccT7+MMN1HPOC3qrv4rWIZ5RGG1Oux59qRrlg0B0g80AwXOXA==
X-Received: by 2002:a2e:9682:0:b0:295:acb3:cb66 with SMTP id q2-20020a2e9682000000b00295acb3cb66mr4119648lji.45.1678196945086;
        Tue, 07 Mar 2023 05:49:05 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u14-20020a2e91ce000000b0029597ebacd0sm2128991ljg.64.2023.03.07.05.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:49:04 -0800 (PST)
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
Subject: [PATCH v2 03/10] drm/i915/dsc: move DSC tables to DRM DSC helper
Date:   Tue,  7 Mar 2023 15:48:54 +0200
Message-Id: <20230307134901.322560-4-dmitry.baryshkov@linaro.org>
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

Move DSC RC tables to DRM DSC helper. No additional code changes
and/or cleanups are a part of this commit, it will be cleaned up in the
followup commits.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c  | 372 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c | 319 +------------------
 include/drm/display/drm_dsc_helper.h      |   1 +
 3 files changed, 380 insertions(+), 312 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index be91abe2cfb2..122a292bbc8f 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -305,6 +305,378 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
 }
 EXPORT_SYMBOL(drm_dsc_set_rc_buf_thresh);
 
+enum ROW_INDEX_BPP {
+	ROW_INDEX_6BPP = 0,
+	ROW_INDEX_8BPP,
+	ROW_INDEX_10BPP,
+	ROW_INDEX_12BPP,
+	ROW_INDEX_15BPP,
+	MAX_ROW_INDEX
+};
+
+enum COLUMN_INDEX_BPC {
+	COLUMN_INDEX_8BPC = 0,
+	COLUMN_INDEX_10BPC,
+	COLUMN_INDEX_12BPC,
+	COLUMN_INDEX_14BPC,
+	COLUMN_INDEX_16BPC,
+	MAX_COLUMN_INDEX
+};
+
+struct rc_parameters {
+	u16 initial_xmit_delay;
+	u8 first_line_bpg_offset;
+	u16 initial_offset;
+	u8 flatness_min_qp;
+	u8 flatness_max_qp;
+	u8 rc_quant_incr_limit0;
+	u8 rc_quant_incr_limit1;
+	struct drm_dsc_rc_range_parameters rc_range_params[DSC_NUM_BUF_RANGES];
+};
+
+/*
+ * Selected Rate Control Related Parameter Recommended Values
+ * from DSC_v1.11 spec & C Model release: DSC_model_20161212
+ */
+static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
+	{
+		/* 6BPP/8BPC */
+		{ 768, 15, 6144, 3, 13, 11, 11, {
+			{ 0, 4, 0 }, { 1, 6, -2 }, { 3, 8, -2 }, { 4, 8, -4 },
+			{ 5, 9, -6 }, { 5, 9, -6 }, { 6, 9, -6 }, { 6, 10, -8 },
+			{ 7, 11, -8 }, { 8, 12, -10 }, { 9, 12, -10 }, { 10, 12, -12 },
+			{ 10, 12, -12 }, { 11, 12, -12 }, { 13, 14, -12 }
+			}
+		},
+		/* 6BPP/10BPC */
+		{ 768, 15, 6144, 7, 17, 15, 15, {
+			{ 0, 8, 0 }, { 3, 10, -2 }, { 7, 12, -2 }, { 8, 12, -4 },
+			{ 9, 13, -6 }, { 9, 13, -6 }, { 10, 13, -6 }, { 10, 14, -8 },
+			{ 11, 15, -8 }, { 12, 16, -10 }, { 13, 16, -10 },
+			{ 14, 16, -12 }, { 14, 16, -12 }, { 15, 16, -12 },
+			{ 17, 18, -12 }
+			}
+		},
+		/* 6BPP/12BPC */
+		{ 768, 15, 6144, 11, 21, 19, 19, {
+			{ 0, 12, 0 }, { 5, 14, -2 }, { 11, 16, -2 }, { 12, 16, -4 },
+			{ 13, 17, -6 }, { 13, 17, -6 }, { 14, 17, -6 }, { 14, 18, -8 },
+			{ 15, 19, -8 }, { 16, 20, -10 }, { 17, 20, -10 },
+			{ 18, 20, -12 }, { 18, 20, -12 }, { 19, 20, -12 },
+			{ 21, 22, -12 }
+			}
+		},
+		/* 6BPP/14BPC */
+		{ 768, 15, 6144, 15, 25, 23, 23, {
+			{ 0, 16, 0 }, { 7, 18, -2 }, { 15, 20, -2 }, { 16, 20, -4 },
+			{ 17, 21, -6 }, { 17, 21, -6 }, { 18, 21, -6 }, { 18, 22, -8 },
+			{ 19, 23, -8 }, { 20, 24, -10 }, { 21, 24, -10 },
+			{ 22, 24, -12 }, { 22, 24, -12 }, { 23, 24, -12 },
+			{ 25, 26, -12 }
+			}
+		},
+		/* 6BPP/16BPC */
+		{ 768, 15, 6144, 19, 29, 27, 27, {
+			{ 0, 20, 0 }, { 9, 22, -2 }, { 19, 24, -2 }, { 20, 24, -4 },
+			{ 21, 25, -6 }, { 21, 25, -6 }, { 22, 25, -6 }, { 22, 26, -8 },
+			{ 23, 27, -8 }, { 24, 28, -10 }, { 25, 28, -10 },
+			{ 26, 28, -12 }, { 26, 28, -12 }, { 27, 28, -12 },
+			{ 29, 30, -12 }
+			}
+		},
+	},
+	{
+		/* 8BPP/8BPC */
+		{ 512, 12, 6144, 3, 12, 11, 11, {
+			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
+			{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+			}
+		},
+		/* 8BPP/10BPC */
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
+		},
+		/* 8BPP/12BPC */
+		{ 512, 12, 6144, 11, 20, 19, 19, {
+			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
+			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
+			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
+			{ 21, 23, -12 }
+			}
+		},
+		/* 8BPP/14BPC */
+		{ 512, 12, 6144, 15, 24, 23, 23, {
+			{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
+			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+			{ 15, 21, -8 }, { 15, 22, -10 }, { 17, 22, -10 },
+			{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
+			{ 24, 25, -12 }
+			}
+		},
+		/* 8BPP/16BPC */
+		{ 512, 12, 6144, 19, 28, 27, 27, {
+			{ 0, 12, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 15, 20, -2 },
+			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+			{ 19, 25, -8 }, { 19, 26, -10 }, { 21, 26, -10 },
+			{ 21, 27, -12 }, { 21, 27, -12 }, { 25, 28, -12 },
+			{ 28, 29, -12 }
+			}
+		},
+	},
+	{
+		/* 10BPP/8BPC */
+		{ 410, 15, 5632, 3, 12, 11, 11, {
+			{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 10, -10 },
+			{ 5, 11, -12 }, { 7, 11, -12 }, { 11, 12, -12 }
+			}
+		},
+		/* 10BPP/10BPC */
+		{ 410, 15, 5632, 7, 16, 15, 15, {
+			{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
+			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 14, -10 },
+			{ 9, 15, -12 }, { 11, 15, -12 }, { 15, 16, -12 }
+			}
+		},
+		/* 10BPP/12BPC */
+		{ 410, 15, 5632, 11, 20, 19, 19, {
+			{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
+			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
+			{ 13, 18, -10 }, { 13, 19, -12 }, { 15, 19, -12 },
+			{ 19, 20, -12 }
+			}
+		},
+		/* 10BPP/14BPC */
+		{ 410, 15, 5632, 15, 24, 23, 23, {
+			{ 0, 11, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 13, 18, -2 },
+			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+			{ 15, 21, -8 }, { 15, 21, -10 }, { 17, 22, -10 },
+			{ 17, 22, -10 }, { 17, 23, -12 }, { 19, 23, -12 },
+			{ 23, 24, -12 }
+			}
+		},
+		/* 10BPP/16BPC */
+		{ 410, 15, 5632, 19, 28, 27, 27, {
+			{ 0, 11, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 16, 20, -2 },
+			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+			{ 19, 25, -8 }, { 19, 25, -10 }, { 21, 26, -10 },
+			{ 21, 26, -10 }, { 21, 27, -12 }, { 23, 27, -12 },
+			{ 27, 28, -12 }
+			}
+		},
+	},
+	{
+		/* 12BPP/8BPC */
+		{ 341, 15, 2048, 3, 12, 11, 11, {
+			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
+			{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+			}
+		},
+		/* 12BPP/10BPC */
+		{ 341, 15, 2048, 7, 16, 15, 15, {
+			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
+			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
+			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+			}
+		},
+		/* 12BPP/12BPC */
+		{ 341, 15, 2048, 11, 20, 19, 19, {
+			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
+			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
+			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
+			{ 21, 23, -12 }
+			}
+		},
+		/* 12BPP/14BPC */
+		{ 341, 15, 2048, 15, 24, 23, 23, {
+			{ 0, 6, 2 }, { 7, 10, 0 }, { 9, 13, 0 }, { 11, 16, -2 },
+			{ 14, 17, -4 }, { 15, 18, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+			{ 15, 20, -8 }, { 15, 21, -10 }, { 17, 21, -10 },
+			{ 17, 21, -12 }, { 17, 21, -12 }, { 19, 22, -12 },
+			{ 22, 23, -12 }
+			}
+		},
+		/* 12BPP/16BPC */
+		{ 341, 15, 2048, 19, 28, 27, 27, {
+			{ 0, 6, 2 }, { 6, 11, 0 }, { 11, 15, 0 }, { 14, 18, -2 },
+			{ 18, 21, -4 }, { 19, 22, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+			{ 19, 24, -8 }, { 19, 25, -10 }, { 21, 25, -10 },
+			{ 21, 25, -12 }, { 21, 25, -12 }, { 23, 26, -12 },
+			{ 26, 27, -12 }
+			}
+		},
+	},
+	{
+		/* 15BPP/8BPC */
+		{ 273, 15, 2048, 3, 12, 11, 11, {
+			{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
+			{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 3, -2 }, { 2, 4, -4 },
+			{ 2, 5, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 4, 7, -10 },
+			{ 5, 7, -12 }, { 7, 8, -12 }, { 8, 9, -12 }
+			}
+		},
+		/* 15BPP/10BPC */
+		{ 273, 15, 2048, 7, 16, 15, 15, {
+			{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
+			{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 7, -2 }, { 6, 8, -4 },
+			{ 6, 9, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 8, 11, -10 },
+			{ 9, 11, -12 }, { 11, 12, -12 }, { 12, 13, -12 }
+			}
+		},
+		/* 15BPP/12BPC */
+		{ 273, 15, 2048, 11, 20, 19, 19, {
+			{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
+			{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
+			{ 11, 13, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
+			{ 13, 15, -10 }, { 13, 15, -12 }, { 15, 16, -12 },
+			{ 16, 17, -12 }
+			}
+		},
+		/* 15BPP/14BPC */
+		{ 273, 15, 2048, 15, 24, 23, 23, {
+			{ 0, 4, 10 }, { 3, 8, 8 }, { 6, 11, 6 }, { 9, 14, 4 },
+			{ 13, 15, 2 }, { 13, 15, 0 }, { 13, 16, -2 }, { 14, 16, -4 },
+			{ 15, 17, -6 }, { 15, 17, -8 }, { 16, 18, -10 },
+			{ 17, 19, -10 }, { 17, 19, -12 }, { 19, 20, -12 },
+			{ 20, 21, -12 }
+			}
+		},
+		/* 15BPP/16BPC */
+		{ 273, 15, 2048, 19, 28, 27, 27, {
+			{ 0, 4, 10 }, { 4, 9, 8 }, { 8, 13, 6 }, { 12, 17, 4 },
+			{ 17, 19, 2 }, { 17, 20, 0 }, { 17, 20, -2 }, { 18, 20, -4 },
+			{ 19, 21, -6 }, { 19, 21, -8 }, { 20, 22, -10 },
+			{ 21, 23, -10 }, { 21, 23, -12 }, { 23, 24, -12 },
+			{ 24, 25, -12 }
+			}
+		}
+	}
+};
+
+static int get_row_index_for_rc_params(u16 compressed_bpp)
+{
+	switch (compressed_bpp) {
+	case 6:
+		return ROW_INDEX_6BPP;
+	case 8:
+		return ROW_INDEX_8BPP;
+	case 10:
+		return ROW_INDEX_10BPP;
+	case 12:
+		return ROW_INDEX_12BPP;
+	case 15:
+		return ROW_INDEX_15BPP;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int get_column_index_for_rc_params(u8 bits_per_component)
+{
+	switch (bits_per_component) {
+	case 8:
+		return COLUMN_INDEX_8BPC;
+	case 10:
+		return COLUMN_INDEX_10BPC;
+	case 12:
+		return COLUMN_INDEX_12BPC;
+	case 14:
+		return COLUMN_INDEX_14BPC;
+	case 16:
+		return COLUMN_INDEX_16BPC;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct rc_parameters *get_rc_params(u16 compressed_bpp,
+						 u8 bits_per_component)
+{
+	int row_index, column_index;
+
+	row_index = get_row_index_for_rc_params(compressed_bpp);
+	if (row_index < 0)
+		return NULL;
+
+	column_index = get_column_index_for_rc_params(bits_per_component);
+	if (column_index < 0)
+		return NULL;
+
+	return &rc_parameters[row_index][column_index];
+}
+
+/**
+ * drm_dsc_setup_rc_params() - Set parameters and limits for RC model in
+ * accordance with the DSC 1.1 or 1.2 specification and DSC C Model
+ * Required bits_per_pixel and bits_per_component to be set before calling this
+ * function.
+ *
+ * @vdsc_cfg: DSC Configuration data partially filled by driver
+ *
+ * Return: 0 or -error code in case of an error
+ */
+int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
+{
+	const struct rc_parameters *rc_params;
+	int i;
+
+	if (WARN_ON_ONCE(!vdsc_cfg->bits_per_pixel ||
+			 !vdsc_cfg->bits_per_component))
+		return -EINVAL;
+
+	/* fractional BPP is not supported */
+	if (vdsc_cfg->bits_per_pixel & 0xf)
+		return -EINVAL;
+
+	rc_params = get_rc_params(vdsc_cfg->bits_per_pixel >> 4,
+				  vdsc_cfg->bits_per_component);
+	if (!rc_params)
+		return -EINVAL;
+
+	vdsc_cfg->first_line_bpg_offset = rc_params->first_line_bpg_offset;
+	vdsc_cfg->initial_xmit_delay = rc_params->initial_xmit_delay;
+	vdsc_cfg->initial_offset = rc_params->initial_offset;
+	vdsc_cfg->flatness_min_qp = rc_params->flatness_min_qp;
+	vdsc_cfg->flatness_max_qp = rc_params->flatness_max_qp;
+	vdsc_cfg->rc_quant_incr_limit0 = rc_params->rc_quant_incr_limit0;
+	vdsc_cfg->rc_quant_incr_limit1 = rc_params->rc_quant_incr_limit1;
+
+	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
+		vdsc_cfg->rc_range_params[i].range_min_qp =
+			rc_params->rc_range_params[i].range_min_qp;
+		vdsc_cfg->rc_range_params[i].range_max_qp =
+			rc_params->rc_range_params[i].range_max_qp;
+		/*
+		 * Range BPG Offset uses 2's complement and is only a 6 bits. So
+		 * mask it to get only 6 bits.
+		 */
+		vdsc_cfg->rc_range_params[i].range_bpg_offset =
+			rc_params->rc_range_params[i].range_bpg_offset &
+			DSC_RANGE_BPG_OFFSET_MASK;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dsc_setup_rc_params);
+
 /**
  * drm_dsc_compute_rc_parameters() - Write rate control
  * parameters to the dsc configuration defined in
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 38cc4b43f1cb..8f99434c4ebc 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -18,24 +18,6 @@
 #include "intel_qp_tables.h"
 #include "intel_vdsc.h"
 
-enum ROW_INDEX_BPP {
-	ROW_INDEX_6BPP = 0,
-	ROW_INDEX_8BPP,
-	ROW_INDEX_10BPP,
-	ROW_INDEX_12BPP,
-	ROW_INDEX_15BPP,
-	MAX_ROW_INDEX
-};
-
-enum COLUMN_INDEX_BPC {
-	COLUMN_INDEX_8BPC = 0,
-	COLUMN_INDEX_10BPC,
-	COLUMN_INDEX_12BPC,
-	COLUMN_INDEX_14BPC,
-	COLUMN_INDEX_16BPC,
-	MAX_COLUMN_INDEX
-};
-
 struct rc_parameters {
 	u16 initial_xmit_delay;
 	u8 first_line_bpg_offset;
@@ -47,296 +29,6 @@ struct rc_parameters {
 	struct drm_dsc_rc_range_parameters rc_range_params[DSC_NUM_BUF_RANGES];
 };
 
-/*
- * Selected Rate Control Related Parameter Recommended Values
- * from DSC_v1.11 spec & C Model release: DSC_model_20161212
- */
-static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
-{
-	/* 6BPP/8BPC */
-	{ 768, 15, 6144, 3, 13, 11, 11, {
-		{ 0, 4, 0 }, { 1, 6, -2 }, { 3, 8, -2 }, { 4, 8, -4 },
-		{ 5, 9, -6 }, { 5, 9, -6 }, { 6, 9, -6 }, { 6, 10, -8 },
-		{ 7, 11, -8 }, { 8, 12, -10 }, { 9, 12, -10 }, { 10, 12, -12 },
-		{ 10, 12, -12 }, { 11, 12, -12 }, { 13, 14, -12 }
-		}
-	},
-	/* 6BPP/10BPC */
-	{ 768, 15, 6144, 7, 17, 15, 15, {
-		{ 0, 8, 0 }, { 3, 10, -2 }, { 7, 12, -2 }, { 8, 12, -4 },
-		{ 9, 13, -6 }, { 9, 13, -6 }, { 10, 13, -6 }, { 10, 14, -8 },
-		{ 11, 15, -8 }, { 12, 16, -10 }, { 13, 16, -10 },
-		{ 14, 16, -12 }, { 14, 16, -12 }, { 15, 16, -12 },
-		{ 17, 18, -12 }
-		}
-	},
-	/* 6BPP/12BPC */
-	{ 768, 15, 6144, 11, 21, 19, 19, {
-		{ 0, 12, 0 }, { 5, 14, -2 }, { 11, 16, -2 }, { 12, 16, -4 },
-		{ 13, 17, -6 }, { 13, 17, -6 }, { 14, 17, -6 }, { 14, 18, -8 },
-		{ 15, 19, -8 }, { 16, 20, -10 }, { 17, 20, -10 },
-		{ 18, 20, -12 }, { 18, 20, -12 }, { 19, 20, -12 },
-		{ 21, 22, -12 }
-		}
-	},
-	/* 6BPP/14BPC */
-	{ 768, 15, 6144, 15, 25, 23, 23, {
-		{ 0, 16, 0 }, { 7, 18, -2 }, { 15, 20, -2 }, { 16, 20, -4 },
-		{ 17, 21, -6 }, { 17, 21, -6 }, { 18, 21, -6 }, { 18, 22, -8 },
-		{ 19, 23, -8 }, { 20, 24, -10 }, { 21, 24, -10 },
-		{ 22, 24, -12 }, { 22, 24, -12 }, { 23, 24, -12 },
-		{ 25, 26, -12 }
-		}
-	},
-	/* 6BPP/16BPC */
-	{ 768, 15, 6144, 19, 29, 27, 27, {
-		{ 0, 20, 0 }, { 9, 22, -2 }, { 19, 24, -2 }, { 20, 24, -4 },
-		{ 21, 25, -6 }, { 21, 25, -6 }, { 22, 25, -6 }, { 22, 26, -8 },
-		{ 23, 27, -8 }, { 24, 28, -10 }, { 25, 28, -10 },
-		{ 26, 28, -12 }, { 26, 28, -12 }, { 27, 28, -12 },
-		{ 29, 30, -12 }
-		}
-	},
-},
-{
-	/* 8BPP/8BPC */
-	{ 512, 12, 6144, 3, 12, 11, 11, {
-		{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
-		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
-		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
-		{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
-		}
-	},
-	/* 8BPP/10BPC */
-	{ 512, 12, 6144, 7, 16, 15, 15, {
-		/*
-		 * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
-		 * VESA DSC 1.1 Table E-5 sets it to 4.
-		 */
-		{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
-		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
-		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
-		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
-		}
-	},
-	/* 8BPP/12BPC */
-	{ 512, 12, 6144, 11, 20, 19, 19, {
-		{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
-		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
-		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
-		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
-		{ 21, 23, -12 }
-		}
-	},
-	/* 8BPP/14BPC */
-	{ 512, 12, 6144, 15, 24, 23, 23, {
-		{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
-		{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
-		{ 15, 21, -8 }, { 15, 22, -10 }, { 17, 22, -10 },
-		{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
-		{ 24, 25, -12 }
-		}
-	},
-	/* 8BPP/16BPC */
-	{ 512, 12, 6144, 19, 28, 27, 27, {
-		{ 0, 12, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 15, 20, -2 },
-		{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
-		{ 19, 25, -8 }, { 19, 26, -10 }, { 21, 26, -10 },
-		{ 21, 27, -12 }, { 21, 27, -12 }, { 25, 28, -12 },
-		{ 28, 29, -12 }
-		}
-	},
-},
-{
-	/* 10BPP/8BPC */
-	{ 410, 15, 5632, 3, 12, 11, 11, {
-		{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
-		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
-		{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 10, -10 },
-		{ 5, 11, -12 }, { 7, 11, -12 }, { 11, 12, -12 }
-		}
-	},
-	/* 10BPP/10BPC */
-	{ 410, 15, 5632, 7, 16, 15, 15, {
-		{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
-		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
-		{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 14, -10 },
-		{ 9, 15, -12 }, { 11, 15, -12 }, { 15, 16, -12 }
-		}
-	},
-	/* 10BPP/12BPC */
-	{ 410, 15, 5632, 11, 20, 19, 19, {
-		{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
-		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
-		{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
-		{ 13, 18, -10 }, { 13, 19, -12 }, { 15, 19, -12 },
-		{ 19, 20, -12 }
-		}
-	},
-	/* 10BPP/14BPC */
-	{ 410, 15, 5632, 15, 24, 23, 23, {
-		{ 0, 11, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 13, 18, -2 },
-		{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
-		{ 15, 21, -8 }, { 15, 21, -10 }, { 17, 22, -10 },
-		{ 17, 22, -10 }, { 17, 23, -12 }, { 19, 23, -12 },
-		{ 23, 24, -12 }
-		}
-	},
-	/* 10BPP/16BPC */
-	{ 410, 15, 5632, 19, 28, 27, 27, {
-		{ 0, 11, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 16, 20, -2 },
-		{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
-		{ 19, 25, -8 }, { 19, 25, -10 }, { 21, 26, -10 },
-		{ 21, 26, -10 }, { 21, 27, -12 }, { 23, 27, -12 },
-		{ 27, 28, -12 }
-		}
-	},
-},
-{
-	/* 12BPP/8BPC */
-	{ 341, 15, 2048, 3, 12, 11, 11, {
-		{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
-		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
-		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
-		{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
-		}
-	},
-	/* 12BPP/10BPC */
-	{ 341, 15, 2048, 7, 16, 15, 15, {
-		{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
-		{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
-		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
-		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
-		}
-	},
-	/* 12BPP/12BPC */
-	{ 341, 15, 2048, 11, 20, 19, 19, {
-		{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
-		{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
-		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
-		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
-		{ 21, 23, -12 }
-		}
-	},
-	/* 12BPP/14BPC */
-	{ 341, 15, 2048, 15, 24, 23, 23, {
-		{ 0, 6, 2 }, { 7, 10, 0 }, { 9, 13, 0 }, { 11, 16, -2 },
-		{ 14, 17, -4 }, { 15, 18, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
-		{ 15, 20, -8 }, { 15, 21, -10 }, { 17, 21, -10 },
-		{ 17, 21, -12 }, { 17, 21, -12 }, { 19, 22, -12 },
-		{ 22, 23, -12 }
-		}
-	},
-	/* 12BPP/16BPC */
-	{ 341, 15, 2048, 19, 28, 27, 27, {
-		{ 0, 6, 2 }, { 6, 11, 0 }, { 11, 15, 0 }, { 14, 18, -2 },
-		{ 18, 21, -4 }, { 19, 22, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
-		{ 19, 24, -8 }, { 19, 25, -10 }, { 21, 25, -10 },
-		{ 21, 25, -12 }, { 21, 25, -12 }, { 23, 26, -12 },
-		{ 26, 27, -12 }
-		}
-	},
-},
-{
-	/* 15BPP/8BPC */
-	{ 273, 15, 2048, 3, 12, 11, 11, {
-		{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
-		{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 3, -2 }, { 2, 4, -4 },
-		{ 2, 5, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 4, 7, -10 },
-		{ 5, 7, -12 }, { 7, 8, -12 }, { 8, 9, -12 }
-		}
-	},
-	/* 15BPP/10BPC */
-	{ 273, 15, 2048, 7, 16, 15, 15, {
-		{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
-		{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 7, -2 }, { 6, 8, -4 },
-		{ 6, 9, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 8, 11, -10 },
-		{ 9, 11, -12 }, { 11, 12, -12 }, { 12, 13, -12 }
-		}
-	},
-	/* 15BPP/12BPC */
-	{ 273, 15, 2048, 11, 20, 19, 19, {
-		{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
-		{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
-		{ 11, 13, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
-		{ 13, 15, -10 }, { 13, 15, -12 }, { 15, 16, -12 },
-		{ 16, 17, -12 }
-		}
-	},
-	/* 15BPP/14BPC */
-	{ 273, 15, 2048, 15, 24, 23, 23, {
-		{ 0, 4, 10 }, { 3, 8, 8 }, { 6, 11, 6 }, { 9, 14, 4 },
-		{ 13, 15, 2 }, { 13, 15, 0 }, { 13, 16, -2 }, { 14, 16, -4 },
-		{ 15, 17, -6 }, { 15, 17, -8 }, { 16, 18, -10 },
-		{ 17, 19, -10 }, { 17, 19, -12 }, { 19, 20, -12 },
-		{ 20, 21, -12 }
-		}
-	},
-	/* 15BPP/16BPC */
-	{ 273, 15, 2048, 19, 28, 27, 27, {
-		{ 0, 4, 10 }, { 4, 9, 8 }, { 8, 13, 6 }, { 12, 17, 4 },
-		{ 17, 19, 2 }, { 17, 20, 0 }, { 17, 20, -2 }, { 18, 20, -4 },
-		{ 19, 21, -6 }, { 19, 21, -8 }, { 20, 22, -10 },
-		{ 21, 23, -10 }, { 21, 23, -12 }, { 23, 24, -12 },
-		{ 24, 25, -12 }
-		}
-	}
-}
-
-};
-
-static int get_row_index_for_rc_params(u16 compressed_bpp)
-{
-	switch (compressed_bpp) {
-	case 6:
-		return ROW_INDEX_6BPP;
-	case 8:
-		return ROW_INDEX_8BPP;
-	case 10:
-		return ROW_INDEX_10BPP;
-	case 12:
-		return ROW_INDEX_12BPP;
-	case 15:
-		return ROW_INDEX_15BPP;
-	default:
-		return -EINVAL;
-	}
-}
-
-static int get_column_index_for_rc_params(u8 bits_per_component)
-{
-	switch (bits_per_component) {
-	case 8:
-		return COLUMN_INDEX_8BPC;
-	case 10:
-		return COLUMN_INDEX_10BPC;
-	case 12:
-		return COLUMN_INDEX_12BPC;
-	case 14:
-		return COLUMN_INDEX_14BPC;
-	case 16:
-		return COLUMN_INDEX_16BPC;
-	default:
-		return -EINVAL;
-	}
-}
-
-static const struct rc_parameters *get_rc_params(u16 compressed_bpp,
-						 u8 bits_per_component)
-{
-	int row_index, column_index;
-
-	row_index = get_row_index_for_rc_params(compressed_bpp);
-	if (row_index < 0)
-		return NULL;
-
-	column_index = get_column_index_for_rc_params(bits_per_component);
-	if (column_index < 0)
-		return NULL;
-
-	return &rc_parameters[row_index][column_index];
-}
-
 bool intel_dsc_source_support(const struct intel_crtc_state *crtc_state)
 {
 	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -454,6 +146,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	const struct rc_parameters *rc_params;
 	struct rc_parameters *rc = NULL;
 	u8 i = 0;
+	int ret;
 
 	vdsc_cfg->pic_width = pipe_config->hw.adjusted_mode.crtc_hdisplay;
 	vdsc_cfg->slice_width = DIV_ROUND_UP(vdsc_cfg->pic_width,
@@ -483,10 +176,11 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 		calculate_rc_params(rc, vdsc_cfg);
 		rc_params = rc;
 	} else {
-		rc_params = get_rc_params(compressed_bpp,
-					  vdsc_cfg->bits_per_component);
-		if (!rc_params)
-			return -EINVAL;
+		ret = drm_dsc_setup_rc_params(vdsc_cfg);
+		if (ret)
+			return ret;
+
+		goto out;
 	}
 
 	vdsc_cfg->first_line_bpg_offset = rc_params->first_line_bpg_offset;
@@ -525,6 +219,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 			vdsc_cfg->rc_range_params[0].range_bpg_offset = 0;
 	}
 
+out:
 	/*
 	 * BitsPerComponent value determines mux_word_size:
 	 * When BitsPerComponent is less than or 10bpc, muxWordSize will be equal to
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 706ba1d34742..1681791f65a5 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -15,6 +15,7 @@ int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
 void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
 			      const struct drm_dsc_config *dsc_cfg);
 void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
+int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 
 #endif /* _DRM_DSC_HELPER_H_ */
-- 
2.39.2

