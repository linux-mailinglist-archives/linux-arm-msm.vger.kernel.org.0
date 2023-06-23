Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACEC73B93D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 15:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjFWN6z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 09:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjFWN6y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 09:58:54 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442E5189
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:58:53 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b4769a2ee5so11439081fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687528731; x=1690120731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhJIZTLErgvAhaIGFl7Dh3Wm2X94gZ/UjmbS2NE5UxU=;
        b=q+ZyBpmyhuyc25nWzqH1Dk5rVnnWe0eQx/nyNbjEOc/S+dfy5vaYogknY2DlyilbJb
         u5ipwptC2Dg9+BuU50sXgvpBLcJh+aFLwpq0pymj5ZxcRSATFrDUfKXWjiPblzescA4Z
         7z7r+z3vmIwuAHI0OCEgxxALIJAWCzkMSYoYi3vv4Q/NywTzVrHG77QiquwNXV4NAaqS
         3nldkwkp5SVipij8ulOVBjbNMT1DBznIa76PHBfJ0WZ1FSDe9qX6dNldcz1AaZ1szKYf
         +5f9iJHOSCsfu2QzC0K8GgRRBJDJXfSlTjHlmOFI2fqkWj6vL4UHhitknZ2xWN4CjzYL
         qhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687528731; x=1690120731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhJIZTLErgvAhaIGFl7Dh3Wm2X94gZ/UjmbS2NE5UxU=;
        b=jmQ69AjHbqf2BNdCQmacIFi3qYhaD92zTUYaQpAOHAWyxv3FzhIWn5WYp1XMzQ6mJH
         bDmOcd/aJi1A3By2fgWh/IgzW9fEiMFid/RF56cnwtuhYkFlScrt0zo9HxzsEIJfWEF7
         G1DdlnzTptbbqMeXLeDXiB0mV3JcW3/x9kF0g0nxsXGrExabspgDi5fRWbe/CPZx1qxZ
         /CPPWyeMxr/iNoTQtePZViuFZsdvLVmAEqpFUikaeUd5eFuXqFKBjYaMn3QLvDN1mwmX
         N96CqIi3i9lShJqTKMtVIjgeVNepsXwpEAhRS5nQGO33mPYvFBM2QvpZUvb2pyMCg4ek
         i8vA==
X-Gm-Message-State: AC+VfDxBBcyaEcu4kUdGBYreslUOtuKn5Rn2n7Dvu2BnWrLcNlJPu9mS
        0K9SyPGN7gN11j7byTThqSrbSQ==
X-Google-Smtp-Source: ACHHUZ58IYWu7lfIl+m1ZAVDlZZMIh+cPGMjvUYIBqVFBhg0bbrQg5EqvV0R5VePLacmsorTaVXWgQ==
X-Received: by 2002:a2e:3005:0:b0:2b4:79c3:ce03 with SMTP id w5-20020a2e3005000000b002b479c3ce03mr10022984ljw.53.1687528731599;
        Fri, 23 Jun 2023 06:58:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 06:58:51 -0700 (PDT)
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
Subject: [PATCH 6/7] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date:   Fri, 23 Jun 2023 16:58:43 +0300
Message-Id: <20230623135844.1113908-7-dmitry.baryshkov@linaro.org>
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

As the subblock info is now mostly gone, inline and drop the macro
DPU_HW_SUBBLK_INFO.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 31 +++++++++----------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8dae416d2dc6..7cb9ef940225 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -271,46 +271,43 @@ enum {
 	u32 len; \
 	unsigned long features
 
-/**
- * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
- * @base:              offset of this sub-block relative to the block
- *                     offset
- * @len                register block length of this sub-block
- */
-#define DPU_HW_SUBBLK_INFO \
-	u32 base; \
-	u32 len
-
 /**
  * struct dpu_scaler_blk: Scaler information
- * @info:   HW register and features supported by this sub-blk
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: qseed block revision
  */
 struct dpu_scaler_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 struct dpu_csc_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 };
 
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: HW Algorithm version
  */
 struct dpu_pp_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 /**
  * struct dpu_dsc_blk - DSC Encoder sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  */
 struct dpu_dsc_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 };
 
 /**
-- 
2.39.2

