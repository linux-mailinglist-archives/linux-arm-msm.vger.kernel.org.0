Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76004746751
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 04:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjGDCVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 22:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjGDCVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 22:21:46 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100DDE6A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 19:21:45 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f875b267d9so7970355e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 19:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688437303; x=1691029303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJGttKPpc9oU+TZPEzFQEPF96G1UK9uJ7TLcLtJR5fQ=;
        b=oGLuaHG0aQUZtuLRSpiAHPBKIcIHD6HZQUn1GIF3F+TvWi7fVqN1THV9phA3qmbq2l
         CEqAbVsqQua1WU7qvzwEoCM3A0rbv9o+3CE7Ip0ThuHpSgtY/yBgwBCCYoXlWpjxItxz
         OjwgBj8aGus9v9WPwmYNkR3KR0JmnN2ZTDyHwyY0lSANFGEpNmBoirgteSXSqe6v+dBa
         be/5jWofJGFkpXX8OOzW8qD2hE6rTjecXG1HErKRZaEj6H1oOy74p89/SXDVV1KKHVi5
         nek1pNf18fchuBhdU085RHHqoeFCW5NlGwqN71sTaHDToBiYfFLXOGSkJxgWdIJXw0O0
         4cYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688437303; x=1691029303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJGttKPpc9oU+TZPEzFQEPF96G1UK9uJ7TLcLtJR5fQ=;
        b=hSrH/dEr8tMH+7nVyshmUBxGfp8x+ZwSFDFBOW+Q5uHZ5zcfPRkHkK62U3AO6kWl+2
         JB9d3uGxriHwMGoDyn1fUJCHOamkcBfnzy1C9EzzqkUzAn/DUmBo2MhpkIrFi0fKjUHM
         bj6eFey3YYvDVuNJ3icv+PEeX4k06GTPHuWSrjZNePFylHC/WllFhRiZRLiuWGRS64S3
         6WRHfJMKT3vPSj0xAwdL9Rd5UH5Ma8zFgaAUfmATH4ccUPAHBgOT66KtwvjoR4L9yd9w
         NHSr4t7TssOBwvaNJUicl7FM+PZaxGSTE3yTYBTKU2M5trMBXvKEJlp/5xldWDFy/8dK
         1y7A==
X-Gm-Message-State: ABy/qLZUZmG4MvbEVaJqcooZhwZ5gQ08Bd78Ozv7bCxxtVKGRuKB3v4f
        hwdG60p/NSrWLHntoIAsoGJx3A==
X-Google-Smtp-Source: APBJJlGNm/KwhBXIiCKyqjeGcp1PM0ZMfPFhtILr+jjeACaVzdOWsQ7Tm1ZBrhKzAK/MGdUU1C2Phw==
X-Received: by 2002:a2e:3211:0:b0:2b6:ec2b:659 with SMTP id y17-20020a2e3211000000b002b6ec2b0659mr2742537ljy.17.1688437303450;
        Mon, 03 Jul 2023 19:21:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y16-20020a05651c021000b002b6e863108esm1137830ljn.9.2023.07.03.19.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 19:21:43 -0700 (PDT)
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
Subject: [PATCH v5 08/19] drm/msm/dpu: drop zero features from dpu_ctl_cfg data
Date:   Tue,  4 Jul 2023 05:21:25 +0300
Message-Id: <20230704022136.130522-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
References: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
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

Drop useless zero assignments to the dpu_ctl_cfg::features field.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 757ac648a692..e0cc1ce3f3e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -54,7 +54,6 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
@@ -66,13 +65,11 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9fb8ef21c7f0..f52e1fa27e2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -58,19 +58,16 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
-- 
2.39.2

