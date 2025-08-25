Return-Path: <linux-arm-msm+bounces-70614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E3AB33C77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DDEB7A6123
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC682C1597;
	Mon, 25 Aug 2025 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GheFLRPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB4B221726
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117212; cv=none; b=XKK54dEfSTRncMwiZdBfY50P+E+Yyi9NF4PDo/O9G3eC3m+eZvgtfi/YigEPUSMqRcDKCytZ6YHOeWI6SidQ/Z0VMKyq38jaDGJGMdnROBooOPP/prgsy2yPusN/IqqL7dITyP1vFmprV0+iUcCIk8k9P6EphtqUl5rVcahZW2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117212; c=relaxed/simple;
	bh=0YDIGqGWxc1uAcRjpZaPvFxLvXbbpDZN4l4LA8I9XrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GtOzB9c51nlEogcvxi1/xnATbY9Jxx9b/w8pUKNxi0d9l2N59/lzM0ACs9lRkqZ5ysbI06ysR6MezijaOjhsRJV2d9Uw88ZUAFbVRWF4cZZvMdh5TeTfnG+SsZd0Jhmlg8PxCb4xou9AakJipVCDBWHwfPCKRWsA+3ygRtg5n50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GheFLRPK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Xebx006224
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1hgna0oN0lP
	sPadvurRcFFHKuUbkQOGDmUh2Ww6bgpc=; b=GheFLRPKoZwEDMrOQKNMmttNqgu
	xQVHu7CzBd4UJiIiWtRLAQnI9BS8b89nkSV1nHtyXcuSvpjkcNM/fwDR1f6z674q
	9rotOU3DuaJ2rP6lYDPLKmo5SC1xg3MO0rd/RWYRk21eMxFYuywSEhnhaO6am/Br
	GeIrwf1SVpTgDuNXshjJ27cmSBkWi7aXzwAovOUmjRFtC8MJ4vnBEbQYVO2Xw4yB
	jKvS9Wna7LA4QAfNyD4ehTVhf2Li9R1NlIuygWKgqOX9ox0Y+t3keoAx1onSsafw
	OEkNK225J8ALktSu64SoptJ/XS8wLynRd2tLFv4M31rXFmxRE/0e9XEgIsw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdvn8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-246cf6af36dso10531345ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117195; x=1756721995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hgna0oN0lPsPadvurRcFFHKuUbkQOGDmUh2Ww6bgpc=;
        b=a76Nb8kwSSOn59NLadVvXB15hWgt7IgvzitetBmVnojxTXEq+dLPMNFk8N5Vm5heIJ
         s3Sfrpzw1kuoo+Xxg3uFm45zeof18UCm0AwE1K5MnNoFIXkawgXhZ3LuBb33acfeCbgf
         blIQY+K7uCCSw2yvj9gPMKazVhzYpj1UV5B6TzJbXHMfQNyjwPJRj4znBXv4TjadGUHA
         1UlnGEpxCpHxBHtedwXBgf+aPsOnai5OuYxNfe0AR8dPKEHNuAk+pR+yJRv45c1ix+80
         KYIYTDxooockT3RNChRTxnJ1nc6jNa7X7f3Dmuag/I5K7Vp3zbnYftpWIo+4IzYMawd4
         z1ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK+mCLMs+0/O8nmjDxKRkhfWJS8vWi+IrAuxvxha98Krn+f68Y65M4ICCkfnydonimhTPHRF9vvOExXRxM@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXBtJc9FwQoPQAoFKzNLBEhwTGFJZvGSyHSybGxae+QQX4xDw
	/9y2JBQ/66mEw2IgLpPHAtK8THdqni2QbievLXuKUqbZ5ooWCAGYy9l7xz4OUzkxZCDlGco6O75
	8QW0v7ANt5mDyYNjG3cZbQDvDb1lBpx6c7KL7lHqWLdTcRlsIYsn0mS7EGeXV4e8cml5w
X-Gm-Gg: ASbGncvpWYCDtsgLIReUwrmidCfKjrJ/2ca0N5qYoPKwS/3SFeRiXL22F+jvAT7p2zf
	3rNb4Tc0XV2kK7W9mcwQ7i11D6KkbWxHBqURRiFKXCxhu6fZnP79qCgEuFj9Ye/BIYtv0RfOeRL
	0UYppnTvUXOQhrjPEkBuzqH1qFlWZTjIWnXlKcMC6ZE0+m/CIc8WnWHaLRX3fHSRRibALpZcr5X
	08wq5ne6yjINX8RzoJSPTdJyvHoMwytoq0mRqN1ecqLfg6LcCOv6iT1R+NNPkDw9ef+d9W8xkTK
	RaRpLid0eoZQgr3Y1WImtjhF92oik0EV9x0iK3wneSiW8v7Ut6+2y6gkhcv3PhU23l7Fdg==
X-Received: by 2002:a17:903:1986:b0:240:9ff:d546 with SMTP id d9443c01a7336-2462edecb1cmr166421665ad.6.1756117194958;
        Mon, 25 Aug 2025 03:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXrhxHvUOllJx8JPDRb0ce9z3/XXcrYjcU8zNmWrNfdQfzL6gY8jyiHWzD5Q06f0HPOf4/+Q==
X-Received: by 2002:a17:903:1986:b0:240:9ff:d546 with SMTP id d9443c01a7336-2462edecb1cmr166421285ad.6.1756117194424;
        Mon, 25 Aug 2025 03:19:54 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:19:54 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 08/12] drivers: soc: qcom: Support Sahara command mode packets(READY and EXECUTE)
Date: Mon, 25 Aug 2025 15:49:22 +0530
Message-Id: <20250825101926.2160554-9-kishore.batta@oss.qualcomm.com>
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
X-Proofpoint-GUID: zjh2sufptGJQTxOsc776kzdCzg3xlCdY
X-Proofpoint-ORIG-GUID: zjh2sufptGJQTxOsc776kzdCzg3xlCdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXyKGP6uUCRAaT
 0IUcqea6RbSbuq3lzYVLjrohoBnb8o/a3kkYUxa3PP8zGAmq2U46UJMp+rNxDDODW5tReAijJ0o
 WldW/mE3dyrOVvV2BmI1RgP0muvBWt1c67q7KZXjtFr3sl0cnOHznDx6hP9vGhFPnRvGCSMMQLj
 EITQVVqn6QPQ52FQsmGmkObD641C7uIYs9fv/XJ4XBZT80UO0iCg+ws7PidB5ZsI0xYV3iIwp5q
 hmq5IxwUQLMHOhVHDUkfhmzTNQboAVtRCkmetTlUVDa3IJkC9DVxqWo1/V8ZIT4m1O19o9BdU6q
 sAvtuGiPfvAddo9Ov3W+drdoLmpC3ASPiiPTbca8i7TSCIIPwnAysrmBWaZiUAo1yoSLgE4ALcZ
 6YST9tLp
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ac38cc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=XBas1cQRlLNVJRi6teoA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

During device boot, the device performs DDR training, and this training
data needs to be stored at the host end to improve subsequent boot times.
The Sahara protocol specification indicates that DDR training data can
be stored at the host end using command mode packets. The device sends
the command mode packet to the host through the HELLO packet, and the
host changes its mode of operation accordingly.

Once the device determines that it needs to change the mode of operation
to command mode, it sends the command ready packet. The host receives
the command ready packet and then sends command 8 to get the list of
commands supported by the device as per Sahara protocol specification.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/soc/qcom/sahara/sahara.c | 91 +++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
index df103473af3a..84327af48569 100644
--- a/drivers/soc/qcom/sahara/sahara.c
+++ b/drivers/soc/qcom/sahara/sahara.c
@@ -59,6 +59,9 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_COMMAND_READY_LENGTH	0x8
+#define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
+#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
 
 struct sahara_dev_trng_data {
 	void *trng_data;
@@ -66,6 +69,13 @@ struct sahara_dev_trng_data {
 	bool receiving_trng_data;
 };
 
+enum sahara_mode {
+	SAHARA_MODE_NONE,
+	SAHARA_MODE_MEM_DUMP,
+	SAHARA_MODE_CMD,
+	SAHARA_MODE_FW_DOWNLOAD,
+};
+
 struct sahara_packet {
 	__le32 cmd;
 	__le32 length;
@@ -100,6 +110,9 @@ struct sahara_packet {
 			__le64 memory_address;
 			__le64 memory_length;
 		} memory_read64;
+		struct {
+			__le32 client_command;
+		} command_execute;
 	};
 };
 
@@ -181,6 +194,7 @@ struct sahara_context {
 	void				*mem_dump_freespace;
 	u64				dump_images_left;
 	bool				is_mem_dump_mode;
+	enum sahara_mode		current_mode;
 };
 
 struct sahara_dev_driver_data {
@@ -282,8 +296,15 @@ static void sahara_release_image(struct sahara_context *context)
 static void sahara_send_reset(struct sahara_context *context)
 {
 	int ret;
+	struct sahara_dev_driver_data *sahara_data;
+	struct sahara_dev_trng_data *sdev;
+
+	sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
+	sdev = sahara_data->sdev;
 
 	context->is_mem_dump_mode = false;
+	context->current_mode = SAHARA_MODE_NONE;
+	sdev->receiving_trng_data = false;
 
 	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
 	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
@@ -297,6 +318,7 @@ static void sahara_send_reset(struct sahara_context *context)
 static void sahara_hello(struct sahara_context *context)
 {
 	int ret;
+	u32 mode;
 
 	dev_dbg(&context->mhi_dev->dev,
 		"HELLO cmd received. length:%d version:%d version_compat:%d max_length:%d mode:%d\n",
@@ -317,11 +339,17 @@ static void sahara_hello(struct sahara_context *context)
 		return;
 	}
 
-	if (le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_PENDING &&
-	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE &&
-	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG) {
+	mode = le32_to_cpu(context->rx->hello.mode);
+
+	switch (mode) {
+	case SAHARA_MODE_IMAGE_TX_PENDING:
+	case SAHARA_MODE_IMAGE_TX_COMPLETE:
+	case SAHARA_MODE_MEMORY_DEBUG:
+	case SAHARA_MODE_COMMAND:
+		break;
+	default:
 		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - mode %d\n",
-			le32_to_cpu(context->rx->hello.mode));
+			mode);
 		return;
 	}
 
@@ -514,6 +542,46 @@ static void sahara_memory_debug64(struct sahara_context *context)
 		dev_err(&context->mhi_dev->dev, "Unable to send read for dump table %d\n", ret);
 }
 
+static void sahara_command_execute(struct sahara_context *context, u32 client_command)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXECUTE_LENGTH);
+	context->tx[0]->command_execute.client_command = client_command;
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_COMMAND_EXECUTE_LENGTH, MHI_EOT);
+
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send command execute %d\n", ret);
+}
+
+static void sahara_command_ready(struct sahara_context *context)
+{
+	dev_dbg(&context->mhi_dev->dev,
+		"Command ready cmd received. Length:%d\n",
+		le32_to_cpu(context->rx->length));
+
+	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_READY_LENGTH) {
+		dev_err(&context->mhi_dev->dev, "Malformed command ready packet - length %d\n",
+			le32_to_cpu(context->rx->length));
+		return;
+	}
+
+	/*
+	 * If the device sends the command ready packet, then its an indication
+	 * to host that it needs to switch to command mode.
+	 */
+	context->current_mode = SAHARA_MODE_CMD;
+
+	/*
+	 * As per sahara spec, the host needs to send command ID 8 to get the
+	 * list of commands supported by the device.
+	 */
+	 sahara_command_execute(context, SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST);
+}
+
 static void sahara_processing(struct work_struct *work)
 {
 	struct sahara_context *context = container_of(work, struct sahara_context, fw_work);
@@ -538,6 +606,9 @@ static void sahara_processing(struct work_struct *work)
 	case SAHARA_MEM_DEBUG64_CMD:
 		sahara_memory_debug64(context);
 		break;
+	case SAHARA_CMD_READY_CMD:
+		sahara_command_ready(context);
+		break;
 	default:
 		dev_err(&context->mhi_dev->dev, "Unknown command %d\n",
 			le32_to_cpu(context->rx->cmd));
@@ -873,7 +944,11 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 
 static void sahara_mhi_remove(struct mhi_device *mhi_dev)
 {
-	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
+	struct sahara_dev_driver_data *sahara_data;
+	struct sahara_context *context;
+
+	sahara_data = dev_get_drvdata(&mhi_dev->dev);
+	context = sahara_data->context;
 
 	cancel_work_sync(&context->fw_work);
 	cancel_work_sync(&context->dump_work);
@@ -888,7 +963,11 @@ static void sahara_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
 {
-	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
+	struct sahara_dev_driver_data *sahara_data;
+	struct sahara_context *context;
+
+	sahara_data = dev_get_drvdata(&mhi_dev->dev);
+	context = sahara_data->context;
 
 	if (!mhi_result->transaction_status) {
 		context->rx_size = mhi_result->bytes_xferd;
-- 
2.34.1


