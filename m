Return-Path: <linux-arm-msm+bounces-24272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBF291807B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 14:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F1A71C21A7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 12:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2851180A6A;
	Wed, 26 Jun 2024 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rPyMt2ql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F3B15A856
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719403466; cv=none; b=BTbwMP38Evjs/gbV5Sv4pIymuiHb5IwO7VDDdhmrWOcE2WPWfzL4bVVTDK8YL3XygforEdvTRjDEZdwNpr+6C6NG0Vpk1Wh6Y7ZMLlQCfwZQZlSE+j8S9Cg/cucpWlqfVVJ3i/L4ogN2E5OhvCeHQacO3XSelOkrmOzCYLx1kZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719403466; c=relaxed/simple;
	bh=NShwTxi1NizSB5J2lYMbBw9A3FYxZdZB1fFQd1dnqHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NKc+6UwKls9laeRCWIbwH5WCIxwMCADge8Oh6F2+Wt2ZX5iW3ZWTqwVCCJ5BqfOOEe54d/6uQn4qDf9sJFhyxC7Gy679PN7Ib77xvsj9A56wBMDQA2nT+cRBuJPnmNZoibH2GYdH1QqVt9WpBfp4g1xT+F5ov2VONBzfbUnDQp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rPyMt2ql; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-363826fbcdeso4835678f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719403463; x=1720008263; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S5OkAuV6GjNT0GJiinYK+CAJG5PBDmAjbuPgVCrya8A=;
        b=rPyMt2qlrmytMptXwIC/qM2L+Gfz4liWHl8VOJQYQjo1t9xJPxr1Oj1+DasgfNfBzH
         umYc20LlV4mb49i+MhklrdOj7nanwuGsfJFOvpb2hw0Dy57V70wMtQxxMh4X9eCGtnGM
         4uagAE3ipwGikt43EQ+WZ3L9baFK+MRgdPdD+gwAQh3YB2mEZyN4sAGRw9vIkAjQKzix
         00MbxzVuiczEJeqo0Go4LIwCQxaDGVIiLVv8hJ6s77cPZJtmuYyEfGFiqSVrurVwmY2E
         sHNjWXcF2k1HVVIGz1YnkqyOhj9Qs/4LlafSAjFhD3AOuCUpKX+VrV2uKzFFw/BjaoYr
         4fwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719403463; x=1720008263;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5OkAuV6GjNT0GJiinYK+CAJG5PBDmAjbuPgVCrya8A=;
        b=kZ3jJm4VOfeWAXCNUytxq/KoS83NQ17bKg6ONIA/2kEpYpOIMecmn60Fo5TcJ1xAZ9
         U310Unyn8eo8jptyWM0sr5gPAHINbjaYsobTCIYLThosyhuPbWgX8zHknN2wksG6nfPj
         ru8Z/PlxJ84ZrQQM8wsbgHQ2qUrq3YCbXvaF9SFId4oy6UE+pz41O2137Q2M2JXsYIRM
         5MhvBZfBmcO4vP8qLAk/K8duy33TLnC2o71hzpGWFjk4BMhXdNxKaO1wXvnIiEYLKGpk
         PATmSICnHOXSPxhiNttuXKgTGXyyYYIR8EJc1mY6VrYJ7NlWC4HkoFES05UG3pRpfuPP
         s+kA==
X-Forwarded-Encrypted: i=1; AJvYcCVNE6M2x6cgD4sBXamSKheidMuV5XsN2eROu8c6kHChuFqTq4G8wYV+12rOEgsShhs/s0dT0jo2WKUBt9/wALw+6q865MBudut4I7hPyg==
X-Gm-Message-State: AOJu0YyrH9UmNgoUkxV/1zWWohsuv/CnS3qk9Do7rdBdgvKd/AgYlahB
	ixK6/M59LABolb93cTjfhmFcDG0nuicluttFg/Uqeys+sLDgIiz8CvgCtCQgOAw=
X-Google-Smtp-Source: AGHT+IFofuWPHs71z2hIu/xW4I5gmoosBF5u/UMGizJGu3JczUVUDZ4AZKljl7/y0pKzCMg/Fc27TA==
X-Received: by 2002:a5d:4bd0:0:b0:366:57cf:9aef with SMTP id ffacd0b85a97d-366e79fdfe0mr6947404f8f.16.1719403462703;
        Wed, 26 Jun 2024 05:04:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f65bcsm15501250f8f.13.2024.06.26.05.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 05:04:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 26 Jun 2024 14:04:21 +0200
Subject: [PATCH] drm/msm/adreno: fix a743 and a740 cx mem init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-topic-sm8x50-upstream-fix-a730-a730-gpu-raytracing-init-v1-1-fd7e94694ab9@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMQDfGYC/yWNSwrDMAwFrxK0rsB1XPdzldCFsJVUizhGdkpKy
 N1r2s3ALOa9HQqrcIFHt4PyW4osqcn51EF4UZoYJTYHa6wz3nqsS5aAZb5tF4NrLlWZZhxlQ7r
 25o8pr6j0qUpB0oSSpKLzFPrRhRjtHdp6Vm7R73l4HscXaFm+ZIkAAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=NShwTxi1NizSB5J2lYMbBw9A3FYxZdZB1fFQd1dnqHI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmfAPF/USzqFEUMCTCOPVaQ2FIK5s9t5J44UA/tkG+
 9QLDwb6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnwDxQAKCRB33NvayMhJ0YN+D/
 4i+u5rkLI0HH83ShHvENG+dAJ9T8e49pHYbkQ0TNiEYOc61sjxW7cbPcRcNVTOxf2n6FqJ1do34V8e
 trKBX76SLTaEmLsNUUO3ybGQQsiM2QTsNIZWmttWLm1wUy4kJvsmhZFM6NUs63ZjSqgL4z00mXUUMc
 jNW9RWStIOOxpTqI5frp/LPAMIieWWymwrc2eUYf2HIk2g24zB8OOnDj61bU54U9+dnh6WBA13rdQz
 VR8HxXZDjzx0vR68J3q7RfrU31ugtizduL1qgITP7khSu/LGu/bZKVB9ZyCYiC35Seww+6l+1OfxN+
 6gZHXECKhmz47lgBIV5M0Hih0aLuyZGfzgxCjOpOPxfkw8C0n+Q9kCAWbGwGeDRzzlj9g7Yb8Nd54Z
 Ppl0nluf6k1WR4dMe+1T4ZXxMLBGDFInhJhx2oVsAn7YDmdtxlzaKsckpnKw+cTk0riphqYLCccnqh
 kJOE1ZXI6ILZ0s5RLq1Ux4fiiIJ9rqyB9Q1/NANCgaSUervRLv1OpqDtk0idcHdE5X8tkaq5RzOnfE
 11GDDflsQzPP1sbynPADXGbK6mVzxpR3dn2IQEqmUbnrF54HvMFFR92rnXR2DLy0D3np2aX/lwwcHR
 MLNrGgOSQ0Cjq2XnQLG15pjtjJTodefru5tJ/l+S7KOvOLqFPrREY7+oA65Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Disable the call to qcom_scm_gpu_init_regs() for a730 and a740
after init failures on the HDK8550 and HDK8450 platforms:
msm_dpu ae01000.display-controller: failed to load adreno gpu
msm_dpu ae01000.display-controller: failed to bind 3d00000.gpu (ops a3xx_ops [msm]): -5
msm_dpu ae01000.display-controller: adev bind failed: -5

While debugging, it happens the call to:
qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ)
returns -5 and makes the gpu fail to initialize.

Remove the scm call since it's not done downstream either and
works fine without.

Fixes: 14b27d5df3ea ("drm/msm/a7xx: Initialize a750 "software fuse"")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c98cdb1e9326..3ba45b804983 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1741,14 +1741,9 @@ static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
 					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
 		adreno_gpu->has_ray_tracing =
 			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
-	} else {
-		if (adreno_is_a740(adreno_gpu)) {
-			/* Raytracing is always enabled on a740 */
-			adreno_gpu->has_ray_tracing = true;
-		}
-
-		if (qcom_scm_is_available())
-			return qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ);
+	} else if (adreno_is_a740(adreno_gpu)) {
+		/* Raytracing is always enabled on a740 */
+		adreno_gpu->has_ray_tracing = true;
 	}
 
 	return 0;

---
base-commit: 62c97045b8f720c2eac807a5f38e26c9ed512371
change-id: 20240626-topic-sm8x50-upstream-fix-a730-a730-gpu-raytracing-init-46ac3f4cdd29

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


