Return-Path: <linux-arm-msm+bounces-56999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9BAACCC9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 20:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3687520E60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DB0286D5F;
	Tue,  6 May 2025 18:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eylJv5eB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EE52857F4;
	Tue,  6 May 2025 18:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554631; cv=none; b=gp1JKb6aGMsL3FxiZ4JLxLue5+Ylw2zWiBed33taHB4UOSeZ6phZAXBUR+jl3RhqK36xmZ5h06XGa3qezaUMHRKmRhu3oS6odaQ/3Fp5urQkxuL5mtp7+IalolEml9ifxsVMwC1PrRyNWnr4s0Cl8Y2tgx8gtSGGMLF83ebOwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554631; c=relaxed/simple;
	bh=eSdXXAWq3w74a3UU2Z1Mn1ZzWT2xvey6y+i6sE+p2ok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cIzR8GFotd0QkVfjZftRMOBjqdWC3e5Ck+OUc5jA+BaeC4d5YnKeVzDK5oKv0oaEgPssfMWsFqaJJXlFg6RAhi/t+bWRG5MZwJXJE8pFysIpkgZ33hFvpvYOITohg69qeWztDUAq7LhbJaXBX6tIFO85hCrXEh0jQoOnin+qyjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eylJv5eB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546AF2Ye016530;
	Tue, 6 May 2025 18:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0byjgR6j2kugxIdmOZ7/ARHI
	qoQHzdqvKztTBOr/W4Y=; b=eylJv5eB7L0ioXc6+BkWZXzDxqq21DzSMYZ1YTfM
	JJpOc2GO4wBiH8vHSLsCYwMzJ50gJGoTSGTp/mWrlw1Srd0NKKvnva3UladydxDF
	mliuOHs7NjP4eJC8db8E2IocaTxoO+msOfYN7b7BcJjQjd6tr7yIYFnvS0Dh8Mag
	ADgwwu4SHes5m408lbikClS3KePTLvgHBN04sJ2hbiLOZI0GJfFx19Htl5GHv33g
	+ia0JexObq3nB1YhLmSvt0yWgz0ef69AJ8D9JM4XCCVsqMNTMmcdLGQzSa0Dik97
	rmeUXURsSGqqJ40kidYpXlH6ycWGw4tzOuT6/cOvMmcnog==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f8gv2uj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 18:03:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546I3ivs013297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 18:03:44 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 11:03:39 -0700
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
Subject: [PATCH v5 7/8] serial: qcom-geni: Enable PM runtime for serial driver
Date: Tue, 6 May 2025 23:32:31 +0530
Message-ID: <20250506180232.1299-8-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=dYmA3WXe c=1 sm=1 tr=0 ts=681a4f01 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=6AnO7isMBx9hvYDJyqkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3ienHvce2kAK6M06sSKmzMWouSuygr_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE3MCBTYWx0ZWRfX8VWNAZxcw2w2
 DgeGXzGwy7iimUPIsNiEHdWoU4qsgWS4IxFen6mmpi2jIMM4jAR6uAuDMikV2/3pfZZfsCYKgmC
 ROnJOSRqBzaF7kh2fvQC9TXa0u/5qVHMLGgREt8/FJQzZrWLcH88QAI71x46Z21WEieIP3+49kY
 mYS3CyNxAfeD7QxFGRGQ1gxc8LEnJhqtdl65tvUNJlMfF577QgiH5HApytLMsKyRpcDqQ/8TQJn
 hHnAMRKh+tC0jiBTglxpjZhV+TPqqCqBqVnnWnjjfCPq90JtFUpklCa4qWVABkXdHQ65cngD6wG
 7r6ejM45SHtLlqApwcqkXYlNlTXxe/lV1U+rqROXLKUjTFsraoxhFLkvTo918lZVJJxYChH6UQ3
 t/i0mey4/kn6sxebdIZzECTVLqUbfqN3T3mYlhkkvluHG00Hbxho0+hJh3eloN9Cb7bYEnsM
X-Proofpoint-GUID: 3ienHvce2kAK6M06sSKmzMWouSuygr_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060170

Add Power Management (PM) runtime support to Qualcomm GENI
serial driver.

Introduce necessary callbacks and updates to ensure seamless
transitions between power states, enhancing overall power
efficiency.

Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 33 +++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 60afee3884a6..9d698c354510 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1686,10 +1686,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 		old_state = UART_PM_STATE_OFF;
 
 	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
-		geni_serial_resources_on(uport);
+		pm_runtime_resume_and_get(uport->dev);
 	else if (new_state == UART_PM_STATE_OFF &&
 			old_state == UART_PM_STATE_ON)
-		geni_serial_resources_off(uport);
+		pm_runtime_put_sync(uport->dev);
 
 }
 
@@ -1827,9 +1827,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pm_runtime_enable(port->se.dev);
+
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
-		return ret;
+		goto error;
 
 	if (port->wakeup_irq > 0) {
 		device_init_wakeup(&pdev->dev, true);
@@ -1839,11 +1841,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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
+	pm_runtime_disable(port->se.dev);
+	return ret;
 }
 
 static void qcom_geni_serial_remove(struct platform_device *pdev)
@@ -1855,9 +1861,26 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
 	ida_free(&port_ida, uport->line);
+	pm_runtime_disable(port->se.dev);
 	uart_remove_one_port(drv, &port->uport);
 }
 
+static int qcom_geni_serial_runtime_suspend(struct device *dev)
+{
+	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
+	struct uart_port *uport = &port->uport;
+
+	return geni_serial_resources_off(uport);
+};
+
+static int qcom_geni_serial_runtime_resume(struct device *dev)
+{
+	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
+	struct uart_port *uport = &port->uport;
+
+	return geni_serial_resources_on(uport);
+};
+
 static int qcom_geni_serial_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
@@ -1901,6 +1924,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
+			   qcom_geni_serial_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
 };
 
-- 
2.17.1


