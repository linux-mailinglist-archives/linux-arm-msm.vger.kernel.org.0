Return-Path: <linux-arm-msm+bounces-25375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8473928862
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 14:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E41FB2126E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 12:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2DE14A0AA;
	Fri,  5 Jul 2024 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sj4uwBKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E534C14A09C;
	Fri,  5 Jul 2024 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720181218; cv=none; b=eVj0bNiKAFZEQbm6ezta30HCGvT61/QYW54osKz+hPX6hjiIkwejCFdZe3Nqq22juzsZm5yi31czX4OHu1lJU5ba1g8pes4noOm2aDGrTSrvfzpaqH2//0Y83YFLIwf14YE+lUWEtHAfJZ8EQzRpG1uMCo+6N8xGowTV78l9l0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720181218; c=relaxed/simple;
	bh=7iBAjExAUAIYqd8nG01Zv+lqqXRulBi/l0Q0xw3pJH8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WZB6xW4Du2kw/yJ1EmKwOiKqggv9rN34uSvCdHEPDsPKUU7MCqQHdmhUKEtkz4txuDuzTZGH0jXgjYgSrMjTyJP4AoNV5uFMTHYKAzq2n86IaCO80BcP6DXg3s+qHFJQmDVj3j6ta5LeBN5GWR0k8B+KcuyGxEfWfcnN3eHt2Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sj4uwBKg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 465A5CnV001485;
	Fri, 5 Jul 2024 12:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d7vbZXuZP+HYltVaOitCay
	fQt73hu6DkMIV7yXlUA3g=; b=Sj4uwBKg2JgfKOyhxWs/tvw6dAWSmrn9/1mSHQ
	1tG9Z/w+/lw0Q3jXM8OBZ4hiQ8EH+EK2ohAnrop7oJIm0j54jkIXwAErbmfKwTV7
	5sZ6DzhgnNSZpRCTF06ROG8ebpIrjInNl558s4bfwI+KSLainubdBMhWnm5covQW
	iygJtL2kyYNkk6ZUPXTswbPXk1oqkxp+16KYEZW5z/8OUueo5sD+IbFJRoLZv1kh
	7HKfRNNWjsvs6yv3gCU5/w1gp1vcHMilfdHtAyKIlkeQf2CHWh5DB9lMUrI3uFoj
	7Rkvn3vOJjPQNBpGx7hnpYT5se97FAMMUGNjEZ6AwcS5qmCQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yr9egcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 12:06:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 465C6qCu023304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 12:06:52 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 05:06:50 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Mukesh
 Ojha" <quic_mojha@quicinc.com>
Subject: [PATCH ] firmware: qcom: scm: Disable SDI and write no dump to download mode register
Date: Fri, 5 Jul 2024 17:36:23 +0530
Message-ID: <20240705120623.1424931-1-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FoIOjUBAd_hI0xKFA-yxaucyMkKQTjdH
X-Proofpoint-ORIG-GUID: FoIOjUBAd_hI0xKFA-yxaucyMkKQTjdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_08,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050090

SDI is enabled for most of the Qualcomm SoCs and as per commit
ff4aa3bc9825 ("firmware: qcom_scm: disable SDI if required")
it was recommended to disable SDI by mentioning it in device tree

However, for some cases download mode tcsr register already configured
from boot firmware to collect dumps and in such cases if download
mode is set to zero(nodump mode) from kernel side and SDI is disabled
via means of mentioning it in device tree we could end up with dump
collection.

To disable complete dump collection mode, SDI and dload mode register
need to be set no dump mode.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 00c379a3cceb..2e10f75a9cfd 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1954,14 +1954,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	 * will cause the boot stages to enter download mode, unless
 	 * disabled below by a clean shutdown/reboot.
 	 */
-	if (download_mode)
-		qcom_scm_set_download_mode(true);
-
+	qcom_scm_set_download_mode(download_mode ? true : false);
 
 	/*
 	 * Disable SDI if indicated by DT that it is enabled by default.
 	 */
-	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled"))
+	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled") || !download_mode)
 		qcom_scm_disable_sdi();
 
 	ret = of_reserved_mem_device_init(__scm->dev);
-- 
2.34.1


