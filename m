Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79564695669
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 03:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjBNCKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 21:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjBNCKG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 21:10:06 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480EA13DDB
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 18:10:04 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id d8so16827418ljq.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 18:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3krWooVaD7gxI/MuHJdJwJLEDhxVnEkT/xDyRE1I7q4=;
        b=GXJrXEqNRD1mVB/HSZOcdpX+RH6803clEiJVhlmWpeODDuRt5paX0sitpBcn9QRxaB
         BqwlEu+LCHuD8w2zEyLpbpaTSt50acsBW9rWOXIk7p+KgTZepLzLUJ+APqbgyZ/+Lqms
         FvlET0dgS24fIC8BU1xbv8rC9zFNIefN9IU//IKYcIKlPVO81E5t097UjGGtb4KTC/6l
         nmXO92fBNxi4NyGqYE2ZQXyBFKaaekXjVPWaYijTXxpwnEhoR4zPY/Oi218infdOOpcx
         Uep8iDffbXxvCNIJ79cJAHwkWRVYS/SldkLCunrSRwheIZ5AxehP3cfhZLVdzbbqMc7q
         uPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3krWooVaD7gxI/MuHJdJwJLEDhxVnEkT/xDyRE1I7q4=;
        b=3/nkL8nBv7nkJBNPsFhUkyRnOXUBsc6gvmtE1XKpYIOjZEtpKtUAJzsU3rJ7b6T/Uz
         OKM8i4IFFJb0PE3yVIWy6yEzZwLDNTmX8de7foScfTleBe6xsbpHD3vkEX5ehV0jKm1O
         eGojnwjWd45izOOT4xWYS1OjIgJgJYhEpcMrHhE1L8XGoiQ4dV7rCQd6P9Iodj7LC61w
         9zOPNi9j0ls5+3YaIrxRgSoAyYvFk781W+/Beh37M0+UR7VuOFQjff5yYI2bpVvhpdWq
         6XWqMqjXqtWaCZZRQlZNBla8fzD5FY3oKch7r1a++91BYRpKVfzS3t/W4yO7eRXkD3mO
         VUYg==
X-Gm-Message-State: AO0yUKWPI2HNngXVMjZd6Tmj71WvrGaMwFZWJDRz/EFd+/UPS0yRBIaO
        ozyvG2NRgcFE5xbw3Hpg8rj6Og==
X-Google-Smtp-Source: AK7set/INJUhsu9dINYFmoXc80j9iZnt4BbCJb6ebVarThokQgjPgR6cbE8l2ONMPwLmrHUW7Y2IHg==
X-Received: by 2002:a2e:9813:0:b0:28b:5621:7be with SMTP id a19-20020a2e9813000000b0028b562107bemr218378ljj.35.1676340602613;
        Mon, 13 Feb 2023 18:10:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 18:10:02 -0800 (PST)
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
Subject: [PATCH 4/4] drm/msm/a5xx: fix context faults during ring switch
Date:   Tue, 14 Feb 2023 05:09:56 +0300
Message-Id: <20230214020956.164473-5-dmitry.baryshkov@linaro.org>
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

The rptr_addr is set in the preempt_init_ring(), which is called from
a5xx_gpu_init(). It uses shadowptr() to set the address, however the
shadow_iova is not yet initialized at that time. Move the rptr_addr
setting to the a5xx_preempt_hw_init() which is called after setting the
shadow_iova, getting the correct value for the address.

Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")
Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 7e0affd60993..f58dd564d122 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -207,6 +207,7 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
 		a5xx_gpu->preempt[i]->wptr = 0;
 		a5xx_gpu->preempt[i]->rptr = 0;
 		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
+		a5xx_gpu->preempt[i]->rptr_addr = shadowptr(a5xx_gpu, gpu->rb[i]);
 	}
 
 	/* Write a 0 to signal that we aren't switching pagetables */
@@ -257,7 +258,6 @@ static int preempt_init_ring(struct a5xx_gpu *a5xx_gpu,
 	ptr->data = 0;
 	ptr->cntl = MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE;
 
-	ptr->rptr_addr = shadowptr(a5xx_gpu, ring);
 	ptr->counter = counters_iova;
 
 	return 0;
-- 
2.30.2

