Return-Path: <linux-arm-msm+bounces-42036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 085239F0E06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE1DA28475E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849891E1A2D;
	Fri, 13 Dec 2024 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXNAEqTQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D91E1021;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098017; cv=none; b=przH49Ugaq/i/Rahsil4x3uTBGMIumzihSE9A5K+USlGdiK1+2zh+zrrmlY/BDDwSOCreR2Y1OIU5WyKPrk2dB+PwYsgcWJ5kRj/tkXslxe7WDY3ClPn2u4N52HiPWuRLc9Xf2Hj1bDQn9faXKtWSD82YKOigPde85EqNL2zAlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098017; c=relaxed/simple;
	bh=RLrPP1UOgG1fZPu3wenA1ItNRecGsfpipjwJK5Rn8So=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtDCqE1YNaYKVxAMYC5orGnfbot/1YocrE+73e05qOtMjUxl2y4vl74bi1z9MsZcZuUN1lHipEwcHZ0os9xA7AI5dWi/oa7vonBzCzgqXo5sK0NsLF2q4/6RwXcmRbrgJRWZtUCf6nRaQq3WkVZihIpiAphel4PHyGxf+6Z1eNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXNAEqTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B11A3C4AF0B;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734098016;
	bh=RLrPP1UOgG1fZPu3wenA1ItNRecGsfpipjwJK5Rn8So=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XXNAEqTQ92uJ4veGQ6SqqDIhvdN2aBWbk8/iULZqM5iMgy5XWi7+b5/wBH/WYs8q4
	 NQlikAdOn22ZzZMVYfOxRnIiuHkvVB+VJrMky65yRv2lLRagDNE/KDSGXsjuH8NdyH
	 3jndUqkUS/HUA1RJTS1nu8nRUBC9Vhdr5Z8Tmtrc6HyR9S9++kWWAW229pTTbNE3ur
	 9G6CitFRMEyKTpVI/OwOh+zBgVW44UypXhbrqiIUO1GKqDMD0RL0JkdOlmdzU+Rs0U
	 VH7ZV1yXVU8TBbdPpIedLc3+qmhiJlLi+i0K2Nq3H1X+GL/aQgmgf6X7mrQrnmJpyf
	 btHzdqpoLSzMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937C8E7717D;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Fri, 13 Dec 2024 19:23:31 +0530
Subject: [PATCH v2 3/3] scsi: ufs: qcom: Power down the controller/device
 during system suspend for SM8550/SM8650 SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-ufs-qcom-suspend-fix-v2-3-1de6cd2d6146@linaro.org>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=dm+C1IineBDRJt5UyRNTw/yDrjuto+TzGCEuC82e76E=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYkiPsYk5XdcQFOSdlJb88sca9c9lF9+/U52kUZDiuavBQ
 jI1S0Ctk9GYhYGRi0FWTJElfamzVqPH6RtLItSnwwxiZQKZwsDFKQATWSPP/s9a+p95776Zt1rF
 kqQX+kyw0jFp1D954eYuWx4+VgHViTseKmY/c3hR9+i3dN3ZNo1eLo6T/3bVBn5mTJRg0v214/E
 27+0zQrnfG5j5h8+QDy8q7dKqc/TOqV7NKebmLVkvuuID/5ED3NOn/N3W32zgFLHK5V69vNUUCf
 2VxbV26VJO0kcYZJ7yqGQY6HKWsMTO3pGfujD72vRv9VXdl1udnH6/W6AavC5Z1ox7gckzt9XuM
 plhFiprrGYHWWxNqZl2a/arq1bfdbp+T6t+lmls+rKH1zEppLl0tW/n4Vs/d9aIhK/98nea6O41
 trNsMlz3N4Qr/3z7O4Vtj1iP2aZ37poTr2Q9Fkz14nsIAA==
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



