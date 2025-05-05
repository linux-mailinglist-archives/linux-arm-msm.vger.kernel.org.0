Return-Path: <linux-arm-msm+bounces-56776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F810AA91AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 13:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DFDE1883D20
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 11:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F221FC7D9;
	Mon,  5 May 2025 11:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qh8+eQ5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D3F1459F7;
	Mon,  5 May 2025 11:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443629; cv=none; b=JjXrxUV9iFBNCtaSNsOppnLb8r/ah3tBBwJ0sxLiXHVcPxMblNLsRf2rATUbcMHWtbecX3KCSAaiz71hPAN5Eu87z1q3iOgOiZMRm4iyd9rgF2V47p24WW2EnLW7lUqPzmgnuEIXoYF/vDFELtZRRwyUV1yBAUAQeHcPMQ6XUag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443629; c=relaxed/simple;
	bh=AaQcMocTswbAmkTdEzSSbOG0pVTDoi2WqaauvfNtRiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WIOrd6YfUr168b0TGoJ5ZhjdZkwDzkJgSBjAGDUfHI/Soq+FN0GbqibNJIG5WcAdPFgOKLWTD3YlCh5LA1geFN4+e+XiqGvHQ0M8sMtVaCo01LZwcBCNAyTuxVVmV08/QBXoqNpJFPiC7aLF1G2kzHeoCW3fyvZszm1tGm6nviY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qh8+eQ5Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E03C4CEE4;
	Mon,  5 May 2025 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443629;
	bh=AaQcMocTswbAmkTdEzSSbOG0pVTDoi2WqaauvfNtRiU=;
	h=From:Date:Subject:To:Cc:From;
	b=qh8+eQ5Zxs+DL7I2lSTEzr2M/Xp4Va8NGNtmsExxRy7iE4WqEPapJqKxeeanwLZ4s
	 1hBtDtGJHqm0dvBQavNFlw+SDzQwPQ4qakIP/eIP4FvVgcvOk8Zm1U6Xx+VWX4WWIe
	 tk4tAirNRczoolrc7igqmS+UEBLH5dH4thg9J3y/WoPQFmxrUCBrS/I7xU/KQAj6qh
	 mk4PowqIEVN5uRQpnIA1YXolMFLeNy1VeYRJMglWOEPn+684r4txKfAAMOguRogLEU
	 13LE/lYCSNQNORShB373VmDatEnoG02Wmqcseo/j72mD7DVkCUJYTScmZtFnAIC0XD
	 LFVlHWKY8EOAA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 05 May 2025 13:13:40 +0200
Subject: [PATCH] drm/msm/a6xx: Disable rgb565_predicator on Adreno 7c3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-topic-7c3_rgb565pred_fix-v1-1-b1aebe890b8e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGOdGGgC/x2MUQ5AMBBEryL7rQnaVVxFRLQW+4O0IhLp3W1kv
 t68zLwQKTBF6LIXAt0c+dgFyjwDv037SopnYaiKCguJuo6TvbJej2F1WOMZaB4XfhRa5xrbmtK
 gBpmLkPq/7oeUPqxtkKJqAAAA
X-Change-ID: 20250505-topic-7c3_rgb565pred_fix-57bb87941453
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746443624; l=1310;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=IN73Hc5vtHqaf2jmhJG3ZQUQts07NjQLJ9UAoPOD0S4=;
 b=2LUrEXE0O4fL2lEjHVHF7eqGJ6PVnu0BiFuXGzRVCgA2pvD1Oqj1yL+IW9HG5u8eklH2L+MhC
 zrv36HIF3tQCsEwij3GbN2WGISEPUbSEFwoszZExE8mQJa/HHKGReB6
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This feature is supposed to be enabled with UBWC v4 or later.
Implementations of this SKU feature an effective UBWC version of 3, so
disable it, in line with the BSP kernel.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Fixes: 192f4ee3e408 ("drm/msm/a6xx: Add support for Adreno 7c Gen 3 gpu")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2289fecbbbf14f7ec02227972049d62408c11dc1..bf3758f010f4079aa86f9c658b52a70acf10b488 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -655,7 +655,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_7c3(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 14;
 		gpu->ubwc_config.amsbc = 1;
-		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}

---
base-commit: 407f60a151df3c44397e5afc0111eb9b026c38d3
change-id: 20250505-topic-7c3_rgb565pred_fix-57bb87941453

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


