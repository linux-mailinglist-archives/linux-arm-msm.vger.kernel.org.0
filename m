Return-Path: <linux-arm-msm+bounces-63772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D8AF99DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 19:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 783B91C22464
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED9D326A41;
	Fri,  4 Jul 2025 17:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdAEb2TI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0350432624C;
	Fri,  4 Jul 2025 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650591; cv=none; b=OXSTPDlUhfLfoXWKrSw6BRT6WIwDGB6sx8gkEi3e8JBLF34yIEdTCUUCYSY4ysMqbO3tfi0UuqtC8sJP0vKJZRBgRCkX5pwi/VR+yJpX7qRB5VxON7pfkJUcuSTWRBEgizp3xevWLRzxKpNkmX0oBugTelRyFQAJ7QW+IQnX9h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650591; c=relaxed/simple;
	bh=z/ePAyDgV+JrevKmvRY2qbMBnHnrNMuxv9BxUeLOU/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PZSx+yaqmNkk4+gWruSBKPvvLGRerQf8e0WLuaXhs+ApPepbRndZluv0+psCjYkoWXTBQc2KxI/L6cuaCVckubPKaeN33A+V7DS+fsFoTKqck94NfLLy9rWKGS4jKL4tBcaBEyTddIKkFcdyaJCwzZYY4RM6b1/qpqMKrPMPjKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdAEb2TI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B88C4CEE3;
	Fri,  4 Jul 2025 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650590;
	bh=z/ePAyDgV+JrevKmvRY2qbMBnHnrNMuxv9BxUeLOU/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sdAEb2TI8bcB6UqeIRvHrwoVIYFfDP4Ypqq/VLNgJTqQESxsxVHyMicuB2wZCzR9Q
	 vH9iTzTch5iKracBadBQewiZCTsCElxOHZ3Z4ioe44JGcIaiAw+FbNAawZFGH7Fv1y
	 Pasibw9X5kObGKy9HDVQH3SQs309zUATKhF4f5kWqGiAJnHVKIrLy7d7HRbGwECvJB
	 GUHQf6EI3ZYUt9n2JSlOeFwbZ2i3eWxLq8UxCxcuqNL04gU8Wkf/b7eCOlC9D87A0Q
	 /sb5jyUbI/59k+gvFkH2xpC8YNH8JP9K0pdLVLpNhCNMALV92KSp8zd6ZvQH9A9Qt0
	 +IC4V7jCOLk4Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 04 Jul 2025 19:36:12 +0200
Subject: [PATCH RFC/RFT 4/5] ufs: ufs-qcom: Rename "mcq_sqd" to "mcq_opr"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-topic-qcom_ufs_mcq_cleanup-v1-4-c70d01b3d334@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751650573; l=1660;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=qHZj5e2FXakjKwnr1HyGKlEMV85hPgCXxGadgTWBQZQ=;
 b=/bIxTkzHhef+/mDC3R0nLPMlb22ChAauHwsgqbkfRAStv8JKwOJWZIa2rUyHIR46w3sea6Mh+
 wndgKe+ths3D87nbUJvwOcFkIECdWjuG1dLVUB+biQLkGj9JT5ICYlr
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SQD is a confusing name for the register block that hosts all the
opregions, each one of which contains SQD/CQD/SQI/CQI subregions.

Rename it since there are not even dt-bindings for this and therefore
no users

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 52dc0da042cb62a6c28b40e429773808299e102f..2953b86029cfa1e5fdaa75e2917cad79576947e2 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1896,21 +1896,21 @@ static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
 {
 	struct platform_device *pdev = to_platform_device(hba->dev);
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	struct resource *sqd_res;
+	struct resource *opr_res;
 
 	hba->mcq_base = devm_platform_ioremap_resource_byname(pdev, "mcq");
 	if (!hba->mcq_base)
 		return -EINVAL;
 
-	sqd_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mcq_sqd");
-	if (!sqd_res)
+	opr_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mcq_opr");
+	if (!opr_res)
 		return -EINVAL;
 
-	host->opr_start_base = devm_ioremap_resource(hba->dev, sqd_res);
+	host->opr_start_base = devm_ioremap_resource(hba->dev, opr_res);
 	if (!host->opr_start_base)
 		return -EINVAL;
 
-	host->opr_start_off = sqd_res->start - hba->hci_res->start;
+	host->opr_start_off = opr_res->start - hba->hci_res->start;
 
 	host->mcq_vs_base = devm_platform_ioremap_resource_byname(pdev, "mcq_vs");
 	if (!host->mcq_vs_base)

-- 
2.50.0


