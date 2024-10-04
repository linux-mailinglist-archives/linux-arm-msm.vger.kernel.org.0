Return-Path: <linux-arm-msm+bounces-33155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E975999115D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 23:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54796B240C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 21:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61EB1D89F7;
	Fri,  4 Oct 2024 21:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hX1XYQ8v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FCD1D89EE;
	Fri,  4 Oct 2024 21:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077078; cv=none; b=hpw1qG9Jo13/A+xPFN+dT7jP8WhjsmYMP0xyZc2sBKpyD1X4BEdmcXhXGawCWxQ6mpgHUUK2R2EPY6wlOyzO9EKbS8hRW0lsJg4ey5K9c5YaueBE2pdYpNU8zKfs3lhXbwZZucFvntOhH6sa1UNwT6VmvHv6OgoBeNrb+iO5KmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077078; c=relaxed/simple;
	bh=Ag7eWOnfsome4cLzCawlMX/vVVMLOEIP63UtPxZ4AXk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n1qcNPW1JkZuHY+ygACWjkwV7W5zwD7FpWKOGAX1upXcSh08T01W6lqD+4BJnIb5Y+9Kgb3sbRT54GRms12wPXpelFszkQ54rqvwJwQcfP6wrPTvKO/sNq2O6VrzJd0Ae/PSTQsmYW93pQ0pSZglI6ueID0d9SiUedmRr4aI7iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hX1XYQ8v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494A4g2L031989;
	Fri, 4 Oct 2024 21:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ueMGGG77ORz1rgpGmJ3mMELP2opMMlzqDh7mhU5mBoc=; b=hX1XYQ8vmR55OoPP
	sMHOOwVUMrD8pUQE7zUvtEzUspIMIhgRln44XZlF9AstZc5C2PxF1p1SkDGQWg1K
	0+wzL+wWE4OKTUNOYS59pXjlemgzQ//cdQ3lPoiPsp96MVdvfMB06A69mWRIQGd2
	gMZVjkOg7/AQi396iuO03ynXCAw5UbsSjKvRKm+AahYIaN6ZhocrK7amcq7yUVwf
	lyHXqFLW3isGfDLqSi35r97jhHnhe1FXbqTuSm6j3i24wIVJABM/tCEybCNxd4hr
	z6tVDLpaYBFz6R5+gjVaYOdxIHeK8udaBzwlu6JLiHeEjbMSldvJWQ4UdRoMkalk
	l6MNXg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205f39ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 21:24:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494LOXXT005498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 21:24:33 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 14:24:29 -0700
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
Subject: [PATCH 4/6] remoteproc: qcom: Add support to parse qcom,devmem property
Date: Sat, 5 Oct 2024 02:53:57 +0530
Message-ID: <20241004212359.2263502-5-quic_mojha@quicinc.com>
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
X-Proofpoint-GUID: X-U1aWEMgeaLRZT-cdi_3nhg9i6jfHUs
X-Proofpoint-ORIG-GUID: X-U1aWEMgeaLRZT-cdi_3nhg9i6jfHUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040148

From: Shiraz Hashim <quic_shashim@quicinc.com>

Qualcomm remote processors firmware does not contain resource table data
where devmem setting information should actually be present and for its
SoC running with Qualcomm EL2 hypervisor(QHEE), IOMMU translation for
remoteproc is managed by QHEE and it has all the IOMMU resource
information available to it to apply the settings however, when the same
SoCs run with KVM hypervisor these translation needs to setup by
remoteproc PAS driver and required setting information is being overlaid
from boot firmware to remoteproc device tree node.

Add helper function which parses qcom,devmem information.

Signed-off-by: Shiraz Hashim <quic_shashim@quicinc.com>
Co-developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 55 ++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4..bdb071ab5938 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -34,6 +34,7 @@
 #define ADSP_DECRYPT_SHUTDOWN_DELAY_MS	100
 
 #define MAX_ASSIGN_COUNT 3
+#define DEVMEM_ENTRY_SIZE 4
 
 struct adsp_data {
 	int crash_reason_smem;
@@ -117,6 +118,8 @@ struct qcom_adsp {
 
 	struct qcom_scm_pas_metadata pas_metadata;
 	struct qcom_scm_pas_metadata dtb_pas_metadata;
+
+	struct qcom_devmem_table *devmem;
 };
 
 static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
@@ -683,6 +686,58 @@ static void adsp_unassign_memory_region(struct qcom_adsp *adsp)
 	}
 }
 
+static int adsp_devmem_init(struct qcom_adsp *adsp)
+{
+	unsigned int entry_size = DEVMEM_ENTRY_SIZE;
+	struct qcom_devmem_table *devmem_table;
+	struct rproc *rproc = adsp->rproc;
+	struct device *dev = adsp->dev;
+	struct qcom_devmem_info *info;
+	char *pname = "qcom,devmem";
+	size_t table_size;
+	int num_entries;
+	u32 i;
+
+	if (!rproc->has_iommu)
+		return 0;
+
+	/* devmem property is a set of n-tuple */
+	num_entries = of_property_count_u32_elems(dev->of_node, pname);
+	if (num_entries < 0) {
+		dev_err(adsp->dev, "No '%s' property present\n", pname);
+		return num_entries;
+	}
+
+	if (!num_entries || (num_entries % entry_size)) {
+		dev_err(adsp->dev, "All '%s' list entries need %d vals\n", pname,
+			entry_size);
+		return -EINVAL;
+	}
+
+	num_entries /= entry_size;
+	table_size = sizeof(*devmem_table) + sizeof(*info) * num_entries;
+	devmem_table = devm_kzalloc(dev, table_size, GFP_KERNEL);
+	if (!devmem_table)
+		return -ENOMEM;
+
+	devmem_table->num_entries = num_entries;
+	info = &devmem_table->entries[0];
+	for (i = 0; i < num_entries; i++, info++) {
+		of_property_read_u32_index(dev->of_node, pname,
+					   i * entry_size, (u32 *)&info->da);
+		of_property_read_u32_index(dev->of_node, pname,
+					   i * entry_size + 1, (u32 *)&info->pa);
+		of_property_read_u32_index(dev->of_node, pname,
+					   i * entry_size + 2, &info->len);
+		of_property_read_u32_index(dev->of_node, pname,
+					   i * entry_size + 3, &info->flags);
+	}
+
+	adsp->devmem = devmem_table;
+
+	return 0;
+}
+
 static int adsp_probe(struct platform_device *pdev)
 {
 	const struct adsp_data *desc;
-- 
2.34.1


