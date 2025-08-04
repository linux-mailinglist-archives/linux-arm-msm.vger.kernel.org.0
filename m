Return-Path: <linux-arm-msm+bounces-67596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E449B19784
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 02:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E194174E3F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 00:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AB419C54B;
	Mon,  4 Aug 2025 00:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qptux7IQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9845A189513;
	Mon,  4 Aug 2025 00:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267310; cv=none; b=PKnVHpQEv0r3uEyIzLIZqYbebCilJl9ikBolxru7S7YqmwDLSchNoplto+0agJrmoE8dZfzN21fqL/vYdLGW9sZbfiWVfBFaTSwXCv47q8GWMT7Ss2i2/OEuV2KOdulk8DUsODYrHS5uKfVx0Z55edvKZ1UIVcbzjPUDP5YG7FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267310; c=relaxed/simple;
	bh=EW92l00zy7CcLZw6rdqRx30Xs3a9iLituA2wxOUlJLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c91np9tFY0Bm+dutCaexFD0Y4gPuToO8Vuh0PhQDKsPxqIXY1IB3N62SPRa/Gt46zYzJgab/E1iUVMZ6Prc4Wc6sY72fF+saFrdn3u8L4VdDYv9lFWCfwW37KOpYsKdtoA1Csgrmwk6Ovrnwi/rP45boFh2KUi8ctdqASRbrKE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qptux7IQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE26FC4CEF8;
	Mon,  4 Aug 2025 00:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267310;
	bh=EW92l00zy7CcLZw6rdqRx30Xs3a9iLituA2wxOUlJLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qptux7IQ+Hu7eytjMzGP8hxwMXU0xzJBBxdJXo9PhB1IANzrbnTPuwsM+27bhpj+B
	 AhC9OLEOJQS+pIL2VHR6HMxvXEUApOeXLyz5vVDOlUTZ4NRYQvP+N4Oaz0jfJEVE93
	 RU+VuAcsGDy0xuBF5nl6UWwPV1LAXjz5d7Bh6eUH+uGJi3Lxl6X/cQGLsLAEPMVdT3
	 QuQCliItL734RmiyNpJUEx5MXdOmHCT2Y5i6VFopg3xep0ZLJf6Yn/xauv8/qxdCCH
	 /GtbB/zPU5pJrgBaSBBfLEaOE5vq7vTZvRhIp8V2TTiC3KCta7ay1RelNByFIXf9FH
	 a6UC54LAKAx1A==
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
Subject: [PATCH AUTOSEL 6.15 14/80] soc: qcom: rpmh-rsc: Add RSC version 4 support
Date: Sun,  3 Aug 2025 20:26:41 -0400
Message-Id: <20250804002747.3617039-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804002747.3617039-1-sashal@kernel.org>
References: <20250804002747.3617039-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.9
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
index cb82e887b51d..fdab2b1067db 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -1072,7 +1072,7 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	drv->ver.minor = rsc_id & (MINOR_VER_MASK << MINOR_VER_SHIFT);
 	drv->ver.minor >>= MINOR_VER_SHIFT;
 
-	if (drv->ver.major == 3)
+	if (drv->ver.major >= 3)
 		drv->regs = rpmh_rsc_reg_offset_ver_3_0;
 	else
 		drv->regs = rpmh_rsc_reg_offset_ver_2_7;
-- 
2.39.5


