Return-Path: <linux-arm-msm+bounces-56996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8539FAACCB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 20:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A068C7B1CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9341A286423;
	Tue,  6 May 2025 18:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W4He7Ror"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071EB283FE2;
	Tue,  6 May 2025 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554610; cv=none; b=Rw/dftUzrewrPUieUneKZbJYE4+zOpP0ID+1yk+7IFXLWz7izNIFTzeSyz9nbHF8doeVPvnAE7+OQS9kp6HYULh4BNfFmqU4ffzGE+Jx5AQscXUnVzPtD9U9vwboBw7mtoJjL80ivTt58Pg6VIKCjt0LnvAcq+ZNCS3AOAepy08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554610; c=relaxed/simple;
	bh=Oc1wZzIdvlRZC4vtY8n1/2AKh9fkjAjte++Sgvf+uow=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQSrU35HHOLaw3/9WY9HrR0tW1i4o592zmFCwKfgditx46L978bwBNm8ZnCYaMs/iy4JVVdFn9Y2IBjLcdmHR2OhDhjIdQ9VqMvY5qD70huJi5d8va9zq+hSrzy455Ggw/T9i+c+e4o/cYZH1Un1ZyAAilV5Nr70l8PVRLq+qls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W4He7Ror; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546B6cbR024744;
	Tue, 6 May 2025 18:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A0i7hZR0xV3rGKXf9cDhtSeJ
	0MaBoOx1NQRt7QYQfs8=; b=W4He7Ror1F9E3XsmHFAfjC68AaLQAlO4RwXDJE5j
	jV39iYCG/IwUTvAq0AhYWHxUw6fXd+CqLg8Hgr/DFKB0WaJhzn3oI5l0YjLKtlSF
	04gM3BWFBLjymxO5zgwhYVUTblgcii0vHf2sy3r6t6YXn2WTkGRjf/fXNuRbO/AF
	i3wDwKVXO5gHaM4Q+3eaQtRGdfKCQPGZg2zA/k9hgwIJegItUctHhdedW1mMiz5A
	Aq8ofqjJSbV8JzfY4DSDpbC9RCufyYUlxWUkEKUURqRAFnHSiZWwIDO1dlFyAHJ1
	Vd4jN/AYwrkiBXnJqpyTW8qUeYah2lXbNaJ+StPJyLYpOQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fdwtsx9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 18:03:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546I3P1A026516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 18:03:25 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 11:03:19 -0700
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
Subject: [PATCH v5 4/8] serial: qcom-geni: move resource initialization to separate function
Date: Tue, 6 May 2025 23:32:28 +0530
Message-ID: <20250506180232.1299-5-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250506180232.1299-1-quic_ptalari@quicinc.com>
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=VPPdn8PX c=1 sm=1 tr=0 ts=681a4eed cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=0DDkC8yEFXPSaA7UoRYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vWB4_1PYvFOrPpMQegHWQ-8a9DjQfIE_
X-Proofpoint-ORIG-GUID: vWB4_1PYvFOrPpMQegHWQ-8a9DjQfIE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE3MCBTYWx0ZWRfXyvqbAqQ9IciE
 AIiWJgq6G1zZicEtubLQP2TufGKWwCZ1iaFYTCAsw09ROfL0lOqFpa2XQ16S3Dy7r8N0r/4EzUq
 D+HbsQHLzDmiNLvgXWITA3kHa4gcumUpdhxTAywO0NNymoLM/C82tLii0pYAF6fz4MtFt5upqjn
 qVkeLzN6iuhVHjxCrf3yoJx0TQjt/tLzHNA3SYkDesYqkZQDckC9TOJ0VsHOwmqBoaAWJKRl8SQ
 uIlp3poIgxMd74o8WgLvrbP0ZMSs0EZehCf1pc0HQ5hjoR3klbXzVWBoqv59HShxGfXtWFSHu1b
 RjZaeHwBO/c8S9DHLLQsRjD8F6hri8aDtjrirX/DPrW7BeBNVmQAYW+mmRfvSiERtXzQLapQJy+
 ruYAYf4TcEZ/ysVysFEugH5KhmzchAycd6sBqS2IjliJFYRNgurXUrw0UP20J3hrlro6ntxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060170

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


