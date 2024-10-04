Return-Path: <linux-arm-msm+bounces-33157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 610C8991166
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 23:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7CB7B23974
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 21:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5491C1D8DF6;
	Fri,  4 Oct 2024 21:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hbggFQND"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC871B4F1E;
	Fri,  4 Oct 2024 21:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077087; cv=none; b=uHdZEldn8skaTu8NdVmqoK0Tq+CF0ImfMTAbYiKtzxOeLUhkZuwQ4EJ/P9HBqj/6L0LTOu2RfmgsfKsYPBpCavIQMmSAJXSJctWY/4D1ZQhIy+KA1KWccs2l2DtfW5D4e+Sd/+6wlxdz3sm2ShjfIEExz9ixI98MPp3RMhh3L4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077087; c=relaxed/simple;
	bh=TKSyFsbXLZGbesZuM+CcS5mtAUbRfjiYzoF16zmej50=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9QjyJkf1UOkBmZiv2OeR5yHTwmJv+gPidH3CJee+4ef7lJO9jtAsDk0OsvzirN5ioObsib+PzkeJfEDdo7mEBKBUTur4U6goQgjpqBQuqE1BsOSBA+bm+1WgToyDjEpv0HoERTKZTDFzjvdzWZBnLmVZDf5T70112ZgsiZDKjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hbggFQND; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494A588c026296;
	Fri, 4 Oct 2024 21:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9vcR8uw5rL4brrJsjI95droFBkl0TyoLuA4DEb0AksM=; b=hbggFQND8QLl2Ikt
	lkjgLXBXdl8TyBZR0azSKgoMdzEOMQuseUms6ckktifq9uFo2PA1I+LWlfiFv0sP
	lD5YyARYqfXcSYlte90UyN91xWPcDReB5b8iPQSoC9vEWrdgK4Gl6joFhp5hjWaf
	ARlMPZY8KID8I0027yZRYPpIvxGcwH5TqDZ7cQCnTbrBcnJzG5HZi7dHtX6r7xVh
	CbxuuHI5gJCzwNqeGm1l+oiKhqKGDStoIougbPJFZz8s3JqaMv2gfC+M/6ZZ5Yp9
	BJDVzlbx7iNlj3VXcYof1e7Medg3iuEP9Z0oU14iHYr9EIH2GF29bxrfhF5rWH/X
	CNLJBg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205jkakt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 21:24:42 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494LOf7t007310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 21:24:41 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 14:24:37 -0700
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
        Mukesh Ojha
	<quic_mojha@quicinc.com>
Subject: [PATCH 6/6] remoteproc: qcom: Enable map/unmap and SHM bridge support
Date: Sat, 5 Oct 2024 02:53:59 +0530
Message-ID: <20241004212359.2263502-7-quic_mojha@quicinc.com>
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
X-Proofpoint-GUID: O33KIk_m2Wxv9CUVPkpsby8As9vkmR_E
X-Proofpoint-ORIG-GUID: O33KIk_m2Wxv9CUVPkpsby8As9vkmR_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040148

For Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
translation for remote processors is managed by QHEE and if the same SoC
run under KVM, remoteproc carveout and devmem region should be IOMMU
mapped from Linux PAS driver before remoteproc is brought up and
unmapped once it is tear down and apart from this, SHM bridge also need
to set up to enable memory protection on both remoteproc meta data
memory as well as for the carveout region.

Enable the support required to run Qualcomm remoteprocs on non-QHEE
hypervisors.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ac339145e072..13bd13f1b989 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -122,6 +122,7 @@ struct qcom_adsp {
 
 	struct qcom_devmem_table *devmem;
 	struct qcom_tzmem_area *tzmem;
+	unsigned long sid;
 };
 
 static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
@@ -310,9 +311,21 @@ static int adsp_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
+	ret = qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, true, true, adsp->sid);
+	if (ret) {
+		dev_err(adsp->dev, "iommu mapping failed, ret: %d\n", ret);
+		goto disable_irqs;
+	}
+
+	ret = qcom_map_devmem(rproc, adsp->devmem, true, adsp->sid);
+	if (ret) {
+		dev_err(adsp->dev, "devmem iommu mapping failed, ret: %d\n", ret);
+		goto unmap_carveout;
+	}
+
 	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 	if (ret < 0)
-		goto disable_irqs;
+		goto unmap_devmem;
 
 	ret = clk_prepare_enable(adsp->xo);
 	if (ret)
@@ -400,6 +413,10 @@ static int adsp_start(struct rproc *rproc)
 	clk_disable_unprepare(adsp->xo);
 disable_proxy_pds:
 	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+unmap_devmem:
+	qcom_unmap_devmem(rproc, adsp->devmem, adsp->sid);
+unmap_carveout:
+	qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, false, true, adsp->sid);
 disable_irqs:
 	qcom_q6v5_unprepare(&adsp->q6v5);
 
@@ -445,6 +462,9 @@ static int adsp_stop(struct rproc *rproc)
 			dev_err(adsp->dev, "failed to shutdown dtb: %d\n", ret);
 	}
 
+	qcom_unmap_devmem(rproc, adsp->devmem, adsp->sid);
+	qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, false, true, adsp->sid);
+
 	handover = qcom_q6v5_unprepare(&adsp->q6v5);
 	if (handover)
 		qcom_pas_handover(&adsp->q6v5);
@@ -844,6 +864,25 @@ static int adsp_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, adsp);
 
+	if (of_property_present(pdev->dev.of_node, "iommus")) {
+		struct of_phandle_args args;
+
+		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus", "#iommu-cells", 0, &args);
+		if (ret < 0)
+			return ret;
+
+		rproc->has_iommu = true;
+		adsp->sid = args.args[0];
+		of_node_put(args.np);
+		ret = adsp_devmem_init(adsp);
+		if (ret)
+			return ret;
+
+		adsp->pas_metadata.shm_bridge_needed = true;
+	} else {
+		rproc->has_iommu = false;
+	}
+
 	ret = device_init_wakeup(adsp->dev, true);
 	if (ret)
 		goto free_rproc;
-- 
2.34.1


