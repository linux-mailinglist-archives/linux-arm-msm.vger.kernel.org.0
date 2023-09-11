Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C81E79C1BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 03:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235203AbjILBiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 21:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235881AbjILBhs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 21:37:48 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAE11828E3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 17:21:03 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31ae6bf91a9so5066106f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 17:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694477979; x=1695082779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20jjjrUd+N4gzk4ksBEuuWe9UZd9AtwfGIVr9t4iq9Y=;
        b=St+2je86hDBkdbrxpnusLdcK5yZ+pcvc93VbxlKL4d0aZWzQFosDCGmMqRz2zQ1jDR
         XRByzFxFmnz5DOxlPW8u2pFjCnYkZUOmIlJzAbCUanOHgnhL9CpaHQ4iARQJBDJob/Ek
         p66EZ6crP9dxG+RoPIQkfYRuvyuM5GO/hRBzbvAj3xizV3RCR8PhxdcPxxx7aXrYwVDA
         kIsK8ZNM6Dc8sOhMQ0urjyvpqC07r/uMWoSCH0Xg0gTLsDP2K4d+kfVNlvR1eApFPMru
         G4irh0sw5pCCIgLNASS3I7EjWHqun4iEbWimG7NAWg2tbDXpCL6EAu0yE9JYAj5EEXb8
         28Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694477979; x=1695082779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20jjjrUd+N4gzk4ksBEuuWe9UZd9AtwfGIVr9t4iq9Y=;
        b=orlGn3DThVYoDAOEV2NdOPuwDspmbyij4lnZQr+MzItkyyqV8IXLy/U8trLakwMn3E
         KNW9zJ2uEjznx08yHrlBXmWHH7h7yZLArVN7FuMc7kwaqDHWJbCR2VTcsmJMiHLIRBe/
         WS9bZ9XFonPGjAksv8u618KUCvBZG+fMkU9ph/pm/72dwt27MbEUmApYX4G6YM6/bYUm
         ZZLXJxCvGjRYy6RSzRnx+nrKYz4v0hgKnwAnqCSM6QcIkAxcWRP+LBNUaIQjRLfu6ewC
         RZwXbbnq8gB+s1DvB2SaYcoJm7NEsCc2bM1T8NBnX3kl4P2mR54hHGvXi/rbYuwClYkz
         gpZg==
X-Gm-Message-State: AOJu0YwN1kYi9zp6wnf5I9ligNuQrgjP8SQkj7pWiGXvhJt1pmhXL/mk
        bswGpvyRJsoPYLACr3HyR+h71iZQBqsMjL71Coc=
X-Google-Smtp-Source: AGHT+IG3KSVpIhA3IPSJgajfgTp9wy5RAuXsZWVwqay7IgqWH7mGAYBH+oCOwkDCRo3IC1TZyblxhQ==
X-Received: by 2002:a05:6512:39cd:b0:502:9bb6:3abf with SMTP id k13-20020a05651239cd00b005029bb63abfmr10465463lfu.60.1694468728212;
        Mon, 11 Sep 2023 14:45:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b5-20020a0565120b8500b004ff9bfda9d6sm1168804lfv.212.2023.09.11.14.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 14:45:27 -0700 (PDT)
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
Subject: [PATCH v4 7/9] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date:   Tue, 12 Sep 2023 00:45:19 +0300
Message-Id: <20230911214521.787453-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_PASS,
        T_SPF_HELO_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
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
index 19ab36ae6765..fc5027b0123a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -252,49 +252,51 @@ enum {
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
  * @version: qseed block revision, on QSEED3+ platforms this is the value of
  *           scaler_blk.base + QSEED3_HW_VERSION registers.
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

