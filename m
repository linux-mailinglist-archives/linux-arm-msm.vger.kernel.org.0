Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99C06671080
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjARCC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjARCCo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:02:44 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DFE5357C
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:02:02 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id v6so36804958ejg.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4A8XjFSBiG9DDmb505MwykT6kj7KkKgJJSYX4RpM/tM=;
        b=eg9CmIMczOQdupZM7Ru+4O0qKgNWuQW69nOHojrGKjTEfDZAkXXHcvs7rS+ghNPYaV
         1LK4nfQ5nTAoeJS+dohA6NSxtdi2gvoqtGlQT7iyawkHzuj9lCG4KR9sDltOzJn6qiTG
         aUpxYaqY13xay1ykAg16GQTIvVrRJmwa0sWJaJSa0nAXtQNbfY8F2NDvQZ5OSoT6uZM4
         x1+p3tDKNAvE613sD/Dc5T3kjk8SObbzWdITuD9yg/6ULkhjDSC0H0EdVEJdXE5dIkvz
         Y4h3XaUcOA0Adz8a6/dSED5y4PPJb2texjAdq9MdS1aLRT+o2U2btVcGdEavVBzEvaMz
         HkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4A8XjFSBiG9DDmb505MwykT6kj7KkKgJJSYX4RpM/tM=;
        b=tt889i9r15rTe8PIs+aBJWkx+XgMXKxa41/pKv1xbLLhnKkiwSWgfxLMcAF0Qo6xa0
         9ZymlM8E5rJXwgK8cBCzM6i8NxI8phZormHRzwvbALyZEMsje1qawapyvlHs8QlEtkQW
         nbQJWIQKKOIKU8YxA8zTRr2t7IQiL/LRqTSi+9SJoTHRV6s5co7tpY2Ri0622Tp/gIpg
         6uYwJYXI0bnCHDLT40c7bxm1QQ5st+Yi6wl9XCYx1mcOrnEgbSGlIXC1q5/mq4xOQJSi
         fMUwMqgVsWyX40v9UJ9/kfJ5+lczVPxvPOVkttup8FIQ4X2/f7B4TvtH7Hg0fScZ8xoT
         9lKw==
X-Gm-Message-State: AFqh2kpLEzw78XwRGba+zuC/JdlFWV6vEDXcDUNKwLRXVtqYK/hPhaaF
        SXzDoLCeOy91V2PPioKE6weA1Q==
X-Google-Smtp-Source: AMrXdXsZqDlcOR0AjGNu6PjyGUcISQgMCSD1WWbyH8r9Q8hBYto1Vh5HRGp/AWSFWYV1w4tfmXylJQ==
X-Received: by 2002:a17:907:c494:b0:871:b9c3:2fcd with SMTP id tp20-20020a170907c49400b00871b9c32fcdmr4689374ejc.26.1674007313997;
        Tue, 17 Jan 2023 18:01:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id um41-20020a170907cb2900b0086c4fbb8507sm5290563ejc.225.2023.01.17.18.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:01:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: use strscpy instead of strncpy
Date:   Wed, 18 Jan 2023 04:01:52 +0200
Message-Id: <20230118020152.1689213-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using strncpy can result in non-NULL-terminated destination string. Use
strscpy instead. This fixes following warning:

drivers/gpu/drm/msm/msm_fence.c: In function ‘msm_fence_context_alloc’:
drivers/gpu/drm/msm/msm_fence.c:25:9: warning: ‘strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
   25 |         strncpy(fctx->name, name, sizeof(fctx->name));
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: f97decac5f4c ("drm/msm: Support multiple ringbuffers")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index a47e5837c528..56641408ea74 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -22,7 +22,7 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
 		return ERR_PTR(-ENOMEM);
 
 	fctx->dev = dev;
-	strncpy(fctx->name, name, sizeof(fctx->name));
+	strscpy(fctx->name, name, sizeof(fctx->name));
 	fctx->context = dma_fence_context_alloc(1);
 	fctx->index = index++;
 	fctx->fenceptr = fenceptr;
-- 
2.39.0

