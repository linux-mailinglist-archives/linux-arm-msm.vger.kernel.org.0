Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6825276FDCA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 11:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbjHDJsZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 05:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjHDJsI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 05:48:08 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A88127
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 02:48:07 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9f48b6796so28534571fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 02:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691142486; x=1691747286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ia7ixFWhmmaN0o7SC42Vjj/tmV60762EI0Hz3GNAHW8=;
        b=hNE792IZkYahHM15H25k7VCHg9L338Ls2XiVE1JZvlbICnqcAMQzIIoIu/pxeqqvGH
         NC1LLLpw8HIdYhoyIIoP9M3cDsaNfm60mFQ2ELWcdiUxP4H3HrFSVj/jX6t81AxyS88X
         uOrn3rQPaK5fnDoGuvl+iub52NEj6drd59MR+Fxljs17Yk0SKnG8iued9fJs+08YZy+j
         j2th4ttvgSU8umJ4L3QUFiaPkFhpusn6jyry5QNpnGZdXIj8m7wp5XcFarFgcxouJbcl
         22XHe9uaZxwJfO8z3Lfee/DCP6zkGj7h0JKN9Qfp0StFSLiAasObwhQvUdtDdoo/IA46
         FX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142486; x=1691747286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ia7ixFWhmmaN0o7SC42Vjj/tmV60762EI0Hz3GNAHW8=;
        b=Skz5H0fs5/yLU0J/lLn8JdWffpXFa/NxB29EC7EK7uMyAjxhV1tppbKavDZtKdyBMa
         f0wcP3MD0ej09sCbz5jfhDq+PvVJFNriA5vG51hSuZWm3Jsrh7Ikl23kKrAb45P1fhIX
         2HkeAv3D2lPEyfmj/YI2fZ+xeN8r4tNxNa46wZ5QmYMqrDOjwstQNFeQfOiw6QMoZCHC
         MigMmM/vU7821rcMgFeVkTuQbzBCsb3fzZnCF6qYbC3zHc6u+vomEU21HMBjNhy9NGvP
         w8pqO+dFIl5usHzYFCvysE3R7mon2nRChO0XOVEJ5QMRfYPRlwi7tHhUKZDlGvBkMHYp
         4Q5Q==
X-Gm-Message-State: AOJu0Yw/pXj9sfdb6dny7R9mTeK4NECTLjsRZOT3MODnj052niWfX4Rg
        nNnHqV9+OjGXdT88VTwIJn94eg==
X-Google-Smtp-Source: AGHT+IFFYyMhY/dwT3vckRQ4+nd0tP7F/nqRCzwAkUASSgIB7U7IV8MP40hPgycRnIa+74Q4HnzxzQ==
X-Received: by 2002:a2e:b0c6:0:b0:2b9:ea6b:64b with SMTP id g6-20020a2eb0c6000000b002b9ea6b064bmr1092055ljl.37.1691142485789;
        Fri, 04 Aug 2023 02:48:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y3-20020a2e3203000000b002b9de06f119sm364670ljy.67.2023.08.04.02.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:48:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] drm/msm/dpu: initialise clk_rate to 0 in _dpu_core_perf_get_core_clk_rate
Date:   Fri,  4 Aug 2023 12:48:04 +0300
Message-Id: <20230804094804.36053-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

When removing the core perf tune overrides, I also occasionaly removed the
initialisation of the clk_rate variable. Initialise it to 0 to let max()
correctly calculate the maximum of requested clock rates.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 6a4bc73915af ("drm/msm/dpu: drop separate dpu_core_perf_tune overrides")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 0b54a659a940..e843e5f3b3dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -289,6 +289,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
 		return kms->perf.max_core_clk_rate;
 
+	clk_rate = 0;
 	drm_for_each_crtc(crtc, kms->dev) {
 		if (crtc->enabled) {
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
-- 
2.39.2

