Return-Path: <linux-arm-msm+bounces-60497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3BBAD0768
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 19:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38C503B1430
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 17:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA52228B419;
	Fri,  6 Jun 2025 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NzNoIzFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC528A72E;
	Fri,  6 Jun 2025 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749230547; cv=none; b=ODX23kuwJy4KXU2XqXttPf2BCVwLr+U0I0I1eVqItkH0DnBCN1TaMGMFEnPZjVDCrLCQPoA4vxH62GrTfRLBcCXz1Im4R84VkX69EGFRHuGM4qpJHJocCicchIIawV+mO16DXu1o+ocfSnC6zzCQcApr/omVyZTnl5gGafWIv9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749230547; c=relaxed/simple;
	bh=8Oa4yZwPnKKIUpT/VTdnHtvc9xJqlhpot0+B6IjM5L8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BosCeoEPfZqh4N54n5cxf7PRTCmG66iIe9GPiii6E+pr3kJqh6myGc1qCkFQYd6AHFoHORrxqMwL5sMbXZAJc8rI/Gf2X0P0AWKAE7cW4W6D56zdGVsfnZDL7kyGQ9paE/IeTC7dQdfp++HvNrnnwS0z83BkKWJh18Joy8Q9L88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NzNoIzFO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9EBO017968;
	Fri, 6 Jun 2025 17:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yv2o71ITip9hDm+9Y+F5Awrb
	RWDbL/iH9zT4tEwg7ck=; b=NzNoIzFOXwFPI00QaOj+kQd+QIlarwjPWdoHflEg
	VmLKcp5cOnLAE65woIy5c6f6caY3RTxEybvt8AupZGBdJgFg4imnwZHidvFSzz6a
	kdqMEeIoAV1Ij/6Hw7cfphyaoashL04kxWSR/OMBR8HblzNpE7jJjGZlJbEyi64U
	+p3t2J/p5Vn5HhuDzFGkDmncGPppZJnqBrLSDCH1X5mVg1Z7x/jF/tODAxDpguBt
	vYHp1zPlgQwtRLG8gzBBaQh+R6Xp1e/t9GNylLzVN9Ow0DA2FvDhnWDgf46EFhpp
	MgWhTcbOTHLLz3vfznWAPek3HsRI9+efdUp3jE+4KcJofQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qdbya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 17:22:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556HMLed021935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 17:22:21 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 10:22:16 -0700
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
Subject: [PATCH v6 7/8] serial: qcom-geni: Enable PM runtime for serial driver
Date: Fri, 6 Jun 2025 22:51:13 +0530
Message-ID: <20250606172114.6618-8-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250606172114.6618-1-quic_ptalari@quicinc.com>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
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
X-Proofpoint-GUID: R2xHa2T8HbWXkKPh2sZZretKm0Caibs4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE1MSBTYWx0ZWRfX+tz4wDaV74rO
 +EPr9PdIVjKTQgLxCAHYWaNCfW/J7djtI7nK9zRsTwfpclLz29tZ3GDsGy6o4fqArpvgY3YpkaL
 AzUilMzCUa8Oj2Iidmhn/ds3NLwd0jNe5b8YKJgO6eX5qhGJZE5D6tyQXbl3CLZKetbsTHnrZkH
 yfMtb3gAZZi5l6k++GzmUC/ZVxrL2sEDLE3u1ESnXlEIuEIo2siZ/J5hD6HZFhAFWHVN4yWFU1B
 Jo50+5p8XlyuxHJ31X3IjbLTXa/nua+hUZ2REuEVCGbTbnLR4bWBXWmjQZRe5u9QvjGw06CA2m0
 GlfBoN+ggm6bucgFrt8a3wHYMKZCiZ4d9VBdvVbnDQAO4b9mSMIy6rVcbTN7ikge3bF+rTsAsVw
 qc8niRWC1quqQmz5e9rwpW/uDSE9FakATjCCY+jdn+D6vgk1/snLdmydE/jRjIGVd3VOGZpN
X-Proofpoint-ORIG-GUID: R2xHa2T8HbWXkKPh2sZZretKm0Caibs4
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=684323ce cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=NvXbtCnAfBVqmBDmsI8A:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060151

Add Power Management (PM) runtime support to Qualcomm GENI
serial driver.

Introduce necessary callbacks and updates to ensure seamless
transitions between power states, enhancing overall power
efficiency.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v5 -> v6
- added reviewed-by tag in commit
- added __maybe_unused to PM callback functions to avoid
  warnings of defined but not used
---
 drivers/tty/serial/qcom_geni_serial.c | 33 +++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index b6fa7dc9b1fb..3691340ce7e8 100644
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
 
+static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
+{
+	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
+	struct uart_port *uport = &port->uport;
+
+	return geni_serial_resources_off(uport);
+}
+
+static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
+{
+	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
+	struct uart_port *uport = &port->uport;
+
+	return geni_serial_resources_on(uport);
+}
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


