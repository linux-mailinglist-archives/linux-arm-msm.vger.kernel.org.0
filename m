Return-Path: <linux-arm-msm+bounces-60135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E676FACC4D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 13:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECB6C1893611
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 11:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5641D22157E;
	Tue,  3 Jun 2025 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hmc6oqy0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90574F5E0;
	Tue,  3 Jun 2025 11:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948531; cv=none; b=toH9bbJne1frdjupSwgxPH/slRvbMN9OkaeE5NiGSfVnGOY5XT9CdCCKDj8Mlx4j3avVtHttuHVC7UsAsPhrsxVkIb9RlafWGyfK+9mtJpDoAhSGykd+L2bHKzzddWPGzQLb43CINyjeWrANf2ptWtPk/qyjBAtQHmkuerwvmxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948531; c=relaxed/simple;
	bh=Hy23uIhlDlMT0R2/22msnNuNs73bzDT0kNIbAjbkOhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dj3+SVmARkwHdX2FnMJqZjxeRGAIZhehAqRThEg4ukUlZGVNMtBJmfwZjNvcYHCc7eCW3Dpb3srM2XWi8/m3e1bqqBtdo0LR4IBb4tn6eR7J2JhejLDDWyUN1lPp1pgtyJ7gwtsGXLGbKkDM6l9vVSGC/mJzm0YVOoSO9KHpaMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hmc6oqy0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JLSw006553;
	Tue, 3 Jun 2025 11:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cUXobLX01f4ah+C4d5sJY6r5GpZcGfEVZSj
	sC9TFVYE=; b=hmc6oqy0RRXwGmWn2v2Wqz2vKiS1JlhbIGXditRkJK/KFlgqHCI
	QQoRXj0Nbf5H8nQsoFxzJ73ivi2V0j5WzLWmO0V6B6OCyuYTDc449v4zJEQobXLW
	v75nJzt4nJSkj8kl3yE1jisf3lmSZ1AOCXcK0nppWRbraRakkoRzRzp5SkGbC8Sv
	EaDDgoKmJq4al7fNkow5hWokDV8AZeqCJwDnIfcOzH2OV07IRrtZbxUvAVz2NFv4
	92cXH7CPSzoaG013e+3fMhzrSCgCHpZOUPWkBa75r/qCLnXTubQNS4AHQR0URY3A
	v5ILgMzwFmhtp+8uL3/sEzrGtLwFOEI3HZQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8stade-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:02:05 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 553B215B003911;
	Tue, 3 Jun 2025 11:02:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46ytuku31w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:02:01 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 553B213l003897;
	Tue, 3 Jun 2025 11:02:01 GMT
Received: from hu-devc-hyd-u20-c-new.qualcomm.com (hu-anupkulk-hyd.qualcomm.com [10.147.247.84])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 553B20AF003896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:02:01 +0000
Received: by hu-devc-hyd-u20-c-new.qualcomm.com (Postfix, from userid 4405423)
	id CECEB2142F; Tue,  3 Jun 2025 16:31:59 +0530 (+0530)
From: Anup Kulkarni <quic_anupkulk@quicinc.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc: johan+linaro@kernel.org, dianders@chromium.org, konradybcio@kernel.org,
        quic_vdadhani@quicinc.com, quic_msavaliy@quicinc.com,
        Anup Kulkarni <quic_anupkulk@quicinc.com>
Subject: [PATCH v2] serial: qcom-geni: Enable support for half-duplex mode
Date: Tue,  3 Jun 2025 16:31:45 +0530
Message-Id: <20250603110145.3835111-1-quic_anupkulk@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 3DwDeCIK6P22olIElTJz2xRgrUSokpsE
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=683ed62d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=9ivjoQBzLYyzMPRRWNoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3DwDeCIK6P22olIElTJz2xRgrUSokpsE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5NiBTYWx0ZWRfX0GXlwN2fDFtY
 119uqjMPhbtHE+7cqeaWTiA2zLDo8t7Xb9COMVq/jzQ68fTk6yvs8TbpILjPNuGTkVseDsDFAfj
 I5QAn5Iz8cH/bxwm7IP2ZyiKRxThtySYhmCnU0PbWzN3NRrS7+yLK/ABxIks1sHTsTHxbnWhH5F
 qsaBsWIRnIlpgfnRpvgK8LdpC+J1DSnIRtU2VVjkb4PGaEwGoXa5OvRVbddxwPZHsqkQs9oh2dK
 BxgzTJYiRIzbZ+oLRCBtZP1ALIZ2beJOO8vp4oBWJQtQ7maPSWYhS+ch/OCo93tiqEEj5qOLKL5
 KA3hlKmW4tSSJHL8BjlwVi+xrMFkXDlEdAvK5kByJmfyv6ycT0ldH6R8oek0FpIPGTOhN6uZBhP
 A6GMw5sGV0Vde2YKspTtgAaaBIjFh+HeEV1fV7zldWqHpaQaIbFyKWMopj/u2EYsqz11vfxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030096

Enable the use of the RTS pin for direction control in half-duplex modes to
prevent data collisions. Utilize the rs485 structure and callbacks in the
serial core framework to support half-duplex modes. Implement support for
the TIOCSRS485 IOCTL value and the struct serial_rs485.

Signed-off-by: Anup Kulkarni <quic_anupkulk@quicinc.com>

---
v1 -> v2
- v1: https://lore.kernel.org/all/20250429104339.321962-1-quic_anupkulk@quicinc.com/
- Removed unnecessary comments.
- Check RS485 enabled flag only once in a single place.
---
 drivers/tty/serial/qcom_geni_serial.c | 57 ++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0293b6210aa6..08df1745dabc 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -192,6 +192,33 @@ static struct qcom_geni_serial_port qcom_geni_console_port = {
 	},
 };
 
+static const struct serial_rs485 qcom_geni_rs485_supported = {
+	.flags = SER_RS485_ENABLED | SER_RS485_RTS_AFTER_SEND | SER_RS485_RTS_ON_SEND,
+};
+
+/**
+ * qcom_geni_set_rs485_mode - Set RTS pin state for RS485 mode
+ * @uport: UART port
+ * @flag: RS485 flag to determine RTS polarity
+ *
+ * Enables manual RTS control for RS485. Sets RTS to READY or NOT_READY
+ * based on the specified flag if RS485 mode is enabled.
+ */
+static void qcom_geni_set_rs485_mode(struct uart_port *uport, u32 flag)
+{
+	if (!(uport->rs485.flags & SER_RS485_ENABLED))
+		return;
+
+	u32 rfr = UART_MANUAL_RFR_EN;
+
+	if (uport->rs485.flags & flag)
+		rfr |= UART_RFR_NOT_READY;
+	else
+		rfr |= UART_RFR_READY;
+
+	writel(rfr, uport->membase + SE_UART_MANUAL_RFR);
+}
+
 static int qcom_geni_serial_request_port(struct uart_port *uport)
 {
 	struct platform_device *pdev = to_platform_device(uport->dev);
@@ -664,6 +691,8 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
 	xmit_size = kfifo_out_linear_ptr(&tport->xmit_fifo, &tail,
 			UART_XMIT_SIZE);
 
+	qcom_geni_set_rs485_mode(uport, SER_RS485_RTS_ON_SEND);
+
 	qcom_geni_serial_setup_tx(uport, xmit_size);
 
 	ret = geni_se_tx_dma_prep(&port->se, tail, xmit_size,
@@ -1071,8 +1100,10 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	}
 
 	if (dma) {
-		if (dma_tx_status & TX_DMA_DONE)
+		if (dma_tx_status & TX_DMA_DONE) {
 			qcom_geni_serial_handle_tx_dma(uport);
+			qcom_geni_set_rs485_mode(uport, SER_RS485_RTS_AFTER_SEND);
+	}
 
 		if (dma_rx_status) {
 			if (dma_rx_status & RX_RESET_DONE)
@@ -1610,6 +1641,24 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 	}
 }
 
+/**
+ * qcom_geni_rs485_config - Configure RS485 settings for the UART port
+ * @uport: Pointer to the UART port structure
+ * @termios: Pointer to the termios structure
+ * @rs485: Pointer to the RS485 configuration structure
+ * This function configures the RTS (Request to Send) pin behavior for RS485 mode.
+ * When RS485 mode is enabled, the RTS pin is kept in default ACTIVE HIGH state.
+ * Return: Always returns 0.
+ */
+
+static int qcom_geni_rs485_config(struct uart_port *uport,
+				  struct ktermios *termios, struct serial_rs485 *rs485)
+{
+	qcom_geni_set_rs485_mode(uport, SER_RS485_ENABLED);
+
+	return 0;
+}
+
 static const struct uart_ops qcom_geni_console_pops = {
 	.tx_empty = qcom_geni_serial_tx_empty,
 	.stop_tx = qcom_geni_serial_stop_tx_fifo,
@@ -1702,6 +1751,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return -EINVAL;
 	uport->mapbase = res->start;
 
+	uport->rs485_config = qcom_geni_rs485_config;
+	uport->rs485_supported = qcom_geni_rs485_supported;
 	port->tx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
@@ -1767,6 +1818,10 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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


