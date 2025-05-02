Return-Path: <linux-arm-msm+bounces-56568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8487AAA7878
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31E8D1BA1B78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C1326989A;
	Fri,  2 May 2025 17:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R5cWT3b2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FFA1ACED3;
	Fri,  2 May 2025 17:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746206118; cv=none; b=FVR7iMisewutDgHfKr3xQeH7eIQ/b+bukkN28luapY2hnnlgxxeUmcmNtHUKiX/ARp8ShWVKtlS5eppz9DVXfKsZHR9qEJDUuSxHnqF3Iv4th2NU0fr+ugbrgAzCnI0O4bpbQdrJNKnvhya4gNyNYnPWzB9TyoVHMzcXg8rmGrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746206118; c=relaxed/simple;
	bh=tesk9LM8WSCAa0vJzlAyjmFHODD+5WQuGakYiHBm5CI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=REjsmHaENMqP9dbl1HueqfP6WPGCdsD9VoZTC8IXOcFsOZL8AVHqUdCWNDpWG3fTm0x4UAqMpdVkJWpMwdnyoith4JjfVL3FqvnWi6dSMSALwOfnlFIV6/3bFcKWpT0T48Qtouklf8dX5aDH2Bwo/RvGKV81AcPZmTh7JYKbzK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R5cWT3b2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542EA286017738;
	Fri, 2 May 2025 17:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/44Z+sAk1IIP4oEdS78SzSOU
	76R4fKdmH5OWfEc/F1A=; b=R5cWT3b2uv/PZvjjHDIv7Jv/MTJlmHEOTa+DPNh/
	8VrrK0L27ex3/sjzRb3sGrsNu7BEDhxOAd78SQQyf2+J/BGsDpNKX2YRE4pg+jIn
	nwWnkr5b/MDMnZNamzNUoG9m02v5znrROMC99S/tOdcroqbiFSI+zgOZgMFHHuvp
	QYlux3RoOuPIFUIbseSPUEMBCsTFEcw4K54uNRRY/BOhGUQbN6cis85lglxuCG1O
	PES5cDzNyU4jrjJ/IaHYSowb0oSwtKI+VHuvwS7xBNaHQU/jjHpAP+OwgXX7MdUI
	/t/jPfkAGCe0a+TFIBM6YM+jHQI7CWOCP1jhjqO0vqm48A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uagv0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 17:15:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542HFDB8024270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 17:15:13 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 2 May 2025 10:15:07 -0700
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
Subject: [PATCH v4 5/8] serial: qcom-geni: move resource control logic to separate functions
Date: Fri, 2 May 2025 22:44:14 +0530
Message-ID: <20250502171417.28856-6-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6814fda1 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=HYIVWE9JnHk2aDURxZAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzNyBTYWx0ZWRfX3wI20L4XawgW gEU5qUoWFF11pH5EIg06s3Qu0fEHjFDMOCLRSavdqDnLdvhPb6hGU9rQENKxkzOIv8TkZPG598i PVTUmApJoe8Mgm0EDV4SsRh1GwNJU42tlQ2FXMe3IyfnDYN50yRcN3ED7wvRtyAWOZd8mJt65f5
 kWjcItZ2fa+6B70GxNQU5dkegXtGzOa9jm1cC5n0AQTM9mIKshcklhRxdhMQZxFKHU/tG5Mf+Rn AJk2OLcCIsS+agYDkKWJ/RzQGSnm75NCcBVioieUrBAYdRzCXqODPgoRupHw3JvQAB4wGhF3O3b nW8fmGVhlj1/vN3O6CTQQJGwzkORWaLpVfCXfnYdvxU8lsh+yLuyiVVKvodYL0yZHrXSRviOIW6
 BQDgU+KJnQQ3SgHI9VC2neaUnarqBknZbZTVbfTY5LFrPT8cTjwtjUpxuCSZ7CtgD6kZgqUZ
X-Proofpoint-GUID: 6ADCNu5O8sOicPWIfNNr-BvyjCGIrDV6
X-Proofpoint-ORIG-GUID: 6ADCNu5O8sOicPWIfNNr-BvyjCGIrDV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020137

Supports use in PM system/runtime frameworks, helping to
distinguish new resource control mechanisms and facilitate
future modifications within the new API.

The code that handles the actual enable or disable of resources
like clock and ICC paths to a separate function
(geni_serial_resources_on() and geni_serial_resources_off()) which
enhances code readability.

Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v3 -> v4
- added version log after ---

v1 -> v2
- returned 0 instead of ret variable
---
 drivers/tty/serial/qcom_geni_serial.c | 54 +++++++++++++++++++++------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6ad759146f71..2cd2085473f3 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1588,6 +1588,42 @@ static struct uart_driver qcom_geni_uart_driver = {
 	.nr =  GENI_UART_PORTS,
 };
 
+static int geni_serial_resources_off(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	int ret;
+
+	dev_pm_opp_set_rate(uport->dev, 0);
+	ret = geni_se_resources_off(&port->se);
+	if (ret)
+		return ret;
+
+	geni_icc_disable(&port->se);
+
+	return 0;
+}
+
+static int geni_serial_resources_on(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	int ret;
+
+	ret = geni_icc_enable(&port->se);
+	if (ret)
+		return ret;
+
+	ret = geni_se_resources_on(&port->se);
+	if (ret) {
+		geni_icc_disable(&port->se);
+		return ret;
+	}
+
+	if (port->clk_rate)
+		dev_pm_opp_set_rate(uport->dev, port->clk_rate);
+
+	return 0;
+}
+
 static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
 {
 	int ret;
@@ -1628,23 +1664,17 @@ static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
 static void qcom_geni_serial_pm(struct uart_port *uport,
 		unsigned int new_state, unsigned int old_state)
 {
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
 
 	/* If we've never been called, treat it as off */
 	if (old_state == UART_PM_STATE_UNDEFINED)
 		old_state = UART_PM_STATE_OFF;
 
-	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
-		geni_icc_enable(&port->se);
-		if (port->clk_rate)
-			dev_pm_opp_set_rate(uport->dev, port->clk_rate);
-		geni_se_resources_on(&port->se);
-	} else if (new_state == UART_PM_STATE_OFF &&
-			old_state == UART_PM_STATE_ON) {
-		geni_se_resources_off(&port->se);
-		dev_pm_opp_set_rate(uport->dev, 0);
-		geni_icc_disable(&port->se);
-	}
+	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
+		geni_serial_resources_on(uport);
+	else if (new_state == UART_PM_STATE_OFF &&
+			old_state == UART_PM_STATE_ON)
+		geni_serial_resources_off(uport);
+
 }
 
 static const struct uart_ops qcom_geni_console_pops = {
-- 
2.17.1


