Return-Path: <linux-arm-msm+bounces-46156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C81A1CCFC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 17:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB574163C35
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8361547FE;
	Sun, 26 Jan 2025 16:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkUaLgmQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D99313B59B;
	Sun, 26 Jan 2025 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737909926; cv=none; b=Af5h6ORRfA6+MyqkVFLbhvaoNiR/x0ldCC94Y2NVSe1JUOR9VcJhhMmTz7prZiHEdAC581+7BMmsSS+sSQIpd8BoXSB8Xna9IlNEwnwiH97E/7T3+Bhls9HDbuAUOg/S9FW0WmhImbeEpyvXIgYyNkSzMnDsyZpB/M4bh7Md5+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737909926; c=relaxed/simple;
	bh=w1Pkdasfspl0G+PjdpFt2OcCV0OAekVaWgJgQeKcImc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XTlkovh5sRMIV+zyJ+LDIDLfEevT85nGhSTj0SO1GMgRq5xrPCFSpGct8R1k63aWhDNk69AqfjEnY74jowHdmnUo6lmzfQI+fYzyCH3ASEr03TDZ45KGt6h1pHXT+ziJ5Q+RAa0wmHVgSqGVvr6mAsr/mhYWH7nBfF/jLABMp3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkUaLgmQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D711BC4CED3;
	Sun, 26 Jan 2025 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737909925;
	bh=w1Pkdasfspl0G+PjdpFt2OcCV0OAekVaWgJgQeKcImc=;
	h=From:To:Cc:Subject:Date:From;
	b=fkUaLgmQnKe0AfhlggbsMYAuxz94Apf29J2mFnszv5k6Mr53XB2tMmYSEv2M9SglN
	 oQFtneMeqwPxGoXTP+PKkupM8qN52lLitf6lHgTscKuooN4mh65AdmVjjyEME/ANqP
	 fVcMG9UJ85Ng7NXvBL2UTZQSEs+8BCdUMPuKhA48IAhodU+fCQJl81Xu4F6xpE82XI
	 fX6fPEFeQ6zDcNE0wd3oAZwzG9Uui+hM+Ab5CefqeMZ+Kvt2nDcaDKE9CT2j9wCAL8
	 UyDa7Y6hcDaIIcAjhwLVVynLEhsDoF9qmOIrdESwlV1rTOILYb+aeZU+s03GMcCAnF
	 t2epXpIDfcUHQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 1/8] soc: qcom: pd-mapper: Add X1P42100
Date: Sun, 26 Jan 2025 11:45:16 -0500
Message-Id: <20250126164523.963930-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[ Upstream commit e7282bf8a0e9bb8a4cb1be406674ff7bb7b264f2 ]

X1P42100 is a cousin of X1E80100, and hence can make use of the
latter's configuration. Do so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20241221-topic-x1p4_soc-v1-3-55347831d73c@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 6e30f08761aa4..50aa54996901f 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -561,6 +561,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,sm8550", .data = sm8550_domains, },
 	{ .compatible = "qcom,sm8650", .data = sm8550_domains, },
 	{ .compatible = "qcom,x1e80100", .data = x1e80100_domains, },
+	{ .compatible = "qcom,x1p42100", .data = x1e80100_domains, },
 	{},
 };
 
-- 
2.39.5


