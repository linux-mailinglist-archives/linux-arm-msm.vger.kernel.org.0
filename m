Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F6573606D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 02:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjFTAIx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 20:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjFTAIw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 20:08:52 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5604D1AD
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:51 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f871c93a5fso2097146e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687219729; x=1689811729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qY6e3BcGHB5HqqmRhctZWM9TDd08JVLy31I9q/9L3g0=;
        b=nBc3RcEg6OUBHBQYSkD83uVwdM0wzxa5lji2S8JfySTKwqWPHykZz8uoLbMyeXVg2L
         HmlB0eBgzwVzX4ioeBV6H6df7Ud7973HiWyXVMv5m+MbB5Dls2FcVVTVifqCvAyLBOLd
         eesnDlkDwUYzhbN5nyE/NRFXY6+Kg5M1woTEYvTD+7zH4gfTE4pb+C1CjAax49ENfU0V
         Ns45PRNvxFeOOAq+tWWbuSVW/JI3TxMI4ORQ124KN54377uU9bZSp0g8nQ7KSbw72k9B
         kKwMx0YdEo2SYHqv+rALRW0n3y9gxmsN3eD9qFWJURcAel02DgGGu5Ud+9mA0jhF3Lj2
         TfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687219729; x=1689811729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qY6e3BcGHB5HqqmRhctZWM9TDd08JVLy31I9q/9L3g0=;
        b=gVm4mcCKNVhZIgcoaYbzi1V1nIxIBAuj1iiQOdn6zf24ELYpWV/h9zVG8xotNAsqSu
         CXcPReDwWhDdy69dpT7eCPPqC4QuyrLaAvgSWuLzORQxC5WbuTU0JYmnNpDrvm87r92Y
         6I9hkahkSpi5wJLde5uqbguDELtcLRR7j1zfyjAfKGfDysEyzX+U+N8P1CRlTsD1yukr
         6gDCm75cbxBtXpy3Udft514mDNnunIoPTzCi4+wo9JVEGPUCHdhrUqPmUdAXOnB0zG9e
         aWkrwkrbBTH/Yxl/9GyKqvPNU1QL99aGp8arZtzej2unUIdTZ6+jaNOwEIRg9ETZ2l56
         CiCg==
X-Gm-Message-State: AC+VfDzsrfiQcQKXYSjytc1FyOFLWkOT3jcnFY2crXiYImzUug2hwTKy
        cuxiTALt7STfzTUlekAtKD7kOA==
X-Google-Smtp-Source: ACHHUZ7zTw/Jb39q7JK5W617T6BIFyTxDQ5jHjaDpQfH31/vwv5Nulj9H7LEEnL/aPlNL+NPV1ARhg==
X-Received: by 2002:a05:6512:3125:b0:4f8:5864:3cb5 with SMTP id p5-20020a056512312500b004f858643cb5mr6207021lfd.13.1687219729504;
        Mon, 19 Jun 2023 17:08:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:08:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 1/8] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
Date:   Tue, 20 Jun 2023 03:08:39 +0300
Message-Id: <20230620000846.946925-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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

