Return-Path: <linux-arm-msm+bounces-38967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC2C9D6F7F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 14:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E69F161F2C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 13:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5011EF092;
	Sun, 24 Nov 2024 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIlIcq65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8F1EF08C;
	Sun, 24 Nov 2024 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452691; cv=none; b=k0752x6OUBB2LzDZX5/7L6VyzaTFMHzRSKKA8dukbxaM1VSBjdY69Eq/5dEcLtFyn6nc/9352d/GfhP6hypLzBdy83S9glPK4h3dPtSl4sFezs9T7eGuD7yl8fdur8FxDUx3RV3BzaTAGlblxzr60K4QZaQgORc4hhYlfdjje/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452691; c=relaxed/simple;
	bh=ajdsWg+Dft+j8o8QJgxW8oR7m2qgoLX5ndNO7YFv+WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHZyCdp+C8EUUFflyauKTPyQ1wLpubbNzMvfLqKVTGPm4WmAEH90LdK570VYfUZkOQG+X00btMSWhQ2jE+3Mlj9z3vNuSB+71yvHe1zksn+al/ngoKzh79zDkQ7mx/61GzTSSZym8NSR3EnA0PhejsV32yrtXINz/AG5yfzcW8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIlIcq65; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADC4C4CECC;
	Sun, 24 Nov 2024 12:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452691;
	bh=ajdsWg+Dft+j8o8QJgxW8oR7m2qgoLX5ndNO7YFv+WQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EIlIcq65yiy70J/ztgwjvJzrwG4P9il+rZzZiu76QtE5ZnjLtsj8XloGQ9Zqta3zt
	 v0yQU2szOTt3Nj6UZecl/ylpeEYzp4ywtIXjo0z/Pr48mKpiwFb/N2QRvf5dhvoy6D
	 pK4Pk0wdIjwuvFLkvoAvxJep6eTp/QNA6qcOzSwBBY8I/vwCfzXH21T+4CqZ46+YWo
	 X9N+IiV2eL9iwEJUHsE+G5x2n81VzvBx9ro37lqblH2wRiRGryaD+MYJO6EfkJzvAw
	 Y8b6Yzh+Dotd+o6ZlDHkZB75YfgfvkiUWgFGXcgM1a5SIh+42VJ593FsSnRRNg85T8
	 BNuEIXngLcKNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 04/20] soc: qcom: pd-mapper: Add QCM6490 PD maps
Date: Sun, 24 Nov 2024 07:50:34 -0500
Message-ID: <20241124125124.3339648-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125124.3339648-1-sashal@kernel.org>
References: <20241124125124.3339648-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

[ Upstream commit 31a95fe0851afbbc697b6be96c8a81a01d65aa5f ]

The QCM6490 is a variant of SC7280, with the usual set of protection
domains, and hence the need for a PD-mapper. In particular USB Type-C
port management and battery management is pmic_glink based.

Add an entry to the kernel, to avoid the need for userspace to provide
this service.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20241004-qcm6490-pd-mapper-v1-1-d6f4bc3bffa3@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 2228595a3dc5a..153eceb6e8f8b 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -527,6 +527,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
 	{ .compatible = "qcom,msm8998", .data = msm8998_domains, },
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
+	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
 	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
-- 
2.43.0


