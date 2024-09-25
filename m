Return-Path: <linux-arm-msm+bounces-32485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE8E985F76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 15:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 970282873FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 13:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6A61D3486;
	Wed, 25 Sep 2024 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7FX6loS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C11D3483;
	Wed, 25 Sep 2024 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727266570; cv=none; b=e0iwH1Rd9wJ6lLa9CkOhBTsaZFpZOZZv6pafgYUk1/PMxfNUyfco3NyfWNxVgmf2QpiCZau48qjoHGUKm91jmm8TS1WP68O4Gv1MHbO8iM80JGH8v04yicbNOyR/GfXqR7atN5DfJ4ltKZ7UQ26ep/Qr/ITLPl4bRhTVmQ7ooxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727266570; c=relaxed/simple;
	bh=le/DKIW6llk9bNh5zKIyofSVB4oPnhRMvEKtZyeqgaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPyZnT0sf1eUhwbDPrR70ayDH+WZ8926rm5XAkULz7RfLwaA5rVtNiLOzD1odkMYse/8ZmCA8T0qMIbScQT4jS1KDfudJYMLiHX45+HIdeZpItAobLBrRsJ+JbfO7Q8KOhn57+vMUUi/SKMw4OPfUn9S9lg8tfKQNg0dHwtP6BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7FX6loS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F33C4CEC7;
	Wed, 25 Sep 2024 12:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727266570;
	bh=le/DKIW6llk9bNh5zKIyofSVB4oPnhRMvEKtZyeqgaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n7FX6loSHnXRDD65FXGHJlGdFofD0VQ6T4a9M5risR42iWRt/StYJp5ZeUdh6U4be
	 siPRd3YQxIxzQzvBs41a+E+wZz7zAebdoBosDVt3Uk2L9/NrGvYpmWADjAjf/tnJP/
	 SKGfXyTK64vZNxLSxnlGnjJ1DYIW016Cexrk7Pmf/vNEaZh26PCENwp4WWZ0o0mbIi
	 l3t+2U/vgxLTfrlFmnphFIknasUDZlwt9debklgl49zkgWBZY3FK5EHB5nG3N7/N3W
	 Geyc7eJTPtzscckn311qjACCo8p1Eh+DLMPvzA+evBsPO2trB5pR6qH3xy4+MiH+ux
	 BixC2y66Kz5qg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@chromium.org>,
	Sasha Levin <sashal@kernel.org>,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 099/139] drm/msm/adreno: Assign msm_gpu->pdev earlier to avoid nullptrs
Date: Wed, 25 Sep 2024 08:08:39 -0400
Message-ID: <20240925121137.1307574-99-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925121137.1307574-1-sashal@kernel.org>
References: <20240925121137.1307574-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.52
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@linaro.org>

[ Upstream commit 16007768551d5bfe53426645401435ca8d2ef54f ]

There are some cases, such as the one uncovered by Commit 46d4efcccc68
("drm/msm/a6xx: Avoid a nullptr dereference when speedbin setting fails")
where

msm_gpu_cleanup() : platform_set_drvdata(gpu->pdev, NULL);

is called on gpu->pdev == NULL, as the GPU device has not been fully
initialized yet.

Turns out that there's more than just the aforementioned path that
causes this to happen (e.g. the case when there's speedbin data in the
catalog, but opp-supported-hw is missing in DT).

Assigning msm_gpu->pdev earlier seems like the least painful solution
to this, therefore do so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Patchwork: https://patchwork.freedesktop.org/patch/602742/
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 1 +
 drivers/gpu/drm/msm/msm_gpu.c           | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 8090dde032808..00419e0693419 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1071,6 +1071,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	adreno_gpu->chip_id = config->chip_id;
 
 	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
+	gpu->pdev = pdev;
 
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 5c10b559a5957..5a7541597d0ce 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -927,7 +927,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	if (IS_ERR(gpu->gpu_cx))
 		gpu->gpu_cx = NULL;
 
-	gpu->pdev = pdev;
 	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
 	msm_devfreq_init(gpu);
-- 
2.43.0


