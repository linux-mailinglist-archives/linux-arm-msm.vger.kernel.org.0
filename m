Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88769706E9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 18:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjEQQua (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 12:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjEQQuS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 12:50:18 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8425740F7
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 09:50:17 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ac87e7806aso9744721fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684342216; x=1686934216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYnjMvr3c+U3gEgGMSSumyjYrLuRnotb/3F/SfKgnsc=;
        b=H3+H6CK9OlvzfGPyRfjrVtlkNebZoZL80kYdFo90TWG3Kza3b1d9b0thw7XjQDCR5/
         QkvT8L0j0o8qGLCDCGQydU8iLbrdgtBDsW/ZpYiw2JhmMT0g1laPA8k4AE8MPwwq9SUk
         RFBJBgrSlZyEVJZGtGhHlAHp7V4GjGM1CocFggbadNioiBCmT/lIrG3io2TYa6jaTHtf
         W7jlVRcCHeAfglEIhiR2G3LWrbrCCdPGgcNeuPdR0RxlTU803i06zS97/SN/P6dXHOIk
         ppAkxOddvRR+SZINU9HvalMy8Z4cJi2uMAe6i9RPVuZaTf1TBz0wwKx0lDggHVYH41EP
         NpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684342216; x=1686934216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYnjMvr3c+U3gEgGMSSumyjYrLuRnotb/3F/SfKgnsc=;
        b=jYs+jj4DTnDpp8VJVre8mqMrvwYz3MZGy02qNqcZHC0xOD6kOOOsngKok/VX+uOxmb
         BCTLWVZz50UEItwJ+fHznzEtDOaiVoaSPz4ItdX+zQ/FRilerx8Dfr9UOQSMhdmMLCUz
         VVmFC1fOa9j+iIyZVbqlCR0x5VmdgRpCLV2ANYW/Z17kS9e9L7BaXeQAgVrTCsadY5OX
         hqo5JKmtfLg3U9LNx61V/LHBhg9qt0KLgQ4dJ8F4pccLM7lsn9SKApiSMhBlllXEgyqD
         HpObni6ZxhUz2kEmvAaV5yMmj5IG5gvc8urUOmCDyYHm/txvKHUjxDkHxjFWlou61OR/
         kmcw==
X-Gm-Message-State: AC+VfDxuBOqgqGCeefAo+Xi6ggndRH0VDJIx2Hsdk7hRapOg47ciufmm
        rbM1nY1xUK/rOiBpXMWWysFaoA==
X-Google-Smtp-Source: ACHHUZ4ZBHxs0qZdACjv7XhqFKvDKZRmJWH5/RJd5SJTyuDnOfv+PHn0AlDitJ+0f/L2xUrKaDZNng==
X-Received: by 2002:a2e:3211:0:b0:2a8:ba15:eb6f with SMTP id y17-20020a2e3211000000b002a8ba15eb6fmr9431605ljy.6.1684342215787;
        Wed, 17 May 2023 09:50:15 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id g6-20020a2e9cc6000000b002af0e9abaf6sm159224ljj.131.2023.05.17.09.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 09:50:15 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 18:50:08 +0200
Subject: [PATCH 1/6] drm/msm/a6xx: Explain CP_PROTECT_CNTL writes in
 a6xx_set_cp_protect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v1-1-7a964f2e99c2@linaro.org>
References: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684342212; l=1118;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=aeaKOCz5rng2fUAGM03IzdiKTh6ymb1woS+RnpEksJ8=;
 b=kDW/wsHgJ4Xp1eVrDnOZAzxAODW5ws6Zqm/96IDWguKJ8oITdolvZOvBjyGjQEJPILzMHfobA
 T5r2ncZOohjCdxOLtmFco0HTV27E/+hyiab/rQ4ovzpEwkkpSRj6m5y
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

