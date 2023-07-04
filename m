Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF907474BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjGDPEB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjGDPEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:00 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185DE10DA
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:03:58 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b6c5ede714so69185121fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483036; x=1691075036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
        b=rrDHjT1XdohbcAEb7K/I45P6WCTri8lRvdqh3U1QdxZ/OUDMVh/obCczQoyxUHIxhm
         C4Ww9VKXvnn4H4JfqMi+mUBaYbvvemW7181yFoUzLMHW8SIk3MT7zla3qY8zpgF7MAa4
         lUGL+5Y3JfcpTJbsoHAZO5eS9QKDA6oB0n2bU5+MWA2uYZq+uwtJxx9zo5bUSKSKnvdD
         7VUs5FoyCQDWEGESI5puZ8yDV1UpLbwUodPjp6igqx06YqMaMYN/B51Rx/59I+Yf9oHV
         6O9Jo68S7N4P/eQafgYzjlrW5B/gmWIYfRZH8PP7HzzZFNTnux+y7hkI6/+aVJ8WQPkT
         72nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483036; x=1691075036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
        b=TTj5L6pYGaPzquZA2py5mgysx2SnGDLYrHmc3KXjw/OaFCL+tvDJUDLFX7kXZ71Bes
         Hjf1qXz+neQUm1eL30YWybfy+YmXH2qWTJjYQNjbvKQwO8+i5fDbQ6JhUTDFFVPF+dLU
         sORL62FR2vobgkaG4nti2voF2V3vsQD4VA965RjMKcwDdG7numrpvIjqlgoq9JskEZ1t
         Vl51grtdUioy6QXJz6vyZsVw9H4kdIK9eAjYVIBTWMy9WJxniOkQR8NObh8nBlPX/blR
         iSOEAbIMmx5oYBnMkVghgDei2zqsoo7q3ZzGFtpa98ev9eGV1rR7vvUwrAXhZ/Fprpw5
         DoMQ==
X-Gm-Message-State: AC+VfDyGT3upv1wk+ODpUgOh6kxx1dsEeoU7OzZLsjZzY13126U5dk7w
        h0f7CKYo91uSV25PR3W9UAEiew==
X-Google-Smtp-Source: ACHHUZ6Z6+YzUGt6Z0XsYxLyOrcysDN2d2wGK/OHEBQBcN1Z6cxNKGbIrIhPPmdtll8oMChE0BI+tw==
X-Received: by 2002:a05:651c:1309:b0:2b6:9f54:af9a with SMTP id u9-20020a05651c130900b002b69f54af9amr6875576lja.8.1688483036141;
        Tue, 04 Jul 2023 08:03:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:03:55 -0700 (PDT)
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
Subject: [PATCH v2 01/14] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
Date:   Tue,  4 Jul 2023 18:03:41 +0300
Message-Id: <20230704150354.159882-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
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

