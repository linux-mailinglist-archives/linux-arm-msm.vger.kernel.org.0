Return-Path: <linux-arm-msm+bounces-56100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26027AA08C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 218A38417CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386DD2BEC51;
	Tue, 29 Apr 2025 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QdjsghcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E922BF3DD;
	Tue, 29 Apr 2025 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923459; cv=none; b=Cthw4+jAPNJWx+qvePDz0cTvbhmI0rEquP93jEQcf41RORy0YxeHCx7/ob8KLJ2JGVDK6TY/DYUsUmxzBYMFE9GGDv+IllVvP1vGpPXk4fuFe0i2XpR4q1JJPXR45RcNLn75VX6yfydZiefKe9aHZT302mvuSTK2FPL0EaIlOeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923459; c=relaxed/simple;
	bh=UDh+3kR2l8Hobktele4ukXLIvQJGvebsy+/jMNbYe7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tJRpHV377mOyk6atIrbeb4qhm2FQk9CdgcmfMXqaxHNQUv3tnusBXC+WiC1LscOgu+gWyaaD1m9pFDURmQwnSdKhVrEFmFvDX0XZZb6fBqmtvLTMW7Ns/77r6XUjRKuaSs4w6YngUTpHSriRiZKwaqwb7od3re5m22wJM8hPGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QdjsghcB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA256Y001623;
	Tue, 29 Apr 2025 10:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WiQ0sJyCcVsqjIXdQQrwjNnnTgmfsc3LWTN
	A12p7fKo=; b=QdjsghcBjCZASsa7nC7DUb6wY9VVMBFEi244j15c5OlgUwJVOZG
	mKhk5rKfJ0QtK05zOFGT8Zo4jO2sVmvSBaLJyNr1JkaQwTjWYt+kBOU0LXizamN2
	Iv+AItJpP0ebG5Yb2dhQLHolmPk6A2/mt91w8gAU9NfeJhFk5Y8/DbUFzE72evNv
	4yAUIU7DgklPhVW4ehbB8XSnVW500iQzlpHEEGqQsBvc/LQosbl30GEhuL6938jO
	ESHpzrdh+dNP/thwU2xsMsx6r+REOBRcSSx25f4wGuXklkI2UVixyf+8YMu7fiE1
	/8EcsiPKlHUCr8URgxAZ5zOXDuUYaAxr07Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9m7aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:44:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAi6up006363;
	Tue, 29 Apr 2025 10:44:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 468rjkyvb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:44:06 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53TAi6KM006348;
	Tue, 29 Apr 2025 10:44:06 GMT
Received: from hu-devc-hyd-u20-c-new.qualcomm.com (hu-anupkulk-hyd.qualcomm.com [10.147.247.84])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 53TAi6aV006333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:44:06 +0000
Received: by hu-devc-hyd-u20-c-new.qualcomm.com (Postfix, from userid 4405423)
	id 5D338213F9; Tue, 29 Apr 2025 16:14:05 +0530 (+0530)
From: Anup Kulkarni <quic_anupkulk@quicinc.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, konradybcio@kernel.org,
        u.kleine-koenig@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Cc: andersson@kernel.org, quic_msavaliy@quicinc.com, quic_vdadhani@quicinc.com,
        Anup Kulkarni <quic_anupkulk@quicinc.com>
Subject: [PATCH] serial: qcom-geni: Enable support for half-duplex mode
Date: Tue, 29 Apr 2025 16:13:39 +0530
Message-Id: <20250429104339.321962-1-quic_anupkulk@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810ad7a cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=uzF8K4SHvOnUFRQP1mEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: d5KAZPwO1lbwmdHu524JGD758y0HQZip
X-Proofpoint-ORIG-GUID: d5KAZPwO1lbwmdHu524JGD758y0HQZip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3OSBTYWx0ZWRfX//WVroWCiJYT dmlWvbKbiSY8LbFGO1JVdIZ76yZ8t9UmYnA2DR4FYTGLsyjq8aPZpFzK6avXfreR25ExvW3tD+j Q40zl8YS0CLZRr7amXw9hIs+/OdY/98Sep2upaxr58WnYMHXhkd7Snhe+clPVggxHduWB1j4wHH
 oDroRojOUZq3kr0FqzvkG/XPm/RzYXeGef/WKELvuyXeDQuCMEEcn+SQgThF0nXKBg2wJT5jV6a IjYW0MdhkKpSjiBjg/wceG9GUI6ILtiFwgJIIxocbbyiHwttxVjNB/TCHcPkSdErbsB1jdZd1Qd 5tREx4ku03hslKj0X00/cs4EdTPK/t9b8yksrAceqvWKBUx+SjScI4b3HcyVEHxj0sAGM/yjiaU
 PZUNI8/93xj4lsuEY/FhPnbKL6h0kOUafl10mIMPjBHUuBnJmdEt/mH6Iih0h/TnVP8Qp3oC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1011 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290079

Currently the RTS pin is used as flow control in the UART controller by
default.For half-duplex modes, use the RTS pin for direction control to
prevent data collisions by allowing only one direction at a time. Utilize
the rs485 structure and callbacks in the serial core framework to support
half-duplex modes. Use the IOCTL value, 'TIOCSRS485', and the 'struct
serial_rs485' supported by the serial framework to implement support for
related callbacks. Enable RS485 mode with these callbacks.

Signed-off-by: Anup Kulkarni <quic_anupkulk@quicinc.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 61 ++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index a80ce7aaf309..ad3c63cecda0 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -190,6 +190,19 @@ static struct qcom_geni_serial_port qcom_geni_console_port = {
 	},
 };
 
+static const struct serial_rs485 qcom_geni_rs485_supported = {
+	.flags = SER_RS485_ENABLED | SER_RS485_RTS_AFTER_SEND | SER_RS485_RTS_ON_SEND,
+};
+
+static void qcom_geni_set_rts_pin(struct uart_port *uport, bool pin_state)
+{
+	u32 rfr = UART_MANUAL_RFR_EN;
+
+	/* Set the logical level of RTS GPIO pin based on the bool variable. */
+	rfr |= pin_state ? UART_RFR_NOT_READY : UART_RFR_READY;
+	writel(rfr, uport->membase + SE_UART_MANUAL_RFR);
+}
+
 static int qcom_geni_serial_request_port(struct uart_port *uport)
 {
 	struct platform_device *pdev = to_platform_device(uport->dev);
@@ -637,6 +650,7 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
 	struct tty_port *tport = &uport->state->port;
 	unsigned int xmit_size;
 	u8 *tail;
+	bool pin_state;
 	int ret;
 
 	if (port->tx_dma_addr)
@@ -648,6 +662,12 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
 	xmit_size = kfifo_out_linear_ptr(&tport->xmit_fifo, &tail,
 			UART_XMIT_SIZE);
 
+	if (uport->rs485.flags & SER_RS485_ENABLED) {
+	/* For RS485 mode, the RTS can be set/cleared before transmission */
+		pin_state = !!(uport->rs485.flags & SER_RS485_RTS_ON_SEND);
+		qcom_geni_set_rts_pin(uport, pin_state);
+	}
+
 	qcom_geni_serial_setup_tx(uport, xmit_size);
 
 	ret = geni_se_tx_dma_prep(&port->se, tail, xmit_size,
@@ -1017,6 +1037,7 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	u32 dma_rx_status;
 	struct uart_port *uport = dev;
 	bool drop_rx = false;
+	bool pin_state;
 	struct tty_port *tport = &uport->state->port;
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 
@@ -1055,8 +1076,17 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	}
 
 	if (dma) {
-		if (dma_tx_status & TX_DMA_DONE)
+		if (dma_tx_status & TX_DMA_DONE) {
 			qcom_geni_serial_handle_tx_dma(uport);
+			// Check if RS485 mode is enabled
+			if (uport->rs485.flags & SER_RS485_ENABLED) {
+				// Determine the RTS pin state based on the
+				// RS485 RTS_AFTER_SEND flag.
+				pin_state = !!(uport->rs485.flags & SER_RS485_RTS_AFTER_SEND);
+				// Set or clear the RTS pin according to the determined state
+				qcom_geni_set_rts_pin(uport, pin_state);
+		}
+	}
 
 		if (dma_rx_status) {
 			if (dma_rx_status & RX_RESET_DONE)
@@ -1594,6 +1624,29 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 	}
 }
 
+/**
+ * qcom_geni_rs485_config - Configure RS485 settings for the UART port
+ * @uport: Pointer to the UART port structure
+ * @termios: Pointer to the termios structure
+ * @rs485: Pointer to the RS485 configuration structure
+ *
+ * This function configures the RTS (Request to Send) pin behavior for RS485 mode.
+ * When RS485 mode is enabled, the RTS pin is kept in the ACTIVE state.
+ * When RS485 mode is disabled, the RTS pin is controlled by the QUP hardware for auto flow control.
+ *
+ * Return: Always returns 0.
+ */
+
+static int qcom_geni_rs485_config(struct uart_port *uport,
+				  struct ktermios *termios, struct serial_rs485 *rs485)
+{
+	if (rs485->flags & SER_RS485_ENABLED)
+		qcom_geni_set_rts_pin(uport, true); // Set RTS pin to ACTIVE state
+	else
+		writel(0, uport->membase + SE_UART_MANUAL_RFR); // Revert to auto flow control
+	return 0;
+}
+
 static const struct uart_ops qcom_geni_console_pops = {
 	.tx_empty = qcom_geni_serial_tx_empty,
 	.stop_tx = qcom_geni_serial_stop_tx_fifo,
@@ -1686,6 +1739,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return -EINVAL;
 	uport->mapbase = res->start;
 
+	uport->rs485_config = qcom_geni_rs485_config;
+	uport->rs485_supported = qcom_geni_rs485_supported;
 	port->tx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
@@ -1751,6 +1806,10 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = uart_get_rs485_mode(uport);
+	if (ret)
+		return ret;
+
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
 		return ret;
-- 
2.25.1


