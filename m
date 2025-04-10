Return-Path: <linux-arm-msm+bounces-53895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7196DA84B6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 19:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 760D818872E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 17:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C0A28A3EA;
	Thu, 10 Apr 2025 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSkZG0aC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8358528541F;
	Thu, 10 Apr 2025 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307040; cv=none; b=C7KzlLf/DZzU4Nc54OpNuFilyGL7YW3ZSkkpteZG3NBH74OoPTuvHk6S1LQvsonRAhdPzKTIXukrS4QsNFq/yuXdUsTXsFVINWnMNXvDVPDMXKgs4+gIN0d2dEGUOFucAIV9OE5HJc204fk4F7p3/Em9Cl7AQPKuLWqFs6g0xxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307040; c=relaxed/simple;
	bh=kB4QNAAppV15ZuP1LMhUMLMfHgT1XEDI5J57Qvqk9A8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kmcdy/NsTH6GwTVJLJHMxRl7bjZc+Ixvn848iTYEbHMDCne9QB9ylHsuvkmqhnYKWkYhYPeA81aL+TuZkT/HtH5g6MtPQSxLMx5LkRB8NRkM+/oGMRCJdMnqPnM+RRk50YTSl7RNC1iC7I8moxETiuQwIBFq4tZSSKS5sqTuCY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSkZG0aC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9EFC4CEDD;
	Thu, 10 Apr 2025 17:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744307040;
	bh=kB4QNAAppV15ZuP1LMhUMLMfHgT1XEDI5J57Qvqk9A8=;
	h=From:Subject:Date:To:Cc:From;
	b=OSkZG0aCy0I7g5gf1twPji37giaipM088tZEfTjoFny+B0LYPsbVztsbV0F9F5DSd
	 D5lk0mw0q5jZzTf3dpBDE1M8L8E83Gba9uphMR9Uyhl/9u/aXQ7qxwovfKQsn+AbPB
	 XVTjDNulTuWjxieSeEWlH/+sRkHtGzhosXGjl3thGc6sh0ERaqq9R3Zdf7XMHTw50k
	 Jtc8rTM2KV6C0WdPkVPywC1X8TJi3+3EcANhV3URyOKLMgGlvB8cIdTBo61a5ASGjy
	 mIAu8dCFFf0NhWHbMPvBZ/a57fuFeuRSsKHEqd1BTFaI1bBcFiO0R4CVqP78GjMf/T
	 /60bFJ0CXWLgg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/4] Retrieve information about DDR from SMEM
Date: Thu, 10 Apr 2025 19:43:43 +0200
Message-Id: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8D+GcC/32NQQrCMBREr1L+2pQ0JmnryntIkZBE+8E0Nb8Wp
 eTuxh7AzcAbmDcbkE/oCU7VBsmvSBinAuJQgR3NdPcMXWEQXCguec+WOKNlFHy4umSCZVrqtul
 aYzutoMzm5G/43pWXofCItMT02R/W5tf+ka0N46yXTnFlnVL98RyJ6ufLPGwMoS4BQ875C7CDb
 Uq3AAAA
X-Change-ID: 20250409-topic-smem_dramc-6467187ac865
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744307035; l=1906;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=kB4QNAAppV15ZuP1LMhUMLMfHgT1XEDI5J57Qvqk9A8=;
 b=dDP9gtMOHaECK+JRgwCAtY61jI74F1uXdY6VRPGOdFHzueFljuQ3VrToIXKhq0JJn7Qv/FAUv
 9xSsC+fBPIxCQe4dPn1/PeaxaPg6VtMxkeUqtDQjDWv87aGoo5kcOFL
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

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Avoid checking for < 0 on unsigned types
- Overwrite Adreno UBWC data to keep the data shared with userspace
  coherent with what's programmed into the hardware
- Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
  branches separately
- Pick up Bjorn's rb on patch 1
- Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com

---
Konrad Dybcio (4):
      soc: qcom: Expose DDR data from SMEM
      drm/msm/a5xx: Get HBB dynamically, if available
      drm/msm/a6xx: Get HBB dynamically, if available
      drm/msm/mdss: Get HBB dynamically, if available

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  15 +-
 drivers/gpu/drm/msm/msm_mdss.c        |  30 ++--
 drivers/soc/qcom/Makefile             |   3 +-
 drivers/soc/qcom/smem.c               |  14 +-
 drivers/soc/qcom/smem.h               |   9 ++
 drivers/soc/qcom/smem_dramc.c         | 287 ++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h         |   4 +
 8 files changed, 360 insertions(+), 14 deletions(-)
---
base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
change-id: 20250409-topic-smem_dramc-6467187ac865

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


