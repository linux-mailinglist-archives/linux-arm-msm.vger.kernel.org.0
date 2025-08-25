Return-Path: <linux-arm-msm+bounces-70616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EDDB33C76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F6BE16AB81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBD6393DD0;
	Mon, 25 Aug 2025 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZwgqspk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4252D8DCE
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117219; cv=none; b=YQTpG5QAtYcWw16ELHewtzuHsll0fpHmy1/0H8hQfkUdgUlTnjqE9wTRgVdqHYqsC/3/EayIgqn9LTRb0YK4Dv+qwFH3m3z0wsAyWDnEphK0q0mv9ha6/PlTMg2Rje9PfTN7PRxtl9G18hXJzGI8r6cptEiXarl3NZQjBz6NOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117219; c=relaxed/simple;
	bh=W7NXjk0BMr+J9E8SKOZB7NfMcfgJ9f2lzy6cXJ0PqsI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=giRgtXPmhOaPd29AEm64FiQium29tIefLBSxdkvHOzuOTlj10LBLgGoBOIlEBS5P1yp/RL/7IUfP3J1KP8Z+vCNsQ7b8glCg+pEYCjE1s1xO9NR5GX3oxq8C1HaUBje1hTviKQfa2hdPBMaCjpQuKRNsODfJrRBHO+fzftTLM9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZwgqspk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P7XrQo024681
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oQHjcEv+Bw/
	0FVCSsLmMLk67WbYeOVJJSa7VsU3wblg=; b=JZwgqspk3gufwW+OEl3eqqAm3VP
	44C6KxK8NjSbOsTviOsJBnYSQzOU4FRVyi12rApt0Ogn0fCxqI+V91AUMvgeSlPW
	dp8h8Wkti0uDcguvn/NmxLYgMTu3TWU4cnYuK+DGHOowWETU1tEQNPFea3tZXWgM
	lmOfP31iH4XBvbi4JhhpbMdr0ZhKnFCU/9hlhJxaoGn6mjy27fjt3QQuxTXT1LaM
	tQUQfmtXob1UT1W0+RjNMf2/sjmAukZlXdy/s4x3DG1xn64XtAmLG0+JbLdlmMhI
	QULn4VbebX2kInVYLnzpFhhRYpQYJH/kILyQK9ZKf/YQR5zKUVC1MWLJ4Iw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc4mjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:20:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4c229e2a42so433442a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117201; x=1756722001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQHjcEv+Bw/0FVCSsLmMLk67WbYeOVJJSa7VsU3wblg=;
        b=wiRo4rPIh06smNvif6+uQlGDP9OKPol0K3gONCC4gIjpDMgYZ+rQZcoUcWPf5jRt0H
         ntzxc3r9KaX8sCDZdj3ia7mHwU+DXxy3+Ms8E1ocMBhUi3+W/ySkJXK+yBQoYX0PaTb2
         275n7+TlaV1RCUlmooeJWKCap2HW++BGc5r032abIcmeU4lySBsFWL6BsS8C/use1vqP
         RXWpXp9S0B+/pNfIPyD3KclNyT2izoEbWv2q6WU4aOKfD8RtepC4MaPSK02zaJ2SGtlT
         rQRO9OR/GsTS/ZabO9j1BEo9IJc7SRpbif6oSVSiz0aorMkI4NuLtf6Pty5bdPsaZ+JM
         rXCg==
X-Forwarded-Encrypted: i=1; AJvYcCW9C2DprP34AcyAmcSyOll1NWrXVrmX/gjCWfnqZjzLDA2Y6eY7Yvrrr9zfX6c2dOyJEj9ME7SRvMq7pnOO@vger.kernel.org
X-Gm-Message-State: AOJu0YwsWhOjMJ0D73sawDn0tzaelTFhOXkB65/vK35dDgupun/NpsRr
	MpY4P/QbITwwakFHxHohqK9iNa9IO432mBrKoEHmv/JlY79lUmwPaBy9G9zqsYs836bSYKWDmu0
	hgpBuepq0KqwTwI0Q5ZEGLsWyzali9BZCja+mmVzZSVuoO/USSCqe1gtkUnrBAC7XxZUW
X-Gm-Gg: ASbGnctJmyyLQPmYG/yS3GnMLt8VTONsIX7EVPhdtg+cSinDYlsBGuEy8H5T3O1Ot+p
	0LD1EwdEYfVtg2qZxQYrM8WSptGHzXxLx7nLB31/wQEQpFZ0Zujek1TWr6yayHH/oS8qKxkzxuR
	1QcUbQUvAtAde1tNPiPaCqlNIxtfi49IXhlGbHVQ8rUIYeA6qEtPAJanll1fpShO5IRpLnraqu8
	mXUckJ4+wN1uipAwn+yeEhW4xXnyxOJyPXuuJAhd8Ht/v/GzwnybLb8PLBH3Lys6V66Ppzc52wq
	zRFZ7b4HP06e4OyQdCN2VNuXQVZQsiM5wiTugk5QWmYKX3DiGPfHYVe0Gp+XfAdU1hUCHw==
X-Received: by 2002:a17:903:22c5:b0:240:7753:3c07 with SMTP id d9443c01a7336-2462ef22167mr136223725ad.33.1756117200578;
        Mon, 25 Aug 2025 03:20:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqqmI5Fq3sWCKhGJaPF80NyPbaLK3J421YPsvubtopGHdHpjHsRihUNLUpmFb8+rXhpCvDyw==
X-Received: by 2002:a17:903:22c5:b0:240:7753:3c07 with SMTP id d9443c01a7336-2462ef22167mr136223395ad.33.1756117200078;
        Mon, 25 Aug 2025 03:20:00 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:19:59 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 10/12] drivers: soc: qcom: Support for DDR training in Sahara.
Date: Mon, 25 Aug 2025 15:49:24 +0530
Message-Id: <20250825101926.2160554-11-kishore.batta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX3B4kGLu15iED
 XogZqy5M2G1i9W7b8cdyKeo+qEx57uPjDsr+d+XwpDkfoJtfP8z92mxHpwKR+k+rOLsI5LIGaaW
 JjeEp2B3Un1oJiV1iLxJ9v3IlAklvkqCK3fKJJpepI+xCnTYSBKWZKdlU0lK/bMd44hOHW81ooX
 OTnNyDH+6tJ0aPddEWWU94Ex6BIfv9CDYN7n2PUebJo9SeCIMYtCX616mAWWlULGf+gCDI1T6iX
 Qsp1YuwEcLd+fzaT9UqsvOci4b+XvSNk7Wlnn8orXbJsfvnxar36HARlyPDjF+cMkuv5ueGezBS
 VcUS8g8XkW7xgoKJNzbS7f3uOJPy9d+g7xVfJr/ZU+/T+mKYFHaBnQv/Cm3r+Thlvldc62FP6BH
 RnfKBvDW
X-Proofpoint-ORIG-GUID: 7jtw_fsg4tE1EoaB7jr-xe1iFu46ZB6o
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac38d2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8As2ai7MYor7rQyggUgA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 7jtw_fsg4tE1EoaB7jr-xe1iFu46ZB6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

Support DDR training using Sahara command mode packets. Once the COMMAND
EXECUTE packet is sent to the device, it responds with a packet containing
the command ID. At this stage of boot, only the DDR training data command
(ID - 9) is supported by the device. The host sends the command execute
packet to execute command 9, and the device responds with the training
data. This data is the actual DDR training data attached to the device,
and its size is included in the response packet sent by the device.

Based on the size of the training data, the host queues multiple buffers
to MHI to receive the data. This data is stored in a memory location
and made available to the sysfs node.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/soc/qcom/sahara/sahara.c | 197 +++++++++++++++++++++++++++++++
 1 file changed, 197 insertions(+)

diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
index 81d9b40d0f92..3887cdcfe256 100644
--- a/drivers/soc/qcom/sahara/sahara.c
+++ b/drivers/soc/qcom/sahara/sahara.c
@@ -60,8 +60,14 @@
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
 #define SAHARA_COMMAND_READY_LENGTH	0x8
+#define SAHARA_COMMAND_EXEC_RESP_LENGTH	0x10
 #define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
+#define SAHARA_COMMAND_EXEC_DATA_LENGTH	0xc
+#define SAHARA_SWITCH_MODE_LENGTH	0xc
+
 #define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
+#define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
+#define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
 
 struct sahara_dev_trng_data {
 	void *trng_data;
@@ -113,6 +119,16 @@ struct sahara_packet {
 		struct {
 			__le32 client_command;
 		} command_execute;
+		struct {
+			__le32 client_command;
+			__le32 response_length;
+		} command_execute_resp;
+		struct {
+			__le32 client_command;
+		} command_exec_data;
+		struct {
+			__le32 mode;
+		} mode_switch;
 	};
 };
 
@@ -178,6 +194,7 @@ struct sahara_context {
 	struct sahara_packet		*rx;
 	struct work_struct		fw_work;
 	struct work_struct		dump_work;
+	struct work_struct		cmd_work;
 	struct mhi_device		*mhi_dev;
 	const char * const		*image_table;
 	u32				table_size;
@@ -194,6 +211,8 @@ struct sahara_context {
 	void				*mem_dump_freespace;
 	u64				dump_images_left;
 	enum sahara_mode		current_mode;
+	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
+	u64				bytes_copied;
 };
 
 struct sahara_dev_driver_data {
@@ -555,6 +574,21 @@ static void sahara_command_execute(struct sahara_context *context, u32 client_co
 		dev_err(&context->mhi_dev->dev, "Unable to send command execute %d\n", ret);
 }
 
+static void sahara_switch_mode_to_img_tx(struct sahara_context *context)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_SWITCH_MODE_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_SWITCH_MODE_LENGTH);
+	context->tx[0]->mode_switch.mode = SAHARA_MODE_IMAGE_TX_PENDING;
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_SWITCH_MODE_LENGTH, MHI_EOT);
+
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send mode switch %d\n", ret);
+}
+
 static void sahara_command_ready(struct sahara_context *context)
 {
 	dev_dbg(&context->mhi_dev->dev,
@@ -580,6 +614,165 @@ static void sahara_command_ready(struct sahara_context *context)
 	 sahara_command_execute(context, SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST);
 }
 
+static void sahara_alloc_mem_training_data(struct sahara_context *context)
+{
+	struct sahara_dev_driver_data *sahara_data;
+	struct sahara_dev_trng_data *sdev;
+
+	sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
+	sdev = sahara_data->sdev;
+
+	sdev->trng_data = kzalloc(sdev->trng_data_sz, GFP_KERNEL);
+	if (!sdev->trng_data) {
+		sahara_send_reset(context);
+		return;
+	}
+
+	for (int i = 0; i < SAHARA_NUM_CMD_BUF; ++i) {
+		context->cmd_buff[i] = devm_kzalloc(&context->mhi_dev->dev,
+						    SAHARA_PACKET_MAX_SIZE,
+						    GFP_KERNEL);
+		if (!context->cmd_buff[i]) {
+			dev_err(&context->mhi_dev->dev,
+				"Failed to allocate cmd_buff[%d]\n", i);
+			sahara_send_reset(context);
+			/*
+			 * Mark unused entries as NULL to avoid accidental usage
+			 */
+			while (--i >= 0)
+				context->cmd_buff[i] = NULL;
+
+			return;
+		}
+	}
+}
+
+static void sahara_command_execute_resp(struct sahara_context *context)
+{
+	int ret;
+	int client_command;
+	int response_length;
+	struct sahara_dev_driver_data *sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
+	struct sahara_dev_trng_data *sdev = sahara_data->sdev;
+
+	dev_dbg(&context->mhi_dev->dev,
+		"Command execute resp received. Length: %d resp_length: %d\n",
+		le32_to_cpu(context->rx->length),
+		le32_to_cpu(context->rx->command_execute_resp.response_length));
+
+	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_EXEC_RESP_LENGTH ||
+	    le32_to_cpu(context->rx->command_execute_resp.response_length < 0)) {
+		dev_err(&context->mhi_dev->dev,
+			"Malformed command execute resp packet - length %d\n",
+			le32_to_cpu(context->rx->length));
+
+		return;
+	}
+
+	client_command = le32_to_cpu(context->rx->command_execute_resp.client_command);
+	response_length = le32_to_cpu(context->rx->command_execute_resp.response_length);
+
+	if (client_command == SAHARA_EXEC_CMD_GET_TRAINING_DATA) {
+		sdev->trng_data_sz = response_length;
+		sahara_data->ddr_attr.size = response_length;
+		sdev->receiving_trng_data = true;
+
+		sahara_alloc_mem_training_data(context);
+
+		/* Queue multiple buffers for receiving data */
+		u64 data_len = sdev->trng_data_sz;
+		u64 pkt_data_len;
+		int i;
+
+		for (i = 0; i < SAHARA_NUM_CMD_BUF && data_len; ++i) {
+			pkt_data_len = min(data_len, SAHARA_PACKET_MAX_SIZE);
+			ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE,
+					    context->cmd_buff[i], pkt_data_len,
+					    data_len <= pkt_data_len ? MHI_EOT : MHI_CHAIN);
+
+			if (ret) {
+				dev_err(&context->mhi_dev->dev,
+					"Unable to queue command buff %d\n", ret);
+				return;
+			}
+
+			data_len -= pkt_data_len;
+		}
+	}
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_DATA_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXEC_DATA_LENGTH);
+	context->tx[0]->command_exec_data.client_command =
+		cpu_to_le32(context->rx->command_execute_resp.client_command);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE,
+			    context->tx[0], SAHARA_COMMAND_EXEC_DATA_LENGTH, MHI_EOT);
+
+	if (ret)
+		dev_err(&context->mhi_dev->dev,
+			"Unable to send command exec get data command %d\n", ret);
+}
+
+static void sahara_handle_training_data(struct sahara_context *context)
+{
+	u64 bytes_copied = context->bytes_copied;
+	u64 bytes_to_copy;
+	int i;
+	struct sahara_dev_driver_data *sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
+	struct sahara_dev_trng_data *sdev = sahara_data->sdev;
+
+	for (i = 0; i < SAHARA_NUM_CMD_BUF && bytes_copied < sdev->trng_data_sz; ++i) {
+		bytes_to_copy = min_t(size_t, SAHARA_PACKET_MAX_SIZE,
+				      sdev->trng_data_sz - bytes_copied);
+
+		/* Copy the received data into the training data buffer */
+		memcpy(sdev->trng_data + bytes_copied, context->cmd_buff[i], bytes_to_copy);
+
+		bytes_copied += bytes_to_copy;
+		context->bytes_copied = bytes_copied;
+	}
+
+	if (bytes_copied == sdev->trng_data_sz) {
+		/* Handle completion of data reception */
+		sahara_switch_mode_to_img_tx(context);
+		context->current_mode = SAHARA_MODE_FW_DOWNLOAD;
+		sdev->receiving_trng_data = false;
+	}
+}
+
+static void sahara_command_processing(struct work_struct *work)
+{
+	struct sahara_context *context = container_of(work, struct sahara_context, cmd_work);
+	int ret;
+	struct sahara_dev_driver_data *sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
+	struct sahara_dev_trng_data *sdev = sahara_data->sdev;
+
+	if (sdev->receiving_trng_data) {
+		sahara_handle_training_data(context);
+	} else {
+		switch (le32_to_cpu(context->rx->cmd)) {
+		case SAHARA_EXECUTE_RESP_CMD:
+			sahara_command_execute_resp(context);
+			break;
+		case SAHARA_EXEC_CMD_GET_TRAINING_DATA:
+			sahara_command_execute(context, SAHARA_EXEC_CMD_GET_TRAINING_DATA);
+			break;
+		default:
+			dev_err(&context->mhi_dev->dev,
+				"Invalid client command 0x%x\n", le32_to_cpu(context->rx->cmd));
+			break;
+		}
+	}
+
+	/* Requeue buffer for receiving next command */
+	if (!sdev->receiving_trng_data) {
+		ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE, context->rx,
+				    SAHARA_PACKET_MAX_SIZE, MHI_EOT);
+		if (ret)
+			dev_err(&context->mhi_dev->dev, "Unable to requeue rx buf %d\n", ret);
+	}
+}
+
 static void sahara_processing(struct work_struct *work)
 {
 	struct sahara_context *context = container_of(work, struct sahara_context, fw_work);
@@ -906,6 +1099,7 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	context->mhi_dev = mhi_dev;
 	INIT_WORK(&context->fw_work, sahara_processing);
 	INIT_WORK(&context->dump_work, sahara_dump_processing);
+	INIT_WORK(&context->cmd_work, sahara_command_processing);
 
 	/* Get the image table for a given device name */
 	context->image_table = sahara_get_image_table(mhi_dev->mhi_cntrl->name);
@@ -950,6 +1144,7 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
 
 	cancel_work_sync(&context->fw_work);
 	cancel_work_sync(&context->dump_work);
+	cancel_work_sync(&context->cmd_work);
 	vfree(context->mem_dump);
 	sahara_release_image(context);
 	mhi_unprepare_from_transfer(mhi_dev);
@@ -971,6 +1166,8 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 		context->rx_size = mhi_result->bytes_xferd;
 		if (context->current_mode == SAHARA_MODE_MEM_DUMP)
 			schedule_work(&context->dump_work);
+		else if (context->current_mode == SAHARA_MODE_CMD)
+			schedule_work(&context->cmd_work);
 		else
 			schedule_work(&context->fw_work);
 	}
-- 
2.34.1


