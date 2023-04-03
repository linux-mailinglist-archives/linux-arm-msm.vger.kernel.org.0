Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 185B06D405A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 11:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbjDCJXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 05:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbjDCJXh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 05:23:37 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BFFCC1B
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 02:23:18 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g17so37186265lfv.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680513797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dr+52mGsT+6t14CI69EisPIcQF6p4tUnT/YjnwEkL/4=;
        b=BBydxd4S9cAM1DB4cah6DSGcugcmwQ+16l30NC0P17tlVyplrbnGChlT/25ZIttlmC
         wvmF8EdUZKPRH37Pez+tP5ZFjVIB6UA8e38vr2YQJXnMGNYg39dEtkPXiU2siqeeq9Tq
         JHakFnYHrys7KPT1E4fKF7s1t8X9wIUMCBS/VX/zcyjUjeI8xgWLGoC0/luUG2Qki9zg
         eTJnwCF/7cjb4i23lEBpn5Mx9iN3wNXZVrbG2h44YAmMnj0fvP5hla16mQMVWEfy7bJE
         UPKtdtKdlOePiCmhKzf3zZxiCMlnBWwhbx2exuRX07gqbK/xJ0OjEzUWaz4DruZa5+Am
         ZVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680513797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dr+52mGsT+6t14CI69EisPIcQF6p4tUnT/YjnwEkL/4=;
        b=g7+vP4iUFK6Op+Y9TvzNcgZedoLXgjkWqm92dc+LGztRvTe8IOE+kWcO5KzGdyB6OP
         4ZSGxMXlKQxnzqjE1sFbq2S0+It8/jrUBj6zUql3H8qMNImT97N4v1i6flQTGFd2TSze
         BkHE0I+SWjKcw1J6f1OTs1Ime9LZ96X6rJgfpUvDQI8QhfBoQRqIEN93gPn4pHbBqxjV
         1IVn1WQ92JELnJF9UTlHfh5k66R0iUE4vaMfw1IX1KnNcAt4GOxfDlI8T7pLr5TNmmYN
         cvCOl3gOy0w6N2+4EFG04Pj2d10qJ69XSOjPsxpI/20FgC38jGnNQsd1ymuEzQio+iM9
         a4UQ==
X-Gm-Message-State: AAQBX9cfeyGzge8sXPb+9QP6LkR35n5qsAwNyRogXpkDijiK884AKWLm
        nXiudjg7ioFqXBZwf2GinkPlug==
X-Google-Smtp-Source: AKy350bgLDi30Z2cwFIcpH6Oxv3ggzdlmd5RS7dhE9BMPbv+5PIlEVMfm8Hc1nm+0JTyEV3JpSbaFg==
X-Received: by 2002:a19:6d1c:0:b0:4dc:75c3:9a90 with SMTP id i28-20020a196d1c000000b004dc75c39a90mr4364536lfc.11.1680513796709;
        Mon, 03 Apr 2023 02:23:16 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w5-20020ac25985000000b004e844bb6939sm1680666lfn.2.2023.04.03.02.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 02:23:16 -0700 (PDT)
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
Subject: [PATCH v4 03/12] drm/i915/dsc: move DSC tables to DRM DSC helper
Date:   Mon,  3 Apr 2023 12:23:04 +0300
Message-Id: <20230403092313.235320-4-dmitry.baryshkov@linaro.org>
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
index 2fd08375bbe3..d0536582e4b9 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -19,24 +19,6 @@
 #include "intel_vdsc.h"
 #include "intel_vdsc_regs.h"
 
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
@@ -48,296 +30,6 @@ struct rc_parameters {
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
@@ -479,6 +171,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	struct rc_parameters *rc = NULL;
 	int err;
 	u8 i = 0;
+	int ret;
 
 	vdsc_cfg->pic_width = pipe_config->hw.adjusted_mode.crtc_hdisplay;
 	vdsc_cfg->slice_width = DIV_ROUND_UP(vdsc_cfg->pic_width,
@@ -552,10 +245,11 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
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
@@ -594,6 +288,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
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

