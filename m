Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54D9F70AF5A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 19:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjEURnR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 13:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjEURmy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 13:42:54 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77885B8
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:21:50 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f00c33c3d6so6039395e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684689709; x=1687281709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aL7y3wzagnr2HfjgObLdfzPbAHB3ifg2d+IXSFsg1QU=;
        b=GsVAEld/oI9yK0l6q2C4BZv8SsAtZ8rQFk6ByzPLXa6jn+B1/ad44CM4llg0ulPxQp
         R3+M+o32S9oAsar9vfkHrh8ooQ1fUCXhAsftAmxNpXqRrN9KfqMUdExKwsRroadskxdQ
         eiSyKzsG+MrEc9JRIAb/RL/OWKxBzMBjfGdu3TtuH9ZN60qRTvHL/MgaCwKjWrnDPOla
         olJc0iVvrAAVEq9SpSukbiN92wN4P/8FToWQ5pbQpo9PYEY2F23/OrI9OQdt9Hc2qldq
         thwhHMx4xjciiqbR1iWkd2aI+hTDEdO+KZhxEG1yCI69llZckDPf6wvbalOFPJW5Yf2u
         S7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684689709; x=1687281709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aL7y3wzagnr2HfjgObLdfzPbAHB3ifg2d+IXSFsg1QU=;
        b=QmPPLmpqqJuuSfyRwMhS3CXi+F8v4jyjlQfdHPNu0wxF5J1sYsav4PtXa7cBaUSkzD
         GkSqMmPYfbE/i22JDOgNPIQaOBZ+9yFARSCAa7ctjT40TNCfj+RlVfq2EYqHKV+G9yPK
         LvEmlKhKHVmXbuob68kTPrePjlKJ76Gb0agtMt3e3YbcKhq7jZLLcgqKLZW+BmeW0/uT
         Q9G7CAKQy+MwpmhcqR7URDCUP5COctSmteK34plz6uBTu+xNiCPOu+gpW2QkhpzAWWnB
         2WsZeGQ09sjob+aY6i3srvE3CwVDsUKcteucWTw1uzhjzGGfUFIQWS09p8B7QQcUgrwX
         JR8Q==
X-Gm-Message-State: AC+VfDw2wbWH2YxJnoMHDLp2XVQ67tKw9uozBxtHZTseJniNj04lOJF5
        MMvUmax4AXJ3wWTAmtqbgZukGQ==
X-Google-Smtp-Source: ACHHUZ7evLh/2VEFyCJXkXaDUxmCRMJ0SsM9ISKW0W8NxY03olOJ+t6sUWJPuxoLeVF8dCRm3S4XZA==
X-Received: by 2002:a19:ee01:0:b0:4f3:a3e0:850e with SMTP id g1-20020a19ee01000000b004f3a3e0850emr3063162lfb.35.1684689708684;
        Sun, 21 May 2023 10:21:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020ac24d16000000b004f24cb9ef14sm686339lfi.47.2023.05.21.10.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 10:21:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Date:   Sun, 21 May 2023 20:21:46 +0300
Message-Id: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop SSPP-specifig debugfs register dumps in favour of using
debugfs/dri/0/kms or devcoredump.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 25 ---------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index bfd82c2921af..6c5ebee2f7cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -727,31 +727,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 	debugfs_create_xul("features", 0600,
 			debugfs_root, (unsigned long *)&hw_pipe->cap->features);
 
-	/* add register dump support */
-	dpu_debugfs_create_regset32("src_blk", 0400,
-			debugfs_root,
-			sblk->src_blk.base + cfg->base,
-			sblk->src_blk.len,
-			kms);
-
-	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
-		dpu_debugfs_create_regset32("scaler_blk", 0400,
-				debugfs_root,
-				sblk->scaler_blk.base + cfg->base,
-				sblk->scaler_blk.len,
-				kms);
-
-	if (cfg->features & BIT(DPU_SSPP_CSC) ||
-			cfg->features & BIT(DPU_SSPP_CSC_10BIT))
-		dpu_debugfs_create_regset32("csc_blk", 0400,
-				debugfs_root,
-				sblk->csc_blk.base + cfg->base,
-				sblk->csc_blk.len,
-				kms);
-
 	debugfs_create_u32("xin_id",
 			0400,
 			debugfs_root,
-- 
2.39.2

