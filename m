Return-Path: <linux-arm-msm+bounces-2953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55777801512
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1059B281508
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD0059B41;
	Fri,  1 Dec 2023 21:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/zjkFit"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0F010DA
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:18:51 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9c5d30b32so34666381fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465530; x=1702070330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fk9k8663Tnf/ZvGnQtLLkkb39J+oGBXyzS7lQqTvGqk=;
        b=K/zjkFitVtvuZwhDLJbjertE/dI6AdDnrXG3qywmLBCSndV0PUX8INSh7aO+u4oA9j
         7d3E7W2lcKihEt15DLDXMN5qQ4LcbSwLBPp1Qkcl2M9qt0RAyjEciAJpUL3o5IA+9Kn/
         IutWJEfQ4Sms62ym3w0wQb7CSGWFubrhicDf7L8zS401oS01zz2c0HAOZIDQzYRX4jw8
         R/5yOz6Bzc6ddy1eYJgoZVtluc07tW7QmlzXK8yf0VPYoTJ7C1lylqwkpS86RDCZsNjv
         KxOBq4FUaPKna4AwY1ANcKNvhwjoCSto8OtJHEKcKqkTtvqlwSpChjjKEEMLiRC2R8Xy
         OWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465530; x=1702070330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fk9k8663Tnf/ZvGnQtLLkkb39J+oGBXyzS7lQqTvGqk=;
        b=Sw0HmBddgnIU2SO+aIgJV7a3yboMvEcvRhfWc1UcDeYfe4o2/jKqzLhIx+8YIW6EAH
         3T0QQ6dxWtMPSXD3Z4v/4MDeagpVb2c6kWXP5xeEGIaE/uh1SXDEFYGIq+rBjKfWP/wZ
         RVy+xOcec91+cgSdP4Xqrzmd+cvjCQwOrKrzODDjDa43asGdphT8SYHlvIOEJK9Te2w6
         zZN7iTaHJzmL4NKxhIL58wVugSCLY5G8lx0/S7VctBpQ1TNIOgPS+Zc4UL6ecaBRrNoS
         xT8FbhMhgSuEW3yQF1raCQ9v3NSgjTTUtzgNjohZ2RM4kybkJ2qHCEPDWfVlzYVEklFO
         P8Wg==
X-Gm-Message-State: AOJu0YzMy8G6m2xBnLWFLzCGkwqq1U9+qNs0leLFtwHgBlQyMKIwXEgl
	xUl2jKzsQjJd76WUFoskOxKw9A==
X-Google-Smtp-Source: AGHT+IHzDXzzn3CUGnmqm3EEyNubJmdY+zXQDz2tcPoGIFER1numZ9HJKPnGcxSjDn2JZogkbdukKg==
X-Received: by 2002:a2e:b522:0:b0:2c9:a9ba:97ec with SMTP id z2-20020a2eb522000000b002c9a9ba97ecmr1044945ljm.38.1701465529933;
        Fri, 01 Dec 2023 13:18:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:18:48 -0800 (PST)
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
	freedreno@lists.freedesktop.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v4 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error handling
Date: Sat,  2 Dec 2023 00:18:34 +0300
Message-Id: <20231201211845.1026967-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
dpu_hw_intr_init() error check.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3b6ed60e1143..8fa1f8f52e70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1150,7 +1150,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
-	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
+	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-- 
2.39.2


