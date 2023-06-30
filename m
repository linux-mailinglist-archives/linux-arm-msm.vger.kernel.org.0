Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082E174438B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 22:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbjF3Uzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 16:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbjF3Uzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 16:55:36 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CFF3C2A
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:34 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so3742456e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688158533; x=1690750533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBZLEQW9zfS5g6kh68s594zhUtDUO0fNR0aOdPTih0U=;
        b=efEwQkHUzNEFTkrSIg/8PN1DasXiApxfesoPQW+gRbRkWbSiM2qtS3YD2mYQtpRRLk
         okcBTk2aYQv6v6IO4Ug/vMzG1Ni2WK7qySbQgAIxhv/oep0nl8/khYrcxWi/PJKfoN1p
         EjiIU2QFOpVXecCZ6xYxF7oUYu5Mru6S4YgoO5yvmhiX9R/1LmAkSL+id3FmZ0BfoEPy
         l+lu5Fn+ZzeU3JUyDtIKL/oI2r6NgKljeol1QreIEBe2MN+5KnxsxjT9q5OO7OoexvUG
         Nm3gLacvbB73rJAkVKzxfoNL61/rLbRxFmdMKNn5ZRzN2+wZUMJ3rvDG1Iu/pUbXT7cR
         DkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688158533; x=1690750533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBZLEQW9zfS5g6kh68s594zhUtDUO0fNR0aOdPTih0U=;
        b=TIWWlgrHDOjtxCvClgAAVFgjjv4VGG0VFLLLXs9xmd2N+IQP/a9TBReEFQBZuWWIn+
         ElGSLPqginp+j/kMEwyAuRLUdmEJwdVTTajZ+3pKVIN6SbM3SkJDk0K8ZV8kYcj/5hzV
         IdYm+5p4MP+AtMu4abENo/tG6YWTV8y47Z2+s3qLacxgVvPyilZm3AZrcV9bmaLozjor
         PMzdnMRtQyKSSG7dMF4yn4ZbPE5Zy/z10Oo4x8sKGX9YhVb7CBhYYEF6QIITDP7eHTST
         n4j26QFuUy+RN5SDGoi4SOankBmRSb+bDJ71gAFBpmRgheKPkSvyyRzL0NCt7ZukTn6e
         DXBg==
X-Gm-Message-State: ABy/qLaYhmBa2PCc877U1WjSz4dTqGe55aIo4aQE/b3lovcm0e+pRu5Y
        DsSJhPxUEiKMUs2bhKLgNh1VSA==
X-Google-Smtp-Source: APBJJlEHxSK3/ForlO/cwFGo8aW7QlqR6Temx70Vfj0P9Xg/OUOUhAUIlX/9DwNuiA9rBeBCpFm2Mg==
X-Received: by 2002:ac2:5f5b:0:b0:4f8:5755:5b22 with SMTP id 27-20020ac25f5b000000b004f857555b22mr3010480lfz.27.1688158533249;
        Fri, 30 Jun 2023 13:55:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 13:55:32 -0700 (PDT)
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
Subject: [PATCH 12/15] drm/msm/hdmi: expand the HDMI_CFG macro
Date:   Fri, 30 Jun 2023 23:55:20 +0300
Message-Id: <20230630205523.76823-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
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

Expand the HDMI_CFG() macro in HDMI config description. It has no added
value other than hiding some boilerplate declarations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 16 ++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 621dcc981794..195e1ac90c5a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -236,24 +236,24 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
  * The hdmi device:
  */
 
-#define HDMI_CFG(item, entry) \
-	.item ## _names = item ##_names_ ## entry, \
-	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
-
 static const char *pwr_reg_names_8960[] = {"core-vdda"};
 static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(pwr_clk, 8960),
+	.pwr_reg_names = pwr_reg_names_8960,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8960),
+	.pwr_clk_names = pwr_clk_names_8960,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8960),
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
+	.pwr_reg_names = pwr_reg_names_8x74,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8x74),
+	.pwr_clk_names = pwr_clk_names_8x74,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8x74),
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 22c91c17539c..acfd99d2876a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -89,7 +89,7 @@ struct hdmi_platform_config {
 	const char **pwr_reg_names;
 	int pwr_reg_cnt;
 
-	/* clks that need to be on for hpd: */
+	/* clks that need to be on: */
 	const char **pwr_clk_names;
 	int pwr_clk_cnt;
 };
-- 
2.39.2

