Return-Path: <linux-arm-msm+bounces-28583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E889528D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 07:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 451891C2037A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 05:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88605149001;
	Thu, 15 Aug 2024 05:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHeyH2Cs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DF2145FE2;
	Thu, 15 Aug 2024 05:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723699021; cv=none; b=FyT+T50nZBZsSw9iq/UrFy5vimAJ+9l7UiMYe0Q9RHX75mM0Liu21j/mRg7qul/Kk1LkIyk3krt3T+KVOiciOCILh5RxfiUahGoFeX6LSzyVZQyMNw9LET6y9qshbvVOxVLfV/9MdYIotcALsHs6kLrwLGpsxoHiVRXfs3J8iOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723699021; c=relaxed/simple;
	bh=2eAqnVbEte4Ir5jVn1zGKS2bby0UbSy1ZNXKgTB0tAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oS7OIPhJ63l57ZVcCuY4wRmkXzP27ZDzur8NfHKQ0ma/56r/ix2cS7/EgZSWckKlMe8VK5qp9GIIhT+wk72LHwqP8eADij2iwckLONqXMVZI8RwJT5nOwMnFx3mX9WSb285pFY5AobgeZt6gsiX5rKg4NZdZ5kekjXU14emyI4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHeyH2Cs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE052C4AF0C;
	Thu, 15 Aug 2024 05:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723699020;
	bh=2eAqnVbEte4Ir5jVn1zGKS2bby0UbSy1ZNXKgTB0tAA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kHeyH2CsXNRlcMoj/FnEMzuabmPtjorQArP2gwLIUGW1iw1J346skhXxuD2duFlDS
	 j1c5Jg4y/o91asXQBM8VvUCFQZmL3H/a1M1w0Zd284cSaFRgNPTMAMBQPNXT7jbOoX
	 QhnINms7z6rInTGwL8XIcFfRU1T8wT5M8EqC1waET8am49vyV7JaPsKbKHeBW/y0ui
	 yod9qIW8A2kJGNVwEfAC0hAw232TO1D8JUDNi21g2UCx07JI5gX6UgGEj04uDl5rAy
	 ghfWQ90LdeS8D+ywRibBx0sQOb5cL1rUP0+swlt+xaOvebvfjq+yXgmpQntupWgg6b
	 rbqdiBh27dwtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C207CC531DE;
	Thu, 15 Aug 2024 05:17:00 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 15 Aug 2024 10:46:58 +0530
Subject: [PATCH v2 3/3] ufs: qcom: Add UFSHCD_QUIRK_BROKEN_LSDBS_CAP for
 SM8550 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-ufs-bug-fix-v2-3-b373afae888f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=86LYSca/QxWt1ChuWxvzEFW+WUoUlJ8CGwZ6Mkg+m0I=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmvY9KezBjEvKBHyC6JRqOSOXSyAJE3HpZf7pEI
 or6TZ3a8LOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZr2PSgAKCRBVnxHm/pHO
 9VvKCACBCdKo6gmM1PLI+AHofj7KYljAd050Y3VIV1/+QgIwkMGg5fG+pGI6fG8cb66sZPdA5tX
 /lD78a+ijyD33Om5oBfxwOT286+/DZZ4aKfTeusnHQzcRfKJ1FTC4ra/tyHwckiARE6evITcmeS
 +zkez/V9zEy8iZi8BZ6GB9SKMYW+RcEVL9T9TGJSlcf3qoTwFh+7tynG0XOtaYUCJSPeMKTPE0C
 uPdc3Yoh9jx214LyenbxJSK3Vt2YWa2bLvKCnv9K4ra8Gl2VN/A9SJ1IePShCN6NFCkRgG4i38d
 rjbVNRbxmJfIO4jf6SvyzCVDB7Cr2imZqitPFWCt5HaG2qJ5
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

SM8550 SoC supports the UFSHCI 3.0 spec, but it reports a bogus value of
1 in the reserved 'Legacy Queue & Single Doorbell Support (LSDBS)' field of
the Controller Capabilities register. This field is supposed to read 0 as
per the spec.

But starting with commit 0c60eb0cc320 ("scsi: ufs: core: Check LSDBS cap
when !mcq"), ufshcd driver is now relying on the LSDBS field to decide when
to use the legacy doorbell mode if MCQ is not supported. And this ends up
breaking UFS on SM8550:

ufshcd-qcom 1d84000.ufs: ufshcd_init: failed to initialize (legacy doorbell mode not supported)
ufshcd-qcom 1d84000.ufs: error -EINVAL: Initialization failed with error -22

So use the UFSHCD_QUIRK_BROKEN_LSDBS_CAP quirk for SM8550 SoC so that the
ufshcd driver could use legacy doorbell mode correctly.

Fixes: 0c60eb0cc320 ("scsi: ufs: core: Check LSDBS cap when !mcq")
Tested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 810e637047d0..c87fdc849c62 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -857,6 +857,9 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
 
 	if (host->hw_ver.major > 0x3)
 		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
+
+	if (of_device_is_compatible(hba->dev->of_node, "qcom,sm8550-ufshc"))
+		hba->quirks |= UFSHCD_QUIRK_BROKEN_LSDBS_CAP;
 }
 
 static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
@@ -1847,7 +1850,8 @@ static void ufs_qcom_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id ufs_qcom_of_match[] __maybe_unused = {
-	{ .compatible = "qcom,ufshc"},
+	{ .compatible = "qcom,ufshc" },
+	{ .compatible = "qcom,sm8550-ufshc" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ufs_qcom_of_match);

-- 
2.25.1



