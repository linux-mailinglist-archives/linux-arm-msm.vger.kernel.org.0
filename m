Return-Path: <linux-arm-msm+bounces-63773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1657AF99E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 19:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1042188461C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3350932624C;
	Fri,  4 Jul 2025 17:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PF4hQLWU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6B326A68;
	Fri,  4 Jul 2025 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650594; cv=none; b=RC3PM0sYF8PKcK7k//bCZynflLZ7tTU2b+YQAmUim8KerjxV3yHMFvA/8vP7iKFokrfaX/sUrggAvKgLxt6d8u36ZI1o1jdLLjQXMpgUN9wvNWfPrOWW6FeCkUe9NpL8CmGIZs2FgB320KTYmGnvxbybxs039lddNa3XpkjCq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650594; c=relaxed/simple;
	bh=iUgw6SdLRmSY+TxjZGHq9wfHyZUGByUgELpbSlwhZh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APnPBUCrpZoLHDa54LL9Enn0gxCfPqqjOxHkkflZFC6UcgsDv2yQyfxWSLq9F/am+Ht4ekkRTWDdBXJrLh/NmbOKiPsgywzSSm/Pb3WrM9G0XWvFrL3La0M4tUFWICteNeJaIprrpcl+6BC5wgREey4VAJB/DNrCHF5arnXw0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PF4hQLWU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0594BC4CEED;
	Fri,  4 Jul 2025 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650593;
	bh=iUgw6SdLRmSY+TxjZGHq9wfHyZUGByUgELpbSlwhZh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PF4hQLWUZUFny28qzzSp6+DyN5jEtKu6ueVS13Y5+eQ3AuWNACbGc0vZOomr2SFLm
	 tEPYUl+UY8W9Bpv+5HfQch/P5UPlk7qmJO//qeSKY2NfMFW5q2O7z1fPGBcmr85CXa
	 0uvpd3IUXjPOcjNXsmHyMhz/tjE5qKcGogP/k0pxQtsuFzb09ADoWh6gJprdYYaXnT
	 9JkUwCvWk/iu+xWLMVrQx91Fnv+Lw3Mn7UEbaSlMoX7lKazN5JzbyHeFTCapzD+6Q4
	 DqaeNqopLp7buSIrFkNeSGM3jXJdCtul7v2ZQWO1Acut/H0htyjnmspRuoyK/lVV1u
	 6YuU1vDFPWKBw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 04 Jul 2025 19:36:13 +0200
Subject: [PATCH RFC/RFT 5/5] ufs: ufs-qcom: Kill ufshcd_res_info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-topic-qcom_ufs_mcq_cleanup-v1-5-c70d01b3d334@oss.qualcomm.com>
References: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
In-Reply-To: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Asutosh Das <quic_asutoshd@quicinc.com>, 
 Bart Van Assche <bvanassche@acm.org>, 
 Stanley Chu <stanley.chu@mediatek.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Can Guo <quic_cang@quicinc.com>, Nitin Rawat <quic_nitirawa@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751650573; l=1282;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=5nEGDwR2LBYGdzzGzrzI3+xVf3CXHgIU3+o0zBEgJ/A=;
 b=LIvygMW9Oogay8z6+5Uv/Y2zljxt4EikyUxi8v3B+2ZKdMVIMMbqwjsPmLWuU+J6QD1idYsls
 YDMu7CikclmCxGi1LzVXV3buDpSq1fNjjYXP+5toSQdolgqdP46IvLh
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This is not used by any driver and doesn't seem like it's going to be.
Remove it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 include/ufs/ufshcd.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 28132ff759afbd3bf8977bc481da225d95fd461c..e99df617ac31e983d452f8983ea0a5498ed64962 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -794,29 +794,6 @@ struct ufs_hba_monitor {
 	bool enabled;
 };
 
-/**
- * struct ufshcd_res_info_t - MCQ related resource regions
- *
- * @name: resource name
- * @resource: pointer to resource region
- * @base: register base address
- */
-struct ufshcd_res_info {
-	const char *name;
-	struct resource *resource;
-	void __iomem *base;
-};
-
-enum ufshcd_res {
-	RES_MCQ,
-	RES_MCQ_SQD,
-	RES_MCQ_SQIS,
-	RES_MCQ_CQD,
-	RES_MCQ_CQIS,
-	RES_MCQ_VS,
-	RES_MAX,
-};
-
 /**
  * struct ufshcd_mcq_opr_info_t - Operation and Runtime registers
  *
@@ -1127,7 +1104,6 @@ struct ufs_hba {
 	bool lsdb_sup;
 	bool mcq_enabled;
 	bool mcq_esi_enabled;
-	struct ufshcd_res_info res[RES_MAX];
 	void __iomem *mcq_base;
 	struct ufs_hw_queue *uhq;
 	struct ufs_hw_queue *dev_cmd_queue;

-- 
2.50.0


