Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B2A69639A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 13:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbjBNMfe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 07:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbjBNMfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 07:35:11 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61145CC31
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 04:35:09 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id w11so23209784lfu.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 04:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1wKD3viWx9y2Doh09M6thHCui3jXjNr6R+aDc8/BUA=;
        b=W+iHYcy4Kau9N/8oFf0OC/B05xBFj+/6mw6m7TeMCX96tPAlibotzVD0l4WvPYU49S
         fqf0J4giZ4dLuYcSwWsGsHN4b19iYKmKvjhclr/QTdEW8UM/t8SqZ4wUZZn//Bc+sy9c
         bDXSq2BJ7KUi5pljAOYb0a/Q55L+YhXg9k8VaNpomy8LHDe4SZlgJG1mU6AkT88bC1s+
         snfiDwmYE6KhFm50Sdtn1aE9GMtgKBipn1eNWoV/dQb3Mke1fnlK9zoyeq3nqtsURyBi
         ifDg/2InNco6iX43uhqpNGnInicMlYkpZRmaSRrbMo6XEOY/HP200v4C+v+rrF01hFWw
         fJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1wKD3viWx9y2Doh09M6thHCui3jXjNr6R+aDc8/BUA=;
        b=Q40xwcyslqTp5Pv/9u7Jqfiat647Htuz13PtBpaIPV9yqhg9aAX+TkmtIPL+BMkqhw
         v+kaRFcC3YcvbAXkbcUByCfCeDUwOcPQst0l818lXNrcPlMJEth1NoGV7j9DoQV7sF1J
         Sh9+jD3YMXvJNOGUJz3QpphgkEYxMJc2nLZmsFQ8a42BFXNQ2FONJe5XrDvSJQ6otra7
         mN3rfJEKZVq/UfqpkF2kvc6GkQ97XJrlp35TZ751XCjR9GD6q9OYOovIh0x0emveiysu
         1WmP+wjSmH1j45WpchexGalID7fUkzi3lFPIX+rAxypUYKrwkexulhrg7LJk6yWHGHV5
         UgHQ==
X-Gm-Message-State: AO0yUKWGpVtL23I3pOY/ESju1u1vSSC3/YCeHmycyy9oDiNYpIi7K65g
        1x8FVh7TKBCVCaAYlnDKw6ajQg==
X-Google-Smtp-Source: AK7set9Bquz0hgYxtaiG1c/s1FRRk3s8VS0wWQuvd5BrpQ5m9R1E/b4/FcDR3o2q7MpTGUiuP9qyAA==
X-Received: by 2002:a05:6512:48f:b0:4b5:b7c3:8053 with SMTP id v15-20020a056512048f00b004b5b7c38053mr466747lfq.42.1676378107761;
        Tue, 14 Feb 2023 04:35:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v19-20020ac25613000000b004ab52b0bcf9sm1077158lfd.207.2023.02.14.04.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 04:35:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/a5xx: add devcoredump support to the fault handler
Date:   Tue, 14 Feb 2023 15:35:04 +0300
Message-Id: <20230214123504.3729522-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
References: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
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

Use adreno_fault_handler() to implement a5xx_fault_handler(). This
enables devcoredump support on a5xx platforms, allowing one to capture
the crashed GPU state at the time of context fault.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index b5270324f5f8..d38ebfb5965b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1099,16 +1099,19 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_gpu *gpu = arg;
-	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
-			iova, flags,
+	struct adreno_smmu_fault_info *info = data;
+	char block[12] = "unknown";
+	u32 scratch[] = {
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(4)),
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(5)),
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
-			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
+			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)),
+	};
 
-	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
+	if (info)
+		snprintf(block, sizeof(block), "%x", info->fsynr1);
 
-	return 0;
+	return adreno_fault_handler(gpu, iova, flags, info, block, scratch);
 }
 
 static void a5xx_cp_err_irq(struct msm_gpu *gpu)
-- 
2.30.2

