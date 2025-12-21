Return-Path: <linux-arm-msm+bounces-86068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 82251CD4302
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 17:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C1083000095
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 16:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755272E40E;
	Sun, 21 Dec 2025 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S71b+Slh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C2717C69;
	Sun, 21 Dec 2025 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766335562; cv=none; b=Z9utrSrsLhfVB8FJmSFwOm4VmczHa2ghKXzHDS2lb573jnbswv5ONbMSd1504RFbckWy2UErkcQA2rHxE8htIA/fQjUD7r/Otmfrws6Hkst+g937RLClfCZLacb6S4CJ66vn+EJDu5qLRpIspZIWT9FWujjxoQwfQZAulccK75Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766335562; c=relaxed/simple;
	bh=r9/xkDyHyyOz99bcJt0an5ynSeQuJ69gRxf1lMwnZNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0goclT9pqQnRV0l/Hk3ccB2v+Lbv9jWZ6wVLd59zlJCgHaxlwyvmN6Nn9VtT76cBdf7iiJYE7hATrW7UU720xNDmRJ1BTxheyI1AhMcn+bXmi6rE/tHYKMCCMLvyg4VpVLNWFD0n2R7vZhIKyWgzetgAU8Mj+qY9TZmv8Mkqjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S71b+Slh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F33C4CEFB;
	Sun, 21 Dec 2025 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766335561;
	bh=r9/xkDyHyyOz99bcJt0an5ynSeQuJ69gRxf1lMwnZNU=;
	h=From:To:Cc:Subject:Date:From;
	b=S71b+Slhl+wIyb59StFZDmcT5Is8Xv4hMaYsMMhTHNhbt6yMlTIsZntfnO1XrJwrH
	 JcSgfLUvl3a+IMdgzPHDm2jmFxb0U/bgI+L4L2BgF6t9v9IFrTnDbOfwUUeOFkjAsi
	 G7kyilvgKEvXJvpdbMe3ppVfcV+WfDJTD0KxrcwiUfxSec/mqmjxLl7cRH/G7XWsw4
	 lact9GPRnLY92bKohG4WW1sD/qAFnQslY23Bo3RQnz1kMa8h87QcZdLJhFvQs/es70
	 9HAuM7YiaSBEi3Np8D6m7p6Y9eXa9tEKLNgpqeGT8sQv/wQvRtmmWIy74KpWjZFIvu
	 ThORkDpNPkaMA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vXMZJ-000000005Cj-1auL;
	Sun, 21 Dec 2025 17:46:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
Date: Sun, 21 Dec 2025 17:45:52 +0100
Message-ID: <20251221164552.19990-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hw clock gating register sequence consists of register value pairs
that are written to the GPU during initialisation.

The a690 hwcg sequence has two GMU registers in it that used to amount
to random writes in the GPU mapping, but since commit 188db3d7fe66
("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
the updated offsets now lie outside the mapping. This in turn breaks
boot of machines like the Lenovo ThinkPad X13s.

Note that the updates of these GMU registers is already taken care of
properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
properties on a6xx too"), but for some reason these two entries were
left in the table.

Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
Cc: stable@vger.kernel.org	# 6.5
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 29107b362346..4c2f739ee9b7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -501,8 +501,6 @@ static const struct adreno_reglist a690_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
 	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
 	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
-	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
-	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
 	{}
 };
 
-- 
2.51.2


