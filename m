Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD40779694
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 19:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236925AbjHKR5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 13:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236926AbjHKR5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 13:57:52 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8169E30DA;
        Fri, 11 Aug 2023 10:57:50 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37BFPcPT005510;
        Fri, 11 Aug 2023 17:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=2c/DL7j5EFojiiCjKrrJwFULprq9nVVBY3OLHTbaqHo=;
 b=B32iGivE+DcmQntpcCCrCPB6uw3z7eA6gR4RCfx+79nJiN2I+mcdYjk//l/UR4pisgIx
 rCyC05sbedvq/xrfpZsFXUriJOMj2Lcf/SKXW50I5hxZ1uHylS7Ul731+GeFiNciaGEB
 qmVln3jHetx1qj7eNbVfZEdZ4Jdj8WSRdyreNr5ParrHTk84b6CenVinhGdeIRmsTk50
 S3kW332tKskGBIIh8gkcyjb1NUIr2aZty++05eg19TRIoI5tS15b/HymW+euLHoSPX8d
 l/vHVRdJHiKgf0tpB6nKSPiSiqGJwE+1Hssg8arpC2oSvSqmT/VsviuMVt0FG6nlX+ai Sg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sd8ywtcxn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Aug 2023 17:57:41 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37BHveZ6006841
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Aug 2023 17:57:40 GMT
Received: from car-linux11.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 11 Aug 2023 10:57:39 -0700
From:   Nikunj Kela <quic_nkela@quicinc.com>
To:     <sudeep.holla@arm.com>
CC:     <cristian.marussi@arm.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: [PATCH v3 3/3] firmware: arm_scmi: Add qcom hvc/shmem transport
Date:   Fri, 11 Aug 2023 10:57:19 -0700
Message-ID: <20230811175719.28378-4-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230811175719.28378-1-quic_nkela@quicinc.com>
References: <20230718160833.36397-1-quic_nkela@quicinc.com>
 <20230811175719.28378-1-quic_nkela@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UF95WgRdzoQonvs-D17kulBnmRKCvUxs
X-Proofpoint-ORIG-GUID: UF95WgRdzoQonvs-D17kulBnmRKCvUxs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_09,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308110164
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new transport channel to the SCMI firmware interface driver for
SCMI message exchange on Qualcomm virtual platforms.

The hypervisor associates an object-id also known as capability-id
with each hvc doorbell object. The capability-id is used to identify the
doorbell from the VM's capability namespace, similar to a file-descriptor.

The hypervisor, in addition to the function-id, expects the capability-id
to be passed in x1 register when HVC call is invoked.

The qcom hvc doorbell/shared memory transport uses a statically defined
shared memory region that binds with "arm,scmi-shmem" device tree node.

The function-id & capability-id are allocated by the hypervisor on bootup
and are stored in the shmem region by the firmware before starting Linux.

Currently, there is no usecase for the atomic support therefore this driver
doesn't include the changes for the same.

Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 drivers/firmware/arm_scmi/Kconfig    |  13 ++
 drivers/firmware/arm_scmi/Makefile   |   2 +
 drivers/firmware/arm_scmi/common.h   |   3 +
 drivers/firmware/arm_scmi/driver.c   |   4 +
 drivers/firmware/arm_scmi/qcom_hvc.c | 232 +++++++++++++++++++++++++++
 5 files changed, 254 insertions(+)
 create mode 100644 drivers/firmware/arm_scmi/qcom_hvc.c

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index ea0f5083ac47..40d07329ebf7 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -99,6 +99,19 @@ config ARM_SCMI_TRANSPORT_OPTEE
 	  If you want the ARM SCMI PROTOCOL stack to include support for a
 	  transport based on OP-TEE SCMI service, answer Y.
 
+config ARM_SCMI_TRANSPORT_QCOM_HVC
+	bool "SCMI transport based on hvc doorbell & shmem for Qualcomm SoCs"
+	depends on ARCH_QCOM
+	select ARM_SCMI_HAVE_TRANSPORT
+	select ARM_SCMI_HAVE_SHMEM
+	default y
+	help
+	  Enable hvc doorbell & shmem based transport for SCMI.
+
+	  If you want the ARM SCMI PROTOCOL stack to include support for a
+	  hvc doorbell and shmem transport on Qualcomm virtual platforms,
+	  answer Y.
+
 config ARM_SCMI_TRANSPORT_SMC
 	bool "SCMI transport based on SMC"
 	depends on HAVE_ARM_SMCCC_DISCOVERY
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index b31d78fa66cc..aaeba724b5e6 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -10,6 +10,7 @@ scmi-transport-$(CONFIG_ARM_SCMI_TRANSPORT_SMC) += smc.o
 scmi-transport-$(CONFIG_ARM_SCMI_HAVE_MSG) += msg.o
 scmi-transport-$(CONFIG_ARM_SCMI_TRANSPORT_VIRTIO) += virtio.o
 scmi-transport-$(CONFIG_ARM_SCMI_TRANSPORT_OPTEE) += optee.o
+scmi-transport-$(CONFIG_ARM_SCMI_TRANSPORT_QCOM_HVC) += qcom_hvc.o
 scmi-protocols-y = base.o clock.o perf.o power.o reset.o sensors.o system.o voltage.o powercap.o
 scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
 
@@ -24,4 +25,5 @@ ifeq ($(CONFIG_THUMB2_KERNEL)$(CONFIG_CC_IS_CLANG),yy)
 # pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
 # hooks are inserted via the -pg switch.
 CFLAGS_REMOVE_smc.o += $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_qcom_hvc.o += $(CC_FLAGS_FTRACE)
 endif
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index c46dc5215af7..5c98cbb1278b 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -298,6 +298,9 @@ extern const struct scmi_desc scmi_virtio_desc;
 #ifdef CONFIG_ARM_SCMI_TRANSPORT_OPTEE
 extern const struct scmi_desc scmi_optee_desc;
 #endif
+#ifdef CONFIG_ARM_SCMI_TRANSPORT_QCOM_HVC
+extern const struct scmi_desc scmi_qcom_hvc_desc;
+#endif
 
 void scmi_rx_callback(struct scmi_chan_info *cinfo, u32 msg_hdr, void *priv);
 
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index b5957cc12fee..c54519596c29 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2918,6 +2918,10 @@ static const struct of_device_id scmi_of_match[] = {
 #endif
 #ifdef CONFIG_ARM_SCMI_TRANSPORT_VIRTIO
 	{ .compatible = "arm,scmi-virtio", .data = &scmi_virtio_desc},
+#endif
+#ifdef CONFIG_ARM_SCMI_TRANSPORT_QCOM_HVC
+	{ .compatible = "qcom,scmi-hvc-shmem",
+	  .data = &scmi_qcom_hvc_desc },
 #endif
 	{ /* Sentinel */ },
 };
diff --git a/drivers/firmware/arm_scmi/qcom_hvc.c b/drivers/firmware/arm_scmi/qcom_hvc.c
new file mode 100644
index 000000000000..87dc36805967
--- /dev/null
+++ b/drivers/firmware/arm_scmi/qcom_hvc.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) Message
+ * Qualcomm HVC/shmem Transport driver
+ *
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright 2020 NXP
+ *
+ * This is based on drivers/firmware/arm_scmi/smc.c
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+
+#include "common.h"
+
+/**
+ * struct scmi_qcom_hvc - Structure representing a SCMI qcom hvc transport
+ *
+ * @irq: An optional IRQ for completion
+ * @cinfo: SCMI channel info
+ * @shmem: Transmit/Receive shared memory area
+ * @shmem_lock: Lock to protect access to Tx/Rx shared memory area.
+ * @func_id: hvc call function-id
+ * @cap_id: hvc doorbell's capability id
+ */
+
+struct scmi_qcom_hvc {
+	int irq;
+	struct scmi_chan_info *cinfo;
+	struct scmi_shared_mem __iomem *shmem;
+	/* Protect access to shmem area */
+	struct mutex shmem_lock;
+	u32 func_id;
+	u64 cap_id;
+};
+
+static irqreturn_t qcom_hvc_msg_done_isr(int irq, void *data)
+{
+	struct scmi_qcom_hvc *scmi_info = data;
+
+	scmi_rx_callback(scmi_info->cinfo, shmem_read_header(scmi_info->shmem), NULL);
+
+	return IRQ_HANDLED;
+}
+
+static bool qcom_hvc_chan_available(struct device_node *of_node, int idx)
+{
+	struct device_node *np = of_parse_phandle(of_node, "shmem", 0);
+
+	if (!np)
+		return false;
+
+	of_node_put(np);
+	return true;
+}
+
+static int qcom_hvc_chan_setup(struct scmi_chan_info *cinfo,
+			       struct device *dev, bool tx)
+{
+	struct device *cdev = cinfo->dev;
+	struct scmi_qcom_hvc *scmi_info;
+	struct device_node *np;
+	resource_size_t size;
+	struct resource res;
+	u32 func_id;
+	u64 cap_id;
+	int ret;
+
+	if (!tx)
+		return -ENODEV;
+
+	scmi_info = devm_kzalloc(dev, sizeof(*scmi_info), GFP_KERNEL);
+	if (!scmi_info)
+		return -ENOMEM;
+
+	np = of_parse_phandle(cdev->of_node, "shmem", 0);
+	if (!of_device_is_compatible(np, "arm,scmi-shmem")) {
+		of_node_put(np);
+		return -ENXIO;
+	}
+
+	ret = of_address_to_resource(np, 0, &res);
+	of_node_put(np);
+	if (ret) {
+		dev_err(cdev, "failed to get SCMI Tx shared memory\n");
+		return ret;
+	}
+
+	size = resource_size(&res);
+
+	/* The func-id & capability-id are kept in last 16 bytes of shmem.
+	 *     +-------+
+	 *     |       |
+	 *     | shmem |
+	 *     |       |
+	 *     |       |
+	 *     +-------+ <-- (size - 16)
+	 *     | funcId|
+	 *     +-------+ <-- (size - 8)
+	 *     | capId |
+	 *     +-------+ <-- size
+	 */
+
+	scmi_info->shmem = devm_ioremap(dev, res.start, size);
+	if (!scmi_info->shmem) {
+		dev_err(dev, "failed to ioremap SCMI Tx shared memory\n");
+		return -EADDRNOTAVAIL;
+	}
+
+	func_id = readl((void __iomem *)(scmi_info->shmem) + size - 16);
+
+#ifdef CONFIG_ARM64
+	cap_id = readq((void __iomem *)(scmi_info->shmem) + size - 8);
+#else
+	/* capability-id is 32 bit long on 32bit machines */
+	cap_id = readl((void __iomem *)(scmi_info->shmem) + size - 8);
+#endif
+
+	/*
+	 * If there is an interrupt named "a2p", then the service and
+	 * completion of a message is signaled by an interrupt rather than by
+	 * the return of the hvc call.
+	 */
+	scmi_info->irq = of_irq_get_byname(cdev->of_node, "a2p");
+	if (scmi_info->irq > 0) {
+		ret = request_irq(scmi_info->irq, qcom_hvc_msg_done_isr,
+				  IRQF_NO_SUSPEND, dev_name(dev), scmi_info);
+		if (ret) {
+			dev_err(dev, "failed to setup SCMI completion irq\n");
+			return ret;
+		}
+	} else {
+		cinfo->no_completion_irq = true;
+	}
+
+	scmi_info->func_id = func_id;
+	scmi_info->cap_id = cap_id;
+	scmi_info->cinfo = cinfo;
+	mutex_init(&scmi_info->shmem_lock);
+	cinfo->transport_info = scmi_info;
+
+	return 0;
+}
+
+static int qcom_hvc_chan_free(int id, void *p, void *data)
+{
+	struct scmi_chan_info *cinfo = p;
+	struct scmi_qcom_hvc *scmi_info = cinfo->transport_info;
+
+	/* Ignore any possible further reception on the IRQ path */
+	if (scmi_info->irq > 0)
+		free_irq(scmi_info->irq, scmi_info);
+
+	cinfo->transport_info = NULL;
+	scmi_info->cinfo = NULL;
+
+	return 0;
+}
+
+static int qcom_hvc_send_message(struct scmi_chan_info *cinfo,
+				 struct scmi_xfer *xfer)
+{
+	struct scmi_qcom_hvc *scmi_info = cinfo->transport_info;
+	struct arm_smccc_res res;
+
+	/*
+	 * Channel will be released only once response has been
+	 * surely fully retrieved, so after .mark_txdone()
+	 */
+	mutex_lock(&scmi_info->shmem_lock);
+
+	shmem_tx_prepare(scmi_info->shmem, xfer, cinfo);
+
+	arm_smccc_1_1_hvc(scmi_info->func_id, (unsigned long)scmi_info->cap_id,
+			  0, 0, 0, 0, 0, 0, &res);
+
+	if (res.a0) {
+		mutex_unlock(&scmi_info->shmem_lock);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static void qcom_hvc_fetch_response(struct scmi_chan_info *cinfo,
+				    struct scmi_xfer *xfer)
+{
+	struct scmi_qcom_hvc *scmi_info = cinfo->transport_info;
+
+	shmem_fetch_response(scmi_info->shmem, xfer);
+}
+
+static void qcom_hvc_mark_txdone(struct scmi_chan_info *cinfo, int ret,
+				 struct scmi_xfer *__unused)
+{
+	struct scmi_qcom_hvc *scmi_info = cinfo->transport_info;
+
+	mutex_unlock(&scmi_info->shmem_lock);
+}
+
+static bool
+qcom_hvc_poll_done(struct scmi_chan_info *cinfo, struct scmi_xfer *xfer)
+{
+	struct scmi_qcom_hvc *scmi_info = cinfo->transport_info;
+
+	return shmem_poll_done(scmi_info->shmem, xfer);
+}
+
+static const struct scmi_transport_ops scmi_qcom_hvc_ops = {
+	.chan_available = qcom_hvc_chan_available,
+	.chan_setup = qcom_hvc_chan_setup,
+	.chan_free = qcom_hvc_chan_free,
+	.send_message = qcom_hvc_send_message,
+	.mark_txdone = qcom_hvc_mark_txdone,
+	.fetch_response = qcom_hvc_fetch_response,
+	.poll_done = qcom_hvc_poll_done,
+};
+
+const struct scmi_desc scmi_qcom_hvc_desc = {
+	.ops = &scmi_qcom_hvc_ops,
+	.max_rx_timeout_ms = 30,
+	.max_msg = 20,
+	.max_msg_size = 128,
+};
-- 
2.17.1

