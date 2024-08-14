Return-Path: <linux-arm-msm+bounces-28536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F499520DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 19:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15D991F24192
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14751BBBF4;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExQuJv/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FAB1B9B3E;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723655738; cv=none; b=k0WsmNJTwpLRNlwO+mayX8Qk4vFxCxAQARWeGVQbAFlNpHIfflTcomT45MRsh4N4GWzQ2trf2sOhdG6YuL4eNRQ7/ZQcd1SyM75NNZsOMROCYZrg6SScDN5165v7UdU0g58/U22Wjoxa/y48G5hNrWz9LwKEq7iLdsqHgeUNfJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723655738; c=relaxed/simple;
	bh=21hMRAcosiv6UlvSwLZ77NGpT9rAb7GgO23AOPjl6vM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+6P3QTtrv9n6ngzr/rZqiCAxK3u1rBQGIRMn9zFifhmoOhCErlG3vAfewBsVlDeGLizBCf1hpTBIuyk89tzzjNgsPVk+w5H9I+bZ8n2gLmh2tatv/bQGsnZR7MGr1tpEHyifhaIWwY7dEbXJQbIBu1/rjYIBo/0FAw7VNuRDrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExQuJv/y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C746C4AF09;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723655738;
	bh=21hMRAcosiv6UlvSwLZ77NGpT9rAb7GgO23AOPjl6vM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ExQuJv/ynGMi4Li+TPoRhEzxKx70dUYHap+vA53rkC4yyhsn91wl15uEGQD6oijSr
	 17730j/yGcm5NNRj3E2lctGjjkkqh+68lgUxYN2iWwC/J5HDOJufszG8QbFQcckleb
	 CAUqWcBlO8+j9M3tuxLlvSp0zA2oMp70fyNSMWhknV9Hl9oS/zrQFuJtnE3f13URFN
	 0HK/JHRGdn4qckaVhOCK/06WymZIC1XIkkrfIc3r6tExT8w3wDrNaljNizzCiumt3I
	 UReIz9MG+snrSluN/LwLljyZZ8ioiawiV2Bpxrn6mosAvYKoyPS+NhH0dCf7iN/Cmi
	 ydopWBfEb6dsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214A0C531DD;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Wed, 14 Aug 2024 22:45:36 +0530
Subject: [PATCH 3/3] ufs: qcom: Add UFSHCD_QUIRK_BROKEN_SDBS_CAP for SM8550
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-ufs-bug-fix-v1-3-5eb49d5f7571@linaro.org>
References: <20240814-ufs-bug-fix-v1-0-5eb49d5f7571@linaro.org>
In-Reply-To: <20240814-ufs-bug-fix-v1-0-5eb49d5f7571@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=tifq6GOjcopPL6cLTuL63f6pon2nnqW5vXlh4Zf80OY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmvOY3a7gkLi2VXbeUSPBQzUF/mhbLHVjzPz/dL
 G5CfvIi/dmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZrzmNwAKCRBVnxHm/pHO
 9TGXB/9FfmWLoUKrlGEkbnbfPTE0oIH5VWXQrjhKPLgfEbLIXFnoPnIlzWy7xRg5fmNWXw59vUG
 x6cJh/XE29qcDlD1nik03+T4BP3rvailoHF6KiZhz6RdLgjyM/Zvrm5v4lX6Hd1+fX/sXo9yF+p
 XOCUDZQQq91QzS85LvEFRwyih9uDlX1tb22HvbGQkZfM61388t5f/Zcbh3dgO4e2mzzT0dWBnL2
 idV8CjLdhIz36ukGFbuARXLdAGsecnNG4Db6gbaPcrqSZ0Vau4udPnAaOWg1vbfU72wrtsDodo4
 OooygvFfvdYywZTZrvygzxbKtTbXtHUfSPT7ZyNTSdnZTdZS
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

SM8550 SoC supports the UFSHCI 3.0 spec, but it reports a bogus value of
1 in the reserved 'Legacy Queue & Single Doorbell Support (SDBS)' field of
the Controller Capabilities register. This field is supposed to read 0 as
per the spec.

But starting with commit 0c60eb0cc320 ("scsi: ufs: core: Check LSDBS cap
when !mcq"), ufshcd driver is now relying on the SDBS field to decide when
to use the legacy doorbell mode if MCQ is not supported. And this ends up
breaking UFS on SM8550:

ufshcd-qcom 1d84000.ufs: ufshcd_init: failed to initialize (legacy doorbell mode not supported)
ufshcd-qcom 1d84000.ufs: error -EINVAL: Initialization failed with error -22

So use the UFSHCD_QUIRK_BROKEN_SDBS_CAP quirk for SM8550 SoC so that the
ufshcd driver could use legacy doorbell mode correctly.

Fixes: 674f8bfb1848 ("ufs: qcom: Add UFSHCD_QUIRK_BROKEN_SDBS_CAP for SM8550 SoC")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 810e637047d0..391b814c318e 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -857,6 +857,9 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
 
 	if (host->hw_ver.major > 0x3)
 		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
+
+	if (of_device_is_compatible(hba->dev->of_node, "qcom,sm8550-ufshc"))
+		hba->quirks |= UFSHCD_QUIRK_BROKEN_SDBS_CAP;
 }
 
 static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
@@ -1847,7 +1850,8 @@ static void ufs_qcom_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id ufs_qcom_of_match[] __maybe_unused = {
-	{ .compatible = "qcom,ufshc"},
+	{ .compatible = "qcom,ufshc" },
+	{ .compatible = "qcom,sm8550-ufshc" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ufs_qcom_of_match);

-- 
2.25.1



