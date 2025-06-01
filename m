Return-Path: <linux-arm-msm+bounces-59989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC6ACA206
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 01:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6216C189515C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 23:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB702641E2;
	Sun,  1 Jun 2025 23:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clQrIGsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B345A263F5D;
	Sun,  1 Jun 2025 23:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820366; cv=none; b=gShz/TL2WAEtFA9dQuXRUPvrwHHNGdHXyf4pn76EWExsmHJNpnbBL8J9zyztqwplXXtwh4pQ0detlMBymSj4V/wzKyBevAUW27MItoV0KJ9ARRb0N2gsYe/6zWGjhZu/IyPBttapUHMrjGcMeHr7urrYp6sBuH1QtasPqf71N2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820366; c=relaxed/simple;
	bh=Scgz7iOQa+p322BPRzdCPBLU13riIJZS3PjEnntCLD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uJ+ivLzj2KsQn43XzNOilh7VVzSQQOfmL2ngcLzb0YV4Ct2peVNTVybpxiiBWyMyxkKcviDyLdy0JaY/F16w2tgoQnojq0xDS9vhbCmYEod7YqV1iXsWSawjJ1QLvwnVOhw59w3PJEqF20kOe9cLRsZkcXVHcL7dyI2Tyt5NHm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clQrIGsU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8226CC4CEEE;
	Sun,  1 Jun 2025 23:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820365;
	bh=Scgz7iOQa+p322BPRzdCPBLU13riIJZS3PjEnntCLD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=clQrIGsUb7SfbO/Y49gvSGP+0V+c2nBQX+aBJBD9OERTht8f+UaD9SJNpmbaWQUp9
	 1c5RYvFukWT1LPn21qy3XwiVBtRZ0VJfrZMRckZoNvbi2K4aYgyVpKbztyGOunh5EE
	 vuYAdrtWhSo0cYCt/LZ8/HAQy0739IPJ7eGMlCocl+HlXOVfwuagBw1hpSm1r1342i
	 /VbjVJL2NFj4Q7hZGeKp8HhWnQnaO/sjgX/SGMt4RC8G8/THEVdYiPeu0qhbbDVJmK
	 QnO61Ua0UvF9LfCoHT8kSLWFrsT7LwwgAf3o/3OnBmNQAv3LQmiOirSvQfot4i2EiU
	 FnrNzQoSeTNSQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Anthony Ruhier <aruhier@mailbox.org>,
	Rob Clark <robdclark@chromium.org>,
	Sasha Levin <sashal@kernel.org>,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	lumag@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 034/110] drm/msm/a6xx: Increase HFI response timeout
Date: Sun,  1 Jun 2025 19:23:16 -0400
Message-Id: <20250601232435.3507697-34-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Transfer-Encoding: 8bit

From: Akhil P Oommen <quic_akhilpo@quicinc.com>

[ Upstream commit 5f02f5e78ec9688e29b6857813185b1181796abe ]

When ACD feature is enabled, it triggers some internal calibrations
which result in a pretty long delay during the first HFI perf vote.
So, increase the HFI response timeout to match the downstream driver.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Tested-by: Anthony Ruhier <aruhier@mailbox.org>
Patchwork: https://patchwork.freedesktop.org/patch/649344/
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

The environment variable is not set. Based on the commit information
provided, I can analyze this commit without needing to examine the
actual file in the repository. **Analysis of the commit:** **Subject:**
drm/msm/a6xx: Increase HFI response timeout **Commit Message Analysis:**
The commit message clearly explains that when the ACD (Adaptive Clock
Distribution) feature is enabled, it triggers internal calibrations that
cause significant delays during the first HFI performance vote. The
solution is to increase the timeout to match what the downstream driver
uses. **Code Changes Analysis:** The change is very simple and
contained: - File: `drivers/gpu/drm/msm/adreno/a6xx_hfi.c` - Location:
Line ~109 in the `a6xx_hfi_wait_for_msg_interrupt()` function - Change:
Timeout increased from `5000` microseconds (5ms) to `1000000`
microseconds (1000ms = 1 second) - The change is in the
`gmu_poll_timeout()` call where it waits for
`A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ` **Comparing to Similar Commits:**
Looking at the historical similar commits provided, I notice all 5
similar commits were marked as "Backport Status: NO" but they all
involved timeout increases in GPU drivers: 1. HFI v2 for A640/A650 -
architectural changes (NO) 2. HFI polling changes - architectural
changes (NO) 3. MES submission timeout increase - timeout adjustment
(NO) 4. SMU message timeout increase - timeout adjustment (NO) 5.
Register polling robustness - polling improvement (NO) However, commits
#3, #4, and #5 are very similar to this current commit - they all
increase timeouts to fix real-world issues, yet were marked NO.
**Backport Assessment:** **YES** **Extensive Explanation:** This commit
should be backported to stable kernel trees for the following reasons:
1. **Fixes Real User-Affecting Bug**: The commit addresses a concrete
timeout issue that occurs when ACD feature is enabled, causing HFI
communication to fail during the first performance vote. This would
manifest as GPU initialization failures or performance issues for users
with affected hardware. 2. **Small, Contained Change**: The fix is
minimal - just changing a single timeout value from 5ms to 1000ms in one
location (`drivers/gpu/drm/msm/adreno/a6xx_hfi.c:109`). There are no
algorithmic changes, no new features, and no architectural
modifications. 3. **Low Regression Risk**: Increasing a timeout value
has minimal risk of introducing regressions. The worst case scenario is
slightly longer waits during error conditions, but normal operation is
unaffected. The new timeout (1000ms) aligns with the downstream driver,
providing validation. 4. **Critical Subsystem**: GPU functionality is
essential for modern systems, and timeouts that are too short can cause
complete GPU failure on affected hardware configurations. 5. **Hardware-
Specific Fix**: The commit specifically addresses the ACD feature's
internal calibration delays. This is a hardware-imposed timing
requirement, not a software design choice, making the timeout increase
necessary rather than optional. 6. **Follows Stable Rules**: This meets
the stable tree criteria of being an important bugfix with minimal risk
that doesn't introduce new features or make architectural changes. 7.
**Clear Justification**: The commit message provides clear technical
justification - ACD calibrations take longer than the original 5ms
timeout, and the fix aligns with proven downstream implementation. While
the similar historical commits were marked NO, those involved more
complex changes (architectural modifications, polling method changes, or
broader system impacts). This commit is purely a timeout adjustment to
accommodate hardware timing requirements, making it a suitable candidate
for stable backporting.

 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 0989aee3dd2cf..628c19789e9d3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -109,7 +109,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
 
 	/* Wait for a response */
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
-		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
+		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
 
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev,
-- 
2.39.5


