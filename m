Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30FA46CA99F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 17:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbjC0Pzg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 11:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbjC0Pzf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 11:55:35 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE2426AB;
        Mon, 27 Mar 2023 08:55:33 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RALnBK022320;
        Mon, 27 Mar 2023 15:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=b63JP+5NyjXaeMIAoNLWkbYmOaJfNvK889w32DyGPHg=;
 b=gHufZmV9yPtcqBBWQp7o6dLnPto/OEe0uQxIdR5CND0qhJYU+CExhB+/uts4CBgupgmG
 0HMgNOowLSaWbfq8NJ3JrdUG9II8BNMTDqoyBvRdBQn44CK+ZcNrnXVlsDBHXIvXqJLq
 iqXVX1yjxiwJcs9tWlfY/GlWJwZLUJyqx00xWnKrT+bWcjpza1UnUk3NjAzhP/0urphF
 mCwXo7xRdkkgwXKPwg8RLs16JiKpegXF5Db8KWaBUkxiYeAM2faSFeDxK/BcXWtOZsPR
 mTQKwv7JvC2kQ05PBx39l8Zazcud3e2BrwCMC0ep4lfQycmu6Zx6Me6rBx55cst9oxJB JQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pk83t10r7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 15:55:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32RFtQuv028545
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 15:55:26 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 27 Mar 2023 08:55:25 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>
CC:     <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <dri-devel@lists.freedesktop.org>, <quic_pkanojiy@quicinc.com>,
        <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <bagasdotme@gmail.com>, <mani@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v5 7/8] accel/qaic: Add qaic driver to the build system
Date:   Mon, 27 Mar 2023 09:54:56 -0600
Message-ID: <1679932497-30277-8-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
References: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QYhHMHVmYKZTKfozTgtvi33YJQuAJik9
X-Proofpoint-GUID: QYhHMHVmYKZTKfozTgtvi33YJQuAJik9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=851 spamscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270127
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/Kconfig       |  1 +
 drivers/accel/Makefile      |  1 +
 drivers/accel/qaic/Kconfig  | 23 +++++++++++++++++++++++
 drivers/accel/qaic/Makefile | 13 +++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 drivers/accel/qaic/Kconfig
 create mode 100644 drivers/accel/qaic/Makefile

diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index c437206..64065fb 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -26,5 +26,6 @@ menuconfig DRM_ACCEL
 
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
+source "drivers/accel/qaic/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index f22fd44..ab3df93 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
+obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
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

