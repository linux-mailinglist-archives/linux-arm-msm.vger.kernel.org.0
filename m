Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB94E3B31FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbhFXPAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 11:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbhFXPAJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 11:00:09 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13A9C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:49 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f30so10854535lfj.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=96wZKbVAZc0QZ8GAGuoZzdhN1om+iu8T/MIvGHo2HXM=;
        b=HMBIcdCwiXMI824k6NBLU5oyVzXqtHS6oMwtm74emcbOkZsjNFVX+oNkpcemXQsYTy
         mHTBn+9XVDwJFHySUAJLjgwaOQrn+53h0O+BqC5sudvn/thi/k6OVx3Tpzzy3n/1szZv
         bTjmWSTS7D46QhPPAHqiZZj+zpUC18KAgiTcTjDwH950nA8OojAgC7/kVz6FHSA2VErg
         lkn6YvaNvQrfNIPnHfUx0S0fWx1irgb3ytHsVlmnFIY+J/f6Oh01njccuDK08K6YvbL1
         BmjirTc+oLIGHAjIHS7Zp6i/+BhWldFe3E4L7VcpAZAlhZi5b8CWRWJkZy54C/3cPpGv
         8ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96wZKbVAZc0QZ8GAGuoZzdhN1om+iu8T/MIvGHo2HXM=;
        b=l8r+Jl7D2KFGqGi4SK31m48CVgOWL8vbf25fQEgUklK0a8iQQn+X0ksshjJzxBquNe
         b+i+QADeOqSZi+mLKKFppMK8r84TlwVypskZ1zPkshd90WDlfn7pmkzP6VXkxlfkjtMm
         3Dh5E6mckt2DVf+TG+kMzcdzVKxrb+ZxtUDGMeSQSDUyJ+tmp7GJnmK66KF1BZ1O4ilL
         4gDz332aowZjeCUV6C0HR4DtLWgF0X7PfrGHuAI64EP9i5/Dn3g/rCeTU9rrjlOlzOta
         oMxWWkvEK31zhczLs+PAOkdymAmdiWkV3qxbFJG+8xHlGSn6VAaZ+eymoiZ7d6amZi1h
         GxRQ==
X-Gm-Message-State: AOAM533qvXJcgrtciue030yEtlSmwqNSU7GmUvaviwsFDnd4JJfUc0CW
        zHicybDc3JqssHxt/oH8HeCnHQ==
X-Google-Smtp-Source: ABdhPJwsYYxTNAkrO0fW9LP2Q1a+Kr3Jh3hmX3SxnKeb0IQ+bz/LTiihnGXd+y4COYzuBnfRzs6XaQ==
X-Received: by 2002:a05:6512:3ca2:: with SMTP id h34mr1974898lfv.26.1624546668126;
        Thu, 24 Jun 2021 07:57:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 07:57:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 13/17] drm/msm/dpu: simplify DPU_SSPP features checks
Date:   Thu, 24 Jun 2021 17:57:29 +0300
Message-Id: <20210624145733.2561992-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
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
index e8939d7387cb..fcf131f77df2 100644
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
index c4a76dd6dbd5..4658410eedfb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -970,8 +970,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
 		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
-		 | BIT(DPU_SSPP_CSC_10BIT))))) {
+		 !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
-- 
2.30.2

