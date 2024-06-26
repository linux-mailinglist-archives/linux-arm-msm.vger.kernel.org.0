Return-Path: <linux-arm-msm+bounces-24375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4389199ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACB3A1C2125E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFC2190697;
	Wed, 26 Jun 2024 21:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tfk0DhDL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FF2191476
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 21:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719438367; cv=none; b=AifJspkJlcPAoT9+sD4X2oVhOvOfv7bfBDqFUXv8Bv+M6FctlBROoG47Fen75f60K613wtF1s9HoBrWIoYRWkohGTxeNueyz7ABFEN24KzVN8c7cBKrlRdssZxGrUnlenP2CzWu/Ule0yPVp7uvn++kgMeSJQ6eJiZI9X19B9JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719438367; c=relaxed/simple;
	bh=AABfn+5Wuop9C4JWNFNmkXvAwigJm3H71KL3fIC108U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QzcfadXjImI1XH5cfrEUmn/i0PoHXJ+OCYu0fkZ4kNabvBZ7EXCcsG9LcYSmy0Fvam4HM24OQp3sOyiPsPLHqQFoNuq04ZG6vPs7hFOuzfz0l5v8DbxNI/ZLgNGBMdzbiWj6QhGEOlJSYo6PZYUXK6aigfGJ1CxPpZW7SQumjJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tfk0DhDL; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so83558981fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 14:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719438364; x=1720043164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJ6Ofnj59KCGRdS4jKTFy4IIJWcn+np9cmCpcqde7DA=;
        b=Tfk0DhDLygVFcIGK46HWyPy0W4e1eYg135Es0v17QKfK5NR1e9KgEz19wxS9kXtYVA
         2T554x85LNsAFD8dtzjUfC/kbE+WhMnvnYg2/XePE2RHIPIGZChGGl5ygOVYOvnpjpJR
         FFy0G5bz9PauaBcBWHM5DHkk/JjrqWo9lebsOYPxKgAysei6Yr9m6y3fVy8J7WZoSsSN
         nYTP4Ew0AUF9gYCKfP4ru6bdAZ/slqE98XaiZjwhK7uu96ywQC6CMnG2pP2I++mvCcsq
         rQ3n6TVVSZowndHPc/YCE8T6iwwz+kcgR/JfFg3DyBg+YwzFL2JgvAd0+d4cNRdhVRar
         i9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719438364; x=1720043164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJ6Ofnj59KCGRdS4jKTFy4IIJWcn+np9cmCpcqde7DA=;
        b=BSgJkGOZYdoU5VZ92raOoJVqYn+uCKkL38R7RuUihaBCm+GHd1At4oZFjmoQH0F9rO
         HK+VtlDui4qtgzWrzDwA8qFWynOUoSrNMmrDK6xRbGvMN0ed/L+8GLnWx8xZpVirlsko
         KE/TI6JM+3e2myfF/RmiMXA2aOmvLYcUtIpGN10Qu0/FKndNlDa9jQrwOItZpfkQHlSq
         wWrVeRCKxbRMx/ZqYU1uCSu6gvBBsuT9HnSHGoIlMy5ocDEuWtldLwPysVdCUbwkQYLG
         EiblxvChSNH5ML/nXrCjeFe+aT2Fnw4EtEFvPbcBRvoPBRt8kK3/rCpZS8GyIr8voYKN
         wv2A==
X-Gm-Message-State: AOJu0YwA4jQLtlr56K/HQgtLwt+4bBnHt/kekb97FE4GdfpVwjLHZ4Ef
	hfvsL+D7CzgPLPVmYPEKVedTf8taEgeMNYylk076u2SMeO2BiT7qGLYtGDwU4b4=
X-Google-Smtp-Source: AGHT+IE915cZlH9nn699bYkq4F+smrZwnMAUSpyQaKba2INNBB2cS3+zbtnje0X61BPw/JSw3562AA==
X-Received: by 2002:a2e:3218:0:b0:2ec:55f3:40d with SMTP id 38308e7fff4ca-2ec5b346102mr69215361fa.30.1719438363820;
        Wed, 26 Jun 2024 14:46:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 14:46:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:45:55 +0300
Subject: [PATCH v5 01/12] drm/msm/dpu: limit QCM2290 to RGB formats only
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-1-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AABfn+5Wuop9C4JWNFNmkXvAwigJm3H71KL3fIC108U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwYuYOCQf2HImzQBD039gclCXtQ4YiEg+N93
 3Wd7KLe4NaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGAAKCRCLPIo+Aiko
 1fffB/9KorMTaducYeo1F664LtegB//a9stV/tH9mH/NDSIYmWWPJ9YXsFT2gqxLjyDT4BqDsQT
 6byaCMtuVkc4sv5GWZ5KVzmJ5gKEiB6ionJJ9qeB4cphW7FC1ZnXiTzW+ZOi3dElbqHialO9juO
 SjAynXEHeTCZtxCf0R3td/h4hiD6MaAEmsKdTUpdfZgYVHZAcs3tqCDPT5HlrmcKBsdmwwYcY0H
 SEvg2QSTf3JFVUV0qhJCKXf3Ytfg/KzF+XUsLUPIReTKyjTZbmjcKQoifYaBYNdoLybFTe1IWs0
 5126eGHKCLripRExohwWuUcv5rEA2Ro3zpdgjrOq7UXOLpIQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The QCM2290 doesn't have CSC blocks, so it can not support YUV formats
even on ViG blocks. Fix the formats declared by _VIG_SBLK_NOSCALE().

Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index fc178ec73907..648c8d0a4c36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -308,8 +308,8 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
 	.maxupscale = SSPP_UNITY_SCALE, \
-	.format_list = plane_formats_yuv, \
-	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
+	.format_list = plane_formats, \
+	.num_formats = ARRAY_SIZE(plane_formats), \
 	.virt_format_list = plane_formats, \
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}

-- 
2.39.2


