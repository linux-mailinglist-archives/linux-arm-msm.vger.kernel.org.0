Return-Path: <linux-arm-msm+bounces-71581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D68B3FFA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 787DB189E3A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425B53043A0;
	Tue,  2 Sep 2025 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPMdwaIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143B0288C20;
	Tue,  2 Sep 2025 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814925; cv=none; b=RVTWV2Bn7jVeZvKx7h83Lxtz0n6qiLEOTbcNxzdTCgtJ/haDUpbEjYsbpMgNm3T0oA87JoS1HyNwEIVYqBxvrAPCH3mc7tZYufn7vUIH5FL9GZgSWGr4iPqAY1yV6p3yy0uHPY12CIicM7G5UhnugR5GbLq602HBRGbFBG2F4Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814925; c=relaxed/simple;
	bh=20cQSpswf2uCt/IoVeFiJ9cUU0RC6VufEaJmHGbdd0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJ3/WchiQPcyiAh71KgoPK/demRn1oHYXeHLtKvfqF5rzcW0ZVsZ9JaSBj6NlzBHUQ1dwI8vYYljVFS3cbm1ZDXhXV9j4q/NQ4avjLfI2tyScWhbNw588iTO8CgUlSDza36PLsQaN2P58QRB0Id8Sd4F3/VuBTYYWh1824WZ0FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPMdwaIW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0A9C4CEF4;
	Tue,  2 Sep 2025 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814924;
	bh=20cQSpswf2uCt/IoVeFiJ9cUU0RC6VufEaJmHGbdd0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VPMdwaIWg3K2bHFbZXm2ZBY8WLYzdRzV51R/2OKzrZzx6OmiHD1o6eCYBrveU30BT
	 VsBK+Upe6RTXul/wi/R8pqnKYFd4pmnwNoPr/q+Co/MxJYZDEUMYEwyEH3Hwh4ROdO
	 8v2bHlCW3tDCYTWU/eUAmNc7ibb0FTaym722e4uBhRIERoGrI0FMiUWZNPoCfn4Kbx
	 qnC15YwO2HBbUd7ONIHiNZU+AtFep3j4ollk51HY9h2OR7zhJz4/NpKkxJGhf0B85d
	 sMpcIRJN3EcHIl0i1cm/bY8coftZPAUE5XOgTiFo1Cpsgz10iEEEN2ocMD/+4wf+Q8
	 fA2+ZRovW69aw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.16-6.12] drm/msm: Fix a7xx debugbus read
Date: Tue,  2 Sep 2025 08:08:16 -0400
Message-ID: <20250902120833.1342615-5-sashal@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902120833.1342615-1-sashal@kernel.org>
References: <20250902120833.1342615-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.4
Content-Transfer-Encoding: 8bit

From: Rob Clark <robin.clark@oss.qualcomm.com>

[ Upstream commit 13ed0a1af263b56a5ebbf38ab7163cbc9dcb009e ]

The bitfield positions changed in a7xx.

v2: Don't open-code the bitfield building
v3: Also fix cx_debugbus

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/666659/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Bug Fix Analysis

The commit fixes a functional bug in the MSM DRM driver's debugbus
reading functionality for Adreno 7xx GPUs. Specifically:

1. **Incorrect Bitfield Positions**: The code was using A6XX bitfield
   definitions for A7XX hardware, but the hardware changed the bitfield
   positions. Looking at the changes in `a6xx.xml`:
   - A6XX uses bits 15:8 for `PING_BLK_SEL`
   - A7XX uses bits 24:16 for `PING_BLK_SEL`
   This mismatch would cause incorrect values to be written to the debug
bus selection registers, resulting in wrong or garbage data being read.

2. **Affects Core Debugging Functionality**: The debugbus is critical
   for GPU state capture during crashes and debugging. Without this fix,
   debugging A7XX GPUs would be severely impaired as the debugbus reads
   would return incorrect data.

## Stable Criteria Evaluation

1. **Fixes a real bug**: Yes - incorrect register programming leading to
   wrong debug data
2. **Small and contained**: Yes - only 46 lines changed across 2 files
3. **No major side effects**: The changes are conditional based on GPU
   family and only affect debug bus reading
4. **No architectural changes**: Simple conditional logic to use correct
   bitfield definitions
5. **Critical subsystem impact**: Moderate - affects GPU debugging
   capabilities which are important for diagnosing GPU hangs/crashes
6. **Already upstream**: Yes - commit
   13ed0a1af263b56a5ebbf38ab7163cbc9dcb009e is already merged upstream

## Code Safety Analysis

The fix is safe because:
- It adds proper family checks: `if (to_adreno_gpu(gpu)->info->family >=
  ADRENO_7XX_GEN1)`
- Maintains backward compatibility for A6XX hardware
- Only changes register programming for debug bus reads, not normal GPU
  operation
- The fix pattern is applied consistently to both `debugbus_read()` and
  `cx_debugbus_read()` functions

## Impact Assessment

Without this fix, users with A7XX GPUs would experience:
- Incorrect GPU state dumps when GPU crashes occur
- Inability to properly debug GPU issues
- Misleading diagnostic information that could hamper bug resolution

This is a clear bugfix that restores proper functionality for A7XX
hardware without introducing new features or risky changes, making it an
ideal candidate for stable backporting.

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 32 ++++++++++++++-----
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 14 +++++++-
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index f46bc906ca2a3..61850e2802914 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -174,8 +174,15 @@ static int a6xx_crashdumper_run(struct msm_gpu *gpu,
 static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
-		A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	} else {
+		reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	}
 
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
@@ -198,11 +205,18 @@ static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 	readl((ptr) + ((offset) << 2))
 
 /* read a value from the CX debug bus */
-static int cx_debugbus_read(void __iomem *cxdbg, u32 block, u32 offset,
+static int cx_debugbus_read(struct msm_gpu *gpu, void __iomem *cxdbg, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
-		A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = A7XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
+			A7XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	} else {
+		reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
+			A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	}
 
 	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_B, reg);
@@ -315,7 +329,8 @@ static void a6xx_get_debugbus_block(struct msm_gpu *gpu,
 		ptr += debugbus_read(gpu, block->id, i, ptr);
 }
 
-static void a6xx_get_cx_debugbus_block(void __iomem *cxdbg,
+static void a6xx_get_cx_debugbus_block(struct msm_gpu *gpu,
+		void __iomem *cxdbg,
 		struct a6xx_gpu_state *a6xx_state,
 		const struct a6xx_debugbus_block *block,
 		struct a6xx_gpu_state_obj *obj)
@@ -330,7 +345,7 @@ static void a6xx_get_cx_debugbus_block(void __iomem *cxdbg,
 	obj->handle = block;
 
 	for (ptr = obj->data, i = 0; i < block->count; i++)
-		ptr += cx_debugbus_read(cxdbg, block->id, i, ptr);
+		ptr += cx_debugbus_read(gpu, cxdbg, block->id, i, ptr);
 }
 
 static void a6xx_get_debugbus_blocks(struct msm_gpu *gpu,
@@ -527,7 +542,8 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
 			int i;
 
 			for (i = 0; i < nr_cx_debugbus_blocks; i++)
-				a6xx_get_cx_debugbus_block(cxdbg,
+				a6xx_get_cx_debugbus_block(gpu,
+					cxdbg,
 					a6xx_state,
 					&cx_debugbus_blocks[i],
 					&a6xx_state->cx_debugbus[i]);
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index d860fd94feae8..86fab2750ba7b 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -594,10 +594,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0600" name="DBGC_CFG_DBGBUS_SEL_A"/>
 	<reg32 offset="0x0601" name="DBGC_CFG_DBGBUS_SEL_B"/>
 	<reg32 offset="0x0602" name="DBGC_CFG_DBGBUS_SEL_C"/>
-	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D">
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A6XX">
 		<bitfield high="7" low="0" name="PING_INDEX"/>
 		<bitfield high="15" low="8" name="PING_BLK_SEL"/>
 	</reg32>
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A7XX-">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="24" low="16" name="PING_BLK_SEL"/>
+	</reg32>
 	<reg32 offset="0x0604" name="DBGC_CFG_DBGBUS_CNTLT">
 		<bitfield high="5" low="0" name="TRACEEN"/>
 		<bitfield high="14" low="12" name="GRANU"/>
@@ -3796,6 +3800,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0030" name="CFG_DBGBUS_TRACE_BUF2"/>
 </domain>
 
+<domain name="A7XX_CX_DBGC" width="32">
+	<!-- Bitfields shifted, but otherwise the same: -->
+	<reg32 offset="0x0000" name="CFG_DBGBUS_SEL_A" variants="A7XX-">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="24" low="16" name="PING_BLK_SEL"/>
+	</reg32>
+</domain>
+
 <domain name="A6XX_CX_MISC" width="32" prefix="variant" varset="chip">
 	<reg32 offset="0x0001" name="SYSTEM_CACHE_CNTL_0"/>
 	<reg32 offset="0x0002" name="SYSTEM_CACHE_CNTL_1"/>
-- 
2.50.1


