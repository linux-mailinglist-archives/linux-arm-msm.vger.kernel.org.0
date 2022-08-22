Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 858E159C4EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 19:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237081AbiHVRWJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 13:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236878AbiHVRWI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 13:22:08 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573A431DF4
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 10:22:07 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id l23so219255lji.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 10:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=gV99h850BV8Dr0PlTOQumJqcQf34/H3P1jjF5nBzAOA=;
        b=q1fnZE6pADu+MYiFWXjkuSN6QqzfRQqpOZfPheVPHjtSS7CIsK0cSwBkJMcjXbsW2c
         jtgAzAXxhNI/xyQYHy8shBhCzUW5o4MRHuAC7Kql9r2CtCdjkCz6fZjUqcBeoPnzONOJ
         JoRt6caVpUgRk2Lr59OGAG3Y5fHoKDibOE/4oTkzYQpcDRFziWOqMg6c+752RWOVu54H
         PYpsQuDFTbpNPvitX3ATDlKZ1JrjSPeKpm0FSNUGzBNDJNCfmEKUupC06Div8OxxYw/G
         rNyMyUki0pc4kDIY9tHzhCPasbBGZ+PVdCxNn4FrAcqNBhMeEIZKH0hDH3erom6k8zdh
         rrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=gV99h850BV8Dr0PlTOQumJqcQf34/H3P1jjF5nBzAOA=;
        b=uVCndwu/iVE95QYUzygAfoBlDosAFep9hv1Ne4m33VBAC8iOLMtsaTE21JALc1jEk+
         kc0ccrEf311PQxFqKyHKY24zIbZWtTPgod3mcg9VcxFNE0WV6Xkb0MVen13E0qbSxH0C
         U8rmVsekA2lw/Y3k88xongVBYxkL2cMoEIuHGCiRFQwhyvG2vrSFkJ//0TCsEL2OO+xf
         m1pNA4B9I9kQUiTRXCgjHDnEOSTKx/ABLpIWMeChh2BFO6CT4avwaUcvL3HFPUqVhTHX
         R2wdtl9AQd4Jel4We54MkQ0iPjSnzpYDz8N6+7NaFpt0Dar+tcPTB+XkpCwoyBwke7UJ
         kwwQ==
X-Gm-Message-State: ACgBeo2xD4qgLJjJdy3KD2QzyYOxKG980xdVMEDQkvR9zP8nsBguYwYA
        o04TFRIZ1cVwFsBrkCBJEW6PYQ==
X-Google-Smtp-Source: AA6agR76jtgZmVZm3TxRE8LqNNbVi7Ko7rJwmyuGxiGmlsfJr9ylxwz74DoU1WAA2XMDLTXIPrSGkw==
X-Received: by 2002:a2e:a307:0:b0:261:ce0c:365f with SMTP id l7-20020a2ea307000000b00261ce0c365fmr1654327lje.288.1661188925728;
        Mon, 22 Aug 2022 10:22:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y16-20020a2e5450000000b00261cbe3bd83sm680794ljd.85.2022.08.22.10.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 10:22:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: drop unused variable from dpu_kms_mdp_snapshot()
Date:   Mon, 22 Aug 2022 20:22:04 +0300
Message-Id: <20220822172204.281045-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Follow up the merge of address fields and drop the variable that became
unused after the commit 9403f9a42c88 ("drm/msm/dpu: merge base_off with
blk_off in struct dpu_hw_blk_reg_map").

Fixes: 9403f9a42c88 ("drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 008e1420e6e5..1e1f45409aba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -902,12 +902,10 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 	int i;
 	struct dpu_kms *dpu_kms;
 	const struct dpu_mdss_cfg *cat;
-	struct dpu_hw_mdp *top;
 
 	dpu_kms = to_dpu_kms(kms);
 
 	cat = dpu_kms->catalog;
-	top = dpu_kms->hw_mdp;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
-- 
2.35.1

