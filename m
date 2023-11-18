Return-Path: <linux-arm-msm+bounces-1046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 111067EFDB7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 05:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9357D1F23639
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 04:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7770CD287;
	Sat, 18 Nov 2023 04:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HsnVQCEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A3110E5;
	Fri, 17 Nov 2023 20:28:06 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AI4NX6e008049;
	Sat, 18 Nov 2023 04:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=PPleGcYSH8RxRSSe6efKgk8zLZMVt7yWRx5+jtySmZc=;
 b=HsnVQCEt3DvpQgzuDDgvF6z/lsBR1cH3EFJ4KiOQCmaAV4iEgFUHATn+4c74gz9ABpiC
 MWn9MfK/Rb/WjUQZrLBXGgRCrNQbWxyH9+waYCNKuEZM2Hur+bC2yT+K1vOZSNRD13H1
 9sTgHjCG5wlgvvFXQShbu+EdW/hca4IYGYg0uiCzuGGvcUViGjy3w6P/q15K3VNj+TjS
 wwb53cuY0lv+F3vV5IKNv0AcZBrhQOXbgQ8Kif8oNFYOcJq9gjoWKpPlblmSahUrRLF5
 YiibRiEbvvE3uDx+mpSK93SgENdDnQBhQB9hh2vDTaRFYC+zgUM7UJJf0ZBxnMkBgrnb 1Q== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uenne81ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Nov 2023 04:27:46 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AI4RjkR032732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Nov 2023 04:27:45 GMT
Received: from hu-c-gdjako-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 17 Nov 2023 20:27:44 -0800
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>
CC: <devicetree@vger.kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_cgoldswo@quicinc.com>,
        <quic_sukadev@quicinc.com>, <quic_pdaly@quicinc.com>,
        <quic_sudaraja@quicinc.com>, <djakov@kernel.org>
Subject: [PATCH v2 5/6] iommu/arm-smmu-qcom: Use a custom context fault handler for sdm845
Date: Fri, 17 Nov 2023 20:27:29 -0800
Message-ID: <20231118042730.2799-6-quic_c_gdjako@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231118042730.2799-1-quic_c_gdjako@quicinc.com>
References: <20231118042730.2799-1-quic_c_gdjako@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AH0b62L-0u3yKxIL6HuC6DCQtzxUCCi4
X-Proofpoint-GUID: AH0b62L-0u3yKxIL6HuC6DCQtzxUCCi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-18_02,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311180032

The sdm845 platform now supports TBUs, so let's get additional debug
info from the TBUs when a context fault occurs. Implement a custom
context fault handler that does both software + hardware page table
walks and TLB Invalidate All.

Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
---
 .../iommu/arm/arm-smmu/arm-smmu-qcom-tbu.c    | 138 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    |   4 +
 2 files changed, 142 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-tbu.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-tbu.c
index 2ab60f0a4ec2..a4c7db53067c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-tbu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-tbu.c
@@ -52,6 +52,11 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 	return container_of(smmu, struct qcom_smmu, smmu);
 }
 
+static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
+{
+	return container_of(dom, struct arm_smmu_domain, domain);
+}
+
 static struct qsmmuv500_tbu *qsmmuv500_find_tbu(struct qcom_smmu *qsmmu, u32 sid)
 {
 	struct qsmmuv500_tbu *tbu = NULL;
@@ -301,6 +306,139 @@ static phys_addr_t qsmmuv500_iova_to_phys(struct arm_smmu_domain *smmu_domain,
 	return phys;
 }
 
+static phys_addr_t qcom_smmu_iova_to_phys_hard(struct iommu_domain *domain, dma_addr_t iova)
+{
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	int idx = smmu_domain->cfg.cbndx;
+	u32 frsynra;
+	u16 sid;
+
+	frsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
+	sid = FIELD_GET(ARM_SMMU_CBFRSYNRA_SID, frsynra);
+
+	return qsmmuv500_iova_to_phys(smmu_domain, iova, sid);
+}
+
+static phys_addr_t qcom_smmu_verify_fault(struct iommu_domain *domain, dma_addr_t iova, u32 fsr)
+{
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct io_pgtable *iop = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	phys_addr_t phys_post_tlbiall;
+	phys_addr_t phys;
+
+	phys = qcom_smmu_iova_to_phys_hard(domain, iova);
+	io_pgtable_tlb_flush_all(iop);
+	phys_post_tlbiall = qcom_smmu_iova_to_phys_hard(domain, iova);
+
+	if (phys != phys_post_tlbiall) {
+		dev_err(smmu->dev,
+			"ATOS results differed across TLBIALL... (before: %pa after: %pa)\n",
+			&phys, &phys_post_tlbiall);
+	}
+
+	return (phys == 0 ? phys_post_tlbiall : phys);
+}
+
+irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
+{
+	struct iommu_domain *domain = dev;
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	u32 fsr, fsynr, cbfrsynra, resume = 0;
+	int idx = smmu_domain->cfg.cbndx;
+	phys_addr_t phys_soft;
+	unsigned long iova;
+	int ret, tmp;
+
+	static DEFINE_RATELIMIT_STATE(_rs,
+				      DEFAULT_RATELIMIT_INTERVAL,
+				      DEFAULT_RATELIMIT_BURST);
+
+	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
+	if (!(fsr & ARM_SMMU_FSR_FAULT))
+		return IRQ_NONE;
+
+	fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
+	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
+	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
+
+	phys_soft = ops->iova_to_phys(ops, iova);
+
+	tmp = report_iommu_fault(domain, NULL, iova,
+				 fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+	if (!tmp || tmp == -EBUSY) {
+		dev_dbg(smmu->dev,
+			"Context fault handled by client: iova=0x%08lx, fsr=0x%x, fsynr=0x%x, cb=%d\n",
+			iova, fsr, fsynr, idx);
+		dev_dbg(smmu->dev, "soft iova-to-phys=%pa\n", &phys_soft);
+		ret = IRQ_HANDLED;
+		resume = ARM_SMMU_RESUME_TERMINATE;
+	} else {
+		phys_addr_t phys_atos = qcom_smmu_verify_fault(domain, iova, fsr);
+
+		if (__ratelimit(&_rs)) {
+			dev_err(smmu->dev,
+				"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
+				fsr, iova, fsynr, cbfrsynra, idx);
+			dev_err(smmu->dev,
+				"FSR    = %08x [%s%s%s%s%s%s%s%s%s], SID=0x%x\n",
+				fsr,
+				(fsr & 0x02) ? "TF " : "",
+				(fsr & 0x04) ? "AFF " : "",
+				(fsr & 0x08) ? "PF " : "",
+				(fsr & 0x10) ? "EF " : "",
+				(fsr & 0x20) ? "TLBMCF " : "",
+				(fsr & 0x40) ? "TLBLKF " : "",
+				(fsr & 0x80) ? "MHF " : "",
+				(fsr & 0x40000000) ? "SS " : "",
+				(fsr & 0x80000000) ? "MULTI " : "",
+				cbfrsynra);
+
+			dev_err(smmu->dev,
+				"soft iova-to-phys=%pa\n", &phys_soft);
+			if (!phys_soft)
+				dev_err(smmu->dev,
+					"SOFTWARE TABLE WALK FAILED! Looks like %s accessed an unmapped address!\n",
+					dev_name(smmu->dev));
+			if (phys_atos)
+				dev_err(smmu->dev, "hard iova-to-phys (ATOS)=%pa\n",
+					&phys_atos);
+			else
+				dev_err(smmu->dev, "hard iova-to-phys (ATOS) failed\n");
+		}
+		ret = IRQ_NONE;
+		resume = ARM_SMMU_RESUME_TERMINATE;
+	}
+
+	/*
+	 * If the client returns -EBUSY, do not clear FSR and do not RESUME
+	 * if stalled. This is required to keep the IOMMU client stalled on
+	 * the outstanding fault. This gives the client a chance to take any
+	 * debug action and then terminate the stalled transaction.
+	 * So, the sequence in case of stall on fault should be:
+	 * 1) Do not clear FSR or write to RESUME here
+	 * 2) Client takes any debug action
+	 * 3) Client terminates the stalled transaction and resumes the IOMMU
+	 * 4) Client clears FSR. The FSR should only be cleared after 3) and
+	 *    not before so that the fault remains outstanding. This ensures
+	 *    SCTLR.HUPCF has the desired effect if subsequent transactions also
+	 *    need to be terminated.
+	 */
+	if (tmp != -EBUSY) {
+		/* Clear the faulting FSR */
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
+
+		/* Retry or terminate any stalled transactions */
+		if (fsr & ARM_SMMU_FSR_SS)
+			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME, resume);
+	}
+
+	return ret;
+}
+
 static int qsmmuv500_tbu_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 1622abace484..1af3d4a7fe1d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -421,6 +421,10 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
 	.reset = qcom_sdm845_smmu500_reset,
 	.write_s2cr = qcom_smmu_write_s2cr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+#ifdef CONFIG_ARM_SMMU_QCOM_TBU
+	.context_fault = qcom_smmu_context_fault,
+	.context_fault_needs_threaded_irq = true,
+#endif
 };
 
 static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {

