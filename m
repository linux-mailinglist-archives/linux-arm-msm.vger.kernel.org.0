Return-Path: <linux-arm-msm+bounces-42127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E39F1869
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A8E87A05F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5201990D9;
	Fri, 13 Dec 2024 22:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXYDb01w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71E1196D90
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128082; cv=none; b=D/Xlovs1jMHEWpf4/U4FUO6Q1xffPSOLdpVkkd1A9BdomDxb8wddVcjaMlJFB10nIRc3DWe8gQgFJrs9TfXyZR2jGE7RIgKGXiq8dVA5b+bBDkn/0xUZ2StHDoA1m4rLMRO9PU74jR7NuzmV9WE1nd2daZ+L93yTqGzmGxGW8U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128082; c=relaxed/simple;
	bh=SSoEgRXQqPTu5p08nib3mD4yIJvnsbCBVcW8GugolsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUqjjGzTfh0N13yFvqiubADfhGzgyIn8bwRHwQQHMjTNwI16WDeKboqUU+dTBSbWiqv9Y0PThEiU/S8HKfdoCI+O8gwXkQ+deFZs0wWp8G9eSYnBJfrGEm45ap5o5unMwOzZE8PEni4+CkBJQqE4s69cHpbEz6/KLeKTK88pfSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UXYDb01w; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so22161121fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128079; x=1734732879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVFn/1aPfVa0xohd3oPORN+C+aZ2lVwC2QbDNFvd/gM=;
        b=UXYDb01wYZeUKg3uI1DLoZMGmKBTGrRc+ucroujJh+HbrGLxy1usU/gZdyKV4lCD6v
         K2xGdnUhpRCY6PKwRFpfXp0OHpohGQa6ve98mD2jgAAhdai/xk0y0TWt/fBclwuyICXS
         nV+AVY5k6p0W4jpTASfFAau45B61UxLuZR6mMz+2nZonZWapX6LGUOjl9c5WSYYKTJav
         cDUi1MYcfX9ff9ooYWqaLW8Ba0m4e9xbvrj+WKFwWvrA1I+SC3CMVFNLhiz7VKSMsmiw
         v+VTsh7OvbZHnmycOWRUB0g+xZnlI4awdGPOYozmrEBZ1a5it7yAFU+9i+kNXH2jwYVk
         /scQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128079; x=1734732879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVFn/1aPfVa0xohd3oPORN+C+aZ2lVwC2QbDNFvd/gM=;
        b=DtfnzfgzX20hi55pBK9eZOfI2PoMa8m/tNBGB/LuKZ/GpD4W0rChYPqbrdSuJnnNVK
         TYYEeWh4bmvAEMfr0ZzuhAAiIBZ70G+jWBKUY1WrmlLF7qyEPqq7jASRa7rX0Wfy1bdw
         Ms8W+aTrPQTUnPfNeEKhhSlqW6qWz3mHwOVCDDCNzkt5vLmBV9b2rxa9rjvbNE3XmCVx
         BpCW5KMngNhXNP57lPJRonRADnF75wCxv8XhJik3cnXpmxqqF6y0vEas51TmNJjggZwv
         gH9iz/Gt7RK/GZtCluG5GQvKdj7OZOAtCLgTv1YXEq+zKXwKYR0J3+LOtSWATzoGy8zX
         synA==
X-Gm-Message-State: AOJu0YwOwP6lO1i5GJnf2Aqi/Goe3MCMH57s2yJLzZFEEiqiAWY7GEsC
	j/gUW7v1PYzMnzERM5gRWpg/t5Vn/pU9Q/rE7NY2IXfrLTRh7ohjshvmHfHfWpM=
X-Gm-Gg: ASbGncuTHkJhtzNyeVmP1sUlD5/sLjxEEryuRarVMFlcti7XtSDpXxlXyAaM2tJh9NK
	K7uE5949eYVlv+A2x6GHsVQzn2Z9YIvW+j3g2M5UuYl89X2tQAs/uygOYCUXUecA6GZIRoBcQpy
	LHFT/CGJSAxFnBawwQRHFihUyCylhFlLPinRjzrHaMICQtGG9yeuAMfhB46BFTE8dpMPBpWZYzQ
	l3jNSnBEJeC2yvQQHBz77G+g7s9SBeYwhVYVW4dKpZvDNuc+Nxz0vkNwBnO8BIs
X-Google-Smtp-Source: AGHT+IG8lJ+VBbBY5aElheNBUlAYaHKjDoU3TNCRY+zalc99ZsPdgyXW7wc5QMb+m4C+7pM7pxP3jQ==
X-Received: by 2002:a05:651c:2122:b0:300:1de5:59e3 with SMTP id 38308e7fff4ca-30254521ed0mr15390361fa.2.1734128078843;
        Fri, 13 Dec 2024 14:14:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:14:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:17 +0200
Subject: [PATCH 01/35] drm/msm/dpu: skip watchdog timer programming through
 TOP on >= SM8450
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-1-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SSoEgRXQqPTu5p08nib3mD4yIJvnsbCBVcW8GugolsA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHDuG2EjdhHOBPkHxC0zhd1zmAgAkeMlsl0y
 HEIxujd9LmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxwwAKCRCLPIo+Aiko
 1ca6B/0QhUWfX4o6FGB6/wC8f9qD66NrrbygcsESqL3hkFzoHj7UTCsyHbRFtOWSfdS0hfyZuX1
 GfTtmJhYsXRWpL4tunRfumHAQzjMHmSh9yMTJhYp5pp6B7HNyrrqsUXNXA3fz72VuLuM/H9EKIK
 0tOWkaHD/GkP98ElSLtlARGjp22KldlJaxUMs8c2BazBAQTqc/1QnBiGCvA+PGcUqCanFBdQcDu
 JVkajnKxrnO6NwA2yNPp7hlx6CqKii6KHVEoZRNNlSp7UMC/Nxv2e0vccjJIMGVG61WeJG0BgTQ
 t1fH8QxxhsTfgBqSakPERtMLor/slUcv+jHYHY0xZv9+O161
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SM8450 and later chips have DPU_MDP_PERIPH_0_REMOVED feature bit
set, which means that those platforms have dropped some of the
registers, including the WD TIMER-related ones. Stop providing the
callback to program WD timer on those platforms.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index ad19330de61abd66762671cf253276695b303b32..562a3f4c5238a3ad6c8c1fa4d285b9165ada3cfd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -272,7 +272,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 
 	if (cap & BIT(DPU_MDP_VSYNC_SEL))
 		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
-	else
+	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
 		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
 
 	ops->get_safe_status = dpu_hw_get_safe_status;

-- 
2.39.5


