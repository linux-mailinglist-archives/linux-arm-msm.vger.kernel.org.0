Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADDEC6C17DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 16:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbjCTPR6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 11:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbjCTPRc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 11:17:32 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C64A34F47;
        Mon, 20 Mar 2023 08:12:14 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32KBvSm5016205;
        Mon, 20 Mar 2023 15:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=9DrpO9edtsiCtQ3w29FRYjyr+WUpw5jVfjNO4EJVMt0=;
 b=DCgkokH10xkxFkSfdoDmNNMNt4w2H0uWadP6t/Jjh9Ni8SPdCDmoZAl1KnKu87n3YOJf
 60sM//XghoaNQA2N/20OsH0ZLODqRMR7yuvOMeE8KZfN2PcLxhe6ljER5NvxOEoxfjwR
 ejg8kr6YFYLglSZB4x7AgZRaWvNXbVNv4WMHrefIBNa3EIGiZlgqcEvh3Z3cTvRRWyXa
 ARrN20PcuFAKqOKnBGsEUfO3D1hVo9HpTMF76uLuPMVo85vcOHzQ49pe5IdK5qq+auB0
 hNSvM/upB1j/Aaq+CgR0FHtZTHuCHjARJWsTvI/VM8/Zjp4cSg2rD8/KIPqKp2hw5EZd 1A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pepfbgjxs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Mar 2023 15:12:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32KFBqFs003038
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Mar 2023 15:11:52 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 20 Mar 2023 08:11:51 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>
CC:     <dafna@fastmail.com>, <dri-devel@lists.freedesktop.org>,
        <quic_pkanojiy@quicinc.com>, <quic_carlv@quicinc.com>,
        <quic_ajitpals@quicinc.com>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v4 7/8] accel/qaic: Add qaic driver to the build system
Date:   Mon, 20 Mar 2023 09:11:13 -0600
Message-ID: <1679325074-5494-8-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vjNFAkFULNz4KIFFQWdygFrmz-p3QJDo
X-Proofpoint-ORIG-GUID: vjNFAkFULNz4KIFFQWdygFrmz-p3QJDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_10,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=913 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303200129
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
index 07aa77a..26caf43 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -2,3 +2,4 @@
 
 obj-y	+= habanalabs/
 obj-y	+= ivpu/
+obj-$(CONFIG_DRM_ACCEL_QAIC)  += qaic/
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

