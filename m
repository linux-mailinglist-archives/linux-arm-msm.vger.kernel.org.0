Return-Path: <linux-arm-msm+bounces-60495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17758AD0760
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 19:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E59D3ADB0E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 17:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1019828AAF8;
	Fri,  6 Jun 2025 17:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZEmfJ92Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B1F28A1D7;
	Fri,  6 Jun 2025 17:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749230534; cv=none; b=Ik12wiE+PtIyCSbN4ahXxDOdEvzAqRRC+lRXn568eiflRH6GO9Q2Fv2ZAhTgncuFYBBDWIwBJmSwv4TWH4JyW7BCgLpopYeZj+mXNzxZD+9hYPaRyciXPyc8noFoSmFqV5+d6d7olwn8JYG3KUcaLg07XBGtthC09cgNQQWYbSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749230534; c=relaxed/simple;
	bh=eolUqZZHQbz60lz/09mJeGtoSgn44EDg3HWszY7u7/w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d8TYuJOZbB01LEow02R477PrSaASvVQwsIZJX1hNVoy9g817+4IqHQUCg0rVEaLs6VL/TnzF+R6RXMbQlC4wMsZivliB0fEfGxEpWTHZHuko1WGkUd38zdran5wZOLsIRVn6c/phRtseo52mhB5ZZnKjbQhmrWc9Uxg3sowH3dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZEmfJ92Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9LBa027375;
	Fri, 6 Jun 2025 17:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7VytDP/sP7HP1w5iFkFhAYU5
	ZMzMLN1foCNOWQIb6yc=; b=ZEmfJ92Qs6ZgWMfcXwlkM0QcTN1ZzUmr4EjU23Mm
	Hj8RjeRm1MF4iU+aDDl+Iix3Q1V2BTKJgrOg9cq5LgiviLL80OvE47ZFa0v/ukMt
	gpnMSGO6psC5PlGgq4xqq9D5F/ffZ9N8q8rLQ04li/phKBFJqVX1HdepAYDYSART
	9uqxSsc0QBV6dzCPGf+Lt7CIpDyuZrAWP0tmExNNTk0JfaW4Fwlhj8rD5X24SAHx
	RtsSj6VYRC0yDyubZ/i7htxkTaQ53XTN0Sll1HuK3kIsdrQAkk6oTfP8GNTVFd6N
	f3XMy37+9+OT0EBPLwtQWzvQ+2dAKNiFwZoe7AW5JiyOfw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s5ds3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 17:22:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556HM89C027971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 17:22:08 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 10:22:03 -0700
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
Subject: [PATCH v6 5/8] serial: qcom-geni: move resource control logic to separate functions
Date: Fri, 6 Jun 2025 22:51:11 +0530
Message-ID: <20250606172114.6618-6-quic_ptalari@quicinc.com>
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
X-Proofpoint-ORIG-GUID: EawVaTFvPkvkxO5X6Gdf32YbmewU-awB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE1MCBTYWx0ZWRfX4fyYaVFtPm5L
 w2fruVHoYUscEk2+STC5ZI3cEynLL+3LN6r+tAs02rVlgMWLBRWj2hADYBi1nWKd6ceczFXxS3d
 mr0qlPwmZTVyxt4R/V4BiGU8zd9p8c4qpYdBMmK8+Kw372n2FR0tVfbkiPULsSoRPOlPQJkW7eB
 /EfB/xx4ud6pzvoyPp8yMfKE1oxAikEgU0GWspsSilR5AatV3uoX4jyNmqX5QSEaq6L4uqujcjg
 ELUsOnyIFHPb3khFq15PschgJ0Ea0hIhjEYX7WUDR7nvbHpLSdKsL4WzuMvDAUFyBoLwJJrh26h
 Jn5SLI6fryhtk37plG1DcszKhWRX0wf54qEqaHvTKQybzfoZ05rNwjZCSSXa6DaRRSIuq/KElih
 ggS3ITWGuQSf3bWFAIas2W9Rf2FVcoM0ykiFq+T0MTZjKOjunDpYJT8pXqlcA3cXPnqwS0LO
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=684323c1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=3QcUufddGHkGiiYWibcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EawVaTFvPkvkxO5X6Gdf32YbmewU-awB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060150

Supports use in PM system/runtime frameworks, helping to distinguish new
resource control mechanisms and facilitate future modifications within
the new API.

The code that handles the actual enable or disable of resources like clock
and ICC paths to a separate function (geni_serial_resources_on() and
geni_serial_resources_off()) which enhances code readability.

Introduced minor return checks in newly added function APIs to enhance
error detection and prevent silent failures.

Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v5 -> v6
- updated commit text for checks in newly added function APIs
- fiexd alignment
- reordered newly added function API definations.

v3 -> v4
- added version log after ---

v1 -> v2
- returned 0 instead of ret variable
---
 drivers/tty/serial/qcom_geni_serial.c | 54 +++++++++++++++++++++------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6ad759146f71..715db35bab2f 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1588,6 +1588,42 @@ static struct uart_driver qcom_geni_uart_driver = {
 	.nr =  GENI_UART_PORTS,
 };
 
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
+		 old_state == UART_PM_STATE_ON)
+		geni_serial_resources_off(uport);
+
 }
 
 static const struct uart_ops qcom_geni_console_pops = {
-- 
2.17.1


