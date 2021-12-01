Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1BE4465983
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353713AbhLAWzL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353714AbhLAWzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:55:11 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F20C061748
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:51:49 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 207so51120587ljf.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=svPKLKMKhZhnd91WRdbWbN+/qKS4HH/Q2LMWNF7ijvo=;
        b=azAFpU2VsQiCYtuKQEZfC1N6Err8B2Dzcvtjr8apntyKIeymxCyYhhvArjY7UJ62Gr
         OIDw4pexNa0sPhceWhUiMGFGOt/99tvmXORF0OfoNpIZPbGGAiDRjq04Asc+exEyvzqm
         HESUZpXUnu3ml1gM/BuVJFhN5im+EBDqmoKitBGeRvcoPEXYB+fguDdBpovFFjvKSUh2
         Da1imXp8g1KR3bUnY+NjaK3MJTe2YTOOEHZMHvKGI5EY7YEUjkV0ex36K7QWctWofs4u
         34RCZVGHyae6pw9Wyu8ccjuV05c2bSP/A+0gRHaOOj8e0P7MoqcTKhc1xV06Uw83DD4r
         3koA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=svPKLKMKhZhnd91WRdbWbN+/qKS4HH/Q2LMWNF7ijvo=;
        b=CVhtXhmusYMPhqzYyHkVSzZTn32OL5khqPXRUfWfh/V5wONeiGahyrijEenOj2NdYf
         MGQTEumkPc5RFv4rmodwISng/dc8akIonx9w9zZSJX+OE1v/yUtOGnBk4CqQLFxY/auR
         ppja+vvH+dqkKhkVzR9K5W0pAv6WctBwI3V9d8Hfw/VScedB9Sh2pUFfdlkKBF5YraRi
         VbI28I/xSoYETKKPBHrHMFQQRM58nKLv739mRSYKMHoUiU6iMC+dYAmk8zDN/D1kOGDn
         2qvSM6HDury1JXfRzoK6UyWj47eVSOUq5+AYdp1DHVMry09Th7Yn1HfQ3lqRT34uTxLh
         zfvw==
X-Gm-Message-State: AOAM532XMe07+LSkvjsEQ8vCjRzwxachA4eYlGLcIy8Fwapr1lFNIf+P
        LrEmVtHTgWNoCYGEgIJwphskjw==
X-Google-Smtp-Source: ABdhPJxSqroReUidD0yfVnJtB8QUTTYy2P0BgDTyj+4bcfKprRVwJCSxjy4xYuELtIvXRq5Ys6fvXA==
X-Received: by 2002:a05:651c:1257:: with SMTP id h23mr8148188ljh.17.1638399107596;
        Wed, 01 Dec 2021 14:51:47 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm124819ljh.49.2021.12.01.14.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:51:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/msm/dpu: simplify DPU_SSPP features checks
Date:   Thu,  2 Dec 2021 01:51:39 +0300
Message-Id: <20211201225140.2481577-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
References: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DPU_SSPP_CSC_ANY denoting any CSC block. As we are at it, rewrite
DPU_SSPP_SCALER (any scaler) to use BIT(x) instead of hand-coded
bitshifts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 16 +++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  3 +--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index ad2002d75739..3c53bd03bdeb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -25,11 +25,17 @@ struct dpu_hw_pipe;
 /**
  * Define all scaler feature bits in catalog
  */
-#define DPU_SSPP_SCALER ((1UL << DPU_SSPP_SCALER_RGB) | \
-	(1UL << DPU_SSPP_SCALER_QSEED2) | \
-	 (1UL << DPU_SSPP_SCALER_QSEED3) | \
-	 (1UL << DPU_SSPP_SCALER_QSEED3LITE) | \
-	  (1UL << DPU_SSPP_SCALER_QSEED4))
+#define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
+			 BIT(DPU_SSPP_SCALER_QSEED2) | \
+			 BIT(DPU_SSPP_SCALER_QSEED3) | \
+			 BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
+			 BIT(DPU_SSPP_SCALER_QSEED4))
+
+/*
+ * Define all CSC feature bits in catalog
+ */
+#define DPU_SSPP_CSC_ANY (BIT(DPU_SSPP_CSC) | \
+			  BIT(DPU_SSPP_CSC_10BIT))
 
 /**
  * Component indices
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c7b065b14c5c..911f5f0b41d8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1010,8 +1010,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
 		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
-		 | BIT(DPU_SSPP_CSC_10BIT))))) {
+		 !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
-- 
2.33.0

