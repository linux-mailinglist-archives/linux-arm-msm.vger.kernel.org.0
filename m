Return-Path: <linux-arm-msm+bounces-27811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 817A894640F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 21:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA46BB221AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 19:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A81757EA;
	Fri,  2 Aug 2024 19:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hD0J1vhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D769F6A33A
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Aug 2024 19:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722628063; cv=none; b=YC8T2h+RXd8zAWCwU6dwvT9FRDInzGtl+dqdM0nEvdndZY2tnQjY8q9W0edjFmqDjbrK/SLjkDgsWQiHQ2EYvz6anfLgh/2vJek6mcs/z6uWP4sYt+8laObEKp/x/VLtJyu9M1y6DmHuvXKtYggSrC4Hnej2YSAlzGhG0r7mpK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722628063; c=relaxed/simple;
	bh=2b3yRHs49eX/1vL+P+Me3WH5qiaxmmgj2T78MMKIwZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Std8HhbzF3tkVIMPAfsTGiYD7c56dj8Vx/iHCdoqt+Jh531DtSg3sNPdXyYuCxYLEH47h7djEof4v8R7Is3jmdFHIE/VUBXxq7wnjvq5UsnbYVERYcYHToPH1/plnoyIzYktxM3yQoMKufWX0ujBjNl7xO+iP/0Ry5E1UWd0A8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hD0J1vhX; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so106605541fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Aug 2024 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722628060; x=1723232860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0kj6XTh90iEEbA0uytJvfTg6LVq22XyHCEfhbdwFAc=;
        b=hD0J1vhXM0azhkqLd14g7Bp41kDqZ5PkODfwQNZ3raO1yL7bOscgJdbzfctshB+9b1
         8XglGCNFyeBW56pmLUJD40g6GIjsNdmBaUOJ4MoMLCFilYK6h/Bagn++fDP62t54+Cx0
         Td+5dlcwABSlg5CMzqbhi/Sppa/gPmt0NrnlTfv+lT8czFJ5BQHkvknT6voG+csFD0iJ
         gK+x1U9GIOg1ahqgcrGC3M/Udj0c/9fDODvi6nQprvx8GympNMvOahpL1qLTTiTuGTK2
         qYk/qnGfZSO6EglmJjZmq8X6dXW9P9HrurmuhY9M7jJWAIwXxt5gK4s2WQK6d3cuq8rk
         M97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722628060; x=1723232860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0kj6XTh90iEEbA0uytJvfTg6LVq22XyHCEfhbdwFAc=;
        b=pOKfyR34TeysCHAPVkY+xdOsaJ7gFk4zTq5ZP/HB8Vi1EHpdqSl5y3RjwK2WM1QkGK
         30Z2pGxijG79VajxoWx24L0DflqBv9t40ww+4sjs4xxO/9FlP/4h2MefStdbu1P9a0ES
         W+0RX/iy6usRqfOcnbfd26H4eF8FQRcxpDFOUZ8QivhBqa6WdE4YuHcOzZYyKSlFFQno
         AD7KJu+M01D1GwA/rzWwuDT9R/hw3w4q8pdENF4KyeJd0gwItj3/Qr8BkeFkYGzm/Pu6
         uP9lO6Qpz2vFmLEo1M1zEB2INTFLtvzAH/dfWN66gEcdcErW4eWJYKtchM4Ivx0jhjg+
         QXHA==
X-Gm-Message-State: AOJu0YxDo+v7ESMAJb8zKmBoQiDuqoX/I0AZTMWiiLKJMbXp/VGyEr4i
	dTksXN9Oa2Wva+7/xQbnoXEV76UDooJ9l06WZ4eHcTGkkXxBKEYxejZNnmPp2amnNwzfyR2w/su
	s
X-Google-Smtp-Source: AGHT+IHC5pWQV5sUThqfkpYlt5hVUslppx0/7sOiLjAwX+Cah1N052U8+NZUkk4YN5HoI/4FIhX3ng==
X-Received: by 2002:a2e:9107:0:b0:2ec:57c7:c737 with SMTP id 38308e7fff4ca-2f15ab24bd2mr32139401fa.40.1722628059116;
        Fri, 02 Aug 2024 12:47:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839b2b556sm1440939a12.25.2024.08.02.12.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:47:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 02 Aug 2024 22:47:34 +0300
Subject: [PATCH v2 2/2] drm/msm/dpu: don't play tricks with debug macros
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-dpu-fix-wb-v2-2-7eac9eb8e895@linaro.org>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
In-Reply-To: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2383;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2b3yRHs49eX/1vL+P+Me3WH5qiaxmmgj2T78MMKIwZg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9pa8+s35u2WXFa2pm5rf9vtTZ2JXnH3Zy+0C47kqbxTW
 LSb8ezaTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMRHYRB0NfxVePmPnNa0+1
 pehX92+faVPQribE+KP6RvQjy4ju/SmFXzdu1/T/s5B1Lsc9LpW3gu/iU77+vmUcH361pKREo88
 wNYG9bO33qi/nvDaY7VjK/jTe4d8jh9KUpIyw5Ox4IT8L81WOu7bVbXLZPo2Nxa70YwlT+eWHHQ
 18fa0tcpf4r+ZxR27ZFra8VDVBPuLqsT79cqcvj3Rd64IN/2lvduL+uLko4CPfndhbdelp76ydl
 6p9feAn+UB//6r5Rv2LBYQyPR2kEuu/qDF5TlLt7Zv1IWRig0rH52DrLgV7W+mmpAPdE6dv/TE1
 Lsfw21SrafPiPm/cfdNlpWPndZm5loayJ7MTvpvWKEUDAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

DPU debugging macros need to be converted to a proper drm_debug_*
macros, however this is a going an intrusive patch, not suitable for a
fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
to make sure that DPU debugging messages always end up in the drm debug
messages and are controlled via the usual drm.debug mask.

I don't think that it is a good idea for a generic DPU_DEBUG macro to be
tied to DRM_UT_KMS. It is used to report a debug message from driver, so by
default it should go to the DRM_UT_DRIVER channel. While refactoring
debug macros later on we might end up with particular messages going to
ATOMIC or KMS, but DRIVER should be the default.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index e2adc937ea63..935ff6fd172c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -31,24 +31,14 @@
  * @fmt: Pointer to format string
  */
 #define DPU_DEBUG(fmt, ...)                                                \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_KMS))                         \
-			DRM_DEBUG(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
+	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
 
 /**
  * DPU_DEBUG_DRIVER - macro for hardware driver logging
  * @fmt: Pointer to format string
  */
 #define DPU_DEBUG_DRIVER(fmt, ...)                                         \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
-			DRM_ERROR(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
+	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
 
 #define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
 #define DPU_ERROR_RATELIMITED(fmt, ...) pr_err_ratelimited("[dpu error]" fmt, ##__VA_ARGS__)

-- 
2.39.2


