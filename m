Return-Path: <linux-arm-msm+bounces-62599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6685FAE9989
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C25F73BB152
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2049F2BF3C3;
	Thu, 26 Jun 2025 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1nsrPAO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC74029AB13;
	Thu, 26 Jun 2025 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928599; cv=none; b=YjwoJmCyRegcWyLIfGYEDaEfImTrxt6Qce1YcGhtqdaAgyDvgJBQSOiEuB6OTdb8WvZsPTnYiOdSfVPIgi9B4O1PfY50RR0U578O/0ugcLE1mLT5XQzM86/UHAvv5FSJfoHR+s6GlkkW8UKM8c54gDLvDnyVvjHXlfIRjqtiaVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928599; c=relaxed/simple;
	bh=GH/kR3kom1SR2DzZhLQydzQqd3+Oq3MgLgPaayrkqBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTnPAOAtelYHsZwuDqsrvWTavI1Lq5/EdJOvKnIgZGJIZ3bnCElMT5SPowzZ2Noix1Eeigq7KDN2BtDyIqPwulgC63FAyW2w/jCFL9J88gwOJH5bPajHtWtuTnSUpJ58oX4l8oFpnaQBUCu2iysAGrC1cYIKZ0JtND4mzCa4340=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1nsrPAO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5886DC4CEEB;
	Thu, 26 Jun 2025 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928598;
	bh=GH/kR3kom1SR2DzZhLQydzQqd3+Oq3MgLgPaayrkqBA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b1nsrPAOSCTmeNgayHrduwqzmT/KVFvSR/Ii1dc4NjTUTlZlcaR8hHsceZThk3bjW
	 PYLBfniOwJodXPAOQ91/OsOzi+7FtPbq62bqbg0yUgYWwU+UheOwAbV+nroJiRAXwO
	 Lyx67t4PajcYblW6uZEFXyzWIomyYRtegNsfpdCD4EvLx+iGm/8sVzuKK3PKauFVVf
	 eudB0RG/vFjYTInb6j/qPzvcGuQiCT0aI6l9ZqmQ1Cduw8TOo3kNQxXAAC16Y2Etsx
	 pP9Ok8gthw6E9LVKRtkLqqeaG8GQ+YRj+Nh3VgUGfXDxwiMp3CXkjfo+l5nW7veI4j
	 OjGVyCE9R/jvg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Jun 2025 11:02:35 +0200
Subject: [PATCH v6 08/14] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-topic-ubwc_central-v6-8-c94fa9d12040@oss.qualcomm.com>
References: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
In-Reply-To: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928557; l=1212;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=j6D8eqPjFQVMYlE8pITPkljcLo0t+bJ0APdpU9FQnCs=;
 b=BOfu+52tPJcNiDO+mJs4J8ce+2lXda/W7M0PquCEu8Npolaqn0xFS83OdxYSgyfqC2W2xTLBx
 cEp1riYtNSaAeJTAgHdtBlbHMYhyxEZQT+m4R4prxowklV5jMEs95Pv
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
index 3d345844337608086ffec1998b47b315ada68a97..78782f94ee678e13baa6eb1a009a412e13557d59 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -686,12 +686,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
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
2.50.0


