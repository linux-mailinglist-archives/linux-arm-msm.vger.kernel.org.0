Return-Path: <linux-arm-msm+bounces-85095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B6368CB79EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 03:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 346E83004459
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 02:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A8C229B1F;
	Fri, 12 Dec 2025 02:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mP5r74DD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E901990C7;
	Fri, 12 Dec 2025 02:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505296; cv=none; b=VBtntxHNP+bEywE6icQx8Gq2G2s3ucSGEiFEUMdVqMoKnSSK3QG8RP1gHxlCwlmVoL2OOhlBEOu2poNWJgJV1JU1Oqyl/IMy8qk+mZ7algfIv/50LS5iSEZZ/nwxtVb1L1AmCuxQ3vNU3YsEqfcXQdLJrED19ZY4Ft2z0Wr9A3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505296; c=relaxed/simple;
	bh=a0/1EY4VStKzIBoErYHqrL5pDfaSE0HuDVFh5XOPuhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=REKBYCqwBtRxSDEduEkao9Y6MtBKPgUOzaqD1+zZUAZyvP+vBUAYPyM3ZRYC6+1IEH2Kpmc/6DZcmFq09khBCs1h4bwcOtZZ8Jbow7iNMMSCeDl6YWTAIFdspfEwpVncgC33R12NpYtr2BkYtuwI/1ofnJkpU038d0yxPkfABTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mP5r74DD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D6AC4CEF7;
	Fri, 12 Dec 2025 02:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505295;
	bh=a0/1EY4VStKzIBoErYHqrL5pDfaSE0HuDVFh5XOPuhE=;
	h=From:To:Cc:Subject:Date:From;
	b=mP5r74DDRf35AErWYYisduSvezaiQuPRHUPupsL/OTh+ctDZI7reGr/ZezPw+iRfR
	 3PfgTa1/e/Hgbi9aQR04jXFqE3sFHGUmKXLUuaqfCOSOMDoG90ZQS4NRRgc4dPH8QT
	 sVD6fWp0ZF8rqqGRRTISMCL3Q7mnlfxpi/WMcvauuWwZID7IDYbXPBv0tZk8fFVdHN
	 +AKZbQ+hASzE9vFmvUzBBO0leXtDyq73MylLv9EKR0/lNiBWDVOb4rH6fc54lG7nHZ
	 AGT2gx7zPYVKqsYTb6GYZYDVnABAbtWpvhq4anfmvJCy67ATxDTRpdvtQE4kDeo23l
	 O7gu+iezCKzyA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jens Reidel <adrian@mainlining.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-6.12] clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk0_clk_src
Date: Thu, 11 Dec 2025 21:08:11 -0500
Message-ID: <20251212020812.4153432-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18
Content-Transfer-Encoding: 8bit

From: Jens Reidel <adrian@mainlining.org>

[ Upstream commit e3c13e0caa8ceb7dec1a7c4fcfd9dbef56a69fbe ]

Set CLK_OPS_PARENT_ENABLE to ensure the parent gets prepared and enabled
when switching to it, fixing an "rcg didn't update its configuration"
warning.

Signed-off-by: Jens Reidel <adrian@mainlining.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20250919-sm7150-dispcc-fixes-v1-3-308ad47c5fce@mainlining.org
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

### 3. Technical Understanding

The `CLK_OPS_PARENT_ENABLE` flag (BIT(12) in clk-provider.h) ensures
that "parents need enable during gate/ungate, set rate and re-parent."
Without this flag, when the pixel clock source tries to switch to a new
parent clock, the parent might not be enabled, causing the RCG (Root
Clock Generator) to fail to update its configuration.

This is a well-known pattern in Qualcomm clock drivers - pixel clocks
dynamically switch parents during display panel initialization, and the
parent must be running for the configuration switch to complete.

### 4. Scope and Risk Assessment
- **Lines changed**: 1 line (adding a single flag)
- **Files touched**: 1 file
- **Complexity**: Very low
- **Risk**: Very low - this is an established pattern used across many
  Qualcomm dispcc/gcc drivers

### 5. User Impact
- Affects SM7150-based devices (mobile phones)
- The warning indicates clock configuration issues that could affect
  display initialization
- Limited scope - only SM7150 platform users

### 6. Stable Tree Applicability
- Driver was added in **v6.11** (commit 3829c412197e1)
- Only applicable to v6.11.y, v6.12.y, and newer stable trees
- NOT applicable to LTS kernels: 6.6.y, 6.1.y, 5.15.y (driver doesn't
  exist)

### 7. Key Observations

**Against backporting:**
1. **No "Cc: stable@vger.kernel.org" tag** - The maintainers did not
   request stable backport
2. **No "Fixes:" tag** - Doesn't reference the original commit where the
   bug was introduced
3. **Very new driver** - SM7150 dispcc was added in v6.11, limiting
   stable applicability
4. **Not a critical issue** - A warning message, not a crash, panic, or
   data corruption
5. **Mobile SoC** - Users running stable kernels rarely use cutting-edge
   mobile phone support

**For backporting:**
1. Valid bug fix with proven pattern
2. Extremely small and low-risk change
3. Has proper review from Qualcomm clock maintainers

 drivers/clk/qcom/dispcc-sm7150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
index bdfff246ed3fe..ddc7230b8aea7 100644
--- a/drivers/clk/qcom/dispcc-sm7150.c
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -356,7 +356,7 @@ static struct clk_rcg2 dispcc_mdss_pclk0_clk_src = {
 		.name = "dispcc_mdss_pclk0_clk_src",
 		.parent_data = dispcc_parent_data_4,
 		.num_parents = ARRAY_SIZE(dispcc_parent_data_4),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_pixel_ops,
 	},
 };
-- 
2.51.0


