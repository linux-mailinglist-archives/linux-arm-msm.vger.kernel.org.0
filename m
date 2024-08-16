Return-Path: <linux-arm-msm+bounces-28736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E69541A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE4371C20A34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 06:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE0384A57;
	Fri, 16 Aug 2024 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BK4tfzQl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDE784A32;
	Fri, 16 Aug 2024 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723789513; cv=none; b=HnZSfKtpqOobD+LXs59e98ZWfc6F1TyUoPxRLDfytuSjY9J3P7FhBgja3qeI0KruaPLx1R87K7icRpZFF2WUQyARBwLSEHOS0Bznrx7z+hFqNcX7niBfL914YIuOituFtvffMjDu6Tz5Ew9OPSkr6oIVxb8Htq1+69ggUDPBI6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723789513; c=relaxed/simple;
	bh=i2n12+ScGrT1bI73kq3wV+iMxq9iQfyx5iyATix3BBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=njMhp8PUGtByHktkglgmgcElrD5csDmWOYLRpY8Bn3HJTAiJqEKwRdRaVIuNnKHJzjuvLwNJwYrfb0J0GqbvecV5v9yPdtBRWhMM1G2DaTp1Z1pPvfnj3fPrHREhTNCwEao5FBo7sqGGpapxlo9eDM28f+np2oNwlFJ39IZ0v2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BK4tfzQl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4658FC4AF0B;
	Fri, 16 Aug 2024 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723789513;
	bh=i2n12+ScGrT1bI73kq3wV+iMxq9iQfyx5iyATix3BBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BK4tfzQlH7GcqzEkJR6Z9AmesVqJWfenV8txB1dGkp+COrkfKjOnMWGIhb0GgO3QU
	 i039cC7NOs7DCel1Co8XbE7pS6fc0faSvkTBq9EDNriXQK7hvWLRZOihV89hROvmC1
	 cV5r4coxvc/KyvFXxZ+gjvNjec/mc3LywVxtiUoHZlVsz7qx+w2ljAXqtR7OaQPyPy
	 QQ8bYg+/k3jInU4mQARzR8i/zuejXWxxBjuRxhQoePLjeDjPtXmIPPfoXEYTWbZKJF
	 gC3N3+bEagA41JC4SNQGOfT0X0hXL7RcM+fn1IxK+yE/53UPFXcbcLIkuyNUXfWZPb
	 V2t/KYPyZVcNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F09C531DC;
	Fri, 16 Aug 2024 06:25:13 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Fri, 16 Aug 2024 11:55:11 +0530
Subject: [PATCH v3 2/2] ufs: qcom: Add UFSHCD_QUIRK_BROKEN_LSDBS_CAP for
 SM8550 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-ufs-bug-fix-v3-2-e6fe0e18e2a3@linaro.org>
References: <20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org>
In-Reply-To: <20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>, 
 Amit Pundir <amit.pundir@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=8PjwyrRDlmmjf4UdCJV0ALAaFI4EcPDr3ooZLdpnWiY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmvvDHWeDACvtMQnNU4By972MH5qzCsZh0VjWPD
 vH6P/OQXiiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZr7wxwAKCRBVnxHm/pHO
 9cE8B/9IQhrAOhxrjCY15GSLwWU0aaa1k+sLEV2IJhN8OmrslZGRhjBeYqADFZvtQYJdnGUQshk
 RoaqVyWJb0Ao6GmxQvTyLrOpu3R2hoW6AVMcIyxBk3kerZ3sT5J9CHLnTjbrE8xxljU1SvR5v8q
 UCH/v7fC0ExO7uo2c++S2tIG0/UCOfn4B5nAdhOQjAlp9H4UbhmDmXiSe5o0FmxQlnfQO2ecVDQ
 Dd5lRZZK+OJG9fNdCY8H4IO4Uf9GKjbD+25rBg0QDEf46/+64kMpkDQsx9CGxk0tNeJEPSupDDM
 8CDi3jL5WL6AwIjeMZAFecb0pILlbI2L0osfL1pr8Uti23AM
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

SM8550 SoC has the UFSHCI 4.0 compliant UFS controller and only supports
legacy single doorbell mode without MCQ. But due to a hardware bug, it
reports 1 in the 'Legacy Queue & Single Doorbell Support (LSDBS)' field of
the Controller Capabilities register. This field is supposed to read as 0
if legacy single doorbell mode is supported and 1 otherwise.

Starting with commit 0c60eb0cc320 ("scsi: ufs: core: Check LSDBS cap when
!mcq"), ufshcd driver is now relying on the LSDBS field to decide when to
use the legacy doorbell mode if MCQ is not supported. And this ends up
breaking UFS on SM8550:

ufshcd-qcom 1d84000.ufs: ufshcd_init: failed to initialize (legacy doorbell mode not supported)
ufshcd-qcom 1d84000.ufs: error -EINVAL: Initialization failed with error -22

So use the UFSHCD_QUIRK_BROKEN_LSDBS_CAP quirk for SM8550 SoC so that the
ufshcd driver could use legacy doorbell mode correctly.

Fixes: 0c60eb0cc320 ("scsi: ufs: core: Check LSDBS cap when !mcq")
Tested-by: Amit Pundir <amit.pundir@linaro.org>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 810e637047d0..c87fdc849c62 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -857,6 +857,9 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
 
 	if (host->hw_ver.major > 0x3)
 		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
+
+	if (of_device_is_compatible(hba->dev->of_node, "qcom,sm8550-ufshc"))
+		hba->quirks |= UFSHCD_QUIRK_BROKEN_LSDBS_CAP;
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



