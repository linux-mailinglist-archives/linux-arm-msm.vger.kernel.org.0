Return-Path: <linux-arm-msm+bounces-57858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A7AB6F69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F40373BDF7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475AF27CCF5;
	Wed, 14 May 2025 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrCkVyIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F51B183098;
	Wed, 14 May 2025 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235487; cv=none; b=ISHjl7yGAV5U9lMShtcNq1Xp/BBIMC2+rmVs81+aowwYyEugZZ9JQogQZzxtY5yaskczWW2HS/IZAS4tefpSmn0+8uc1OsdOtu0gSyGWexD+dXXG1Y01/8jzB0WhO3rU6yxvF367vnOkiB3YGgqDfShTnf6C9kCi5QvLCyLzXkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235487; c=relaxed/simple;
	bh=8vFBBFkANtsmYpw7u9ShKN7OZ6pGN3oX85txA4NE5C4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQla00ZsLq9fXhdUirk2Z+jF2UJKYU0exNbV4Vr5OIBoCpSvEXpqGsz/wmuK/STRaooPCTG7EaxtbWyYZ44wnZwL4lYcCICi1tgpAq+e7pKobUQ2BpizHc2TT8HEv9BErFrSSaDvrrscFjLM5sZf5C58FsCGDaFk9eMsrlPXHlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrCkVyIj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B1DC4CEE9;
	Wed, 14 May 2025 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235487;
	bh=8vFBBFkANtsmYpw7u9ShKN7OZ6pGN3oX85txA4NE5C4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FrCkVyIjBy+7hBjjjBvWJAF2ufhimAcTKHHtUh8ukNR5WQhv/tILsQ4OkPBDBWoVp
	 CHPoZYUBBheIDYo8wUG0YTOJxT6kkUkQ1A3SXB5Ge88L3IWxx/0UDRx7dyvyi2tOgL
	 ij9Y8eHsZnCpjeoUgxYMunJS/ytNc/GSqplVCDYFk6Fi5CdL3sgDAc+1bGn78KklBb
	 k5a7cg4XlmAiPT8mLy/FKV4aKTlVZ2CCQ7v0A8dyXZOxovSrEpOXC6DAzy0Bok2uZh
	 2JOXoYVtAKZWXEcU5sVLhjnDQwU/X9TeRPQDpmoWjjUkpD/1g6G/FwmRCRwCGW5FDh
	 9lcH7GW1P923Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:28 +0200
Subject: [PATCH RFT v2 08/15] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-8-09ecbc0a05ce@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=1102;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aq41AJ+CzzhfYkDV7JJuH70H0YYlEAmbgWDhxQTkUnE=;
 b=INHuunGn6WgUb1RypXS0icmYTK1fWq4PDk4QbVLfVHOF+IYHd8QAiUXoE3oHmPX32GpAVkTNQ
 Ng6jYlycixODeSBUunBipyE/D3KB0DhSdXz+9KbitpWSDBp1avieC5X
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6af4e70c1b936a30c1934dd49f2889be13c9780d..0a08837ab01b724489baeb217cc49779ddcdf146 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -669,11 +669,11 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.49.0


