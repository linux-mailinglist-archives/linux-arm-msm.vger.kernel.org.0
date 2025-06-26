Return-Path: <linux-arm-msm+bounces-62602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DE0AE999C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F1957B0F1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF482D97AE;
	Thu, 26 Jun 2025 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRdnL6Aq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD20129E115;
	Thu, 26 Jun 2025 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928613; cv=none; b=re9wL/bQnPpCP1KAkV0DztLvzhkF/OlFedXcoQ4184raMxxnvGq39rxMCIdqPyFBHR6WShVJ/72onRWCJio78oPHzMpRDjaNF4+3t+9AD++LILBn0/nBHg3GssDo74QuKMphYF+zRBE9tKXxEqD4DU9Z5yg8nar9l7+cTIE+aFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928613; c=relaxed/simple;
	bh=1xDR+U2RyabJrmBM8h3htdpEoHj6pztPIHXpeZtSbuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kA03Q9J0Dh6QeeaVsl7NM075k6tDj84NJfChP4gTyNnPEoMPEhocHZh7dh1Gd5DHvMdfX5ApVdnnShkMCDhva1cPMJMfrHDmqgG5V+ycR8VGeBZFJS7EL3wbagIOoGs0pHAguoDrrz/QovNaVrNSX8JozXwTCkGIfdeyLynNI4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRdnL6Aq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C903C4CEEE;
	Thu, 26 Jun 2025 09:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928612;
	bh=1xDR+U2RyabJrmBM8h3htdpEoHj6pztPIHXpeZtSbuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rRdnL6AqYjdjOMKH6BPqaWAgy36A6sJFaIRIzUHP4yFZrM3izvlKH095vrPgWKMgh
	 3bFDm255rF4DLYECBYVSUEs/ZhJOzuVO5MCLcISoPG3GsWxopfEbVlVjcGAJzIV9tq
	 R1TSP7yPtSXQQU8AafxlK0m32BzsQYbdKPkTWK2fwpEA0CFo9tmXhsujHx6KeYWi36
	 xrmohc9s1+VmXSF1aheZBXxXA0sqRAxrGcSs0g1gWFgiMB8VnY+K5r5BBdlN76COkH
	 GASxYE6fImpZezffac0MIC4qaRKrnUaKW3+iiafIdGHReJD9/km3bo7lTwt/yAg/Ks
	 Y4+Igs0i0e4rA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Jun 2025 11:02:38 +0200
Subject: [PATCH v6 11/14] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-topic-ubwc_central-v6-11-c94fa9d12040@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928557; l=1051;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=TGgyPtOq6PVyTB/wSUW2NCwkk+YFyrLplveJijYvHuw=;
 b=cMyeFHZ0gCZMTKDYL0diQRQGNVkSDYuOt2RG6JJTSxyQOsTxjVSSuT43GVm4gc5tqz9z0wutJ
 m05g7k0U52HCQ7StAr2yJzrZ1ZECNxE/lObuLpfT4d8VB7W5B8MKVbx
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
index 18a853a3f76cc71dc6c2665c6b7486eb936331f6..3eb2f2118e5d1ca69cad2ed092542920537ff62c 100644
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


