Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A55F27476D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 18:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbjGDQgv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 12:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbjGDQgu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 12:36:50 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EF7119
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 09:36:49 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3a3373211a1so4079369b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688488608; x=1691080608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsDIOc3R7jPNwTF/e6mDLa85oKfSVIk5sf29NNlXYoo=;
        b=BNGhEo+uWE2gf6vcAtz9IUj1pNkWKnQ/9F72dBHhIdx5lmFGHct7rGrHWMJMrEidQE
         WixrlzXEOD2kSQrWV4ukAl68JI5CNYt59zH9oSxi/OySWJLvLG9L8Bvod+YhIeFUVO8q
         U+aS926WL2MznTIUSAjaG/+aBHvNuXkQOSjJ3i5pMGVqU9kUCyPGLnmKRyr4M795My8I
         ftgZVQ0jURW1323MrK2KzwJW+nJpeVofDL/78Y7m2oY4v2prYJt/ElLRTvwCkP8YGPZY
         3Usy/Wy0BPRPwGvdbOPc6c43vzXfBuzZ3LdXvb6SNyKh4udJBTDJK6p4jN1Ynn25AsBa
         yBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688488608; x=1691080608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsDIOc3R7jPNwTF/e6mDLa85oKfSVIk5sf29NNlXYoo=;
        b=dW2wdyvNmlWqOCeeHnFq9IFo+3nBpOwaMxaDTZ9yTvg2gGvck370OTgPuUUi6K5/E/
         DZblHNcSQ6rJp4GBhs9Z27aqiGOVsG7HI7awYgqPiWgcWZ9+siNnUzx9hVr+WoNIjpHZ
         +W5isaHYja4MMOF2UHTTw88EqB8L2oVSbHCMxtlJpZwtu9Zm8E0j6IuaqITq6M0VbZWV
         CyIo6P1UWCmyWBIvELUt+pbwgaukCdy8Gc68olQbYFADjy7s34CrqbD1EMwY3fP1nQ/z
         m0ki1dYNutkjhtzB1vRvK2T0qRTJ/HAPnj9E8UVhQ0xiH+nXhfwCpc5IVP7YOigz/bQb
         4Iow==
X-Gm-Message-State: AC+VfDyfn1gTG8RpnSsQOd1wy1zOpWKsPdi6fmbSXZkWD/qbcS2d/5Qu
        /rRCDAAGj/14fSsXmX93N2V9jWnx+DY=
X-Google-Smtp-Source: ACHHUZ5CifixBgOlH8+wBhSbr7oMIhcVC4UGtOJbSsbDi9p06FpbFUtR6PZoChSy3HyYsBG5FxRCNA==
X-Received: by 2002:a05:6808:1792:b0:3a3:69de:d385 with SMTP id bg18-20020a056808179200b003a369ded385mr18508474oib.6.1688488608703;
        Tue, 04 Jul 2023 09:36:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
        by smtp.gmail.com with ESMTPSA id k23-20020aa792d7000000b00682ad247e5fsm1013081pfa.179.2023.07.04.09.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:36:48 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 2/2] drm/msm/a690: Remove revn and name
Date:   Tue,  4 Jul 2023 09:36:40 -0700
Message-ID: <20230704163640.6162-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704163640.6162-1-robdclark@gmail.com>
References: <20230704163640.6162-1-robdclark@gmail.com>
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

These fields are deprecated.  But any userspace new enough to support
a690 also knows how to identify the GPU based on chip-id.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 3 ++-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cb94cfd137a8..ce8d0b2475bf 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -369,8 +369,6 @@ static const struct adreno_info gpulist[] = {
 		.hwcg = a640_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
-		.revn = 690,
-		.name = "A690",
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a690_gmu.bin",
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ef1bcb6b624e..cf45007400c8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -310,7 +310,8 @@ static inline int adreno_is_a680(const struct adreno_gpu *gpu)
 
 static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 {
-	return adreno_is_revn(gpu, 690);
+	/* The order of args is important here to handle ANY_ID correctly */
+	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
 };
 /* check for a615, a616, a618, a619 or any derivatives */
 static inline int adreno_is_a615_family(const struct adreno_gpu *gpu)
-- 
2.41.0

