Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC72370AACD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 22:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjETUBL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 May 2023 16:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjETUBK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 May 2023 16:01:10 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7534134
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 13:01:06 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2af2451b3f1so23100811fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 13:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684612865; x=1687204865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kL5WC4XfsCjBMRG17TRvwYrcpAIhfVj8rtH9i+qu5n8=;
        b=T8EEuoaH9hcVaP0ope0+Ib4TJAIQYcW4nlwT3SIP2Josx4is7qBtx/WUQy+tCC/ohi
         nG/ycc+0hCWrHEUA2ccL0JWlgr+eP6TjkV5XzyqjHkl7Nc0HuEq+rNzcYCjpyNDcVF57
         LXkUCSnby0SbyGIMOVlZc+vh1anQuQoRuKuRo6TfaerN4LufY8ugHt+evoT9Dz/3BKBS
         LqCBjJTRpYxqLYShqSXFrWSAPfCA/u1Aef/IOoLRA4N8tMOeM6oE5DzZLNr2bD5WYdln
         wwENCEJKUKcG8/YrIGweH7MUmJKK+FMdbHwFkyRqgnvXAeOOE/S3XviK3wrSNq6fvKLM
         QY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684612865; x=1687204865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL5WC4XfsCjBMRG17TRvwYrcpAIhfVj8rtH9i+qu5n8=;
        b=litssHhiPH0qy19keqPSPRPPTZBQLfU0HGbk/siU9tkBrbgfY1+fWEUYFXMTfwxF4H
         AlhClwaolgz6fvlXLMh+AGEk2UBrLSzdlJXl7By5e4KSGzX7D3edMPt1+wF9KQD/QgGr
         Jj8uqZKCkJDkeLCoZu956szdkfNgP+pDUP1KAdWazzE12LOMnxBbJAuECbT0o11m52da
         oagjwc38Bx530R2lTzoD9IF2xl/ohRK64bXGp9FVMiyq5w2tbtRx9XJIIjxj/TTBd+PY
         EbsyyywrAivrlu8kkvFIDlYS47NTZKScz2hpU5dMStf7ULdZbgEmH3cUwBnYNLpcOIHJ
         Bvjg==
X-Gm-Message-State: AC+VfDyafTfmQKHS9ofXatlCDi4KU5SZ+u/+yKx4SK/C5Qt21mwWbwkm
        KkyCrpL2Cwd5+nk4rAHQhsfQZA==
X-Google-Smtp-Source: ACHHUZ7iwo3hKsXxSciKJSuSMB9lTFMkik0lRJvgifMQz5iT7xHTeS9p9+1YlAcL/3t2i71b8+eoYw==
X-Received: by 2002:a2e:a169:0:b0:2af:1761:8f23 with SMTP id u9-20020a2ea169000000b002af17618f23mr2601350ljl.46.1684612865159;
        Sat, 20 May 2023 13:01:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c4-20020a05651c014400b002ad9b741959sm418061ljd.76.2023.05.20.13.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 13:01:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm/dsi: use mult_frac for pclk_bpp calculation
Date:   Sat, 20 May 2023 23:01:03 +0300
Message-Id: <20230520200103.4019607-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
References: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
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

Simplify calculations around pixel_clk_rate division. Replace common
pattern of doing 64-bit multiplication and then a do_div() call with
simpler mult_frac() invocation.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
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

