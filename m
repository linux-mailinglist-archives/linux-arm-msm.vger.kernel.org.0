Return-Path: <linux-arm-msm+bounces-28535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F4E9520D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 19:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EAE31F2422B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D9E1BBBEA;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSbSEyPN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EDB1B4C3C;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723655738; cv=none; b=ZHnZGOl23jj1gleyndPJlQVJXH2kt4CRo59Ts0Z0xuw+jsk8qBR9EipLMwSW65XKn5i0jQ/fLfGVyNwT9R0pWI5RPlMHS3bz3GJuYDAM04ZEhvj0G/iabBRGt/68prR1TBCw/zukr5ouVJKypI6E5Iq165+rWlU2nvwk9E4W23M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723655738; c=relaxed/simple;
	bh=uhB5tp9HxI7AQHzj3j+STWwEQWpW8iHWMwuvU5vQ/+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4dzpYYgBdnw3bChTzwX38Bnp6R0EXeAJtRVCOYWlyKXOZcLF9NCX6dmudY8D+iWvSrNkhdY0b522giz3nM7HL+jE9TFmEHICvecG1ZCha7TuZnA7KOwTDfXPFo0TAy7zKvBf8IYgdrvfG/ANll0I10f1eQZXLh8K2I8f7jWo6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSbSEyPN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18C4BC4AF0B;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723655738;
	bh=uhB5tp9HxI7AQHzj3j+STWwEQWpW8iHWMwuvU5vQ/+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SSbSEyPNADtTn40pj0Q0jFKJN9c/LZMCYrtvw8aV/CjnusIR0gj0sEP3RxHmcE9cM
	 DlPJqz6SpICOJkZkQY30fwDBs/EumNj60+/md6kp5aNBP01vZ6ICpB0iVJj8lR1ISm
	 mEvPkAXMahsE86O9Je4UrvSwURxIqnyrQXoFQ6ouQZIODbZhMP6ZUt42cnZnBVnMtm
	 p55PlGHV4UQCNZS4ep7/sHeyMov87PIbTPxftU/ExI4/5BFpK/dCi52Jmwsy26i8To
	 S84jzP/qzsm1uvNoAZnp/uSvgIxKZRiUIFTAE9qo1unMxJmdb7utItJqxoJnre5Tbc
	 DntxJkSrkA2Qw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2B0C531DC;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Wed, 14 Aug 2024 22:45:35 +0530
Subject: [PATCH 2/3] ufs: core: Add a quirk for handling broken SDBS field
 in controller capabilities register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-ufs-bug-fix-v1-2-5eb49d5f7571@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=b/cuuxILW/Nn5o+nE4aellu+itmsZwg73HSlbrIKfVs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmvOY3lBK7tzrEC7WXwsQVgnENFIxae751N7f5D
 TgEOJSS2GmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZrzmNwAKCRBVnxHm/pHO
 9cO4B/9PMf0FjxvFCxyoHFRSPjyHN18MiXSQ+tF0M1WFQxJu4PpPJXaHonmx1YLq7X3naUyB1IP
 s9mWrfcQt0saHVbW2B8dQ2J85iIYgIQp1+LSatEUvZKVd0/9csAQAl5r698pHEJZL9lmzBr8jJ8
 Sx8nW+GxxNfPca166Tlabp5p9lI2yUXZwo3Vl2Vrlad7ocnsez9yY2E528vD747w/BwRRfcGYPE
 57eRq80wMINMtBViFvvAMdfzuBE9Ci9m0BNvvKKFCWOL6JAcRAh0eo7WrZPudw28j6Me+MBBmSS
 UHmC3OubIS+a4r71H2ZoYpmJOB0uYEN1m2CjgeisuCUZSu7R
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

'Legacy Queue & Single Doorbell Support (SDBS)' field in the controller
capabilities register is supposed to be reserved for UFSHCI 3.0 based
controllers and should read as 0. But some controllers may report bogus
value of 1 due to the hardware bug. So let's add a quirk to handle those
controllers.

If the quirk is enabled by the controller driver and MCQ is not supported,
then 'hba->sdbs_sup' field will be ignored and the SCSI device will be
added in legacy/single doorbell mode.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 5 +++--
 include/ufs/ufshcd.h      | 7 +++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 168b9dbc3ada..acb6f261ecc2 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10512,8 +10512,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	}
 
 	if (!is_mcq_supported(hba)) {
-		if (!hba->sdbs_sup) {
-			dev_err(hba->dev, "%s: failed to initialize (legacy doorbell mode not supported)\n",
+		if (!(hba->quirks & UFSHCD_QUIRK_BROKEN_SDBS_CAP) && !hba->sdbs_sup) {
+			dev_err(hba->dev,
+				"%s: failed to initialize (legacy doorbell mode not supported)\n",
 				__func__);
 			err = -EINVAL;
 			goto out_disable;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index d44b19cf9f82..85c6ea28d45d 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -676,6 +676,13 @@ enum ufshcd_quirks {
 	 * the standard best practice for managing keys).
 	 */
 	UFSHCD_QUIRK_KEYS_IN_PRDT			= 1 << 24,
+
+	/*
+	 * This quirk needs to be enabled if the host controller has the broken
+	 * Legacy Queue & Single Doorbell Support (SDBS) field in Controller
+	 * Capabilities register.
+	 */
+	UFSHCD_QUIRK_BROKEN_SDBS_CAP			= 1 << 25,
 };
 
 enum ufshcd_caps {

-- 
2.25.1



