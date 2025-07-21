Return-Path: <linux-arm-msm+bounces-65951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E0BB0CA18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9538B4E119A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7332E49A7;
	Mon, 21 Jul 2025 17:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e1FuIbMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43CB2E4998;
	Mon, 21 Jul 2025 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753120011; cv=none; b=dOEot35z4rNp764S2UcEYVLvqesTG1WMQda5pOJNAyndzhF0VAGUs/CXVFMLUtaokfWA+gCHzUIN7a/oAD/88xoTkFnjLJsHuXBRsyMhcUvoeMuPA5wGHWK+PyggWC7WRQeAr6h4yZLMAr/zpBKctSxvvKe13gXqqoPwy60v7h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753120011; c=relaxed/simple;
	bh=4ywWaS28Xq5JOI8PJ7Whfpvaa62ZNcnlSjBT9BkT7cE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P9ks/C7TSMyJJ2B1FW/btKMMwVZwB6M2JfJmGdY11NFp1SGJSN7rMgn2vFObKzrvUFVOIHEqFilLLPHS5XvxIrpZpnvfqktWv5GRGNMGYUwuM9aSeMN9ddSaM6peUxMuC/zlInT77ZscFCR7ftdKhuRHaPddXK4NyX+nXmxA+HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e1FuIbMx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LEev9w012558;
	Mon, 21 Jul 2025 17:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wX1sVYZxR/anvcwOHKx9YPXj
	MAgcABQrUOaV7ioi3yg=; b=e1FuIbMxStj2w6oKbCC2rZqW1QK0+3qymMbunk39
	JAxgtrOJJo1Na2PNmTR4uglhpWPNCDJRjn7pNgnNkUrtgWkT55PL23O0ax4osdyc
	Z+j23tj+1b+iC6bkuxOWVtSWtI6u2cp0uZa1Ct3o2SPYPvjqTxz/7dl4W3p3SV+r
	vKTwYUoJU/9SQKK71rnXdXhXwHO6lALOZ8VsroOuckePrvAU/7oI5DYPN7JTFv6o
	9p/Z/ZL5SezK8yAkXmbgkya2mBrW3h6LP5m0JzSWZHQumvQM9PYFjwliZamfLbWV
	Od7UK06F8QVhHYLJDiBy6yVwz86kX6yxkRuKi1ZKTAKWuA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6gwas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56LHkiWo014588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:44 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 21 Jul 2025 10:46:38 -0700
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
Subject: [PATCH v7 7/8] serial: qcom-geni: Enable PM runtime for serial driver
Date: Mon, 21 Jul 2025 23:15:31 +0530
Message-ID: <20250721174532.14022-8-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687e7d05 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=xt1Mke5GkH6e2Q2BLK4A:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qHcvr2PHhDQl5jQV-aj-m8I6GysZvf0K
X-Proofpoint-GUID: qHcvr2PHhDQl5jQV-aj-m8I6GysZvf0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1MSBTYWx0ZWRfX/0fI3BhUbaJ+
 8p/nFMKuMldsm4vG3v2iAI760h7IBIEQe3ynCb2jqyqk3T4FwVQ5IpUYeffFbnv264mraVamIMP
 qaFZgPAImMUdYrUdo9N7UcC/meoZnw0JqEhB/qiakf/S+pnWoQbxOHlIhYBKUIyuM2v6tSoCc2i
 XQs4JpfHlz911tIas3LrVx6W55MlYqoJtCZw/OmjKCTcC7srKGUZqxphqkRunH339q2MtMMbRgy
 3TcgD2iavLnXCx9e8sLFh5Tbc9lFm6OBqrj3a3psbVYhV46vSSGwnexT59ZZLggHU3Zmr1SBYnW
 bUg/Cz/U3/DDNTElM9HMXhEmyA5Ty3V4FChy8kEyZyxD10LEYecEwz6/394gNgqrh2pHv2WvwFp
 E8HaWb4WQlg0mzuXX94sJ30inmovb2RKuXGwxY+jKTAAVqQw6X+psqSLb6vkSz219wih3/wN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210151

The GENI serial driver currently handles power resource management
through calls to the statically defined geni_serial_resources_on() and
geni_serial_resources_off() functions. This approach reduces modularity
and limits support for platforms with diverse power management
mechanisms, including resource managed by firmware.

Improve modularity and enable better integration with platform-specific
power management, introduce support for runtime PM. Use
pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
qcom_geni_serial_pm() callback to control resource power state
transitions based on UART power state changes.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v6 -> v7
From Bjorn:
- used devm_pm_runtime_enable() instead of pm_runtime_enable()
- updated commit text.

v5 -> v6
- added reviewed-by tag in commit
- added __maybe_unused to PM callback functions to avoid
  warnings of defined but not used
---
 drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 81f385d900d0..aa08de659e34 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1713,10 +1713,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 		old_state = UART_PM_STATE_OFF;
 
 	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
-		geni_serial_resources_on(uport);
+		pm_runtime_resume_and_get(uport->dev);
 	else if (new_state == UART_PM_STATE_OFF &&
 		 old_state == UART_PM_STATE_ON)
-		geni_serial_resources_off(uport);
+		pm_runtime_put_sync(uport->dev);
 
 }
 
@@ -1878,6 +1878,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	devm_pm_runtime_enable(port->se.dev);
+
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
 		return ret;
@@ -1909,6 +1911,22 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
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
@@ -1952,6 +1970,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
+			   qcom_geni_serial_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
 };
 
-- 
2.17.1


