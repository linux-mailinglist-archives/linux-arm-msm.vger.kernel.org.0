Return-Path: <linux-arm-msm+bounces-52585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F1AA72A63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 08:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB750188EADE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 07:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102B018A959;
	Thu, 27 Mar 2025 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CSPzK7+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76352C2C8;
	Thu, 27 Mar 2025 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743059246; cv=none; b=hmZClJmot9xFoIcWaWtq+iW04MB6AbudlK8JXZRDid104d3B3+ktnlVmuq0rUoCs9pGuMR9jrCxLoU+qLJa/WtL3OOwnm5p46qCi5KzUaIeGN+P+uCI31SiqlricYteK+DFcWdGccTjbIK7T/GF2QSToCmceoQDRU6LXTzZbU1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743059246; c=relaxed/simple;
	bh=xaNpSzlA8vnSzY7L472f/Xh2CuCuTsbP3PGONzuzNnw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b3/OORWrEZFzMuNKlGsVXnpGBREzUEu770fl9tOdKeNB/IBHupCKExfZvHn0rvGYoHX+FzxfGewcEaf+pw7DK7tEH5nkAUQGNfrP+8OUx3XNTGA1jQ5aQc8A1ZA/o6rNrLhvxjgnEEH3k01Ew1psLgXPsZ1A/qyc0uVUT3Xeqwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CSPzK7+U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jVhW011085;
	Thu, 27 Mar 2025 07:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jjZex0ERsjMb11QA+nT30n9BbC5mztZh6N6
	peJ5yM4E=; b=CSPzK7+UXjyM8WrUzi2Beg206tcbBLaIE/AQNGcTSuu/tRqk5R9
	83cir4SbTY+i7LvuS6Sggwlgz3UD2lcRfBq+5Z1+8pN7jffezx6YSLzBTwZEh0mn
	/ZGvN56yMOzmBiKqlBDstApjifv8vIrPEXOsRUpmeojzz5N0W65w1J8reJz9mQxE
	67hBESQJlutuOPI9fLAAc3ZIcChWZoBqC2bZd+BwQpvUQI+nVKvJanFBVPMlyUv0
	l2KgyWYYY4OAdl5fomzLXns8wYfi1K5nXmUbu8Z6eSLT26EQgdlxI9r1vBqgGWgJ
	w25wxwodY7zBeAseTXoU6Ff7B4xLSG/Xn/Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0kqg76c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 07:07:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52R77E4v022311;
	Thu, 27 Mar 2025 07:07:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45hp9mm1dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 07:07:14 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52R77EE3022306;
	Thu, 27 Mar 2025 07:07:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 52R77EoU022304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 07:07:14 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id BF2EA571; Thu, 27 Mar 2025 12:37:13 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v2] serial: qcom-geni: Remove alias dependency from qcom serial driver
Date: Thu, 27 Mar 2025 12:37:11 +0530
Message-Id: <20250327070711.2585887-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: _wYxUXHJgiVCKKcBiDMDtkl5ZaEL2juu
X-Authority-Analysis: v=2.4 cv=FrcF/3rq c=1 sm=1 tr=0 ts=67e4f927 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Pl0mjoXh0q4OY_cU_gwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _wYxUXHJgiVCKKcBiDMDtkl5ZaEL2juu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270045

The absence of an alias in the device tree results in an invalid line
number, causing the driver probe to fail for GENI serial.

To prevent probe failures, dynamically assign line numbers if an alias is
not present in the device tree for non-console ports.

Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---

v1 -> v2:

- Used IDA APIs instead of IDR APIs.
- Updated commit log.

v1 Link: https://lore.kernel.org/lkml/2025030758-efficient-pledge-ba4c@gregkh/T/
---
---
 drivers/tty/serial/qcom_geni_serial.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index a80ce7aaf309..0293b6210aa6 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -98,6 +98,8 @@
 
 #define DMA_RX_BUF_SIZE		2048
 
+static DEFINE_IDA(port_ida);
+
 struct qcom_geni_device_data {
 	bool console;
 	enum geni_se_xfer_mode mode;
@@ -253,10 +255,24 @@ static struct qcom_geni_serial_port *get_port_from_line(int line, bool console)
 	struct qcom_geni_serial_port *port;
 	int nr_ports = console ? GENI_UART_CONS_PORTS : GENI_UART_PORTS;
 
-	if (line < 0 || line >= nr_ports)
-		return ERR_PTR(-ENXIO);
+	if (console) {
+		if (line < 0 || line >= nr_ports)
+			return ERR_PTR(-ENXIO);
+
+		port = &qcom_geni_console_port;
+	} else {
+		int max_alias_num = of_alias_get_highest_id("serial");
+
+		if (line < 0 || line >= nr_ports)
+			line = ida_alloc_range(&port_ida, max_alias_num + 1, nr_ports, GFP_KERNEL);
+		else
+			line = ida_alloc_range(&port_ida, line, nr_ports, GFP_KERNEL);
+
+		if (line < 0)
+			return ERR_PTR(-ENXIO);
 
-	port = console ? &qcom_geni_console_port : &qcom_geni_uart_ports[line];
+		port = &qcom_geni_uart_ports[line];
+	}
 	return port;
 }
 
@@ -1761,6 +1777,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 						port->wakeup_irq);
 		if (ret) {
 			device_init_wakeup(&pdev->dev, false);
+			ida_free(&port_ida, uport->line);
 			uart_remove_one_port(drv, uport);
 			return ret;
 		}
@@ -1772,10 +1789,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 static void qcom_geni_serial_remove(struct platform_device *pdev)
 {
 	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
+	struct uart_port *uport = &port->uport;
 	struct uart_driver *drv = port->private_data.drv;
 
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
+	ida_free(&port_ida, uport->line);
 	uart_remove_one_port(drv, &port->uport);
 }
 
-- 
2.34.1


