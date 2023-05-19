Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0DB708DE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 04:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjESCjG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 22:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjESCjF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 22:39:05 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09ECE6B
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:39:03 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2acb6571922so28975461fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684463942; x=1687055942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPNIghn0XJ0SWng+xegh98pXn9OmFxCxXfcggZ3NhzM=;
        b=jqUgEDdUvBcFOs9vGVrg03sl8GtF2kSA8wpm10ccG9YYnxyTrpQBo/xCvtqa2BfkM8
         eDYaX2Jju9nSGmRrrTpadplPcQNLETSoLOBq9cg+aFIsaOnnZSgo7dlhUR28mM3mmjYq
         4n6Ld2B02aGJcahT8Dfn7fzgwfYiqqKDIeC0UnhtOeVPjeHzYSckT9I+3wcDfRyQw3Vq
         xDkQ0tOjxHVlxL8HSxhPhAgcQEHlzjlNbAVFFXQx/jqrNrVCvY0KhenZ1N8HREzEjwT0
         YrooHGHKbRI8Z5fNi1yCK9HhBg6nDNKsZ7RQIErxALRyd/ewPFdE6/m2sg33LVjArfDI
         DvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684463942; x=1687055942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPNIghn0XJ0SWng+xegh98pXn9OmFxCxXfcggZ3NhzM=;
        b=HiJGO9wyim6ptrXwIseVEZ1QUUAXr+1ldxuTVs50Az2+lfO6pqNgEaOBx4cEUczGhC
         5zGYWtCMjBSfVKJjG7rLDoxuaNkIgHSsVcmu6oCRHx+Bw36Dw7nQz8v/akxbARMi0Kid
         o2IjPe+dcRzJMc0AThmqZk174x+p7wsBf/6we31FGT8AbPYfnFkXar47duK3+PEilgFN
         djFJkx0ZQ/i/iUpt4R3NWWWoTszd86Cy2lVAoojWZySp5OnDGBoF71who7nkSejBwyVT
         Dbys5RvwqdLV0Dqig4ejss9qgu0p7jfxS4bVo7kutbL3vyn7Ag8zg1ZuosfgxUCTFclX
         iKBg==
X-Gm-Message-State: AC+VfDxOcC0qIBpNag0K0v7NIsKR08Hr0+o5jnc0p+5TihC/Z8bTIM5F
        ANa9ytJlxqo5Ozi0ZYkNp2VBMXG1K8ozZFsHwzg=
X-Google-Smtp-Source: ACHHUZ5xrh422ZzI+xsoIKNhJW8/H9x5HQ4BGByJmrKc2iqsPa/8/rV61bJ/e8r3SUISaA4huTT1DQ==
X-Received: by 2002:a2e:3603:0:b0:2ad:98a6:4af0 with SMTP id d3-20020a2e3603000000b002ad98a64af0mr131239lja.23.1684463942246;
        Thu, 18 May 2023 19:39:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 19:39:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
Date:   Fri, 19 May 2023 05:38:55 +0300
Message-Id: <20230519023855.3840907-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
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

There is no need to assign a result to temp varable just to return it
after a goto. Drop the temporary variable and goto and return the result
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 6608c00e3c33..e9325cafb1a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -684,21 +684,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
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
@@ -715,7 +712,4 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n", phys_enc->hw_wb->idx);
 
 	return phys_enc;
-
-fail_alloc:
-	return ERR_PTR(ret);
 }
-- 
2.39.2

