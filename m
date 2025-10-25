Return-Path: <linux-arm-msm+bounces-78781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D6EC092FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 18:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 758C734D2E7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 16:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30928304BDC;
	Sat, 25 Oct 2025 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qi3c8lNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7759304BD5;
	Sat, 25 Oct 2025 16:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408558; cv=none; b=ILeUZO8ZjnzfUR/ByxFmhE+PFugttjHqL/KVS5ymk2lT1Sanz6psmzNIHsdUJvIlsNhJdHhx0xMzzxX4FNVLH6+p5DDUXBP/njrRU5P6N/9+yCXizLuq87yXjKCvMUNIac+97RXTJrhbasOqVKstitJBNyh2RvnuUz5bE1fiIWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408558; c=relaxed/simple;
	bh=Kj9CyqIl6bx7QyHTIuFylRaD3S93OlCZnDP02NYM0XM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ih+pTxqjeiBXbDHbtKA+jd4B0Oh9zj0dyu+NnP+f6WCQEIKrny6njifxrTy/8x7ZdVixdxgqD1J7cy5wljmMPgBkHho3/UwOsdLyhIhDTmrnbCCc+CkmvBijbsK+cOMw2YrX5ygk9skwogdxxKIQTsbOq5YtZa5H4QZ12C3mLek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qi3c8lNP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02E0C113D0;
	Sat, 25 Oct 2025 16:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408557;
	bh=Kj9CyqIl6bx7QyHTIuFylRaD3S93OlCZnDP02NYM0XM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qi3c8lNP7iXgsOybxTlplDHu1buo6IO8CNvbGUnAl3Fxd2EUZy69QsIsmNZ+vRAEI
	 OKyXNizTLnpq/2GEpn1srpJx2GlpI47rNsrDBaj3VgZl2XUOmJ3cTaM5SCKKD5X5Ee
	 kVIv3k6D2yBR8mo7SEWOviWkZMGTXrRiYnwRy9ZiohCfnG6ulWH6CaSM1wyf9gmrBK
	 xd31o8+UZP8yw0FJZ/ID0aokjPSApI2CiCHDOrRidfGjajyUfuL1t7zLB7XvXU9hPO
	 2TrbdT+6H9QJtTnRUiaIJU074rkyiO4dg31EHKe5s+rJ+8ZzFxRNFYEVe/ds1aBC1F
	 Y1gtuEgygpWoQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] drm/msm/a6xx: Switch to GMU AO counter
Date: Sat, 25 Oct 2025 11:53:58 -0400
Message-ID: <20251025160905.3857885-7-sashal@kernel.org>
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

[ Upstream commit f195421318bd00151b3a111af6f315a25c3438a8 ]

CP_ALWAYS_ON counter falls under GX domain which is collapsed during
IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
not impacted by IFPC. Both counters are clocked by same xo clock source.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/673373/
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- Problem fixed
  - The CP_ALWAYS_ON counter lives in the GPU GX power domain and
    stops/gets reset during IFPC (inter‑frame power collapse). This
    makes CPU-side reads unreliable or forces the driver to wake the GX
    domain just to read a timestamp, which is fragile and power-
    inefficient.
  - The commit switches CPU reads to the GMU AO (always-on) counter,
    which is not impacted by IFPC and is clocked from the same XO clock,
    preserving timing semantics.

- What changed
  - Added a safe 64-bit read helper for the GMU AO counter with a hi-lo-
    hi read to avoid torn reads:
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:19
    - Reads `REG_A6XX_GMU_ALWAYS_ON_COUNTER_{H,L}` via `gmu_read()` and
      rechecks the high word to ensure atomicity.
  - Replaced CP counter reads in CPU-side tracepoints:
    - a6xx_submit now traces with GMU AO:
      drivers/gpu/drm/msm/adreno/a6xx_gpu.c:392
    - a7xx_submit now traces with GMU AO:
      drivers/gpu/drm/msm/adreno/a6xx_gpu.c:592
  - Simplified timestamp retrieval to avoid waking GX or using OOB
    votes:
    - a6xx_gmu_get_timestamp now returns the GMU AO counter directly:
      drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2314
    - This removes previous lock/OOB sequences to temporarily block IFPC
      just to read `REG_A6XX_CP_ALWAYS_ON_COUNTER`.
  - Importantly, GPU-side emissions that snapshot the CP always-on
    counter via CP_REG_TO_MEM remain unchanged (they run when the GPU is
    active and safe): for example the stats reads in submit paths still
    use `REG_A6XX_CP_ALWAYS_ON_COUNTER` (e.g.,
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:372-375).

- Why this is a good stable candidate
  - Real bug impact: CPU reads of CP_ALWAYS_ON during IFPC can be stale,
    zero, or require disruptive OOB votes that wake the domain; this can
    cause incorrect timestamps (MSM_PARAM_TIMESTAMP), spurious power-
    ups, and trace anomalies. Moving to GMU AO fixes this by design.
  - Small, contained, and low risk:
    - All changes are local to the MSM Adreno a6xx/a7xx driver and a
      single source file.
    - No ABI or feature changes; only the source of the timestamp for
      CPU reads changes.
    - The helper uses a standard hi-lo-hi pattern to ensure a correct
      64-bit read.
    - The GMU AO counter is already described in the hardware XML and
      used elsewhere (e.g., other GMU counters), and the driver already
      depends on GMU MMIO.
  - Maintains timing consistency:
    - Both CP_ALWAYS_ON and GMU_ALWAYS_ON are clocked from XO (19.2
      MHz); userspace semantics are preserved. See the driver also
      treating GMU counters as 19.2 MHz (e.g.,
      drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2361-2369).

- Side effects and regressions
  - Positive: avoids GMU OOB perfcounter votes and GMU lock/handshake
    just to read a timestamp, reducing the chance of deadlocks or long-
    latency paths during IFPC.
  - No architectural changes; no changes to command submission ordering
    or power sequencing.
  - Tracepoints now log the GMU AO value; this improves reliability
    during IFPC without affecting functionality.

- Dependencies present
  - `gmu_read()` and the `REG_A6XX_GMU_ALWAYS_ON_COUNTER_{H,L}` macros
    are already in-tree (drivers/gpu/drm/msm/adreno/a6xx_gmu.h:122 and
    drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml:131-132).
  - The patch updates only `drivers/gpu/drm/msm/adreno/a6xx_gpu.c`, and
    aligns with existing GMU usage patterns.

Conclusion: This is a targeted, safe bug fix that improves timestamp
reliability and avoids unnecessary power domain manipulations during
IFPC. It meets stable backport criteria.

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++-------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 536da1acf615e..1e363af319488 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -16,6 +16,19 @@
 
 #define GPU_PAS_ID 13
 
+static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
+{
+	u64 count_hi, count_lo, temp;
+
+	do {
+		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
+		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
+		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
+	} while (unlikely(count_hi != temp));
+
+	return (count_hi << 32) | count_lo;
+}
+
 static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
 {
 	/* Success if !writedropped0/1 */
@@ -376,8 +389,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 }
@@ -577,8 +589,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	}
 
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 
@@ -2260,16 +2271,7 @@ static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
-
-	/* Force the GPU power on so we can read this register */
-	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
-
-	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	mutex_unlock(&a6xx_gpu->gmu.lock);
+	*value = read_gmu_ao_counter(a6xx_gpu);
 
 	return 0;
 }
-- 
2.51.0


