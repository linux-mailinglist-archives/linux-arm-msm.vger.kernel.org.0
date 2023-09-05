Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A0E792756
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 18:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238751AbjIEQGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244685AbjIEBZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 21:25:37 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B3CCC6
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 18:25:33 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5009d4a4897so3324348e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Sep 2023 18:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693877131; x=1694481931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGlYJLkkOgxNz4bfpPlp5tACOS3Ij3+hEy/bbry5T2w=;
        b=TF3s4mEfsXZbSCmVS7O+fjEhYyKf5tnZBhF9vsRCigr2gL2/1UzBbArs+G19sIgmb1
         ZrM/Al3MPiY3UuHfMQS8+vHC6oJquCjigkDHCXvpWo8HCHHqkIA/shR2Mg+HBjeOhMWp
         PbZvC4U8CyaS4bSjtw2ghBX4Al10Lvj+D9S92o4fkb+ks/DgiCJOFxFNBg/EZ+z/xtuk
         ensP4hPCwatl5oh4HmtfOwY/RzijsSsNXtza+MQdpye2KkPXDSBsXg+TVtuvsM4Ju5Jk
         Xf+wH9wg9/QmdUinZtSk+WfSufeNzvRzqvih4rj9BNVsv/1F6G2lCuJbWTy2269+o/EN
         Ysfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693877131; x=1694481931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGlYJLkkOgxNz4bfpPlp5tACOS3Ij3+hEy/bbry5T2w=;
        b=EzDnqudYz347XNBYB0iPwAAWjasuIXy7NxHsVxvLHQn8eb25UXTN4mlksNNCxqi5hi
         UGfgW7Lke+H/vDsxm+88I9bAtun4zUT60XMqctKvfygviiN2XAVDvROhRPAK4IH52zXl
         BjIbVZiHFve3n3oVNfDGtjt13sC152qf4ZoNlVik7b0H41UuSG9cqaWXfd2hzPFrUqpo
         2yqjVhiWKvzxi7RK+t9yaZR9okwvCzjUVYfvnavbOkw2awYcQdb81cJCk9mxDFlK6FKR
         OHpOhW8mgsNkmmCt+m9ynX0kd0KoIeaksuwbWUmjR7uSH487r/jqGPBmQvp00FIAznTg
         h20w==
X-Gm-Message-State: AOJu0YxRXoyt5JFBaI4VmzdzNPjERiuYE93pyNiB7ESCx/h9RY8Pd/3I
        fUOSOVzrkpDffKmEBBhzKD80fQ==
X-Google-Smtp-Source: AGHT+IGL7XrtBeVMSH/u25G0DwjYX0kSPFOOiD+xcYJ7PSXAlJXrEyGz446CtJl5o20jIkQw2iJf5w==
X-Received: by 2002:a05:6512:10cd:b0:500:a2d0:51ba with SMTP id k13-20020a05651210cd00b00500a2d051bamr10609443lfg.44.1693877131664;
        Mon, 04 Sep 2023 18:25:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v25-20020ac25599000000b004ff70c76208sm2062369lfg.84.2023.09.04.18.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 18:25:31 -0700 (PDT)
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
Subject: [PATCH v3 5/8] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date:   Tue,  5 Sep 2023 04:25:23 +0300
Message-Id: <20230905012526.3010798-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
References: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
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

As the subblock info is now mostly gone, inline and drop the macro
DPU_HW_SUBBLK_INFO.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 7c08bbd2bdc6..63716ff5558f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -252,48 +252,50 @@ enum {
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

