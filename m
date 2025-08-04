Return-Path: <linux-arm-msm+bounces-67602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D8CB19821
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 02:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA96C3AEC24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 00:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E921C1F02;
	Mon,  4 Aug 2025 00:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkQ9fiZ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C220481B1;
	Mon,  4 Aug 2025 00:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267509; cv=none; b=R8fIXWqDFdZjokL0RABoN1bJKNkxuvN54Sk0j/RUjdDE4HUPFbqTN1ckyYaAyOxA1Fw8zuwn1fMUSZH+y6+4S2eSgcOmR/6dilkoesc8k2nBIlr45elL5F5RoA6+pKT6nxqQ6lAZ94ISnD5L3vYffYGuiGOZ9Jqjd4ViE7ehQgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267509; c=relaxed/simple;
	bh=mdA+lRIHFHrGDfwthnofhkDzS92U3wz5l52HNYz0KvI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lwj3LB7hShxIkBG3HubQXBd4RMVJOfxQKYHxXmdUsJjRuoBcchuUMSKs5kN0Ovii5ECQQZKwNpIiuShFg9NfB50y29LZjO/KC3mab386/4QOKcrJ3NwG6cr+kT7d+nS8II7Uk8MZhuFVN3FWToOmuufKCkEaoklYnhOZgGTqqrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkQ9fiZ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2BDC4CEEB;
	Mon,  4 Aug 2025 00:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267509;
	bh=mdA+lRIHFHrGDfwthnofhkDzS92U3wz5l52HNYz0KvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HkQ9fiZ24RkH6xUgzPIzv7oQWhtCmAkyhmDB2AYfzcAnBAC14TSZfkZrOeltfiMxP
	 yet5oyXi+KtwgDH2pGKlmx/R6ht17lInSfhhK+6oQ05rTwQwz+cOH/5pSMwqmCP2N7
	 xUQ6coJdsHutMGsTS9qcSTHDrvQ+RjKIyDBYAcwlLHsGGihKbk7NPk1qtXvf1mC6E0
	 K1l9qlD6dKAHS9khKAeKNq3DLpI/hXjmopdw8d2h1jQ76ay5j3VNuiEhmscdSs0FXd
	 FWQ7BQn3/Mv20ezNpcEYZic2WDhBW3OsIYvyVfVT0Q8rLqD7CyeM4n/5kwenmH4yPH
	 nEdkmfo0yonQw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 11/69] soc: qcom: rpmh-rsc: Add RSC version 4 support
Date: Sun,  3 Aug 2025 20:30:21 -0400
Message-Id: <20250804003119.3620476-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804003119.3620476-1-sashal@kernel.org>
References: <20250804003119.3620476-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.41
Content-Transfer-Encoding: 8bit

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

[ Upstream commit 84684c57c9cd47b86c883a7170dd68222d97ef13 ]

Register offsets for v3 and v4 versions are backward compatible. Assign v3
offsets for v4 and all higher versions to avoid end up using v2 offsets.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://lore.kernel.org/r/20250623-rsc_v4-v1-1-275b27bc5e3c@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit, here is my assessment:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Bug Fix Nature**: The commit fixes a real bug where RSC version 4
   devices would incorrectly use version 2.7 register offsets instead of
   version 3.0 offsets. The code change shows that before this fix, only
   `drv->ver.major == 3` would select v3 offsets, meaning version 4 (and
   any higher versions) would fall through to use v2.7 offsets, which
   are incompatible.

2. **Clear Register Offset Incompatibility**: Looking at the register
   offset arrays in drivers/soc/qcom/rpmh-rsc.c:
   - v2.7 offsets: RSC_DRV_CMD_OFFSET = 20, RSC_DRV_CMD_WAIT_FOR_CMPL =
     0x10
   - v3.0 offsets: RSC_DRV_CMD_OFFSET = 24, RSC_DRV_CMD_WAIT_FOR_CMPL =
     0x20

   These are significantly different offsets that would cause incorrect
hardware register access on v4 devices.

3. **Small and Contained Fix**: The change is minimal - just changing
   `if (drv->ver.major == 3)` to `if (drv->ver.major >= 3)`. This is a
   one-line logic fix that ensures v4 and higher versions use the
   correct v3.0-compatible register offsets.

4. **Hardware Enablement for Existing Devices**: This is not adding new
   features but fixing broken support for hardware that already exists.
   Without this fix, any Qualcomm SoC with RSC v4 would malfunction when
   trying to use RPMH (Resource Power Manager Hardened) functionality.

5. **Low Risk**: The change only affects devices with RSC version 4 or
   higher. It doesn't modify behavior for existing v2 or v3 devices. The
   commit message explicitly states that "Register offsets for v3 and v4
   versions are backward compatible."

6. **Critical Subsystem**: RPMH-RSC is a critical component for power
   management on Qualcomm SoCs. Incorrect register access could lead to
   system instability, power management failures, or complete inability
   to boot on affected devices.

The commit follows stable kernel rules by being a targeted bug fix that
enables proper hardware support without architectural changes or new
features.

 drivers/soc/qcom/rpmh-rsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index de86009ecd91..641f29a98cbd 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -1075,7 +1075,7 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	drv->ver.minor = rsc_id & (MINOR_VER_MASK << MINOR_VER_SHIFT);
 	drv->ver.minor >>= MINOR_VER_SHIFT;
 
-	if (drv->ver.major == 3)
+	if (drv->ver.major >= 3)
 		drv->regs = rpmh_rsc_reg_offset_ver_3_0;
 	else
 		drv->regs = rpmh_rsc_reg_offset_ver_2_7;
-- 
2.39.5


