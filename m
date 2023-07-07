Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1240F74B9D3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 01:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbjGGXM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 19:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjGGXM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 19:12:56 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90422125
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 16:12:55 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso4010997e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 16:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688771574; x=1691363574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
        b=XiMwUFfq30HoJbhHr/Z5GPk/g1zMJkd4Quu+RHa898+wMhhtx+G/WxN3v95APi79+Z
         ZumxTU01HHXRXCkAH/yB41gRpYP59wqVVIutQTpOKgYWXmHR7ePCyFc4O4cn5JTmu8dM
         BfhRkM/qCviueDuR5vy+9a5zsWAAtC6+8RytTsrIfoXpRj0Gvpz35YGnlWPj4FtKrdMj
         BZIDLdDCRUXNTyPhRMERX4ZSRNooe2XKyVZUtdrjtUqTPDoRA4IOim5ZSKmeFYG7XZvC
         Qf+A/j9ERXkzzAwwDCZNGQ2LKcwQ85DFx0mOQ492nd2KgBx6OP1TS5qK/eMhgAmvwbfj
         TOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688771574; x=1691363574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
        b=iyHuf52aT84RNi2G18GpQpdJgKpPnORnnmiNodbed7E8sb57aPAe32SK8zxB4Hqbja
         GzEq2Ic4jOYl5LwqqMI6/+QmlWYs+P5xDkMb7DTlf9EP7iLmJKZsDag44hlh7A4XcEYP
         WgUG3Rrrx8Bi5BOwd120jFO2+HI5r5r7FTFqu/ei4TQMeItNaZTQxO4K4pr1pnJjHQVc
         8QycrjrJk5gdypeWh4W796c/QGT0ieFYe5HY8v7xefm0UT6BoX+mqFhhns13OtH4U2am
         vM2I8jUh612WFIQ5Uh6TQLS/VdmaHtIe5DYp+U4qLDWlBab2nI+B8w6U0DPRHzyN68DO
         FHXQ==
X-Gm-Message-State: ABy/qLb74efk+/76LwrCSxCk+wgzOXcJ6avnoUb36HbXI5tx1/JcZ8Xe
        9NRB+dUYODMo/D4I3J19WqpcOw==
X-Google-Smtp-Source: APBJJlF0xS8Rk1omO0MKWW2tlGH3W0mgE1ZQ4QQzVULEV9tGu1Tea1XDjP5UYdKExs0/FH82Au1Vmw==
X-Received: by 2002:a05:6512:e9c:b0:4f8:7325:bcd4 with SMTP id bi28-20020a0565120e9c00b004f87325bcd4mr5850869lfb.0.1688771574202;
        Fri, 07 Jul 2023 16:12:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 16:12:53 -0700 (PDT)
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
Subject: [PATCH v2 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error handling
Date:   Sat,  8 Jul 2023 02:12:40 +0300
Message-Id: <20230707231251.3849701-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
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

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
dpu_hw_intr_init() error check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e7ac02e92f42..85b8c9cc99ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1096,7 +1096,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
-	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
+	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-- 
2.39.2

