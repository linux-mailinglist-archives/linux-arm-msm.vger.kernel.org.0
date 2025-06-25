Return-Path: <linux-arm-msm+bounces-62463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 002E8AE8409
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0A8B6A5A18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E1D262FEC;
	Wed, 25 Jun 2025 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcoi9vqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E442262FDE;
	Wed, 25 Jun 2025 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857070; cv=none; b=EDVmDLR56BoWriFhB+/xb9QnyVRKdSfw8sVDIKk729RPq7+rNQUiACQYuhW2mTmgQ6gw76pQrc4SDT+k3ib/FfK3cZKZ7XyOdA5CsABn9fQyR84CLOFBXO6EV5MoMBKoDXTVB2MRPYC5mtPOKjBWvGcodzR0kjQj047kFrAsFjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857070; c=relaxed/simple;
	bh=5kd46EYzLSIP7jQo4nPGykrQoZ5gksu592EDZaqeOcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJg4o1Iba+jQE8Euave0+Be5xudrOw32iefZEXwA1f1Iqe8PCWIfDqtXu5gGOxOSBp056Pg8xBDNF8cLvBhI3zJDbnB2p1Ezj1gAWbXsC5VfubkxQyBZ/vhXaWDHDFboS+qGpWij42URBDiDbkk3HZsX+CQPcdjBqzcgxHn4aWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcoi9vqZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E41C4CEEA;
	Wed, 25 Jun 2025 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857070;
	bh=5kd46EYzLSIP7jQo4nPGykrQoZ5gksu592EDZaqeOcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tcoi9vqZ71DsEC7MtmEMv0kufQW4aGgdq1gGExDixPAemvBvIcUH1Z9nHPV7Zk5RR
	 +Ri23cL0jv1l6eZ9hjq8VLLgQh5F3z/eUBgYP+Z3FxBv+ouabfOenA7PPQq+YqTeuo
	 FV5DuYGKrGVFzoAQ5258yeVhzDhvoO3MHa6Sf/teRjlK734v0JgnDPRWVX0DW4o8MD
	 EaLy+ZxgGPPN0rPe/Gek6vU3SUFv4Ph5wU6XnvDxAGFvGh30BH4ADMGxFdgka5Hnc8
	 DPBKCQEDUfc82TYlrSKPbSBwk8MeWc0MRoV87JFqIfraXVvq8pDwOKPCgYpQQAdk+J
	 ljf+o/6jiDKmQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:19 +0200
Subject: [PATCH v5 11/14] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-11-e256d18219e2@oss.qualcomm.com>
References: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
In-Reply-To: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=1051;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=boHkhEcS8ujsO8eosjmO/xq6FDYpSswaBWnJ0yziTTc=;
 b=CzQ//fue3SaXzkihq3Hg7cLtcchvyzO9heR+nRPgSf4915aF09zCmmnZiFPlW7Hx/V2XmkQVu
 qPhj8GQkJ5zAFuOTrOmCqLue6zycPK9syGflyzggBoJfFlaQnqeCZ8R
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
swizzling) is what we want on this platform (and others with a UBWC
1.0 encoder).

Fix it to make mesa happy (the hardware doesn't care about the 2 higher
bits, as they weren't consumed on this platform).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index ef2dfaa6730f7f5cb08bac3cff6486e5f3f99570..49ec20901f607b77fb297764b97d75c0537b1db2 100644
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
2.50.0


