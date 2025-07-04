Return-Path: <linux-arm-msm+bounces-63769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AFFAF99CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 19:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C66541CC093D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE452F94A6;
	Fri,  4 Jul 2025 17:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnlAXUF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BA72F8C58;
	Fri,  4 Jul 2025 17:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650581; cv=none; b=JLWgGCIYqWNo7jbRXvNxuBeNJmysjQD1p5Q4NkX0C0U5Ia6OPXEz6JtdLKg4zIz/8VRen8a1ic9IcCPMhCltt+P4Dj3m6j5zxVwhg8BJYhphCE7Xx2MexQiwdv6ASLnTLPXWtBRcDP57w/EtURxV7HcluQ3kAAzZCr7AtxAGvfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650581; c=relaxed/simple;
	bh=8jaz+aYQDTWx1my2TCQZNcKLuM37UT8p2RZdSRV9x5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RbW/BCh14dVBqgQ6jhpylgWlgc9J1cNcagT5eJuBnYXBQYtMgYAHbewBfkiRqzUBXVxgJNUUxJMb+TNrD7/gk3hZFRtIAaRTlrSlFdzb17YGy0Q6RUfRSKob+W7ABKkPlll3bBmCiDKIiLClPzt9CkvNfPdaiJFkC3lTtPJrl4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnlAXUF+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490F0C4CEEE;
	Fri,  4 Jul 2025 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650581;
	bh=8jaz+aYQDTWx1my2TCQZNcKLuM37UT8p2RZdSRV9x5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EnlAXUF+/QV1mkeIxWRoZBCR51V5lllijW7S19FOq6wohuuVSIccxZLYR8uLNwaZf
	 nTIAOAwJ3Pq0PSBOwZzTnrglK4LwZO/xEoqBDavP1jdz7I0ZdFhccQyuAvQcwLO3dJ
	 1qNMUCq7INGlLuNaMehBgAmFbVxImM/LyvpyG3F73BZ9t2f6oEBi8cQHRp8o0OputO
	 QzzQ/ciSkVsgXCMcO2S+NTKvVPfSfiz1g7EUN6S2srdeoz3lQ8bY0MCZb0lvUkeMlv
	 50QsiYLgn0OosRwOi/Pvcoe1uO1Zu6mjCuX06/LmM91brPJTgK1niGXaaY6gctRtIs
	 a4sxERU4XEo4g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 04 Jul 2025 19:36:09 +0200
Subject: [PATCH RFC/RFT 1/5] ufs: ufs-qcom: Fix UFS base region name in MCQ
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-topic-qcom_ufs_mcq_cleanup-v1-1-c70d01b3d334@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751650573; l=946;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=IbnTdlJA3DyHgeEuZgss0N7Bjbg2NunWI+vgqCmwlLE=;
 b=wAIG7O7w+MRGN7Scpx2E1RHI/qWDEKaG7e0L2T7hTqmJCedKoOZIoHGv3+obCLfX93+3xKR8j
 qfMXgbNws9HB98UE91CqKF47AfexB33vGojNVVqz5fSQ3SiiGbDXfjp
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There is no need to reinvent the wheel. There are no users yet, and the
dt-bindings were never updated to accommodate for this, so fix it while
we still easily can.

Fixes: c263b4ef737e ("scsi: ufs: core: mcq: Configure resource regions")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 318dca7fe3d735431e252e8a2a699ec1b7a36618..8dd9709cbdeef6ede5faa434fcb853e11950721f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1899,7 +1899,7 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
 
 /* Resources */
 static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
-	{.name = "ufs_mem",},
+	{.name = "std",},
 	{.name = "mcq",},
 	/* Submission Queue DAO */
 	{.name = "mcq_sqd",},

-- 
2.50.0


