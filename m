Return-Path: <linux-arm-msm+bounces-65948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BB9B0CA0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A742D3BB0B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AAF2E4266;
	Mon, 21 Jul 2025 17:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P2B4iBa7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218092E1C7A;
	Mon, 21 Jul 2025 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753119990; cv=none; b=nWju8WqLJobpK1xPvZtUMj+OClBksMFN2YUHO8Crm8A4ftyITEwcs8CQPAvrHrNHviRu3Zoc6iAD2BPbnO0IfvxpAVFICNFdZmnTxBy6AM5mSdIDyJOskvLmgT/lqgUqOZ5lLWkT3x+cgQcul8GNuiNDRKf8sCcCZmmSq+QkIGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753119990; c=relaxed/simple;
	bh=7KYANvbI1Wp6XNodop6d3HRiR0pOwwaHkMJr88zy8Dc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KfsvfZwjjsPS4mFWGb7mZsZ2Nu3AA9XSSf3X9ZLexccMAlF4b0Jgecqgiof+xmm3PEYFGAWikzvJmlVRaxp1AnKOYXUOabC5IKN/v6l2OUuRiQuJA+WdCXntEreEU99gzdiNwAMSQub9vKARj4u9+kXnZ+qutIXM9K8Jtqtm0fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P2B4iBa7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGSgqg000995;
	Mon, 21 Jul 2025 17:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+c57GQtRCqnZUbTOaQt/fkp
	ZH57k+yRCWU+THm0vgY=; b=P2B4iBa7oe9y9CaTYrOfEeCO4hUlLPcPVlLLT+PV
	rcHVQEfWroR2HjmgCso9WxYXdp/pIafsMq8PngX8MKeLG5+LS0mkwFvZvqJ2QQ5x
	ulahB16Gqlc96UFVesjCL59oOZCCKc2Sp1rRtR3dlp5rzG6yNci20JBRVXtdnCtt
	2R+AuoYLePbG43GmSlb5CbRQheT2Q1G86s/A0y7FsdAc+Csmqu5xz7FsXgSN9QIL
	wgFcx8rK9WE/0MPizD4cf3wZBrkVBdRaMGFktDAbQx+hR3FGVamrlG6X+B3V0g60
	mYgM+Ix+zop+Fmh+7SsXl8IR8XIr+E2XuqzRrMa+tEDWYA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044degv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56LHkNcn023158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:24 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 21 Jul 2025 10:46:18 -0700
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
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <bryan.odonoghue@linaro.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_cchiluve@quicinc.com>, <quic_shazhuss@quicinc.com>
Subject: [PATCH v7 4/8] serial: qcom-geni: move resource initialization to separate function
Date: Mon, 21 Jul 2025 23:15:28 +0530
Message-ID: <20250721174532.14022-5-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250721174532.14022-1-quic_ptalari@quicinc.com>
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687e7cf1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=0DDkC8yEFXPSaA7UoRYA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f7FIrs3CyYvSu3KTQeiX9LCd04CcMrcu
X-Proofpoint-ORIG-GUID: f7FIrs3CyYvSu3KTQeiX9LCd04CcMrcu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1NyBTYWx0ZWRfX1l+JsYdeNpI7
 7l4PEI6Diux8DjQZstYaBojbqGFC/fd/XXPrqop19zAMSH0r5m1KhhHiTAkLe/AjcHtAGMdxALg
 +sP/HSU8+T2DeZlasuvFuwy6LQPNJnepqk4SKc3eWpT0P9Vl7yyqDlRjPfjTf8tDluzIEWDdeCH
 JIbXGxH0fcSMyZ6GM2fz5ZP2S3hjHXTqvMl3tsn8f0U20PNsCdQjQs+9heCuLXUo19WZY5hkn+A
 AwrogRwi0HNKwQKGSAdStA3b+1sDUbvv0xTmDWwEABaQKyrTR6UwxafYloxQAkv2vIoRLzAcqel
 2Uh85mhTfwh7Iqm2fPiTLTk/vXhRrPESPdivZd1hofBuxmdW3RpgWJgpbZatX9DeA1+u/Z6GjzQ
 ccXAE6jvOs6rX0SX2HSsqwpCxwD4Bo0KtkhLWez1bg0G7RxSRnz8k+tZ2evgwntT8iHThzO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210157

Enhances code readability and future modifications within the new API.

Move the code that handles the actual initialization of resources
like clock and ICC paths to a separate function, making the
probe function cleaner.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v5 -> v6
- added reviewed-by tag

v3 -> v4
- added version log after ---

v1 -> v2
- updated subject description.
- added a new line after function end
---
 drivers/tty/serial/qcom_geni_serial.c | 66 ++++++++++++++++-----------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 004f9a0d80f7..1e1c60d7aced 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1619,6 +1619,43 @@ static struct uart_driver qcom_geni_uart_driver = {
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
@@ -1739,12 +1776,10 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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
@@ -1764,17 +1799,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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
@@ -1796,16 +1820,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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


