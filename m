Return-Path: <linux-arm-msm+bounces-71584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DBCB3FFC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E4837B880C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762263054C1;
	Tue,  2 Sep 2025 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdpAc5Hy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488EB305076;
	Tue,  2 Sep 2025 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814933; cv=none; b=dQ/H0OAxsfh6NvH58MNnPvc2ruGU86igBw1rAqk8X7rdpDAdccJQcTljTdwRILYda8inWUk2MC2EfgNLF0ZzXGIQAEg7VfR3Qb9hgSE/DqGplfXsh/QXK08fyx5gzycKDw8i9DGWhxgC+3dM05GvVK+xQjwYcx4FeTTh1veIQrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814933; c=relaxed/simple;
	bh=LAwn6LXlJkC2hCxXCp6lL6R5ho2WopRSPF5UydoPook=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndCPJubiJqMDJ1a6TgJ3xOHdkJQW8gTnQ+6TO2VBQ3gQJqNCcP5NT7V81frLFJoaptIyOdqI70UccTaUJ8CEEI7YNsiheUAFfUgJlKc30dC9DqYriiF0HwAh/ltWYU+Vg8/djezib4pvMggQVTlJVxprYPXQEOiJg7tj9FIrieE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdpAc5Hy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B0EC4CEF4;
	Tue,  2 Sep 2025 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814932;
	bh=LAwn6LXlJkC2hCxXCp6lL6R5ho2WopRSPF5UydoPook=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdpAc5HyZCucuirSTYZ4xU5CLno+RXVLCXQUQIfP2t412JO1M6RBXqwppnwdDGszr
	 zEOsRKKfTfyE4WttU1hFX/Mh8TioFaRFCkGGO5I9/0UiVscdpRUUPJIRVq1wvn4Jw9
	 SNmmFYrfUpRrrn32MiR+KDnmwOBehXEypVXK3cqOuHb7gpqVJoFHSTE/Ll2sK7bG2U
	 3h9/LbxM1HPKHMaQWEAVZOqaJqBc0x9sG0zbyHmBHK5NG6dpZpHaYqRhNtOALmVc1X
	 +O628PifEl1ZA+QpOdSsie+MEKclNrVFsd21/kpPkatR8e+m+zznOZQWlcdIkQYLZl
	 NGtzp2LpRfz1A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Connor Abbott <cwabbott0@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.16-6.12] drm/msm: Fix debugbus snapshot
Date: Tue,  2 Sep 2025 08:08:23 -0400
Message-ID: <20250902120833.1342615-12-sashal@kernel.org>
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

[ Upstream commit a814ba2d7b847cff15565bbab781df89e190619c ]

We weren't setting the # of captured debugbus blocks.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Suggested-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/666660/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Bug Impact Analysis

1. **Clear bug fix**: The code analysis shows that
   `a7xx_get_debugbus_blocks()` allocates memory for
   `total_debugbus_blocks` worth of debugbus data and populates all of
   them, but critically fails to set `a6xx_state->nr_debugbus =
   total_debugbus_blocks`. This is clearly visible at line 442 of the
   fixed code.

2. **User-visible impact**: Without setting `nr_debugbus`, the function
   `a6xx_show_debugbus()` at line 1949 will iterate 0 times (`for (i =
   0; i < a6xx_state->nr_debugbus; i++)`), meaning NO debugbus data will
   be shown in GPU crash dumps for a7xx GPUs. This severely impacts
   debugging capabilities when GPU hangs or crashes occur.

3. **Regression timeline**: This bug was introduced in commit
   64d6255650d4e0 ("drm/msm: More fully implement devcoredump for a7xx")
   from January 2024, which added the `a7xx_get_debugbus_blocks()`
   function but forgot to set the counter. The a6xx version of this
   function correctly sets `nr_debugbus` at lines 372 and 384.

## Stable Tree Criteria Met

1. **Real bug affecting users**: Yes - debugbus data is completely
   missing from a7xx GPU crash dumps
2. **Small and contained fix**: Yes - single line addition:
   `a6xx_state->nr_debugbus = total_debugbus_blocks;`
3. **No architectural changes**: The fix simply sets an existing counter
   variable that was forgotten
4. **Minimal regression risk**: The change only affects the specific
   code path for a7xx GPUs and simply enables already-allocated and
   populated data to be displayed
5. **Critical debugging functionality**: GPU crash dumps are essential
   for debugging graphics driver issues in production

## Technical Details

The bug is in the a7xx-specific path where:
- Memory is allocated for `total_debugbus_blocks` entries (line 426)
- All blocks are populated via `a6xx_get_debugbus_block()` calls (lines
  430-439)
- But `nr_debugbus` is never set, leaving it at 0
- This causes `a6xx_show_debugbus()` to skip all debugbus output since
  it loops from 0 to `nr_debugbus`

The fix correctly sets `nr_debugbus = total_debugbus_blocks` after
populating all the data, matching the pattern used in the a6xx
equivalent function.

This is a perfect candidate for stable backporting as it fixes a clear
functional regression in debugging infrastructure without any risk of
destabilizing the system.

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a85d3df7a5fac..f46bc906ca2a3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -423,8 +423,9 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 				a6xx_state, &a7xx_debugbus_blocks[gbif_debugbus_blocks[i]],
 				&a6xx_state->debugbus[i + debugbus_blocks_count]);
 		}
-	}
 
+		a6xx_state->nr_debugbus = total_debugbus_blocks;
+	}
 }
 
 static void a6xx_get_debugbus(struct msm_gpu *gpu,
-- 
2.50.1


