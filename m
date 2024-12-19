Return-Path: <linux-arm-msm+bounces-42812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1667A9F80A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 17:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B8DF16BF68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 16:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BD91850AF;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PALm1fo8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EEF1537C3;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627057; cv=none; b=SUV3EFdOJs2Iztj5lB2L9c2q/ObPx1gO8LkfObwbc+8qgHauP/9oShSOqBnl78tFP6Dh9juX/9yjK+z9nyHMg+9LgUnodE9zw21DnywQ1HjP+C/FKSazEv7T5jdeeZMW9ViiMba3gC23joV6M3fP0cJnTXTjZhK6SuSEvBtEDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627057; c=relaxed/simple;
	bh=AB6aGFOX3SyMQSLzMBISDbemWOL1G3hS+BgXj1gnSJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAmANUnh3YLr44VxHmDW5WH+/+qcC+lRrjQC6NyV+mxk4n1NmhuVz628NBlFi8TfbzXLk1KO5rZfllAqqM74QudAIfLstwAw2iXc3RLZQDDEdHHEyMxnmnrDi5IWnD9cAKBaClZLdtQx6wcEqDZAMMTusELb7+NgjVzhxO4mgSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PALm1fo8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EBA2C4CED7;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734627057;
	bh=AB6aGFOX3SyMQSLzMBISDbemWOL1G3hS+BgXj1gnSJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PALm1fo8LY69Zl1SAqR0KMxb4CafXW6P8p5Js6VgqrLY9xSQSmyAgjduc1ysJUAmu
	 0go4EC6coir+zlVidYCUTTe1XhkOAUhYvCUxIDQClpDFP6zCZ+IeihbYtiXYyOXQpQ
	 RgkfxnSqemuWPPxCwhkuv2ihgF+bx68RH8UIyfAH3Vu3KzOYLlHorstcTIzP+DjEJ7
	 47X6KcpS93uC2nngA0PUdszbWK2Q1cwVkX5HNRkBzqy0wmZ06s8vRg1oM74DlP1QJK
	 pZXrN0u7EavJ2qaHX6vAH6y+1i0Fyj6on/6mzfhxRve9Wh4sEKM1N/lesdfSQXOjTp
	 pWA8BvKGhpkPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3210CE7718C;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 19 Dec 2024 22:20:42 +0530
Subject: [PATCH v3 2/4] scsi: ufs: core: Honor runtime/system PM levels if
 set by host controller drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-ufs-qcom-suspend-fix-v3-2-63c4b95a70b9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=CRWjLkvIxV4yD3thmr9VSmE0rgLr7gmhR3D9+FQt6n0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnZE7uo9JDtBHj/whdrBNMHmrHxXGvhWDyD21nP
 Rk0uUflwliJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ2RO7gAKCRBVnxHm/pHO
 9UfnCACaTTbmqXfVWbdx0Z4CIy5jVMfx3twVFrnWMKfDpsF79GFuaoRc1ZPukPBANbMu4+QX+G8
 V0UaSwAHk1a2fPX81UCFktcISXhztKG7LRbVhMWNzhGjgg+s4guX5XPdIMblxqlY/OjRI+StU2G
 LZSGaiaqdgyhFMHgtqVfDMau9dQt4ejEjLJ8MvnVsTgVfKcmtMvAO8uySWWedsrsHHtq+f4yTWw
 P/AXrdrwNCI0538WdWdoBk7KwgQi+SUUBlWOfMBHElrgzOI9lQWKX34ZSDMnN2fQv0MDgX7ViMu
 rvbu7SVRawvsplswqleEFkA68GwMFcLSgWC9zIZvEidrc5DT
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Otherwise, the default levels will override the levels set by the host
controller drivers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 7bd0f5482db3..457add6edb31 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10551,14 +10551,17 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	}
 
 	/*
-	 * Set the default power management level for runtime and system PM.
+	 * Set the default power management level for runtime and system PM if
+	 * not set by the host controller drivers.
 	 * Default power saving mode is to keep UFS link in Hibern8 state
 	 * and UFS device in sleep state.
 	 */
-	hba->rpm_lvl = ufs_get_desired_pm_lvl_for_dev_link_state(
+	if (!hba->rpm_lvl)
+		hba->rpm_lvl = ufs_get_desired_pm_lvl_for_dev_link_state(
 						UFS_SLEEP_PWR_MODE,
 						UIC_LINK_HIBERN8_STATE);
-	hba->spm_lvl = ufs_get_desired_pm_lvl_for_dev_link_state(
+	if (!hba->spm_lvl)
+		hba->spm_lvl = ufs_get_desired_pm_lvl_for_dev_link_state(
 						UFS_SLEEP_PWR_MODE,
 						UIC_LINK_HIBERN8_STATE);
 

-- 
2.25.1



