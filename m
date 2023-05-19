Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA4E670983A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 15:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbjESN3Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 09:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbjESN3W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 09:29:22 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4C9C2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 06:29:21 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ac785015d6so36001041fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 06:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684502959; x=1687094959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYnjMvr3c+U3gEgGMSSumyjYrLuRnotb/3F/SfKgnsc=;
        b=DMQ+agUAp0tVNmLZx211/kwHmQhA3PYSkImSPr1de5DG9lEgq4alZSaX6p95SAz3hY
         wv5c0046bZQXHumWaK2qLFuu9YlwglpXq5VYYKSyvvfj11lEsBbJB0XXM/LtW86BRw9J
         wGqE4SFkPaAA6+Wkr4Zv1VN3iyvR8r9wpjIVSxDdcXhyeaA9/SzEqB5G5GXNi9AJ459+
         vbzCYVPIYayYu5WstLPBayYQ43XAeLBIuFdJCUGvYciPzHuCGzN3D7Q5AcxjKodpItPn
         8dpFD1sV4QTJB32OV7KrN2bOjx4m+FME77vyckxxcdPmNCMGbzz6I0AvTHGQtxBr6zrC
         lv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684502959; x=1687094959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYnjMvr3c+U3gEgGMSSumyjYrLuRnotb/3F/SfKgnsc=;
        b=EThllvNqBWInjf1d4ICbwGpwPKJ7G4gshfiCZxtVEMWEUJLmKZp2Pmm8Nb+kOjcJYx
         A3yL9+sil/s/1vy+Bs4RY3m9pDNY4XVo06+9fNAeNhi3U5E7WTlLCXymJtgGybW0gcg2
         f52Y/bsMyI2j7CbGZ6xlS+t31VGRsOekK5ssh9q8rcXqV6bXMYkCbuFURQO60XDQ3tb+
         XNBxDBRi2AOSLkUNA7yWFVTmDtrXopapZ7BufDOVfAIOcyKTI73qBiZBn0riHEJzhEri
         fr1xNtow5PLTktm0wZuqecouCvURn6N1lt/I89Kph1mJuG/Uj0qDco5/229ChdtAJQKx
         nu3A==
X-Gm-Message-State: AC+VfDyF58KfMFb56ofw/wB4vG195VHSuxT6tbBFS+DSqL7dRB8bqzaQ
        HMBjx/mRsTRW/rgE5EX5YH9r1w==
X-Google-Smtp-Source: ACHHUZ5cDeYWVr8xvST8PoQMix+57x6ScJ9roYt9vi67c3Tn2bAI3anfXwI9ebXVIc59lYyN5fbqXA==
X-Received: by 2002:a2e:888c:0:b0:2af:1760:e48e with SMTP id k12-20020a2e888c000000b002af1760e48emr720157lji.39.1684502959499;
        Fri, 19 May 2023 06:29:19 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 06:29:19 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 19 May 2023 15:29:07 +0200
Subject: [PATCH v2 2/6] drm/msm/a6xx: Explain CP_PROTECT_CNTL writes in
 a6xx_set_cp_protect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v2-2-5b9daa2b2cf0@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=1118;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=aeaKOCz5rng2fUAGM03IzdiKTh6ymb1woS+RnpEksJ8=;
 b=AojotZIf3CpXJZMM9oyS1CcyqM0LpHMLBCu7/eIZPDvNXJwMkWZ1OAeVWc1n9mtAsxdc07emI
 ZIZAHobVZHLDjYoHqqKFAVyQIXDix5wXN5itsFsOLkXWGrHYgugQab/
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

We have the necessary information, so explain which bit does what.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9fb214f150dd..deed42675fe2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -771,9 +771,10 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	}
 
 	/*
-	 * Enable access protection to privileged registers, fault on an access
-	 * protect violation and select the last span to protect from the start
-	 * address all the way to the end of the register address space
+	 * BIT(0) - Enable access protection to privileged registers
+	 * BIT(1) - Enable fault on an access protect violation
+	 * BIT(3) - Select the last span to protect from the start
+	 * 	    address all the way to the end of the register address space
 	 */
 	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, BIT(0) | BIT(1) | BIT(3));
 

-- 
2.40.1

