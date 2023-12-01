Return-Path: <linux-arm-msm+bounces-3003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 543C98017ED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 00:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2DC31F21118
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 23:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C404B5A7;
	Fri,  1 Dec 2023 23:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vMpPD7IQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E411B3
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 15:42:45 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50bdec453c8so1052301e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 15:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701474163; x=1702078963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWcZZZAaGrmzvhIYGr1F8oij9MQJmBLTfcfgS98wZVo=;
        b=vMpPD7IQ8BJ1IUmqrgfPlTbHD46wRp6HROTjBLL1qyVvP9bGYH9Wxaadyu66JUCRn9
         efdWQ279RmipB0fvzRQjN3aOEpsGri5bgq6moZUnZ6zZXv8n29+mb1Wlju5jUVa1Z9/J
         S7YLl0cIQfEyey+51AopcFppqH14yg2ddVDvJ8uNzSYr0qFS9vQEgQX3M7t8vpEHQtNq
         lJb5i3SYR4YqL5KoO0UpzS57zZx6n4kc6Ea/U3wKOqmQ90AzCiUCgxBmH5AQKw0jpWvF
         HYQwJau40yert4zRoG3URjV1sV8EW3pyjYKLo9yr9FsGcEwl5tlINTifTZIZBd8MNpTM
         zFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474163; x=1702078963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWcZZZAaGrmzvhIYGr1F8oij9MQJmBLTfcfgS98wZVo=;
        b=c1ffjT9FVKVUdCg2Xxhq4ldyQO534PyljljxHC1E3inYNEKgm/DlgHpfnFz3KxOoHJ
         vJWbgnBxog5OijVrGwBDDxXK9eO/03wid2/7r0fI5pWytvRBIru4TLwAscIh2e3nlzO1
         tHaA5HUDfYN2wQMCq5QW6XxJ/+anntOS/IYzWHYHA8Nt8dlKWv7U6JuFL2mHrFZyLzFH
         PIfyoix7oB7D5lV32REMymcKgD3Ixg5QdiNQWLDXJsG21mCZ6/qRqpTATq0pDQZBK02G
         IyQwqLsubjRyfP+BNMEFSjIivqAz4I9/rsWGb/7aXpXtJGV2qkF6H2HBJ88llQfAY2g4
         TLOA==
X-Gm-Message-State: AOJu0YyjOpFlbBoO9r30r0sgdW4/xujY8pa+5KJ+SnpDuj1mcoVnLDKP
	T0uoBM76SQn30JtKODPJs4VbCQ==
X-Google-Smtp-Source: AGHT+IGuHbWtcV6h3RLPBYHPz4BTUGiDv4nga2VRf9sWBh7RwhqggfpSd38x4ifjJPXxidUuvtacAA==
X-Received: by 2002:ac2:4f05:0:b0:50b:d764:6ec4 with SMTP id k5-20020ac24f05000000b0050bd7646ec4mr1940437lfr.116.1701474163526;
        Fri, 01 Dec 2023 15:42:43 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m14-20020a056512358e00b0050803043fc6sm554248lfr.265.2023.12.01.15.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 15:42:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v7 08/10] drm/msm/dpu: rewrite scaler and CSC presense checks
Date: Sat,  2 Dec 2023 01:40:32 +0200
Message-ID: <20231201234234.2065610-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
References: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to check whether the SSPP block has scaler and CSC subblocks
the funcion dpu_plane_atomic_check_pipe() uses macros which enumerate
all possible scaler and CSC features. Replace those checks with the
scaler and CSC subblock length checks in order to be able to drop those
two macros.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 ++--
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index b094ea23ad32..28e7d53bd191 100644
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
index 3eef5e025e12..121cb0d290ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -774,8 +774,8 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
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
2.42.0


