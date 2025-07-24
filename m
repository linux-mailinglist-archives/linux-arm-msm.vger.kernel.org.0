Return-Path: <linux-arm-msm+bounces-66522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF74CB10A12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E35D8AE1BEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3E02D3A71;
	Thu, 24 Jul 2025 12:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0rZ2HML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A55A2D130B;
	Thu, 24 Jul 2025 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753359841; cv=none; b=hNWKrEh4YGio4bPTG6TRPw2RnEZpBc7hV8GfdJm1TMpQu5htmjkBGzYw7ZQn9AzvflttKADXsgUAVExlNWzkGTS+9XNy3FcIWmesDl0NEkEcPgshOXNxOLscHoa5S9ptriKa/UrqhTjLoqEfX8WDKdN0LlqM4ysQ8BG39WI7Omk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753359841; c=relaxed/simple;
	bh=NvjohCKRVuI3X/Z2kjWMnbmjoXbmUvxRIcXiU3r8B+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t6AkX4d/ESatzkUQ1985rf7famtdtoEG70hxf0Cq+mY8oM7W6nk2gVGz6BcIg9EYA9X+zKRqkKqqAD062R6PLRTUog40hUbbkDUVu1oQZV6LRduplI6ggD3MIv42xrMgbzY+4d+7WJcdXxhObpnQTV4d7LvO5szYaozjcrQmdyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0rZ2HML; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5E7C4CEF5;
	Thu, 24 Jul 2025 12:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753359840;
	bh=NvjohCKRVuI3X/Z2kjWMnbmjoXbmUvxRIcXiU3r8B+M=;
	h=From:Date:Subject:To:Cc:From;
	b=I0rZ2HMLcrgeC1OAroiSvMv5Bl5cADgEugmNa8Z9bC+3hVbpncXqfQRVjVrsqr59b
	 KY1OICYlutpxk8OV5Ve5N7Vhe0IEJkXVCg7mGvVd0RF71g6ldZ/h0q80r3iVE5Q2Gq
	 2lyivKHfNjfx+UxKJm5Uh/7gp4brX97CR7EG7UgcxIKqHQgnMKWHinSRnbMLiU8eMw
	 9E+ZX7ORK+aWnXMX4socffeoVs/tdvQh6XDvrbkXVfxuhG5DwreSuHuGSQLPAPTmku
	 401aH074Am4T5aY+8SKy4yijMLHPmv6ednefNVFCIta6auJGCFCE4CUTyZn/Y5WtK3
	 GbhdjLAGnudFw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 24 Jul 2025 14:23:52 +0200
Subject: [PATCH] scsi: ufs: qcom: Drop dead compile guard
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-topic-ufs_compile_check-v1-1-5ba9e99dbd52@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANclgmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyMT3ZL8gsxk3dK04vjk/NyCzJzU+OSM1ORsXWNjcwtLS7M0EyMjQyW
 g7oKi1LTMCrDJ0bG1tQAFz8MaaQAAAA==
X-Change-ID: 20250724-topic-ufs_compile_check-3378996f4221
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753359837; l=1436;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=IQw2uZl9KIp6K+NmDFHCLSknl/fVSGdZvMT6+PQ+1EU=;
 b=vH/qq8NH9TnZLEGzkXyo0skhv0Lhjk78K9LA27ONUyI1FncGoYa7myyyhT1etx4SonRjKUyA1
 xuJiMVr66RPA1inihqtzPauCVhd8aOmSb+fyYhMs+EaKMGGEBO8esLH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SCSI_UFSHCD already selects DEVFREQ_GOV_SIMPLE_ONDEMAND, drop the
check.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Is this something that could be discovered by our existing static
checkers?
---
 drivers/ufs/host/ufs-qcom.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 4bbe4de1679b908c85e6a3d4035fc9dcafcc0d1a..76fc70503a62eb2e747b2d4cd18cc05b6f5526c7 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1898,7 +1898,6 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)
 static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
 					struct devfreq_dev_profile *p,
 					struct devfreq_simple_ondemand_data *d)
@@ -1910,13 +1909,6 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
 
 	hba->clk_scaling.suspend_on_no_request = true;
 }
-#else
-static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
-		struct devfreq_dev_profile *p,
-		struct devfreq_simple_ondemand_data *data)
-{
-}
-#endif
 
 /* Resources */
 static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {

---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250724-topic-ufs_compile_check-3378996f4221

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


