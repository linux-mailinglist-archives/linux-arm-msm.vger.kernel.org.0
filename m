Return-Path: <linux-arm-msm+bounces-80233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C065C2F79D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 07:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 793A84F0758
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 06:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089912E92B3;
	Tue,  4 Nov 2025 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPYBGqmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyD1d8ZV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0821F2E283E
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 06:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762238545; cv=none; b=i6eq/IeKRWKookaP6WB2n6UrMusVcoxPtuxIN78iofo0yFzGk6joWfJVKfXF/sPrOJsdqCffVuGWegXJBY5V8t3eqLjPZqSA4djM59fALZP85W76Cjs985f/v9Kjm3Kh6ZVQ51d5n/prB34oWJ49TEJHtraGDBxFDTPretJxCiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762238545; c=relaxed/simple;
	bh=96bzWkhDWYDuDp2Jyyn7AquZSwKLo7DiVJ0OPkKZJq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oq42ttGJ2QP80OOMf+zldMffcB4yDdJ6RVEHVRJqlDqF/APMwyFztGHPu6uUJa4d4RJO93nEC6EesgOArEpPotHCoxBFvoOnSRWsFffdpORKvP1GOx2ydXvxu5vEFnkrPUnV7sDh93BoXsMNwiMG7R0Ek7CSizg5KuAmORg92RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPYBGqmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyD1d8ZV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43KZWn3659520
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 06:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AIIj+Fyqu1b
	kdRDQGwzdP+sEfwmSD5ldhQd6xBymW1Y=; b=QPYBGqmS32NqHt7XxG+1GvtE6eP
	kyMVngKMr33mu2z/H6AjsWeGv5T+A7pzZGaGk8K/tf+lG2LyhLEPN29I+lWR7gLg
	d3lYTeQ+al7etaKGCi9hDioBMjDUysl6t2jMMsCFBfNbJcj5pBpjD018fWhR/6pm
	v7PF83i5P7dgnOGVebaHGsJNDLuzmO3T2oh0wvcxrpwitGnSQPeCjjPqqInPL6d4
	CChRvWGZNif1/wY0Ptl0F2OYbZ8plnUIR9GT/QR0B5qY69e7JAXAm4PTst+uWK61
	NfV1WMpdYYL2y7c1srKkFUYBMogH9qq7XQ+KQwUNzWvZU7LeRLRJnxPNX2w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ge9wvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 06:42:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295093f614cso61982835ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 22:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762238543; x=1762843343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIIj+Fyqu1bkdRDQGwzdP+sEfwmSD5ldhQd6xBymW1Y=;
        b=IyD1d8ZVjNgs5XtzjR8GF6gUUqETpVl0qP0tf1bHt4z1sks6iGu5YOaHb0Y4m96znK
         QOS0iiCeV2OkGuFugachYu3YBqXNm0Mqk+yLQAanupC0gLONVh12I96/O5qXvlPITkwQ
         Bis2DGlQSJ8j6nSM4UukT/+5ak2mNoE0knFkRJNh6sDYWlslB5wpjahmpLlwycJ2jd66
         ckfQsgyqtP8BSEu4Rpku9vqrPoUQaTLV9K19VMAQm23afBkvQBykGNxfDFNqRnHoU4BC
         FzSZcktKZB3n8Gkp/j8rhmMQxWvMIhQ1iD86mDu/6+MloprzbkH18WkS2Ur28xyQ2fU7
         GIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762238543; x=1762843343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIIj+Fyqu1bkdRDQGwzdP+sEfwmSD5ldhQd6xBymW1Y=;
        b=LGEFO4RrPln4U0vLm3UDHaSKhBXawNJoQdzmvIUaNs02MXRv/e5dL0PSpHbFvNs8+4
         0sM/jERcvV9CvqOu1PFCm/n7KwhnxK9YWbnAwiVaDVOpZheZKhR6ogg3ckVB1XaUP/8W
         ejnGtm7iafsTliVFC4jP93tj8pfw2NaugAhmOp+7oqJYvN7inlmwl6gkm4wOWEX+EkA3
         nncvUD5/m55OfU9Rp/AJR8Iplm3Nu0PUWHjfLKox4Lbp/I/6GOJo+Bo42UWT1ajjO2O5
         WuuEoAHYaXBf+pbZ2jppSC05aCXD2nEZZUGkbaHI58id/68FQ6o5EZlR3q1dhyGBXw77
         YWNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP/GVMO+XLrlO2DrRe/8M5WrOLTMq3I46PYVt4/aERihPHKxo6iZo5GFCscfzJf3jKW77vSn7WEDE57rjg@vger.kernel.org
X-Gm-Message-State: AOJu0YxjJivdQebR10SWPbjdJDouJSYfhGHuZbi7wI/4F4fiyF06SRp8
	lrGT9O+Vtorsm1Q9xzR7RAk1/CZ6y2U2oBHZ9nOG2q3F97QNNaam9CKos9bCGHcCPzr0m8L3hvD
	X62yO0424dx4PWNSyMU/VX7CG227YqwzQhDr675o2pQvxkXgvmWiuI+80t+u0d+CHpA6A
X-Gm-Gg: ASbGnctHj83jDRBXoqI+hSbuABETYlTdt6loQ5qewOhjxmZ69xM4vBkW+MjKm3HNI2L
	fANUEVGwzUUuoU/CXLfbNXPRiCx7oQwKI484+OmRPL74BXJcdSY9aipxzoauUd8Z2zqPURCeIDB
	skvmv+O+5msHPr0yCqKPJe76vHhv1kXQfWb5Zu1av6Jl+hXAWG8EuQYyNMBB2sEapOtP9V4KBj2
	QMQAMvirca889tIxLOFZQUMY+lP5ZrygbILEJQN1D3dPsNRRB/cumCHRqerLG46ce0n/CIjD4SC
	Or1yNHXpCjeMyadY0N6wQmUqr/zkcr2KtACkJkcd2VsGQh8LmLqvWPXE+XO1n0IoVczFtEuuS3J
	iNsTnggaXkaWTqFMKsfs4eV6Jo3E0PoCfj4aflC0hOkd9n4zUv4IgDQ==
X-Received: by 2002:a17:902:e5cb:b0:273:ef4c:60f3 with SMTP id d9443c01a7336-295f937c8a7mr29839325ad.4.1762238542615;
        Mon, 03 Nov 2025 22:42:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJMvyn7jgT+PxdsfFbbVRQ5B7QXJ0K1qxCUO7+4vhXbZ4XTwYzEH8ZwclKzQweZGQdlpbyWA==
X-Received: by 2002:a17:902:e5cb:b0:273:ef4c:60f3 with SMTP id d9443c01a7336-295f937c8a7mr29838995ad.4.1762238542085;
        Mon, 03 Nov 2025 22:42:22 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a0780dsm3294791a91.16.2025.11.03.22.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:42:21 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v7 7/7] qcom-tgu: Add reset node to initialize
Date: Mon,  3 Nov 2025 22:40:43 -0800
Message-Id: <20251104064043.88972-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UPR-kzIi_pu_5JHlz4cQ-a_dk2eHopH2
X-Authority-Analysis: v=2.4 cv=bqBBxUai c=1 sm=1 tr=0 ts=6909a04f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IgPCHI2mAnvcCQI4J_AA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA1MyBTYWx0ZWRfX2eKZe2QDDJLf
 E7Zoa161pSN/Q3Bwgp6854xmqE6wwkQkGlpkzChC1nQvf2VySoDOT8JZ0Z6pQtbL8P+p0EX/+Z9
 nGxMre59wvPdoBVbmqmlsEdlbzU4mhQ9MUFthfxeeyyE65A8zat/gg49EY2HnT5s/S+jJM4GX5N
 iyvgXjaE4G7ydoOPuXrnXLoyl4c6ZP0hk8vdhU2bTSkqzewzT7Ab+GbWV49gxBT51oWaSzMchcq
 mjjbspFgw/f2Jdp00KhI5bjWwH22apfPjHwIUmOHvIJige+SZGePLhJ8TB4yGog7G1Oe/2yobzw
 KieLy6LG3g6ZLL9x/rxksPnH12AxGUH7GeJRrkw95HeYHKDVmcpzJp/GuNQHcUzzO7z+LOZgLsG
 Sa2YwA4rCfqGhist3ugxdMoW5nKWuQ==
X-Proofpoint-GUID: UPR-kzIi_pu_5JHlz4cQ-a_dk2eHopH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040053

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 75 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 11b4d34153ce..9d20b48fba3a 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.18
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/reset_tgu
+Date:		November 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 5db876c31a63..a164867c6b66 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -434,6 +434,80 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	unsigned long value;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value == 0)
+		return -EINVAL;
+
+	if (!drvdata->enable) {
+		ret = pm_runtime_get_sync(drvdata->dev);
+		if (ret < 0) {
+			pm_runtime_put(drvdata->dev);
+			return ret;
+		}
+	}
+
+	spin_lock(&drvdata->lock);
+	CS_UNLOCK(drvdata->base);
+
+	writel(0, drvdata->base + TGU_CONTROL);
+
+	if (drvdata->value_table->priority)
+		memset(drvdata->value_table->priority, 0,
+			    MAX_PRIORITY * drvdata->max_step *
+				drvdata->max_reg * sizeof(unsigned int));
+
+	if (drvdata->value_table->condition_decode)
+		memset(drvdata->value_table->condition_decode, 0,
+			    drvdata->max_condition_decode * drvdata->max_step *
+				sizeof(unsigned int));
+
+		/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			drvdata->value_table
+			->condition_decode[calculate_array_location(
+			drvdata, i, TGU_CONDITION_DECODE, j)] =
+			0x1000000;
+		}
+	}
+
+	if (drvdata->value_table->condition_select)
+		memset(drvdata->value_table->condition_select, 0,
+				drvdata->max_condition_select * drvdata->max_step *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->timer)
+		memset(drvdata->value_table->timer, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_timer) *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->counter)
+		memset(drvdata->value_table->counter, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_counter) *
+				sizeof(unsigned int));
+
+	dev_dbg(dev, "Coresight-TGU reset complete\n");
+
+	CS_LOCK(drvdata->base);
+
+	drvdata->enable = false;
+	spin_unlock(&drvdata->lock);
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static const struct coresight_ops_helper tgu_helper_ops = {
 	.enable = tgu_enable,
 	.disable = tgu_disable,
@@ -445,6 +519,7 @@ static const struct coresight_ops tgu_ops = {
 
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1


