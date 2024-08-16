Return-Path: <linux-arm-msm+bounces-28737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A459541AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3947B282A7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 06:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57B684D02;
	Fri, 16 Aug 2024 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMxGgpNv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F40C84A35;
	Fri, 16 Aug 2024 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723789513; cv=none; b=VirOiFmomP6NtfuHGzWO0R8z3W5EtqGdhQ28TKUdzo/q/XMg/rHvmq1zkOOMSrIkrj+lotrBQ+Q2X2dhJ92lGmobMJ2yFFRPSZUaxa6p/4sLvBeLKApN1cZfHECGdJAf+RrOaqXEDldYOy5q4f19kFOAkx0ERjihmr3f2aeIlhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723789513; c=relaxed/simple;
	bh=+Bc0qNiXVeDnqjahtGmYe+yF38JSKtFQp32reVaFCLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmhcHWAwW/Nzves6BsYsYL3K5NsYRTc+hf9yuBiBG4zddAe6KS2nUnYrQh/hYxIDpkdVYD7pRa4soDrcVOdub5XiKAV8xFZgczkKxKVTIjeq4tufIaOS/nl1NWBSvuhFXK7HdWQq0OztDtXirdgqLqk4P+oueZuJ3psZMfn3urw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMxGgpNv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30A99C4AF09;
	Fri, 16 Aug 2024 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723789513;
	bh=+Bc0qNiXVeDnqjahtGmYe+yF38JSKtFQp32reVaFCLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qMxGgpNvpldUukpFrucpx4M9LM24TJvzL/JBh1ydEtRU1+opqGmWJrGmAUsCXYpag
	 m7IhrhKLmmM9VR3mv6m/+aW5NHWximqKKc9fsHVlZDe2pnSGdA3y9fgc1y08pZqfoE
	 kN63Y5pjEb+tzy7Yd4SCRau04SuEoDtEfE9Hj0Til1ZG0fs6odiU6LWZbmPXyaRTyF
	 CCKwDSHRaVZ+Ih9kJiKJlbiFWwk3Pc/X7bhHR4Cn/1HPCy1o+WWShR8AIWDbSa532I
	 0qAVEaM+FfdZAVAKrG1ZYVKzkRs/oKJ/SCKcGU9BHlRhn+JPwKtew+s9hIBKWaYD73
	 1MkmJQtHnn0wg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E240C531DF;
	Fri, 16 Aug 2024 06:25:13 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Fri, 16 Aug 2024 11:55:10 +0530
Subject: [PATCH v3 1/2] ufs: core: Add a quirk for handling broken LSDBS
 field in controller capabilities register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-ufs-bug-fix-v3-1-e6fe0e18e2a3@linaro.org>
References: <20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org>
In-Reply-To: <20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>, 
 Amit Pundir <amit.pundir@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2110;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=SPYkfqfo4Q1r17yald0viJ0Kdv4k2BQ9xtG4Fmr+8+w=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmvvDHq0jzkKSUn4HFBas0ngL6QLNvB73pon7rx
 Uduh/cpjtWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZr7wxwAKCRBVnxHm/pHO
 9WRQCACLKRBqWESX7mELXEcfRVYlDNQ46hVNTfetT3ZhALCtfZc/t5UeaxTxoXuVF98Hb7SLQvS
 eVRduCS+H7Q8jUML7CwjWPBl2TsaW/U+EOd6mKfXdHQekAo5owyBvFEUE+7Y5dqQwGNiQlyXreB
 /YV5LeFg5AsESejFe/5vu/sTcftEGSOaTjlL2toiY3YjRrcFN4q2QjWsHtCq109pCXx86PB3hVi
 xVdL7Cadq+IdOLwbsAqRC0SovO1ryf7EV0Jp7AksuTk7dxR20bftLxzkG8L2jSFMvkz/6/ppvq9
 +IqO/NeVCTCeM+M7zkhFHvHmdnIwGgqiqixtNw/lHQbbdGZO
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

'Legacy Queue & Single Doorbell Support (LSDBS)' field in the controller
capabilities register is supposed to report whether the legacy single
doorbell mode is supported in the controller or not. But some controllers
report '1' in this field which corresponds to 'LSDB not supported', but
they indeed support LSDB. So let's add a quirk to handle those controllers.

If the quirk is enabled by the controller driver, then LSDBS register field
will be ignored and legacy single doorbell mode is assumed to be enabled
always.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 6 +++++-
 include/ufs/ufshcd.h      | 8 ++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 0b3d0c8e0dda..a6f818cdef0e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2426,7 +2426,11 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	 * 0h: legacy single doorbell support is available
 	 * 1h: indicate that legacy single doorbell support has been removed
 	 */
-	hba->lsdb_sup = !FIELD_GET(MASK_LSDB_SUPPORT, hba->capabilities);
+	if (!(hba->quirks & UFSHCD_QUIRK_BROKEN_LSDBS_CAP))
+		hba->lsdb_sup = !FIELD_GET(MASK_LSDB_SUPPORT, hba->capabilities);
+	else
+		hba->lsdb_sup = true;
+
 	if (!hba->mcq_sup)
 		return 0;
 
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index cac0cdb9a916..0fd2aebac728 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -676,6 +676,14 @@ enum ufshcd_quirks {
 	 * the standard best practice for managing keys).
 	 */
 	UFSHCD_QUIRK_KEYS_IN_PRDT			= 1 << 24,
+
+	/*
+	 * This quirk indicates that the controller reports the value 1 (not
+	 * supported) in the Legacy Single DoorBell Support (LSDBS) bit of the
+	 * Controller Capabilities register although it supports the legacy
+	 * single doorbell mode.
+	 */
+	UFSHCD_QUIRK_BROKEN_LSDBS_CAP			= 1 << 25,
 };
 
 enum ufshcd_caps {

-- 
2.25.1



