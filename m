Return-Path: <linux-arm-msm+bounces-28582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 071199528D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 07:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AA601C22319
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 05:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701A21465A3;
	Thu, 15 Aug 2024 05:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5V6fmyK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364561448EB;
	Thu, 15 Aug 2024 05:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723699021; cv=none; b=gpKG2z6UUvM2jj8RTj2EJXz2vGcYtmJ3KcpYF3dmaxynAGGMapK0f2zsnbjSo3dxUuXL+3TOX2K5UIZSfkqArtN/oC3xjCwb7MN8fcC81Yi+oL/Vjxija26lA6/QdoIzfm/S02Fjz89t4s7KOA74IYiSxp83tZjx03AU5Rypx1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723699021; c=relaxed/simple;
	bh=M0ZalJaR2cqaYtu21nRymj3MSV1IRF0NUOW7L0tD/OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kKso1CVgYcNuMCmXaWCKGVgQWa4RwOxcCwpnHLbdGb3AmRuFOIuKfVBk2sLc1gsQ6r3QRtfplRNgpjnM+85Nvva7pmK0Jz31WlVEy3RJPxdDgV3vYUDhzDvMQM0qshe8geo7TBjxA8a+5pvP68OC0wr7fMeEhv3IYyx+cQagRc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5V6fmyK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA714C4AF0D;
	Thu, 15 Aug 2024 05:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723699020;
	bh=M0ZalJaR2cqaYtu21nRymj3MSV1IRF0NUOW7L0tD/OQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y5V6fmyK2CE3DXYntItXgXd1y+1xieyIhg4zl47jlfIhJZoJ0cUfYUDIDV2hA1eSw
	 3IJhaDHYaKKNUsdvKlEhFyMXcR2RauHebbTpBvNy9La9lcrbYoWEB/78Kx4NroNWWg
	 nl7RS0ee6diDbPw5yxjvDF1KDCxp+RE9pYE4Qb+0kqzghOiLZWKqFQADsR+vgPA+Ch
	 EgbPs3J1OuN3/9kkJuJmmsgbCseljf4oUuUYDIywpGtCnUSjBKyTzTcqXR6gg1jPzP
	 uhl16XacYIo7psjwZT+Rm8XlCtB8V/Xoo5Flhp8u2medXfjpyL36ubPwJqoaa5g3PH
	 GjGnMlEQAE7tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF30DC52D7F;
	Thu, 15 Aug 2024 05:17:00 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 15 Aug 2024 10:46:57 +0530
Subject: [PATCH v2 2/3] ufs: core: Add a quirk for handling broken LSDBS
 field in controller capabilities register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-ufs-bug-fix-v2-2-b373afae888f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=MCIRPdIw7ETAreNWkpU0sRIHAGg28eU3fllnElqMe2c=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmvY9K42XDU3zXkh8FTpsrZGIqprZAcOJUKh6e5
 LYBQbLGUpKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZr2PSgAKCRBVnxHm/pHO
 9d5UCACQsRMTBjEYzY25J46wBA0oF+Efi6dHqYgYJnNyd9Ed3kgAuLh0S9/FvKP4vIpLQtOmBCm
 SolfhpoHqvGg4/lj313fwwOoY3BlGqJBAjRO2ruTMb8QJnTSn0WeMC9eXDZJ9sLIW1ZwB3Q/cbF
 ILstaNVW9sRcPITMglvKi3+GQu4TbDmsQmiVME6Nq/Sc7eCxjWYSq77umg6VOBRcuwIls4xzRnk
 w9ePwQVYmYjuKZDWkXuoI1JXyJ+bdH239tCOBqa4qN7do/Omk2WXaJFTRIwonXEIRFJpdlz3B/p
 1PcsYCGvY5R/EcUaGCbBiTD1cFdLR7wkVxyATHqkSUzUIQou
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

'Legacy Queue & Single Doorbell Support (LSDBS)' field in the controller
capabilities register is supposed to be reserved for UFSHCI 3.0 based
controllers and should read as 0. But some controllers may report bogus
value of 1 due to the hardware bug. So let's add a quirk to handle those
controllers.

If the quirk is enabled by the controller driver, then LSDBS register field
will be ignored and legacy/single doorbell mode is assumed to be enabled
always.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 6 +++++-
 include/ufs/ufshcd.h      | 7 +++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 0b1787074215..8c9ff8696bcd 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2426,7 +2426,11 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	 * 0h: legacy single doorbell support is available
 	 * 1h: indicate that legacy single doorbell support has been removed
 	 */
-	hba->lsdbs_sup = !FIELD_GET(MASK_LSDBS_SUPPORT, hba->capabilities);
+	if (!(hba->quirks & UFSHCD_QUIRK_BROKEN_LSDBS_CAP))
+		hba->lsdbs_sup = !FIELD_GET(MASK_LSDBS_SUPPORT, hba->capabilities);
+	else
+		hba->lsdbs_sup = true;
+
 	if (!hba->mcq_sup)
 		return 0;
 
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index c6ab1c671ad7..250adb6eddb6 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -676,6 +676,13 @@ enum ufshcd_quirks {
 	 * the standard best practice for managing keys).
 	 */
 	UFSHCD_QUIRK_KEYS_IN_PRDT			= 1 << 24,
+
+	/*
+	 * This quirk needs to be enabled if the host controller has the broken
+	 * Legacy Queue & Single Doorbell Support (LSDBS) field in Controller
+	 * Capabilities register.
+	 */
+	UFSHCD_QUIRK_BROKEN_LSDBS_CAP			= 1 << 25,
 };
 
 enum ufshcd_caps {

-- 
2.25.1



