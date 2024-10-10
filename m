Return-Path: <linux-arm-msm+bounces-33804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA1F997F98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F2651C23A2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD631F4FCD;
	Thu, 10 Oct 2024 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kFWFI6iR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476A1F4738;
	Thu, 10 Oct 2024 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728545998; cv=none; b=oFJbMVcXFfVOCUe+C282V1+/ia0/lMpF9OrA8bUq8iEtEgqixugh7Bk9+UIOSk4Gl5WBq9R8lFTdSZjN9PCvuObcJDD7sDklO2JJs5ELNuwjZ7LlkfQ3bEhlBahvM3NbSoySswnAIXilnfq6V3GOJDQF4n2q3agG7TINDkyhTRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728545998; c=relaxed/simple;
	bh=Pu78TaX7athCMV6gdXBYKGaZXXrIfthuREwd33mhA7U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b8hLa8RXwYRl6HvxDWeI+9S/ob2DH3OP8gZGvFag/EAoUsuaUay2h2Mx3ldYiJZjS7+A7qNOMTsfKQQMtHtSlf4rYGiBm0Q7tVp00xnTF/vx+Nh04RfrvddDNcHSeT1jKE5eKeLzdUUDZXLxkZ/LvQR494yEvuWi9lIymwxfZBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kFWFI6iR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A4ghSQ027240;
	Thu, 10 Oct 2024 07:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90/UnCBKzemb9epZrSwpJb3PhODL07HAQIPEsMtfYB8=; b=kFWFI6iRtC6Tr69G
	dlnOhPusZOmpd+6Hr9N8cFNnMcszhZo946tMJSQN7JDfSSawE9VQpO3YbFQhMNcz
	NkEMkQJM+fV6Ip8aTN3csShXKEGYHP7AwNTTDHMrzAA/i4bhKhszQNrPQ7rpKb5T
	ZiGSgrY4rwLBZjx3gdDb9uElyWkdre9YQSsI+dgVOjsytRu6SdmU397XjY0tdsas
	QDjT89fKV3o82+PyiQvOKfT6RJLbtjd+OPDEBmyqmAb9gu9LiF9sjzhKQgLo9b0V
	Eajr0RcCaICQ/HWT2Er4c8ep6dPuCdtcMjbekWLBxHksI9HSKsBnAD2ortjWhUFp
	tNge4Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy7j6my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:39:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A7dZJU011935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:39:35 GMT
Received: from 3b5b8f7e4007.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 00:39:34 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Songwei Chai <quic_songchai@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 4/7] coresight-tgu: Add TGU decode support
Date: Thu, 10 Oct 2024 15:39:12 +0800
Message-ID: <20241010073917.16023-5-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010073917.16023-1-quic_songchai@quicinc.com>
References: <20241010073917.16023-1-quic_songchai@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yobNb4WkoIWn6Kh2BWpijauNKgwzSEMg
X-Proofpoint-GUID: yobNb4WkoIWn6Kh2BWpijauNKgwzSEMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100049

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
step.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |   7 ++
 drivers/hwtracing/coresight/coresight-tgu.c   | 113 ++++++++++++++++--
 drivers/hwtracing/coresight/coresight-tgu.h   |  29 ++++-
 3 files changed, 136 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 599908a88e80..e2c66d545912 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion   6.10
 Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
                 (RW) Set/Get the sensed siganal with specific step and priority for TGU.
+
+What:           /sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:           August 2024
+KernelVersion   6.10
+Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+                (RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index 20244c178586..b21283c89373 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.c
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -22,9 +22,21 @@ static int calculate_array_location(struct tgu_drvdata *drvdata, int step_index,
 {
 	int ret = -EINVAL;
 
-	ret = operation_index * (drvdata->max_step) *
-		      (drvdata->max_reg) + step_index * (drvdata->max_reg)
-				+ reg_index;
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		ret = operation_index * (drvdata->max_step) *
+			(drvdata->max_reg) + step_index * (drvdata->max_reg)
+			+ reg_index;
+		break;
+	case TGU_CONDITION_DECODE:
+		ret = step_index * (drvdata->max_condition_decode) + reg_index;
+		break;
+	default:
+		break;
+	}
 
 	return ret;
 }
@@ -36,10 +48,23 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	struct tgu_attribute *tgu_attr =
 		container_of(attr, struct tgu_attribute, attr);
 
-	return sysfs_emit(buf, "0x%x\n",
-			  drvdata->value_table->priority[calculate_array_location(
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->priority[calculate_array_location(
 				  drvdata, tgu_attr->step_index,
 				  tgu_attr->operation_index, tgu_attr->reg_num)]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->condition_decode[calculate_array_location(
+				  drvdata, tgu_attr->step_index, tgu_attr->operation_index,
+				  tgu_attr->reg_num)]);
+
+	}
+	return -EINVAL;
 
 }
 
@@ -58,11 +83,25 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		return ret;
 
 	guard(spinlock)(&tgu_drvdata->spinlock);
-	tgu_drvdata->value_table->priority[calculate_array_location(
-		tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
-		tgu_attr->reg_num)] = val;
-	ret = size;
-
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->value_table->priority[calculate_array_location(
+			tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
+			tgu_attr->reg_num)] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->value_table->condition_decode[calculate_array_location(
+			tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
+			tgu_attr->reg_num)] = val;
+		ret = size;
+		break;
+	default:
+		break;
+	}
 	return ret;
 }
 
@@ -79,8 +118,23 @@ static umode_t tgu_node_visible(struct kobject *kobject, struct attribute *attr,
 		container_of(dev_attr, struct tgu_attribute, attr);
 
 	if (tgu_attr->step_index < drvdata->max_step) {
-		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
-					    attr->mode : 0;
+		switch (tgu_attr->operation_index) {
+		case TGU_PRIORITY0:
+		case TGU_PRIORITY1:
+		case TGU_PRIORITY2:
+		case TGU_PRIORITY3:
+			ret = (tgu_attr->reg_num < drvdata->max_reg) ?
+				      attr->mode : 0;
+			break;
+		case TGU_CONDITION_DECODE:
+			ret = (tgu_attr->reg_num <
+					drvdata->max_condition_decode) ?
+						attr->mode : 0;
+			break;
+		default:
+			break;
+		}
+
 		return ret;
 	}
 	return SYSFS_GROUP_INVISIBLE;
@@ -103,6 +157,17 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 		}
 	}
 
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			tgu_writel(drvdata,
+				   drvdata->value_table
+					   ->condition_decode[calculate_array_location(
+						   drvdata, i,
+						   TGU_CONDITION_DECODE, j)],
+				   CONDITION_DECODE_STEP(i, j));
+		}
+	}
+
 	/* Enable TGU to program the triggers */
 	tgu_writel(drvdata, 1, TGU_CONTROL);
 	CS_LOCK(drvdata->base);
@@ -245,6 +310,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -289,6 +362,13 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (ret)
 		return -EINVAL;
 
+	ret = of_property_read_u32(adev->dev.of_node, "tgu-conditions",
+				   &drvdata->max_condition);
+	if (ret)
+		return -EINVAL;
+
+	drvdata->max_condition_decode = drvdata->max_condition;
+
 	drvdata->value_table =
 		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
 	if (!drvdata->value_table)
@@ -303,6 +383,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata->value_table->priority)
 		return -ENOMEM;
 
+	drvdata->value_table->condition_decode = devm_kzalloc(
+		dev,
+		drvdata->max_condition_decode * drvdata->max_step *
+			sizeof(*(drvdata->value_table->condition_decode)),
+		GFP_KERNEL);
+
+	if (!drvdata->value_table->condition_decode)
+		return -ENOMEM;
+
 	drvdata->enable = false;
 	desc.type = CORESIGHT_DEV_TYPE_HELPER;
 	desc.pdata = adev->dev.platform_data;
diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
index 8d7ea0516ad1..243a22098370 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.h
+++ b/drivers/hwtracing/coresight/coresight-tgu.h
@@ -46,6 +46,9 @@
 #define PRIORITY_REG_STEP(step, priority, reg)\
 	(0x0074 + 0x60 * priority + 0x4 * reg + 0x1D8 * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(0x0050 + 0x4 * decode + 0x1D8 * step)
+
 #define tgu_dataset_ro(name, step_index, type, reg_num)     \
 	(&((struct tgu_attribute[]){ {                      \
 		__ATTR(name, 0444, tgu_dataset_show, NULL), \
@@ -66,6 +69,9 @@
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
 		       reg_num)
 
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -88,6 +94,14 @@
 	 NULL			\
 	}
 
+#define STEP_DECODE_LIST(n) \
+	{STEP_DECODE(n, 0), \
+	 STEP_DECODE(n, 1), \
+	 STEP_DECODE(n, 2), \
+	 STEP_DECODE(n, 3), \
+	 NULL           \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -95,11 +109,19 @@
 		.name = "step" #step "_priority" #priority \
 	})
 
+#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_decode" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
-	TGU_PRIORITY3
+	TGU_PRIORITY3,
+	TGU_CONDITION_DECODE
 
 };
 
@@ -115,6 +137,7 @@ struct tgu_attribute {
 
 struct value_table {
 	unsigned int *priority;
+	unsigned int *condition_decode;
 };
 
 /**
@@ -127,6 +150,8 @@ struct value_table {
  * @value_table: Store given value based on relevant parameters.
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
+ * @max_condition: Maximum number of condition
+ * @max_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device, including its base
  * address, device pointers, clock, spinlock for synchronization, trigger data pointers,
@@ -141,6 +166,8 @@ struct tgu_drvdata {
 	struct value_table *value_table;
 	int max_reg;
 	int max_step;
+	int max_condition;
+	int max_condition_decode;
 };
 
 #endif

