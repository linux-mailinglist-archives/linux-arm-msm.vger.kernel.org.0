Return-Path: <linux-arm-msm+bounces-50114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A9DA4D4B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 08:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99A213B10B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 07:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110B41FBCB3;
	Tue,  4 Mar 2025 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KkVk3gNu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B49B1FBCAD;
	Tue,  4 Mar 2025 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741072476; cv=none; b=e+NJVl0rnrEym8yQKgz2NqvsucjlVY1Hogb3mes3cLuiQ8Wn54YsiwnoweoQsnaRMjE7vxbWG2NOX9f/jUWYA8PVqLjbekkSsXo99VikspxZ4fQVVYNF3M+wqToypOH6LiNcrs5pbHpfkfIN2Q+4q1IqZGlelUP8Q5qJSSOtNaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741072476; c=relaxed/simple;
	bh=vGt0uLWAkcR3HonXGBsTZgj5Y/WTltyn2FU5GJandcM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gvypqOKIMbkTyNtxEvHGqDf+/xxYEeieUlyh9bnONQRVNrTB/E9QhX6GJkIUETv8Bc5+pZ8Q/HSBq5EjP5EVtsTE00DiihqG9u5+CtH5VmpNqQlWxn8diWoue8Sj3fYmO9/SEca8bam5R/3KlaH8sYQJB3qam2U328aK9jCYGwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KkVk3gNu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NWwVF012576;
	Tue, 4 Mar 2025 07:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Nbgu7pShJvE4dbkB60zZxlUCUUmKYXMg2UV
	w1ayvXh4=; b=KkVk3gNup5VDq8Ssk38X4vsKGHv7KOao3QDheaM4cu9enq88FH4
	fmiBxoR6vimBh0lgZY+jUnR5hbJDGjx9GSXNMCaJ0HVDTKurxuTMp5xEU8lQQvGL
	zmnRn7pQhKWdYpKZKxtrY80kL1vbVtbDRtiGGXIpWwpvHc+yZuCJloaF3M12w1Y/
	xoaeU1M+vH0Z/XLDbbuzqEk51bzReNbjOpA2iOu1Rr54wfl7pEJMxPt3nAq/fqxR
	JrN4ktlqfSxfxb6QAssQ0fxU8QhV36T+VHRWsloqZyPoj6GjCbPIE+RxTyb0eC2n
	t9IpnwotCLqOoQIn8591jCXnbfeH0ELEp5g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t10c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 07:14:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5247EPcN001886;
	Tue, 4 Mar 2025 07:14:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 453uakrn81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 07:14:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5247EP21001881;
	Tue, 4 Mar 2025 07:14:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5247EP1O001879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 07:14:25 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id BECB456A; Tue,  4 Mar 2025 12:44:24 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v1] serial: qcom-geni: Remove alias dependency from qcom serial driver
Date: Tue,  4 Mar 2025 12:44:23 +0530
Message-Id: <20250304071423.4033565-1-quic_vdadhani@quicinc.com>
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
X-Proofpoint-ORIG-GUID: hD16FvSaAabWw0Fmn9Sybqt8WEdNQeXJ
X-Authority-Analysis: v=2.4 cv=P5XAhjAu c=1 sm=1 tr=0 ts=67c6a855 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=ci-9EGO1i53FkUXoZCwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hD16FvSaAabWw0Fmn9Sybqt8WEdNQeXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_03,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040059

Remove the dependency on aliases in the device tree configuration for the
qcom serial driver. Currently, the absence of an alias results in an
invalid line number, causing the driver probe to fail for geni serial.

To prevent probe failures, implement logic to dynamically assign line
numbers if an alias is not present in the device tree for non-console
ports.

Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index a80ce7aaf309..2457f39dfc84 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -98,6 +98,8 @@
 
 #define DMA_RX_BUF_SIZE		2048
 
+static DEFINE_IDR(port_idr);
+
 struct qcom_geni_device_data {
 	bool console;
 	enum geni_se_xfer_mode mode;
@@ -253,10 +255,25 @@ static struct qcom_geni_serial_port *get_port_from_line(int line, bool console)
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
+			line = idr_alloc(&port_idr, (void *)port, max_alias_num + 1, nr_ports,
+					 GFP_KERNEL);
+		else
+			line = idr_alloc(&port_idr, (void *)port, line, nr_ports, GFP_KERNEL);
+
+		if (line < 0)
+			return ERR_PTR(-ENXIO);
 
-	port = console ? &qcom_geni_console_port : &qcom_geni_uart_ports[line];
+		port = &qcom_geni_uart_ports[line];
+	}
 	return port;
 }
 
@@ -1761,6 +1778,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 						port->wakeup_irq);
 		if (ret) {
 			device_init_wakeup(&pdev->dev, false);
+			idr_remove(&port_idr, uport->line);
 			uart_remove_one_port(drv, uport);
 			return ret;
 		}
@@ -1772,10 +1790,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 static void qcom_geni_serial_remove(struct platform_device *pdev)
 {
 	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
+	struct uart_port *uport = &port->uport;
 	struct uart_driver *drv = port->private_data.drv;
 
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
+	idr_remove(&port_idr, uport->line);
 	uart_remove_one_port(drv, &port->uport);
 }
 
-- 
2.34.1


