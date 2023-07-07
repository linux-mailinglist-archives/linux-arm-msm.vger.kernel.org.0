Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7625D74B762
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 21:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbjGGTmd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 15:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233051AbjGGTlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 15:41:17 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B222D52
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 12:39:45 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb9ae4cef6so3690010e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688758784; x=1691350784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
        b=irHyIT5U6hcW3HCfefIjq6zUr7hVHnkb6dPbETKuxXePnm0kYedSBCMGM1hc72sUh7
         3FqmAPxruf3cBN8VsO7Nh2tY3CNec42acK3SPhDe+UPExHeDXWysTpYL/ZoKw8u8h5ra
         KgxxMjKmUlFTESO2vNjj9t0RGa2d32erLdhCKZF9t2RQPqCr0N3WTfoeedn4aKhCcAgm
         Ihw6RTI0/W+ioB2ZpkTj8TmwlAKB6J+03F9VfN+MgLGV9pV46MH88UhjAKXlT0oR1w2r
         HyNxhbyeFqIsF4qseDraSV9hzIQd2Ifi+0ei+03yY7YEjnuZFFhJrGsilrGihLVYSh2P
         VUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688758784; x=1691350784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
        b=iK8xgygkATm9adCG+V7WdZAgOxJq4fFRIY9IbRDIhCh8rP6k/tZtuADljNWSWyzES2
         L/DqVLy2n3q2it2uw0dqWhkhn2OKCKLWjy2OxX0nyogyhA3CvWo8Larr9Ua8y7WcK/00
         BukcatVj5Lsgvzgei8VY98rM9dIe8JiEouIjSe6o+nUMiqBXtIm2MxoY96UFqmxsE/pv
         3AISe86sekDG4cC0acLNeKeePdjkNznoBV6Rp+1jEiKRaiW/LnR334Bvr3qaiXFoRZC4
         QdURUNwOjKNcI6KSDnIfZYBn+AM1AkCdMaFeGx85NzvFUj2a1axPAi2hhmiCd+Y/3Mee
         TUaQ==
X-Gm-Message-State: ABy/qLblJzUZWogdB21BTmGt1p2eQzyKPFalheJW0c5ZgZCtAHtEu/K/
        D3TP0kYDGd9AQPDhDn+R0VvBxQ==
X-Google-Smtp-Source: APBJJlGf0tThZBJ0n0VqdJJEEMFaVduUgRRNX9wjXo2ASpXK/RhgQB9SgzN+BTlYPLNTiTS8J9AAeg==
X-Received: by 2002:a05:6512:694:b0:4fb:91c5:fd38 with SMTP id t20-20020a056512069400b004fb91c5fd38mr5523040lfe.0.1688758783925;
        Fri, 07 Jul 2023 12:39:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 12:39:43 -0700 (PDT)
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
Subject: [PATCH v3 01/11] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
Date:   Fri,  7 Jul 2023 22:39:32 +0300
Message-Id: <20230707193942.3806526-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
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

