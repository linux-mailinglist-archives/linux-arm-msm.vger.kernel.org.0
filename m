Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD6A9692D0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjBKCLm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjBKCLl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:41 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CC875357
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:40 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ml19so20366910ejb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXrZAAMcbS02VPRHpSg/5kqN0f51nQe0BfxjseY+MyU=;
        b=xOPVhIK4At5K2KcDfwmPHUW+vbHPihQk6RZhUjO/6rX5wKORB+EnoDrNyLoWnuCIwx
         loDlYZe+E50vDrbCDgYKEdTwXtFUBUS1K/Q+8lMVJbga/k329eb0Joyg3na3RgDyoOsF
         N6paWNmxD+EeLv2lRFMFEzBImwaUbohsNL5j+8sbu7x3fk+6BrIgYJQbgZCp5+62WfWM
         z1ugm2PKfzU0e/1LNCf+Gjtte/5ijYeTT75XwNW7CeRtTrN5GPOy2rXuXvHkIB81yk0v
         ydsJZle+9CzdAKN0qZDR0usswYk7d1WgZdiqGwz45SbotZoJ6G+QEE36V26HM+FqsSuD
         fxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXrZAAMcbS02VPRHpSg/5kqN0f51nQe0BfxjseY+MyU=;
        b=knUTqHDnziruRhphuYrFO19MJzXjR6jA/mLdP+x0RkgmmthacvNnm+rNBZPdcGXn0E
         gYACOWj3vHvkJM1+iP189/PRTWLNO36p539g5J2OjfhO0FBmRNUSNjJnd08ljskaUtLI
         Hjlp5NwEDKBwc50qI+Ja3Ev7w0BrplEw+XZsWxKVzQ1S7bsGsBfZB9hSVwH28jV1szKa
         tpaX20fnilJ+DzS5BSwb6qHUiGyiDxXd4Oj6kPS2Hd+PkIvsfvoN4m78nfUYjjX54QQA
         vaq43rfaGS5BbnzKL9I83xL0kFRaOjKHb2OtZwGgMDAZSv//7tCff8FDmywsCYrham4I
         /agA==
X-Gm-Message-State: AO0yUKWCyUMAh7UnhRQKwdKUIcc+N82E0noQMhKM/bqNz9P6CEOlRf9n
        kwz3+CEXPoIk+FhM9R8+zxeWezTA/dpu75TC
X-Google-Smtp-Source: AK7set/WWCG0Y19dBysdVZMG8J7kAJ3fT3s4OMXvHdfKLy502BLRGMbQhEoWIcN1F4+XTrcfWuul+Q==
X-Received: by 2002:a17:907:208c:b0:878:8249:bef6 with SMTP id pv12-20020a170907208c00b008788249bef6mr15641953ejb.59.1676081500334;
        Fri, 10 Feb 2023 18:11:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 43/43] drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version
Date:   Sat, 11 Feb 2023 04:10:53 +0200
Message-Id: <20230211021053.1078648-44-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

To ease review and reuse rename MERGE_3D feature masks to contain base
DPU version since which this mask is used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 45f9be9665ae..f377598c75ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -70,7 +70,7 @@
 #define CTL_DPU_9_MASK \
 	(CTL_DPU_7_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define MERGE_3D_SM8150_MASK (0)
+#define MERGE_3D_DPU_5_MASK (0)
 
 #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
 
@@ -507,7 +507,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x100, \
-	.features = MERGE_3D_SM8150_MASK, \
+	.features = MERGE_3D_DPU_5_MASK, \
 	.sblk = NULL \
 	}
 
-- 
2.39.1

