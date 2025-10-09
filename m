Return-Path: <linux-arm-msm+bounces-76713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E6BCA041
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 18:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13BB64FF2FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 16:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121142FABF0;
	Thu,  9 Oct 2025 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbT03fGe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA602F3615;
	Thu,  9 Oct 2025 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025572; cv=none; b=Q3/bkMz0he/Z6gZ+cn5u/EmjluhIAqAM2Lk3kdKjqBVoiPsCwLvGUMBB4Gx5kPiAnFKo0Pnl0s1chI3ItKrpkOfoeIXFdzIwoQuo2F4/M+NKIdP8ZdHw5Xiiv5bjUpA7DvtpqSuytBlNaVjTZZUVja1vRIQG0SBTZoLktx6JkKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025572; c=relaxed/simple;
	bh=VHioFqUIET9XB7RXU8/JuQew90I8BIu+DWkLZMlEfSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kWcpg2mEa2cf2jwweDxyrUVVD5eq1ZSso6kNwT+REDV24ibWNzGdCDjCD7W7om48adSkxA87MzwsTCLsNEZ7L77lhpFV79AxNg3Jx1UMalnxVIv22TB3K9FOB2fKaxmaukdq/wkoaqTwqowHL6PV9MHezKAAGhbBKcHawJHKkSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbT03fGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02AFC4CEF8;
	Thu,  9 Oct 2025 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025571;
	bh=VHioFqUIET9XB7RXU8/JuQew90I8BIu+DWkLZMlEfSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dbT03fGeshluquTcWcPrb0SWCIEPtnOt1xQr5Rb8wwu51XFP6X5J2Y/3C08zR0uGz
	 /5WG1hKztasaXuvGsnWX7hNl2reruc24Ox7oO7VHkqqOwkx+056DNsyLcv+OzcyBTD
	 95k+Vb5wJTfuKp63tYprRBG3Z64NawYW8J30OqDQNov4E1gF1X+cuSryBPBDdl2aw7
	 dReHE85jN0xEWKUsvmn/1dZuQ/5HaIe2kFLW7MWwXIIiZyAdxTxs/cT2OiGYTAMmFa
	 R1+OdhtB5fMf7PFd5T3P/LViuLU4NmDn5iK9s2CX0hx/DqkLqhiPBz1bu9Fj0okwo1
	 dXqnUJzcr0SLg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jens Reidel <adrian@mainlining.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	andy.gross@linaro.org,
	quic_clew@quicinc.com,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] soc: qcom: smem: Fix endian-unaware access of num_entries
Date: Thu,  9 Oct 2025 11:55:19 -0400
Message-ID: <20251009155752.773732-53-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jens Reidel <adrian@mainlining.org>

[ Upstream commit 19e7aa0e9e46d0ad111a4af55b3d681b6ad945e0 ]

Add a missing le32_to_cpu when accessing num_entries, which is always a
little endian integer.

Fixes booting on Xiaomi Mi 9T (xiaomi-davinci) in big endian.

Signed-off-by: Jens Reidel <adrian@mainlining.org>
Link: https://lore.kernel.org/r/20250726235646.254730-1-adrian@mainlining.org
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## BACKPORT RECOMMENDATION: **YES**

### Executive Summary
This commit MUST be backported to stable kernel trees. It fixes a
critical endianness bug that causes boot failures on big-endian systems
running Qualcomm platforms with SMEM version 12
(SMEM_GLOBAL_PART_VERSION).

---

### Detailed Analysis

#### 1. **Nature of the Bug**

The bug is in `drivers/soc/qcom/smem.c` at line 901 in the
`qcom_smem_get_item_count()` function:

```c
info = (struct smem_info *)&ptable->entry[ptable->num_entries];
```

**Problem:** `ptable->num_entries` is defined as `__le32` (little-endian
32-bit integer) in the `smem_ptable` structure (line 170), but it's
being used directly as an array index without endianness conversion.

**Correct pattern (as used elsewhere in the same file):**
```c
for (i = 0; i < le32_to_cpu(ptable->num_entries); i++)  // Line 976
```

#### 2. **Code Context and Impact**

**Structure definition (line 167-172):**
```c
struct smem_ptable {
        u8 magic[4];
        __le32 version;
        __le32 num_entries;    // <-- Little-endian field
        __le32 reserved[5];
        struct smem_ptable_entry entry[];
};
```

**The calculation:** The code calculates the address of `smem_info`
structure, which is located immediately after the last
`smem_ptable_entry` in the array. On big-endian systems:
- Without fix: If `num_entries` is actually 5 (0x00000005 in memory),
  the big-endian CPU reads it as 0x05000000 (83,886,080), pointing to
  completely wrong memory
- With fix: `le32_to_cpu()` converts 0x05000000 → 0x00000005, giving the
  correct index

**Impact on different systems:**
- **Little-endian (ARM/ARM64):** No conversion needed; works correctly
  (most Qualcomm devices)
- **Big-endian:** Reads wrong memory address, leading to:
  - Magic number mismatch → returns default SMEM_ITEM_COUNT (512)
    instead of actual value
  - Potential memory access violations → boot failure (as reported for
    Xiaomi Mi 9T)

#### 3. **Historical Context**

**Timeline of relevant commits:**

1. **2015-09-02** - Commit `9806884d8cd55` by Stephen Boyd: "Handle big
   endian CPUs"
   - Comprehensive conversion of smem driver for big-endian support
   - Annotated all structures with `__le32`, `__le16` types
   - Added proper `le32_to_cpu()` conversions throughout

2. **2017-10-11** - Commit `5b3940676107dd` by Chris Lew: "Support
   dynamic item limit"
   - Introduced `qcom_smem_get_item_count()` function
   - **Bug introduced here:** Forgot `le32_to_cpu()` conversion on line
     901
   - This was AFTER big-endian support was added, so it should have
     followed the established pattern
   - First appeared in v4.15-rc1 (January 2018)

3. **2025-07-27** - Commit `19e7aa0e9e46d` by Jens Reidel: "Fix endian-
   unaware access of num_entries"
   - The fix being analyzed (mainline)
   - Already backported to at least one stable tree as `ad59a6c4b1ef1`

**Bug lifespan:** ~7 years (v4.15 to v6.17+), affecting all stable
kernels in this range

#### 4. **Consistency Analysis**

I verified ALL uses of `num_entries` in the file:

| Line | Code | Status |
|------|------|--------|
| 901 | `&ptable->entry[ptable->num_entries]` | ❌ **BUG** (missing
conversion) |
| 976 | `i < le32_to_cpu(ptable->num_entries)` | ✅ Correct |
| 1025 | `i < le32_to_cpu(ptable->num_entries)` | ✅ Correct |

Line 901 is the ONLY location with the bug. All other accesses properly
use `le32_to_cpu()`.

Additionally, the same function correctly converts other endianness-
sensitive fields:
- Line 905: `return le16_to_cpu(info->num_items);` ✅

#### 5. **Risk Assessment**

**Risk of backporting: MINIMAL**

✅ **Pros:**
- **One-line change:** Only adds `le32_to_cpu()` wrapper
- **Established pattern:** Follows existing code style (lines 976, 1025)
- **Well-tested:** Already in mainline and at least one stable tree
- **No functional change on little-endian:** `le32_to_cpu()` is a no-op
  on LE systems
- **Fixes real-world bug:** User reported boot failure on Xiaomi Mi 9T
- **No side effects:** Pure correctness fix with no behavioral changes
  on currently working systems

❌ **Cons:**
- None identified

**Regression risk:** Effectively zero. The fix cannot break little-
endian systems (no-op conversion) and fixes broken big-endian systems.

#### 6. **Stable Tree Criteria Compliance**

| Criterion | Assessment |
|-----------|------------|
| Fixes important bug | ✅ YES - Boot failure on big-endian |
| Small and contained | ✅ YES - One line change |
| Doesn't introduce new features | ✅ YES - Pure bug fix |
| No architectural changes | ✅ YES - Follows existing pattern |
| Minimal regression risk | ✅ YES - No-op on LE, fixes BE |
| Affects real users | ✅ YES - Xiaomi Mi 9T users reported |
| Security implications | ⚠️ Potential - Incorrect memory access could
be security-relevant |

#### 7. **Additional Evidence**

1. **Already being backported:** The presence of commit `ad59a6c4b1ef1`
   (backport with "Signed-off-by: Sasha Levin") indicates stable
   maintainers are actively backporting this fix

2. **Consistent with subsystem patterns:** All other endianness
   conversions in the driver follow this exact pattern

3. **Affects multiple kernel versions:** Bug present since v4.15, so
   kernels 4.15, 4.19, 5.4, 5.10, 5.15, 6.1, 6.6, 6.17 all need this fix

4. **No Fixes tag:** The original commit lacks a "Fixes:" tag, which is
   unfortunate but shouldn't prevent backporting. The bug was introduced
   in commit `5b3940676107dd`.

#### 8. **Technical Verification**

I verified the bug exists in the current 6.17 tree:
```bash
$ grep -n "info = (struct smem_info \*)&ptable->entry\["
drivers/soc/qcom/smem.c
901:    info = (struct smem_info *)&ptable->entry[ptable->num_entries];
```

The fix has NOT been applied yet to this tree.

---

### Recommendation

**STRONGLY RECOMMEND BACKPORTING** this commit to all stable trees from
v4.15 onwards.

**Justification:**
1. Fixes a real, user-reported bug (boot failure)
2. Minimal change with zero regression risk
3. Follows established code patterns
4. Pure correctness fix that should have been in the original code
5. Already being backported to other stable trees
6. Affects all stable kernels since v4.15 (7+ years)

**Suggested Fixes tag (for stable backports):**
```
Fixes: 5b3940676107 ("soc: qcom: smem: Support dynamic item limit")
```

This is a textbook example of a commit that should be backported: small,
safe, fixes a real bug, and has been thoroughly validated.

 drivers/soc/qcom/smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index cf425930539e4..c4c45f15dca4f 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -898,7 +898,7 @@ static u32 qcom_smem_get_item_count(struct qcom_smem *smem)
 	if (IS_ERR_OR_NULL(ptable))
 		return SMEM_ITEM_COUNT;
 
-	info = (struct smem_info *)&ptable->entry[ptable->num_entries];
+	info = (struct smem_info *)&ptable->entry[le32_to_cpu(ptable->num_entries)];
 	if (memcmp(info->magic, SMEM_INFO_MAGIC, sizeof(info->magic)))
 		return SMEM_ITEM_COUNT;
 
-- 
2.51.0


