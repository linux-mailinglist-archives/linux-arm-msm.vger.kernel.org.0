Return-Path: <linux-arm-msm+bounces-28580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E62B99528D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 07:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98E5F1F229E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 05:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC951448C5;
	Thu, 15 Aug 2024 05:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nROLPqBP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E590218EAD;
	Thu, 15 Aug 2024 05:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723699021; cv=none; b=sPES6tUR+VaNaCjNPPaZE1JYe0IYSln53qsAuHFRm1uR6h/w1p/xT//3UgO7kYgb6mXAu4fmrCoSdZWSSuiWHhrI/RlxWlk4AkoDmr7ldDFTycC6kaVeUxA6PCtUM2p1XUjpKOrDpsMeTn8nlTfU6TKAtZiCZiC7AbVoIW2Fovc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723699021; c=relaxed/simple;
	bh=k94wmKOy8i+80qlRCCU1S29tyDjDgvtK6PBHmgZYVZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmwrjW7zM8evn0mZh5b77aWqczOsbfdjWEqnLxERUQSd2k81Rt0AmcCZXkO+DCma7oRzFxOGTMazOXkJoSPKOefuhZgUF85qwhLdjhjLIuGx0NBvukLNXzKFUdzJzdldkr6iYPYhZxxHuRYY8+b9Kf0QUaajGYRtMaJ6obxWsIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nROLPqBP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD1DDC4AF09;
	Thu, 15 Aug 2024 05:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723699020;
	bh=k94wmKOy8i+80qlRCCU1S29tyDjDgvtK6PBHmgZYVZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nROLPqBPTmsXeHAgAYcm4VPjGqIVeGxNzqu26w76ag22JCJdjBjWVKk5ayGzJFhog
	 2WswWTYwUtPv+M7L4b/uZJAUPWJRzdpvp6WrSGCwLKBEnixpUAvSa6/y6IoL3lFyJi
	 QUMbgq5Fop0N83dmydhjAhrDvbQiukKwrm1mTzqJnsGZ6BRkUCBm/T6jGxYqgVxVfO
	 wq9Roye6ks78M1Kp4AdmpJu+BiRrVmj2u0S1s/fMDy0DR0r1kgh4Solqu0aW9Jx5hj
	 PpEBoDQ1kdIExxk71zGm3QHaHbyQFtP6sV5ID9yOtbeODtyZwux1y/kAms+g9V1r9c
	 2JtjsWM1MuGzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB9DC531DD;
	Thu, 15 Aug 2024 05:17:00 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 15 Aug 2024 10:46:56 +0530
Subject: [PATCH v2 1/3] ufs: core: Rename LSDB to LSDBS to reflect the
 UFSHCI 4.0 spec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-ufs-bug-fix-v2-1-b373afae888f@linaro.org>
References: <20240815-ufs-bug-fix-v2-0-b373afae888f@linaro.org>
In-Reply-To: <20240815-ufs-bug-fix-v2-0-b373afae888f@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>, 
 Amit Pundir <amit.pundir@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2678;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=ug56jraL0N0ozijA5VnULZ3EejWihFXWmVlZhCYNgqI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmvY9KI9x6yyxcGEydOeOFk3MoomjFsm2pATgiw
 W0b/mTYaSiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZr2PSgAKCRBVnxHm/pHO
 9QkiB/943z89vSe87RUYHlGS0PIUdlG0yVOGrc4l8lnbusRoLbyBLueKIX0gw5Yd7Wzedk8BoBn
 1GjjPsBFolEPp2ltgHzHaODC6ppoaIjI7ad1lxn0n4TvKpxtDh96PQRUmka1e9ziRwHCIObo6+p
 hJ8WtwDOUvuLS6eqdtD09rC440aHQDUQld7lafi/EIKI1fcjSupsnQ+0xy8JoSoXTawMnMfkn7S
 vvuMhhcPRzhSI0zQyS6AkD+oQQywQBLGMwiIYX9IaGdWJ8+VMe2iHh9Flo66nRbBq02F78MJXBM
 3kpQBDO2txAzC4xi8LVxHgeAMOW004UyiK4vANKuarhuA/vE
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

UFSHCI 4.0 spec names the 'Legacy Queue & Single Doorbell Support' field in
Controller Capabilities register as 'LSDBS'. So let's use the same
terminology in the driver to align with the spec.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 6 +++---
 include/ufs/ufshcd.h      | 2 +-
 include/ufs/ufshci.h      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 0b3d0c8e0dda..0b1787074215 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2418,7 +2418,7 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 
 	/*
 	 * The UFSHCI 3.0 specification does not define MCQ_SUPPORT and
-	 * LSDB_SUPPORT, but [31:29] as reserved bits with reset value 0s, which
+	 * LSDBS_SUPPORT, but [31:29] as reserved bits with reset value 0s, which
 	 * means we can simply read values regardless of version.
 	 */
 	hba->mcq_sup = FIELD_GET(MASK_MCQ_SUPPORT, hba->capabilities);
@@ -2426,7 +2426,7 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	 * 0h: legacy single doorbell support is available
 	 * 1h: indicate that legacy single doorbell support has been removed
 	 */
-	hba->lsdb_sup = !FIELD_GET(MASK_LSDB_SUPPORT, hba->capabilities);
+	hba->lsdbs_sup = !FIELD_GET(MASK_LSDBS_SUPPORT, hba->capabilities);
 	if (!hba->mcq_sup)
 		return 0;
 
@@ -10512,7 +10512,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	}
 
 	if (!is_mcq_supported(hba)) {
-		if (!hba->lsdb_sup) {
+		if (!hba->lsdbs_sup) {
 			dev_err(hba->dev, "%s: failed to initialize (legacy doorbell mode not supported)\n",
 				__func__);
 			err = -EINVAL;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index cac0cdb9a916..c6ab1c671ad7 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1109,7 +1109,7 @@ struct ufs_hba {
 	bool ext_iid_sup;
 	bool scsi_host_added;
 	bool mcq_sup;
-	bool lsdb_sup;
+	bool lsdbs_sup;
 	bool mcq_enabled;
 	struct ufshcd_res_info res[RES_MAX];
 	void __iomem *mcq_base;
diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
index 9917c7743d80..35013ba71b75 100644
--- a/include/ufs/ufshci.h
+++ b/include/ufs/ufshci.h
@@ -77,7 +77,7 @@ enum {
 	MASK_OUT_OF_ORDER_DATA_DELIVERY_SUPPORT	= 0x02000000,
 	MASK_UIC_DME_TEST_MODE_SUPPORT		= 0x04000000,
 	MASK_CRYPTO_SUPPORT			= 0x10000000,
-	MASK_LSDB_SUPPORT			= 0x20000000,
+	MASK_LSDBS_SUPPORT			= 0x20000000,
 	MASK_MCQ_SUPPORT			= 0x40000000,
 };
 

-- 
2.25.1



