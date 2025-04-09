Return-Path: <linux-arm-msm+bounces-53656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B38FA82929
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D939A17CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872B126B2D6;
	Wed,  9 Apr 2025 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvQkpW4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580A026AAAA;
	Wed,  9 Apr 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210068; cv=none; b=FCzeMpL7fubrBbm3aB8qsNKu18XKsLEjqEehaArahZvPNPdiw8pmYozwKlBMGsodjGgUo/jMl9Toec80ck8zmh1x8cDj0AJEpW6Pm3JWWLgRPpKMQs+hHR98e8NMqca3Tsr+GkUzttjI1HzpihMOoqnK1k7bsRQRUf2FqleweJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210068; c=relaxed/simple;
	bh=ji/0WKfDuZz1CAwKz/ZybtrsgX+mKgql4YfuRrLSe7Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VaXC2KK8zuhyeGlXUZvwZWcADMM+hA0Ca0AsJjlyrAeBSjQko7rmxbNVTMef18hzsKkYDOj/yLpqnsyCIiaBweMjm5iFWwEm2FIZk6Vkz/tV9rbdOGAKuMIl9v3kKE5sJYHCf29poeWR2Eeta32LIXu+x5WFVoz9d9fD6zScF1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvQkpW4P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FFDC4CEEE;
	Wed,  9 Apr 2025 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744210067;
	bh=ji/0WKfDuZz1CAwKz/ZybtrsgX+mKgql4YfuRrLSe7Y=;
	h=From:Subject:Date:To:Cc:From;
	b=GvQkpW4PiR9zdWlVmXMb8UJq/yUM2yfBHZt8BZPf+RUR7dZsKEpl3GYehJDgky3+J
	 xb8H12Sva8VoEITNYWFXcC0yGKfzvqElvqGjTSirNF+2wYjo6BkiZ3ZI+ffnRC+3ZC
	 ZA1wQ8pP3f6kf06AnYv+GtzM6enrIpLk4Cncv4XiLy8iQkD9oNfMKPfTzYUU8HmCkQ
	 JM1eFsZDZe50iF/yg+3II6wtYqumMelSWi2a7n4eQELLlS/cnWY11yhMpe4QSBi17s
	 D5OpgmQ3dpFuxllD+JyRuBfJQXmD7p41AXzPqKsVmQIvaNoNs9c0sYKLWkIOQzlZl2
	 j7kq4XWjz5Z/w==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/4] Retrieve information about DDR from SMEM
Date: Wed, 09 Apr 2025 16:47:28 +0200
Message-Id: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAICI9mcC/x3MTQqAIBBA4avErBM08qeuEhGiU81CC40IpLsnL
 b/FewUyJsIMY1Mg4U2Zjlgh2gbcbuOGjHw1dLyTvOcDu46THMsBw+KTDY6pXmlhtHVGSajZmXC
 l519O8/t+whgWzGIAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744210063; l=1496;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ji/0WKfDuZz1CAwKz/ZybtrsgX+mKgql4YfuRrLSe7Y=;
 b=c7R7yPcUkBHQOwE2hoz8t4W9GhNYc/PRxrBiB9Sed6VzU1zJIsUk4Bac4G98pCP0PWDrOwngA
 Jk8deOjsENpB6u0YyU9/D/sMvd0Z4mEGOB42gNYtc5hN+u4/wJyoz61
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
Konrad Dybcio (4):
      soc: qcom: Expose DDR data from SMEM
      drm/msm/a5xx: Get HBB dynamically, if available
      drm/msm/a6xx: Get HBB dynamically, if available
      drm/msm/mdss: Get HBB dynamically, if available

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  13 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  22 ++-
 drivers/gpu/drm/msm/msm_mdss.c        |  35 ++++-
 drivers/soc/qcom/Makefile             |   3 +-
 drivers/soc/qcom/smem.c               |  14 +-
 drivers/soc/qcom/smem.h               |   9 ++
 drivers/soc/qcom/smem_dramc.c         | 287 ++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h         |   4 +
 8 files changed, 371 insertions(+), 16 deletions(-)
---
base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
change-id: 20250409-topic-smem_dramc-6467187ac865

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


