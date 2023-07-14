Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71D7752EF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jul 2023 03:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbjGNBzM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 21:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234208AbjGNBzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 21:55:11 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97D52D50
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 18:55:08 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb9ae4cef6so2373891e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 18:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689299707; x=1689904507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JquCHecjR3dbAA9U6QNcI85J+r2eu2ORSn/fq669QI=;
        b=pzLMHR1mAk1KQV3ru54HqO7JHXu4tv4ICgOMhdY3t6WWFqP3B2lHYq+WN//EhSKEqW
         SmvECA2CTPOMY+OlCAufgAo3PwjQoNtil7+HXhRMypwdrOT/gpd9YGvjhR0qcbSaofTD
         4rJoWcB65M4H3jkt88Ll3SEPdp+R0Dz6AaNgiiFj8MuRDAyhGJV4kE3SwrzDP9yBIcyf
         aK6WSOSOG7yExB1MJhQ61ShriY47GdvJgIhWKFs0588ESpVVu1vTj4U9fxTO7URarvbO
         umrRZyce7/22TRM+c15CEAiqeafh/XkCKtM9P2EuKLXdA9SDXngebiAV90HlkQMCVvLT
         j+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689299707; x=1689904507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JquCHecjR3dbAA9U6QNcI85J+r2eu2ORSn/fq669QI=;
        b=XsmsOT8uQljiyY6mqXZdJRnCSi0DaeS1EtDWHz7UTQQ2GWRfRJUtZqm6uqynW1LTPH
         CtNYpFHu1kbdbYx/X7fiQ9sErY/8rd7PvkrzB9fRL+MFeb3SagarBF7niUau1jWFGnhX
         cBlUKReaqpBjbEd0h1fZL4Klc8LAxcXCmET59rHHI1bx4pm6bd5v5tMQ7CDb7cbV3D3C
         xJ1iegHfNUwNHHRKXR+sYu1CEOmHRhZ7mWXqBFcStXpo/0/KJLu8UTOWQUbBwsgOwnp7
         /R0MHpsjzPXARKyErGV3Chak1DuhmupOeLcwh/OUTc86pFUegeVUgF38Q+jWKUP4Nq2G
         MLkw==
X-Gm-Message-State: ABy/qLYlRXUO7kQn5xQjiSUPOHGQQBJNG4jTpJFu7ugvIOw9fuLDx8O0
        u+Zy4BMLv16oZD9OKdHNeKkHcg==
X-Google-Smtp-Source: APBJJlEqY+gt/9wM8NakxtplQkZAgTGBOPl9wANXF1y1GsQH1RjFfBBArLBFEI0Hueu65lE26kdL+g==
X-Received: by 2002:a05:6512:3b9d:b0:4fb:8c52:611 with SMTP id g29-20020a0565123b9d00b004fb8c520611mr3477364lfv.38.1689299707104;
        Thu, 13 Jul 2023 18:55:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q8-20020ac25148000000b004f3afa1767dsm1297550lfd.197.2023.07.13.18.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 18:55:06 -0700 (PDT)
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
Subject: [PATCH v2 4/4] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date:   Fri, 14 Jul 2023 04:55:03 +0300
Message-Id: <20230714015503.3198971-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
References: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index cc1800e324dd..61c6caf1b185 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -271,48 +271,50 @@ enum {
 	u32 len; \
 	unsigned long features
 
-/**
- * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
- * @name:              string name for debug purposes
- * @base:              offset of this sub-block relative to the block
- *                     offset
- * @len                register block length of this sub-block
- */
-#define DPU_HW_SUBBLK_INFO \
-	char name[DPU_HW_BLK_NAME_LEN]; \
-	u32 base; \
-	u32 len
-
 /**
  * struct dpu_scaler_blk: Scaler information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: qseed block revision
  */
 struct dpu_scaler_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 struct dpu_csc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: HW Algorithm version
  */
 struct dpu_pp_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 /**
  * struct dpu_dsc_blk - DSC Encoder sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  */
 struct dpu_dsc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
-- 
2.39.2

