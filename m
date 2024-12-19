Return-Path: <linux-arm-msm+bounces-42814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8C59F80AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 17:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419541693A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 16:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04AA18C33C;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ow4Z81/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E730154BF5;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627057; cv=none; b=Z6CLRg8nopnqI9SL6MD1wK6IemcOHNq51UXXYn0hU+hNuZyrZOFObhQY2rWt4ftIXX+Akyw96UwsbVB1Ugr4CWz4jRLNLq2nrExu6wcShcLYUiIrwhsJx5THaGmjXb2vNqyw3Tm8eQnvilzS4GNJfi944sGAX422YxnHxjj6ZHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627057; c=relaxed/simple;
	bh=xhZ3vbZu7Y9dsCMdrsbQzd8dviR1JmdwpAGj7iavs5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AfqJqDtgYge26I9WBqSZCFIb3ZIkaKM1TewH49wBR2RqQlixfPuSH5XqcuRugUxs4xCU2Mh0kmod0BHyiV7e5cLOoJCaSJhC0TLiIsBc9OEuaNTytDCLjRi9dx/46KQxfC0HkWBqblN9TvjZpddy/Pfej/aOvaBhJ9XzCE2bIUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ow4Z81/s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CC14C4CEDF;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734627057;
	bh=xhZ3vbZu7Y9dsCMdrsbQzd8dviR1JmdwpAGj7iavs5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ow4Z81/szGsTeu6NrD3b7Is6zI120yJsUtPRk27wRmBAu9z9qxsNmbYF4ecFXJYVK
	 ciN6RBQllNZH3DMAOUbku6A+C499YkTkLBOMkA8oM/C95RVMxV5ye7WNIVr4ZJG2vh
	 t0V9QwWDGwgWkASOdGV4N0Sa9zsZGIJpcY4rq3naIq9KwL5wlof/hUa9VvsFl0KDHh
	 ZpFqNv3eiXnlXs9DajZQHZIaG+CQMVQBoPHiVZBrPf3BOiNTDAGWP+ZgVd5REpEk01
	 CBFKRH4QgTaS6Ct+MdeFd82qC8MhpPrsBtgBgCGmW6Qf4Cl0XYSedKKYiaXt+cqurg
	 jIKMnqlTksseg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C4BE7718A;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 19 Dec 2024 22:20:44 +0530
Subject: [PATCH v3 4/4] scsi: ufs: qcom: Power down the controller/device
 during system suspend for SM8550/SM8650 SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-ufs-qcom-suspend-fix-v3-4-63c4b95a70b9@linaro.org>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3224;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=mjTpMlts3P/2Gnsk4AM2DfwHRnHsA+PpvKMlx+U/vXM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnZE7ultmuMuoV8d6A40y4A/puAVjWb2xcROdkq
 uvrOBrjcteJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ2RO7gAKCRBVnxHm/pHO
 9UURB/wI4GCFYQOvq0IJMZfRS6mWQ8ZP/+OSW9oce4f1P9o9r+Mwj2mTLA5snlbq9epTAuAyo75
 T3+xFg5SM2G3k8wQ54PCtGupla9sVbOZk2DehuJEDNX4Ei7IIi+U1rmtU0iJkx/cqzQfZohkmkF
 +stpLVb0CT0VHDkHCylq8r4iuM81z8ZjFdlSlh+xqJvbUoBTQ5r7czBy2yzIiBhIkMo2jUrUTSX
 zX8WHLjz2WjKc8h08VUFR3SsCkMemJa0z1mWEn1jL5S1FLpepHGe7B/+Hk3nxVuYXqHirczbL6B
 T2Jt6Lz4zw6a68zKEcmIVFghffO4tFmYcThnRJFqeULrMxaE
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

SM8550 and SM8650 SoCs doesn't support UFS PHY retention. So once these
SoCs reaches the low power state (CX power collapse) during system suspend,
all the PHY hardware state gets lost. This leads to the UFS resume failure:

ufshcd-qcom 1d84000.ufs: ufshcd_uic_hibern8_exit: hibern8 exit failed. ret = 5
ufshcd-qcom 1d84000.ufs: __ufshcd_wl_resume: hibern8 exit failed 5
ufs_device_wlun 0:0:0:49488: ufshcd_wl_resume failed: 5
ufs_device_wlun 0:0:0:49488: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x84 returns 5
ufs_device_wlun 0:0:0:49488: PM: failed to resume async: error 5

With the default system suspend level of UFS_PM_LVL_3, the power domain for
UFS PHY needs to be kept always ON to retain the state. But this would
prevent these SoCs from reaching the CX power collapse state, leading to
poor power saving during system suspend.

So to fix this issue without affecting the power saving, set
'ufs_qcom_drvdata::no_phy_retention' to true which sets 'hba->spm_lvl' to
UFS_PM_LVL_5 to allow both the controller and device (in turn the PHY) to
be powered down during system suspend for these SoCs by default.

Cc: stable@vger.kernel.org # 6.3
Fixes: 35cf1aaab169 ("arm64: dts: qcom: sm8550: Add UFS host controller and phy nodes")
Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Amit Pundir <amit.pundir@linaro.org> # on SM8550-HDK
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 5 +++++
 drivers/ufs/host/ufs-qcom.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 35ae8c8fc301..edf62430cabe 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1069,6 +1069,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	struct device *dev = hba->dev;
 	struct ufs_qcom_host *host;
 	struct ufs_clk_info *clki;
+	const struct ufs_qcom_drvdata *drvdata = of_device_get_match_data(hba->dev);
 
 	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
 	if (!host)
@@ -1148,6 +1149,9 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 		dev_warn(dev, "%s: failed to configure the testbus %d\n",
 				__func__, err);
 
+	if (drvdata && drvdata->no_phy_retention)
+		hba->spm_lvl = UFS_PM_LVL_5;
+
 	return 0;
 
 out_variant_clear:
@@ -1866,6 +1870,7 @@ static void ufs_qcom_remove(struct platform_device *pdev)
 
 static const struct ufs_qcom_drvdata ufs_qcom_sm8550_drvdata = {
 	.quirks = UFSHCD_QUIRK_BROKEN_LSDBS_CAP,
+	.no_phy_retention = true,
 };
 
 static const struct of_device_id ufs_qcom_of_match[] __maybe_unused = {
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 15f6dad8b27f..919f53682beb 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -219,6 +219,7 @@ struct ufs_qcom_host {
 
 struct ufs_qcom_drvdata {
 	enum ufshcd_quirks quirks;
+	bool no_phy_retention;
 };
 
 static inline u32

-- 
2.25.1



