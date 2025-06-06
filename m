Return-Path: <linux-arm-msm+bounces-60494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29560AD075B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 19:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 933AC3B3D74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 17:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8668C28A1F5;
	Fri,  6 Jun 2025 17:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fn23jgSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3F28A1D7;
	Fri,  6 Jun 2025 17:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749230528; cv=none; b=S0pQpPYIshtzM6Vj9gkyj+Fvl85PQO1AHorcr72bq3xbhGMhjegzQdvmvPqKdP2QkYkQ+QBP2IRMUAnfEIjo0HesMXwL2yInvVm2NESE9DRSSOqqzHuKfCQPGYjP0bfS2EJdl4XKXrAZMhQKN0L1+YQTT+QUD8AShsvKdpc1jp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749230528; c=relaxed/simple;
	bh=sRoxSjjhJOl+LoXjh7fx9U8ab6RUfvtgKiSxAPlxwAw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/EvtzO8qwqx4VHTupOuzHUGOmIHIIO+JPtjTv5qH25npsxlGOy660ZjQuIYZpHBNuYkHcrNc8+ptAwxHWcCYttZP81WgwGvgOxq8UoJr6F1zFf475vg7wtiOcmoDOBkS5c+r4rtAPXVRsgB+9Tue4X4/qkZSsoyhK3xwcPAlTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fn23jgSL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9JKS018788;
	Fri, 6 Jun 2025 17:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mpmklqqcaJluOkyzT8mwPRqk
	1Gcu0kR0DS9U6UzVrgQ=; b=fn23jgSL2y5XZwb6wu5J/nUIDOO4sf6VYKw6fOVU
	uq+ENaWj5XqUBnxsfKKaj1QioktzkqVqGgGx55NTICz6uSEG4duQmTo+S1eNHD68
	5naFGqXaIBtbNTlGW0ush+jaWd6i/0XqKXFvU4E+6hzRmsruj1kpa9zaFKXrWKa4
	bWc+zuZdrIHn1ucrqMtb6DtCK6+6Cr1CB4ocDqzxc7bwP5W0HDMi9dL8hEjTp/Qv
	ir8fLUi6SqQu/3QrauJWI6z4zqh0MQqgPfMXlvDEqxQkz61LZUUnCT2KsZoONjIo
	bUE/8PExbbgvf0YKglaAFqMB/JyS+4KRLRw/X6ZRTK5vdg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nwap2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 17:22:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556HM21V021580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 17:22:02 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 10:21:57 -0700
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
Subject: [PATCH v6 4/8] serial: qcom-geni: move resource initialization to separate function
Date: Fri, 6 Jun 2025 22:51:10 +0530
Message-ID: <20250606172114.6618-5-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250606172114.6618-1-quic_ptalari@quicinc.com>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
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
X-Proofpoint-GUID: UW8sQX3Jbv6P4E84eeRdYTO_AiZhGkGi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE1MSBTYWx0ZWRfX1EdmGtE/Jzex
 Qu7CkBBvq2HVONCApVO2RpUmybguaJhiYmz8W/hMN/PQkZlTWcdJsv1hmTQLxhc15wisrgKMESY
 ZXutaUEuZv62EZgKS+tsbBdAmUFCZ3P575yBNNnTZpo6q14JGdG2aHVX8NgWbcc1sGWqPJ7yUCb
 PlsA91VJ6q8Ncdbl4WakHZ5H08wYbT8REoF02VsIM4v8s/q8gZIBc4Dd3yRhJ8Ouz3NURAlIh8U
 MoFVCiJA8CQ2VULssDALDbh0RFD5K5flKqa4nFUU6fGPqyeBTjgMFJXxqb2XvNDfMolRuD1Gtq4
 BuZROfR7Mp88siuTGGScQnarJ7nfpt534XAdkN2ufDhKdg6iOVpnN9mlCIO60lZVVx9stDToT1G
 y7bu3m7sEAHZ/lpdg0zQo4jrCfp5qkiW3Z7Bsro0Vuk0yBVhNUTO4i1rAbdrmJNavRQOPHuP
X-Proofpoint-ORIG-GUID: UW8sQX3Jbv6P4E84eeRdYTO_AiZhGkGi
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=684323bb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=0DDkC8yEFXPSaA7UoRYA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060151

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


