Return-Path: <linux-arm-msm+bounces-32477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9408E985B43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 14:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C59611C23E3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 12:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B171BB6B2;
	Wed, 25 Sep 2024 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o79MXMJA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD71E1BB6B0;
	Wed, 25 Sep 2024 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727264874; cv=none; b=Jjs3J96z8ClFJ4sx0giBO1dNtp0svoKsGpekw22bY7+0GlaEA216DUFFDuq+z4oe0U2Jlq7JgbNhcMRqsGWJoDuTue/GSNf0R1LSISIY6RE45bh1gIoHrH4yn87V3VUFTk3/rkkR9xFFSeiwySPZk4dcdC6JOuVbxRMonhjYC5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727264874; c=relaxed/simple;
	bh=Jp/7mKD0NQ8tcuVLRYP6ppFFsuSAfFVkzvYBDI8NlO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNeHXYyjUc3F+Sx1u6dKYDpYuwNePcFmXK9WvnWnfPzNXyot/rE4STsjDEJRoP7DXb1qcyij2bpSpx2Yi1NIB2QIWHfg47y69dYXH8jZnWE+dqKg42GS9JOsLcGGgtGEfsoE7d94u8cPIltCbjioyyNX0Pi6TKsgHiTY5J4qaFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o79MXMJA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10145C4CEC3;
	Wed, 25 Sep 2024 11:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727264874;
	bh=Jp/7mKD0NQ8tcuVLRYP6ppFFsuSAfFVkzvYBDI8NlO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o79MXMJAfV9+dVtcEvjjTUDOgT9J7gqg5osjiUCNR1dVOHlcY7kqsH4kvSsOfs7cQ
	 fbCDl/rPUDhWcHNN6/yDrsl4rCZfx+C1gyAj/BTLW5Zrb0YZZ/uo2E7qm9L/bC5S4z
	 aotF703FTkUNJEBVeGwtEd9S9A/XFoyMJJKM5zZoamr23kL9yKeKRXr++MB8zK6rHS
	 c+Qs1BZSzOt7wOOMm6IZ04unVeXxoxknfmmcaxwr/jIVWSEeptz8qywQVgV5TNVhn6
	 DFFp7ir2rTlIi1oNyWVmpC/pe+avVpgCIMbfEz58oY4ngaJXT3ZaPEV4LFIltqKDKZ
	 1Lb7i7F+gqG3w==
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
Subject: [PATCH AUTOSEL 6.11 168/244] drm/msm/adreno: Assign msm_gpu->pdev earlier to avoid nullptrs
Date: Wed, 25 Sep 2024 07:26:29 -0400
Message-ID: <20240925113641.1297102-168-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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
index ecc3fc5cec227..1079cfd6d9c7b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1083,6 +1083,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	adreno_gpu->chip_id = config->chip_id;
 
 	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
+	gpu->pdev = pdev;
 
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3666b42b4ecd7..a274b84664237 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -931,7 +931,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	if (IS_ERR(gpu->gpu_cx))
 		gpu->gpu_cx = NULL;
 
-	gpu->pdev = pdev;
 	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
 	msm_devfreq_init(gpu);
-- 
2.43.0


