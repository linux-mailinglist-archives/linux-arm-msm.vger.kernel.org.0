Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 469C8751343
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjGLWLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbjGLWLq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:11:46 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF04A2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:44 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6f943383eso122670071fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199902; x=1689804702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
        b=eUQJCuEGxoNyAgK0GQU7bsh0VzSVckuvMBafrWEJstVAupgtuOL7xp0UCV8AY/Bvy/
         N3X7xcBUHIMr7x/hwSHsippDRjIZV6TboLIDmIWlVnDlX0Qbsj/q28ydHIVcT6rEVrkQ
         d1jBsCMk7totRPk0u+TsWmUfTut317VYbAypkURiykvzGHNw7EnEueJ2SQJ3n4O7Kp1k
         M/G2TjTWHkyTkeQUtzV0QguF4wm+h3fY1MLeYby8b0mc4IYmrj8scuD+//ehPL/N6V9Z
         v3qBwC7usWB7s3av551I0iJjUhCd8RGSNj6XWOtYLtpX8O7FF4kS7eoYwK9x9i+VLmYf
         xHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199902; x=1689804702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
        b=XWsMsrTSxvgiiZ89t106e0+v3c2D3TJ+tUQwI3d9q8XUNswvQu6q2UiK+kYkGp7CcR
         yX9KKYWS837jel3wtwsi29JbWDtrQP3VH/wtrbdcg0q67Ecv82NyJDgHxytvTNlA59Kq
         afghN3dOmQhd0H4p62k0ZUyMjVmCVLWoi890ie7PMB+d6yJJSjzGMCrJ8gLYtYqEmhh7
         srYAKY751jQzLx6foVwM2G6AoFhlD+lumkN1PXojdJ3SQ1MzIXqGlIrXbGjLQE9jE0e6
         tBSa0/dFvd8XX8GurzG/U63jsDAPtKjeBuMI84uZByWIYIXFiWtTyDgW0nRycBdps5q1
         Ndpg==
X-Gm-Message-State: ABy/qLa+hVI9v3E+X5Oxa3+3ko2p37KvF5/j7xwJ9Pm+MRFvZ9oQDQQi
        N8dmm1VrMskjtx3G4y7h0jypGQ==
X-Google-Smtp-Source: APBJJlHAcG8o4Mk5Otmnqxt/jCoQlHMizSXykFGZPee/W038aHNo+Hqo6dCCDHs5kBHu5cGYiOPtAQ==
X-Received: by 2002:a19:6504:0:b0:4fb:8b78:4a93 with SMTP id z4-20020a196504000000b004fb8b784a93mr1712790lfb.7.1689199902781;
        Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
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
Subject: [PATCH v4 03/11] drm/msm/dpu: core_perf: bail earlier if there are no ICC paths
Date:   Thu, 13 Jul 2023 01:11:31 +0300
Message-Id: <20230712221139.313729-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Skip bandwidth aggregation and return early if there are no interconnect
paths defined for the DPU device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 333dcfe57800..05d340aa18c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -237,11 +237,11 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
-
 	if (!kms->num_paths)
 		return 0;
 
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
-- 
2.39.2

