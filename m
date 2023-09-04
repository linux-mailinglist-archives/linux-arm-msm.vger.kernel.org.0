Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE91790FC7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 04:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350537AbjIDCFD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 22:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350516AbjIDCFC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 22:05:02 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134D510C
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 19:04:59 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bce552508fso13624711fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 19:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693793097; x=1694397897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJKUNdikO94CMyRH4pyQDb+K5Uh7omm4HrkDcf2ckFg=;
        b=VYwhOIkQ7dAXxY5y7zv895WC0Yeav3PF7QmPTsVMrOTgPNe8wgra+RKB5ti8TYlvwl
         T3aqgDvwY3y3Ucic7bLf28YHsnlNl4PJ12+nOmFq2zTBYDNs8TOgjAWyX8TGb/HRPzn7
         ACGslSd8fdM2k3Ynd25ZDBsvMMOGuXkcxkDf43EYclrzEGcDq5r5WE24qdOjO6SDEw17
         9X5CelLPTHnGjAAP8k+Fs+40glMg2SeeLjntcNWgRPIpBnuF4E6hyXTWtqQ3kzwZM1jw
         odYlrABS6cnMmq4Bare93PIwnQLJsSG2TJAH+YGokKkQcq0+QhpDZieqLoeknYJ0p95h
         IbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693793097; x=1694397897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJKUNdikO94CMyRH4pyQDb+K5Uh7omm4HrkDcf2ckFg=;
        b=S2t33LeoVJzn7LI8qmFtsKxtuzYdfmeYBfQmEKRytqJpFO2kFHrw2As/uJZXHSblbD
         LNT6LMJEcLyEuImhoMme67CKOhdj2ab+zpFZS7THVea451Y3OJbsVaVAymcGIMLN/O+9
         gwVGfNSKgN+clxl38LorT3hw0eAqjHTichoxyA9AP2xUqZSD2efy6NxTCoTMhJJ0W9dN
         tI9nOQm67I3fc0hSZUnsSjttYxv0lFMrgQCkZkPDLCDFddwKb4uhq+WnLv8P6Rw6SiFs
         8QeoLsDTQ+eRJR+KXFw6kRlGmriKJ1Xs7DUxqdtE3PEpVbAbLxI9PQTMxxPcY/AR1VA/
         K1wg==
X-Gm-Message-State: AOJu0YwT0REPW32U4bpV8nXYEJ9ubRKkFfevIRUmQiKVjpbbRzrKVX0n
        XLVdte3UIPSTQ3Guep8IBd8PNQ==
X-Google-Smtp-Source: AGHT+IH+ZeEKNM9GR8BkN9YjjINxrtEHHZvvBz+TecZ/euGggBDNfy2hV3F+bhtP9xeeI5LZP8ZtzA==
X-Received: by 2002:a2e:8053:0:b0:2bc:c3ad:f418 with SMTP id p19-20020a2e8053000000b002bcc3adf418mr6221192ljg.20.1693793097407;
        Sun, 03 Sep 2023 19:04:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 19:04:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 3/8] drm/msm/dpu: drop the DPU_PINGPONG_TE flag
Date:   Mon,  4 Sep 2023 05:04:49 +0300
Message-Id: <20230904020454.2945667-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DPU_PINGPONG_TE flag became unused, we can drop it now.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 713dfc079718..d89bdd0dd27a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -79,7 +79,7 @@
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 6c9634209e9f..9aac937285b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -119,7 +119,6 @@ enum {
 
 /**
  * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE         Tear check block
  * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
@@ -128,8 +127,7 @@ enum {
  * @DPU_PINGPONG_MAX
  */
 enum {
-	DPU_PINGPONG_TE = 0x1,
-	DPU_PINGPONG_TE2,
+	DPU_PINGPONG_TE2 = 0x1,
 	DPU_PINGPONG_SPLIT,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-- 
2.39.2

