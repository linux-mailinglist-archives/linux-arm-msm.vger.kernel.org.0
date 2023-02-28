Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 510BD6A585B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 12:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjB1Lec (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 06:34:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbjB1LeU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 06:34:20 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2144321944
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 03:33:54 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id j17so9790704ljq.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 03:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXWuxeHMpQCt72Y6URHGm/0rqCv9ixM2ky1A1nPsEmM=;
        b=TLaApNXQYt+GGH90M9J0kQTk3FAPpjSvTOoymUjW3a5rNLHt2/U70oZJRshp6YR1tr
         q/0eaGAKH79ZmS3ARUVoCwgCf3V+fd7xrsTwI45x8Q06Sq3qCZV1Ui6uTmpRysDHipdL
         GYAhJBhtMYk9htNtv4SJ/I6ALseEBhf+7JzbBqcjdE5zDaRvSUi9PtEBU7w2aqM+vqZ9
         v6iwufFDtZBeQ1RD8IzG6L9M2C6BWz5Dznj6RVJIO/U0jwyrFEVoWSZdOHYoJ0YVaxCP
         q1IcHSZryMDOms/6aWmXOSKzS1ha7O2UBJ4uu12CphpfICBox9C5YglP6bPZ+UkwhYB1
         lbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXWuxeHMpQCt72Y6URHGm/0rqCv9ixM2ky1A1nPsEmM=;
        b=QF9GsJsbj0OcaUWcdeUlkvvPVhciCR79j/IlJBckE5sRHHb65OXrrP9x67nzWVL5ga
         b+azMUFaaEgDe+sI7RXmzqIAF8ljqHaQjrjiGht2BSreAaRJ0SVNRA5a6pyn5LdLbe3w
         XUxP4en1dIOM+tKsD8msAJQbAGq451HaT1v5DaaW1uRz+iqgJJ5asLowDO6U3G3nB5K4
         SnN0HpM0dMdtmC82UzQIJ8eYWh12hkvGgXw8UNEumOc/EextIPM3hjQCL0Py4iZHWvBq
         4ly87FKWYW0ePR95XTHZtv4ycQEtbxoja96POQEUPyYa+xtFyrcCuxY6ievYqfbtcIsh
         Kt0w==
X-Gm-Message-State: AO0yUKV3gbRXFhKZJ5TYHEHrm9nxAs86A0vOn0USp4p0wu/AsFT2nL7l
        jylG9+DsUz3CxnD/XWv/kyDP7w==
X-Google-Smtp-Source: AK7set/4snBqz3dNu/V4QAfth2avIe2gSCEFSnkxR3/1JeO8KRGhQ2dLJ9tNjWaF2k7WvQPblTCjaQ==
X-Received: by 2002:a05:651c:1691:b0:293:2cc5:47a7 with SMTP id bd17-20020a05651c169100b002932cc547a7mr578658ljb.52.1677584032099;
        Tue, 28 Feb 2023 03:33:52 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h20-20020ac25974000000b004dd0bbc89a1sm1288472lfp.244.2023.02.28.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 03:33:51 -0800 (PST)
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
        freedreno@lists.freedesktop.org
Subject: [PATCH 10/10] drm/msm/dsi: use new helpers for DSC setup
Date:   Tue, 28 Feb 2023 13:33:42 +0200
Message-Id: <20230228113342.2051425-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use new DRM DSC helpers to setup DSI DSC configuration. The
initial_scale_value needs to be adjusted according to the standard, but
this is a separate change.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 61 ++++--------------------------
 1 file changed, 8 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 18fa30e1e858..dda989727921 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1735,28 +1735,9 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	return -EINVAL;
 }
 
-static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
-	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
-	0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
-};
-
-/* only 8bpc, 8bpp added */
-static char min_qp[DSC_NUM_BUF_RANGES] = {
-	0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
-};
-
-static char max_qp[DSC_NUM_BUF_RANGES] = {
-	4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
-};
-
-static char bpg_offset[DSC_NUM_BUF_RANGES] = {
-	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
-};
-
 static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc)
 {
-	int i;
-	u16 bpp = dsc->bits_per_pixel >> 4;
+	int ret;
 
 	if (dsc->bits_per_pixel & 0xf) {
 		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support fractional bits_per_pixel\n");
@@ -1768,49 +1749,23 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 		return -EOPNOTSUPP;
 	}
 
-	dsc->rc_model_size = 8192;
-	dsc->first_line_bpg_offset = 12;
-	dsc->rc_edge_factor = 6;
-	dsc->rc_tgt_offset_high = 3;
-	dsc->rc_tgt_offset_low = 3;
 	dsc->simple_422 = 0;
 	dsc->convert_rgb = 1;
 	dsc->vbr_enable = 0;
 
-	/* handle only bpp = bpc = 8 */
-	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
-		dsc->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
+	drm_dsc_set_const_params(dsc);
+	drm_dsc_set_rc_buf_thresh(dsc);
 
-	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
-		dsc->rc_range_params[i].range_min_qp = min_qp[i];
-		dsc->rc_range_params[i].range_max_qp = max_qp[i];
-		/*
-		 * Range BPG Offset contains two's-complement signed values that fill
-		 * 8 bits, yet the registers and DCS PPS field are only 6 bits wide.
-		 */
-		dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i] & DSC_RANGE_BPG_OFFSET_MASK;
+	/* handle only bpp = bpc = 8, pre-SCR panels */
+	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
+	if (ret) {
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
+		return ret;
 	}
 
-	dsc->initial_offset = 6144;		/* Not bpp 12 */
-	if (bpp != 8)
-		dsc->initial_offset = 2048;	/* bpp = 12 */
-
-	if (dsc->bits_per_component <= 10)
-		dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
-	else
-		dsc->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
-
-	dsc->initial_xmit_delay = 512;
 	dsc->initial_scale_value = 32;
-	dsc->first_line_bpg_offset = 12;
 	dsc->line_buf_depth = dsc->bits_per_component + 1;
 
-	/* bpc 8 */
-	dsc->flatness_min_qp = 3;
-	dsc->flatness_max_qp = 12;
-	dsc->rc_quant_incr_limit0 = 11;
-	dsc->rc_quant_incr_limit1 = 11;
-
 	return drm_dsc_compute_rc_parameters(dsc);
 }
 
-- 
2.39.2

