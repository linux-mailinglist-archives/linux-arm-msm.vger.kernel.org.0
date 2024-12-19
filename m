Return-Path: <linux-arm-msm+bounces-42872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C579F87F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07C761898630
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333551BDABE;
	Thu, 19 Dec 2024 22:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKw5uTiL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088E286337;
	Thu, 19 Dec 2024 22:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734647833; cv=none; b=q0qMic8Qb3aQPWCg3GPaBAFh7Df3IsJ+nu1vBWIwmFqVC8Ir3zPgeDwfx50GVblAegCyWzZzZ7M7Vvr1ZqXS/g+LQMJGpbf1M/kRCajac3vanW8y3x7TbgXoM4z9U0Nu4A8XMIvdQs4jErG+7lvWG4O1AMZUaNIRvu5FzamxW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734647833; c=relaxed/simple;
	bh=v5hV4AcXGyzngmHLzfcNY3dZttHo/6M+Ma5Nsjria24=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D+lIeIqAIuNbXTbrqTLiYXxEL1Tbia5truTeX5jXwbEVCl84GV446hA3TnXqpp6XPsip2UmB/kdlg7F6+KQ5/+bYIfnF7rQnIRxdjddVAY4O/gQ+Trt9LKCXaH/tEloNUNTtPjtySpAEg60uDy68axHYcUY9Dtnrgxdr48XEgoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKw5uTiL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DFCC4CECE;
	Thu, 19 Dec 2024 22:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734647832;
	bh=v5hV4AcXGyzngmHLzfcNY3dZttHo/6M+Ma5Nsjria24=;
	h=From:Subject:Date:To:Cc:From;
	b=fKw5uTiLj5/xOqtpCdQEvbxCswysTb6fGxGd3jBT3XKFXEDToTO3JY7rsfbfTE4pi
	 hs6krl1LuYqc9/ffLHjbfyL9Prpa6bJs7Bvadbgd4I1MklLBtEAXv7IRm4RWsnb+xP
	 3eu6+xoz+xo8WqGAmdWAJKXsoik0wy+q8FRdo6XZX7Sc01PG7dPEEGvPzy9UPbnG9C
	 YmBn1S1w8Hll4HOQZUClNzXKXbvEYBNZrtz9dDbrobmBoFdL4g44HKRr43csm0bmXy
	 mRhqnLT6cwpPVp16T8RdyYY//a2HLY3Iu0VfdMzNzKMS6qYdMXVtMRCPD3jhANjWp2
	 FsrMA7nPTM9RQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] Print GMU version at boot on >A630
Date: Thu, 19 Dec 2024 23:36:54 +0100
Message-Id: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAagZGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0NL3ZL8gsxk3fTc0vi08viy1CJdMwPLVIskCzNzCwMjJaC2gqLUtMw
 KsJHRsbW1AAwvlU1iAAAA
X-Change-ID: 20241219-topic-gmu_fw_ver-609e8b867802
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734647828; l=747;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=v5hV4AcXGyzngmHLzfcNY3dZttHo/6M+Ma5Nsjria24=;
 b=C6vOiblShlvGe2gARR+WhlpSno5NovLTuEY8kb7WEXR/FbLJcVGteu2UgmXqnGTQctVdgakH3
 Pq0xODxI4otBfH6YfncXhiZigTP7ZlL7tN1LUr5/Bue2n07wEMkKInG
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Might come in useful to try and track down otherwise inexplicable
failures in e.g. old CI logs. A630 uses a different mechanism that is
not implemented in this series.

Tested on 8280 and X1

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (2):
      drm/msm: registers: Add GMU FW version register
      drm/msm/a6xx: Print GMU core firmware version at boot

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 7 +++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 5 +++++
 2 files changed, 12 insertions(+)
---
base-commit: 8503810115fbff903f626adc0788daa048302bc0
change-id: 20241219-topic-gmu_fw_ver-609e8b867802

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


