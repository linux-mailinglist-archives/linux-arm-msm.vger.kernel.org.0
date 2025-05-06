Return-Path: <linux-arm-msm+bounces-56998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58380AACCC3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 20:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F65F4E5C1F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E13F286437;
	Tue,  6 May 2025 18:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JHTvH7ag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6EE2857F4;
	Tue,  6 May 2025 18:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554625; cv=none; b=DnTfdfUjkyi/z0atWTCPZeJ18+zdbIPvZRwbjmatWC1OYYUfjRHYDOC7eNEEItZebtbsx1Mw3OnWDxEaeOT8fjIrYUnFoXZCsoMqKeQJITwjwhNfXtR3U4tnBCS8nzSxnzzwMo2EBNXV5z4fp723xM/cauyDr7sy8eDRUP+8Plg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554625; c=relaxed/simple;
	bh=ms/gJxk8Auq+wRsLNCrcVGsbPLzYxnynt9BuUHJ8IJs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DUeeb7u3i6ni7K3OVsN2alFIB8taCXDQjApjBfTjKBjzyH2Eq4T4LO8gZa+NQPGO9ktDJLr8VEb4HPkjQoREUtT4DYbPLOyGxPP6ZiyPwnwvMdanLN1DglArV+rJsrdlhmbRWF+4EflSPAeumBaulkZ1iHzN5XFf6bt9PQRLInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JHTvH7ag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546HDWi6007903;
	Tue, 6 May 2025 18:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=augvxecJ1PoDqwayRrZUDkvT
	BFPT6oBrv2YVJe1PJDg=; b=JHTvH7ago4nZErjPSIASKc0mC66Pdbqe98rgLFcD
	aWoAuL841NM1CjhlW0VuDLW2pkFRUdC4Qryr8RcXKDUS2fFbzZZxxcZXV5Am165L
	AREwciUFq3BbUOdcWHXDU62MtJwpU376ipyM+bQhmfhG2z/3SpsOZQu7LlwlNuWV
	PikNjyXCetmmbbEL1CiAIC6HtyFPdrMMKT2akeHMpugNd3yuQlzrrgx84DOnYbLG
	36vKll9lH88NWP4wBUNKX0/xfiTezBwZ2L2SVpdabKnq1odITSO3o2d/C4E1gs/N
	UGO1a+1Uhkq6noaEKDcdXLhAsA3JoZSwgmSA/TxLLzAcdg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep8nwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 18:03:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546I3c4O023201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 18:03:38 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 11:03:32 -0700
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
Subject: [PATCH v5 6/8] serial: qcom-geni: move clock-rate logic to separate function
Date: Tue, 6 May 2025 23:32:30 +0530
Message-ID: <20250506180232.1299-7-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681a4efb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=X08zvMDfRsL5Z2rP0xYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QJqMOQRGLgM25VIy1GfTkBCNrysUUGvi
X-Proofpoint-GUID: QJqMOQRGLgM25VIy1GfTkBCNrysUUGvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE3MCBTYWx0ZWRfXxNYQJW9SBTyk
 eco73NTPcFsr2ZR2K3p9vjtrPX+u4rINXs4u0KzStaSUiriTYaiU3HUPRCHnwNOQORQfdA22zs0
 9zBFMT+OjFtyISLv5FCQDySfOX512wYEPJuj83yJBUOIR94PNKM2FsQ2leVGJC1AvSKNpPsT6OM
 I4cQW+yHorg1XNWWJbzLXPTIYS95TLDchM8PYzaqYhobNu3+AZJG7xkMmXpq5ApqF1YXjvFjggj
 PlJkpAo0gVxEKIc90Hdt4xFFlFfN/1A0dMQyJg4YXFzJhHxQBY0nvG2NCkYYiDYbwKgLVfszE8D
 Y4yyzjFF/ZsugeDqz7mewxEPgl106BKw8m23yrF4qea8kJYvjZ4mPtuZiuMhnOv4Tdfr+mxtcJJ
 yWwWFgfmnQ5j3b8LNwnvi0E4vrABOL8Ud+jhHCmVQjDn+ehAs7/6GAdcIrgIzHxapesshmFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060170

Facilitates future modifications within the new function,
leading to better readability and maintainability of the code.

Move the code that handles the actual logic of clock-rate
calculations to a separate function geni_serial_set_rate()
which enhances code readability.

Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v3 -> v4
- added version log after ---

v1 -> v2
- resolved build warnings for datatype format specifiers
- removed double spaces in log
---
 drivers/tty/serial/qcom_geni_serial.c | 62 +++++++++++++++++----------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 2cd2085473f3..60afee3884a6 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1283,27 +1283,14 @@ static unsigned long get_clk_div_rate(struct clk *clk, unsigned int baud,
 	return ser_clk;
 }
 
-static void qcom_geni_serial_set_termios(struct uart_port *uport,
-					 struct ktermios *termios,
-					 const struct ktermios *old)
+static int geni_serial_set_rate(struct uart_port *uport, unsigned long baud)
 {
-	unsigned int baud;
-	u32 bits_per_char;
-	u32 tx_trans_cfg;
-	u32 tx_parity_cfg;
-	u32 rx_trans_cfg;
-	u32 rx_parity_cfg;
-	u32 stop_bit_len;
-	unsigned int clk_div;
-	u32 ser_clk_cfg;
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	unsigned long clk_rate;
-	u32 ver, sampling_rate;
 	unsigned int avg_bw_core;
-	unsigned long timeout;
-
-	/* baud rate */
-	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
+	unsigned int clk_div;
+	u32 ver, sampling_rate;
+	u32 ser_clk_cfg;
 
 	sampling_rate = UART_OVERSAMPLING;
 	/* Sampling rate is halved for IP versions >= 2.5 */
@@ -1315,13 +1302,13 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 		sampling_rate, &clk_div);
 	if (!clk_rate) {
 		dev_err(port->se.dev,
-			"Couldn't find suitable clock rate for %u\n",
+			"Couldn't find suitable clock rate for %lu\n",
 			baud * sampling_rate);
-		return;
+		return -EINVAL;
 	}
 
-	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n",
-			baud * sampling_rate, clk_rate, clk_div);
+	dev_dbg(port->se.dev, "desired_rate = %lu, clk_rate = %lu, clk_div = %u\n",
+		baud * sampling_rate, clk_rate, clk_div);
 
 	uport->uartclk = clk_rate;
 	port->clk_rate = clk_rate;
@@ -1339,6 +1326,37 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	port->se.icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(baud);
 	geni_icc_set_bw(&port->se);
 
+	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
+	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
+	return 0;
+}
+
+static void qcom_geni_serial_set_termios(struct uart_port *uport,
+					 struct ktermios *termios,
+					 const struct ktermios *old)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	unsigned int baud;
+	unsigned long timeout;
+	u32 bits_per_char;
+	u32 tx_trans_cfg;
+	u32 tx_parity_cfg;
+	u32 rx_trans_cfg;
+	u32 rx_parity_cfg;
+	u32 stop_bit_len;
+	int ret = 0;
+
+	/* baud rate */
+	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
+
+	ret = geni_serial_set_rate(uport, baud);
+	if (ret) {
+		dev_err(port->se.dev,
+			"%s: Failed to set baud:%u ret:%d\n",
+			__func__, baud, ret);
+		return;
+	}
+
 	/* parity */
 	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
 	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
@@ -1406,8 +1424,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	writel(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
 	writel(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
 	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
-	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
-	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
 }
 
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
-- 
2.17.1


