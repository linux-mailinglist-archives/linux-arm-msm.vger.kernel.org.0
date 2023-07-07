Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 374B574B7F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 22:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjGGUhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 16:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbjGGUhc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 16:37:32 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792FC1994
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 13:37:31 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso3829431e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688762249; x=1691354249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1naQ/0oURgoeOGRk7cLDdAN24Fuu5yXRK3xPVkECZM=;
        b=bor53ey1Qq6hehFlehHsmeg6s8UZ9ewhwXjniQlerjiaj9xrbfRygghG+pPTPzcw9a
         GYVT1WUT9z/rW1bOl58dtGGwCbr3zH4qvn1WJ30Ru4QsdW4/k+1swtxukM79M721M+ZV
         gUBylvl+2IbHYStxmQi5LFqh0bMyz+rppqx1oGFQIEzpo4X4eBs71vyQJSbfy9JmRQMa
         OSgUyxx/ODU8qKzMB4kr8tnvjgsGxvr8BIUDkmNkqujx6iEa5obzRnT1gforGwNeogNo
         fNTSlY9ppSRClamfZsnqzNeinWAbugZcr3k8whDrd/wJIDbQGbMFYYIQmP7kBUSY79cw
         ZsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688762249; x=1691354249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1naQ/0oURgoeOGRk7cLDdAN24Fuu5yXRK3xPVkECZM=;
        b=T9gH9eP5A6JZ0OvHGrfTXEruy8J9CXeWxMhGPr5Mav1VN0EPBhe1uDtZZRXh3a7hMn
         LlEf+Jd2rxOW1GiXnsphg9VsRsiFl6WCvKCSjG5veokU2Rvug5xNUf2O8Ijzj21HqCWK
         3/YE/LP7tzBhGtBcMnP1iyNdntd1fRVSidWm0KVWVUewE4cUxgh+g53o1jllDUQMOtBx
         aGEPobh+tmtsE7B4Uj/YR0JYA9wIaq6/iMECX0sJEaQsQtrctgg7dNEo6Fl/AWDrbjJb
         aHpN3rPaExcyUWkagEdCZBBjhJDyABNJWGqfKGo+51hL7FW+jw7Z1aUBbNHpYLe36UWV
         BHBQ==
X-Gm-Message-State: ABy/qLY9Vb4rmD/vJTROLEjqVQX+G2woCIq+FK45zpZVEW47Ldkopn5M
        95n5MjJ4E4Rt9ifu2+9Zziw83Q==
X-Google-Smtp-Source: APBJJlE2zbFV9KSEWEHk8NmE0qjtl13bZ/HT+jyGorcoIr0OMjfa2j6WjwwBqsYxx+mARa8PMeb5Jw==
X-Received: by 2002:a05:6512:2ed:b0:4f8:6dbf:401d with SMTP id m13-20020a05651202ed00b004f86dbf401dmr4443939lfq.57.1688762249808;
        Fri, 07 Jul 2023 13:37:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 13:37:29 -0700 (PDT)
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
Subject: [PATCH 07/13] drm/msm/dpu: drop unused dpu_plane::lock
Date:   Fri,  7 Jul 2023 23:37:18 +0300
Message-Id: <20230707203724.3820757-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
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

The field dpu_plane::lock was never used for protecting any kind of
data. Drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..aba5185e1d66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -78,8 +78,6 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 struct dpu_plane {
 	struct drm_plane base;
 
-	struct mutex lock;
-
 	enum dpu_sspp pipe;
 
 	uint32_t color_fill;
@@ -1186,8 +1184,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		if (pstate->r_pipe.sspp)
 			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
 
-		mutex_destroy(&pdpu->lock);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
@@ -1447,8 +1443,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* success! finalize initialization */
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
-	mutex_init(&pdpu->lock);
-
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
 	return plane;
-- 
2.39.2

