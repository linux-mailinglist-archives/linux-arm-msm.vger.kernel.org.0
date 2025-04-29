Return-Path: <linux-arm-msm+bounces-56168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D886AAA1B73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 21:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B0454C562C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 19:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DC424729E;
	Tue, 29 Apr 2025 19:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLhuIhjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C5222A7ED;
	Tue, 29 Apr 2025 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745955986; cv=none; b=TLx9zwvbmfHNgNSzLeielwzWNU88XbmGiX8Q7736T2hAkoFwpYvccy815+G2MDp6xmPWuj3WKmOdZoRYLTHeG2rKZhN7nUArSDDosaoygi1Bm4xi4+vjjk1/iuW2zBBFdfYycS8hRLpDBa06XiYBkSdBYTIfquGc3e0zZERvC/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745955986; c=relaxed/simple;
	bh=epwUWG3hUTSdO39fbHMOAdOJmTT4D+QE67Z81g1XRzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G7Ht2zWiYUZ/GWpoDc6TwNox4ZYkLwBLPpHTTk1BwoGDQvIWxHkHtAiJkgxQasy8q9zy6LIAJmWpESaLiKNgAWJM0sdGL4TM82Fw/yV/JXQHLHPk1Rk71MnKh25uDw2FM7cWM/FVIgA0nHTTVxDs0tF9Ra7wvjNF+K6FktDhWVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLhuIhjh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4782C4CEE3;
	Tue, 29 Apr 2025 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745955985;
	bh=epwUWG3hUTSdO39fbHMOAdOJmTT4D+QE67Z81g1XRzA=;
	h=From:Date:Subject:To:Cc:From;
	b=RLhuIhjhsNYtQUZH7ZC68MgTZsII2Ei0e56QdIglDIQo/Txl2x3INFMXaWtuW9XFT
	 32d2cYyLYoz3aVJaoETtlBTJuAkUfWfZBH1XpMmGMgXMAKnPyrGnsjhVHRcY5eYMBs
	 moF9nBHfyHGe7+/vw0AYjVaoMAisUqkijXCYcWIr1grWKjgDXLbjK8fRK6dBxX+HM0
	 X+WiMAeps0i7PiYGN13ND07E8o3S00E2ysNOB8WooTKHSJUkXw30Ldj2ZfxHZMOur1
	 t30Q+GRP+Aem47mpVsRoE43fWJWnL+NjubxDZUy2jcFyUi2FMX2TFhrMf2CQenN/ml
	 HyXxucQtvsF9w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 29 Apr 2025 21:46:07 +0200
Subject: [PATCH] scsi: ufs: ufs-qcom: Add more rates to
 ufs_qcom_freq_to_gear_speed()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-topic-ufs_sdm845-v1-1-faabce28a63b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH4sEWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNL3ZL8gsxk3dK04vjilFwLE1NdQzMLSyMjI4s0k5QkJaC2gqLUtMw
 KsJHRsbW1AC6fc21iAAAA
X-Change-ID: 20250429-topic-ufs_sdm845-16892228f4db
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Peter Wang <peter.wang@mediatek.com>, Bean Huo <beanhuo@micron.com>, 
 Can Guo <quic_cang@quicinc.com>, Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745955981; l=1372;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=8Feni5EwMfFqOoooXK+CNvIvFMxdmG8iK8fnUw6OZvQ=;
 b=rDdly1E3tSM3R5EKiw6RugBrT40pTf5ENu3/uhgcjJBM7C9MRvT8QvBZdWt+vNz+ZJcpwwTN6
 pEfO8whpaE5DMEExlMuFVgWCqfHUwJQPqfv9xPHYje3HFfoS01OzR4Z
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Booting up -next on SDM845 results in a number of warnings like:

ufshc: ufs_qcom_freq_to_gear_speed: Unsupported clock freq : 50000000
ufshc: ufs_qcom_freq_to_gear_speed: Unsupported clock freq : 200000000

Add the rates to the switch statement to make the check happy.

Fixes: c02fe9e222d1 ("scsi: ufs: qcom: Implement the freq_to_gear_speed() vop")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 37887ec684127925e92e01d40f5ea6b8cdb7fc3c..6ddae865b35851b3b9d5bc5fd3720d06be0b2972 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2104,6 +2104,7 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 		gear = UFS_HS_G4;
 		break;
 	case 201500000:
+	case 200000000:
 		gear = UFS_HS_G3;
 		break;
 	case 150000000:
@@ -2111,6 +2112,7 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 		gear = UFS_HS_G2;
 		break;
 	case 75000000:
+	case 50000000:
 	case 37500000:
 		gear = UFS_HS_G1;
 		break;

---
base-commit: 9d9096722447b77662d4237a09909bde7774f22e
change-id: 20250429-topic-ufs_sdm845-16892228f4db

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


