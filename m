Return-Path: <linux-arm-msm+bounces-57310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC1AB0263
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2DD54C3BA1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6C3288C23;
	Thu,  8 May 2025 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5uluKDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E8287512;
	Thu,  8 May 2025 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728042; cv=none; b=m4fofwTfj3jEbHH0/PUWZs7yx39RDOiHL+xbn/k+jOOHoY2wsSIS6JaADKQ7fyVNrEB0D0clOafH6zSkqI809ozsYExacBUHUUuIc3c7horwRDcZNrhjUm2hZGbL/VZgnNmD15Y+Q+qeqko0SGgtaI+BvjzqmrYDQpM84TjoKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728042; c=relaxed/simple;
	bh=7xJ6QXHwFEaw3JQWM81q0+vEc7fjCdPMm1L4MVRLeNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acoWPxGfzfG0YWMpklrlvG44/j/Lvy7W1dZXFlS+tPjdwjd+J8pQPsWy8SXrduCN8atgKt9ZDoX+eRlt2e8vT0FM0UvWOi3waaXlunNWQTJl9tx3y6G5ZHi44lL7Ll9sOIbiqN25zSXXG8TqqzDO9KHaDW8qISrBgDQEA+Bf0VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5uluKDK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB4CC4CEEB;
	Thu,  8 May 2025 18:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746728042;
	bh=7xJ6QXHwFEaw3JQWM81q0+vEc7fjCdPMm1L4MVRLeNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R5uluKDKO5hyPQAbp+97gSnBkxpgb6QYkBGGQnF9a1i9XczHEOBz8LO6acprcy5IE
	 5rHuKcpqb/HWlc0aBzpUoB+/iIs2ft3mInrNMrvTreqn4/z2x9GkV3iARILIBAEsbK
	 NJmJfdcl3nSasFSe58FnVAQZhorXRztGEVR5geVVUsK8cxfaI8u0FNGp22hhCvHNV+
	 4i50HomxufhxZKL937Sy2Hx+N2JNMpGJa0CpacGQLeFNnyrWcECR6ZKSw6S0FbI0V8
	 EFhHZxeO64CiHgtieYwIA3bOCLoem+5dN1AdJaSXGrbxiNeV42XsnF9cb633WTZg1G
	 HLPjndTi9YXYA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:40 +0200
Subject: [PATCH RFT 08/14] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-8-035c4c5cbe50@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=1259;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=/T9oJ7HBRn8Ltit2GfS/Ltk+ksfwO5j8+C9eAHrFRZU=;
 b=/h9Q8DQ8NQFZaIU0ASNNvwq+lCugMwtcZO6cKkOovZxvS/maK61kuqau+Hu5vhh7R1JtJwHME
 +MsCuxH7tnFDyDykXdZ4k6xC1u7pKVxpmri44O0UdczyJ/wl824DaE+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d47726ea8818a9660eadd52d97dde1489a884684..afe4fa8e9325988af37ff12adb61faae66d746ba 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -662,12 +662,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	u8 uavflagprd_inv = adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ? 2 : 0;
 	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
+	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit;
 	bool ubwc_mode = cfg->ubwc_enc_version == UBWC_1_0;
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.49.0


