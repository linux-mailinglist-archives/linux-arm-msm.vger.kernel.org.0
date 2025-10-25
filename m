Return-Path: <linux-arm-msm+bounces-78794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B068CC09B04
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 18:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1A943A016C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 16:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41962311952;
	Sat, 25 Oct 2025 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujsxSkzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AE230C605;
	Sat, 25 Oct 2025 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409736; cv=none; b=THNVNLQvIw161+MLOMaG8dzUn03qmK+Ioklq8OBxamo4ngFt4w42B1+xXhRuIp4M5lNSPMNyqanVmwf1y7172Gx6yxyjetAhx9GnQ4SfMKBL2mKD0anM0+c2IEPfRa7u0UN9hgZ6YJgvyV2qZMk3kGK6tajv4l2QSWhkQBbasaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409736; c=relaxed/simple;
	bh=vw8g2Kori7LsPn9dAOsxwkFOC383lL0e9VbHkDwlF1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJB4afFpJJgidDlTR12jKVk8fhcl/OeYT4hg5dhqjm2B9SlQ5dt4yI9pMXd13/gtEKvCXwtrUVbfZ06q6AHzyVhlI7hYp9BKULuUs0vAxDkeguLk8n/nYbosDt+ofYIjEXmbP5cWSDBE0uY7NlBFs2LwfYhNxPuyWtkmu328YzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujsxSkzf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1826C4CEFF;
	Sat, 25 Oct 2025 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409736;
	bh=vw8g2Kori7LsPn9dAOsxwkFOC383lL0e9VbHkDwlF1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ujsxSkzfeLTodWgvBNNLDf0mnN17ipJZvpobqQ4SAHKt2tb0wyFAyrafLPH8UYjQK
	 7f7OEhSWbWfPFs509Ppy/qUJd2Lu80Mdlbd6WCVBV9G9Yi5004m9d8RNsUtxmBhb77
	 DbW8W3+4mCTGdltDGo4SNQjO7/bM1SbwuTbu8nFd7jfJ55+ni9YDMeRHoD4Lebx3Na
	 ufb+nT5ADp8ALTmPUDP7Z6Ht6BeZTT4dzI3yZysjkN1TQnEBsBbmMR4SUkW0xrXLFA
	 S1N1QXUD80GCCxFlci6WvLCKRMf1fpq7DuXizYwJzYprqKOclZ5/KFy4Uv17jiJpAG
	 4bC3+h7ms2KPw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] drm/msm/adreno: Add speedbin data for A623 GPU
Date: Sat, 25 Oct 2025 12:01:13 -0400
Message-ID: <20251025160905.3857885-442-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Akhil P Oommen <akhilpo@oss.qualcomm.com>

[ Upstream commit 0584da4515dbb4fec69107ce837eef36a7be5d7d ]

Add the speedbin mappings for Adreno 623 GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/672462/
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Rationale
- What changed: Adds speedbin-to-bin mappings for Adreno 623 so the
  driver can correctly gate OPPs based on fuse value:
  - A623 entry: drivers/gpu/drm/msm/adreno/a6xx_catalog.c:889
  - New mapping: drivers/gpu/drm/msm/adreno/a6xx_catalog.c:916
    - { 0, 0 }, { 185, 0 }, { 127, 1 }
- Why it matters: The a6xx driver reads the GPU’s speed-bin fuse and
  filters usable OPPs accordingly. Without a mapping, the code falls
  back to BIT(0), which can enable OPPs meant only for faster bins on
  slower-binned parts (risking instability or rendering faults):
  - Fuse read: drivers/gpu/drm/msm/adreno/adreno_gpu.c:1173
  - Mapping lookup and fallback:
    - fuse_to_supp_hw() uses info->speedbins:
      drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2485
    - If no mapping, logs error and defaults to BIT(0):
      drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2514,
      drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2520
- Device-tree evidence (A623-class SoC) shows higher OPPs are explicitly
  restricted to bin 0, making correct speedbin mapping essential:
  - NVMEM speed_bin: arch/arm64/boot/dts/qcom/qcs8300.dtsi:4316
  - OPP table: arch/arm64/boot/dts/qcom/qcs8300.dtsi:4324
    - Top OPPs only for BIT(0):
      arch/arm64/boot/dts/qcom/qcs8300.dtsi:4331,
      arch/arm64/boot/dts/qcom/qcs8300.dtsi:4338
    - Lower OPPs for BIT(0)|BIT(1):
      arch/arm64/boot/dts/qcom/qcs8300.dtsi:4345,
      arch/arm64/boot/dts/qcom/qcs8300.dtsi:4352
  - Without this patch, slower-binned A623 parts would be misidentified
    as bin 0 and incorrectly allowed to use these top OPPs.
- Stable backport fit:
  - Bug fix: Correctly enforces hardware-supported OPPs based on fuses
    for A623, preventing potential over-frequency/undervoltage
    conditions on slower bins.
  - Small and contained: Adds a data table entry; no API or
    architectural change.
  - Low regression risk: Aligns A623 with how other a6xx GPUs already
    use speedbins; expected outcome is correct OPP gating (performance
    might decrease on mis-binned systems, but that is the intended fix).
  - Touches a single DRM/msm driver file; no core kernel impact.
  - No new features; strictly correctness and reliability for existing
    hardware support.

Conclusion
- This is a clear, low-risk correctness fix for A623 platforms and
  should be backported to stable trees that include A623 support.

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 2b1c41f6cfeee..3c82b3f320e3a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -913,6 +913,11 @@ static const struct adreno_info a6xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 185, 0 },
+			{ 127, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x06030001,
-- 
2.51.0


