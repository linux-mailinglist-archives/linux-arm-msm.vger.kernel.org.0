Return-Path: <linux-arm-msm+bounces-65949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC222B0CA10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062E63AE2EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8102E4262;
	Mon, 21 Jul 2025 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aLl+I4vR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF402F2A;
	Mon, 21 Jul 2025 17:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753119997; cv=none; b=cgDuPnzECowWNZwvCxWlKns/Ize8F+Bhpo3HqTslrJHVza0GAAT/dZgTyhWmcybQzPb5ttXOZxfrbCi4CLMh0hmSfSMeWwK/oCAVbEG37piy82Mk03Q1JcO+k6wnICe37ZyUdJ2ebb3TmvjtvT/ssZf/4AoA8gWNr2Afdz3Eq70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753119997; c=relaxed/simple;
	bh=ji1GUblKmUAGdLaZtBpGLXF0dFMdSQEFHFV+DNgWRnk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rChXPMlgZW8vPEPMb6bJoEKCybaSu9vO1aVOvcVV5M4OSoMiXFeqBqGZtfQ4e/ZMAXJydD/tY5Krt7GhflQcnOm0k915dnoZtM8IMdJf290DayBbPUsvad/GMRoTv2ZgSJuYn877dXL+MWrvIUhof1GEDKSh0FYbee0mLWCtY2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aLl+I4vR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGVmRB015772;
	Mon, 21 Jul 2025 17:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4B+35fPULpOXESTY1W5cCKou
	vULAbMYPlPCPrKGMmJM=; b=aLl+I4vRs6aReyd8H9/hs7m7MPIj9yPzSHNsh8sg
	1keb0GwHp1RPQmX7yzA72+EdKyd9bCaBanPJ1lSPsSobpTUJ/RMBqJnarXEjfT82
	Wv0SNPPiBFfeEREwUiyjH4K6YESNL90s6tldAG3Q5vBYVgK0Wxx5lX+j1bIgMsKo
	T+lVyt1VECTbw35bMc08X1C6depZbZerlnDq3F3EzYFy3Yf+N+W96cqSgw+Un8uP
	jl5csAReK9S4OeZmC/UzkviLPP+mca5hXE7s9cNnDzyw5eq0lvDcnklDkMU62R35
	eWRScIHr+AnyLWSsDYpQshF1MAlpaiN1pkBBAdyH6KYgoQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451efe4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56LHkUJk023284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:30 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 21 Jul 2025 10:46:25 -0700
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
Subject: [PATCH v7 5/8] serial: qcom-geni: move resource control logic to separate functions
Date: Mon, 21 Jul 2025 23:15:29 +0530
Message-ID: <20250721174532.14022-6-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687e7cf7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=3QcUufddGHkGiiYWibcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Krgl1WzDD1wToP1DyTtbXDi4QTYBkFs6
X-Proofpoint-GUID: Krgl1WzDD1wToP1DyTtbXDi4QTYBkFs6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1NyBTYWx0ZWRfXwhdon5dr0Tbu
 aKICorCoJRK6cjHGJBTl5wzdolPx0vbAYhvzCg8nGkvKbXFy4s5cTSywht76O3bljQ5yh7Vpfy8
 S4BmAkpkyX+75yz071mB/WomyxuzP5PJEcSsmwwgndFKe/1hG3dwckCFE2B88ioM2/RrRYZLjkH
 hZGGCJE9Xrkr1mGXx5/EqvE/6T6S0CuBM/ZCr20IxOr7ZCQQfSuc9W/7/+HVloO1KQ0t4nFWjm6
 ZQNpKSreaU6PF4Yr5THW/1O1UukFXKDhif4+kFRUYHbfXmubm1eJEDZfdm4QRaY3f7KgMHEp/mL
 PQQ+nPv6Xv8s48Umoy130f7RPRxR7fTPkcGnREYGGHArRmF6VRHiPqd26rGUK2zaGmXqE5AcRyS
 O2C6N+YCsv0QtP4HNy/N0nMmtZwxYoPDFn4mZfJ5bZMtuVMFa7Fo55S6xgl4PEAtsufOLf9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210157

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
index 1e1c60d7aced..45d9735247f8 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1619,6 +1619,42 @@ static struct uart_driver qcom_geni_uart_driver = {
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
@@ -1659,23 +1695,17 @@ static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
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
 
 /**
-- 
2.17.1


