Return-Path: <linux-arm-msm+bounces-41540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A199ED3C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 18:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096922839D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 17:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478211FF1CF;
	Wed, 11 Dec 2024 17:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPFkEAaJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A151FF1B3;
	Wed, 11 Dec 2024 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733938828; cv=none; b=ndvC7vpt9PpDnR9iqHCuP2JB7I7W3mXKsuIyayKwmkbETS2hbIsEWmvQ4OSJU/fYIDMmCD6jyocD4NlBlBiAgxlpZlaHHe/q8Ro9CLn0HmMpfo8LXKSAvOloQkm5WjrEDYruFpuJ11oxIM1rvYzdlW7PiaZMIs4SqRNPLbHA7BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733938828; c=relaxed/simple;
	bh=3k0q1XEcUSyKHQJRn4GKxORS+BV0NNL35gUNoUKMCy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPT7l9rL4I65Ha11k2I2+jJ+Zi36w6uIi77xa4LsO6qyUTY9imcH4sNf6TnhqQwesG4XC4roEtS21qlB5hOjV6mRrSQnrkf0nA8bk4aL1jana9yyIx+MVREgaiguB4hLDqK0pdeHIssVt4GZkhjKXm2Kc4b3paUQ85gTCKsq88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPFkEAaJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 932EDC4CEDE;
	Wed, 11 Dec 2024 17:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733938827;
	bh=3k0q1XEcUSyKHQJRn4GKxORS+BV0NNL35gUNoUKMCy4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cPFkEAaJk7nLxnslCaRSvCBNSpxTvl/t9DiuyLYAWQ/vgBJFIHnd1PLxdwTN9NIw/
	 aB+SqbUqFg9zSrRJBdoCjtROmmcHSzG/rikOZDp8AdxUSpP9CbUOlvGdO406QOnlHq
	 inDFDw/UZQUFK0y9htkeZ+Tuyj9JXABOjqZB6B3oZuXFgURCgOwx6bJnLZEvBwSYjs
	 BeRZXrhKL2edQT6f6btiPAUMki9lz1NWapPY9RKmS3xDGGnMZqeFkFnkbkpzsE1eoT
	 P3B8YMBqQwC8xiVqrhDHSqJi5t5ZNgtE8MEetFNfZeDNRQrWPwlYTeskkHaIOoIHQo
	 sjAfwVD2Pz3+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D331E77183;
	Wed, 11 Dec 2024 17:40:27 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Wed, 11 Dec 2024 23:10:17 +0530
Subject: [PATCH 2/3] scsi: ufs: qcom: Allow passing platform specific OF
 data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-ufs-qcom-suspend-fix-v1-2-83ebbde76b1c@linaro.org>
References: <20241211-ufs-qcom-suspend-fix-v1-0-83ebbde76b1c@linaro.org>
In-Reply-To: <20241211-ufs-qcom-suspend-fix-v1-0-83ebbde76b1c@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2482;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=TFkKFPCprg+VLs+jengdDmwzP7O4f4NdtmgSXUOvHXg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnWc6JREq2V30RWfjRk7uJybqSzedDsUAgtCvv9
 N6LjYU1MeyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ1nOiQAKCRBVnxHm/pHO
 9dJoB/wLM6GbS/vR2YaQXyHWje6tCbpXvfcDPcjstz6ETBuJpFIDpkaNJCW79jY0/EhpBxtcZ7h
 eMsBTWAS6mfPcmehVsaqCGJIirbvLhoBNkRPXyWkilYDIJjDFnLR7miTq7LVJiihXSDgSUk44dX
 ETM0AwnMcPJIuVM9ab6jR9m4k5BlfkNWavJhdzv60XOaXnzPPsZjoNCrOrI/xHeyOHV9QrTSOru
 aBjiBlN7i1j+cb36hWIXdnWxNA/smkY0rAPnMmb5+cteOQSNBiJEh9cqzj80YsyZLflmZQG+04y
 3mDuIBqUluadY/kmz2Ps/VSveuO8DJNBNamVNL76NQXa0cSP
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

In order to allow platform specific flags and configurations, introduce
the platform specific OF data and move the existing quirk
UFSHCD_QUIRK_BROKEN_LSDBS_CAP for SM8550 and SM8650 SoCs.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 13 +++++++++----
 drivers/ufs/host/ufs-qcom.h |  4 ++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 32b0c74437de..35ae8c8fc301 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -871,6 +871,7 @@ static u32 ufs_qcom_get_ufs_hci_version(struct ufs_hba *hba)
  */
 static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
 {
+	const struct ufs_qcom_drvdata *drvdata = of_device_get_match_data(hba->dev);
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 
 	if (host->hw_ver.major == 0x2)
@@ -879,9 +880,8 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
 	if (host->hw_ver.major > 0x3)
 		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
 
-	if (of_device_is_compatible(hba->dev->of_node, "qcom,sm8550-ufshc") ||
-	    of_device_is_compatible(hba->dev->of_node, "qcom,sm8650-ufshc"))
-		hba->quirks |= UFSHCD_QUIRK_BROKEN_LSDBS_CAP;
+	if (drvdata && drvdata->quirks)
+		hba->quirks |= drvdata->quirks;
 }
 
 static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
@@ -1864,9 +1864,14 @@ static void ufs_qcom_remove(struct platform_device *pdev)
 	platform_device_msi_free_irqs_all(hba->dev);
 }
 
+static const struct ufs_qcom_drvdata ufs_qcom_sm8550_drvdata = {
+	.quirks = UFSHCD_QUIRK_BROKEN_LSDBS_CAP,
+};
+
 static const struct of_device_id ufs_qcom_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,ufshc" },
-	{ .compatible = "qcom,sm8550-ufshc" },
+	{ .compatible = "qcom,sm8550-ufshc", .data = &ufs_qcom_sm8550_drvdata },
+	{ .compatible = "qcom,sm8650-ufshc", .data = &ufs_qcom_sm8550_drvdata },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ufs_qcom_of_match);
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index b9de170983c9..e85cc6fc072e 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -217,6 +217,10 @@ struct ufs_qcom_host {
 	bool esi_enabled;
 };
 
+struct ufs_qcom_drvdata {
+	unsigned int quirks;
+};
+
 static inline u32
 ufs_qcom_get_debug_reg_offset(struct ufs_qcom_host *host, u32 reg)
 {

-- 
2.25.1



