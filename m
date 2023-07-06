Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43D2174A5B2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 23:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjGFVLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 17:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbjGFVLM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 17:11:12 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94141BF8
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 14:11:10 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-676f16e0bc4so638686b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688677870; x=1691269870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fpkuwfxk56jmaUIMhgMkkTmtHlSU19KWQefXBhwqKCg=;
        b=JCDNN0TKWRrI+QaDO5E9GGJcybEUdSCCbXOC5XaDfjBjVZKt93yukr/fM7xood2FCR
         I0YJFsI1kGAoE9Sk03IYm+skf9+yaXeBoz6uWJ5ORqX8bA7zhVy33mgalkWmCGQ4D3yl
         jLv8Ga5DbvgWVhh863w7uND4+UV0ghjM2lZNwm8e8KmlbtbQMYoYKTlJgDdNbI+XOWzy
         VyrlH90btmzQTjiNFW+502FnvjdP+h+TbUw56jhGax8HXLdXOOSCizBO9yHh6UpuyA9Y
         S6mZ8gUTge22HasmDH6y23iSIsEepM7e77t4dDqNyUsYKvuHPx1bL1VhDIgEOorIa10x
         zE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677870; x=1691269870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fpkuwfxk56jmaUIMhgMkkTmtHlSU19KWQefXBhwqKCg=;
        b=Z+3nYIA0joLItzYbNVxmjsqHBrJSN3ur2cFvh+PWaT7P5tinVfbjBJVureQSLPmD0D
         kXS2jed0r/LcrvZileWPgfeVLKk9m2H7NOedsP8ldqXKOlcOuGSeYGYzHXyUDsCPKdpB
         bRbEiPnpfq1fMP6SBdOAs0ykzzWGuefFOsk2Tqs/wTjn5xwuVkyBNnBCw0oZyKWSHc5B
         jfKUEXRDimsWapUrGafyE4CFuiJtOpE5upLBkypdqiu6Lj+7gkq6dYH1ONnjg5Fp6JCU
         WnozqMuBbyW4bH1WC06hHyYepoGP6KpOd5Ob6JQsPdJK9VDNpOjxizz8TSnCNwDX/9CW
         dgIw==
X-Gm-Message-State: ABy/qLbwOyDDwlX02RW8QjtWKV3kdtGTS77mu35cQ/YuJCqTQ90+kCAK
        h3D8QriWe3QCBgxNY/zH0ys=
X-Google-Smtp-Source: APBJJlGeEDqK9wYyWfo2/1THXZ2nOwWQcgbqh+XoB76TslJdWmagiMHSCGYlEw5a/70hEMRiTGmRcQ==
X-Received: by 2002:a05:6a00:1a15:b0:668:753a:b150 with SMTP id g21-20020a056a001a1500b00668753ab150mr3128134pfv.21.1688677870268;
        Thu, 06 Jul 2023 14:11:10 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id y25-20020aa78559000000b0063f1a1e3003sm1658094pfn.166.2023.07.06.14.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:11:09 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu device table entries
Date:   Thu,  6 Jul 2023 14:10:39 -0700
Message-ID: <20230706211045.204925-7-robdclark@gmail.com>
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

There are cases where there are differences due to SoC integration.
Such as cache-coherency support, and (in the next patch) e-fuse to
speedbin mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 3c531da417b9..e62bc895a31f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -258,6 +258,32 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
+	}, {
+		.machine = "qcom,sm4350",
+		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
+		.revn = 619,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a619_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.hwcg = a615_hwcg,
+	}, {
+		.machine = "qcom,sm6375",
+		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
+		.revn = 619,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a619_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.hwcg = a615_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
 		.revn = 619,
@@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(struct adreno_rev rev)
 	/* identify gpu: */
 	for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
 		const struct adreno_info *info = &gpulist[i];
+		if (info->machine && !of_machine_is_compatible(info->machine))
+			continue;
 		if (adreno_cmp_rev(info->rev, rev))
 			return info;
 	}
@@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
+	priv->has_cached_coherent =
+		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
@@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	priv->has_cached_coherent =
-		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
-		!adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e08d41337169..d5335b99c64c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_h
 extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
 
 struct adreno_info {
+	const char *machine;
 	struct adreno_rev rev;
 	uint32_t revn;
 	const char *fw[ADRENO_FW_MAX];
-- 
2.41.0

