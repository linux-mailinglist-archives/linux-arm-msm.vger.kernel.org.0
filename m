Return-Path: <linux-arm-msm+bounces-56571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F4BAA788E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53C5C3B607B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753D0264A7A;
	Fri,  2 May 2025 17:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hLkGIAvX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932161AB531;
	Fri,  2 May 2025 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746206152; cv=none; b=Dy/rnMUN09DRng1+0Bcmukc0YeUU8C6tAq6Zpx3YX55cwnEA6OwGOwcdFoA2Fbfsy6OZWZjyL6n+TnOafIgOhOx5/MZNs2B4XjKOZR0BjMwe45cxI2taFdD7UXdYUtoZhoy+X8iXx4ydEWLnsBMv9Ztz5/OXwzklCAh003hkkwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746206152; c=relaxed/simple;
	bh=1Qc1ZJghWFEVujSTLgEM8e+3sKwTGPKINd/UmOKgfS8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qLPGDWNjtSj0C9++jI/Eu3uPQZ6/Pe9LDiejee04lykimQsKXwnZP3S9bb+PFXEeYQS9pGamcgopIcWOV5APoLj2nZ9cVHcQ7yoLgm1IELHlhKWtVetbbahsRb19Qfsawdi450HM8ceFwR8r3kdd/SjlfDbielL9t1DbEhrCrpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hLkGIAvX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DcCul015816;
	Fri, 2 May 2025 17:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QZmbxUxX5Kqlmq315CgpIE/H
	BgNEci5v44uGJybiTdA=; b=hLkGIAvXBReQ+AJ2w+x7bXHcN50Mz1qJAlXwuf6u
	Ow/CXxcT1HKMYo5o+qBeflhJN4bxedOh981OWeTdYSBUGaWts5DGk8cuzbnsh4sr
	DTMUslKEMs2kIJPRd8cc1MG8431t8p6H95S7b6Kt+CDrzgLA66mzMmY7+/zI/tvX
	EvH1aLgRdIXMDKtkbUAYPtd4xK5T9wTRd3M303fCSYnBjaM7E0bEZr1Spt4FLj1E
	7I+nZi0roqg11CmQ6WHrQdI7rJ9+E5i8jRLK/KCNUABbVDeSby5cuje8/PBQd/Qp
	q/BtX0NB/rfAmz+ZHSgy8LplsIDL/bECJpy7oSziAo2p4w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u40wm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 17:15:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542HFWU0022943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 17:15:32 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 2 May 2025 10:15:26 -0700
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
Subject: [PATCH v4 8/8] serial: qcom-geni: Enable Serial on SA8255p Qualcomm platforms
Date: Fri, 2 May 2025 22:44:17 +0530
Message-ID: <20250502171417.28856-9-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=6814fdc2 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=_gOkJu00RtHYCxNnkZMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: XfzqmfvP4Jzqn5Eukud4I7o-GwOaJtMs
X-Proofpoint-ORIG-GUID: XfzqmfvP4Jzqn5Eukud4I7o-GwOaJtMs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzOCBTYWx0ZWRfX/G9L3dmZR/rj TJcOCWv2Pjau0AT8gtE/EaYZpWbBRRovSq/k9QQwO6Lz18HMTyXl+DJuO1p9zisgeYUgw4nmfQp xm8u/LSFfQKNp/RuWD5xK85DUti4nPDJz85pqKQ79zx2OaVih0xFUhQTI+1v1TURZbc9v+oX+CJ
 GGIcuhfp+XZsN5EmaWwDw7gQhIZ5YTUGp/3bdJSMU5XKXhvWKdWntQxY53yywvUv0prvHF/xshx T9I+45EzIU0l/d8p7x12/AHLFabekgxGXJ/SlKEPHzSigj/IoLv1FWPY2L2oj7/zYOACWwg6MTK 6iUvrUiMnB27yOv1qVQO5ezOlurj48tqRh8SyxS4AlM2PKU53JVwsnc9Y+kgNDk6OU5Rmq2Y6W9
 3QAEsOIS8yC3NK1jtOnBzNzle3QfcWttX03xNIiZ6gpPQxR27aNtBaeGBQwL3UC2GK3A4o7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020138

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages UART baud rates, with each baud
rate represented by a performance level. The driver uses the
dev_pm_opp_set_level() API to request the desired baud rate by
specifying the performance level.

Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v3 -> v4
- renamed callback function names to resources_init, set_rate and
  power_state
---
 drivers/tty/serial/qcom_geni_serial.c | 150 +++++++++++++++++++++++---
 1 file changed, 135 insertions(+), 15 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 9d698c354510..77bca899e913 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -11,6 +11,7 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -99,10 +100,16 @@
 #define DMA_RX_BUF_SIZE		2048
 
 static DEFINE_IDA(port_ida);
+#define DOMAIN_IDX_POWER	0
+#define DOMAIN_IDX_PERF		1
 
 struct qcom_geni_device_data {
 	bool console;
 	enum geni_se_xfer_mode mode;
+	struct dev_pm_domain_attach_data pd_data;
+	int (*resources_init)(struct uart_port *uport);
+	int (*set_rate)(struct uart_port *uport, unsigned long clk_freq);
+	int (*power_state)(struct uart_port *uport, bool state);
 };
 
 struct qcom_geni_private_data {
@@ -140,6 +147,7 @@ struct qcom_geni_serial_port {
 
 	struct qcom_geni_private_data private_data;
 	const struct qcom_geni_device_data *dev_data;
+	struct dev_pm_domain_list *pd_list;
 };
 
 static const struct uart_ops qcom_geni_console_pops;
@@ -1331,6 +1339,42 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned long baud)
 	return 0;
 }
 
+static int geni_serial_set_level(struct uart_port *uport, unsigned long baud)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	struct device *perf_dev = port->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	/*
+	 * The performance protocol sets UART communication
+	 * speeds by selecting different performance levels
+	 * through the OPP framework.
+	 *
+	 * Supported perf levels for baudrates in firmware are below
+	 * +---------------------+--------------------+
+	 * |  Perf level value   |  Baudrate values   |
+	 * +---------------------+--------------------+
+	 * |      300            |      300           |
+	 * |      1200           |      1200          |
+	 * |      2400           |      2400          |
+	 * |      4800           |      4800          |
+	 * |      9600           |      9600          |
+	 * |      19200          |      19200         |
+	 * |      38400          |      38400         |
+	 * |      57600          |      57600         |
+	 * |      115200         |      115200        |
+	 * |      230400         |      230400        |
+	 * |      460800         |      460800        |
+	 * |      921600         |      921600        |
+	 * |      2000000        |      2000000       |
+	 * |      3000000        |      3000000       |
+	 * |      3200000        |      3200000       |
+	 * |      4000000        |      4000000       |
+	 * +---------------------+--------------------+
+	 */
+
+	return dev_pm_opp_set_level(perf_dev, baud);
+}
+
 static void qcom_geni_serial_set_termios(struct uart_port *uport,
 					 struct ktermios *termios,
 					 const struct ktermios *old)
@@ -1349,7 +1393,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
 
-	ret = geni_serial_set_rate(uport, baud);
+	ret = port->dev_data->set_rate(uport, baud);
 	if (ret) {
 		dev_err(port->se.dev,
 			"%s: Failed to set baud:%u ret:%d\n",
@@ -1640,8 +1684,27 @@ static int geni_serial_resources_on(struct uart_port *uport)
 	return 0;
 }
 
-static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
+static int geni_serial_resource_state(struct uart_port *uport, bool power_on)
 {
+	return power_on ? geni_serial_resources_on(uport) : geni_serial_resources_off(uport);
+}
+
+static int geni_serial_pwr_init(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	int ret;
+
+	ret = dev_pm_domain_attach_list(port->se.dev,
+					&port->dev_data->pd_data, &port->pd_list);
+	if (ret <= 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int geni_serial_resource_init(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	int ret;
 
 	port->se.clk = devm_clk_get(port->se.dev, "se");
@@ -1680,7 +1743,6 @@ static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
 static void qcom_geni_serial_pm(struct uart_port *uport,
 		unsigned int new_state, unsigned int old_state)
 {
-
 	/* If we've never been called, treat it as off */
 	if (old_state == UART_PM_STATE_UNDEFINED)
 		old_state = UART_PM_STATE_OFF;
@@ -1774,13 +1836,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->se.dev = &pdev->dev;
 	port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
 
-	ret = geni_serial_resource_init(port);
+	ret = port->dev_data->resources_init(uport);
 	if (ret)
 		return ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
+	if (!res) {
+		ret = -EINVAL;
+		goto error;
+	}
+
 	uport->mapbase = res->start;
 
 	port->tx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
@@ -1790,19 +1855,26 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (!data->console) {
 		port->rx_buf = devm_kzalloc(uport->dev,
 					    DMA_RX_BUF_SIZE, GFP_KERNEL);
-		if (!port->rx_buf)
-			return -ENOMEM;
+		if (!port->rx_buf) {
+			ret = -ENOMEM;
+			goto error;
+		}
 	}
 
 	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
 			"qcom_geni_serial_%s%d",
 			uart_console(uport) ? "console" : "uart", uport->line);
-	if (!port->name)
-		return -ENOMEM;
+	if (!port->name) {
+		ret = -ENOMEM;
+		goto error;
+	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto error;
+	}
+
 	uport->irq = irq;
 	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
 
@@ -1824,7 +1896,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			IRQF_TRIGGER_HIGH, port->name, uport);
 	if (ret) {
 		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
-		return ret;
+		goto error;
 	}
 
 	pm_runtime_enable(port->se.dev);
@@ -1849,6 +1921,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 
 error:
 	pm_runtime_disable(port->se.dev);
+	dev_pm_domain_detach_list(port->pd_list);
 	return ret;
 }
 
@@ -1863,22 +1936,31 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	ida_free(&port_ida, uport->line);
 	pm_runtime_disable(port->se.dev);
 	uart_remove_one_port(drv, &port->uport);
+	dev_pm_domain_detach_list(port->pd_list);
 }
 
 static int qcom_geni_serial_runtime_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
+	int ret = 0;
 
-	return geni_serial_resources_off(uport);
+	if (port->dev_data->power_state)
+		ret = port->dev_data->power_state(uport, false);
+
+	return ret;
 };
 
 static int qcom_geni_serial_runtime_resume(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
+	int ret = 0;
+
+	if (port->dev_data->power_state)
+		ret = port->dev_data->power_state(uport, true);
 
-	return geni_serial_resources_on(uport);
+	return ret;
 };
 
 static int qcom_geni_serial_suspend(struct device *dev)
@@ -1916,11 +1998,41 @@ static int qcom_geni_serial_resume(struct device *dev)
 static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
+	.resources_init = geni_serial_resource_init,
+	.set_rate = geni_serial_set_rate,
+	.power_state = geni_serial_resource_state,
 };
 
 static const struct qcom_geni_device_data qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
+	.resources_init = geni_serial_resource_init,
+	.set_rate = geni_serial_set_rate,
+	.power_state = geni_serial_resource_state,
+};
+
+static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
+	.console = true,
+	.mode = GENI_SE_FIFO,
+	.pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_names = (const char*[]) { "power", "perf" },
+		.num_pd_names = 2,
+	},
+	.resources_init = geni_serial_pwr_init,
+	.set_rate = geni_serial_set_level,
+};
+
+static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
+	.console = false,
+	.mode = GENI_SE_DMA,
+	.pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_names = (const char*[]) { "power", "perf" },
+		.num_pd_names = 2,
+	},
+	.resources_init = geni_serial_pwr_init,
+	.set_rate = geni_serial_set_level,
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
@@ -1934,10 +2046,18 @@ static const struct of_device_id qcom_geni_serial_match_table[] = {
 		.compatible = "qcom,geni-debug-uart",
 		.data = &qcom_geni_console_data,
 	},
+	{
+		.compatible = "qcom,sa8255p-geni-debug-uart",
+		.data = &sa8255p_qcom_geni_console_data,
+	},
 	{
 		.compatible = "qcom,geni-uart",
 		.data = &qcom_geni_uart_data,
 	},
+	{
+		.compatible = "qcom,sa8255p-geni-uart",
+		.data = &sa8255p_qcom_geni_uart_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_geni_serial_match_table);
-- 
2.17.1


