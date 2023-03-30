Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF056D132A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 01:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjC3X0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 19:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbjC3XZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 19:25:45 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E1711E8D
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 16:25:38 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id q16so26642756lfe.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 16:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680218737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1qkEAaQNTO/CD5dWLHAfXm+a6T+9M+SqzmBcYhiN1U=;
        b=CCeeNvjDBGJBgtguU2LCva5SOHxRmjKNbrSLW+DIrcTTirGjkgnND/QAV+reebxVzx
         dhoirrKQbSD/jwdfub2xWCF9ICWALYsmwJpfT+O3ITzKdXxH7B5ukjKfYeivuLvdl4vH
         tQYgSy/4eysQhu5ORxdOIRuz/+WCFM1UQycow/Z2S+IYn25UIj8wo15UyOPOMVp40/47
         skknMOsCcU1Lh2nqDn7yx6qtaZRRDdzw+sZdUgICRARqOy92vyuTej6FTf4D2m1UAqjt
         +snu5SnM1xf4ogsyxCYXWc9TpKgkH61HhtBl7yKY957g7YLrgLA34aQGk8gonRN5vZK6
         e3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680218737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1qkEAaQNTO/CD5dWLHAfXm+a6T+9M+SqzmBcYhiN1U=;
        b=GhlrBNDYHx6r4uyCiQddg3zvruphDQuF80rWgHzgD0pHi/EVaEnJI+plorB2XgmjSY
         0HqT0iU41wCNo6JJld3GV36WwhOqESz85ZsVuQ8qvYczb0d5eqDl1ZV3L2uMnzbra4ZT
         S6smrwRIqrhFQfpoBQKPWGQbZvq+5djrQpVvFLC2BWnVJ18Tn9WdsfGZXERhVEEIbnRP
         2g+R3qtOfCS6/MfG/kujW89IadWo0ihf2TQwqWmW58Q0xleEY/gHDC8zG6/rKzhVj1Kq
         /n0IxvrvaTgU6CtWlNf/hz4E29tyxZ16WFQ3vJajDzm6ugId1b+RKQlqVjZ6MJysaaGt
         kR7g==
X-Gm-Message-State: AAQBX9eW/TyMrTqERM2x/32T7vgLVXeoSDNy1xqg6edOESvcW+LZnII9
        Rz949wdXaOEQQg8qauFSFTrB5A==
X-Google-Smtp-Source: AKy350YWEPjKZkDdVfYN1xjqQpjwI6x1EB3w1J5gFScHYlYsn1tfNe58bHr7TJo6zOTCC9+LAgkAGg==
X-Received: by 2002:ac2:5a03:0:b0:4e9:d53:a5ef with SMTP id q3-20020ac25a03000000b004e90d53a5efmr7058419lfn.1.1680218737770;
        Thu, 30 Mar 2023 16:25:37 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 16:25:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 31 Mar 2023 01:25:25 +0200
Subject: [PATCH v5 11/15] drm/msm/a6xx: Fix some A619 tunables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-11-bf774b9a902a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=1537;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=vSIgBLooy4SpPau69jLvwPl464u8HClYRgiP0Hf1QqY=;
 b=NJKrNhAXk0iryuQaH1Cq4X0A6u4XrEdf3rOBDV+BNa5JPIq8uIm8pH5yaiEBJnxqODbpjp+1c8VW
 MrRIbbAiCJSOCUgRmPBNMEBVZVf8eU999xXHzCUrK+K+GpjyJV7r
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

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7d14a9cfd410..1f553451ffa5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1186,6 +1186,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1203,7 +1205,9 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a610(adreno_gpu))
+	if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
+	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);

-- 
2.40.0

