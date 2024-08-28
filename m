Return-Path: <linux-arm-msm+bounces-29787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 417AE962B36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F253C2859DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B468219FA94;
	Wed, 28 Aug 2024 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZlzjUOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E720188CD3;
	Wed, 28 Aug 2024 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857634; cv=none; b=M9tBsEna8S96undlleeeIySnRgHQzkEwN06cRtMWqUd6vFMhPsh2Mx7ipz/A5fgewsLu6GT8wEjobH+8oG0KHwzK7yMkxouV5XitcD6aLvykUyENcBf+q3KCjYX2A+OHOLIQvHv/EMWRvo3uMdFG8482muuTRwzlC6+4vpzSoMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857634; c=relaxed/simple;
	bh=AY5kElfZ7HDWUh1XY4xXIxxSiqg9NsEMxp3JQGCRdGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LkcXd/IOdWSXlRfMeP7z9Qf18r9+SLKJobDKSNl6t8md970l8717rTs+kry0T6xqiCCMvkrhYVtkVTQc6SqmVdJKSqN7mYTaHmSv44WbZ50OtUMV3PEf0NBjMnWOFiLI378IZkqi4mZ+oBNU1yPMXG6whrxVp56OpzfHWFGeYWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZlzjUOd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E44C4CEC4;
	Wed, 28 Aug 2024 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724857634;
	bh=AY5kElfZ7HDWUh1XY4xXIxxSiqg9NsEMxp3JQGCRdGY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZlzjUOddAds8Qe1QwxMyIyY69mce4Lz/KiJfHT8JVgpF/eI5uLMbZ3UMKTbYooMA
	 f9QyD5pGqcmm9YPj9wkblFpUAM+mnQu9QEeC921EZ2tff5z482qsriFrl0wHX3KR+S
	 Qll2lF+Qmjq3HnYO6GCGzj3UJNy9EZkWH0buOLryTVTyWBYEVPccsm1fW3FB6qVNYy
	 fOZ0Sak14LSAvRhcwtc7WJn4fugeoAm9SiMfMClFD9OGZRNwIo4+XexQPwW7dsKDim
	 dyDVPZEpodLLQnXTuYHc57sbq5pxv0g1biABIYUDULvOrgRLwTT83tMy1CbWErQzgX
	 xq8HHibnaMLjg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Aug 2024 17:06:54 +0200
Subject: [PATCH v2 1/6] drm/msm/a6xx: Evaluate adreno_is_a650_family in
 pdc_in_aop check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-a621-v2-1-1882c6b57432@kernel.org>
References: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
In-Reply-To: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724857626; l=964;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=LKnGEsq0uRQq3Nql0V5gTQSfevwlmeAxbznSDZQfJTg=;
 b=bNh/7s8qgiCnyg6E10kgxQ9KLEeVVmDUBmE8UE2Fot1oMxwKO1gTcydvsOJdIY8i3R2Bo44Si
 tcoxfvANwSyDt0ZmFmseeY6RH1MK9mAgH8xlZOA9SYHf7hZ/D7NM36R
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

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
2.46.0


