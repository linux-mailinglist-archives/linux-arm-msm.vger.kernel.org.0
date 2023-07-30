Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7C17682F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjG3BBI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjG3BBH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:01:07 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604491BEB
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:06 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9cbaee7a9so35121291fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690678864; x=1691283664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
        b=u5L9B/3bk5OfURJCO+E4E8xTmHGSqRBRotnOZdwavvZIr6CLuElLXApx9guveEO338
         sh5PyX6Xw+mUpdu+2sMHP117cWRf1wuT8X3dT12WmsgctjHjaWMJiSL/yk+ayHtVCX3H
         bZs05EK0SEBhqig/P3wtUa9g7gdBKZt7KQmNuMkJFYprFSOMriahr0PE9F5BTQxI2h/P
         kT80hrroqpL5LjhQDuuTMmlWCmCNopvHEJXCPU5qC7O0+YJo26u1o+8mRWYCrmcNzxyD
         UNtKGlXiRMAg6ZtMbcSJBm9gNAHhmdT5u3xQEiLnZteCYPX+Oa6K86JAcp+npe4PcL8k
         SkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690678864; x=1691283664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
        b=WJbBua9E5dXfqeYC+Jk1flH/AS/98A8QSTi0vHwuXzQXP2At9dyPSxqHl4rH1LGyHk
         9p9f3HQBvyzdbSSXzzy+LG4GXeyzf/FxL9Z0PqqDMQ1QjRY4TxAwaW53KtFaDIRgpceR
         dx0WuYrittP435PdJDi/9DqtD85CT2wBqu90yZWtrV/XxAUJnFNEJZePCestgESyPXcb
         5C+QOQNFrrAJtOvgfrA9/aR912VxBlBigULNUlQek7GdXKkwvu6unxr+vHBYvJWI5+1g
         YNP6WcrkASFL6RbxK1tnjQTouxm4+FI6mC5g0JTQDKlZs+dpiNTtG9s5TW5jMLJxVMNg
         /83Q==
X-Gm-Message-State: ABy/qLbgggeiySuTId2KnnDJ9gqXVdb+AAfCuHjbU0ytlHJKobZmoPre
        bWOFvU9tyK8sy+hwtAbNDUbAoQ==
X-Google-Smtp-Source: APBJJlFoK781J9kOomNbay57OPIT/P+DjfzqSGyXGz5fYGV+p5vTJ7L/vuwbre1VSkLe6Q23a3c+TQ==
X-Received: by 2002:a2e:88ce:0:b0:2b9:a6a1:f20 with SMTP id a14-20020a2e88ce000000b002b9a6a10f20mr4795181ljk.42.1690678864689;
        Sat, 29 Jul 2023 18:01:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:01:04 -0700 (PDT)
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
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v5 01/10] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
Date:   Sun, 30 Jul 2023 04:00:53 +0300
Message-Id: <20230730010102.350713-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop the leftover of bus-client -> interconnect conversion, the enum
dpu_core_perf_data_bus_id.

Fixes: cb88482e2570 ("drm/msm/dpu: clean up references of DPU custom bus scaling")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index e3795995e145..29bb8ee2bc26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -14,19 +14,6 @@
 
 #define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
 
-/**
- * enum dpu_core_perf_data_bus_id - data bus identifier
- * @DPU_CORE_PERF_DATA_BUS_ID_MNOC: DPU/MNOC data bus
- * @DPU_CORE_PERF_DATA_BUS_ID_LLCC: MNOC/LLCC data bus
- * @DPU_CORE_PERF_DATA_BUS_ID_EBI: LLCC/EBI data bus
- */
-enum dpu_core_perf_data_bus_id {
-	DPU_CORE_PERF_DATA_BUS_ID_MNOC,
-	DPU_CORE_PERF_DATA_BUS_ID_LLCC,
-	DPU_CORE_PERF_DATA_BUS_ID_EBI,
-	DPU_CORE_PERF_DATA_BUS_ID_MAX,
-};
-
 /**
  * struct dpu_core_perf_params - definition of performance parameters
  * @max_per_pipe_ib: maximum instantaneous bandwidth request
-- 
2.39.2

