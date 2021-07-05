Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146753BB4B8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 03:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhGEB15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 21:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhGEB14 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 21:27:56 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3C0C061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 18:25:20 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q4so22361051ljp.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 18:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=snkgCap2/o+t1vAhQA7ejk+jLYgLsqxsKE9XwxD0MqU=;
        b=IvgCxZnnqkj6jpVv26mUCMCyj0Ppp/tYAeYIJV6jII6VZLGVnD6K678YUW2Jc0pf/T
         vVJGreFEZswIdOSgc586nMF69YnubrSI+pjdXRLcK2gYaE/nihcNmhVOWOz/Lp81aq+5
         MlbSwVie1A9EvjUPQhICUhS+DjcH8HxIvUUymM8rjalSBZCjvnmmYEOWom0ORkiQodHy
         xzo54MfJKG2eu9kQ5iRPoDs9ejgdANFVXagBRzYNouffpU2HAsLkRPH8ZrL6UIE1v62f
         xq3Z5ZXc8y9ExWHtDwv9zCJJ/KVaiLcBv/fdcp+WscBkunleIgJXCWElwdnR9RkAZzoT
         wSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=snkgCap2/o+t1vAhQA7ejk+jLYgLsqxsKE9XwxD0MqU=;
        b=L+yNnboVm7XSECJyP++JcwApRHcapl64+s7KHQcaQibQ1zThg60/fdP0fDhHuyZPqj
         4ZXsp4Km+sEByb5j+GQz6s5UTDYOkbENzaogJYcn9LaWlNEm9gmn/S+68K7aNdzD5oA4
         UScsOzqUj5Z2RFThtLeDQUcjx8v1p2H9C3pQhcbPHosdARNBKf5wOJ8UZAIMTJYL+uvH
         Df2psnigXN2g2Wzq1yIDO/w3OU9TQxu6iZxI7ehj5VmJ7DMYOXDzttXeBb77IiSVD8wb
         gtATd/inJwZV81qBu68JEiMIoHfCulU2UoIU300yEYmBF1ynXc93LmMO1bLTRU/m3CpM
         xIGQ==
X-Gm-Message-State: AOAM530k7Ko/683MgaLBzk3ggKBUjADU4fjPMmBLQu5hlMvVpW1+ynse
        xWJFJ3LtpbjJTGXRofhhR4sctQ==
X-Google-Smtp-Source: ABdhPJzqSbuQXY8AuNYnpl2n5dnz/hQsn3pC3iPnUQC9x7lbHbSjxCdLD7wa6cS/YHAbYNLUEZ8q1Q==
X-Received: by 2002:a2e:6e0b:: with SMTP id j11mr9134456ljc.464.1625448318432;
        Sun, 04 Jul 2021 18:25:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 18:25:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 15/22] drm/msm/dpu: simplify DPU_SSPP features checks
Date:   Mon,  5 Jul 2021 04:21:08 +0300
Message-Id: <20210705012115.4179824-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
index 264a9d0d5fca..00098e33391e 100644
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
index 34ecd971cbbb..8ed7b8f0db69 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -983,8 +983,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
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

