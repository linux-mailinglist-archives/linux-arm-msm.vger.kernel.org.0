Return-Path: <linux-arm-msm+bounces-58704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4409EABD646
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 13:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1C2F7B2432
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9666280CFF;
	Tue, 20 May 2025 11:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDtyhToG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDCC27A92E;
	Tue, 20 May 2025 11:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739276; cv=none; b=eiWlDWawJqaF/taHjE2SiZN+TzIq2ttQ4xY7E7z+JkBRN5hNvb0NTtH2JJm/kPzjCNVcV2kFrtw4x+B1QHmhTnCxjfwZoTF0Ke2JYVg3d8nSx3q3ziNv2Mu8a4plq9uLkG7ZWuBg2QuqmCBSBKLLI+pYTUZGzZZwgy7YsDd1QE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739276; c=relaxed/simple;
	bh=4wj8BIEzcV2AaCVhWZ2mclGMUrjrJ5VCPq2MCWOjZ24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MY3aNt9KVS38MX6O+tELYReSUtxyRCWZhiWhKHAD4vAk2LLJZfRNKouYtImWfD4rA0alqWlMtwUo14bfTk4baKNIhRIOqsuwX98K7TNtqKosUbgNDBYu3fI2LRkceHpDx4Xb7K20T60IxA3U2tY9bpJlbSqS3X0YrSC5TVRik2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDtyhToG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA3CC4CEEB;
	Tue, 20 May 2025 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747739276;
	bh=4wj8BIEzcV2AaCVhWZ2mclGMUrjrJ5VCPq2MCWOjZ24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DDtyhToGc9xmebchSeOcrTZ8PH4KlGo47xzMiCdoLo9F/hCQL8kssnsvKBgitClPX
	 pmi6y/rPTa/6BBtGoATwOLGyCFz4k8LHQHDJ7tr4iSGU7BJLtE46ZAFMF+Ffj7e62i
	 GYvES5JlN2Hv/q08FENnmO6dDn0tcCJyRWVVYtdVMtpW07ATsCfsrpzVlJlXAqQf/o
	 M1qjH+qOfSI/Z6fywvoNEQUZtJ+zdaxNfET7KK0UdjASbF+I9NclcaGCIOZcY9/e6Z
	 QlXA5djo3WxXsBrGY/DXD1wnvVOHIWAn1aBAEo7n8svRlXIzqNO1W2Dkxt5+WTUdxR
	 WfmHlpBc8jn5Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 May 2025 13:07:13 +0200
Subject: [PATCH RFT v4 08/14] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-topic-ubwc_central-v4-8-2a461d32234a@oss.qualcomm.com>
References: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
In-Reply-To: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747739235; l=1212;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=2P1krx/gpGZBglkABomNISEmZ9EZxNPVDCRoFEs6WIw=;
 b=4JAsT4s3SXpsyYZ7CjDiY2sLk8mG5OyASMa/2glfxvj4wRdBi3AJdkMpQheqbvJrlzWzUn1hA
 n3Xvd9APnpaAxw78tAQ1XoPyHi4DF7iN+et0HNOA9cS9HyBwFxnw7c6
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


