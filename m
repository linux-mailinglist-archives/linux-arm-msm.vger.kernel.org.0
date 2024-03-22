Return-Path: <linux-arm-msm+bounces-14785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1528865A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 04:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 063201F21E41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 03:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DFF3FEF;
	Fri, 22 Mar 2024 03:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="imGkRDhf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE533C17
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 03:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711079383; cv=none; b=c8mxTQJorWRbf8abafu5VA4KZVBI0XJdY7ENFqURWTG1s+CbsTsUUdThEsfdBNuY0BzPr6vzuZq83Fw2gkTjDhaxPzJYlWbNqADYu+l56DqgdQkMpHtUDf84bj5EVvDbM16971iuCP6bbokmbvzGvH98Ey80kK26kZDixjzz/5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711079383; c=relaxed/simple;
	bh=/HRSAd+zgrujv5EE+M5XkxF2uL2Vpge1Hf6CYr8wP08=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=udirA7Gev/r4Y8XHefHWzBtP74rbU9f+Ul8nXYpGSRXZZJ79X1vH98DH3WDLiyyu0HnDvcG8ToHZJ47jQawMxRQYPexjwFVJw3ijdYwAJpKvuXP0Su7pVnW6QIGMw7cqZKSDF405GRYVBoAeNo8rpyXjjTLlRIyjM2/k1ta1CN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=imGkRDhf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42M3QaDY003683;
	Fri, 22 Mar 2024 03:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=zKxh3df
	eUyN2i7ZIE7TJixomnA48qjb3n/xQbQU0kxo=; b=imGkRDhf3FPTERDiHitMYYa
	m1ToFfHXfR0G6svRELPTpgGg/whtZsL+ro5oaerh/twjfwzmcniAxaxnVcAarwie
	caxw3Chuv+Q1i6X/gn0Nt2JYbGmg0kTm7Mc1p02Zt8IUP8/SpM3lQ6ocMLA3764n
	UvmsNL/4B4YTBGRRRPgXXF5XS4TT7w0gredjT70ChmfUSASlY/eLh42EHgZ+/8BF
	M5YzetijhTcGge7ft/YuTvc+NlsJbW3GGu20tRIXK7e4G8lAIYkDYWjNsm7y/6Fu
	9uLlYzlWlfmdXthqQk/Wzj/fuCB6Q5a352vzHgQCn72WITiMo1zwuyL40cHFlXA=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0wy70jcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 03:49:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42M3nV44010736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 03:49:31 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 21 Mar 2024 20:49:30 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_bjorande@quicinc.com>, <quic_carlv@quicinc.com>,
        <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] accel/qaic: Add Sahara implementation for firmware loading
Date: Thu, 21 Mar 2024 21:49:17 -0600
Message-ID: <20240322034917.3522388-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: miiUfRy6ISuDhRXwyrs9sqD4aYD0_kwL
X-Proofpoint-ORIG-GUID: miiUfRy6ISuDhRXwyrs9sqD4aYD0_kwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_14,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403220026

The AIC100 secondary bootloader uses the Sahara protocol for two
purposes - loading the runtime firmware images from the host, and
offloading crashdumps to the host. The crashdump functionality is only
invoked when the AIC100 device encounters a crash and dumps are enabled.
Also the collection of the dump is optional - the host can reject
collecting the dump.

The Sahara protocol contains many features and modes including firmware
upload, crashdump download, and client commands. For simplicity,
implement the parts of the protocol needed for loading firmware to the
device.

Fundamentally, the Sahara protocol is an embedded file transfer
protocol. Both sides negotiate a connection through a simple exchange of
hello messages. After handshaking through a hello message, the device
either sends a message requesting images, or a message advertising the
memory dump available for the host. For image transfer, the remote device
issues a read data request that provides an image (by ID), an offset, and
a length. The host has an internal mapping of image IDs to filenames. The
host is expected to access the image and transfer the requested chunk to
the device. The device can issue additional read requests, or signal that
it has consumed enough data from this image with an end of image message.
The host confirms the end of image, and the device can proceed with
another image by starting over with the hello exchange again.

Some images may be optional, and only provided as part of a provisioning
flow. The host is not aware of this information, and thus should report
an error to the device when an image is not available. The device will
evaluate if the image is required or not, and take the appropriate
action.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---

 drivers/accel/qaic/Makefile   |   3 +-
 drivers/accel/qaic/qaic_drv.c |  10 +
 drivers/accel/qaic/sahara.c   | 450 ++++++++++++++++++++++++++++++++++
 drivers/accel/qaic/sahara.h   |  10 +
 4 files changed, 472 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/qaic/sahara.c
 create mode 100644 drivers/accel/qaic/sahara.h

diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 3f7f6dfde7f2..df02c1c0d6a6 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -10,4 +10,5 @@ qaic-y := \
 	qaic_control.o \
 	qaic_data.o \
 	qaic_drv.o \
-	qaic_timesync.o
+	qaic_timesync.o \
+	sahara.o
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index d1a632dbaec6..ccfbac88c724 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -29,6 +29,7 @@
 #include "mhi_controller.h"
 #include "qaic.h"
 #include "qaic_timesync.h"
+#include "sahara.h"
 
 MODULE_IMPORT_NS(DMA_BUF);
 
@@ -635,12 +636,20 @@ static int __init qaic_init(void)
 		goto free_pci;
 	}
 
+	ret = sahara_register();
+	if (ret) {
+		pr_debug("qaic: sahara_register failed %d\n", ret);
+		goto free_mhi;
+	}
+
 	ret = qaic_timesync_init();
 	if (ret)
 		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
 
 	return 0;
 
+free_mhi:
+	mhi_driver_unregister(&qaic_mhi_driver);
 free_pci:
 	pci_unregister_driver(&qaic_pci_driver);
 	return ret;
@@ -665,6 +674,7 @@ static void __exit qaic_exit(void)
 	 */
 	link_up = true;
 	qaic_timesync_deinit();
+	sahara_unregister();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
new file mode 100644
index 000000000000..d5da8e166998
--- /dev/null
+++ b/drivers/accel/qaic/sahara.c
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <linux/firmware.h>
+#include <linux/limits.h>
+#include <linux/mhi.h>
+#include <linux/minmax.h>
+#include <linux/mod_devicetable.h>
+#include <linux/overflow.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include "sahara.h"
+
+#define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
+#define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
+#define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
+#define SAHARA_END_OF_IMAGE_CMD		0x4  /* Min protocol version 1.0 */
+#define SAHARA_DONE_CMD			0x5  /* Min protocol version 1.0 */
+#define SAHARA_DONE_RESP_CMD		0x6  /* Min protocol version 1.0 */
+#define SAHARA_RESET_CMD		0x7  /* Min protocol version 1.0 */
+#define SAHARA_RESET_RESP_CMD		0x8  /* Min protocol version 1.0 */
+#define SAHARA_MEM_DEBUG_CMD		0x9  /* Min protocol version 2.0 */
+#define SAHARA_MEM_READ_CMD		0xa  /* Min protocol version 2.0 */
+#define SAHARA_CMD_READY_CMD		0xb  /* Min protocol version 2.1 */
+#define SAHARA_SWITCH_MODE_CMD		0xc  /* Min protocol version 2.1 */
+#define SAHARA_EXECUTE_CMD		0xd  /* Min protocol version 2.1 */
+#define SAHARA_EXECUTE_RESP_CMD		0xe  /* Min protocol version 2.1 */
+#define SAHARA_EXECUTE_DATA_CMD		0xf  /* Min protocol version 2.1 */
+#define SAHARA_MEM_DEBUG64_CMD		0x10 /* Min protocol version 2.5 */
+#define SAHARA_MEM_READ64_CMD		0x11 /* Min protocol version 2.5 */
+#define SAHARA_READ_DATA64_CMD		0x12 /* Min protocol version 2.8 */
+#define SAHARA_RESET_STATE_CMD		0x13 /* Min protocol version 2.9 */
+#define SAHARA_WRITE_DATA_CMD		0x14 /* Min protocol version 3.0 */
+
+#define SAHARA_PACKET_MAX_SIZE		0xffffU /* MHI_MAX_MTU */
+#define SAHARA_TRANSFER_MAX_SIZE	0x80000
+#define SAHARA_NUM_TX_BUF		DIV_ROUND_UP(SAHARA_TRANSFER_MAX_SIZE,\
+							SAHARA_PACKET_MAX_SIZE)
+#define SAHARA_IMAGE_ID_NONE		U32_MAX
+
+#define SAHARA_VERSION			2
+#define SAHARA_SUCCESS			0
+
+#define SAHARA_MODE_IMAGE_TX_PENDING	0x0
+#define SAHARA_MODE_IMAGE_TX_COMPLETE	0x1
+#define SAHARA_MODE_MEMORY_DEBUG	0x2
+#define SAHARA_MODE_COMMAND		0x3
+
+#define SAHARA_HELLO_LENGTH		0x30
+#define SAHARA_READ_DATA_LENGTH		0x14
+#define SAHARA_END_OF_IMAGE_LENGTH	0x10
+#define SAHARA_DONE_LENGTH		0x8
+#define SAHARA_RESET_LENGTH		0x8
+
+struct sahara_packet {
+	__le32 cmd;
+	__le32 length;
+
+	union {
+		struct {
+			__le32 version;
+			__le32 version_compat;
+			__le32 max_length;
+			__le32 mode;
+		} hello;
+		struct {
+			__le32 version;
+			__le32 version_compat;
+			__le32 status;
+			__le32 mode;
+		} hello_resp;
+		struct {
+			__le32 image;
+			__le32 offset;
+			__le32 length;
+		} read_data;
+		struct {
+			__le32 image;
+			__le32 status;
+		} end_of_image;
+	};
+};
+
+struct sahara_context {
+	struct sahara_packet		*tx[SAHARA_NUM_TX_BUF];
+	struct sahara_packet		*rx;
+	struct work_struct		work;
+	struct mhi_device		*mhi_dev;
+	const char			**image_table;
+	u32				table_size;
+	u32				active_image_id;
+	const struct firmware		*firmware;
+};
+
+static const char *aic100_image_table[] = {
+	[1]  = "qcom/aic100/fw1.bin",
+	[2]  = "qcom/aic100/fw2.bin",
+	[4]  = "qcom/aic100/fw4.bin",
+	[5]  = "qcom/aic100/fw5.bin",
+	[6]  = "qcom/aic100/fw6.bin",
+	[8]  = "qcom/aic100/fw8.bin",
+	[9]  = "qcom/aic100/fw9.bin",
+	[10] = "qcom/aic100/fw10.bin",
+};
+
+static int sahara_find_image(struct sahara_context *context, u32 image_id)
+{
+	int ret;
+
+	if (image_id == context->active_image_id)
+		return 0;
+
+	if (context->active_image_id != SAHARA_IMAGE_ID_NONE) {
+		dev_err(&context->mhi_dev->dev, "image id %d is not valid as %d is active\n",
+			image_id, context->active_image_id);
+		return -EINVAL;
+	}
+
+	if (image_id >= context->table_size || !context->image_table[image_id]) {
+		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
+		return -EINVAL;
+	}
+
+	/*
+	 * This image might be optional. The device may continue without it.
+	 * Only the device knows. Suppress error messages that could suggest an
+	 * a problem when we were actually able to continue.
+	 */
+	ret = firmware_request_nowarn(&context->firmware,
+				      context->image_table[image_id],
+				      &context->mhi_dev->dev);
+	if (ret) {
+		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
+			image_id, context->image_table[image_id], ret);
+		return ret;
+	}
+
+	context->active_image_id = image_id;
+
+	return 0;
+}
+
+static void sahara_release_image(struct sahara_context *context)
+{
+	if (context->active_image_id != SAHARA_IMAGE_ID_NONE)
+		release_firmware(context->firmware);
+	context->active_image_id = SAHARA_IMAGE_ID_NONE;
+}
+
+static void sahara_send_reset(struct sahara_context *context)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_RESET_LENGTH, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send reset response %d\n", ret);
+}
+
+static void sahara_hello(struct sahara_context *context)
+{
+	int ret;
+
+	dev_dbg(&context->mhi_dev->dev,
+		"HELLO cmd received. length:%d version:%d version_compat:%d max_length:%d mode:%d\n",
+		le32_to_cpu(context->rx->length),
+		le32_to_cpu(context->rx->hello.version),
+		le32_to_cpu(context->rx->hello.version_compat),
+		le32_to_cpu(context->rx->hello.max_length),
+		le32_to_cpu(context->rx->hello.mode));
+
+	if (le32_to_cpu(context->rx->length) != SAHARA_HELLO_LENGTH) {
+		dev_err(&context->mhi_dev->dev, "Malformed hello packet - length %d\n",
+			le32_to_cpu(context->rx->length));
+		return;
+	}
+	if (le32_to_cpu(context->rx->hello.version) != SAHARA_VERSION) {
+		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - version %d\n",
+			le32_to_cpu(context->rx->hello.version));
+		return;
+	}
+
+	if (le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_PENDING &&
+	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE) {
+		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - mode %d\n",
+			le32_to_cpu(context->rx->hello.mode));
+		return;
+	}
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_HELLO_RESP_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_HELLO_LENGTH);
+	context->tx[0]->hello_resp.version = cpu_to_le32(SAHARA_VERSION);
+	context->tx[0]->hello_resp.version_compat = cpu_to_le32(SAHARA_VERSION);
+	context->tx[0]->hello_resp.status = cpu_to_le32(SAHARA_SUCCESS);
+	context->tx[0]->hello_resp.mode = context->rx->hello_resp.mode;
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_HELLO_LENGTH, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send hello response %d\n", ret);
+}
+
+static void sahara_read_data(struct sahara_context *context)
+{
+	u32 image_id, data_offset, data_len, pkt_data_len;
+	int ret;
+	int i;
+
+	dev_dbg(&context->mhi_dev->dev,
+		"READ_DATA cmd received. length:%d image:%d offset:%d data_length:%d\n",
+		le32_to_cpu(context->rx->length),
+		le32_to_cpu(context->rx->read_data.image),
+		le32_to_cpu(context->rx->read_data.offset),
+		le32_to_cpu(context->rx->read_data.length));
+
+	if (le32_to_cpu(context->rx->length) != SAHARA_READ_DATA_LENGTH) {
+		dev_err(&context->mhi_dev->dev, "Malformed read_data packet - length %d\n",
+			le32_to_cpu(context->rx->length));
+		return;
+	}
+
+	image_id = le32_to_cpu(context->rx->read_data.image);
+	data_offset = le32_to_cpu(context->rx->read_data.offset);
+	data_len = le32_to_cpu(context->rx->read_data.length);
+
+	ret = sahara_find_image(context, image_id);
+	if (ret) {
+		sahara_send_reset(context);
+		return;
+	}
+
+	/*
+	 * Image is released when the device is done with it via
+	 * SAHARA_END_OF_IMAGE_CMD. sahara_send_reset() will either cause the
+	 * device to retry the operation with a modification, or decide to be
+	 * done with the image and trigger SAHARA_END_OF_IMAGE_CMD.
+	 * release_image() is called from SAHARA_END_OF_IMAGE_CMD. processing
+	 * and is not needed here on error.
+	 */
+
+	if (data_len > SAHARA_TRANSFER_MAX_SIZE) {
+		dev_err(&context->mhi_dev->dev, "Malformed read_data packet - data len %d exceeds max xfer size %d\n",
+			data_len, SAHARA_TRANSFER_MAX_SIZE);
+		sahara_send_reset(context);
+		return;
+	}
+
+	if (data_offset >= context->firmware->size) {
+		dev_err(&context->mhi_dev->dev, "Malformed read_data packet - data offset %d exceeds file size %zu\n",
+			data_offset, context->firmware->size);
+		sahara_send_reset(context);
+		return;
+	}
+
+	if (size_add(data_offset, data_len) > context->firmware->size) {
+		dev_err(&context->mhi_dev->dev, "Malformed read_data packet - data offset %d and length %d exceeds file size %zu\n",
+			data_offset, data_len, context->firmware->size);
+		sahara_send_reset(context);
+		return;
+	}
+
+	for (i = 0; i < SAHARA_NUM_TX_BUF && data_len; ++i) {
+		pkt_data_len = min(data_len, SAHARA_PACKET_MAX_SIZE);
+
+		memcpy(context->tx[i], &context->firmware->data[data_offset], pkt_data_len);
+
+		data_offset += pkt_data_len;
+		data_len -= pkt_data_len;
+
+		ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE,
+				    context->tx[i], pkt_data_len,
+				    !data_len ? MHI_EOT : MHI_CHAIN);
+		if (ret) {
+			dev_err(&context->mhi_dev->dev, "Unable to send read_data response %d\n",
+				ret);
+			return;
+		}
+	}
+}
+
+static void sahara_end_of_image(struct sahara_context *context)
+{
+	int ret;
+
+	dev_dbg(&context->mhi_dev->dev,
+		"END_OF_IMAGE cmd received. length:%d image:%d status:%d\n",
+		le32_to_cpu(context->rx->length),
+		le32_to_cpu(context->rx->end_of_image.image),
+		le32_to_cpu(context->rx->end_of_image.status));
+
+	if (le32_to_cpu(context->rx->length) != SAHARA_END_OF_IMAGE_LENGTH) {
+		dev_err(&context->mhi_dev->dev, "Malformed end_of_image packet - length %d\n",
+			le32_to_cpu(context->rx->length));
+		return;
+	}
+
+	if (context->active_image_id != SAHARA_IMAGE_ID_NONE &&
+	    le32_to_cpu(context->rx->end_of_image.image) != context->active_image_id) {
+		dev_err(&context->mhi_dev->dev, "Malformed end_of_image packet - image %d is not the active image\n",
+			le32_to_cpu(context->rx->end_of_image.image));
+		return;
+	}
+
+	sahara_release_image(context);
+
+	if (le32_to_cpu(context->rx->end_of_image.status))
+		return;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_DONE_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_DONE_LENGTH);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_DONE_LENGTH, MHI_EOT);
+	if (ret)
+		dev_dbg(&context->mhi_dev->dev, "Unable to send done response %d\n", ret);
+}
+
+static void sahara_processing(struct work_struct *work)
+{
+	struct sahara_context *context = container_of(work, struct sahara_context, work);
+	int ret;
+
+	switch (le32_to_cpu(context->rx->cmd)) {
+	case SAHARA_HELLO_CMD:
+		sahara_hello(context);
+		break;
+	case SAHARA_READ_DATA_CMD:
+		sahara_read_data(context);
+		break;
+	case SAHARA_END_OF_IMAGE_CMD:
+		sahara_end_of_image(context);
+		break;
+	case SAHARA_DONE_RESP_CMD:
+		/* Intentional do nothing as we don't need to exit an app */
+		break;
+	default:
+		dev_err(&context->mhi_dev->dev, "Unknown command %d\n",
+			le32_to_cpu(context->rx->cmd));
+		break;
+	}
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE, context->rx,
+			    SAHARA_PACKET_MAX_SIZE, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to requeue rx buf %d\n", ret);
+}
+
+static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
+{
+	struct sahara_context *context;
+	int ret;
+	int i;
+
+	context = devm_kzalloc(&mhi_dev->dev, sizeof(*context), GFP_KERNEL);
+	if (!context)
+		return -ENOMEM;
+
+	context->rx = devm_kzalloc(&mhi_dev->dev, SAHARA_PACKET_MAX_SIZE, GFP_KERNEL);
+	if (!context->rx)
+		return -ENOMEM;
+
+	/*
+	 * AIC100 defines SAHARA_TRANSFER_MAX_SIZE as the largest value it
+	 * will request for READ_DATA. This is larger than
+	 * SAHARA_PACKET_MAX_SIZE, and we need 9x SAHARA_PACKET_MAX_SIZE to
+	 * cover SAHARA_TRANSFER_MAX_SIZE. When the remote side issues a
+	 * READ_DATA, it requires a transfer of the exact size requested. We
+	 * can use MHI_CHAIN to link multiple buffers into a single transfer
+	 * but the remote side will not consume the buffers until it sees an
+	 * EOT, thus we need to allocate enough buffers to put in the tx fifo
+	 * to cover an entire READ_DATA request of the max size.
+	 */
+	for (i = 0; i < SAHARA_NUM_TX_BUF; ++i) {
+		context->tx[i] = devm_kzalloc(&mhi_dev->dev, SAHARA_PACKET_MAX_SIZE, GFP_KERNEL);
+		if (!context->tx[i])
+			return -ENOMEM;
+	}
+
+	context->mhi_dev = mhi_dev;
+	INIT_WORK(&context->work, sahara_processing);
+	context->image_table = aic100_image_table;
+	context->table_size = ARRAY_SIZE(aic100_image_table);
+	context->active_image_id = SAHARA_IMAGE_ID_NONE;
+	dev_set_drvdata(&mhi_dev->dev, context);
+
+	ret = mhi_prepare_for_transfer(mhi_dev);
+	if (ret)
+		return ret;
+
+	ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, context->rx, SAHARA_PACKET_MAX_SIZE, MHI_EOT);
+	if (ret) {
+		mhi_unprepare_from_transfer(mhi_dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void sahara_mhi_remove(struct mhi_device *mhi_dev)
+{
+	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
+
+	cancel_work_sync(&context->work);
+	sahara_release_image(context);
+	mhi_unprepare_from_transfer(mhi_dev);
+}
+
+static void sahara_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
+{
+}
+
+static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
+{
+	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
+
+	if (!mhi_result->transaction_status)
+		schedule_work(&context->work);
+}
+
+static const struct mhi_device_id sahara_mhi_match_table[] = {
+	{ .chan = "QAIC_SAHARA", },
+	{},
+};
+
+static struct mhi_driver sahara_mhi_driver = {
+	.id_table = sahara_mhi_match_table,
+	.remove = sahara_mhi_remove,
+	.probe = sahara_mhi_probe,
+	.ul_xfer_cb = sahara_mhi_ul_xfer_cb,
+	.dl_xfer_cb = sahara_mhi_dl_xfer_cb,
+	.driver = {
+		.name = "sahara",
+	},
+};
+
+int sahara_register(void)
+{
+	return mhi_driver_register(&sahara_mhi_driver);
+}
+
+void sahara_unregister(void)
+{
+	mhi_driver_unregister(&sahara_mhi_driver);
+}
diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
new file mode 100644
index 000000000000..640208acc0d1
--- /dev/null
+++ b/drivers/accel/qaic/sahara.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#ifndef __SAHARA_H__
+#define __SAHARA_H__
+
+int sahara_register(void);
+void sahara_unregister(void);
+#endif /* __SAHARA_H__ */
-- 
2.34.1


