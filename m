Return-Path: <linux-arm-msm+bounces-70617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3ACB33C7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E58117AD752
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457C42D73A2;
	Mon, 25 Aug 2025 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CyJM3xp0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31D313D891
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117223; cv=none; b=c+M7iRkDjNQgxvYfWJ8c4JQZYi3qL8M7YLkLs0fuHWL+e6mAr0u4d8AbPKr3EiBiqa5/cr9hS64eptwz8CMzZIguXwdGoQMe5YhhiXkVzcWRLcgCs/OWmQx6EyL6trgRWClVQ1UXpElEV2vpUtSEgB6x3H8bIGiYbKc4ccAXXT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117223; c=relaxed/simple;
	bh=5FLLMVCRcpcb09YpCkSkLgy6o0MZ+2TfPr6AcxQapDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rS8KdJZoXhyhYq/A85MZVgRWx45hHCRg/1yh80XHxjR1AG+xlCBEA5n7p49DnRxwNn+FCBhpYYWguSTonAtKULNkPvbhM2pQbLVzQgfbJzT59IS+VhN4tKvZ9zsZOD10ibdrrZCaRnNMLnu8FnOSbhO0SqJ1CCbmtLM3B/HFi6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CyJM3xp0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Ov00026320
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rq9M9vigcH+
	wO516PvdTjVXVO/WEnPWyo3jGYByyr/M=; b=CyJM3xp0CneK2xYKBhcI6qBYGbq
	3D4BUU5t1QoWZ5JQfAX3lVghkjMwTH8MGuE7mHSdkOrQCDMiIqhypmSBuA3YGKpS
	kft+TuxrkmZ2Ck/h+mHT6zKct0LZyw5qZAhTkbd2/qZLgfVpwLQA3FndkWWyDfP3
	4NysFNE5yCZze8VhRZTuM3xdxNGq0qbcIgkJK5gzQcicRyMnUCSjyi7GsSAFG2FO
	AwXk7DhKPRzhf8v91Zh65GJBfbQcg8c6nO24lzDjKtVVwVwwy9BMw179xRoYu6Lo
	DNUjI+1ZO55QgoXdHsw0aPGm6V1+yN9r/NUAz5q1Ow926bcaogVnNFDQ33A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615cp97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:20:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581953b8so49089075ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117203; x=1756722003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rq9M9vigcH+wO516PvdTjVXVO/WEnPWyo3jGYByyr/M=;
        b=i5XKrKVE1crZbtmoXk1NIAHV4u6bheq0X7CdB+4lO+wQZ9qMNnAGvi+DpsawgG4Oty
         u8j3ViJ4bWFC0ww4zT1DxeQwqtgfwT1fd0LSuYZdC+7vbqEi9WRl9lPZrx9gpHCXGOZU
         b8GN2ii6DIQ9rUJJRL/KRSmphtJ+xKvwGAiWVACt3topaMWsInoPo5lpiDEVaJZBJFHc
         whN8Cdx5XcpG0cwR6YW1AnkxCJNRGgteqeq5gYApqpzrTNlFaHUu9laUR/hraNFLx9J/
         Ieg9uOkvOAIzEw9wlIa5oWDFbwV8szHEQeRbJlZ+pnHqDuFqHtVJNB4HfXlDHu9hWJUm
         bycg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4b34cKkM4Xj6bm6KitN6XPEDM6W4w4jTuuwfNh2XjcibEyBbJl6qZ7HLdBxuYTh5Og3n9A4JUlIWVaHn@vger.kernel.org
X-Gm-Message-State: AOJu0YyWorF60VCau/x5ykQknpq8UCCK1cr/zTvsnwvoK7lGQun8P5aY
	IcTJ+VvXOrbx4RcwSfLIsHVeyDMbT7to1VXy/i+vg8kSPY5Bpxr2EFAANf0KtMh1JcRW91y8GDj
	Vh112gaxdBxlNr13WPI/Dzm+yOMDKE0WT6v7q6SlEe0i6avCIUM8kOD9ERaKf+Clw8xZ+
X-Gm-Gg: ASbGncsPQtJRocmncuFSoB85V51YVmkp4BHxPn5YX0bLM848DStzTte9JRZ62u8+vrQ
	UysAOgYv6JIK75ILKQzBTJ+B1XNaWPU4O9nZ+euCjn63EUXM+/Nw7PMaGSzSuzIg0D+Ovfhtk++
	E5EpodZMHPv5p0SBskNXMzIsop4dZSyHLmzvewp563eeOk4emV/6NPaB6iFPMMYpFaA/4WLFThe
	WZidRoNOLBfkYlFuO4VS4r2rtWlFP1tJLev0LdEUmHUQfCBFdmKFOb4vHF4Fn8ZLW4sK/Cgdxya
	WgRM0k4sFjPBFFAU3fbdVf46RsN7xAU4Eb8Eis/c2x1zLg52KZLwAeFXDYLfyiGVvpEdBQ==
X-Received: by 2002:a17:902:ef50:b0:23f:adc0:8cc2 with SMTP id d9443c01a7336-2462eeabf5amr142686445ad.27.1756117203404;
        Mon, 25 Aug 2025 03:20:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF9BrlQrQKefyn8pwFkSIP15wbJVX3SRfxrVeNt8DaiQrZ4y8qPoO0k/OiHJ5UoA2pTIyJDQ==
X-Received: by 2002:a17:902:ef50:b0:23f:adc0:8cc2 with SMTP id d9443c01a7336-2462eeabf5amr142686185ad.27.1756117202928;
        Mon, 25 Aug 2025 03:20:02 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:20:02 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 11/12] drivers: soc: qcom: Support to load saved DDR training data in Sahara.
Date: Mon, 25 Aug 2025 15:49:25 +0530
Message-Id: <20250825101926.2160554-12-kishore.batta@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX9Qd4SL8r+lbu
 RHFu0jF0Wy+oWoQGPnuPwb/UMLMhcO5kWl7r/8TPLrxnj4YeSy3CCB0aIPZvhuy7p19Sb00OzZC
 dUFf5gdgWYFUcQdEkGEzG6JPGaIOm5hfNZaKXqtAGpxc9/h4u2RZhY6cht7qJzE3kIyNlgcPvs2
 ccVnqfibP8w5NtubtQqR/e28YF6tR1ecPnulLTQXUhNU8sUk6EK/vvfVFJ/iZ7EQUw3u94NxmF3
 jhX3q9m55nSSRJ8tmK11zZ0F5MMER7UgSED1h31gc2nq+k7FkEruJt+JDZk5DD0ooW4pDb2NV/3
 SIJd81b/ncS/g0NjUDkhAECuapdmYBkCNONUGzOZH/qynQ3GDzskhQK2Is5vlQKO8uJnPPb9wBv
 L+1T8gEv
X-Proofpoint-GUID: GpG9xgTmdegDv2kI1sWpPpYq1s-2Srkm
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ac38d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=cni2rxXmVtJrFUhD79EA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: GpG9xgTmdegDv2kI1sWpPpYq1s-2Srkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

Load the saved DDR training data during subsequent bootups. The image ID 34
is for DDR training data image. During subsequent bootups, the Sahara
driver needs to load the training data file associated with the serial
number instead of the default file present in the image table. If the
serial number-specific file is not present in the firmware directory,
it indicates the first bootup of the device, and training data gets
generated.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/soc/qcom/sahara/sahara.c | 71 +++++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
index 3887cdcfe256..28e52a9974a1 100644
--- a/drivers/soc/qcom/sahara/sahara.c
+++ b/drivers/soc/qcom/sahara/sahara.c
@@ -68,6 +68,7 @@
 #define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
 #define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
 #define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
+#define SAHARA_DDR_TRAINING_IMG_ID	34
 
 struct sahara_dev_trng_data {
 	void *trng_data;
@@ -213,6 +214,8 @@ struct sahara_context {
 	enum sahara_mode		current_mode;
 	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
 	u64				bytes_copied;
+	u32				serial_num;
+	char				*fw_folder_name;
 };
 
 struct sahara_dev_driver_data {
@@ -270,6 +273,7 @@ static ssize_t ddr_training_read(struct file *filp, struct kobject *kobj,
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
+	char *fw_path;
 
 	if (image_id == context->active_image_id)
 		return 0;
@@ -286,19 +290,64 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	}
 
 	/*
-	 * This image might be optional. The device may continue without it.
-	 * Only the device knows. Suppress error messages that could suggest an
-	 * a problem when we were actually able to continue.
+	 * Image ID 34 corresponds to DDR training data. On subsequent
+	 * bootups, the sahara driver may need to load the training data file
+	 * associated with device's serial number instead of the default file
+	 * listed in the image table.
+	 *
+	 * If the serial number specific file is not found in the firmware
+	 * directory, it likely indicates the device is booting for the first
+	 * time, and new training data will be generated.
 	 */
-	ret = firmware_request_nowarn(&context->firmware,
-				      context->image_table[image_id],
-				      &context->mhi_dev->dev);
-	if (ret) {
-		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
-			image_id, context->image_table[image_id], ret);
-		return ret;
-	}
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID) {
+		context->serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+		context->fw_folder_name =
+			sahara_get_fw_folder_name(context->mhi_dev->mhi_cntrl->name);
+		if (!context->fw_folder_name)
+			return -EINVAL;
+
+		fw_path = devm_kasprintf(&context->mhi_dev->dev, GFP_KERNEL,
+					 "qcom/%s/mdmddr_0x%x.mbn",
+					 context->fw_folder_name,
+					 context->serial_num);
+
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+
+		/*
+		 * If there is failure to load serial number specific file, load
+		 * the default file from image table
+		 */
+		if (ret) {
+			ret = firmware_request_nowarn(&context->firmware,
+						      context->image_table[image_id],
+						      &context->mhi_dev->dev);
+			if (ret) {
+				dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
+					image_id, context->image_table[image_id], ret);
+			}
+			return ret;
+		}
+	} else {
+		/*
+		 * This image might be optional. The device may continue without it.
+		 * Only the device knows. Suppress error messages that could suggest an
+		 * a problem when we were actually able to continue.
+		 */
+		ret = firmware_request_nowarn(&context->firmware,
+					      context->image_table[image_id],
+					      &context->mhi_dev->dev);
+		if (ret) {
+			dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
+				image_id, context->image_table[image_id], ret);
 
+			return ret;
+		}
+	}
 	context->active_image_id = image_id;
 
 	return 0;
-- 
2.34.1


