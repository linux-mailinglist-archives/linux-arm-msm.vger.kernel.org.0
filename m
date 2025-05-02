Return-Path: <linux-arm-msm+bounces-56567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54999AA787A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A658F3B2DDA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C10267387;
	Fri,  2 May 2025 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Uo0q3fFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2567E256C76;
	Fri,  2 May 2025 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746206117; cv=none; b=bgt3ZKUVS8SBwYB5FuDa3t0rMrAjo7aqm4EI72p8YrQNF+lamtXQEFbvCaxF1LU2xLvG/p5nFcJDTT7MM973u66tKwYq8nj1H55GaGPQlgZavl+eRXWIo3xP7muoEG++zGRjmK5JH5EFdC2C0GKejkJQH6JR1VKlsWWzfLBCTIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746206117; c=relaxed/simple;
	bh=Oc1wZzIdvlRZC4vtY8n1/2AKh9fkjAjte++Sgvf+uow=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pYPmwf0jvV/8JcladHn2MF2GjlGE6xHLp0ZU/d5CskkKo/oQQzNILo+nsLb+9rTey8DTUNo4xeAIlFQyR2m8+if0ltVWoAX2GdLAXQuz5i/3HNh4lBsM9kRy6jaGfCZzv97AW/ZWgt73fD02nJvT9W9vFeCq/WGLEPeyZbXK+QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Uo0q3fFO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542Dn775022868;
	Fri, 2 May 2025 17:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A0i7hZR0xV3rGKXf9cDhtSeJ
	0MaBoOx1NQRt7QYQfs8=; b=Uo0q3fFOzO8kD7VpI5QSknAssDcjgXUnkCYbzKJd
	GWL/BL5AaZNaDEysk2AxEoLwtvAT3SIZJdnQRHsDNoLlFBPgcCi49m3kSKM4VdU8
	7hoEwQdVpzrGwkx7vdOwcRi234GziUPDJJBEHlKHCL4MusAa27X7s8lXCd3oCIaW
	b/3HbffVdTthGK5XRmeZNUO/VOs9Ri4cGD/6EbFo1qel1t0GMZNVjGOkR6x4UXaX
	pouvPzpIh2jEKiXnUPcBpLFlM5SXT/xOq5O8HCddjfr/jH/qvULhx5aWgUIXo2Yd
	eWg4fdOIkU1V1UuiRrVfrh6gj9twiSXxr3s7/EzFXWDANQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u80yes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 17:15:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542HF6CO011760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 17:15:06 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 2 May 2025 10:15:01 -0700
From: Praveen Talari <quic_ptalari@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Praveen
 Talari" <quic_ptalari@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>
Subject: [PATCH v4 4/8] serial: qcom-geni: move resource initialization to separate function
Date: Fri, 2 May 2025 22:44:13 +0530
Message-ID: <20250502171417.28856-5-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250502171417.28856-1-quic_ptalari@quicinc.com>
References: <20250502171417.28856-1-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=6814fd9b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=0DDkC8yEFXPSaA7UoRYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AE5qOq9Hvlo8Se6LbfCH3iXadjVpM6Bj
X-Proofpoint-ORIG-GUID: AE5qOq9Hvlo8Se6LbfCH3iXadjVpM6Bj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzNyBTYWx0ZWRfX2vALYNgm+VU3 E/Pv6uVkk9A0OOUdXsKDQMlIXeeRy0uTsZvLHEkKqxHjU/K6TUtYToj0tUKNGA2vYyCptx9/cdM gWtWbxFhDcEEsJ9QwGzpk+Y6Uo/xpzCZ/BfJdHNm+YDF+ZvcuxOruM+FxRxDtAiOlPyUj2eebWK
 FgjtmdcIT/C1bNq3PEDt/G22+VAau+JltqPLfHwloE7FZ/u2S/WunaiMgLuRTjEX8dRr7JnytlN NDQ3AdmIAVCTBuXaxGCQeK0HcYIYtoD20hRSg2kTlcFOUjTfx8gOHtgyuT0YDj+Q6kFPvVE9oBi qM9x50Tr889ZDGWdJlH20HT2h3+tdBV2sywOROXjyhR6sFM50Ec7qTdc9hUnfKrrf6yklrPwxY5
 Cc0dzNmCdKOgarS2pUo9GLVeieU8CBhnQkUJ8VV+9teEdprBMQQr+rMJ8wLgd9bbHrSpR3/+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020137

Enhances code readability and future modifications within the new API.

Move the code that handles the actual initialization of resources
like clock and ICC paths to a separate function, making the
probe function cleaner.

Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v3 -> v4
- added version log after ---

v1 -> v2
- updated subject description.
- added a new line after function end
---
 drivers/tty/serial/qcom_geni_serial.c | 66 ++++++++++++++++-----------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0293b6210aa6..6ad759146f71 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1588,6 +1588,43 @@ static struct uart_driver qcom_geni_uart_driver = {
 	.nr =  GENI_UART_PORTS,
 };
 
+static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
+{
+	int ret;
+
+	port->se.clk = devm_clk_get(port->se.dev, "se");
+	if (IS_ERR(port->se.clk)) {
+		ret = PTR_ERR(port->se.clk);
+		dev_err(port->se.dev, "Err getting SE Core clk %d\n", ret);
+		return ret;
+	}
+
+	ret = geni_icc_get(&port->se, NULL);
+	if (ret)
+		return ret;
+
+	port->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
+	port->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
+
+	/* Set BW for register access */
+	ret = geni_icc_set_bw(&port->se);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_opp_set_clkname(port->se.dev, "se");
+	if (ret)
+		return ret;
+
+	/* OPP table is optional */
+	ret = devm_pm_opp_of_add_table(port->se.dev);
+	if (ret && ret != -ENODEV) {
+		dev_err(port->se.dev, "invalid OPP table in device tree\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static void qcom_geni_serial_pm(struct uart_port *uport,
 		unsigned int new_state, unsigned int old_state)
 {
@@ -1690,12 +1727,10 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->dev_data = data;
 	port->se.dev = &pdev->dev;
 	port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
-	port->se.clk = devm_clk_get(&pdev->dev, "se");
-	if (IS_ERR(port->se.clk)) {
-		ret = PTR_ERR(port->se.clk);
-		dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
+
+	ret = geni_serial_resource_init(port);
+	if (ret)
 		return ret;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
@@ -1713,17 +1748,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
-	ret = geni_icc_get(&port->se, NULL);
-	if (ret)
-		return ret;
-	port->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
-	port->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-
-	/* Set BW for register access */
-	ret = geni_icc_set_bw(&port->se);
-	if (ret)
-		return ret;
-
 	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
 			"qcom_geni_serial_%s%d",
 			uart_console(uport) ? "console" : "uart", uport->line);
@@ -1745,16 +1769,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
 		port->cts_rts_swap = true;
 
-	ret = devm_pm_opp_set_clkname(&pdev->dev, "se");
-	if (ret)
-		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
-
 	port->private_data.drv = drv;
 	uport->private_data = &port->private_data;
 	platform_set_drvdata(pdev, port);
-- 
2.17.1


