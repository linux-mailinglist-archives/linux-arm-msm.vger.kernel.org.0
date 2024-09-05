Return-Path: <linux-arm-msm+bounces-30822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B68996CD34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F9291C223E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 03:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80F314900B;
	Thu,  5 Sep 2024 03:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ONAOyL+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F2913DDDF
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 03:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725506780; cv=none; b=ZdW7I6ekP8E5sm/+YzMmDfl1VKt6Rni8cE06Z7FBZeK9uheMMbRxq/JzWAySvtgkl9Z2UkmYl27m+XgZ/qVam8IUUiuIYanTAYxcxIlzqEzz5Exp3V1alZm0zE0G6vHabUBvbddsmDsGvCB8iDJ2GydoMHZezU2tP1HWndkzuic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725506780; c=relaxed/simple;
	bh=BZ5PHJUN7Hor8+JpllFkfczVxdddQUUnZGIyXKGk8aU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f6Dni7CiTWq8288cNTEbOBZEdcxJzxyNuh3ancb1y0b6in7PBQDHum2Bxt9MFN0sYdazFafGsPT/EqH6HYNGzODAyNXOr8tv8/TxV4MXVHQV/H5jDjS/pSE4q51DTCrHennSgMu/DpdLLRotl+W+YJDt6N8lehF3XryEqbTkv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ONAOyL+I; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5343e75c642so227772e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 20:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725506776; x=1726111576; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7Kwe86N9nHvE2bdTSgvVMB4M3NfN+siKz0Ithbz+ZI=;
        b=ONAOyL+I1vIc4RxWNY5sgw87FIaOk7TpshzY5hp45W6Mm1T8ZJeWVLx0yPad+6Hfma
         hCjnNTwj3bQW/PiMtfnp2ESZ8mtOUM/hthKs2u/hxWpU7RRgyrPOzgjJac73hADUf1iE
         Rjk/3NmlDeHuFTxYJHHUPGJ5JTdCenW6Z7xOIpRfRkHr93v9w8bujByN8SRXzRkPt+u5
         C/KQbu//YMghPMuV6r+n4pPG9ZHIIqsVOzIq1cup9p5Q2nvhbJXPr31D8aiR5PjKnEvR
         2SWDCq6UXeTXTzoiWg0ToORbHq10ZM2jWKRrGYmUTywP6qwF+aQf0n3KJI/ofC1Dc3Tp
         zcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725506776; x=1726111576;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7Kwe86N9nHvE2bdTSgvVMB4M3NfN+siKz0Ithbz+ZI=;
        b=QrIILquiX9uoQQEU2L3675I3n+QkAMMkCrz8PzCqipFJbPWDlpseRImCj8IyhU27KQ
         7s4X86WhINJg5GfGtCljNArlyfRuKvgX++vQomLzflCriYQB/GVXNiELr6fXP4I4xSq2
         CZBmELljtGjmiXg4AWTo1I02euRWvpewCJdwKTkwFuyT3OL5zz0a5hPN8KDh+OU3Bgy6
         Y7ka9Sr5PPoXm3PHvaFTC1X9I8P/cEiSIH1ZBSNN0/SQcYwO3l8ld3bjx6jA6OMrp8pF
         HIa+g1eiu4t1Bc+R2EXINpy7VXaUFSbrTT8zQ0UU2j2XTW6UUI/z3vfLZL03GT8tLpWy
         ANFg==
X-Gm-Message-State: AOJu0YzngM3Zsw9s4EACEhGRsR6dVn6Synlj6Q9thA3xlrrEMSE8JiCF
	FM1LIbYebIKFsufFuMPDqn4xKyeSvk9EUnNG19ldmU8zGWXism/jPCYqHKE6hn4=
X-Google-Smtp-Source: AGHT+IEd71q7rgbecU7t0vjYUoea6y0Uwtg+9mihNSR1M1wolmrI75YQVKcYPsBu1XiNVXMZS24V6g==
X-Received: by 2002:a05:6512:2814:b0:530:dab8:7dde with SMTP id 2adb3069b0e04-53546b451b4mr11950730e87.34.1725506775783;
        Wed, 04 Sep 2024 20:26:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540841a3csm2533860e87.226.2024.09.04.20.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 20:26:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] drm/msm/dpu: catalog fixes for SDM845 / MSM8998
Date: Thu, 05 Sep 2024 06:26:12 +0300
Message-Id: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQk2WYC/x2MSQqAMAwAvyI5G6glYvUr4qG2UQNutCqC+HeLx
 4GZeSByEI7QZA8EviTKtiYo8gzcZNeRUXxi0EqTqhWh308c5MboF0MlOnvYeRtRm8pZ6iutyEC
 K98DJ+sdt974fNtpQVGgAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Archit Taneja <architt@codeaurora.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=721;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BZ5PHJUN7Hor8+JpllFkfczVxdddQUUnZGIyXKGk8aU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm2STW/EY3pdZ+8DlzkFSokoN8pS7Iot0QDch+I
 uXW05aaj22JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtkk1gAKCRCLPIo+Aiko
 1WjFB/0eAJYyhERs0dG0kbpoFycXpnsaxRH5nzOGVfuBGt9fw4/AwImtD+fmGsFvVh3XH/rr3bR
 iE1DNaeyCRiOUuIrgaPMXljb7w46g8wwa+a+Ulgixfjs2yUxnLT2YTxDtGJk5RCLu8nGWgfnFBe
 QIwF+Wn9q0hk/M3ko8qgSEeh8qG1cMcLvkToTrO7h0SzQfTAJb1dbcD0e/KPeSyo8NP9QxaKmBN
 bte/3bMbM04EUUsIlz5JXu2Sx7N9Y2706GO2mInj0vgZ0cBlGSnTeExO92nCV+P8EifpbVd0XS2
 lDl5adPlggkzgWQX4ZybCYQgfDD0r2SNY/vIpxD1AiiNJGLA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop two extra blocks that sneaked into SDM845 and MSM8998 catalog
declarations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      drm/msm/dpu: on SDM845 move DSPP_3 to LM_5 block
      drm/msm/dpu: drop LM_3 / LM_4 on SDM845
      drm/msm/dpu: drop LM_3 / LM_4 on MSM8998

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 14 +-------------
 2 files changed, 1 insertion(+), 25 deletions(-)
---
base-commit: 15302579373ed2c8ada629e9e7bcf9569393a48d
change-id: 20240904-dpu-fix-sdm845-catalog-287ca4b72048

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


