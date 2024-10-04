Return-Path: <linux-arm-msm+bounces-33153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DDF991154
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 23:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0F871F21437
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 21:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9F71B4F37;
	Fri,  4 Oct 2024 21:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M8MP0w/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4C01B4F27;
	Fri,  4 Oct 2024 21:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077071; cv=none; b=mPyIBfiu83aBWVj+bFMhTtWzlbz1Pu2HdtaSNYxBdlOjiNF6qKqn1OKaru3UiENeAakUo3qf2s1NPXSkhZhHyVd84IF4dp9ZqzsBdR3D7rZfFa2pHk1kgU6sZ7eJC0GN0nfguMw4wYssl1hqNgKvDnh1ZilFUozgQouxRPku3Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077071; c=relaxed/simple;
	bh=q4tBnME3ZmLBM3VYDPYDhc3fIIrmtNxfDbsJFAyNXH0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IatPuDho85oxaEzi8s/ODfXMo+hMcfGcgQhNgoohUBFrES2UWzpnaiqIdF0xpjnPWq3nF/hfKfqQT8vd9/DOiHhIq4Xt3rzOvvyVwWQfC+aFcfHOjJVZqhb4CP9s1+/1X3ISMW3zO0s5FXfiHOXM6lbefftqqP2wpBVfNexFvNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M8MP0w/5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AWxQu025555;
	Fri, 4 Oct 2024 21:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vmQHeoecDXKPRCR8Ms1Xnd97amwcuyNu8dj/p87ZFnI=; b=M8MP0w/5CVmvAfVb
	Yj4KNlYSzljiXmu/z4t18uPEd3LbaWxgsGMO3RcvYL0dWNyv8nenr5DEps/RXFYC
	/IjrukL4ZANMb54O+K3d+BvFFxYhaRodFBWBrKwb6Qfa28hgZjTzBrbXAAMyrOJf
	C9ejs/0UBJYpOe8qBzrLOZN4HTuI+3KHvcemJIsopFtdX+KVzPiAhkbCPAxGZDpq
	O1+kiqkgiu3lJixbUmaX6JNIz30iBMHKIgiMqF947J81kh5kU3u726FfO3K4K8ia
	xUFOh8Iq7udD1MpkFbhtV6IFhkPC5Oml/vgFWpcP0ebEE312Gb6YDbPBmLfqjNsN
	nZ4KyA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205kk9rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 21:24:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494LOP1F028680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 21:24:25 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 14:24:21 -0700
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
        Komal Bajaj
	<quic_kbajaj@quicinc.com>,
        Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH 2/6] remoteproc: qcom: Add iommu map_unmap helper function
Date: Sat, 5 Oct 2024 02:53:55 +0530
Message-ID: <20241004212359.2263502-3-quic_mojha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: fq1HxFWB7AG4tAYwhcz0oTNOsr-ivfCX
X-Proofpoint-GUID: fq1HxFWB7AG4tAYwhcz0oTNOsr-ivfCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040148

From: Komal Bajaj <quic_kbajaj@quicinc.com>

Qualcomm remote processor's IOMMU translation running on Linux KVM host
should be managed by PAS driver and to do this PAS driver need to do map
and unmap remoteproc carveout memory region. Similar map and unmap
private functions for the similar purpose are already available in
qcom_q6v5_adsp.c. So, in motivation to reuse code, introduce common
exported functions like qcom_map_unmap_carveout() such that it can be
used by both qcom_q6v5_adsp and qcom_q6v5_pas.

Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
Co-Developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/remoteproc/qcom_common.c | 52 ++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_common.h |  3 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 8c8688f99f0a..1c7887dc65b4 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/firmware.h>
+#include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
@@ -35,6 +36,8 @@
 #define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
 #define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
 
+#define SID_MASK_DEFAULT	0xfUL
+
 /**
  * struct minidump_region - Minidump region
  * @name		: Name of the region to be dumped
@@ -606,5 +609,54 @@ void qcom_remove_pdm_subdev(struct rproc *rproc, struct qcom_rproc_pdm *pdm)
 }
 EXPORT_SYMBOL_GPL(qcom_remove_pdm_subdev);
 
+/**
+ * qcom_map_unmap_carveout() - iommu map and unmap carveout region
+ *
+ * @rproc:	rproc handle
+ * @mem_phys:	starting physical address of carveout region
+ * @mem_size:	size of carveout region
+ * @map:	if true, map otherwise, unmap
+ * @use_sid:	decision to append sid to iova
+ * @sid:	SID value
+ */
+int qcom_map_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t mem_size,
+			    bool map, bool use_sid, unsigned long sid)
+{
+	unsigned long iova = mem_phys;
+	unsigned long sid_def_val;
+	int ret;
+
+	if (!rproc->has_iommu)
+		return 0;
+
+	if (!rproc->domain)
+		return -EINVAL;
+
+	/*
+	 * Remote processor like ADSP supports upto 36 bit device
+	 * address space and some of its clients like fastrpc uses
+	 * upper 32-35 bits to keep lower 4 bits of its SID to use
+	 * larger address space. To keep this consistent across other
+	 * use cases add remoteproc SID configuration for firmware
+	 * to IOMMU for carveouts.
+	 */
+	if (use_sid && sid) {
+		sid_def_val = sid & SID_MASK_DEFAULT;
+		iova |= (sid_def_val << 32);
+	}
+
+	if (map)
+		ret = iommu_map(rproc->domain, iova, mem_phys, mem_size, IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
+	else
+		ret = iommu_unmap(rproc->domain, iova, mem_size);
+
+	if (ret)
+		dev_err(&rproc->dev, "Unable to %s IOVA Memory, ret: %d\n",
+			map ? "map" : "unmap", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_map_unmap_carveout);
+
 MODULE_DESCRIPTION("Qualcomm Remoteproc helper driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index b07fbaa091a0..bbc41054e1ea 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -59,6 +59,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
 			 const char *ssr_name);
 void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr);
 
+int qcom_map_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t mem_size,
+			    bool map, bool use_sid, unsigned long sid);
+
 void qcom_add_pdm_subdev(struct rproc *rproc, struct qcom_rproc_pdm *pdm);
 void qcom_remove_pdm_subdev(struct rproc *rproc, struct qcom_rproc_pdm *pdm);
 
-- 
2.34.1


