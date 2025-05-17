Return-Path: <linux-arm-msm+bounces-58281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09938ABABA9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85058173272
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC94421146B;
	Sat, 17 May 2025 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1WuUEvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B434F20E033;
	Sat, 17 May 2025 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747503218; cv=none; b=I5dhSYmmYnggZyag3IPPVpwZy7MXwQDCaiwiba9w34DQOAXY4dv6DXynPcFPmp3mN6wTTRLA2ReLV2BMb/KXFy7MH+5wsnFlb3sq64UgSWLq/khpaCg10C7Ix79qWSHfzVpakfZVIp3Do6VfQfJLiFg99YU+ORfIBx/lIlLwrG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747503218; c=relaxed/simple;
	bh=PkY/OHozwup+usBmmGWKkUXmLkMF/L4IhLb2zDYdADg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sr3WyvFetYMAVLBH7XuUo+//dIfKL61gURkvu0DJ6orcoYaSqNwNywKKf13XZENz07AvvB5GbH/+bR7CRNLZmDoEyHcyLLcGw33u9I0cIvJ7Kx6N9AnaK6+JK4Y0FQ/2DB69MyHw2LDDSS+jQJh9jdJrrV6cp1C0sbgpTyBPbqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1WuUEvY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D4DC4CEEA;
	Sat, 17 May 2025 17:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747503218;
	bh=PkY/OHozwup+usBmmGWKkUXmLkMF/L4IhLb2zDYdADg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s1WuUEvYYSqwEugS/bjKwxiWLXyYxL6dVoSGJ2ysCNBjjDquI9vpORfau9+cke6J9
	 EDkJF5cXTWSI0WbGdBTQlVchFHHRzZELTmv9aiDQFDjbuiFjMUsEC7tuKSK9kl0tn9
	 QXR6j6EvhpZ0R2+xTKF/zMfNsVHVXLmNxrppv/Hy4aUXYU0xWyl+bhaWrngtUg4pX4
	 Cw6MHd/ioU7YillFHJb4VVf3S1f8apVw2NvkJbbZ9iKWP7J+QPGlMBP11Ce/fMuLX2
	 tDZcU2c0diNpK466lIU3WMnnV9xi0aWOkIpFyIeN6fDY6a2Fv/plJzao4Ryt6VwdCg
	 rstU80gv+/M1g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:32:45 +0200
Subject: [PATCH RFT v3 11/14] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-ubwc_central-v3-11-3c8465565f86@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747503160; l=984;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=LK89Ak1UIK/PqO+rB7b1/zYpRkrLVbH4ei4eYpRq6e4=;
 b=okJgmwae/MdFAXcshFco9zIPaIP6HFiV9Jxg7emZTGOniEG4gWq/ijdlKRgY+HiJZzllc4w6z
 2resqXA+KwjAgSxoCi0xqnuP5STgypT3jn8mLtSJmNVVtJ8k+w88zXm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
swizzling) is what we want on this platform (and others with a UBWC
1.0 encoder).

Fix it to make mesa happy (the hardware doesn't care about the 2 higher
bits, as they weren't consumed on this platform).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 7d220259829f0e57268f30b323ae985cf44672f4..7002744631341796d08fa197efa2202b3018cc3e 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_3_0,
-	.ubwc_swizzle = 1,
+	.ubwc_swizzle = 7,
 	.highest_bank_bit = 14,
 };
 

-- 
2.49.0


