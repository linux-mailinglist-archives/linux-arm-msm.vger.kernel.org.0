Return-Path: <linux-arm-msm+bounces-76712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2BFBC9F57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 18:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A97623BB305
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 16:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21852FABE1;
	Thu,  9 Oct 2025 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cv7t7SIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997F922688C;
	Thu,  9 Oct 2025 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025564; cv=none; b=U07JGe4P1d/JOA8zyL690EU/0HWFITbKzbxJLXrNz0oBkTP+VCAIxR3u8ywavATdj+zU5tbK2it25SbjYag12nhYKKaph+9sRSBH81RZ1VMZtjeTgv2f1nhS4x1jTOVKt9a8uRYpuLDpDQFCWh53HvN+P9n8Yu6DD2j0K+/K6V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025564; c=relaxed/simple;
	bh=W0q9E9dwLuU2298rxDy314pKXPzdQyQMN2XcPsthuwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cG0DG7OFlobnQg/OFBvCDxPZY5lbwMfQqPAEbdtCIz9QeeReQkv3EZwzhJqTukfKohBbFfvYUdKSIUoGTXlYOjNRV559Eit7MrS94jIRy4smKljQreokq6iPmnVo/arboN6wQY3rZ7qcPpF7DXZDqSfecdZhEBCS9/nWKE5YWaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cv7t7SIK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D726C4CEFE;
	Thu,  9 Oct 2025 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025564;
	bh=W0q9E9dwLuU2298rxDy314pKXPzdQyQMN2XcPsthuwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cv7t7SIK3rrd2jfqLzFqg7GD/K6Y+ks9E5yb3llp+7l7FbEXzkslhmFHM1kHMm8M/
	 WSR6QKtSWw1pJ6yBjhdr/52KuiGrI4DuoFSrLfCrZ1sRMMktigDb9nAu11TbBNpvu0
	 sDRhs9nv26JdHr06P4WTmOKvb60Lg7Ns1ZrjRid6Dpv5ob8xSyu6PWrSyLaX5eLrBD
	 5bL6wGdlUYy/5h9mw7EWeSKJDQ7aUsxrCsaLbmBvIX/xwmQZaTNnHccL6iwWvzooZQ
	 G4LkSrXZt0ewcvcWBU1OoTwPmwU1rKloKztl2hjXAOcKyYWLtGQPRF9Vn/1bl4ZE++
	 hVmiLlru22m/Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nikita Travkin <nikita@trvn.ru>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	bartosz.golaszewski@linaro.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.12] firmware: qcom: tzmem: disable sc7180 platform
Date: Thu,  9 Oct 2025 11:55:15 -0400
Message-ID: <20251009155752.773732-49-sashal@kernel.org>
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

From: Nikita Travkin <nikita@trvn.ru>

[ Upstream commit 3cc9a8cadaf66e1a53e5fee48f8bcdb0a3fd5075 ]

When SHM bridge is enabled, assigning RMTFS memory causes the calling
core to hang if the system is running in EL1.

Disable SHM bridge on sc7180 devices to avoid that hang.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES – Disabling the SHM bridge for sc7180 is a focused bug fix that
should be backported.

- `drivers/firmware/qcom/qcom_tzmem.c:79-86` keeps a blacklist of SoCs
  where SHM bridge must not be activated. Adding `"qcom,sc7180"` there
  makes the `for` loop in `qcom_tzmem_init()` bail out early
  (`drivers/firmware/qcom/qcom_tzmem.c:93-109`), leaving
  `qcom_tzmem_using_shm_bridge` false so the allocator stays in the safe
  generic mode.
- Without this change, sc7180 boots with SHM bridge enabled (arm64
  defconfig selects `CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y`, see
  `arch/arm64/configs/defconfig:265`), so `qcom_scm_shm_bridge_enable()`
  (`drivers/firmware/qcom/qcom_scm.c:1612-1636`) runs on every boot. On
  EL1-only firmware this causes the subsequent `qcom_scm_assign_mem()`
  from the RMTFS driver (`drivers/soc/qcom/rmtfs_mem.c:272-276`) to hang
  the CPU when it shares the modem buffer—an unrecoverable failure
  affecting common sc7180 Chromebooks and reference boards.
- The fix is consistent with earlier stable backports that blacklisted
  other SoCs for the same hazard (e.g. commits `55751d3e9e96d`,
  `8342009efa2a5`, `db3de3ff2611f`), underscoring that the risk is real
  and the mitigation is accepted practice.
- Impact is tightly scoped: only SHM-bridge builds on sc7180 change
  behaviour, falling back to the pre-existing generic allocator. No API,
  ABI, or architectural changes are involved, so regression risk is
  minimal while it prevents a hard hang.
- The underlying bug dates back to the SHM-bridge enablement
  (`f86c61498a573`, in v6.11-rc1), so all stable lines derived from 6.11
  (and newer) can be affected and benefit from the blacklist entry.

This satisfies stable-tree criteria: it fixes a severe runtime hang, the
patch is tiny and self-contained, and it simply restores the proven-safe
allocation mode on the affected hardware.

 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index ea0a353556570..12e448669b8bd 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -77,6 +77,7 @@ static bool qcom_tzmem_using_shm_bridge;
 
 /* List of machines that are known to not support SHM bridge correctly. */
 static const char *const qcom_tzmem_blacklist[] = {
+	"qcom,sc7180", /* hang in rmtfs memory assignment */
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
-- 
2.51.0


