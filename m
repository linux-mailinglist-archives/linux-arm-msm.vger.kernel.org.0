Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D15D709840
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 15:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjESN3a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 09:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbjESN31 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 09:29:27 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3264CC2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 06:29:26 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2af177f12d1so22163551fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 06:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684502964; x=1687094964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CoLKDA4nls3CGbrXvxh61SjvP4v8d9SGkB682PI8Y9w=;
        b=Z2m27kLSE1/hw4iXIE43fi41wpKcFGxK0Xnz1w3T0lvfvcVk7Le/dEr+zi+NGu1tJf
         /OKfe10DfnNwtrOoIjkKfQVAUfzj1PZRmT8MEw6tANJx9t9XoxSvsB/Go/dOwGpkfSvi
         Lb0vcRU1NXSqRbpzFuwYtJQ0M5MkGiPzGD+GpyLJGC+1otOlmpnKQzFzuijUnp610wRL
         f93k4HuHiZM1WfeSuOYffIrpdKQ6KwV4WkxxgEcPK/WPFMC9Qm6xJp2wwXU0SCVvOeZv
         yfA8zWafiXtaFx0IQYXhtZPOS1COVU+JOV6hYDyHf6fqP6pkl/A7YrypOO69nsxDmsXw
         PWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684502964; x=1687094964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoLKDA4nls3CGbrXvxh61SjvP4v8d9SGkB682PI8Y9w=;
        b=JA+ooEjv0c7cSyi5q4Yll/PaTj9dBFsR/ktIyE5c/xN8gwmcyRsYlhPWRYKoKnaYCK
         3N7fuVbqZHm5EYY7a36xQcessj4iI2EakKN4ykwSDtfEcLu3iWVIeFqPXws+NgvIFIMV
         g/XiTy8OMaaFjRuptIVcjNAzc1EbDZOgOPICqZ4zS7hzVKwv6N9sms2flqv303loD7dx
         FhG5hw9D2KkXYwjNuSotL20EZIJyfDfZgtyg0idenw+Z4HFuYtg7o1Ul26xcMzkhcTc3
         VqLk6SX+2go9DJ4ox32Bjz8wkkTe1RFrFpqW9jG9MPOtRTCrIpMCkdMTqLBVeYKCeBWd
         2Zjw==
X-Gm-Message-State: AC+VfDwW7E7qyJqHObjmVwcUwEppthk0IOYu82mc0HFpzqMR/7+VTU72
        gm7D8px3lr2zsEUPDBFquzGJnQ==
X-Google-Smtp-Source: ACHHUZ6CxGFLDlfvrAV3JkY97oQkX8w9GTUFMc0/kvtZwEgddKmd2D5f8xSBKXHwb9BO5aK9+azW7Q==
X-Received: by 2002:a2e:8091:0:b0:2ad:fef4:94f8 with SMTP id i17-20020a2e8091000000b002adfef494f8mr797526ljg.6.1684502964590;
        Fri, 19 May 2023 06:29:24 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 06:29:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 19 May 2023 15:29:11 +0200
Subject: [PATCH v2 6/6] drm/msm/a6xx: Fix up GMU region reservations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v2-6-5b9daa2b2cf0@linaro.org>
References: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=1342;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=btUFgb1HmX4JzaeMKMcU2R1/tETWRJTF/5M21P54ufE=;
 b=uge7jhsa+6TMgVnbDiql/KjRMCa2Zb0JOe9R2GsPOzeoMYLsykOQCCB6qAuMi5PGNRRC++0uR
 dFwe/8HcIVVBFtJho3vrH41g3hspVEGRLxiuZX69M1/8Ix2IBah+mWC
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the order of region allocations to make the addresses match
downstream. This shouldn't matter very much, but helps eliminate one
more difference when comparing register accesses.

Also, make the log region 16K long. That's what it is, unconditionally
on A6xx and A7xx.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8004b582e45f..386c81e1a2f3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1614,13 +1614,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			goto err_memory;
 	}
 
-	/* Allocate memory for for the HFI queues */
-	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
+	/* Allocate memory for the GMU log region */
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_16K, 0, "log");
 	if (ret)
 		goto err_memory;
 
-	/* Allocate memory for the GMU log region */
-	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_4K, 0, "log");
+	/* Allocate memory for for the HFI queues */
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
 	if (ret)
 		goto err_memory;
 

-- 
2.40.1

