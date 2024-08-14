Return-Path: <linux-arm-msm+bounces-28534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E478E9520D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 19:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0C66289466
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD461BBBDB;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GjJXJwzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E8E16BE14;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723655738; cv=none; b=gD+Z7t+gji8uhk+bjNUw6dQb3Gm70Q8xDUxkpSF6x7HzvjCcxkyRjN8qJNTnQDg1MfJCSmMf5DGCYvocy8fpvEhHbp/V08aHZlfmooSCMHsAmXr6IYlf/tvGJI+855efg+Rx/aJIBs9GsVuYtwg18UWhh5v3aqW+XpUiznOx1r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723655738; c=relaxed/simple;
	bh=4G+1rYVbP64RHUW4ZvLPjIXbtsIri1hPAIz9g7DS1lU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uHaaH3l0t98f61ZyqKQQlz/NATSHUYuR52rMuQ2ELf8kXMvKO0RpfYvTXHnu7Oqmm8aqO3uOz7wE4FRvs11pAxSmYA2T0T9IzrtVkPRIkODP6SOzEkRjiHdAQ+oNRq8kNOQmLd9Yqfw4a7dPywf8FxZo3DTgQORg1YTWirpZrAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjJXJwzM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03DF6C4AF0A;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723655738;
	bh=4G+1rYVbP64RHUW4ZvLPjIXbtsIri1hPAIz9g7DS1lU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GjJXJwzMdc4f43DnG6pfNIMYhmaFKspCtEP5BBESqNRhmNJg4gEJZuqL5NPJfwg61
	 cOxpPWVltFiK3WyvmS0k+eMETqholnwVDUH3lj+ZgXWG5/lCbP4lkJ5JX3s8IRfpT1
	 IApeyCI0mGq9RVIcwlhEL8KaywVOHj1cSaykWHUli4wgMepOaJtNC7pGMIDwMRh1np
	 EYNXPD8O4LnuFrxgWL+Hsm3eN707OZCE+WfQDLd+TSgS++pwHELpvLQgQqH3E2I4+t
	 veiAXgF9aMvzNUSAmKVyLXw9S1bUDFkuQ6am8zN1pRW5Kty5GJ2mLpni8nWNPFWfTJ
	 k7Np8BwMlyoXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74F1C531DD;
	Wed, 14 Aug 2024 17:15:37 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Wed, 14 Aug 2024 22:45:34 +0530
Subject: [PATCH 1/3] ufs: core: Rename LSDB to SDBS to reflect the UFSHCI
 4.0 spec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-ufs-bug-fix-v1-1-5eb49d5f7571@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=YW06jWkKjEWiplubl7FzAc5Mu1aZMxORon0NWYdZPK8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmvOY3WdNs13h5ZEVwiZkwRSCloR1bfX4X7ZrHy
 AIyYgHK9emJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZrzmNwAKCRBVnxHm/pHO
 9c+bB/9CjuTsZyKd9CqBKToyshFHSvU4ZD/FxkvmwXU8WGRlMYrs+Bw40cB06Yut3OOUHUuFbY7
 6LkOTkKh7kClYmSekCKyXlbc8WXZ9yreqvNB3rO8oMaW1jKSAVjIkJ+ZCXSL3shTPYny1g8KNN6
 YzcwhW8nEOPSnZEPwy3tV6/QzdcGaNCX+4SO6p+DS99BE3NjdJNE1DTMPAvAhLxmE6FPNWWKe52
 LlMF/0N9PwqpG4Q6nW5BVqVtJp9u/iqY01hrjy8Kli+X3Qt3B8r+ga3e8inbHrMMPvrzckCZoa0
 AVBYklWNJfdqHTAkx57oG2SXwAhgzaXpbTlYmcmcD5uciV6m
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

UFSHCI 4.0 spec names the 'Legacy Queue & Single Doorbell Support' field in
Controller Capabilities register as 'SDBS'. So let's use the same
terminology in the driver to align with the spec.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 6 +++---
 include/ufs/ufshcd.h      | 2 +-
 include/ufs/ufshci.h      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 0b3d0c8e0dda..168b9dbc3ada 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2418,7 +2418,7 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 
 	/*
 	 * The UFSHCI 3.0 specification does not define MCQ_SUPPORT and
-	 * LSDB_SUPPORT, but [31:29] as reserved bits with reset value 0s, which
+	 * SDBS_SUPPORT, but [31:29] as reserved bits with reset value 0s, which
 	 * means we can simply read values regardless of version.
 	 */
 	hba->mcq_sup = FIELD_GET(MASK_MCQ_SUPPORT, hba->capabilities);
@@ -2426,7 +2426,7 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	 * 0h: legacy single doorbell support is available
 	 * 1h: indicate that legacy single doorbell support has been removed
 	 */
-	hba->lsdb_sup = !FIELD_GET(MASK_LSDB_SUPPORT, hba->capabilities);
+	hba->sdbs_sup = !FIELD_GET(MASK_SDBS_SUPPORT, hba->capabilities);
 	if (!hba->mcq_sup)
 		return 0;
 
@@ -10512,7 +10512,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	}
 
 	if (!is_mcq_supported(hba)) {
-		if (!hba->lsdb_sup) {
+		if (!hba->sdbs_sup) {
 			dev_err(hba->dev, "%s: failed to initialize (legacy doorbell mode not supported)\n",
 				__func__);
 			err = -EINVAL;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index cac0cdb9a916..d44b19cf9f82 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1109,7 +1109,7 @@ struct ufs_hba {
 	bool ext_iid_sup;
 	bool scsi_host_added;
 	bool mcq_sup;
-	bool lsdb_sup;
+	bool sdbs_sup;
 	bool mcq_enabled;
 	struct ufshcd_res_info res[RES_MAX];
 	void __iomem *mcq_base;
diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
index 9917c7743d80..b60212865e90 100644
--- a/include/ufs/ufshci.h
+++ b/include/ufs/ufshci.h
@@ -77,7 +77,7 @@ enum {
 	MASK_OUT_OF_ORDER_DATA_DELIVERY_SUPPORT	= 0x02000000,
 	MASK_UIC_DME_TEST_MODE_SUPPORT		= 0x04000000,
 	MASK_CRYPTO_SUPPORT			= 0x10000000,
-	MASK_LSDB_SUPPORT			= 0x20000000,
+	MASK_SDBS_SUPPORT			= 0x20000000,
 	MASK_MCQ_SUPPORT			= 0x40000000,
 };
 

-- 
2.25.1



