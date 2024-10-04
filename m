Return-Path: <linux-arm-msm+bounces-33154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC2991156
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 23:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C8631C23750
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 21:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F33C1B4F29;
	Fri,  4 Oct 2024 21:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XleIe/8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8561C876D;
	Fri,  4 Oct 2024 21:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077075; cv=none; b=S1pWJHq8/EMu6VSgFpj4n+eJ/cPI0d/Q4Pqdrc7boCMBPh2WiVoUQc0O3XvY2jCx0OJGkdUIOhpFN1CN0y9gHHDIwHOllmygFAXPL9gPMp9S+ryXVUBKsYCVF6BGf4nymEY6hj+1AWeM7pKzmkOIg912SwXI7rgPKIoGFqGVv9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077075; c=relaxed/simple;
	bh=zoxv6uAiNsvDtClhZxDLHvjQsP4e+K2ToA4yyF9n5T4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NyVgonpNRcCXDsoup4S015oyfDeb+Apb/ca2QpFiMHW3k6TKaqSzm7Zp+WlWAFgiery5pfBAs8C99W5oVAo4DB2zIrOU8KPDalLjW3LMsflqYk6ayo63iLEf9q4uJTCoxmLoQw2WDqYAqQvSxRoNh26L6MsMJCYY907I0DhMVGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XleIe/8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494B5gdW000857;
	Fri, 4 Oct 2024 21:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MkSMFqmq9KpqjkV/7DIt+XPICfTTXaFosim8OCZPukg=; b=XleIe/8F23w5o8Gh
	shP1Rj6kqDZqZ46nX+tdsW/Y9hLOK+oD6ywI73uvpEmsXExVdwcMNxpxTc+Hobpl
	BU7q39DmJd5R5R5bPv1kkgBHI72rySwYVCY+yHeYKU2RugwSvhokXNrREjBIcF/t
	Sgq8yC83o4hf5ix/4Wk56Kzf1Bm4V96l6OgTlfFUJNhTEFLhOCPiO78xFyemTZTe
	P60YbPvJETiiVXJDsL3Ciyx8MdfZjR3Ohmaj9GS0/0AIh47Dqu4YW0l2YpEQYpX7
	SaWtKhdtD126K+43SxRB1AjHOweSIQmWCJxdzaZG5eZduhpXir3QDfOQwQ4Tnrf0
	fZfNEQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205f39aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 21:24:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494LOTTh028848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 21:24:29 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 14:24:25 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Shiraz Hashim
	<quic_shashim@quicinc.com>,
        Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH 3/6] remoteproc: qcom: Add helper function to support IOMMU devmem translation
Date: Sat, 5 Oct 2024 02:53:56 +0530
Message-ID: <20241004212359.2263502-4-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004212359.2263502-1-quic_mojha@quicinc.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rEJPNYJazC8d2KQD9hj8ViYb6dLxOmA-
X-Proofpoint-ORIG-GUID: rEJPNYJazC8d2KQD9hj8ViYb6dLxOmA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040148

From: Shiraz Hashim <quic_shashim@quicinc.com>

Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
translation set up for remote processors is managed by QHEE itself
however, for a case when these remote processors has to run under KVM
hypervisor, IOMMU translation need to setup from Linux remoteproc driver
before it is brought up.

Add qcom_devmem_info and qcom_devmem_table data structure and make a
common helper functions which caller can call if these translation need
to be taken care by the driver to enable iommu devmem access for
remoteproc processors.

Signed-off-by: Shiraz Hashim <quic_shashim@quicinc.com>
Co-developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/remoteproc/qcom_common.c | 96 ++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_common.h | 35 ++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 1c7887dc65b4..644920972b58 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -658,5 +658,101 @@ int qcom_map_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t me
 }
 EXPORT_SYMBOL_GPL(qcom_map_unmap_carveout);
 
+/**
+ * qcom_map_devmem() - Map the device memories needed by Remoteproc using IOMMU
+ *
+ * When Qualcomm EL2 hypervisor(QHEE) present, device memories needed for remoteproc
+ * processors is managed by it and Linux remoteproc drivers should not call
+ * this and its respective unmap function in such scenario. This function
+ * should only be called if remoteproc IOMMU translation need to be managed
+ * from Linux side.
+ *
+ * @rproc: rproc handle
+ * @devmem_table: list of devmem regions to map
+ * @use_sid: decision to append sid to iova
+ * @sid: SID value
+ */
+int qcom_map_devmem(struct rproc *rproc, struct qcom_devmem_table *devmem_table,
+		    bool use_sid, unsigned long sid)
+{
+	struct qcom_devmem_info *info;
+	unsigned long sid_def_val;
+	int ret;
+	int i;
+
+	if (!rproc->has_iommu)
+		return 0;
+
+	if (!rproc->domain)
+		return -EINVAL;
+
+	/* remoteproc may not have devmem data */
+	if (!devmem_table)
+		return 0;
+
+	if (use_sid && sid)
+		sid_def_val = sid & SID_MASK_DEFAULT;
+
+	info = &devmem_table->entries[0];
+	for (i = 0; i < devmem_table->num_entries; i++, info++) {
+		/*
+		 * Remote processor like ADSP supports upto 36 bit device
+		 * address space and some of its clients like fastrpc uses
+		 * upper 32-35 bits to keep lower 4 bits of its SID to use
+		 * larger address space. To keep this consistent across other
+		 * use cases add remoteproc SID configuration for firmware
+		 * to IOMMU for carveouts.
+		 */
+		if (use_sid)
+			info->da |= (sid_def_val << 32);
+
+		ret = iommu_map(rproc->domain, info->da, info->pa, info->len, info->flags, GFP_KERNEL);
+		if (ret) {
+			dev_err(&rproc->dev, "Unable to map devmem, ret: %d\n", ret);
+			if (use_sid)
+				info->da &= ~(SID_MASK_DEFAULT << 32);
+			goto undo_mapping;
+		}
+	}
+
+	return 0;
+
+undo_mapping:
+	for (i = i - 1; i >= 0; i--, info--) {
+		iommu_unmap(rproc->domain, info->da, info->len);
+		if (use_sid)
+			info->da &= ~(SID_MASK_DEFAULT << 32);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_map_devmem);
+
+/**
+ * qcom_unmap_devmem() -  unmap the device memories needed by Remoteproc using IOMMU
+ *
+ * @rproc:		rproc handle
+ * @devmem_table:	list of devmem regions to unmap
+ * @use_sid:		decision to append sid to iova
+ */
+void qcom_unmap_devmem(struct rproc *rproc, struct qcom_devmem_table *devmem_table, bool use_sid)
+{
+	struct qcom_devmem_info *info;
+	int i;
+
+	if (!rproc->has_iommu || !rproc->domain || !devmem_table)
+		return;
+
+	info = &devmem_table->entries[0];
+	for (i = 0; i < devmem_table->num_entries; i++, info++) {
+		iommu_unmap(rproc->domain, info->da, info->len);
+		if (use_sid)
+			info->da &= ~(SID_MASK_DEFAULT << 32);
+	}
+
+	return;
+}
+EXPORT_SYMBOL_GPL(qcom_unmap_devmem);
+
 MODULE_DESCRIPTION("Qualcomm Remoteproc helper driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index bbc41054e1ea..bbc684e1df01 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -41,6 +41,36 @@ struct qcom_rproc_pdm {
 	struct auxiliary_device *adev;
 };
 
+/**
+ * struct qcom_devmem_info - iommu devmem region
+ * @da: device address
+ * @pa: physical address
+ * @len: length (in bytes)
+ * @flags: iommu protection flags
+ *
+ * The resource entry carries the device address to which a physical address is
+ * to be mapped with required permissions in flag. The pa, len is expected to
+ * be a physically contiguous memory region.
+ */
+struct qcom_devmem_info {
+	u64 da;
+	u64 pa;
+	u32 len;
+	u32 flags;
+};
+
+/**
+ * struct qcom_devmem_table - iommu devmem entries
+ * @num_entries: number of devmem entries
+ * @entries: devmem entries
+ *
+ * The table that carries each devmem resource entry.
+ */
+struct qcom_devmem_table {
+	int num_entries;
+	struct qcom_devmem_info entries[0];
+};
+
 void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
 			void (*rproc_dumpfn_t)(struct rproc *rproc,
 				struct rproc_dump_segment *segment, void *dest, size_t offset,
@@ -65,6 +95,11 @@ int qcom_map_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t me
 void qcom_add_pdm_subdev(struct rproc *rproc, struct qcom_rproc_pdm *pdm);
 void qcom_remove_pdm_subdev(struct rproc *rproc, struct qcom_rproc_pdm *pdm);
 
+int qcom_map_devmem(struct rproc *rproc, struct qcom_devmem_table *table,
+		    bool use_sid, unsigned long sid);
+void qcom_unmap_devmem(struct rproc *rproc, struct qcom_devmem_table *table,
+		       bool use_sid);
+
 #if IS_ENABLED(CONFIG_QCOM_SYSMON)
 struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 					   const char *name,
-- 
2.34.1


