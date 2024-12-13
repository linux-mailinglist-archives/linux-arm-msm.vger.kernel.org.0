Return-Path: <linux-arm-msm+bounces-42033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 695539F0E11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C6B166A1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB181E0B86;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6T4QING"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A6E43166;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098016; cv=none; b=n4cRcB6U0Ir8JIt2at9w84ysTqn1nxGXQd1vGpWlxolibSLbpTbr/nALJIKPgYNlpnWCE7ug9EyXid0bVgpSEdtYHiB3qZzFbY5h1iBdvWMDuhzNGqb/nrXN1yqHMxGKHDDLCaUR9GXa1fXYFYBNuJbpqPmeEQIl9rlTYUANJmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098016; c=relaxed/simple;
	bh=mdHii9nRNOur98TYJL9W/B0MjRM9s+5aXB/CNs8G4jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOC9JgIXSA9QO4gfAi6WXJebrvOLOBF3psGHW4AhMboAzaKLpWXyIfaxwdu2yI1X3ONc00HMBs29KI6cuKi+tGcdlN3CpKeyQLyYj4x0fhwq0zdVT0gFz2MI7Z1xPKdL0YH1AxeuSr555VELbrMypTd1ecD0L4+uSfZ/Dy5E3Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6T4QING; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92E0EC4CED7;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734098016;
	bh=mdHii9nRNOur98TYJL9W/B0MjRM9s+5aXB/CNs8G4jU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t6T4QINGnsbV7YalJZg23vvtlgJC+vFpBtwEdX6EB7fDhBjNo+bFcBQZhWERZFEbf
	 HcuY/a5edj0r/F27CJbqEyAkLqD30U/5ov321csqpRNEvVPmauQ8XQIRrWwJgiHSuW
	 rTvmRbkk1Lr/OLT66pvmSu/sINLp/015dnWufH9zpTruI2QByyD72LsLN02AP1Ffth
	 nlRBP7R6OaE1yeq/8RJDjS7wCdX2kgXWSxaxjNmMbblGybzO5SBvoB1vHxPHiMe289
	 2fhnOCWFykGTogNxQvSNKKcHdTc/mV14jHbvTG2/eC43NSiD8DP36ZYw8AMJKmoKVI
	 4JPI8oCyVkaBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6EDE77182;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Fri, 13 Dec 2024 19:23:30 +0530
Subject: [PATCH v2 2/3] scsi: ufs: qcom: Allow passing platform specific OF
 data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-ufs-qcom-suspend-fix-v2-2-1de6cd2d6146@linaro.org>
References: <20241213-ufs-qcom-suspend-fix-v2-0-1de6cd2d6146@linaro.org>
In-Reply-To: <20241213-ufs-qcom-suspend-fix-v2-0-1de6cd2d6146@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2709;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=qqrxdC5u7a2vZfs8QFNpeAZBHqn1+eO7J3Xdho8U5SY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnXDxc+9/I1Jb3eWtP2983AMBHpbG+joy36Ntck
 aqYAwgqzuGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ1w8XAAKCRBVnxHm/pHO
 9aJeB/4jtWCKxXc9qwEo64zElXLbEEQqNkPs8ZnFmOG3ENGVzDQ2g+83YJ8nG/1g8wSuEOBu62N
 qUDUwnTp4Ts14JmWMiJXz3Wa+lewGZqnxCBupsDRuUZ81AL/z+2e3Z8xj5qiiAbYGGaiuyu+zKJ
 BrJny0V8yHUkbCsqF3Tg2X8oFBS5TM1IRvPSyZp9yzRK/1ODd/lolElkJ8QBDWS2fzzGyqrMtbU
 tsmMKYCDb1i8f4dXhs2FmxvxIbzGKARMqpCNTRLWmjecOsIGUYrbNsc+JzGzlvfvmsBIDGaUt2O
 E81DEi3LOH/iNxMpxb+pXg/MTiRrUiHW8RmuphVT4X46R0km
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

Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Amit Pundir <amit.pundir@linaro.org> # on SM8550-HDK
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
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
index b9de170983c9..15f6dad8b27f 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -217,6 +217,10 @@ struct ufs_qcom_host {
 	bool esi_enabled;
 };
 
+struct ufs_qcom_drvdata {
+	enum ufshcd_quirks quirks;
+};
+
 static inline u32
 ufs_qcom_get_debug_reg_offset(struct ufs_qcom_host *host, u32 reg)
 {

-- 
2.25.1



