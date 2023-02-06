Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1232E68C209
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 16:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjBFPoI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 10:44:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjBFPnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 10:43:52 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABF92B08E;
        Mon,  6 Feb 2023 07:43:18 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316ERHQ5026801;
        Mon, 6 Feb 2023 15:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=6jE/pqT0++aK8gJbfpKBR+Y8kTUwxsGIzjSOu0AtniQ=;
 b=NpwKhiVLWfYd1SQIp50IsUTVcsmaXjTuVv94MPiREYC9FhgeAKX6zB9jOENJ7L31nXwO
 APYAtwNA+k/t/2poTRBkEOVfenTN9KBGqyIsamcrjRbQyhKP9MewSUJjaNkumM9tT8em
 eYj2dNJIojY/bZNms87GqHnwJ1rzazNPPQkZ4pxLNMi5fggzUQ+X3rdLqEPB0Cur+vtD
 3HLPCEnx72bOzyqeMPT4XuguVebmq/8pzzWkl+ErYt1HccVqxtJXCIhXzhfrs/7DJjIR
 WwHJbKod1bKrqJJPeu0abZDIuGWjGoU9WQQKngyTmbgbQ7yOSYtyG3FbFYsmY0q9YIXk Qg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhghv3tsu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Feb 2023 15:42:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 316FgNYA021721
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 6 Feb 2023 15:42:23 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 6 Feb 2023 07:42:22 -0800
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>
CC:     <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>, <quic_pkanojiy@quicinc.com>,
        <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v2 7/8] accel/qaic: Add qaic driver to the build system
Date:   Mon, 6 Feb 2023 08:41:44 -0700
Message-ID: <1675698105-19025-8-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IgQu1J4oXfJIFuHAGo574SF1BnlZ4wek
X-Proofpoint-ORIG-GUID: IgQu1J4oXfJIFuHAGo574SF1BnlZ4wek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=898 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060135
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that we have all the components of a minimum QAIC which can boot and
run an AIC100 device, add the infrastructure that allows the QAIC driver
to be built.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
---
 drivers/accel/Kconfig       |  1 +
 drivers/accel/Makefile      |  1 +
 drivers/accel/qaic/Kconfig  | 23 +++++++++++++++++++++++
 drivers/accel/qaic/Makefile | 13 +++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 drivers/accel/qaic/Kconfig
 create mode 100644 drivers/accel/qaic/Makefile

diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index 8348639..56d0d01 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -25,3 +25,4 @@ menuconfig DRM_ACCEL
 
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
+source "drivers/accel/qaic/Kconfig"
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 07aa77a..3cb6f14 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -2,3 +2,4 @@
 
 obj-y	+= habanalabs/
 obj-y	+= ivpu/
+obj-y	+= qaic/
diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
new file mode 100644
index 0000000..a9f8662
--- /dev/null
+++ b/drivers/accel/qaic/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Qualcomm Cloud AI accelerators driver
+#
+
+config DRM_ACCEL_QAIC
+	tristate "Qualcomm Cloud AI accelerators"
+	depends on DRM_ACCEL
+	depends on PCI && HAS_IOMEM
+	depends on MHI_BUS
+	depends on MMU
+	select CRC32
+	help
+	  Enables driver for Qualcomm's Cloud AI accelerator PCIe cards that are
+	  designed to accelerate Deep Learning inference workloads.
+
+	  The driver manages the PCIe devices and provides an IOCTL interface
+	  for users to submit workloads to the devices.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qaic.
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
new file mode 100644
index 0000000..d5f4952
--- /dev/null
+++ b/drivers/accel/qaic/Makefile
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for Qualcomm Cloud AI accelerators driver
+#
+
+obj-$(CONFIG_DRM_ACCEL_QAIC)	:= qaic.o
+
+qaic-y := \
+	mhi_controller.o \
+	mhi_qaic_ctrl.o \
+	qaic_control.o \
+	qaic_data.o \
+	qaic_drv.o
-- 
2.7.4

