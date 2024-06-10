Return-Path: <linux-arm-msm+bounces-22153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41880901959
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 04:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B039D281A8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 02:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DED028EC;
	Mon, 10 Jun 2024 02:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RIf4KEIU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C9137B;
	Mon, 10 Jun 2024 02:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717986106; cv=none; b=nRkavPJu+8JSlIHcLHtBsj1Z6Zm/0h5djlbiNjLlrH4C4Q61l5VsW//+y5hcgNZ+GHxaCnhJFK2RCY3qpxRIVQKH4qB/sCfI9h/yfLhJrv2Gt0bF20KG062eYwW0BloR+Oc3yfqyENL/aiLe27CSu3wHij44L2bJ2nrdUhqaXfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717986106; c=relaxed/simple;
	bh=temh3GWDe8csOvN1HEol0Fh2OT0MGFy8HGOe+fdk4Nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=sK3fU5W4DIZwGDOVyJ2KjDdiFtuUDAbAmfhKHJPHzyQdfAGGum1Z3x9ezPgvRJTR6yjz58+mDwVLQp/F2lmFzdxJ2Q0AVwInXz4s4VVdOY0hI0M4EbQTnORAk6eoJ6Ig54ObcTeisD1CydO1ddStKshnZs6ljG1MWJRp3uCEoWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RIf4KEIU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A1vFqv024507;
	Mon, 10 Jun 2024 02:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FaS7UVPglZYt5wqWsJFyaz
	f0/L3Vrqak+m7hqBPt4+w=; b=RIf4KEIU1KXNz5Fy7FRzh6kr+6uUvIS0iTy2uD
	DEU75UxypqQoJSYgNIxnkoOdlQb9VEi/HkmVA967gQFogz538GsXVJDCV0RIYSI1
	T5Air6QgF7lWTg6pBl/CJgWhDc64ob1bGJxiaVLOkBGV2aAiJMuKGlEhUiVvpwGb
	WTvFQcvJxoft6xpiqzRhvNJcgeWrx4xjznnuZGmR8/3+0MIDPCD33mRMdSR1RlAX
	jJ6QZ44FJpy0ZSGKVW0jB+n/cF6w+FdWN5slAjYqkg5mURli0z+CC6eBS0sOwlXT
	9o9S/i8JbdCA8CsXv6c9s/8qZsAP8qawTF7imAlIvtQ1tuNg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymcnmtfwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 02:21:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A2LUQ0008473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 02:21:30 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Jun 2024
 19:21:29 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 9 Jun 2024 19:21:28 -0700
Subject: [PATCH] mfd: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240609-md-drivers-mfd-v1-1-47cdd0b394e9@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACdjZmYC/x3MQQrCMBBG4auUWTsQg4j1KuJi2vyxAybKjC2F0
 rsbXX6L9zZymMLp2m1kWNT1VRuOh47GSeoDrKmZYoincA49l8TJdIE5l5wYOaCPiPmShFr0NmR
 d/8PbvXkQBw8mdZx+m6fWeeUi/oHRvn8BplOLm38AAAA=
To: Lee Jones <lee@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Liviu Dudau
	<liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi
	<lpieralisi@kernel.org>
CC: <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fNSLfaQVD5hvbpEjrH7wwIjmA0LHQH8C
X-Proofpoint-ORIG-GUID: fNSLfaQVD5hvbpEjrH7wwIjmA0LHQH8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_18,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1011 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100016

On x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/timberdale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/ssbi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/rt4831.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/intel_soc_pmic_bxtwc.o

Add the missing invocation of the MODULE_DESCRIPTION() macro to all
files which have a MODULE_LICENSE().

This includes mfd-core.c and vexpress-sysreg.c which, although they
did not produce a warning with the x86 allmodconfig configuration, may
cause this warning with other configurations.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/mfd/arizona-core.c         | 1 +
 drivers/mfd/intel_soc_pmic_bxtwc.c | 1 +
 drivers/mfd/mfd-core.c             | 1 +
 drivers/mfd/pcf50633-gpio.c        | 1 +
 drivers/mfd/rt4831.c               | 1 +
 drivers/mfd/ssbi.c                 | 1 +
 drivers/mfd/timberdale.c           | 1 +
 drivers/mfd/vexpress-sysreg.c      | 1 +
 8 files changed, 8 insertions(+)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 19a0adf8ce3d..85ff8717d850 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -1429,4 +1429,5 @@ int arizona_dev_exit(struct arizona *arizona)
 }
 EXPORT_SYMBOL_GPL(arizona_dev_exit);
 
+MODULE_DESCRIPTION("Wolfson Arizona core driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
index 8dac0d41f64f..ba32cacfc499 100644
--- a/drivers/mfd/intel_soc_pmic_bxtwc.c
+++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
@@ -581,5 +581,6 @@ static struct platform_driver bxtwc_driver = {
 
 module_platform_driver(bxtwc_driver);
 
+MODULE_DESCRIPTION("Intel Broxton Whiskey Cove PMIC MFD core driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Qipeng Zha <qipeng.zha@intel.com>");
diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 6ad5c93027af..b2742b1dce0c 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -437,5 +437,6 @@ int devm_mfd_add_devices(struct device *dev, int id,
 }
 EXPORT_SYMBOL(devm_mfd_add_devices);
 
+MODULE_DESCRIPTION("Core MFD support");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ian Molton, Dmitry Baryshkov");
diff --git a/drivers/mfd/pcf50633-gpio.c b/drivers/mfd/pcf50633-gpio.c
index 4d2b53b12eeb..3e368219479a 100644
--- a/drivers/mfd/pcf50633-gpio.c
+++ b/drivers/mfd/pcf50633-gpio.c
@@ -88,4 +88,5 @@ int pcf50633_gpio_power_supply_set(struct pcf50633 *pcf,
 }
 EXPORT_SYMBOL_GPL(pcf50633_gpio_power_supply_set);
 
+MODULE_DESCRIPTION("NXP PCF50633 GPIO Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
index f8d6dc55b558..1ab8870e4ebf 100644
--- a/drivers/mfd/rt4831.c
+++ b/drivers/mfd/rt4831.c
@@ -115,4 +115,5 @@ static struct i2c_driver rt4831_driver = {
 module_i2c_driver(rt4831_driver);
 
 MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("Richtek RT4831 core driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mfd/ssbi.c b/drivers/mfd/ssbi.c
index f849f2d34ec7..6e7aff6e2746 100644
--- a/drivers/mfd/ssbi.c
+++ b/drivers/mfd/ssbi.c
@@ -319,6 +319,7 @@ static struct platform_driver ssbi_driver = {
 };
 module_platform_driver(ssbi_driver);
 
+MODULE_DESCRIPTION("Qualcomm Single-wire Serial Bus Interface (SSBI) driver");
 MODULE_LICENSE("GPL v2");
 MODULE_VERSION("1.0");
 MODULE_ALIAS("platform:ssbi");
diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index a41e9a3e2064..333d5b874de3 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -853,4 +853,5 @@ module_pci_driver(timberdale_pci_driver);
 
 MODULE_AUTHOR("Mocean Laboratories <info@mocean-labs.com>");
 MODULE_VERSION(DRV_VERSION);
+MODULE_DESCRIPTION("Timberdale FPGA MFD driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index eab82619ec31..d34d58ce46db 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -132,4 +132,5 @@ static struct platform_driver vexpress_sysreg_driver = {
 };
 
 module_platform_driver(vexpress_sysreg_driver);
+MODULE_DESCRIPTION("Versatile Express system registers driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240609-md-drivers-mfd-ef0e92e2f8da


