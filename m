Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01D7870A372
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 01:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjESXkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 19:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjESXkb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 19:40:31 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629791B7
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 16:40:29 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2af29e51722so7586841fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 16:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684539627; x=1687131627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrEeUaHJg5tvfQUV7ZJ9RQA7N6g3X5zbRUUxxD+s4dk=;
        b=MjtkRZ9J3FObJ6JfJN2xUsZIb3PkGWM5H1aslAWC1fVy9uMWu1euDQZ9uhtn454oAQ
         JnpAv5U2fL1+sXKU7vy61NICQmZTUNzZBfVqJW5Gw4ZZSW48uu1JxS/hB2JF/vN1o9RJ
         jMtBQWY3ct9CxNBcBhZPCBPSuwP3GLZRTJTTP/b5owfWhvhmELTPG1Xj1BnAiNwH3AVG
         pMdfpU0N8ngAz5ysvNe6AWAA0JbRM5jvIo+FcnmhiOV8kNF82xxGpW4vl+14IYVG+Ue/
         +H36Q+OBNoAuF9psEg52d7bLMwYsZr4AX8emSQGcl1cgAFEdaiDypHOjD90XfGKcqqQF
         Htew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684539627; x=1687131627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrEeUaHJg5tvfQUV7ZJ9RQA7N6g3X5zbRUUxxD+s4dk=;
        b=dg23Tyf0D3pFs0yIlJEGoGBRjBpFVF2GZap03zA6DY8LlDG+8nJFATpmDxAARk7T9j
         arYWiLR7zhFIqEcMMGz8nL3zEDuzoftQ+JUdW2SHjL3c2ohwZjpsFkWI0OaMhSRDG3tg
         uIenKGzxVxK7w99nio1y1z3lgTWnuVX93XGHysUvY0o4Yu+mOg2a3FsL7lnBl918dSNr
         ukjX5RL/ofkSlOsTNXom6jS71zO96H8wIoIAuDn8xx+S4vYuqkCbXE4IbGGN7pSmtgXg
         CXT9dCobX0OwKJGTCAJEABXuk/JVFd5UyPrNpTBG5xLy5Ob135WDrz71FGeS3oLyKGs7
         6uzw==
X-Gm-Message-State: AC+VfDxBsPpFH/PvgxAIfuswTDghF80IPVvaJpH46isBKgbIN6uce/uQ
        eL1JFz0vNCTi4tBNl9N0HysgEA==
X-Google-Smtp-Source: ACHHUZ6NWHUNRWcW5fT7TncahCjkztt2MYDM6c1eeSusriHH2dOVOCIK5d95Qz2Jt2aJ8jHVa00okg==
X-Received: by 2002:a2e:91d4:0:b0:2ac:7137:5f13 with SMTP id u20-20020a2e91d4000000b002ac71375f13mr1298139ljg.9.1684539627729;
        Fri, 19 May 2023 16:40:27 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l7-20020a2e3e07000000b002af25598f07sm43454lja.78.2023.05.19.16.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 16:40:27 -0700 (PDT)
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
Subject: [PATCH v2 1/4] drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR during DSC init
Date:   Sat, 20 May 2023 02:40:22 +0300
Message-Id: <20230519234025.2864377-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
References: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
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
return code. Moreover dpu_hw_dsc_init() can not return NULL.
Replace the IS_ERR_OR_NULL() call with IS_ERR().

This follows the commit 740828c73a36 ("drm/msm/dpu: fix error handling
in dpu_rm_init"), which removed IS_ERR_OR_NULL() from RM init code, but
then the commit f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in
RM") added it for DSC init.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f0fc70422e56..dffd3dd0a877 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -247,7 +247,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
 		hw = dpu_hw_dsc_init(dsc, mmio);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed dsc object creation: err %d\n", rc);
 			goto fail;
-- 
2.39.2

