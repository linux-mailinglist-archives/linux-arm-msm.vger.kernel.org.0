Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1782B74A5B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 23:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbjGFVLl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 17:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbjGFVLU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 17:11:20 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6041BEE
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 14:11:17 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-666eb03457cso779272b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 14:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688677876; x=1691269876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJfhffobAvS4fPeFK5+vNHvDypE+Znk5cG3u/ZHpWrQ=;
        b=qlSZIASj3TAvTFsG5mWkoHyIe28Y3BJCJYslxRe+NFlXV0iUXXBACu5VblExGyw7m1
         0LlPfDxcBFjmM9T+JfFYUkjUFTXwVZlxxkjsVA6UWoDzhF7FvpTx/RE2zrP0r3nK7Is9
         uTvL23ZOirsiXeKKwNsaJOEnRcxVTBCCegHwIB0mzxDkMUOuc67/4EiycMyVLZ5d1FWV
         1uy4QNTY4GphL5rjbJGgeNs8vAZLgu5FN7KHADq0Q+DrZyzueZ4tGAcSoJji1Ds7LVZJ
         5qXP1v0/Me/gFQgO9wWzhBDErfurPX0vtR8/VnrKM+9H7LvJ1ZU72lRVNXnM+BvLWxRk
         58qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677876; x=1691269876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJfhffobAvS4fPeFK5+vNHvDypE+Znk5cG3u/ZHpWrQ=;
        b=IY+0MHVG5QilizTAgyTU6npmkBhoGxCfdc/nlOo7GGInpZ8xlZvREJIeLqfgQPfkP3
         wyFKufmmd47kW062KMg3pHc8CQwi+FPow3cDXFYdtDLA+qDXpsMsCrzSdZuZgOXR8ESN
         pQ3qCaP2LUxh1T8IBpD9RCS5K8PLH6NkRaq+M/sc42Lv01zOp/MOpoj028QrfcW4Tnzy
         Hm8UXSIdooaNawU4sjJriT87W3casQMQIlUHD0NIcyMLVFPZnijnX/ENagn2N3t/m8gH
         fkfXre+SPfU5wmEWfV6kSukrUCETi81/ez7sTDo2QYa7yXgBR41bvXYid8QBeXr0VkH8
         DQlA==
X-Gm-Message-State: ABy/qLar9I6dGwxIdGQoWRx1ezoi2bJLO5z1s+RLnzM9hpmxk6Xfr1n4
        4X8jqpKa/+smJuN5pYaJvSs=
X-Google-Smtp-Source: APBJJlFs/92o4OHExwCe74IPOUNwGT9I/K2yc7xwKRb1jGdURuCQvtrQiURUjBvdMJPfsfDbmv95kw==
X-Received: by 2002:a05:6a00:b4c:b0:644:d775:60bb with SMTP id p12-20020a056a000b4c00b00644d77560bbmr2747265pfo.20.1688677876416;
        Thu, 06 Jul 2023 14:11:16 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id g15-20020a62e30f000000b00682a16f0b00sm1653068pfh.210.2023.07.06.14.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:11:16 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 10/12] drm/msm/adreno: Add helper for formating chip-id
Date:   Thu,  6 Jul 2023 14:10:43 -0700
Message-ID: <20230706211045.204925-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706211045.204925-1-robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This is used in a few places, including one that is parsed by userspace
tools.  So let's standardize it a bit better.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  8 +++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 19 ++++++++-----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index dcd6363ac7b0..fd2e183bce60 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -661,14 +661,12 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	info = adreno_info(config.rev);
 
 	if (!info) {
-		dev_warn(drm->dev, "Unknown GPU revision: %u.%u.%u.%u\n",
-			config.rev.core, config.rev.major,
-			config.rev.minor, config.rev.patchid);
+		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
+			ADRENO_CHIPID_ARGS(config.rev));
 		return -ENXIO;
 	}
 
-	DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
-		config.rev.minor, config.rev.patchid);
+	DBG("Found GPU: %"ADRENO_CHIPID_FMT, ADRENO_CHIPID_ARGS(config.rev));
 
 	priv->is_a2xx = info->family < ADRENO_3XX;
 	priv->has_cached_coherent =
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 75ff7fb46099..1a982a926f21 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -847,10 +847,9 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 	if (IS_ERR_OR_NULL(state))
 		return;
 
-	drm_printf(p, "revision: %d (%d.%d.%d.%d)\n",
-			adreno_gpu->info->revn, adreno_gpu->rev.core,
-			adreno_gpu->rev.major, adreno_gpu->rev.minor,
-			adreno_gpu->rev.patchid);
+	drm_printf(p, "revision: %u (%"ADRENO_CHIPID_FMT")\n",
+			adreno_gpu->info->revn,
+			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
 	/*
 	 * If this is state collected due to iova fault, so fault related info
 	 *
@@ -921,10 +920,9 @@ void adreno_dump_info(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int i;
 
-	printk("revision: %d (%d.%d.%d.%d)\n",
-			adreno_gpu->info->revn, adreno_gpu->rev.core,
-			adreno_gpu->rev.major, adreno_gpu->rev.minor,
-			adreno_gpu->rev.patchid);
+	printk("revision: %u (%"ADRENO_CHIPID_FMT")\n",
+			adreno_gpu->info->revn,
+			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
@@ -1105,9 +1103,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		speedbin = 0xffff;
 	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
 
-	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
-			rev->core, rev->major, rev->minor,
-			rev->patchid);
+	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
+			ADRENO_CHIPID_ARGS(config->rev));
 	if (!gpu_name)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2fa14dcd4e40..73e7155f164c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -66,6 +66,12 @@ struct adreno_rev {
 #define ADRENO_REV(core, major, minor, patchid) \
 	((struct adreno_rev){ core, major, minor, patchid })
 
+/* Helper for formating the chip_id in the way that userspace tools like
+ * crashdec expect.
+ */
+#define ADRENO_CHIPID_FMT "u.%u.%u.%u"
+#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_r).patchid
+
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
-- 
2.41.0

