Return-Path: <linux-arm-msm+bounces-26616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE73193765F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 12:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B2AB1C20B68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 10:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B572C697;
	Fri, 19 Jul 2024 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GHy4nE5O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF057CBC
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721383430; cv=none; b=oOZXK73mGHgl4YSP8ZkZWGKU2xN67w/qarvsCeSH3AxPJFrsQ3x75YHcefeDOTCqUk/QIw/3Mj8L4SWUNAAWCBZPC+Ed8ANVLaUzFGETZQbJZWRfybliss1/WfVa1tQ5WyiJAnrINWl/Ju8b+x/t27o7hQl3J0r/opy6j8MQ4RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721383430; c=relaxed/simple;
	bh=izI20aXStgBYgn8HFsWluR+V7mVSO1GycmUKfkzqj9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxq5kdKJbYNxDgjuYa1Wb3XwURXlvWX6/eDTjOUFUbsB/s/NO8+pdgg/8/sC/8J75zfMJN2Eu/86sXV1DxPCb+Qf3fVNZ2/h+t6HD7iU+qTnPNLPixcmZcG07UV57uVvycMFRnL051CrXX4F2tdEvJwsEoMPGQnSS8EsnuzM5rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GHy4nE5O; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-595856e2336so1211099a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 03:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721383427; x=1721988227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dojm5EDomrVj4JUg8oRrMk9Vwo9o7S9xTIkhL5loo68=;
        b=GHy4nE5OhEWAPohbPR2w9rd5+p4xQpBCAC6BH6eGuikYwu8dggXSLj89v3e2YIUk1g
         gVpJx2aBHk8O0OWCyVdYJDyCAz0K24qKkS6wg21IO965xM6GvPxjz4gpGExGiPnKNXAQ
         /IIum1GSoTkijtICrXbNtMy4f3/nJmNHAXCiCjP7KHzVZm8DUbBx4aBoX4cp40zakKzv
         w15hQzUHiWqiPY3O976SCISbNp2XNV/QmLbV8Wr/LpFhDUAwEm405Kn4KULQAIkRGP64
         RYNNgPZ1Fcug9BYuPPW/4kiHx8frLGiC3HmWcbgpa6ed+LVQ60NzouXMu8C/uNVui3aX
         7W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721383427; x=1721988227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dojm5EDomrVj4JUg8oRrMk9Vwo9o7S9xTIkhL5loo68=;
        b=heeBKS9ROA/eHY4B4Jl7eLLQKHRLoNQcx7J/rPH89djAsI12RmL1UwryeqCGr1Nm7s
         JqcmlvL8Y5LpC+SXNefzQ2TU/BFB1V6sO74twsu+1F3Qee92W/iqNbZRr6jS5e8wZtl2
         MQGzzHSCG+2OSpnpCjshOeV3gSe+N478jcFnXvsWWnXL1XPPl9sXxQQ9Yt9jyKSLddDc
         xjdDoYMdjaUrPZGvtRMF590wkyujhzFJBdde1M71H3eF4eHfz8MNMRR9dESrC/n+D6xW
         rXmHUNV+td949euLWwzOwqIrbIhKOFi4lsbnhABW+Yt/BjCqm+o23PwreIKJDiMjHk49
         4XEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWamXSCG5bh2imcUr0zrWeHF/LsmOBcS7C5TtBr4iEIlmbi1ojqrSRZT27uyJdJYNyIABOYXxaulXv87FnT1W+H5alR635OL+OoOTNVPA==
X-Gm-Message-State: AOJu0YxC1P7Iz7wRderMqYRWUuop02Yz4dMMdqjuVwCWZFpjAuXcAsob
	3XJg7zvslO4SLJPl481gsKHCnwCyW/lwkHHFPyH6p+r6EA9aPsL9WImsdKGBiOc=
X-Google-Smtp-Source: AGHT+IHnaB5YdD3StKR6m9it2+rtNPUKChRJh+O3ecDwUr1Ack0r/lnJpwK4dkqjy3s6ITmXYoebTw==
X-Received: by 2002:a50:9e48:0:b0:595:7779:1f7 with SMTP id 4fb4d7f45d1cf-5a2ccb8bdf3mr1754758a12.16.1721383416050;
        Fri, 19 Jul 2024 03:03:36 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30aaa31e0sm919984a12.27.2024.07.19.03.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 03:03:35 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 Jul 2024 12:03:26 +0200
Subject: [PATCH 1/5] drm/msm/a6xx: Evaluate adreno_is_a650_family in
 pdc_in_aop check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-topic-a621-v1-1-850ae5307cf4@linaro.org>
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
In-Reply-To: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721383413; l=964;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=izI20aXStgBYgn8HFsWluR+V7mVSO1GycmUKfkzqj9I=;
 b=4Q/jMz+9CswuFRv6acP1RY9tHUiRpIOJBCeen/F6KQA41/eIu08K7TMuJQrwSwDqO5uw7BRm9
 i12P5Z1JgGGC2fg2e+RX3bB30UnoccG/A3D+PWnO/kTtwJ6ReTHc+vG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

A650 family includes A660 family (they've got a big family), A650
itself, and some more A6XX_GEN3 SKUs, all of which should fall into
the same branch of the if-condition. Simplify that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index cb538a262d1c..6f168f1f32d8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -525,8 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	if (IS_ERR(pdcptr))
 		goto err;
 
-	if (adreno_is_a650(adreno_gpu) ||
-	    adreno_is_a660_family(adreno_gpu) ||
+	if (adreno_is_a650_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu))
 		pdc_in_aop = true;
 	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640_family(adreno_gpu))

-- 
2.45.2


