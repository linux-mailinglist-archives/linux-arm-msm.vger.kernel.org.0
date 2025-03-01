Return-Path: <linux-arm-msm+bounces-49905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9BEA4A9FD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 10:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88DF43BAD40
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 09:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547121D63DA;
	Sat,  1 Mar 2025 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MP/oQIyq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8571D5CF9
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Mar 2025 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740821108; cv=none; b=cgh8OsDy3OOAcBxDdLGDeAqZc5ZNAZApd0Zhs/bLhLgd/Ss+cANQd9FkwDL7lrSVtPBhwlsXNMxWhm1jwuE8X3GsBQpzz17fKY3jfJw7gS8MF6+I/wKlomvMtQzCXcAbsENs34J6MrCgXl/L5WzhRSGJWVLI4EF+JYibBiw77do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740821108; c=relaxed/simple;
	bh=MfIfb1GLue9MerIIR2rhWjY6rmZBoFPVe5vbiAysvVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dxNXnabo/RANTVuEoP8ob5trY660y5M41LQS1Oc/8t0f0gngXrUM4PTjBsE20d1aEx6Vl5Q8qVqEpe4nmEgw2nGGGkCQejwVBBiTWjvG/pPi5Mm02ggqYDChDEi64A9BtIZEaClZIe+virPXCByInNYtJT11gR+KAMgCw7vdMe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MP/oQIyq; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a59so32836921fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Mar 2025 01:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740821104; x=1741425904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5L/pucqd7w1XEPp1X1sTPz+Fsqhsm/pl7T20lV9Gm8=;
        b=MP/oQIyquOx26Q21G81qpr+vaZGzVIX+MQ4sXIZjY3L6JjhzZiXQDID5dXLjP4h5mS
         mfQ/BaC7lcVm9DD2SR0cLHbo45FlMYnDulKravts6Oslzr4LvCzrhThIuvHXwlkLaEXC
         EN8U/Nr3YDowkHz+5oyAGEMMQ+uPiYQ/tFGKxiXtEijN4mAAvp5DoccbMqaRRqy023Bl
         bib4GI/iCJNniG6WyfROPrNRUtdYHCplv1oS0F8upMFigPQ5FOsXv4Hz7vbolbNaK2AU
         1MRBOnvk2KyXwEykpIoUNTvpUcVxxk8M/wh79R9T079/v8XrMPhJzXoLD4Q+Xg+d5yok
         nMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740821104; x=1741425904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5L/pucqd7w1XEPp1X1sTPz+Fsqhsm/pl7T20lV9Gm8=;
        b=n9thRYc2cJUsle8w5H4lJ4z0qVowuOfowGPDoLf+c5v3GRd5q9V2ATx/kVaIUwu/bI
         4UJMbOII3MWzjHeVX4HRkZ5DTvZgLC8TjH0FrhNugUn5ArdIdkpE0hV0AgocD19GLjxl
         VD9U6PaBhb8eRW3A4DqPPkpdEW6rB0atzCG66wTZqVuUmIjumvT1hBzvaK71JFe5TE6k
         aTGPla2pmi4sQoM9wQo+lRY4v8GltC24WvlLfixKotitF46JRtHC/6r7c0/0vMXrMYJO
         anTCjmzPNY/SxBH4c3EdLgQDDaDgEY3BuyXT78kJOJGKqZt7EyHQNLC+U0LbzNaIVuZS
         /D3g==
X-Gm-Message-State: AOJu0Yw0p5U711+CAKCm8supW1xuXzKZlS5UV1uZdlQUnERP14ESZvwR
	v6fPsqXGF1kxM6GGf0cokx/e2GWkyDMiM1vUde6NaWxnQaPADj7L59DauirmhFyRHh1kBuwcnIZ
	wjnA=
X-Gm-Gg: ASbGncs+AmKZmNNcO2fwQ7RTPdWSVc/dlyfI3Cc1oWSVqauPX35cikJ+VWzF0ufKT9F
	eTuZjvbGAql1g3h3bNl/BwCjASLxAqjf361kvRhxxLrsOHf2bVLz3fpltJ71LWs0Xl+WtGswrw6
	okdFa6ZHba18qkLilWwrAs6NxMwNrg0Sx04h5xdHT4BaINEYHY4huYc3U4u2lbUZ3QVUn089Zay
	DE9/dU/MzjjUfyon1Zo2DNjUAiAewKDOJ5LBl40B4RHQrm+gcq6nfooMr/zvw+oX4KiQugx03W3
	7I7qty8l6SRy9tOqItL/KZKkCeGKt2zNiopUzz/L+EpN73LyPRPD
X-Google-Smtp-Source: AGHT+IF6bPkXh6K3Q11IgVbCAEx/raWQukTULWZwW0cWZdP4xoy62YD1VO5brez04BzTxzWt6zMIbA==
X-Received: by 2002:a2e:9d16:0:b0:308:eb58:6591 with SMTP id 38308e7fff4ca-30b93310978mr18756901fa.25.1740821104442;
        Sat, 01 Mar 2025 01:25:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 01:25:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 11:24:55 +0200
Subject: [PATCH v2 2/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8917
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-dpu-fix-catalog-v2-2-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MfIfb1GLue9MerIIR2rhWjY6rmZBoFPVe5vbiAysvVc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwtJobSugy0kB0JIsHODpjBT4yZPMEcMtlazNt
 TTJpig19bCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8LSaAAKCRCLPIo+Aiko
 1VQ0B/9QjGsUEpb+DwWLNz/fIYKFPwXC7E2uGmZ4Yredir90cNDR1OI3lNMPAxYFaM6qoQOcRjk
 WHdMYESn1aXu0fSNpX0hxt3d7J29pPQL7AsmolGiYRLsx7b4ioytiHfzQPqpveYeIp3UHcjrfSo
 fghL+fxJZ755HA3xa/g4tia4Djz6aKIp5opjOkNZXxi9oy3y6DUDoimd4GFk071lq3uxox9vmqI
 XDqnMFtuQ0Igx3CHoEOCW5cJLpu+sDu+Xa0gy+pMis6++f/Vz+F5GFANsvu7KxEDzTe0A8pLOm9
 AkvmZBtxY/piGB36iX2mR/pJTxjinj661+YqhnTvu+St/Kv1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM8917 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask and, as it is the only remaining bit,
drop the .features assignment completely.

Fixes: 62af6e1cb596 ("drm/msm/dpu: Add support for MSM8917")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 6bdaecca676144f9162ab1839d99f3e2e3386dc7..6f2c40b303e2b017fc3f913563a1a251779a9124 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -93,7 +93,6 @@ static const struct dpu_pingpong_cfg msm8917_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),

-- 
2.39.5


