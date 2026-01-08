Return-Path: <linux-arm-msm+bounces-88100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C502D03F3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 382A231972A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B7C46AEC9;
	Thu,  8 Jan 2026 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRWhHE5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B15C465F43;
	Thu,  8 Jan 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882130; cv=none; b=gaXkC/8HZTzoDB8oz1swoq4J0XkmN8HaA355qrzf7WMEq6IJu5pAcyqCuR+z4+eyAdJ9WlIahkdbUzonrgjFu3xV5VNSde5OzA+LuMir79Hl/c0q1sPW1ZwxX98GioC+copSp1JkBVH1AUkbi0EUILd272qXOmUu0MfRMtmcFjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882130; c=relaxed/simple;
	bh=tKu8wkafqE/pA3rwnLcxiFY9F8b5UhRYf0wNzWuzPpM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XMoNvsxHCYzkDIN/PCfVRPGX7GoXwV7uPyo4mZi1tOqBpmnnBM0Z9q4wL/nstKc0fiwATrdWbUC8tyTf2zI759LSD/8q6S7gSvXnKgF2rht1ViRNhiCUZBHlv9+j56MV8Ppe6cTEWPjmyUVfLcPTET4gjI5wzV3Nt6HbykpfKEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRWhHE5A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A617AC116C6;
	Thu,  8 Jan 2026 14:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767882128;
	bh=tKu8wkafqE/pA3rwnLcxiFY9F8b5UhRYf0wNzWuzPpM=;
	h=From:Subject:Date:To:Cc:From;
	b=XRWhHE5AUko/ik131W3SeengvwvCPMdMs1jCIqvovh1DDZpDyI10Fd5l9Uf1SBppF
	 bN0hNTika5p0V9AusPCDKzOIQYfqxMxubGr5O+/NN4+v7l0oM1a3fi7j6uS5AXTU3l
	 vR6h5FrpElEKxLX9GOZhzdRJC4mnRxe4rqcAYsQGSjMLMPHOfdGjXPyepO+pKnVQa7
	 vE+WoWV1Nk2jdIdgiWCKlJJXBEaofc32GqqBxWe34/cMBULKjuSZv0a+GBCVQyxOAB
	 Olm7LT1i2xklj8Jtn9OWNTgddekfBaf3UI9m0sdsx2JlsYf9rYoV+JFzKKKIxMtbQE
	 5SCsvCtM8hm3g==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 0/3] Retrieve information about DDR from SMEM
Date: Thu, 08 Jan 2026 15:21:49 +0100
Message-Id: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH29X2kC/33N0QrCIBSA4VcZXudQp27rqveICFFrQs7lWVIM3
 z23qy5GNwf+A+c7CwIbnQV0rBYUbXLgwliiOVRID2q8W+xMacQIE4STHs9hchqDt/5qovIaSy5
 b2rVKd1KgcjZFe3PvjTxfSg8O5hA/24dE1+0fLFFMcM+NIEIbIfrmFADq50s9dPC+LgOtZmI/D
 iU7DiuOscpQwSRvKd9xcs5fSrjRC/8AAAA=
X-Change-ID: 20250409-topic-smem_dramc-6467187ac865
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767882123; l=2277;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tKu8wkafqE/pA3rwnLcxiFY9F8b5UhRYf0wNzWuzPpM=;
 b=zIWs5L9xG9MfqFbQxITrMz2UL59R32IAFpo0lqHAVUIgRlQROs0ALC6ktTPU59YCI9XuTP1LS
 cPkEEKecVCGCCek0CjjmY/0qUYvQnFJRMjbxYkMLQ6l2TaIJEL/hDX5
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

SMEM allows the OS to retrieve information about the DDR memory.
Among that information, is a semi-magic value called 'HBB', or Highest
Bank address Bit, which multimedia drivers (for hardware like Adreno
and MDSS) must retrieve in order to program the IP blocks correctly.

This series introduces an API to retrieve that value, uses it in the
aforementioned programming sequences and exposes available DDR
frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
information can be exposed in the future, as needed.

Patch 3 should really be merged after 1&2

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
- Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
- Handle rare cases of DDRInfo v5 with additional trailing data
- Rebase/adjust to SSoT UBWC
- Expose hbb value in debugfs
- cosmetic changes
- Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com

Changes in v2:
- Avoid checking for < 0 on unsigned types
- Overwrite Adreno UBWC data to keep the data shared with userspace
  coherent with what's programmed into the hardware
- Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
  branches separately
- Pick up Bjorn's rb on patch 1
- Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com

---
Konrad Dybcio (3):
      soc: qcom: smem: Expose DDR data from SMEM
      soc: qcom: ubwc: Get HBB from SMEM
      drm/msm/adreno: Trust the SSoT UBWC config

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
 drivers/soc/qcom/Makefile               |   3 +-
 drivers/soc/qcom/smem.c                 |  14 +-
 drivers/soc/qcom/smem.h                 |   9 +
 drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++++++++++++++
 drivers/soc/qcom/ubwc_config.c          |  69 ++++--
 include/linux/soc/qcom/smem.h           |   4 +
 9 files changed, 485 insertions(+), 120 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20250409-topic-smem_dramc-6467187ac865

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


