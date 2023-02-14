Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7360A695666
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 03:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjBNCKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 21:10:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjBNCKC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 21:10:02 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122541BAFA
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 18:10:00 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id x40so21506389lfu.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 18:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac3xQ5ZUoVSKxTI11AHh9uZyaZAnwe6vnehDNppWK68=;
        b=trrt6/rzH5bHCCxtVqo0krY9ns1kGhbfaJh9zTU677RQ5y1eGUkCSE2QbdQWQj6FyE
         atxz4ErFcYGGXmWkdzf9fe7Xvc51BA+sQTv/ArTafUfpRYcMJWUEjX1BKvjSdy29xAnN
         pfBwX7vzKSzLnnPIeQkQ3vyYAJUWHTwsMcIOkLUSA+sRj7IqVG+jAgvPRYmDUTpNY9AG
         7CsD70KHC2OuPa2pAGwBmSNQJOwdvAepGjJ2jGs9Cj1AXpq6ayZ6T4MfFYnGRYW/fEi7
         sBK1/2SjhGLo1XRyMz0TnBn/YYekI4M4WqDxtg3ph+7LCm+bLBSpRnYH12BPnfMI/f6Q
         hNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ac3xQ5ZUoVSKxTI11AHh9uZyaZAnwe6vnehDNppWK68=;
        b=jBJEu/NRPVboPjFkhWFhIi/JnLKLktIq/dt+DuLO1d95cCEsRtbdfafUEr+OzEHC5L
         fZAMhBGCM38pPpwwbP1ck81cSK7/mhhUHZy39Girhro2poREy9yxYeCDY5IZAfdQiTcc
         rCQtPsOTGBjfyqgIaD5ahbA4wOG8PY2akyOIGqR5rdasHwWDfMJBb1l8NmDEt3AjUAQB
         Lj+xmuSpxW4H6aaY55mKmFLjfTqlfwkL0+b0VE0nglqJbZeQ0VMktqs2Ssl6Nq7etawF
         ZnJwlYKQ99wTtZDjtRH6TAqDry4d8x04bT1yhL7l1Jayu1sgpoIBl5eJBW8NBeBYgCmb
         SWHw==
X-Gm-Message-State: AO0yUKWrgQ6jZFQihc7iCtTePiiBKmL6alYzd0GQWK8rdL+dXEeJ4km4
        7DzCX54sQTQi5DNBV0vv3G7TcHqZay9h2vWc
X-Google-Smtp-Source: AK7set959ogo8tDxOu4t+CSiHvfxWQJKZfjF2fsph3mmtEVLZirFn08L0gODw8a6jK2UBm8OogMFFw==
X-Received: by 2002:ac2:5df2:0:b0:4d8:584c:a6e0 with SMTP id z18-20020ac25df2000000b004d8584ca6e0mr138279lfq.14.1676340599157;
        Mon, 13 Feb 2023 18:09:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 18:09:58 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Jami Kettunen <jami.kettunen@protonmail.com>
Subject: [PATCH 1/4] drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
Date:   Tue, 14 Feb 2023 05:09:53 +0300
Message-Id: <20230214020956.164473-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than writing CP_PREEMPT_ENABLE_GLOBAL twice, follow the vendor
kernel and set CP_PREEMPT_ENABLE_LOCAL register instead. a5xx_submit()
will override it during submission, but let's get the sequence correct.

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 660ba0db8900..8b2df12d8681 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -151,8 +151,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, 1);
 
 	/* Enable local preemption for finegrain preemption */
-	OUT_PKT7(ring, CP_PREEMPT_ENABLE_GLOBAL, 1);
-	OUT_RING(ring, 0x02);
+	OUT_PKT7(ring, CP_PREEMPT_ENABLE_LOCAL, 1);
+	OUT_RING(ring, 0x1);
 
 	/* Allow CP_CONTEXT_SWITCH_YIELD packets in the IB2 */
 	OUT_PKT7(ring, CP_YIELD_ENABLE, 1);
-- 
2.30.2

