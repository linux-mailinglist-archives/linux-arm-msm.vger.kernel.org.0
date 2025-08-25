Return-Path: <linux-arm-msm+bounces-70612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF7B33C71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC8223AB8CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0532C0F84;
	Mon, 25 Aug 2025 10:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSqzRpR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7305A2DC329
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117200; cv=none; b=G4kO5Y1gH8RFi++XfQtM2vzeiP+VaJIjZFCLQtWZEvtZeH3lWZisxmpi7pZAJNxfVkX2XzoJ1TfEE1OO4FyP2dIMBuiCrsd3J/W9si2BaBCMxGNo77v5G9xcfawiuZxImJcFjNMhlCpvb98D7rlsUWgRVTEuGiwlR1Ot0+P0kXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117200; c=relaxed/simple;
	bh=fF/qnPHU8N53M5mwT8gx4GmBFe/TMhAp9VwtMmLeraE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YqiJ3EPYjachAmZ0m2mjI2Rj+DAmT+V9/9XAtUNgPOo1damfivqkoFTrjomRX9R/n7/Wszg+pnmR+nnE/4ibXKZGYWUsxhxi/tHzm4fYJCu4Q3hKpa3nCxpMO9N8NymWxL7dJEVimiOG39VUlZFGMXCovgw1WeOLU8twAxoce5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSqzRpR+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8GE5b026314
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=67AxRUBWjNg
	jToImKqjWOM7NKl2YL/lnuk8oWSa2r00=; b=QSqzRpR+qXcrHU2CAqbyA8qbJuz
	i+6src0MVOZJ25DLrZfNsZ0O+g3RzH8Ul+Ohn1ngxJtL8rpuJJlX0KsWwgZvbSMp
	OFsIfh+goi8EXFm74DGrShsCA54yfVzYZ+grUAbVdQpPLO6Cmxo/uz9Knj/ZpRwG
	rpKuc0+hs3QKInGR0oo6gv2Ok0HA/Ylvs9cgM3fMy+XUXuQ5eP+WyHJhI1vrwZs1
	o9Br8VL5lVSQhN6HiRSuYBVPJsmzXDGhpX6IQR+eOQPXIbwpxdzxDok4fwucKFne
	nhOGLzHa8vw4i33UwGSozMbuGRkT8rMDAvqHzUtG4M+v9CeMjDe6rVcKlFg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfcr9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458345f5dso47382415ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117192; x=1756721992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67AxRUBWjNgjToImKqjWOM7NKl2YL/lnuk8oWSa2r00=;
        b=MDRGF7HiEAbLI8Ev/YTgbpwzY+w+bKxtY8ImMxxykXuhwJzpHgzCbMW8HoU+0M90It
         rywfffl+XQufHuk8xt9/ACnN8xdaDgYGf+Db8WrCW9InShmdUz5yXcUQTEO28549iqjd
         bPGEoGSZaEmnaa7VXiPwAECzzg2yGavf9Eis++sw0FMsxymbCVi0hW94w9JeAHt2I7kc
         ComV/PW2e6Xq4PTT8WRbwFqkkmwXe5mO0wQeKjQY7x6SjdtgBGU7Uf1OLIMr/xT0LLmT
         4JAf0BB7aUQ9h6h0uRER8evg3+2FERhu7NIDRZGhMy7YF0yMXZIVcencM235s9FvRfp5
         bXtA==
X-Forwarded-Encrypted: i=1; AJvYcCXoMfNgiB83Njh1eh7WDLbXSN9PIO51lo2IfviLe01qHtSW8hHnyacFthgyYFh/5vHB/9V5e0u4RNUH+OPK@vger.kernel.org
X-Gm-Message-State: AOJu0YwX7App+7WCfLeCX66bFV0/lc/MaIBCOfFLx22YcbVaG06q/zbS
	XdcG8OgfaZkPpem/kvoD0FVbRWs5C5HKBWrhN/2fY98DQaU25aKSi79NsuAyso4ICOQhB8SYGID
	445Hcl9RTKDHv+Ey/3FEFFBEf72Z7p0qYLxerSVbcyHReBbhBCjzpmK12bLZUT2SxLx0alPw2ci
	fr
X-Gm-Gg: ASbGncvBV45PfQDtIiog20KGUAprxQAaHBCFoadpAIdYpBu9+GZrvnXpj9cqmJIPqS+
	FchQQmhZtuWN2+eSK18HmOsrPVT4CWl87XE17bstpwGbtsQVxMxEWv9744wxGJ16MrS3kzXrrN7
	iVSqtgI3igys2uB7BWY+K2hOvBnO5j+K+HSeatiPAydy8yU+NtdDeX6hTEhgDNzhpxogAibCrQr
	vCc9etwQATqXvGpHf/97VdZIhW7uxZWzWlgKVVkfzbfFMU4ADHzzcxlciRxEoTCpj+tkBZQHNvL
	iz8qFzuC0tbturvBgEwTV26Exnt7/xwF3Imp+eavpBNk8cfwXiHc97oi3asSFg0mYXkliQ==
X-Received: by 2002:a17:903:b90:b0:246:cc24:3934 with SMTP id d9443c01a7336-246cc243a08mr42555335ad.1.1756117192112;
        Mon, 25 Aug 2025 03:19:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw9tpesJO3g8H6QJvdnOvCndJUU0xnI0HiYEj0dWJTN6SPcIbyD7xfsZ5itVv0rcn+kxZnFg==
X-Received: by 2002:a17:903:b90:b0:246:cc24:3934 with SMTP id d9443c01a7336-246cc243a08mr42555035ad.1.1756117191565;
        Mon, 25 Aug 2025 03:19:51 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:19:51 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 07/12] drivers: soc: qcom: Add sysfs support for DDR training data in Sahara.
Date: Mon, 25 Aug 2025 15:49:21 +0530
Message-Id: <20250825101926.2160554-8-kishore.batta@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5JVrQ5fi4bIE
 Y/C9Ph3D1obDtbrNrnvIUmxNIFIgE+R69dwQim0Jr17j6LnHT6B5myUCoPUuuIR4QzkyJfg9irW
 LG4gEgoLtS6GQnpilqjMOy4WSg+8XRCiprCK/7K17A0sKNxtE0nxOwnS0yfikDR2ilpkb0V0D1c
 4l0M6SJXev7QG9EM2cMgoSI9owdBoArD3L/YY7xmhU32zPOUgFQzrn+mJRWsfPrunSekkamfNqt
 h5bBJRVboa3gVuoALEbzjjEL/aBX6WRASA5Jeq2ZpXO65ANUT8idcw5MUMoix7zLoMHxSoxJYMv
 a8YVUfdR10q9wRP3YpOvwVxva0SxHENGCFOfK5LHxb5Ss7qMcSH/DJCK2a+O2ga5ssHjAir8IY6
 1HnVZ/9L
X-Proofpoint-GUID: ItHNR6Gr2U-6eEIc26wix16S2LNWQRMh
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac38c9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=LiLD31VdowSupz5Iz4QA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ItHNR6Gr2U-6eEIc26wix16S2LNWQRMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Add the Sahara training data structure and populate the DDR training data
sysfs node. During device boot, the device performs DDR training and sends
the training data back to the host once complete. The host exposes this
data to userspace via the sysfs interface. The "ddr_training_data" sysfs
node will be present in the MHI controller node (e.g., mhi0, mhi1) along
with other existing sysfs nodes at /sys/bus/mhi/devices/mhi*/.

When the host reboots, a userspace service is triggered via an udev rule to
read the training data from the sysfs entry. The service then copies the
valid training data to the image firmware filesystem. This change includes
the structures added for DDR training data and embeds them in the
sahara_dev_driver_data structure. It also populates the sysfs attributes
for DDR training data.

Userspace service - https://github.com/qualcomm/csm-utils

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/soc/qcom/sahara/sahara.c | 109 ++++++++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
index b07f6bd0e19f..df103473af3a 100644
--- a/drivers/soc/qcom/sahara/sahara.c
+++ b/drivers/soc/qcom/sahara/sahara.c
@@ -60,6 +60,12 @@
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
 
+struct sahara_dev_trng_data {
+	void *trng_data;
+	u64 trng_data_sz;
+	bool receiving_trng_data;
+};
+
 struct sahara_packet {
 	__le32 cmd;
 	__le32 length;
@@ -177,6 +183,58 @@ struct sahara_context {
 	bool				is_mem_dump_mode;
 };
 
+struct sahara_dev_driver_data {
+	struct bin_attribute ddr_attr;
+	struct sahara_dev_trng_data *sdev;
+	struct sahara_context *context;
+};
+
+/* Exposes DDR training data via sysfs binary attribute for user-space access */
+static ssize_t ddr_training_read(struct file *filp, struct kobject *kobj,
+				 const struct bin_attribute *attr, char *buf,
+				 loff_t offset, size_t count)
+{
+	struct sahara_dev_driver_data *sahara_data;
+	struct sahara_dev_trng_data *sdev;
+	size_t data_size;
+
+	sahara_data = container_of(attr, struct sahara_dev_driver_data, ddr_attr);
+
+	if (!sahara_data)
+		return -EIO;
+
+	sdev = sahara_data->sdev;
+
+	if (!sdev || !sdev->trng_data)
+		return -EIO;
+
+	data_size = attr->size;
+
+	if (data_size == 0)
+		return 0;
+
+	if (offset >= data_size)
+		return -EINVAL;
+
+	if (count > data_size - offset)
+		count = data_size - offset;
+
+	/* Copy the training data into the buffer */
+	memcpy(buf, (sdev->trng_data + offset), count);
+
+	/* Free memory after last read */
+	if (offset + count >= data_size) {
+		kfree(sdev->trng_data);
+		sdev->trng_data = NULL;
+		kfree(sdev);
+		sdev = NULL;
+		kfree(sahara_data);
+		sahara_data = NULL;
+	}
+
+	return count;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
@@ -703,11 +761,42 @@ static void sahara_dump_processing(struct work_struct *work)
 	sahara_send_reset(context);
 }
 
+static int sahara_dev_populate_attribute(struct sahara_dev_driver_data *sahara_data)
+{
+	int ret;
+	struct sahara_context *context = sahara_data->context;
+
+	/* DDR training data attribute */
+	sahara_data->ddr_attr.attr.name = "ddr_training_data";
+	sahara_data->ddr_attr.attr.mode = 0444;
+	sahara_data->ddr_attr.read = ddr_training_read;
+
+	/* Size is populated during device bootup */
+	sahara_data->ddr_attr.size = 0;
+	sahara_data->ddr_attr.write = NULL;
+
+	/*
+	 * Remove any existing sysfs binary attribute to avoid stale entries
+	 * during warm boot or reinitialization. This ensures clean state before
+	 * re-creating the attribute.
+	 */
+	device_remove_bin_file(&context->mhi_dev->mhi_cntrl->mhi_dev->dev,
+			       &sahara_data->ddr_attr);
+
+	/* Create the binary attribute */
+	ret = device_create_bin_file(&context->mhi_dev->mhi_cntrl->mhi_dev->dev,
+				     &sahara_data->ddr_attr);
+
+	return ret;
+}
+
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
 	struct sahara_context *context;
 	int ret;
 	int i;
+	struct sahara_dev_driver_data *sahara_data;
+	struct sahara_dev_trng_data *sdev;
 
 	context = devm_kzalloc(&mhi_dev->dev, sizeof(*context), GFP_KERNEL);
 	if (!context)
@@ -717,6 +806,17 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
+	sahara_data = kzalloc(sizeof(*sahara_data), GFP_KERNEL);
+	if (!sahara_data)
+		return -ENOMEM;
+
+	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
+	if (!sdev)
+		return -ENOMEM;
+
+	sahara_data->context = context;
+	sahara_data->sdev = sdev;
+
 	/*
 	 * AIC100 defines SAHARA_TRANSFER_MAX_SIZE as the largest value it
 	 * will request for READ_DATA. This is larger than
@@ -749,7 +849,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return -EINVAL;
 
 	context->active_image_id = SAHARA_IMAGE_ID_NONE;
-	dev_set_drvdata(&mhi_dev->dev, context);
+	dev_set_drvdata(&mhi_dev->dev, sahara_data);
+
+	ret = sahara_dev_populate_attribute(sahara_data);
+	if (ret) {
+		dev_err(&context->mhi_dev->dev,
+			"Failed to populate bin attribute: %d\n", ret);
+		return ret;
+	}
 
 	ret = mhi_prepare_for_transfer(mhi_dev);
 	if (ret)
-- 
2.34.1


