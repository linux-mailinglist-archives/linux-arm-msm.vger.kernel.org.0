Return-Path: <linux-arm-msm+bounces-57863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8F6AB6F67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CA1A163B10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA5928151A;
	Wed, 14 May 2025 15:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFa0ARNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA67E28031B;
	Wed, 14 May 2025 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235509; cv=none; b=b4gOuuAF4HezDUTcxcFhxbM2v6hk380vpOJ/zzWKO10qu1ST8IyY44QsW5vujgYIUxFDyoojD6TnpEpebtUaSxLaastj/jZk0NKBz1U2XedgMQCMVW8AYOk6fvcTJmHXM3FXxSh5lVKG0KlUp4EW/N6sLNJK4/2iXn/kM4NCV4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235509; c=relaxed/simple;
	bh=JzooyhzkBSW9hiU1yFfTPNeqnr9cyX5PvetIXhtLpb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kzb+irW1Rh/GlstcHO/T5m7K9S9jbIBhG90yN0fDGvyRq7O/2zvANtWB0CIoEPWVU0e7fY0H/119sACedbAVkoJt/2JKGOKbwpK3EUfHQkCQ/jDpMREPKOUniGhB93nzJLqBps/K4Y5CeA05HNd+dDApR2Hvd7cc+rVef67rngo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFa0ARNG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B92C4CEE3;
	Wed, 14 May 2025 15:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235509;
	bh=JzooyhzkBSW9hiU1yFfTPNeqnr9cyX5PvetIXhtLpb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sFa0ARNG3D8I23WRX7deZdYMBeXK5Q2foX0/kTvVFbZQ82b0gMpt/XypHMJ9mBQYz
	 TKT/u5lftZ3Zy7yjGx98AYPZbcUldb+ta34R+YlkCYXxp0wMsAkrlP1h2djXU5x4d4
	 STrGGqhZ2zLxyXTjptwx5PKpfPRtUGTTvGZFUWUb7KtSeyLG4sAVTkHFtLQjRFIAiD
	 OaqLhFS23gUWvNRkYCld++vbaidixhezxO7XNYHCVGgmj1DcRvCBRJeOTfhOyBXJ4i
	 V+tBIl9x/mFdLMaUuoZgM8/epp7MzU27xvPvCE/oOjD/dWTIKKE74BTnnQUXCaolFl
	 Am4YPQNsQ673g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:33 +0200
Subject: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=984;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=alnhMVYvqUsDl9VBStZIhfR74aMwsIemObYjxdGrHhQ=;
 b=kb/pNJE5oczTtgeRkk4h908ZcFLhblgrk+Oi24syoakU4SqD5fOQGD01+P+LVh11yWnBP+K5N
 rOgmWKXedbODM5i42UgGKhsXF9CVbOomakFszF6LVgJSd3Rpmq7L4uZ
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
index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
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


