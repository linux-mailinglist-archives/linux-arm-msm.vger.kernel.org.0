Return-Path: <linux-arm-msm+bounces-29598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E939606E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 12:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 943131F21F16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 10:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C06E1A2866;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEliKjqz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4101A0730;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753196; cv=none; b=oq/c8w0BT5LPOHMJjuhBChYFlWCwI/c/Of03VxnlJgeO+D2o4y3WT+u1AjUGDf+Tv3CxWoLbpvEWS3ZuY/GL4B68Ty5tAV9m4PqcLrax8c778xZ9v+7YJFt4Ci+TeDKgEV1fsbQyp3NsAHW3I+bHec3A8yn5gUz1fNOMif/3W4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753196; c=relaxed/simple;
	bh=n8mIfDDfCVCKT/qRJY/PHdFn+vxZRxRzlDKgMgQKZUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eUep8w0gx2bYVLs2vARLtAUCUy9CzIJgGKmUH2tbqUbQsvjXLC1SkMqQ8YwIJ9OiXFawXp93F/+jCiBjtXtlvamRW8dMG3PSPV0w8QBQdwCTZQhL74pCpwe6si+8XYGpjdEYJgnoRr3EqY/chjNr/E/TFMCK938+0Z70ZwTxcXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEliKjqz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39BA5C4FE8F;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753196;
	bh=n8mIfDDfCVCKT/qRJY/PHdFn+vxZRxRzlDKgMgQKZUM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UEliKjqzsC71buHoDMnLfjEtctbJaonf7SoxzmZv0Sg7oPvBl7N/lVdgPPwsZ6MT/
	 9gscahFEuzAEP7SagXMetDZfFSrWiP0L6visQHGgB1P7/B1l9oWxBkqGuyLfab9xvW
	 R5/7c8oDYFQTJ9xAwtXNGaSazK1D+rwtc6oPkG+etfFoUvywBtlaFi7SUNBAyYThxd
	 ukT9jYd8I0Uxj/Wz9m+tjwA5fDBQnp3jVo+EBa0pWaQYbqwatwl6nvwMDTCbjlaO3j
	 Ak2ogOhl24CHM0nRKNEkx5Zj8FcjtIdWz9ZdtxYcuoNZqjq1BOv/PukhLV94V5Cj//
	 DMOHPTZa+Y0xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24252C54736;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:46 +0530
Subject: [PATCH v3 21/29] media: iris: allocate, initialize and queue
 internal buffers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-21-c5fdbbe65e70@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=50983;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=lxXt5Hhd5blgzOczVEZFGbf948OHw/aPfN4kIOpUbek=;
 b=EwYO1vhlh93THc4E6cRHTzjqvSuIIQJFS4/vUe1Ytt+W3E8MRfBArRRM2gRVpxskaOyl4fc1G
 2n5g4M73TNLD0lCHzrPIuqRTrBKPWtgN5Gw4wgv1qhJ56WZfN7O0U7h
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Implement functions for creating, queueing, releasing
and destroying buffers for internal usage.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     | 224 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |   7 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   4 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 128 +++++++++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  37 +++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |   4 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 138 +++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  41 ++++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 148 ++++++++++-
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |  14 ++
 .../platform/qcom/iris/iris_platform_sm8550.c      |  22 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  38 ++-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  11 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 272 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  77 +++++-
 17 files changed, 1174 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index b90b912d73b6..57f3ffd8596a 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -7,6 +7,7 @@
 
 #include "iris_buffer.h"
 #include "iris_instance.h"
+#include "iris_vpu_buffer.h"
 
 #define PIXELS_4K 4096
 #define MAX_WIDTH 4096
@@ -215,6 +216,229 @@ int iris_get_buffer_size(struct iris_inst *inst,
 	}
 }
 
+static void iris_fill_internal_buf_info(struct iris_inst *inst,
+					enum iris_buffer_type buffer_type)
+{
+	struct iris_core *core = inst->core;
+	struct iris_buffers *buffers;
+
+	buffers = &inst->buffers[buffer_type];
+
+	buffers->size = iris_vpu_buf_size(inst, buffer_type);
+	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
+
+	dev_dbg(core->dev, "buffer type %d count %d size %d",
+		buffer_type, buffers->min_count, buffers->size);
+}
+
+void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_platform_data *platform_data;
+	const u32 *internal_buf_type;
+	u32 internal_buffer_count;
+	u32 i = 0;
+
+	platform_data = inst->core->iris_platform_data;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane)) {
+		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+		for (i = 0; i < internal_buffer_count; i++)
+			iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+	} else {
+		internal_buf_type = platform_data->dec_op_int_buf_tbl;
+		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+		for (i = 0; i < internal_buffer_count; i++)
+			iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+	}
+}
+
+static int iris_create_internal_buffer(struct iris_inst *inst,
+				       enum iris_buffer_type buffer_type, u32 index)
+{
+	struct iris_core *core = inst->core;
+	struct iris_buffers *buffers;
+	struct iris_buffer *buffer;
+
+	buffers = &inst->buffers[buffer_type];
+
+	if (!buffers->size)
+		return 0;
+
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&buffer->list);
+	buffer->type = buffer_type;
+	buffer->index = index;
+	buffer->buffer_size = buffers->size;
+	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
+	list_add_tail(&buffer->list, &buffers->list);
+
+	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
+	if (!buffer->kvaddr)
+		return -ENOMEM;
+
+	return 0;
+}
+
+int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_platform_data *platform_data;
+	struct iris_buffers *buffers;
+	const u32 *internal_buf_type;
+	u32 internal_buffer_count;
+	u32 i = 0, j = 0;
+	int ret = 0;
+
+	platform_data = inst->core->iris_platform_data;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane)) {
+		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+	} else {
+		internal_buf_type = platform_data->dec_op_int_buf_tbl;
+		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+	}
+
+	for (i = 0; i < internal_buffer_count; i++) {
+		buffers = &inst->buffers[internal_buf_type[i]];
+		for (j = 0; j < buffers->min_count; j++) {
+			ret = iris_create_internal_buffer(inst, internal_buf_type[i], j);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	int ret;
+
+	ret = hfi_ops->session_queue_buf(inst, buf);
+	if (ret)
+		return ret;
+
+	buf->attr &= ~BUF_ATTR_DEFERRED;
+	buf->attr |= BUF_ATTR_QUEUED;
+
+	return ret;
+}
+
+int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_platform_data *platform_data;
+	struct iris_buffer *buffer, *next;
+	struct iris_buffers *buffers;
+	const u32 *internal_buf_type;
+	u32 internal_buffer_count;
+	int ret = 0;
+	u32 i = 0;
+
+	platform_data = inst->core->iris_platform_data;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane)) {
+		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+	} else {
+		internal_buf_type = platform_data->dec_op_int_buf_tbl;
+		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+	}
+
+	for (i = 0; i < internal_buffer_count; i++) {
+		buffers = &inst->buffers[internal_buf_type[i]];
+		list_for_each_entry_safe(buffer, next, &buffers->list, list) {
+			if (buffer->attr & BUF_ATTR_PENDING_RELEASE)
+				continue;
+			if (buffer->attr & BUF_ATTR_QUEUED)
+				continue;
+			ret = iris_queue_buffer(inst, buffer);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
+{
+	struct iris_core *core = inst->core;
+
+	list_del(&buffer->list);
+	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
+		       buffer->device_addr, buffer->dma_attrs);
+	kfree(buffer);
+
+	return 0;
+}
+
+int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_platform_data *platform_data;
+	const u32 *internal_buf_type = NULL;
+	struct iris_buffer *buf, *next;
+	struct iris_buffers *buffers;
+	int ret = 0;
+	u32 i, len = 0;
+
+	platform_data = inst->core->iris_platform_data;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane)) {
+		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+		len = platform_data->dec_ip_int_buf_tbl_size;
+	} else {
+		internal_buf_type = platform_data->dec_op_int_buf_tbl;
+		len = platform_data->dec_op_int_buf_tbl_size;
+	}
+
+	for (i = 0; i < len; i++) {
+		buffers = &inst->buffers[internal_buf_type[i]];
+		list_for_each_entry_safe(buf, next, &buffers->list, list) {
+			ret = iris_destroy_internal_buffer(inst, buf);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst)
+{
+	struct iris_buffer *buffer, *next;
+	struct iris_buffers *buffers;
+	int ret = 0;
+	int i = 0;
+
+	iris_fill_internal_buf_info(inst, BUF_PERSIST);
+
+	buffers = &inst->buffers[BUF_PERSIST];
+
+	for (i = 0; i < buffers->min_count; i++) {
+		ret = iris_create_internal_buffer(inst, BUF_PERSIST, i);
+		if (ret)
+			return ret;
+	}
+
+	list_for_each_entry_safe(buffer, next, &buffers->list, list) {
+		if (buffer->attr & BUF_ATTR_PENDING_RELEASE)
+			continue;
+		if (buffer->attr & BUF_ATTR_QUEUED)
+			continue;
+		ret = iris_queue_buffer(inst, buffer);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
 void iris_vb2_queue_error(struct iris_inst *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 98844e89e0e3..41e090e9f0b0 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -102,6 +102,13 @@ struct iris_buffers {
 };
 
 int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
+int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
+int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
+int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
+int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane);
+int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst);
+int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
 void iris_vb2_queue_error(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index fa409a9b3f04..9a6bb72e6134 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -9,6 +9,8 @@
 #include <linux/types.h>
 #include <media/v4l2-device.h>
 
+#include "iris_buffer.h"
+
 struct iris_inst;
 struct iris_core;
 
@@ -114,6 +116,8 @@ struct iris_hfi_command_ops {
 				    void *payload, u32 payload_size);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
+	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
+	int (*session_release_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
 	int (*session_stop)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
 };
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 65f561ec76ab..be45a38166eb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -8,6 +8,24 @@
 #include "iris_instance.h"
 #include "iris_vpu_buffer.h"
 
+static u32 iris_hfi_gen1_buf_type_from_driver(enum iris_buffer_type buffer_type)
+{
+	switch (buffer_type) {
+	case BUF_INPUT:
+		return HFI_BUFFER_INPUT;
+	case BUF_OUTPUT:
+		return HFI_BUFFER_OUTPUT;
+	case BUF_PERSIST:
+		return HFI_BUFFER_INTERNAL_PERSIST_1;
+	case BUF_BIN:
+		return HFI_BUFFER_INTERNAL_SCRATCH;
+	case BUF_SCRATCH_1:
+		return HFI_BUFFER_INTERNAL_SCRATCH_1;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int iris_hfi_gen1_sys_init(struct iris_core *core)
 {
 	struct hfi_sys_init_pkt sys_init_pkt;
@@ -183,6 +201,112 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 	return ret;
 }
 
+static int iris_hfi_gen1_queue_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf)
+{
+	struct hfi_session_set_buffers_pkt *int_pkt;
+	int buffer_type, i;
+	u32 packet_size;
+	int ret;
+
+	packet_size = struct_size(int_pkt, buffer_info, 1);
+	int_pkt = kzalloc(packet_size, GFP_KERNEL);
+	if (!int_pkt)
+		return -ENOMEM;
+
+	int_pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_SET_BUFFERS;
+	int_pkt->shdr.session_id = inst->session_id;
+	int_pkt->buffer_size = buf->buffer_size;
+	int_pkt->min_buffer_size = buf->buffer_size;
+	int_pkt->num_buffers = 1;
+	int_pkt->extradata_size = 0;
+	int_pkt->shdr.hdr.size = packet_size;
+	for (i = 0; i < int_pkt->num_buffers; i++)
+		int_pkt->buffer_info[i] = buf->device_addr;
+	buffer_type = iris_hfi_gen1_buf_type_from_driver(buf->type);
+	if (buffer_type == -EINVAL) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	int_pkt->buffer_type = buffer_type;
+	ret = iris_hfi_queue_cmd_write(inst->core, int_pkt, int_pkt->shdr.hdr.size);
+
+exit:
+	kfree(int_pkt);
+
+	return ret;
+}
+
+static int iris_hfi_gen1_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf)
+{
+	switch (buf->type) {
+	case BUF_PERSIST:
+	case BUF_BIN:
+	case BUF_SCRATCH_1:
+		return iris_hfi_gen1_queue_internal_buffer(inst, buf);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct iris_buffer *buf)
+{
+	struct hfi_session_release_buffer_pkt *pkt;
+	unsigned int buffer_type = 0, i;
+	u32 packet_size;
+	int ret;
+
+	buffer_type = iris_hfi_gen1_buf_type_from_driver(buf->type);
+	if (buffer_type == -EINVAL)
+		return -EINVAL;
+
+	if (buffer_type == HFI_BUFFER_INPUT)
+		return 0;
+
+	packet_size = sizeof(*pkt) + sizeof(struct hfi_buffer_info);
+	pkt = kzalloc(packet_size, GFP_KERNEL);
+	if (!pkt)
+		return -ENOMEM;
+
+	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_RELEASE_BUFFERS;
+	pkt->shdr.session_id = inst->session_id;
+	pkt->buffer_size = buf->buffer_size;
+	pkt->num_buffers = 1;
+
+	if (buffer_type == HFI_BUFFER_OUTPUT ||
+	    buffer_type == HFI_BUFFER_OUTPUT2) {
+		struct hfi_buffer_info *bi;
+
+		bi = (struct hfi_buffer_info *)pkt->buffer_info;
+		for (i = 0; i < pkt->num_buffers; i++) {
+			bi->buffer_addr = buf->device_addr;
+			bi->extradata_addr = 0;
+		}
+		pkt->shdr.hdr.size = packet_size;
+	} else {
+		for (i = 0; i < pkt->num_buffers; i++)
+			pkt->buffer_info[i] = buf->device_addr;
+		pkt->extradata_size = 0;
+		pkt->shdr.hdr.size =
+				sizeof(struct hfi_session_set_buffers_pkt) +
+				((pkt->num_buffers) * sizeof(u32));
+	}
+
+	pkt->response_req = true;
+	pkt->buffer_type = buffer_type;
+
+	ret = iris_hfi_queue_cmd_write(inst->core, pkt, pkt->shdr.hdr.size);
+	if (ret)
+		goto exit;
+
+	ret = iris_wait_for_session_response(inst, false);
+
+exit:
+	kfree(pkt);
+
+	return ret;
+}
+
 static int
 iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *packet,
 					  struct iris_inst *inst, u32 ptype, void *pdata)
@@ -498,7 +622,7 @@ static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst)
 
 	if (iris_split_mode_enabled(inst)) {
 		bufsz.type = HFI_BUFFER_OUTPUT;
-		bufsz.size = iris_vpu_dec_dpb_size(inst);
+		bufsz.size = iris_vpu_buf_size(inst, BUF_DPB);
 
 		ret = hfi_gen1_set_property(inst, ptype, &bufsz, sizeof(bufsz));
 		if (ret)
@@ -607,6 +731,8 @@ static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
 	.session_start = iris_hfi_gen1_session_start,
+	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
+	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
 	.session_stop = iris_hfi_gen1_session_stop,
 	.session_close = iris_hfi_gen1_session_close,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 8b48a082bcd3..5527233b03e5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -24,11 +24,13 @@
 #define HFI_CMD_SYS_SESSION_END				0x10008
 
 #define HFI_CMD_SESSION_SET_PROPERTY			0x11001
+#define HFI_CMD_SESSION_SET_BUFFERS			0x11002
 
 #define HFI_CMD_SESSION_LOAD_RESOURCES			0x211001
 #define HFI_CMD_SESSION_START				0x211002
 #define HFI_CMD_SESSION_STOP				0x211003
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 
 #define HFI_ERR_SESSION_UNSUPPORTED_SETTING		0x1008
@@ -53,6 +55,9 @@
 #define HFI_BUFFER_INPUT				0x1
 #define HFI_BUFFER_OUTPUT				0x2
 #define HFI_BUFFER_OUTPUT2				0x3
+#define HFI_BUFFER_INTERNAL_PERSIST_1			0x5
+#define HFI_BUFFER_INTERNAL_SCRATCH			0x6
+#define HFI_BUFFER_INTERNAL_SCRATCH_1			0x7
 
 #define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
 #define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
@@ -80,6 +85,7 @@
 #define HFI_MSG_SESSION_STOP				0x221003
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
+#define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
 struct hfi_pkt_hdr {
 	u32 size;
@@ -128,11 +134,36 @@ struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
 
+struct hfi_session_set_buffers_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 buffer_type;
+	u32 buffer_size;
+	u32 extradata_size;
+	u32 min_buffer_size;
+	u32 num_buffers;
+	u32 buffer_info[];
+};
+
 struct hfi_session_flush_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 flush_type;
 };
 
+struct hfi_session_release_buffer_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 buffer_type;
+	u32 buffer_size;
+	u32 extradata_size;
+	u32 response_req;
+	u32 num_buffers;
+	u32 buffer_info[];
+};
+
+struct hfi_buffer_info {
+	u32 buffer_addr;
+	u32 extradata_addr;
+};
+
 struct hfi_msg_event_notify_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 event_id;
@@ -227,6 +258,12 @@ struct hfi_multi_stream {
 	u32 enable;
 };
 
+struct hfi_msg_session_release_buffers_done_pkt {
+	struct hfi_msg_session_hdr_pkt shdr;
+	u32 num_buffers;
+	u32 buffer_info[];
+};
+
 struct hfi_msg_sys_debug_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 msg_type;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index b42eba10e074..af1f59c43b92 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -169,6 +169,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_RESOURCES,
 	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
+	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 791b535a3584..ab1021c3b562 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -106,6 +106,32 @@ static u32 iris_hfi_gen2_get_port(u32 plane)
 	return hfi_port;
 }
 
+static u32 iris_hfi_gen2_get_port_from_buf_type(enum iris_buffer_type buffer_type)
+{
+	u32 hfi_port = HFI_PORT_NONE;
+
+	switch (buffer_type) {
+	case BUF_INPUT:
+	case BUF_BIN:
+	case BUF_COMV:
+	case BUF_NON_COMV:
+	case BUF_LINE:
+		hfi_port = HFI_PORT_BITSTREAM;
+		break;
+	case BUF_OUTPUT:
+	case BUF_DPB:
+		hfi_port = HFI_PORT_RAW;
+		break;
+	case BUF_PERSIST:
+		hfi_port = HFI_PORT_NONE;
+		break;
+	default:
+		break;
+	}
+
+	return hfi_port;
+}
+
 static int iris_hfi_gen2_session_set_property(struct iris_inst *inst, u32 packet_type, u32 flag,
 					      u32 plane, u32 payload_type, void *payload,
 					      u32 payload_size)
@@ -759,6 +785,116 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
 	return iris_wait_for_session_response(inst, false);
 }
 
+static u32 iris_hfi_gen2_buf_type_from_driver(enum iris_buffer_type buffer_type)
+{
+	switch (buffer_type) {
+	case BUF_INPUT:
+		return HFI_BUFFER_BITSTREAM;
+	case BUF_OUTPUT:
+		return HFI_BUFFER_RAW;
+	case BUF_BIN:
+		return HFI_BUFFER_BIN;
+	case BUF_COMV:
+		return HFI_BUFFER_COMV;
+	case BUF_NON_COMV:
+		return HFI_BUFFER_NON_COMV;
+	case BUF_LINE:
+		return HFI_BUFFER_LINE;
+	case BUF_DPB:
+		return HFI_BUFFER_DPB;
+	case BUF_PERSIST:
+		return HFI_BUFFER_PERSIST;
+	default:
+		return 0;
+	}
+}
+
+static int iris_set_num_comv(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	u32 num_comv;
+
+	num_comv = inst->driver_cap[NUM_COMV].value;
+
+	return core->hfi_ops->session_set_property(inst,
+						   HFI_PROP_COMV_BUFFER_COUNT,
+						   HFI_HOST_FLAGS_NONE,
+						   HFI_PORT_BITSTREAM,
+						   HFI_PAYLOAD_U32,
+						   &num_comv, sizeof(u32));
+}
+
+static void iris_hfi_gen2_get_buffer(struct iris_buffer *buffer, struct iris_hfi_buffer *buf)
+{
+	memset(buf, 0, sizeof(*buf));
+	buf->type = iris_hfi_gen2_buf_type_from_driver(buffer->type);
+	buf->index = buffer->index;
+	buf->base_address = buffer->device_addr;
+	buf->addr_offset = 0;
+	buf->buffer_size = buffer->buffer_size;
+
+	if (buffer->type == BUF_INPUT)
+		buf->buffer_size = ALIGN(buffer->buffer_size, 256);
+	buf->data_offset = buffer->data_offset;
+	buf->data_size = buffer->data_size;
+	if (buffer->attr & BUF_ATTR_PENDING_RELEASE)
+		buf->flags |= HFI_BUF_HOST_FLAG_RELEASE;
+	buf->flags |= HFI_BUF_HOST_FLAGS_CB_NON_SECURE;
+	buf->timestamp = buffer->timestamp;
+}
+
+static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	struct iris_hfi_buffer hfi_buffer;
+	u32 port;
+	int ret;
+
+	iris_hfi_gen2_get_buffer(buffer, &hfi_buffer);
+	if (buffer->type == BUF_COMV) {
+		ret = iris_set_num_comv(inst);
+		if (ret)
+			return ret;
+	}
+
+	port = iris_hfi_gen2_get_port_from_buf_type(buffer->type);
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_BUFFER,
+					     HFI_HOST_FLAGS_INTR_REQUIRED,
+					     port,
+					     inst->session_id,
+					     HFI_PAYLOAD_STRUCTURE,
+					     &hfi_buffer,
+					     sizeof(hfi_buffer));
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
+static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	struct iris_hfi_buffer hfi_buffer;
+	u32 port;
+
+	iris_hfi_gen2_get_buffer(buffer, &hfi_buffer);
+	hfi_buffer.flags |= HFI_BUF_HOST_FLAG_RELEASE;
+	port = iris_hfi_gen2_get_port_from_buf_type(buffer->type);
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_BUFFER,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					     HFI_HOST_FLAGS_INTR_REQUIRED),
+					     port,
+					     inst->session_id,
+					     HFI_PAYLOAD_STRUCTURE,
+					     &hfi_buffer,
+					     sizeof(hfi_buffer));
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
 static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -768,6 +904,8 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
 	.session_set_property = iris_hfi_gen2_session_set_property,
 	.session_start = iris_hfi_gen2_session_start,
+	.session_queue_buf = iris_hfi_gen2_session_queue_buffer,
+	.session_release_buf = iris_hfi_gen2_session_release_buffer,
 	.session_stop = iris_hfi_gen2_session_stop,
 	.session_close = iris_hfi_gen2_session_close,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 92c44841c67d..d9a903ee1e06 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -17,6 +17,7 @@
 #define HFI_CMD_CLOSE				0x01000004
 #define HFI_CMD_START				0x01000005
 #define HFI_CMD_STOP				0x01000006
+#define HFI_CMD_BUFFER				0x01000009
 #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
 #define HFI_CMD_END				0x01FFFFFF
 
@@ -53,6 +54,7 @@
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
+#define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
 #define HFI_PROP_END				0x03FFFFFF
 
 #define HFI_SESSION_ERROR_BEGIN			0x04000000
@@ -105,6 +107,13 @@ enum hfi_buffer_type {
 	HFI_BUFFER_VPSS				= 0x0000000D,
 };
 
+enum hfi_buffer_host_flags {
+	HFI_BUF_HOST_FLAG_RELEASE		= 0x00000001,
+	HFI_BUF_HOST_FLAG_READONLY		= 0x00000010,
+	HFI_BUF_HOST_FLAG_CODEC_CONFIG		= 0x00000100,
+	HFI_BUF_HOST_FLAGS_CB_NON_SECURE	= 0x00000200,
+};
+
 enum hfi_packet_firmware_flags {
 	HFI_FW_FLAGS_SUCCESS			= 0x00000001,
 	HFI_FW_FLAGS_INFORMATION		= 0x00000002,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
index bb86abd25adb..3083a5174cdc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
@@ -61,6 +61,47 @@ struct iris_hfi_packet {
 	u32 payload[];
 };
 
+/**
+ * struct iris_hfi_buffer
+ *
+ * @type: buffer type indicated by "enum hfi_buffer_type"
+ *        FW needs to return proper type for any buffer command.
+ * @index: index of the buffer
+ * @base_address: base address of the buffer.
+ *                This buffer address is always 4KBytes aligned.
+ * @addr_offset: accessible buffer offset from base address
+ *               Decoder bitstream buffer: 256 Bytes aligned
+ *               Firmware can uniquely identify a buffer based on
+ *               base_address & addr_offset.
+ *               HW can read memory only from base_address+addr_offset.
+ * @buffer_size: accessible buffer size in bytes starting from addr_offset
+ * @data_offset: data starts from "base_address + addr_offset + data_offset"
+ *               RAW buffer: data_offset is 0. Restriction: 4KBytes aligned
+ *               decoder bitstream buffer: no restriction (can be any value)
+ * @data_size: data size in bytes
+ * @flags: buffer flags. It is represented as bit masks.
+ *         host buffer flags are "enum hfi_buffer_host_flags"
+ *         firmware buffer flags are "enum hfi_buffer_firmware_flags"
+ * @timestamp: timestamp of the buffer in nano seconds (ns)
+ *             It is Presentation timestamp (PTS) for encoder & decoder.
+ *             Decoder: it is pass through from bitstream to raw buffer.
+ *                      firmware does not need to return as part of input buffer done.
+ *             For any internal buffers: there is no timestamp. Host sets as 0.
+ * @reserved: reserved for future use
+ */
+struct iris_hfi_buffer {
+	u32 type;
+	u32 index;
+	u64 base_address;
+	u32 addr_offset;
+	u32 buffer_size;
+	u32 data_offset;
+	u32 data_size;
+	u64 timestamp;
+	u32 flags;
+	u32 reserved[5];
+};
+
 u32 iris_hfi_gen2_get_color_primaries(u32 primaries);
 u32 iris_hfi_gen2_get_transfer_char(u32 characterstics);
 u32 iris_hfi_gen2_get_matrix_coefficients(u32 coefficients);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index d1a26c18971f..c7f1b6cf102f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -25,6 +25,93 @@ struct iris_hfi_gen2_packet_handle {
 	int (*handle)(struct iris_inst *inst, struct iris_hfi_packet *pkt);
 };
 
+static u32 iris_hfi_gen2_buf_type_to_driver(enum hfi_buffer_type buf_type)
+{
+	switch (buf_type) {
+	case HFI_BUFFER_BITSTREAM:
+		return BUF_INPUT;
+	case HFI_BUFFER_RAW:
+		return BUF_OUTPUT;
+	case HFI_BUFFER_BIN:
+		return BUF_BIN;
+	case HFI_BUFFER_ARP:
+		return BUF_ARP;
+	case HFI_BUFFER_COMV:
+		return BUF_COMV;
+	case HFI_BUFFER_NON_COMV:
+		return BUF_NON_COMV;
+	case HFI_BUFFER_LINE:
+		return BUF_LINE;
+	case HFI_BUFFER_DPB:
+		return BUF_DPB;
+	case HFI_BUFFER_PERSIST:
+		return BUF_PERSIST;
+	default:
+		return 0;
+	}
+}
+
+static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
+{
+	switch (buffer_type)
+	case HFI_BUFFER_BITSTREAM:
+	case HFI_BUFFER_RAW:
+	case HFI_BUFFER_BIN:
+	case HFI_BUFFER_ARP:
+	case HFI_BUFFER_COMV:
+	case HFI_BUFFER_NON_COMV:
+	case HFI_BUFFER_LINE:
+	case HFI_BUFFER_DPB:
+	case HFI_BUFFER_PERSIST:
+	case HFI_BUFFER_VPSS:
+		return true;
+
+	return true;
+}
+
+static bool iris_hfi_gen2_is_valid_hfi_port(u32 port, u32 buffer_type)
+{
+	if (port == HFI_PORT_NONE && buffer_type != HFI_BUFFER_PERSIST)
+		return false;
+
+	if (port != HFI_PORT_BITSTREAM && port != HFI_PORT_RAW)
+		return false;
+
+	return true;
+}
+
+static bool iris_hfi_gen2_validate_packet_payload(struct iris_hfi_packet *pkt)
+{
+	u32 payload_size = 0;
+
+	switch (pkt->payload_info) {
+	case HFI_PAYLOAD_U32:
+	case HFI_PAYLOAD_S32:
+	case HFI_PAYLOAD_Q16:
+	case HFI_PAYLOAD_U32_ENUM:
+	case HFI_PAYLOAD_32_PACKED:
+		payload_size = 4;
+		break;
+	case HFI_PAYLOAD_U64:
+	case HFI_PAYLOAD_S64:
+	case HFI_PAYLOAD_64_PACKED:
+		payload_size = 8;
+		break;
+	case HFI_PAYLOAD_STRUCTURE:
+		if (pkt->type == HFI_CMD_BUFFER)
+			payload_size = sizeof(struct iris_hfi_buffer);
+		break;
+	default:
+		payload_size = 0;
+		break;
+	}
+
+	if (pkt->size < sizeof(struct iris_hfi_packet) + payload_size)
+		return false;
+
+	return true;
+}
+
 static int iris_hfi_gen2_validate_packet(u8 *response_pkt, u8 *core_resp_pkt)
 {
 	u32 response_pkt_size = 0;
@@ -141,9 +228,65 @@ static void iris_hfi_gen2_handle_session_close(struct iris_inst *inst,
 	complete(&inst->completion);
 }
 
+static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
+							struct iris_hfi_buffer *buffer)
+{
+	struct iris_buffer *buf, *iter;
+	struct iris_buffers *buffers;
+	u32 buf_type;
+	int ret = 0;
+	bool found;
+
+	buf_type = iris_hfi_gen2_buf_type_to_driver(buffer->type);
+	buffers = &inst->buffers[buf_type];
+
+	found = false;
+	list_for_each_entry(iter, &buffers->list, list) {
+		if (iter->device_addr == buffer->base_address) {
+			found = true;
+			buf = iter;
+			break;
+		}
+	}
+	if (!found)
+		return -EINVAL;
+
+	buf->attr &= ~BUF_ATTR_QUEUED;
+
+	if (buf->attr & BUF_ATTR_PENDING_RELEASE)
+		ret = iris_destroy_internal_buffer(inst, buf);
+
+	return ret;
+}
+
+static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
+					       struct iris_hfi_packet *pkt)
+{
+	struct iris_hfi_buffer *buffer;
+
+	if (pkt->payload_info == HFI_PAYLOAD_NONE)
+		return 0;
+
+	if (!iris_hfi_gen2_validate_packet_payload(pkt)) {
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+		return 0;
+	}
+
+	buffer = (struct iris_hfi_buffer *)((u8 *)pkt + sizeof(*pkt));
+	if (!iris_hfi_gen2_is_valid_hfi_buffer_type(buffer->type))
+		return 0;
+
+	if (!iris_hfi_gen2_is_valid_hfi_port(pkt->port, buffer->type))
+		return 0;
+
+	return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
+}
+
 static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
 						struct iris_hfi_packet *pkt)
 {
+	int ret = 0;
+
 	switch (pkt->type) {
 	case HFI_CMD_CLOSE:
 		iris_hfi_gen2_handle_session_close(inst, pkt);
@@ -151,11 +294,14 @@ static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
 	case HFI_CMD_STOP:
 		complete(&inst->completion);
 		break;
+	case HFI_CMD_BUFFER:
+		ret = iris_hfi_gen2_handle_session_buffer(inst, pkt);
+		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a01391845c6..30bc3c0e57a2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -68,6 +68,7 @@ enum platform_inst_driver_cap_type {
 	FRAME_WIDTH = 1,
 	FRAME_HEIGHT,
 	MBPF,
+	NUM_COMV,
 	INST_DRIVER_CAP_MAX,
 };
 
@@ -163,6 +164,10 @@ struct iris_platform_data {
 	unsigned int dec_input_prop_size;
 	const u32 *dec_output_prop;
 	unsigned int dec_output_prop_size;
+	const u32 *dec_ip_int_buf_tbl;
+	unsigned int dec_ip_int_buf_tbl_size;
+	const u32 *dec_op_int_buf_tbl;
+	unsigned int dec_op_int_buf_tbl_size;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 6b5444b71090..8316f7081ce0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -105,6 +105,15 @@ static const u32 sm8250_vdec_input_config_param[] = {
 	HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
 };
 
+static const u32 sm8250_dec_ip_int_buf_tbl[] = {
+	BUF_BIN,
+	BUF_SCRATCH_1,
+};
+
+static const u32 sm8250_dec_op_int_buf_tbl[] = {
+	BUF_DPB,
+};
+
 struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
@@ -136,4 +145,9 @@ struct iris_platform_data sm8250_data = {
 		sm8250_vdec_input_config_param,
 	.input_config_params_size =
 		ARRAY_SIZE(sm8250_vdec_input_config_param),
+
+	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index fccee5309d81..3d84e1a6796c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -32,6 +32,12 @@ static struct platform_inst_driver_cap instance_driver_cap_data_sm8550[] = {
 		.max = 138240,
 		.value = 138240,
 	},
+	{
+		.cap_id = NUM_COMV,
+		.min = 0,
+		.max = INT_MAX,
+		.value = 0,
+	},
 };
 
 static struct platform_inst_fw_cap instance_fw_cap_data_sm8550[] = {
@@ -216,6 +222,17 @@ static const u32 sm8550_vdec_subscribe_output_properties[] = {
 	HFI_PROP_CABAC_SESSION,
 };
 
+static const u32 sm8550_dec_ip_int_buf_tbl[] = {
+	BUF_BIN,
+	BUF_COMV,
+	BUF_NON_COMV,
+	BUF_LINE,
+};
+
+static const u32 sm8550_dec_op_int_buf_tbl[] = {
+	BUF_DPB,
+};
+
 struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
@@ -257,4 +274,9 @@ struct iris_platform_data sm8550_data = {
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
 	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
 	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ae39dd9e0dae..d7895fa4b87c 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -306,7 +306,29 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
-	return iris_vdec_process_streamon_input(inst);
+	ret = iris_alloc_and_queue_persist_bufs(inst);
+	if (ret)
+		return ret;
+
+	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	ret = iris_create_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	ret = iris_queue_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	ret = iris_vdec_process_streamon_input(inst);
+	if (ret)
+		return ret;
+
+	return ret;
 }
 
 static int iris_vdec_process_streamon_output(struct iris_inst *inst)
@@ -330,10 +352,24 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		goto error;
+
+	ret = iris_create_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		goto error;
+
 	ret = iris_vdec_process_streamon_output(inst);
 	if (ret)
 		goto error;
 
+	ret = iris_queue_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		return ret;
+
 	return ret;
 
 error:
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 2aad96bbaf94..1df724588846 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -168,6 +168,15 @@ int iris_open(struct file *filp)
 
 	mutex_init(&inst->lock);
 	mutex_init(&inst->ctx_q_lock);
+
+	INIT_LIST_HEAD(&inst->buffers[BUF_BIN].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_ARP].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_COMV].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_NON_COMV].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_LINE].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_DPB].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_PERSIST].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_1].list);
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
 
@@ -254,6 +263,8 @@ int iris_close(struct file *filp)
 	iris_session_close(inst);
 	iris_inst_change_state(inst, IRIS_INST_DEINIT);
 	iris_v4l2_fh_deinit(inst);
+	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 7efabaebd082..8cc539066070 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -6,7 +6,194 @@
 #include "iris_instance.h"
 #include "iris_vpu_buffer.h"
 
-u32 iris_vpu_dec_dpb_size(struct iris_inst *inst)
+static u32 size_h264d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 size_yuv, size_bin_hdr, size_bin_res;
+
+	size_yuv = ((frame_width * frame_height) <= BIN_BUFFER_THRESHOLD) ?
+			((BIN_BUFFER_THRESHOLD * 3) >> 1) :
+			((frame_width * frame_height * 3) >> 1);
+	size_bin_hdr = size_yuv * H264_CABAC_HDR_RATIO_HD_TOT;
+	size_bin_res = size_yuv * H264_CABAC_RES_RATIO_HD_TOT;
+	size_bin_hdr = ALIGN(size_bin_hdr / num_vpp_pipes,
+			     DMA_ALIGNMENT) * num_vpp_pipes;
+	size_bin_res = ALIGN(size_bin_res / num_vpp_pipes,
+			     DMA_ALIGNMENT) * num_vpp_pipes;
+
+	return size_bin_hdr + size_bin_res;
+}
+
+static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 n_aligned_w, n_aligned_h;
+
+	n_aligned_w = ALIGN(frame_width, 16);
+	n_aligned_h = ALIGN(frame_height, 16);
+
+	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h,
+					num_vpp_pipes);
+}
+
+static u32 hfi_buffer_comv_h264d(u32 frame_width, u32 frame_height, u32 _comv_bufcount)
+{
+	u32 frame_width_in_mbs = DIV_ROUND_UP(frame_width, 16);
+	u32 frame_height_in_mbs = DIV_ROUND_UP(frame_height, 16);
+	u32 col_mv_aligned_width = (frame_width_in_mbs << 7);
+	u32 col_zero_aligned_width = (frame_width_in_mbs << 2);
+	u32 col_zero_size = 0, size_colloc = 0;
+
+	col_mv_aligned_width =
+		ALIGN(col_mv_aligned_width, 16);
+	col_zero_aligned_width =
+		ALIGN(col_zero_aligned_width, 16);
+	col_zero_size = col_zero_aligned_width *
+			((frame_height_in_mbs + 1) >> 1);
+	col_zero_size = ALIGN(col_zero_size, 64);
+	col_zero_size <<= 1;
+	col_zero_size = ALIGN(col_zero_size, 512);
+	size_colloc = col_mv_aligned_width * ((frame_height_in_mbs + 1) >> 1);
+	size_colloc = ALIGN(size_colloc, 64);
+	size_colloc <<= 1;
+	size_colloc = ALIGN(size_colloc, 512);
+	size_colloc += (col_zero_size + SIZE_H264D_BUFTAB_T * 2);
+
+	return (size_colloc * (_comv_bufcount)) + 512;
+}
+
+static u32 size_h264d_bse_cmd_buf(u32 frame_height)
+{
+	u32 height = ALIGN(frame_height, 32);
+
+	return min_t(u32, (DIV_ROUND_UP(height, 16) * 48), H264D_MAX_SLICE) *
+		SIZE_H264D_BSE_CMD_PER_BUF;
+}
+
+static u32 size_h264d_vpp_cmd_buf(u32 frame_height)
+{
+	u32 size, height;
+
+	height = ALIGN(frame_height, 32);
+	size = min_t(u32, (DIV_ROUND_UP(height, 16) * 48), H264D_MAX_SLICE) *
+			SIZE_H264D_VPP_CMD_PER_BUF;
+
+	if (size > VPP_CMD_MAX_SIZE)
+		size = VPP_CMD_MAX_SIZE;
+
+	return size;
+}
+
+static u32 hfi_buffer_persist_h264d(void)
+{
+	return ALIGN(SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264 +
+		    H264_DISPLAY_BUF_SIZE * H264_NUM_FRM_INFO +
+		    NUM_HW_PIC_BUF * SIZE_SEI_USERDATA,
+		    DMA_ALIGNMENT);
+}
+
+static u32 hfi_buffer_non_comv_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 size_bse, size_vpp, size;
+
+	size_bse = size_h264d_bse_cmd_buf(frame_height);
+	size_vpp = size_h264d_vpp_cmd_buf(frame_height);
+	size = ALIGN(size_bse, DMA_ALIGNMENT) +
+		ALIGN(size_vpp, DMA_ALIGNMENT) +
+		ALIGN(SIZE_HW_PIC(SIZE_H264D_HW_PIC_T), DMA_ALIGNMENT);
+
+	return ALIGN(size, DMA_ALIGNMENT);
+}
+
+static u32 size_vpss_lb(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 vpss_4tap_left_buffer_size = 0, vpss_div2_left_buffer_size = 0;
+	u32 vpss_4tap_top_buffer_size = 0, vpss_div2_top_buffer_size = 0;
+	u32 opb_lb_wr_llb_y_buffer_size, opb_lb_wr_llb_uv_buffer_size;
+	u32 opb_wr_top_line_chroma_buffer_size;
+	u32 opb_wr_top_line_luma_buffer_size;
+	u32 macrotiling_size = 32, size;
+
+	opb_wr_top_line_luma_buffer_size =
+		ALIGN(frame_width, macrotiling_size) / macrotiling_size * 256;
+	opb_wr_top_line_luma_buffer_size =
+		ALIGN(opb_wr_top_line_luma_buffer_size, DMA_ALIGNMENT) +
+		(MAX_TILE_COLUMNS - 1) * 256;
+	opb_wr_top_line_luma_buffer_size =
+		max_t(u32, opb_wr_top_line_luma_buffer_size, (32 * ALIGN(frame_height, 8)));
+	opb_wr_top_line_chroma_buffer_size = opb_wr_top_line_luma_buffer_size;
+	opb_lb_wr_llb_uv_buffer_size =
+		ALIGN((ALIGN(frame_height, 8) / (4 / 2)) * 64, 32);
+	opb_lb_wr_llb_y_buffer_size =
+		ALIGN((ALIGN(frame_height, 8) / (4 / 2)) * 64, 32);
+	size = num_vpp_pipes * 2 *
+		(vpss_4tap_top_buffer_size + vpss_div2_top_buffer_size) +
+		2 * (vpss_4tap_left_buffer_size + vpss_div2_left_buffer_size) +
+		opb_wr_top_line_luma_buffer_size +
+		opb_wr_top_line_chroma_buffer_size +
+		opb_lb_wr_llb_uv_buffer_size +
+		opb_lb_wr_llb_y_buffer_size;
+
+	return size;
+}
+
+static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
+				 bool is_opb, u32 num_vpp_pipes)
+{
+	u32 vpss_lb_size = 0;
+	u32 size;
+
+	size = ALIGN(size_h264d_lb_fe_top_data(frame_width), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_fe_top_ctrl(frame_width), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_fe_left_ctrl(frame_height), DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_h264d_lb_se_top_ctrl(frame_width), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_se_left_ctrl(frame_height), DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_h264d_lb_pe_top_data(frame_width), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_vsp_top(frame_width), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_recon_dma_metadata_wr(frame_height), DMA_ALIGNMENT) * 2 +
+		ALIGN(size_h264d_qp(frame_width, frame_height), DMA_ALIGNMENT);
+	size = ALIGN(size, DMA_ALIGNMENT);
+	if (is_opb)
+		vpss_lb_size = size_vpss_lb(frame_width, frame_height, num_vpp_pipes);
+
+	size = ALIGN((size + vpss_lb_size), DMA_ALIGNMENT);
+
+	return size;
+}
+
+static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	u32 width, height, num_vpp_pipes;
+	struct v4l2_format *f;
+
+	num_vpp_pipes = core->iris_platform_data->num_vpp_pipe;
+
+	f = inst->fmt_src;
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	return hfi_buffer_bin_h264d(width, height, num_vpp_pipes);
+}
+
+static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
+{
+	u32 width, height, num_comv;
+	struct v4l2_format *f;
+
+	f = inst->fmt_src;
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	num_comv = inst->buffers[BUF_OUTPUT].min_count;
+
+	return hfi_buffer_comv_h264d(width, height, num_comv);
+}
+
+static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
+{
+	return hfi_buffer_persist_h264d();
+}
+
+static u32 iris_vpu_dec_dpb_size(struct iris_inst *inst)
 {
 	if (iris_split_mode_enabled(inst))
 		return iris_get_buffer_size(inst, BUF_DPB);
@@ -14,6 +201,82 @@ u32 iris_vpu_dec_dpb_size(struct iris_inst *inst)
 		return 0;
 }
 
+static u32 iris_vpu_dec_non_comv_size(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	u32 width, height, num_vpp_pipes;
+	struct v4l2_format *f;
+
+	num_vpp_pipes = core->iris_platform_data->num_vpp_pipe;
+
+	f = inst->fmt_src;
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	return hfi_buffer_non_comv_h264d(width, height, num_vpp_pipes);
+}
+
+static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	u32 width, height, num_vpp_pipes;
+	struct v4l2_format *f;
+	bool is_opb = false;
+
+	num_vpp_pipes = core->iris_platform_data->num_vpp_pipe;
+
+	if (iris_split_mode_enabled(inst))
+		is_opb = true;
+
+	f = inst->fmt_src;
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	return hfi_buffer_line_h264d(width, height, is_opb,
+				     num_vpp_pipes);
+}
+
+static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
+{
+	return iris_vpu_dec_comv_size(inst) +
+		iris_vpu_dec_non_comv_size(inst) +
+		iris_vpu_dec_line_size(inst);
+}
+
+struct iris_vpu_buf_type_handle {
+	enum iris_buffer_type type;
+	u32 (*handle)(struct iris_inst *inst);
+};
+
+int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
+	u32 size = 0, buf_type_handle_size = 0;
+	int i;
+
+	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_dec_bin_size             },
+		{BUF_COMV,        iris_vpu_dec_comv_size            },
+		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size        },
+		{BUF_LINE,        iris_vpu_dec_line_size            },
+		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
+		{BUF_DPB,         iris_vpu_dec_dpb_size             },
+		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size        },
+	};
+
+	buf_type_handle_size = ARRAY_SIZE(dec_internal_buf_type_handle);
+	buf_type_handle_arr = dec_internal_buf_type_handle;
+
+	for (i = 0; i < buf_type_handle_size; i++) {
+		if (buf_type_handle_arr[i].type == buffer_type) {
+			size = buf_type_handle_arr[i].handle(inst);
+			break;
+		}
+	}
+
+	return size;
+}
+
 static inline int iris_vpu_dpb_count(struct iris_inst *inst)
 {
 	int count = 0;
@@ -33,6 +296,13 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type
 		return MIN_BUFFERS;
 	case BUF_OUTPUT:
 		return inst->fw_min_count;
+	case BUF_BIN:
+	case BUF_COMV:
+	case BUF_NON_COMV:
+	case BUF_LINE:
+	case BUF_PERSIST:
+	case BUF_SCRATCH_1:
+		return 1; /* internal buffer count needed by firmware is 1 */
 	case BUF_DPB:
 		return iris_vpu_dpb_count(inst);
 	default:
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 03a181c5754d..1bc598ee9c20 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -10,7 +10,82 @@ struct iris_inst;
 
 #define MIN_BUFFERS			4
 
-u32 iris_vpu_dec_dpb_size(struct iris_inst *inst);
+#define DMA_ALIGNMENT			256
+
+#define NUM_HW_PIC_BUF			32
+#define SIZE_HW_PIC(size_per_buf)	(NUM_HW_PIC_BUF * (size_per_buf))
+
+#define MAX_TILE_COLUMNS		32
+#define BIN_BUFFER_THRESHOLD		(1280 * 736)
+#define VPP_CMD_MAX_SIZE		(BIT(20))
+#define H264D_MAX_SLICE			1800
+
+#define SIZE_H264D_BUFTAB_T		256
+#define SIZE_H264D_BSE_CMD_PER_BUF	(32 * 4)
+#define SIZE_H264D_VPP_CMD_PER_BUF	512
+
+#define NUM_SLIST_BUF_H264		(256 + 32)
+#define SIZE_SLIST_BUF_H264		512
+#define H264_DISPLAY_BUF_SIZE		3328
+#define H264_NUM_FRM_INFO		66
+
+#define SIZE_SEI_USERDATA		4096
+
+#define H264_CABAC_HDR_RATIO_HD_TOT	1
+#define H264_CABAC_RES_RATIO_HD_TOT	3
+#define SIZE_H264D_HW_PIC_T		(BIT(11))
+
+#define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	64
+#define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	16
+#define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE	384
+#define MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE	640
+
+static inline u32 size_h264d_lb_fe_top_data(u32 frame_width)
+{
+	return MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * ALIGN(frame_width, 16) * 3;
+}
+
+static inline u32 size_h264d_lb_fe_top_ctrl(u32 frame_width)
+{
+	return MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
+}
+
+static inline u32 size_h264d_lb_fe_left_ctrl(u32 frame_height)
+{
+	return MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_height, 16);
+}
+
+static inline u32 size_h264d_lb_se_top_ctrl(u32 frame_width)
+{
+	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
+}
+
+static inline u32 size_h264d_lb_se_left_ctrl(u32 frame_height)
+{
+	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_height, 16);
+}
+
+static inline u32 size_h264d_lb_pe_top_data(u32 frame_width)
+{
+	return MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
+}
+
+static inline u32 size_h264d_lb_vsp_top(u32 frame_width)
+{
+	return (DIV_ROUND_UP(frame_width, 16) << 7);
+}
+
+static inline u32 size_h264d_lb_recon_dma_metadata_wr(u32 frame_height)
+{
+	return ALIGN(frame_height, 16) * 32;
+}
+
+static inline u32 size_h264d_qp(u32 frame_width, u32 frame_height)
+{
+	return DIV_ROUND_UP(frame_width, 64) * DIV_ROUND_UP(frame_height, 64) * 128;
+}
+
+int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif

-- 
2.34.1



