Return-Path: <linux-arm-msm+bounces-42813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049CC9F80AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 17:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9EF97A3CA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 16:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B5C17E00E;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bsa9h+2I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EA5153598;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627057; cv=none; b=apzROtJrdlhBonRWSDe1LiwoUiCwUXFozrVojdaSoevwUBpqQH6yBt+3EyjnbC/4JrcyRHAk/1xGfrcHfHoOPYZ7oiLFYFHpEDvdEcRZr9ilbKH/YEbblvbKUrfy4GNV1YOahR+dAvK1CYwmUTw9qidW18nWqf7jb0cVwjHxvjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627057; c=relaxed/simple;
	bh=77mFkAATK4BkznOMwa6q673T8d3CLjXl/21GzUUSZxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UX3/2TM1GPzoJJ8Bmt21pqbh+2rWfqSYrtaGZStt0aUx3to/+YQzQgEgQ5sRQHWizZEP6TMuI9duhKd8GdHglfggCJW9dIPy9bQwQtEDixdPUy/I8x3zgRPob0lzcVlj06WJFiqgCe0r0o83pYXJk77wwq3IUi3QR725wXpbkxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bsa9h+2I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F807C4CED0;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734627057;
	bh=77mFkAATK4BkznOMwa6q673T8d3CLjXl/21GzUUSZxI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Bsa9h+2II5HKB1p67Pf3WDF41u1NzISd2POB93D5HXPCa6KFQyFoM3pL5xIkXGYG8
	 jZuVmnlx5amV3fHL3+dHmj6n0BkiFI3c0GbGkJ+DWKKHHf9Gzq5lsoRnkpuqljqTYz
	 LIkSno15aSYZQvZrUXIJFtfPsb1F7VTb5hpVOu+XDUy9Vsx90bRyG9tYwre+eXV8qU
	 /x1+JPdZLQS982D5WCSVq/EUj+ADgApdpfWfazCMnQnBUbWkLMXt63gorOXfo/ks5G
	 b8zYdW1RWtb5vFdOvOccP8Kd0Jfgvx8H6KZh8JGqzU8N00zOgQotqFDskMQSaocfyS
	 gceOvWKqEC1yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F09E77184;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 19 Dec 2024 22:20:43 +0530
Subject: [PATCH v3 3/4] scsi: ufs: qcom: Allow passing platform specific OF
 data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-ufs-qcom-suspend-fix-v3-3-63c4b95a70b9@linaro.org>
References: <20241219-ufs-qcom-suspend-fix-v3-0-63c4b95a70b9@linaro.org>
In-Reply-To: <20241219-ufs-qcom-suspend-fix-v3-0-63c4b95a70b9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2780;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=e9ds19egHpAlNMUBumqTG535xVnUxhx4RZGvF/B9hsE=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYkhP8XvnmBgfN3GZXEbIKZP7RTPCXt728Ir7EsbEPjd4T
 otEyyyHTkZjFgZGLgZZMUWW9KXOWo0ep28siVCfDjOIlQlkCgMXpwBM5N1B9v8ROc8bn5cY/4pT
 clG7Mdut846tyuJbV++17Dn5P3Wf1P2qDOG1CbdD1eSuMj+rnsV86vn14OlWcfsSl3l0izcJaZy
 PnHLS3v8S282akrwy21O32wvfG1X0HNJWdLjLeGfenWX9h0p/NbH0hP3jtl0zXajPz1npY2mvus
 S7VPaVl/l6rqeGqJ7TN7uepbX8wA4phj8rM/l/Aamz4tNuPolUMLb5fSm+7ZirFMMpo4clpbv+3
 VUVFzbY7viPQ+afnokVv2z14jC1wNvxBhOuPitckvJJ59Z69tPm/0K7E745X9p44z6PokW1Uvzf
 l00Hrzv0yWhO2NJmx2Ipx6bO6m81+be8J0fv/7qMDY0A
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
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
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



