Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E701B6F2AA7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Apr 2023 22:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjD3UgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 16:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjD3UgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 16:36:01 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8E9D2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:36:00 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2a8ba23a2abso17661301fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682886959; x=1685478959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J+iFxf1ulALPVvSRXTgTvfbQT2He6CPNoNs7jBvyPc=;
        b=VBBHhsEGzJGwH7b+7+6WwqX45vTlQIaZmZKB8iwGFrpnihADVMv9NV95MaqONthA+V
         Kvzak/8iFyJzNrWbeppaFfaJRRH/Fl3CIcN8W/ZWkIW7L1gAGHQlIeL2ngLpVBAcykU6
         XRq6XqqPQ675r+OS1+hn4CCTR1EBg1qPIvRRdNo97q6F91BOychzA68Ysc+bRQ0vs154
         Tw15JB4jcO1MCw+MqgTtsEU+wA1bBQ38r679ebDfG0+p1koAn5q47Xc8wH3Laeq93Dqf
         VXaNiVwhL7rI6wlfzsPfZeDYRE8yu3W9wBlrI8VXcjk2zKoLFMIWfbQoZjZxiBwUaZB4
         ldhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682886959; x=1685478959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5J+iFxf1ulALPVvSRXTgTvfbQT2He6CPNoNs7jBvyPc=;
        b=kDrOwfcDJBa1JJKbiu/Ws3kCb2RkPDM+Ecw2SGFULwMRTAgYpfeZkkzgwvTYnD9XmU
         C9/oEY5L2hs8pkie3Sym8ihc9m8ATl4f5JAqeXCdUk61oXKTFSgYDysAZrUQWBXpulo7
         tGvmeNm/LX/lHt9Dx0ZB+K3GDQF2Qd4Sp2E7oYzfEWwtC/3lT35WCON1FSMkATgNsTwc
         09w/ZlA6SWpMbkdQXqWO3Hcpe59E9e5ro2Ogg7SaOgIyW2R1gun38lTzciBpyAF5Pd1/
         iSErYuM8XuEJeG1e19VisB7NWJOfS7uqITs7IcoXZ9ik5wPryllPZtOpfZzWh4PjZfUu
         +c8A==
X-Gm-Message-State: AC+VfDxR6rUmxzL2JMtpdlY1NO7suIazzrISMsL2WjEf3a0qEYDmUfe4
        L04uO6cV6sCYPyFMxzvU1w1wRg==
X-Google-Smtp-Source: ACHHUZ6hAAXso5vr870a9YPhqsjmLnZ4zsuXWtqlIk3M9l9AMNkHKknxJGOg9J9duRdBLxw2von2Tw==
X-Received: by 2002:a2e:8608:0:b0:2a9:f9d2:7b44 with SMTP id a8-20020a2e8608000000b002a9f9d27b44mr3183297lji.40.1682886958885;
        Sun, 30 Apr 2023 13:35:58 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b24-20020ac247f8000000b004edd4d1e55dsm4324634lfp.284.2023.04.30.13.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 13:35:58 -0700 (PDT)
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
Subject: [PATCH 1/4] drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR during DSC init
Date:   Sun, 30 Apr 2023 23:35:53 +0300
Message-Id: <20230430203556.3184252-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
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

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover dpu_hw_dsc_init() can not return NULL.
Replace all dpu_rm_init()'s IS_ERR_OR_NULL() calls with IS_ERR().

This follows the commit 740828c73a36 ("drm/msm/dpu: fix error handling
in dpu_rm_init"), which removed IS_ERR_OR_NULL() from RM init code, but
then the commit f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in
RM") added it back for DSC init.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
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

