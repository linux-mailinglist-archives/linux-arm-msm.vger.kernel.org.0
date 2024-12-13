Return-Path: <linux-arm-msm+bounces-42155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E38699F18E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03385163CDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9801F759C;
	Fri, 13 Dec 2024 22:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VaFnYVZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6A1F757E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128146; cv=none; b=iV1puN3LYoLxOUxudd10eyXFrDOc/1YOVLaXCMltzdOAeyQizkayE/OCJhfcuCFlak7yIlfxfzcnFjbjJJZ2+2NlZNBIB0IoOwLfLr+0HiJcZ/sSpmpuGT8499/rfryBi7dk2LmTHyk0OfRv4T/Rt4Rz7rLdaetIDFyNouOCbUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128146; c=relaxed/simple;
	bh=tPpDxtHO5xmaStginATMqoo8E/aoUokLFeBXLrsaQRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mg9PxWZQFOq80LERllfGcTvnoa0rssJpq6hetz8frUhaX0+TtZ7KDFdZL7nWLMdVl7euwktNrtqFYc6t/S3SIhBR1HcUssQIixEJGtXJaDDpFdljWl0oBDcLNwh4Lyt7bA9L+qwLkugJ/HTBVS5OKQbNnRN22+BNPIGre/tuXbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VaFnYVZf; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3002c324e7eso23637131fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128143; x=1734732943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRIxn4/iOOppm9kbxU+lpuaS0hiTeQ2NsHK0Y4FVJCw=;
        b=VaFnYVZfWGvRsv/1iCUuLV7TcGB2f6CpLyxVWpNcICCvBMB1wMx9DE6q9LiJA+TZht
         l9a8ob5U+V+aRZOJqC5ezUaHIw/3V1dSC2Pbq7BJXAGQpFd3u7Q7epi475xfu6/iZ1jE
         JO88tu33cBmZZt5szZIdZxq6M8uuw5Bpvs3pxFDSXNwi04GO/NPaLBGr3OKs0jEEyYdR
         q2VHMwUWzjClgoMa//dhyevDzG/rF97T6qsl1Ts7PBZVD6/VHLdILa0baGRvYmOUYfRQ
         /pFyIg5Q913m8vQLsV7CB//aNzMMOQ3paRoq4ThUCz9Pww7M/J8RY16VF4DTiRQYr29/
         YJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128143; x=1734732943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRIxn4/iOOppm9kbxU+lpuaS0hiTeQ2NsHK0Y4FVJCw=;
        b=LB/8lzAqJ7dml0Ql0maBar8KI5N/+752XQeclKkZRkqyxnnWYhTuVxgax3TnHVbS7Q
         VLgiZ79Djld114qy0j+eImAn2i60X1Ksp2jQnkftbCCN8dWhvJiIWjeYBv0GrWdFOiQP
         d6sO3wMFxLz9uHfmST6hB9yg5uK2aaQ+uDX6rFxgaDQt80YAHTbwyqzrGS7ubRvGO2D8
         R1anvgm6gRX8e/g2smfdan+0+oxyFq5Yo6Sg9OQrJ7lNxYasAVo9+hhP8OYT4bZjOVKu
         VQV+3HHzuSEG6Uhb8yvj//o6d5JJ4nKkZV1lSKFwdW29GhJ1+xg/LCMxsQCR8NMj3jTh
         2fEA==
X-Gm-Message-State: AOJu0YymUGkVOixWIm8RukD82gMqwnOXlLP77JS5gK4DCoGf6s+XNLhf
	sOg0lOE77Tnbw3XfN+98AfQ44l+4O3BQnXv3UE/MhRXeGiSjqlDgjXhwjx6vNmo=
X-Gm-Gg: ASbGncvDu8hV1Nzj4q2W+UJg1l4Y895ex2RzqIi6f+vuwdmBSzv8PX/WCmddtFj5noi
	9jovcNTFo+wd/iLsbSfi97ucOEX2eEypnXUkdjCPMcoLg3yfpou3Z0VZC+Suf62d9RroHrywpXh
	FqQoBIjAe+Vzhto+FnE8EofjjpNIBrvO1O1xAtHLIlaYw39E50WitPI3kVuMVaaE2a7T4i/eBGQ
	6lQpR9dTF93WdEOPNdgd7TqbIS6ixjC9pn57JbiIu/4z51MPvXEvrvbaYd1gvDg
X-Google-Smtp-Source: AGHT+IEv90YSml1vB3yVi1kVPvZNguaRuGgjlQIsfKSFuZ5C43ynmhkX1erwdxz3oWCyU7cEsZn6Pg==
X-Received: by 2002:a05:651c:555:b0:302:4130:e0c8 with SMTP id 38308e7fff4ca-3025452fd41mr14481201fa.9.1734128142715;
        Fri, 13 Dec 2024 14:15:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:15:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:45 +0200
Subject: [PATCH 29/35] drm/msm/dpu: drop unused MDP TOP features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-29-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tPpDxtHO5xmaStginATMqoo8E/aoUokLFeBXLrsaQRY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHI1qqRYU/devWX2LGbgi3Y5RR0YCZei/GMW
 xIk9YP0h5WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxyAAKCRCLPIo+Aiko
 1QqxB/wMEhSpPsB5KZxkaGmeszgOBFKq7akQyCwt4+s/C9G59XsH4gEnwwcd1ADifNpNtvSdRkH
 2IixA74GQphgxKIuvyMewHXsDwGLRT8cP+xInrKcJ/RKalBN0ngqVPBOWmTBYAVXS9a8lWL/wXC
 Efyo1znRYHKyLLC52N9vsmg+N5CP4gemxvIt7fpg6DjjYPKxBxzJvT9xdNSKevNTm6LrL7mZusI
 LSNNdnHYFe4GX2p7LlPONgFtUPaPEORakAT6AUMA7M6syyWJcSc9dkjtFxpiLZfpNPZWuQi92Kk
 jfwhx/OhhDAy0HWOWyEh/T1yvpw6JaCifZ6zi7C7UXJ4PBV/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e1039b731604ef49958ff158d36e0aef97258ca4..2d7e4bdd84705707198c3b265a003630cbccd28a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5


