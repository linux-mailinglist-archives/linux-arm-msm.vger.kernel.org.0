Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 104626D1315
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 01:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbjC3XZt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 19:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjC3XZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 19:25:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310CA11E8C
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 16:25:29 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bi9so26633447lfb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 16:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680218727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulzx50nltdBvd14PSoi/AyrNNr9j/GqEsVc35iPrtqQ=;
        b=fXwrEbMbQSuULOzCc5FZSh9TsU7bIewyQVd/hNko2e/PZ9uLzQFtEK4cteKOKdLJFr
         gz7li7VW+2/OqqGK9gQNMpo4O9tesae0ieOoZQ9A3gPHBZq8JAgCg3StWwEonmit2USw
         UKoshL2RIFAOt0WH66nmGuBuNtlu//r4tERWzle7CxBvRswTx1QTE8kOsXkIHAbU3IDe
         dO72/BYpDBJtrYoreys9/NF7dG4eTkcVJOW396PrZnQgMUrk2RvAirmYbLm6LOQ17/7q
         4yiduTUaAM0zmowThTcJlY2Xk7NHGhYnmIee6NQFuO8yJMoYJi2mrrWtlLcD6paqXi36
         0hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680218727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulzx50nltdBvd14PSoi/AyrNNr9j/GqEsVc35iPrtqQ=;
        b=dvktYdwDmJyAxLa5MxhPRk/SY3+mEr7ga4ZvPbNoEBo1X4p5dw0VtNQNk1yRQ16nWI
         aYlzk0G15cM7VoVZe3v39pR2tG8vTbWNOjuLKpDDrfa+n16RsnZvSVK3uTp3N+Jc5TKs
         yWgjsm7orEFLfn0dXQTUzvrnEFltKB2wfX7VtGDMaF2o0LA0+yeBQmW2SFqKIP80GzQV
         jpuW2iiNlPLfoLI4wdtNCxv2YZjvGs6tF5x+v/FvpoU9RTdzQS08GU1uXh4ng7+/8FzQ
         qKJTAizQvFX+X1Ks/RPxcNALPqe5p4U+73T4XWgasvXfBvrr4TezsIRsGa/II6o03jO8
         p78g==
X-Gm-Message-State: AAQBX9cKOBrgn7n3MQ71q1kGpP+8QAS9jg/CUvyspJfCciX7vHe+3+jS
        QMTH+stEkk94HSMRx7znVmRILw==
X-Google-Smtp-Source: AKy350Y4nvhrHuYbh1yWan15j/HtffFl0NiGPKhIhdyxhJQg/LugZsvI+5L4MzjOXhMaB0mUHyZvTg==
X-Received: by 2002:ac2:5e88:0:b0:4eb:c4e:bd87 with SMTP id b8-20020ac25e88000000b004eb0c4ebd87mr5700090lfq.58.1680218727463;
        Thu, 30 Mar 2023 16:25:27 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 16:25:27 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 31 Mar 2023 01:25:18 +0200
Subject: [PATCH v5 04/15] drm/msm/a6xx: Remove static keyword from sptprac
 en/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-4-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ve7dkZrYc5cSSMu89e01MZzyBYTeqWaeZyy4JZy7U0w=;
 b=Zke1xsMS3dnkdn+JdDDFWbcG6ov48tbnXWiZVfSJvfbVaMPHjiPK8ibVyXKOALdcGohtiQUDjEq3
 +dAI+2q3B3cF8Ol2RVrRAj48FIvuMTM7CAjlyLWuwULoocsKuaOI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These two will be reused by at least A619_holi in the non-gmu
paths. Turn them non-static them to make it possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index ba6b8ea27c71..1514b3ed0fcf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 }
 
 /* Enable CPU control of SPTP power power collapse */
-static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 }
 
 /* Disable CPU control of SPTP power power collapse */
-static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 {
 	u32 val;
 	int ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..7ee5b606bc47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -193,5 +193,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.40.0

