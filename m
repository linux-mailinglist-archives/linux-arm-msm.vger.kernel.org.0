Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73B6B68C201
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 16:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjBFPoG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 10:44:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjBFPns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 10:43:48 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656BE2BF2C;
        Mon,  6 Feb 2023 07:43:12 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316DiBgk030034;
        Mon, 6 Feb 2023 15:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=oCOUMiH/QyVuYxAprDmeqK1e+evLnZql3HvTqMymCKI=;
 b=RoES1AC2m23nOU3632qZTCqumbVl219Bq5AQXJMJmXA+AiD+P+rUJD6Ij85lGwtM1kLa
 flMRnDwZmA1lGK136PHH31sMngUDpOBCNQRqM6LWfa+lu0u7Zbmrew3xAW1SiLpyvs+L
 rYUUCA+zl41DKO8IJyVZ3eBn4/w0eLwTX//WYCvaZBueTrzP9O6IunqYy05w5+LI8E/j
 Zb9i990vEpD4BkWi+oDA3HwWR4RKsmuFVK0Jt4B1JQfsb5nl/E3+TADGVdZCkSKiptcq
 u6lnWJvkXsrXtVy2a1572CQF5YzOrAgWp2ItOs+/3lywL48GpOmfHJxgpGHlUdgi4eXP 1w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nheb0v012-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Feb 2023 15:42:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 316FgHDO026120
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 6 Feb 2023 15:42:17 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 6 Feb 2023 07:42:16 -0800
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>
CC:     <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>, <quic_pkanojiy@quicinc.com>,
        <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v2 3/8] accel/qaic: Add MHI controller
Date:   Mon, 6 Feb 2023 08:41:40 -0700
Message-ID: <1675698105-19025-4-git-send-email-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: JB6OhUXDF2GnujN7tzw4uKD5YaFfdvWM
X-Proofpoint-GUID: JB6OhUXDF2GnujN7tzw4uKD5YaFfdvWM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302060135
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

An AIC100 device contains a MHI interface with a number of different
channels for controlling different aspects of the device.  The MHI
controller works with the MHI bus to enable and drive that interface.

AIC100 uses the BHI protocol in PBL to load SBL.  The MHI controller
expects the sbl to be located at /lib/firmware/qcom/aic100/sbl.bin and
expects the MHI bus to manage the process of loading and sending SBL to
the device.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
---
 drivers/accel/qaic/mhi_controller.c | 576 ++++++++++++++++++++++++++++++++++++
 drivers/accel/qaic/mhi_controller.h |  19 ++
 2 files changed, 595 insertions(+)
 create mode 100644 drivers/accel/qaic/mhi_controller.c
 create mode 100644 drivers/accel/qaic/mhi_controller.h

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
new file mode 100644
index 0000000..984428c
--- /dev/null
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -0,0 +1,576 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/memblock.h>
+#include <linux/mhi.h>
+#include <linux/moduleparam.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+
+#include "mhi_controller.h"
+#include "qaic.h"
+
+#define MAX_RESET_TIME_SEC 25
+
+static unsigned int mhi_timeout = 2000; /* 2 sec default */
+module_param(mhi_timeout, uint, 0600);
+
+static struct mhi_channel_config aic100_channels[] = {
+	{
+		.name = "QAIC_LOOPBACK",
+		.num = 0,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_LOOPBACK",
+		.num = 1,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SAHARA",
+		.num = 2,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SAHARA",
+		.num = 3,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_DIAG",
+		.num = 4,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_DIAG",
+		.num = 5,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SSR",
+		.num = 6,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SSR",
+		.num = 7,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_QDSS",
+		.num = 8,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_QDSS",
+		.num = 9,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_CONTROL",
+		.num = 10,
+		.num_elements = 128,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_CONTROL",
+		.num = 11,
+		.num_elements = 128,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_LOGGING",
+		.num = 12,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_LOGGING",
+		.num = 13,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_STATUS",
+		.num = 14,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_STATUS",
+		.num = 15,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_TELEMETRY",
+		.num = 16,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_TELEMETRY",
+		.num = 17,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_DEBUG",
+		.num = 18,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_DEBUG",
+		.num = 19,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_TIMESYNC",
+		.num = 20,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL | MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.num = 21,
+		.name = "QAIC_TIMESYNC",
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL | MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+};
+
+static struct mhi_event_config aic100_events[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 0,
+		.channel = U32_MAX,
+		.priority = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_CTRL,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+static struct mhi_controller_config aic100_config = {
+	.max_channels = 128,
+	.timeout_ms = 0, /* controlled by mhi_timeout */
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(aic100_channels),
+	.ch_cfg = aic100_channels,
+	.num_events = ARRAY_SIZE(aic100_events),
+	.event_cfg = aic100_events,
+	.use_bounce_buf = false,
+	.m2_no_db = false,
+};
+
+static int mhi_read_reg(struct mhi_controller *mhi_cntl, void __iomem *addr, u32 *out)
+{
+	u32 tmp = readl_relaxed(addr);
+
+	if (tmp == U32_MAX)
+		return -EIO;
+
+	*out = tmp;
+
+	return 0;
+}
+
+static void mhi_write_reg(struct mhi_controller *mhi_cntl, void __iomem *addr,
+			  u32 val)
+{
+	writel_relaxed(val, addr);
+}
+
+static int mhi_runtime_get(struct mhi_controller *mhi_cntl)
+{
+	return 0;
+}
+
+static void mhi_runtime_put(struct mhi_controller *mhi_cntl)
+{
+}
+
+static void mhi_status_cb(struct mhi_controller *mhi_cntl, enum mhi_callback reason)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_cntl->cntrl_dev));
+
+	/* this event occurs in atomic context */
+	if (reason == MHI_CB_FATAL_ERROR)
+		pci_err(qdev->pdev, "Fatal error received from device.  Attempting to recover\n");
+	/* this event occurs in non-atomic context */
+	if (reason == MHI_CB_SYS_ERROR && !qdev->in_reset)
+		qaic_dev_reset_clean_local_state(qdev, true);
+}
+
+static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntl)
+{
+	char time_sec = 1;
+	int current_ee;
+	int ret;
+
+	/* Reset the device to bring the device in PBL EE */
+	mhi_soc_reset(mhi_cntl);
+
+	/*
+	 * Keep checking the execution environment(EE) after every 1 second
+	 * interval.
+	 */
+	do {
+		msleep(1000);
+		current_ee = mhi_get_exec_env(mhi_cntl);
+	} while (current_ee != MHI_EE_PBL && time_sec++ <= MAX_RESET_TIME_SEC);
+
+	/* If the device is in PBL EE retry power up */
+	if (current_ee == MHI_EE_PBL)
+		ret = mhi_async_power_up(mhi_cntl);
+	else
+		ret = -EIO;
+
+	return ret;
+}
+
+struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev,
+						    void __iomem *mhi_bar,
+						    int mhi_irq)
+{
+	struct mhi_controller *mhi_cntl;
+	int ret;
+
+	mhi_cntl = kzalloc(sizeof(*mhi_cntl), GFP_KERNEL);
+	if (!mhi_cntl)
+		return ERR_PTR(-ENOMEM);
+
+	mhi_cntl->cntrl_dev = &pci_dev->dev;
+
+	/*
+	 * Covers the entire possible physical ram region.  Remote side is
+	 * going to calculate a size of this range, so subtract 1 to prevent
+	 * rollover.
+	 */
+	mhi_cntl->iova_start = 0;
+	mhi_cntl->iova_stop = PHYS_ADDR_MAX - 1;
+
+	mhi_cntl->status_cb = mhi_status_cb;
+	mhi_cntl->runtime_get = mhi_runtime_get;
+	mhi_cntl->runtime_put = mhi_runtime_put;
+	mhi_cntl->read_reg = mhi_read_reg;
+	mhi_cntl->write_reg = mhi_write_reg;
+	mhi_cntl->regs = mhi_bar;
+	mhi_cntl->reg_len = SZ_4K;
+	mhi_cntl->nr_irqs = 1;
+	mhi_cntl->irq = kmalloc(sizeof(*mhi_cntl->irq), GFP_KERNEL);
+
+	if (!mhi_cntl->irq) {
+		ret = -ENOMEM;
+		goto fail_irq;
+	}
+
+	mhi_cntl->irq[0] = mhi_irq;
+
+	mhi_cntl->fw_image = "qcom/aic100/sbl.bin";
+
+	/* use latest configured timeout */
+	aic100_config.timeout_ms = mhi_timeout;
+	ret = mhi_register_controller(mhi_cntl, &aic100_config);
+	if (ret) {
+		pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
+		goto register_fail;
+	}
+
+	ret = mhi_prepare_for_power_up(mhi_cntl);
+	if (ret) {
+		pci_err(pci_dev, "mhi_prepare_for_power_up failed %d\n", ret);
+		goto prepare_power_up_fail;
+	}
+
+	ret = mhi_async_power_up(mhi_cntl);
+	/*
+	 * If EIO is returned it is possible that device is in SBL EE, which is
+	 * undesired. SOC reset the device and try to power up again.
+	 */
+	if (ret == -EIO && MHI_EE_SBL == mhi_get_exec_env(mhi_cntl)) {
+		pci_err(pci_dev, "Device is not expected to be SBL EE. SOC resetting the device to put it in PBL EE and again trying mhi async power up. Error %d\n",
+			ret);
+		ret = mhi_reset_and_async_power_up(mhi_cntl);
+	}
+
+	if (ret) {
+		pci_err(pci_dev, "mhi_async_power_up failed %d\n", ret);
+		goto power_up_fail;
+	}
+
+	return mhi_cntl;
+
+power_up_fail:
+	mhi_unprepare_after_power_down(mhi_cntl);
+prepare_power_up_fail:
+	mhi_unregister_controller(mhi_cntl);
+register_fail:
+	kfree(mhi_cntl->irq);
+fail_irq:
+	kfree(mhi_cntl);
+	return ERR_PTR(ret);
+}
+
+void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up)
+{
+	mhi_power_down(mhi_cntl, link_up);
+	mhi_unprepare_after_power_down(mhi_cntl);
+	mhi_unregister_controller(mhi_cntl);
+	kfree(mhi_cntl->irq);
+	kfree(mhi_cntl);
+}
+
+void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl)
+{
+	mhi_power_down(mhi_cntl, true);
+}
+
+void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl)
+{
+	struct pci_dev *pci_dev = container_of(mhi_cntl->cntrl_dev,
+					       struct pci_dev, dev);
+	int ret;
+
+	ret = mhi_async_power_up(mhi_cntl);
+	if (ret)
+		pci_err(pci_dev, "mhi_async_power_up failed after reset %d\n", ret);
+}
diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
new file mode 100644
index 0000000..12197bb
--- /dev/null
+++ b/drivers/accel/qaic/mhi_controller.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef MHICONTROLLERQAIC_H_
+#define MHICONTROLLERQAIC_H_
+
+struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev,
+						    void __iomem *mhi_bar,
+						    int mhi_irq);
+
+void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up);
+
+void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl);
+void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl);
+
+#endif /* MHICONTROLLERQAIC_H_ */
-- 
2.7.4

