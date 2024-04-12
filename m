Return-Path: <linux-arm-msm+bounces-17318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A12C8A2A36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 11:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A43EA282F26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 09:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31A33C471;
	Fri, 12 Apr 2024 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mzwR1GH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9853E13
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712912013; cv=none; b=AjVaFJtD+NuR5PQKeiKW9i8e89vXkEPQNwSyIyPAO+1BP0t/kC+zAeh3Prmzc1i1ua/EMvemX0lZ+G3qX7K6HmVGe53zrpFKcbvvaySmB0P6YDMM8KSuGzJaA7w/A3k0Vwd7tS2NN/1xZakRcNBCF3YzqLKDK2VUD1oktzZjrKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712912013; c=relaxed/simple;
	bh=IfBjoXvsAqSszVL70UBX9LvJJQbmIVXzQ26EnPnGMSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qdqPKNQ09i9Gs7rtePhGDjfs/6saCSUaO7uY/aTbGma6qqmoKtPsYB0N28Pm75eRWNJqgfVqGoBfzo556c/wJRsqnqOUsbvez1I/7afSTRYIXA7ii2dlb1ABTFuJHeXU4/4bvbcP3/HmNJf6K6CD9EbLsD8TMCKtntszBvomzQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mzwR1GH1; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516a01c8490so1244606e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 01:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712912010; x=1713516810; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YxatRE/93mGsglGJYCl3WbRD1jFFlo897Trav2ySzAI=;
        b=mzwR1GH12OCNt69vs/ntUYZCxC/vqaLcPnGz2xAGWFeo2mlMqy+s1yGQ0FREmwE2Y5
         LGDOrM8VutxC1dPX0Og7D+Cn6pWyiB8hDfnD7mhArmXx24rk+5DhrGfOreaQ2Erv8ske
         xnxj/QrZY02rCKnWgC2JsODysPs3TcqXL9KfiFDXp4BKFqzZ+eqRQuEDrPdC0d8OQv/X
         vfIoGzuFhIe5Nlmvngydrz0S2Vx6YDtTagppotQDZnf1NVY+N0q2lZZDLWF4lWoXyK79
         Qgb1pmxlmtCa2/l3bdrlrZa3Iok0pPdtWGHGm+aFfxJNRr15pgxgplUlwchvIVSc3Lyq
         iWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712912010; x=1713516810;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxatRE/93mGsglGJYCl3WbRD1jFFlo897Trav2ySzAI=;
        b=pfFfD4yp3lFKelOUH0rNzuTDi+hMniBCYLrwgqcNxMkdy/BDNa4s6r8/D2lfZOgUR1
         h3Cw+bHR83bwv7vZhjXRPdADbuLHmq03F5Rj9ELbSeHRhOFCP+tkqvW6pZ15GxR4ysJx
         FfRc7Yu+S4Ae+P5XN14eq2XaWUw+7enbmzl4AxHCPufz/yXQKe+PhsPqmAeIK58LqZUs
         PvrmlIRXVF4FmKN/kJt+qCOM8AxwIPhjEvPjbSExYQWGqOpqULG6oVazygyjwP7dbcw8
         viKGVlvq4lzIdXHrzn17SysveIxUwUKTVX8Ris1eeZJCWCGyS6/7BycGEPDmOnkbfPuZ
         Xbjw==
X-Forwarded-Encrypted: i=1; AJvYcCVvU/3MwYFOJGgB6XZv84o2px9/awxMTzwND3l2MO6G6ycmsyJhhXH7iRHUHqpE4yUV4oGybOdTOUKLNPVFIdSlc4Tv/OssvJ9mgWGeQQ==
X-Gm-Message-State: AOJu0Yz6MSAxnv9SwI8sqW7RaOvjfACM+DDqEW38e0jOAmE80YVPXc+F
	xH3jwtfVRIB2IwzbG5MCXVVJFNnHbMIkcwEJ6ByOIUC/5MjipvKOAo994opUaYE=
X-Google-Smtp-Source: AGHT+IHjgkDtt9V366P7Lg32vys821kGAn+wZ3KJVBrDfDCBQOWLQL30EXbA0v1fE9uOESGSbmyVxw==
X-Received: by 2002:ac2:538c:0:b0:517:30a3:d000 with SMTP id g12-20020ac2538c000000b0051730a3d000mr538477lfh.28.1712912010091;
        Fri, 12 Apr 2024 01:53:30 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-133.pol.akademiki.lublin.pl. [87.246.222.133])
        by smtp.gmail.com with ESMTPSA id u9-20020ac248a9000000b00516cbd3e982sm461779lfg.178.2024.04.12.01.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:53:29 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 12 Apr 2024 10:53:25 +0200
Subject: [PATCH] drm/msm/a6xx: Avoid a nullptr dereference when speedbin
 setting fails
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240412-topic-adreno_nullptr_supphw-v1-1-eb30a1c1292f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIT2GGYC/x3MQQqEMAwAwK9IzltIa734FVlEbdSAtCHVXUH8u
 8XjXOaCTMqUoa0uUPpx5hQL7KeCaR3iQoZDMTh0Hr11Zk/CkxmCUkx9PLZNdu3zIbL+jcUwzk1
 dI3oPZRClmc937773/QDRbrr7bQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

Calling a6xx_destroy() before adreno_gpu_init() leads to a null pointer
dereference on:

msm_gpu_cleanup() : platform_set_drvdata(gpu->pdev, NULL);

as gpu->pdev is only assigned in:

a6xx_gpu_init()
|_ adreno_gpu_init
    |_ msm_gpu_init()

Instead of relying on handwavy null checks down the cleanup chain,
explicitly de-allocate the LLC data and free a6xx_gpu instead.

Fixes: 76efc2453d0e ("drm/msm/gpu: Fix crash during system suspend after unbind")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0674aca0f8a3..d10323f15d40 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -3058,7 +3058,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
 	if (ret) {
-		a6xx_destroy(&(a6xx_gpu->base.base));
+		a6xx_llc_slices_destroy(a6xx_gpu);
+		kfree(a6xx_gpu);
 		return ERR_PTR(ret);
 	}
 

---
base-commit: 2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
change-id: 20240412-topic-adreno_nullptr_supphw-10dbf5330044

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


