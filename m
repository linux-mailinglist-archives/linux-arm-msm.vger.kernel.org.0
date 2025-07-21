Return-Path: <linux-arm-msm+bounces-65950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6C1B0CA12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98615167AEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2642E2EF0;
	Mon, 21 Jul 2025 17:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eru4xyUW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571D19ABAC;
	Mon, 21 Jul 2025 17:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753120006; cv=none; b=ubcltz4tudiWGXVFqKIW8sYE4Uj6R5cftNY86AO0bNbg5ChlS5wL+vWkwHSlTb32Mlgg7ct1Di+V06ewhjqNJxbSgoXnHJS4ihNZ5nr3JuYckTsJhhOZYq91qvAix3cDTy3rK6v7tgDOu03PLm0jbA0rJVroGxdhDr5YvvGH1fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753120006; c=relaxed/simple;
	bh=F2kbBuWRwpSK13E2joDL/u+k/0Yv1J6vipyvqsQRiCw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sGwb0A7Mk39xSn/82HbIPauo7PkJvH9MsZuAkde+r08HRvin2pyQRrqY9DEmLoojQWS82VyTIgVDKmegVUjxrEdBeAIL3/EPRyoNU6Ty57B7D3P2zdZrZ0jlK7njCkWPOvCu/GCHvVcP55Y263CtlNnEpkNIJEcAVJj4fUIsRfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eru4xyUW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGTuxg029264;
	Mon, 21 Jul 2025 17:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YcaAAYmb+IeJV8ZOUEeG4H/h
	lE1mBmSQ76CCD0QgUug=; b=eru4xyUWbEsIywp7A2R4Nlydal74716WFy3lnu8l
	O+IyRHP7C15SybwYHblMfPoyfVWWHiqwoxKpUqcz5RRkeX5TSPIb34pDh+S5ALCc
	v82FuTJ8W1sdF36TyZCg0LQCFyzwK722ycZb/l/mlmJepoRs9XRezxAUBCdasbaN
	MjTUQ3u6yM5xQSXRBn+d6tUNBuwuzW+6s5Src1fyBOoemYBWICCGVLImV8g1P6xj
	HQoXUq9X0X3o3Cd0nq5qujYzFJHXG9Wlbf/GVdj3XW2mSm1A0peOmocxCFYVclzI
	WKgvSQYrWRZWCURp11e49Q7N5hcAJ+eNvWbXTU9L6VEk8A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048tegxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56LHkbB9023470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:37 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 21 Jul 2025 10:46:31 -0700
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
Subject: [PATCH v7 6/8] serial: qcom-geni: move clock-rate logic to separate function
Date: Mon, 21 Jul 2025 23:15:30 +0530
Message-ID: <20250721174532.14022-7-quic_ptalari@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1NyBTYWx0ZWRfXxnu7ynC4/fTj
 kOOPyjELgEPqGA+te5JKY+3woCcGDYSatVk5jApvDpmXUg/5WO/VupEzyqeQmkW+mKN26J0h6ji
 0QaRoBtyd9fW3iV9+I/IcS6frpLvvzyLSffzri2wkmw6q0ggN+aDSMJeatHtXOaAGAa7TrTETUt
 wRhFyh3tm+2upzsvIhyWyMmg2zfJWVdi5Cc0Hf7pbTk6HpI4I4ImRxu+7wRcWCTdCmnhleAR5L2
 a/88fotCIf4e+0IuQQqFbLUF0a8g89nyg1NDJWqS2mnKfJODcMu5WvdXpnMCctE9OUw9/jwZDgF
 Hblo2h+6lTplnnjwiPbUnHFj/yzXVKPGuR/IHmZ/yowpkqc7aNe17cCU4CYmjDq0IYqjA9vAtOz
 qiJl0bzWo5xgxN35y+xbS9ghe1HaT/O8or31WbimaOeZ8u7u1vQuw3/sD8vlzeGfbF8xbtpg
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687e7cfe cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=X08zvMDfRsL5Z2rP0xYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dbaFfeBTX1Ff49H39hB8-o5sVAnt-sCG
X-Proofpoint-ORIG-GUID: dbaFfeBTX1Ff49H39hB8-o5sVAnt-sCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210157

Facilitates future modifications within the new function,
leading to better readability and maintainability of the code.

Move the code that handles the actual logic of clock-rate
calculations to a separate function geni_serial_set_rate()
which enhances code readability.

Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v6 -> v7
From Bjorn:
- removed error log from qcom_geni_serial_set_termios().

v5 -> v6
- used "unsigned int" instead of "unsigned long" in newly
  added API function params to avoid the format specifier
  warnings.

v3 -> v4
- added version log after ---

v1 -> v2
- resolved build warnings for datatype format specifiers
- removed double spaces in log
---
 drivers/tty/serial/qcom_geni_serial.c | 52 ++++++++++++++++-----------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 45d9735247f8..81f385d900d0 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1314,27 +1314,14 @@ static unsigned long get_clk_div_rate(struct clk *clk, unsigned int baud,
 	return ser_clk;
 }
 
-static void qcom_geni_serial_set_termios(struct uart_port *uport,
-					 struct ktermios *termios,
-					 const struct ktermios *old)
+static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
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
-	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
+	unsigned int clk_div;
+	u32 ver, sampling_rate;
+	u32 ser_clk_cfg;
 
 	sampling_rate = UART_OVERSAMPLING;
 	/* Sampling rate is halved for IP versions >= 2.5 */
@@ -1348,7 +1335,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 		dev_err(port->se.dev,
 			"Couldn't find suitable clock rate for %u\n",
 			baud * sampling_rate);
-		return;
+		return -EINVAL;
 	}
 
 	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n",
@@ -1370,6 +1357,33 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
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
+	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
+
+	ret = geni_serial_set_rate(uport, baud);
+	if (ret)
+		return;
+
 	/* parity */
 	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
 	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
@@ -1437,8 +1451,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	writel(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
 	writel(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
 	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
-	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
-	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
 }
 
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
-- 
2.17.1


