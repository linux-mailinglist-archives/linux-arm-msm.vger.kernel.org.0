Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5694571F09C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbjFARWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbjFARWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:22:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A8F194
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 10:22:45 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f4e71a09a7so1534342e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 10:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685640163; x=1688232163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkfkkMQsnWekjypmxP4UOTMCC2666Saot7vRYpuPkHA=;
        b=qKBD1uBlHBrg152bXFa2y96HKZlKyB6ok2ZqZBiK3QFkcjQOybRuUFUUdPJPYLN0lU
         TXJjE0qzIfax24XNu9Ti4fZIMr9xoSrBNjn8gaU7RpFLGXxpDAFByc3KS8Bc9+AnG7e6
         R4Tt3EbtFST7KevwIx5broJW56wIlqPenYmSwwQk3NC8aREJEIia5aFIGtPExyskVinN
         cpbdK78A+h4e4z/BvVjo+XJUrmkboIDi59TYCwQatVFyMj/IE0qYB8VmhHUFYUSh1ccF
         tqm0RcCGA1+DAtMlXYytyihnvf07NaSrO07krO5lOg27oAxmg55ru1ZeRMZUkWBurjXy
         UOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685640163; x=1688232163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkfkkMQsnWekjypmxP4UOTMCC2666Saot7vRYpuPkHA=;
        b=MVMJnDG7CeTilNwPIcRcQpxEedmh9Twdt2n2g/qVYidR7QEMP2ppgidX67CariXT9O
         dpI6xMEUF1eiQrD5XHiFR6tsUDOeB0FkYo+6yQnj/YpEqqBwLXnicIlE4pxGh/SNrc9a
         1C+QbWwiDTveKj+DSqpZpSh7NGCHlSOMPTbVa/nqHfRQvtssq8BBFVVST3tFdp5sll/g
         E+4SI1UNIa4Vk066gYBLNbFg85dJ85niNdn7eunLzLMBGeR4p9bVmMal0YIv2Q93nb0m
         y2uWTy3hDPM5KOSRW/Z3NVpkBPPryXXPJUxwbqQf2oP1GmhETLLzfwHTbhZXqitibyz3
         Jlkw==
X-Gm-Message-State: AC+VfDySAjCsAQkNDmuebgSnY12vJCfQKCQspO3zHotCVkXqYc5Xkt8x
        lxOS6XEbmdvtaxeK21ilz9TcNQ==
X-Google-Smtp-Source: ACHHUZ48XWBepFXIgXzn1n1G39z8od/+7CLxFMi/b/VPOUBfxuXYahLy5f65sOYXc1F6rD7LsBbp9Q==
X-Received: by 2002:ac2:5325:0:b0:4ee:fdd8:a536 with SMTP id f5-20020ac25325000000b004eefdd8a536mr136347lfh.8.1685640163559;
        Thu, 01 Jun 2023 10:22:43 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b25-20020ac25e99000000b004eb2f35045bsm1145739lfq.269.2023.06.01.10.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 10:22:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
Date:   Thu,  1 Jun 2023 20:22:36 +0300
Message-Id: <20230601172236.564445-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
References: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no need to assign a result to temp varable just to return it
after a goto. Drop the temporary variable and goto and return the result
directly.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 17575591a4eb..edcac512fe68 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -693,21 +693,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_wb *wb_enc = NULL;
-	int ret = 0;
 
 	DPU_DEBUG("\n");
 
 	if (!p || !p->parent) {
 		DPU_ERROR("invalid params\n");
-		ret = -EINVAL;
-		goto fail_alloc;
+		return ERR_PTR(-EINVAL);
 	}
 
 	wb_enc = kzalloc(sizeof(*wb_enc), GFP_KERNEL);
 	if (!wb_enc) {
 		DPU_ERROR("failed to allocate wb phys_enc enc\n");
-		ret = -ENOMEM;
-		goto fail_alloc;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	phys_enc = &wb_enc->base;
@@ -724,7 +721,4 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n", phys_enc->hw_wb->idx);
 
 	return phys_enc;
-
-fail_alloc:
-	return ERR_PTR(ret);
 }
-- 
2.39.2

