Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428C673B938
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 15:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbjFWN6v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 09:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbjFWN6u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 09:58:50 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C80E52
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:58:49 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b44d77e56bso22115421fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687528727; x=1690120727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEJPSFsLFQLeUHR0DHShMWunEOETEI1PxCznhvCiCY8=;
        b=wJdpjNHZkvlCaG4AiVPy2TBq58+rqElaOzHcNP8+739N6nL/OzzZ/vFUa5gU6bqfjT
         yhPqLiD08qMEmGCfpVfm+kKawbwTvTAukge6QgXVi+vKT/TJu2tBo0gCIAzjZLZH8Cyx
         dXru2seQnW6eWE34c8dNgobPK/8f4+ulYMCBzz7yavZ2zm4wy4VVypjBemk/KF1gyVVJ
         hqjm4LdhnN8ueumrhyNozpUF0NqTjWW3GjOuUhQ+yb1QSqgsqYQijtmpgxui8J2WrW8o
         +ft32IQscSjfahAJ9DdL6cWaPY40E8uNqock70PvA3lnqOLflLe6UKAEDavB322EJeVL
         +HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687528727; x=1690120727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEJPSFsLFQLeUHR0DHShMWunEOETEI1PxCznhvCiCY8=;
        b=HsQfWwSNBEC+2luVxhIFP+bdL6wa5k1feRYWcl9Bh03c0Qw9Qt9AhDYK3rhekUcRc4
         B40foTCDvVaubQb/GOCCL9Pi0NpopJYxPdI5fA8fGiZC7QP1VUSRuEhaP9wq18RO2lqH
         fdnqdgsbAFOoS3RZNJWYiTFnWDIdexgaMOUu3pQIWf6MAA3aqQNU8ZC/tL9xq1ZoRGBM
         o3HiLmXuO6iqKGMHOuHt/cO4jHx5SZKDprsj64Wi1VAVs4Py1BvBn+XKmlGasmnSkHXy
         rQ3Vn9MIZyqmaUji/DD3Tq6eJY00EMyaSDRkLuoEdiQuRdCgLAZAJb9qiprgWnNR2j/P
         KqQQ==
X-Gm-Message-State: AC+VfDw7CisjEpnkTf1cAIhPE3SIwPXBNvRvCIc4B5lKvJEHPnv4ZV9T
        ekb0cC7LNxutYf/00Z3/VtyoOQ==
X-Google-Smtp-Source: ACHHUZ4wu/b34r6Yiz+nYYmdczNba7dYoNZoPKpydnsZ2gUagqp3RgnwWueUFdFlqJ1/OciI3vk3Cg==
X-Received: by 2002:a05:651c:118a:b0:2b4:75ed:e0f0 with SMTP id w10-20020a05651c118a00b002b475ede0f0mr5669113ljo.10.1687528727510;
        Fri, 23 Jun 2023 06:58:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 06:58:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ryan McCann <quic_rmccann@quicinc.com>
Subject: [PATCH 2/7] drm/msm/dpu: drop the field `name' from DPU_HW_SUBBLK_INFO
Date:   Fri, 23 Jun 2023 16:58:39 +0300
Message-Id: <20230623135844.1113908-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
References: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
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

There is little point in having a separate field with the name in the
sub-block info. Ryan pointed out that some (most) of of sub-blocks do
not even fill this field. The handling code also usually knows, which
sub-block it is now looking at.

Drop the unused field completely.

Suggested-by: Ryan McCann <quic_rmccann@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4a99144a5a85..d4a5b18d4dae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -253,9 +253,9 @@ static const uint32_t wb2_formats[] = {
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
-	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
+	.scaler_blk = { \
 		.base = 0xa00, .len = 0xa0,}, \
-	.csc_blk = {.name = STRCAT("sspp_csc", num), \
+	.csc_blk = { \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
@@ -269,9 +269,9 @@ static const uint32_t wb2_formats[] = {
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
-	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
+	.scaler_blk = { \
 		.base = 0xa00, .len = 0xa0,}, \
-	.csc_blk = {.name = STRCAT("sspp_csc", num), \
+	.csc_blk = { \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bf7a525206ee..a102a8b0f8e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -273,13 +273,11 @@ enum {
 
 /**
  * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
- * @name:              string name for debug purposes
  * @base:              offset of this sub-block relative to the block
  *                     offset
  * @len                register block length of this sub-block
  */
 #define DPU_HW_SUBBLK_INFO \
-	char name[DPU_HW_BLK_NAME_LEN]; \
 	u32 base; \
 	u32 len
 
-- 
2.39.2

