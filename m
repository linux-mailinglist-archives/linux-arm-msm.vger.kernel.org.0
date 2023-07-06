Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FA874A5B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 23:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbjGFVLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 17:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232710AbjGFVLL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 17:11:11 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C891BEE
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 14:11:09 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso771758b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 14:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688677869; x=1691269869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6G94goSdCbJeE7DE/SqiiBM7xxMv8B0WdoqZyh7EZs=;
        b=M9AQ2C+vrh8Zxr/kYTY0YTeLfNM/3INMZRqZ5hVUIgk/zLzXPKtlUJkWDy5RYJ3WvU
         Z/4tVCyaIvH4yXrDiQYCsQDJeoxrZXoOu4W03otwsDzu3wpRLh/WzW9MxvrtOu+RkdXN
         w1/NrRJCEOq+pk4BJOsWwQhTsTFyBy1bKxb5REtrrfkU3qmocNJZWvfPb0MzoLPq/faK
         +KV3a0KbadAEf1huYdqS79VpyjcH7Y9EI2czGmNi86zp+LFfzCSUjDgLgVUY/+rQo9Ou
         IfbW0xiYmO+xPwCc8AYtrhXaUWVRBTZDWvV/PXIiILwC1kzOdvueawEQvvqV9nHJw/6+
         0ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677869; x=1691269869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6G94goSdCbJeE7DE/SqiiBM7xxMv8B0WdoqZyh7EZs=;
        b=Vjlbq8r9sLWyB00qSfqmRmv8ukW6rvoJbWNIHz+DDTmpk9MkGvwzTvVBYDFXeV5T4P
         frM9ei0XehfSseiZ0411Z7RAcubD7Hzq63wTmXE/yKrXYrqvw9KWivMy8Q4q0tak9Ma7
         g42LWnb/HI7m/jOYiXqP8iMqtYEqNfFNYMesodLXm3ctL+/pLu3vXnTO6Y7Z/Mwwj/zk
         UqUpR/w/JP8sV2J0GVRRXLGZ6pEb3qXn96xnMb+4VoehH1YJduQhB465KY50fPWqieI4
         fYJvX+lIxab/lN/Uz1u1UVS0WNrFlI3/ZNMGn/bEH2YfRxLdKMow3BTS6ml/KTWMNpcQ
         WiJQ==
X-Gm-Message-State: ABy/qLZ73WhXOz/Y99LdYFc+gCpuvzIefI9jzES0Z0ox/LbVkVCWFgK3
        4ky72ONzYzXY7fL8HQXWaf+ks0nf59Q=
X-Google-Smtp-Source: APBJJlFau+uT/88HmIfL50F8f0ZG1ImhsODwEp/vLS6EzIvdt/J6VOMiW8qi9ZfCWopxsin6MPoIFw==
X-Received: by 2002:a05:6a00:a1e:b0:66f:578c:59fb with SMTP id p30-20020a056a000a1e00b0066f578c59fbmr3078576pfh.10.1688677868621;
        Thu, 06 Jul 2023 14:11:08 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b00666e2dac482sm1669797pfi.124.2023.07.06.14.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:11:08 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 05/12] drm/msm/adreno: Use quirk to identify cached-coherent support
Date:   Thu,  6 Jul 2023 14:10:38 -0700
Message-ID: <20230706211045.204925-6-robdclark@gmail.com>
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

It is better to explicitly list it.  With the move to opaque chip-id's
for future devices, we should avoid trying to infer things like
generation from the numerical value.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++-------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f469f951a907..3c531da417b9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -256,6 +256,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 	}, {
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
@@ -266,6 +267,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
 		.hwcg = a615_hwcg,
@@ -278,6 +280,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a630_zap.mdt",
 		.hwcg = a630_hwcg,
@@ -290,6 +293,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.hwcg = a640_hwcg,
@@ -302,7 +306,8 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M + SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a650_zap.mdt",
 		.hwcg = a650_hwcg,
@@ -316,7 +321,8 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M + SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mdt",
 		.hwcg = a660_hwcg,
@@ -329,7 +335,8 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.hwcg = a660_hwcg,
 		.address_space_size = SZ_16G,
@@ -342,6 +349,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_2M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.hwcg = a640_hwcg,
@@ -353,7 +361,8 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_4M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
@@ -565,9 +574,9 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	if (config.rev.core >= 6)
-		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
-			priv->has_cached_coherent = true;
+	priv->has_cached_coherent =
+		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
+		!adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index a7c4a2c536e3..e08d41337169 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -33,6 +33,7 @@ enum {
 #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
+#define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 
 struct adreno_rev {
 	uint8_t  core;
-- 
2.41.0

