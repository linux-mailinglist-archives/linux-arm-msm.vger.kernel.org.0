Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98E85751340
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbjGLWLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbjGLWLp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:11:45 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5A91FE4
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:43 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fba74870abso106437e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199901; x=1689804701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
        b=y6Aij3ypLT4DY9P0gTIiefxjzrnk6WuPzUxvlbcdt+U4RtC1LqcbZGMzhbYFc4UOjX
         OoU+VtQU4PzKzjdVinPZMePXPcapuODlz+6nGnAYdnmpOt6c7dMEkF0ZGkGmCABZ09Jt
         lzyqGvXLYmLQ+CTkiRxUKy7/rJ+dD9Lhw+M0SjawUldB280OvLZza21FCYmsOSRBpWOy
         eXWOk3f2uAzwV9odfEpOIMbGfVduRyJOCoaMFAOw3naC/lZVlzWI8Z6MjFCUXIsf0oT8
         /UsBC3TnZLC7yu3Iw0O9e8Ky4gJH9WdMfqDLtqdxFJPCEd1G91Wy/IhmDJS3MMnrs2af
         nSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199901; x=1689804701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
        b=J9rZsgmj5rc56lpdYUlOqNekALxcOLDbvReHJB+Av0+NLeCa0qDhUGFSJekaFHtEm1
         7pRTIlo7R+4UV+qRXejh0BjdQ4ycJFR6F/oCPNSh+AGJEq6kqqQox8DycLMgmKPCZhJ1
         M1vSECQkgMTaulbF72AVn7RkGuvKhc4StS/LhXP9eQPIiWEfHWDekyFVExB4Xnozgxdz
         ofhh2T7SW+fg/ZcizvsDfxPBZ//4C06UPFprPHnTpkbpNfhKn7k67IbRFQmAiKzo3C0E
         LmyC8NJ+XKbwBfdUvIWfvpIKbAmzzrrEETs46yaQ+JG8Sv/l7DCfsw6ueQV7gDLtsCx/
         KT6g==
X-Gm-Message-State: ABy/qLbi2DQfslT/4rdoxVDpfZXN2aVWG0nagvAvtk2A7dkMQxeRhsAY
        qslLfhzeIrbsjQey2+a2T/5jxQ==
X-Google-Smtp-Source: APBJJlFaw9K1LJyJZUnlJHZ0Fh4QWBPwE6TMCr//rkPpnfoKf4qUL3Ik4q3HAJhInGPAMO0PUEq3QA==
X-Received: by 2002:a05:6512:2351:b0:4fb:99c6:8533 with SMTP id p17-20020a056512235100b004fb99c68533mr20924345lfu.33.1689199901060;
        Wed, 12 Jul 2023 15:11:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:11:40 -0700 (PDT)
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
Subject: [PATCH v4 01/11] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
Date:   Thu, 13 Jul 2023 01:11:29 +0300
Message-Id: <20230712221139.313729-2-dmitry.baryshkov@linaro.org>
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

