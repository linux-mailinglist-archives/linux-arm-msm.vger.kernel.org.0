Return-Path: <linux-arm-msm+bounces-58278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2683CABABA3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 414A77A8CBC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5A42135A6;
	Sat, 17 May 2025 17:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxBd/Dvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552BE20012B;
	Sat, 17 May 2025 17:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747503205; cv=none; b=IS7m55sVA+dMl1Lnhbv4KmuXQm4gLARSGULpKk7cV9ByZCsccziyDnR0Bf0HnYp4/P6hzzgdXuAfWBTA8SEZTKxfAZ4W4Mv6ARKYZiw0osN+O+9okrRP1VTiap5A2iom+x7VGy55sPYJfZjPcTx7pNdyYJhZK7qvzyIHElD+Ibs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747503205; c=relaxed/simple;
	bh=wt3fm4/uRfwYT9f7RsejziKWdaPnZmSDq/ZJJqaxEFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T30jdVj5wsZpwdmADPkE43U/8nyJ+QzjRUMXVgxhhd4jLLtu9Zc3P0xUU8coLoKduKbsL8ZQ3GqtCasx9NC7mpH0UpsZX54dh9V9zDuZab2RAlHYaC/A7fV60vUEB2UvkB6EWgnMhv4kiKNPxioej5FGHoYTVUji86MwR4wcpaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxBd/Dvf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D80C4CEE3;
	Sat, 17 May 2025 17:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747503204;
	bh=wt3fm4/uRfwYT9f7RsejziKWdaPnZmSDq/ZJJqaxEFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pxBd/DvfuPSqgBTJR1VyFoXHalkAr3R0Gn2b7lLXZYzYpRjOFtuwf7w2//yhdKlcr
	 wy7wDAJRO2wqys+13FeaMlmQG9xKYTwCSjaekHD4DQJ78v6kpQ7vazMTwZgWzCUw5q
	 qv8sLUsjAoc9voffJGL1jVe9UGhfOuWGwSsVSQVs8TmuoWEFxSAnzKd/Twe0YUKn3M
	 XgtA/WpGChLv8ul7XILD9E3bGdWzr/3LacWRugGO3natCXh4aYa2eZC8qdKQ+8U37v
	 X7qZLQhESmRky91V/d9khqIJCz/49UbtrQuSUPkIZrhsI5qX1rrn4YQCOdG07rvBmL
	 P5Weo8UD8ZNEA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:32:42 +0200
Subject: [PATCH RFT v3 08/14] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-ubwc_central-v3-8-3c8465565f86@oss.qualcomm.com>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
In-Reply-To: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747503160; l=1145;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=F9W0PH5aVb9OWUtlJtW6KeVe7A0tID7Q7Gc4Cr2xXRY=;
 b=x/7gWEJO5cAxE3K5uK9/7bp3nty8LmFirFWrrh6EVf94Icl2weB+fPdEioGNjAUPQaq7C5y3N
 xLenre4OHsxAEslLf96WfNfvHeBpHEYERi7zwZoIHIwwYllp/BWDNCN
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 154346591365f3f89d467674952abb2f067e7ce3..a20b57e964d31adb22f0b79a5178b45f0f5ec5d5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -668,12 +668,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;

-- 
2.49.0


