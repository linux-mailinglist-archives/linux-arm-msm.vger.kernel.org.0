Return-Path: <linux-arm-msm+bounces-65952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE06B0CA1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26D131AA4DEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F02A2E49BD;
	Mon, 21 Jul 2025 17:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BkY/cPuf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E72E2F0F;
	Mon, 21 Jul 2025 17:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753120018; cv=none; b=hfM6M+T1h7qY0wuGfwd0pBlHBQ9hZ4L9TNlU/FLfoU3ZNNMUU3XRJOtiU8zTIBOssBhqGCY0nUMFDyCrkFJL3jUdsBzk/gQhpZfKemgAMOcJEGdsinxh2PCKmP4r1cE1u4lkCLzTlHwFIGnLGJGehPTzwBXMlBQGIZu+cKKs/CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753120018; c=relaxed/simple;
	bh=JCqtKP8Z8UzXXMszbW13alImXtoUJe9Ub4ybEnf4ua8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hh5IjfB2UB1D65kr+NLy3/hEZk+P0fhAVVwWWb9lCZ1yAmsNTw92lf40Fir5U40iseYyrHN3RG4mB9Ds/bQYFwWT9vsubuP5TbX+oQYwflNqos8ze8AuX36sW9jthIxZ9oKc1Wkhe7g4wgMk+2ZoFHM62aju1d4jq1uvHmUSWkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BkY/cPuf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LEeuPL012535;
	Mon, 21 Jul 2025 17:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DVUnieK556z9PyoXJkOZOy8B
	ApLsgLArjO4yMNZCWm0=; b=BkY/cPufM1xeJ3i7KHI1wBd8XPmfcLh6XUJTG0l0
	AT6LQaXGpJXXi4URhKM8RgV5EpqKHwi9uEiwkfzAWI+Doesnq/yrt04d+dESzWWz
	1C1w/cvlC8bBb/xrbURHKPtO3He22GaIdV5Iq/nhzHV6YHIHeiFkG6orKtMAQNic
	Icv2RnulTPtncFC+76myo0bxn+K72T+uz+zobDOF+xwIoRh4KQYdCUbiOpkbcpPa
	SpFtljimz4aCS/qHVi8Kb+jIL1csPS9UozuJ6ipzzEWNFjUGWRFoqebI23f4sN7u
	GvW8IRqKedcQx7fmjwgrWB6UT5AjsNys7KQEQ/F0ab+wUA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6gwbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56LHkoxX002624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:50 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 21 Jul 2025 10:46:45 -0700
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
Subject: [PATCH v7 8/8] serial: qcom-geni: Enable Serial on SA8255p Qualcomm platforms
Date: Mon, 21 Jul 2025 23:15:32 +0530
Message-ID: <20250721174532.14022-9-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687e7d0b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=TwmaSWGEdcevDZ0QsRoA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BbarhGipFW--8n6Xbd7mdaW28vaBf2Kg
X-Proofpoint-GUID: BbarhGipFW--8n6Xbd7mdaW28vaBf2Kg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1MSBTYWx0ZWRfXxiAqft7yOrhc
 zyvpkNB45vZrSSGiHjZ1xslABGwSi38fcD+grHfiKaNQbLFxNrkFc9g6vVNHlShfP/BYB0Ws5mH
 WyayeZksycihz3TTZeSN/gKxLbb8QnBtG32kAB3JvHSndnsQrtaIgPK0lWPFblU0pvXKlpMranW
 HHs1aMzC8c51Y2w8nZr2WSFOARU3yGeL4myfFzKpOPpHCIvlJ1pRM/Lj6JVLs9b353oJeIiwbUJ
 8fQCu8u7sXNN4fnLY1lB/IEPAOzGjqYf/3dFdXjoVegxfv49ONIWOYr3DAVlbz6QPray7gX1lhu
 GO3b5HzyG/5w+rnYdPiI4/yn5ccoiVcqktiP+JJ524UYHQdP+2VkhVrR42QhP0SXZQ7afz7lfJ6
 KrL1JX6aOy6DTZGXm75tA1tveGh/GCBU9GZLM+VY1eDTevy5gXDwUzNGlI6pu5sChbnE7Rlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210151

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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v5 -> v6
- added reviewed-by tag in commit
- used "unsigned int" instead of "unsigned long" in set_rate callback
  and geni_serial_set_level to avoid build warnings.

v3 -> v4
- renamed callback function names to resources_init, set_rate and
  power_state
---
 drivers/tty/serial/qcom_geni_serial.c | 156 +++++++++++++++++++++++---
 1 file changed, 140 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index aa08de659e34..32ec632fd080 100644
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
+	int (*set_rate)(struct uart_port *uport, unsigned int baud);
+	int (*power_state)(struct uart_port *uport, bool state);
 };
 
 struct qcom_geni_private_data {
@@ -140,6 +147,7 @@ struct qcom_geni_serial_port {
 
 	struct qcom_geni_private_data private_data;
 	const struct qcom_geni_device_data *dev_data;
+	struct dev_pm_domain_list *pd_list;
 };
 
 static const struct uart_ops qcom_geni_console_pops;
@@ -1362,6 +1370,42 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 	return 0;
 }
 
+static int geni_serial_set_level(struct uart_port *uport, unsigned int baud)
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
@@ -1380,7 +1424,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
 
-	ret = geni_serial_set_rate(uport, baud);
+	ret = port->dev_data->set_rate(uport, baud);
 	if (ret)
 		return;
 
@@ -1667,8 +1711,27 @@ static int geni_serial_resources_off(struct uart_port *uport)
 	return 0;
 }
 
-static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
+static int geni_serial_resource_state(struct uart_port *uport, bool power_on)
+{
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
 {
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	int ret;
 
 	port->se.clk = devm_clk_get(port->se.dev, "se");
@@ -1819,13 +1882,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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
 
 	uport->rs485_config = qcom_geni_rs485_config;
@@ -1837,19 +1903,26 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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
 
@@ -1871,7 +1944,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			IRQF_TRIGGER_HIGH, port->name, uport);
 	if (ret) {
 		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
-		return ret;
+		goto error;
 	}
 
 	ret = uart_get_rs485_mode(uport);
@@ -1882,7 +1955,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
-		return ret;
+		goto error;
 
 	if (port->wakeup_irq > 0) {
 		device_init_wakeup(&pdev->dev, true);
@@ -1892,11 +1965,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			device_init_wakeup(&pdev->dev, false);
 			ida_free(&port_ida, uport->line);
 			uart_remove_one_port(drv, uport);
-			return ret;
+			goto error;
 		}
 	}
 
 	return 0;
+
+error:
+	dev_pm_domain_detach_list(port->pd_list);
+	return ret;
 }
 
 static void qcom_geni_serial_remove(struct platform_device *pdev)
@@ -1909,22 +1986,31 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, false);
 	ida_free(&port_ida, uport->line);
 	uart_remove_one_port(drv, &port->uport);
+	dev_pm_domain_detach_list(port->pd_list);
 }
 
 static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
+	int ret = 0;
+
+	if (port->dev_data->power_state)
+		ret = port->dev_data->power_state(uport, false);
 
-	return geni_serial_resources_off(uport);
+	return ret;
 }
 
 static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
+	int ret = 0;
 
-	return geni_serial_resources_on(uport);
+	if (port->dev_data->power_state)
+		ret = port->dev_data->power_state(uport, true);
+
+	return ret;
 }
 
 static int qcom_geni_serial_suspend(struct device *dev)
@@ -1962,11 +2048,41 @@ static int qcom_geni_serial_resume(struct device *dev)
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
@@ -1980,10 +2096,18 @@ static const struct of_device_id qcom_geni_serial_match_table[] = {
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


