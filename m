Return-Path: <linux-arm-msm+bounces-32115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7D897D97C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 20:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02205B20432
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 18:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB6917C7BD;
	Fri, 20 Sep 2024 18:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SqT9RRUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA84143C49;
	Fri, 20 Sep 2024 18:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726855318; cv=none; b=WLLuKKSNB8cPnjLzvpvmQumSGc+KEF62E5YHObvtBsykTS21pKYEou8bdAC5Dn9vgS0hvjT6lgKNAuisuqsGjECLJ7N/plUz7IuJDvhHG51jlT4p0kUDoTpd23caf81dHS59/btYQcMGY+nZaAZjvfOVf3EpnCjCd18tFGctMLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726855318; c=relaxed/simple;
	bh=6W+CdwnzCI9NJoMF0y+A+2VlZvAeHLpKpEfJdi0Rr5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=d1Szh2CZLSfmP/Qe0mnf2sCWCb873L6yZrq8HsqEBhjsngRCux4+xoVXXcZ+GCpNNlccOjoMYHHShAvJ3birOBwA1zYYoOGFuuv4cxXm0R3EpNSnUz8g4KJ/HeYdAycXlKMtpvu5GwJ4GQsALc6H1v4cbIF33AlzYk82XPf3JyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SqT9RRUt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K7w7Xn007280;
	Fri, 20 Sep 2024 18:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BnmWo3uauhP14rQ9Q9kY2G
	Ew/zzZwdaoNnruHWyG220=; b=SqT9RRUtwrsvSUZyU8BoJfjgvF0FX/oqQmq1nv
	y/+pvY9KM/FRHJ8GZXVqFB9mk74akhMDyXDKUjRLgLGsJLwnLtHfCbXFqKVDxvtR
	CvF8o1lJcN0e5zTEt7QaEfv+BNmvGuG4MSCS/ALnVcSt4bEcWG3GZQ6A4PM8rzPa
	muDJ74N/YYHMPQYd5UREEcftBUO2SWw1bp4F/yV9S5BeLUlh6VdwGXzy3vK3ow8x
	70xBsM4+HTHkZrRLJXcQeAzXdg1d2OWuMduhedMuRrbzZPc7ufYr3NA11ohTmRfW
	L4K0Um67tCG+J+4paC65IRmgMw5xMtf+LIurV69F1JAz0zOg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jf2944-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 18:01:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KI1hgA001546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 18:01:43 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 11:01:43 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Fri, 20 Sep 2024 11:01:40 -0700
Subject: [PATCH] firmware: qcom: scm: Allow devicetree-less probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240920-scm-pdev-v1-1-b76d90e06af7@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAIO47WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0Nz3eLkXN2ClNQy3aRki5QkC9O0xBQDUyWg8oKi1LTMCrBR0bG1tQA
 htW35WgAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Rudraksha Gupta <guptarud@gmail.com>,
        "Linux regression tracking (Thorsten
 Leemhuis)" <regressions@leemhuis.info>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bartosz
 Golaszewski" <brgl@bgdev.pl>,
        Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SuyJGb0-EA3JBaqg5B1h842TJZH2irpl
X-Proofpoint-GUID: SuyJGb0-EA3JBaqg5B1h842TJZH2irpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409200131

Some devicetrees representing Qualcomm Technologies, Inc. SoCs are
missing the SCM node. Users of the SCM device assume the device is
present and the driver also assumes it has probed. This can lead to
unanticipated crashes when there isn't an SCM device. All Qualcomm
Technologies, Inc. SoCs use SCM to communicate with firmware, so create
the platform device if it's not present in the devicetree.

Tested that SCM node still probes on:
 - sm8650-qrd with the SCM DT node still present
 - sm845-mtp with the SCM DT node still present
 - sm845-mtp with the node removed

Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
Reported-by: Rudraksha Gupta <guptarud@gmail.com>
Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
Link: https://lore.kernel.org/all/CAA8EJpqSKbKJ=y0LAigGdj7_uk+5mezDgnzV5XEzwbxRJgpN1w@mail.gmail.com/
Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 75 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..842ba490cd37 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1954,10 +1954,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	init_completion(&scm->waitq_comp);
 	mutex_init(&scm->scm_bw_lock);
 
-	scm->path = devm_of_icc_get(&pdev->dev, NULL);
-	if (IS_ERR(scm->path))
-		return dev_err_probe(&pdev->dev, PTR_ERR(scm->path),
-				     "failed to acquire interconnect path\n");
+	if (pdev->dev.of_node) {
+		scm->path = devm_of_icc_get(&pdev->dev, NULL);
+		if (IS_ERR(scm->path))
+			return dev_err_probe(&pdev->dev, PTR_ERR(scm->path),
+					"failed to acquire interconnect path\n");
+	}
 
 	scm->core_clk = devm_clk_get_optional(&pdev->dev, "core");
 	if (IS_ERR(scm->core_clk))
@@ -2012,10 +2014,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled") || !download_mode)
 		qcom_scm_disable_sdi();
 
-	ret = of_reserved_mem_device_init(__scm->dev);
-	if (ret && ret != -ENODEV)
-		return dev_err_probe(__scm->dev, ret,
-				     "Failed to setup the reserved memory region for TZ mem\n");
+	if (pdev->dev.of_node) {
+		ret = of_reserved_mem_device_init(__scm->dev);
+		if (ret && ret != -ENODEV)
+			return dev_err_probe(__scm->dev, ret,
+					"Failed to setup the reserved memory region for TZ mem\n");
+	}
 
 	ret = qcom_tzmem_enable(__scm->dev);
 	if (ret)
@@ -2068,6 +2072,11 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_scm_dt_match);
 
+static const struct platform_device_id qcom_scm_id_table[] = {
+	{ .name = "qcom-scm" },
+	{}
+};
+
 static struct platform_driver qcom_scm_driver = {
 	.driver = {
 		.name	= "qcom_scm",
@@ -2076,11 +2085,59 @@ static struct platform_driver qcom_scm_driver = {
 	},
 	.probe = qcom_scm_probe,
 	.shutdown = qcom_scm_shutdown,
+	.id_table = qcom_scm_id_table,
 };
 
+static bool is_qcom_machine(void)
+{
+	struct device_node *np __free(device_node) = NULL;
+	struct property *prop;
+	const char *name;
+
+	np = of_find_node_by_path("/");
+	if (!np)
+		return false;
+
+	of_property_for_each_string(np, "compatible", prop, name)
+		if (!strncmp("qcom,", name, 5))
+			return true;
+
+	return false;
+}
+
 static int __init qcom_scm_init(void)
 {
-	return platform_driver_register(&qcom_scm_driver);
+	struct device_node *np __free(device_node) = NULL;
+	struct platform_device *pdev;
+	int ret;
+
+	ret = platform_driver_register(&qcom_scm_driver);
+	if (ret)
+		return ret;
+
+	/* Some devicetrees representing Qualcomm Technologies, Inc. SoCs are
+	 * missing the SCM node. Find out if we don't have a SCM node *and*
+	 * we are a Qualcomm-compatible SoC. If yes, then create a platform
+	 * device for the SCM driver. Assume scanning the root compatible for
+	 * "qcom," vendor prefix will be faster than searching for the
+	 * SCM DT node.
+	 */
+	if (!is_qcom_machine())
+		return 0;
+
+	np = of_find_matching_node_and_match(NULL, qcom_scm_dt_match, NULL);
+	if (np)
+		return 0;
+
+	pdev = platform_device_alloc(qcom_scm_id_table[0].name, PLATFORM_DEVID_NONE);
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = platform_device_add(pdev);
+	if (ret)
+		platform_device_put(pdev);
+
+	return ret;
 }
 subsys_initcall(qcom_scm_init);
 

---
base-commit: 2adcf3941db724e1750da7094c34431d9b6b7fcb
change-id: 20240917-scm-pdev-bc8db85fad05

Best regards,
-- 
Elliot Berman <quic_eberman@quicinc.com>


