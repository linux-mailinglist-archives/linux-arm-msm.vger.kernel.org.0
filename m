Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2E97BABF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Oct 2023 23:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjJEV1O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Oct 2023 17:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbjJEV1M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Oct 2023 17:27:12 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C50095
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Oct 2023 14:27:11 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-505748580ceso1812678e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Oct 2023 14:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696541229; x=1697146029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqxEMpUKQ/G8V5waQaP2laENlyhCdS/+wJeXJU7A8oM=;
        b=EN0K3ljHk3kR1nB/osNxcorTQX5476yEYKSgwMYa4O3TBXEowD2krajdwBz9kY+chW
         mE0FSiErTu1jMeSrhcYNKQHOHv9talhTZm6RiQIJ9QAlAtwossknkPZnxfj3Mssf6G+s
         G9Yd2BbToXwjjwh3HMnKLYgRjF2kuNihamv2Mtt2ejNfKh1o1Hv4zuqGzgxFAZc8V46A
         1u0Kidd7q7A+krAfNn2ZzFCy/9vXfBwDbOZnLp/B1U1rLuQBcuFdUto7G7ABIKXqgTcH
         0Kljv+u2ynlNKzR28FTb5oJx4a6BB7CY7dUEbldXAbxTR1NYnD+2Xklod4zGTxZIRG+x
         NHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696541229; x=1697146029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqxEMpUKQ/G8V5waQaP2laENlyhCdS/+wJeXJU7A8oM=;
        b=RnmHOEZhWX+rn+HzUAWXWknlKOdDuc9cLXmed/P17VGopopY0cV4dfy3EbppLvAkXR
         BleC1Ke5UFc66nb2owMenfcw5449bdpCHN7xa1XHceb/yuZ9WtXBIMtJ4H4hHXXBkJfh
         q/NxqepccVS0iniZq2ccXcIUbn5VUA8qNaR1m2omJBPM+axBLFmAtPR2uOFPqva0DbFE
         hPbQfB+3SWeXa+iQzV6Fvs1zNJWj0TKvF8fnmUgSGtRLxGLSu2O4p11PK0u2AnM0vV28
         udOpco5zRssUqrMCxVKrZ/ODtlS0dbsM+uTE9K3H6wpfIb4fx9VYyy+n2WmA4R7OGqHa
         aCWw==
X-Gm-Message-State: AOJu0YyRYu8KqkajmJNcklLIpGIGVX+GJs9d8ZCl0UIj+mYuNMQZi8vt
        N55YPDIX0BfkOy4oQKF+H36r+g==
X-Google-Smtp-Source: AGHT+IE61WKg2qEsPtNBH3ocjcXEL1yByatl5Bf/fVU2tmLzVIv4CUpC2bT2hPMSBX7xXOUfBnHq0A==
X-Received: by 2002:a05:6512:1242:b0:500:a378:db71 with SMTP id fb2-20020a056512124200b00500a378db71mr6845000lfb.57.1696541229714;
        Thu, 05 Oct 2023 14:27:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a6-20020a19f806000000b00500b3157ec6sm8435lff.143.2023.10.05.14.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 14:27:09 -0700 (PDT)
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
Subject: [PATCH v5 08/10] drm/msm/dpu: rewrite scaler and CSC presense checks
Date:   Fri,  6 Oct 2023 00:27:01 +0300
Message-Id: <20231005212703.2400237-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
References: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to check whether the SSPP block has scaler and CSC subblocks
the funcion dpu_plane_atomic_check_pipe() uses macros which enumerate
all possible scaler and CSC features. Replace those checks with the
scaler and CSC subblock length checks in order to be able to drop those
two macros.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 ++--
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index ca02f86c94ed..d1480ff2574a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -21,21 +21,6 @@ struct dpu_hw_sspp;
 #define DPU_SSPP_ROT_90			BIT(3)
 #define DPU_SSPP_SOLID_FILL		BIT(4)
 
-/**
- * Define all scaler feature bits in catalog
- */
-#define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
-			 BIT(DPU_SSPP_SCALER_QSEED2) | \
-			 BIT(DPU_SSPP_SCALER_QSEED3) | \
-			 BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
-			 BIT(DPU_SSPP_SCALER_QSEED4))
-
-/*
- * Define all CSC feature bits in catalog
- */
-#define DPU_SSPP_CSC_ANY (BIT(DPU_SSPP_CSC) | \
-			  BIT(DPU_SSPP_CSC_10BIT))
-
 /**
  * Component indices
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..43135894263c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -740,8 +740,8 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-	    (!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
-	     !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
+	    (!pipe->sspp->cap->sblk->scaler_blk.len ||
+	     !pipe->sspp->cap->sblk->csc_blk.len)) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
-- 
2.39.2

