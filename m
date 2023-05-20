Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8043270A405
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 02:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjETA2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 20:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjETA2w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 20:28:52 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3AC10D
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 17:28:50 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ac89e6a5a1so43636951fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 17:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684542529; x=1687134529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3k2sxRgDw6YNokiHR0unpL0UTuKTWTAICPApPLhhiX8=;
        b=g5C/6XabcX8Mk2zB8DYpJBWnKcftAKvF7omoRiIVyUNMGjw5vUfTtIV6YrdN/0cIjO
         +FDbh3Dy6RqaMBHprE6AncuLXqjnd2PDkdtpSWDjRP4THu4XPfd6UcsfT4bRM8A6r18Y
         4Smkkump/rVKJi67t21+TaxakzvphyPiezl6bS+srQoZsz1YQFj0BL2vcOvoYP73MQCF
         dcTwj1Jg7dSEVV6SlNq0wGLizAmn2ObdvFSPO0wY1l56c7CTPrgyRsKsdYYBSbZyrNvG
         6ASgyVe85iY7kj860zjrlEr5eDpQdd08Fv2YBi1EDcRvX0vO+cHKBjaKZgZCIvw3EuOc
         vJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684542529; x=1687134529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3k2sxRgDw6YNokiHR0unpL0UTuKTWTAICPApPLhhiX8=;
        b=LTBkTZTgmtpVdWetOVYuvo2RHV9DWSf9w68HIsAWqyUrPZp/lBZh4sayqlQhTODwpw
         7aQBp8g+WrXabtjBLPA+yhXl4OD04EcVdJQTV9F4K6WY/C/+wx2XytFsKZ1UEtfltTMa
         Gtt8GU9SvucXMDYi1qWYmnYH0YDSkAVhGxP27iHrGq9g6yE2L36+x3zhN9ZJTB2x1t5/
         gfzVo3kCgAJlvTknMt2Xe2w7z7ef+/GWg6QkszmuGM48huovht0dWL7LBSpZNZVv1s1y
         weRPWfCdan/HWo2uwKPumjWBuMxNFF0LFMZA/omp+4IO0owK9QtuK8pdXfgqGf821Fy4
         lVKg==
X-Gm-Message-State: AC+VfDxqvbWTyoG0ofzr/DJaTj5gganXh4HgCz93IXxUzO4Xj3f5mhvU
        shPMAPt29PJ8fh8Vk19nIYiMOw==
X-Google-Smtp-Source: ACHHUZ5geOEPDHUZ6mMol1fFMxG2q7UMTTV1QjKIoaWItykgGPFlY56gEk5GQGAuqn3KUvXON3tl7A==
X-Received: by 2002:a2e:808e:0:b0:2ac:8bc1:9cb1 with SMTP id i14-20020a2e808e000000b002ac8bc19cb1mr1283925ljg.42.1684542529011;
        Fri, 19 May 2023 17:28:49 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l14-20020a2e99ce000000b0029c96178425sm60950ljj.19.2023.05.19.17.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 17:28:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dsi: use mult_frac for pclk_bpp calculation
Date:   Sat, 20 May 2023 03:28:46 +0300
Message-Id: <20230520002846.2870546-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520002846.2870546-1-dmitry.baryshkov@linaro.org>
References: <20230520002846.2870546-1-dmitry.baryshkov@linaro.org>
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

Simplify calculatoins around pixel_clk_rate division. Replace common
pattern of doing 64-bit multiplication and then a do_div() call with
simpler mult_frac call.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 2b257b459974..744f2398a6d6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -585,7 +585,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
 	u8 lanes = msm_host->lanes;
 	u32 bpp = dsi_get_bpp(msm_host->format);
 	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
-	u64 pclk_bpp = (u64)pclk_rate * bpp;
+	unsigned long pclk_bpp;
 
 	if (lanes == 0) {
 		pr_err("%s: forcing mdss_dsi lanes to 1\n", __func__);
@@ -594,9 +594,9 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
 
 	/* CPHY "byte_clk" is in units of 16 bits */
 	if (msm_host->cphy_mode)
-		do_div(pclk_bpp, (16 * lanes));
+		pclk_bpp = mult_frac(pclk_rate, bpp, 16 * lanes);
 	else
-		do_div(pclk_bpp, (8 * lanes));
+		pclk_bpp = mult_frac(pclk_rate, bpp, 8 * lanes);
 
 	return pclk_bpp;
 }
@@ -627,15 +627,12 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	u32 bpp = dsi_get_bpp(msm_host->format);
-	u64 pclk_bpp;
 	unsigned int esc_mhz, esc_div;
 	unsigned long byte_mhz;
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
 
-	pclk_bpp = (u64)msm_host->pixel_clk_rate * bpp;
-	do_div(pclk_bpp, 8);
-	msm_host->src_clk_rate = pclk_bpp;
+	msm_host->src_clk_rate = mult_frac(msm_host->pixel_clk_rate, bpp, 8);
 
 	/*
 	 * esc clock is byte clock followed by a 4 bit divider,
-- 
2.39.2

