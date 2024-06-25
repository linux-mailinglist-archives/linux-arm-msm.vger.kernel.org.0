Return-Path: <linux-arm-msm+bounces-24156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B0E9170B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 20:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E75341C24BF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF63B17E91D;
	Tue, 25 Jun 2024 18:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Liz99xOH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317F517D354
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719341691; cv=none; b=ukkG7AqXN62GmqtzkUglkw9tfIGi/7aFTozenhCKL0UWOZEiawNRv2c5YNzZ90kbmKJjDCL1f49YNd7Or8wDunAU2qgLwvCZWKT4d8EURiY8mqo7gcUPHz0yK68CbeKN7IyeYADHxJyqM5JuSms7SDoVLwgkbUuxK/2KO/jJC5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719341691; c=relaxed/simple;
	bh=IqxT/XaY/qre3pbFCzxDe2dM3jXz5RZUhwZonz27NSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MmLmCIYvGdML3HsTr5/hkZ5afNgIvWL8Klrc/fCWJiy4tmBbynr7O/yDlQsmk6s7ydjjaBpBimI6spTh3n1aEMFDQgBO5xsI0RJgsK4yrB/tEh8BnyE99Cf0GURhnNuMM5D3e0Rp4qlD5rrBxCHeuA4MIjxqMlv1/dg88x6+xFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Liz99xOH; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57d457357easo3974891a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 11:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719341688; x=1719946488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RslMOok7+SRb0tZIuuUneQKJy4llxQByohMGQm6a7lg=;
        b=Liz99xOHAAMrYLHy1Hkenqd3auK7yMLH21+J8Clks0u/RxHlVQAkSjaiYW/x910g/j
         QyG5NidzufPcsANnVu78wIG67T+Aq8CJUHPM3Pjck11AjsBZCvvLKtGi3LDgNpp0MkLu
         z9ONgtmkxXGC9OEKs7HY/yjDUCmDScH06vNREym/fwqPvQhZRiw/OYZ/i2ij9U/2gF99
         8rNpB4luyxQCSjH+PgOE63UcuXNR/jVzP77wf9hFJvP7Vvv98Yz25LJ0BJcvabdhyktY
         83cMEfJHBdL+rqRo9sUNkQMzKk7Atb1lAOHybrWpxzZad+HnOzcLqod7KIOJ60rZBK6Q
         KoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719341688; x=1719946488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RslMOok7+SRb0tZIuuUneQKJy4llxQByohMGQm6a7lg=;
        b=slfKvxS0MYmX1XgxiiecynSHwF54Kvjz7klhmyRUiIpTx+xLdGpGqGSRH5Y/+Gij5y
         ai4IXFkbqdVeio/OuzIeecFC0+DKQBVKP3+o7JbHl6gw8A0m1+7c9tMXdw9gItxErqdi
         pT2sIBIZdRMhvLV8vYV3Lpi7tu/A1vCHGEfolzCuKlJ4IiSBqi2FuEOkBLfWlH2O+sfb
         WgUAprtx/xcQRyRx4uB1lAW3Jy+qyU5l5Oghu/lGi8v8X1qpF4u9C/uiT4DLlBFjAYri
         06zw8FHswUOuv/2gopanM/ds42Ba42U4MyI5L2yCwReFdwNc0xemKrr1UK6b3LL3wE3J
         ZMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUifFVwbnxUYaWq5qOd7bdvgQui+ZB3uzSIq2aOiBgCOefCbHi/LckK/hxp+Xow91h8VrO92oQgL3aSJpjQnA3Q1qJECfc0ZCBD6ul+cA==
X-Gm-Message-State: AOJu0Yxwd5RrPH6nkjjZCjhvslIEDZbC1U3E0YNHl+aCBlxLJuWQfpwI
	LN1ieHrJNa1IAQePD2ptxPqSQIUwueWZBiRcHmHBHH2ictQwJgy4RKBUWPmwWAI=
X-Google-Smtp-Source: AGHT+IGgV5XNEHZlscPIUwGZlGHAvsdbFXvfBd3MkXeqG+BdMPDfhtOjj2M3SWB0pI6uYjgg1nm5bQ==
X-Received: by 2002:a50:c343:0:b0:57c:7ce3:6cd9 with SMTP id 4fb4d7f45d1cf-57d4bd8173amr6264270a12.23.1719341688229;
        Tue, 25 Jun 2024 11:54:48 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30583e93sm6206332a12.96.2024.06.25.11.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 11:54:47 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 25 Jun 2024 20:54:42 +0200
Subject: [PATCH v2 2/2] Revert "drm/msm/a6xx: Poll for GBIF unhalt status
 in hw_init"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-adreno_barriers-v2-2-c01f2ef4b62a@linaro.org>
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
In-Reply-To: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719341683; l=1182;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IqxT/XaY/qre3pbFCzxDe2dM3jXz5RZUhwZonz27NSw=;
 b=bf4fOmgiiY9wBmlPLmScoY7M3PVhXAq9z2YI3hCMleizQn83eYlbtCBhdiLjMkanneiBIOPKC
 IrQh0EQxtzKBYdtR/m9m5FMJSE+oheGuEHORh4MyKpSMMYSeCtNfD4f
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Commit c9707bcbd0f3 ("drm/msm/adreno: De-spaghettify the use of memory
barriers") made some fixups relating to write arrival, ensuring that
the GPU's memory interface has *really really really* been told to come
out of reset. That in turn rendered the hacky commit being reverted no
longer necessary.

Get rid of it.

This reverts commit b77532803d11f2b03efab2ebfd8c0061cd7f8b30.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4083d0cad782..03e23eef5126 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -867,10 +867,6 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
 	}
 
-	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
-	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
-		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
-
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))

-- 
2.45.2


