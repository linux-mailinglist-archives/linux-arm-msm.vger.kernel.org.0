Return-Path: <linux-arm-msm+bounces-33806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D08997F9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 915861F27628
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3BB1F8922;
	Thu, 10 Oct 2024 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mD3TnxOF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3AB1F8920;
	Thu, 10 Oct 2024 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546023; cv=none; b=srQzST+YcxMw4v6bz0EZsaUwkx7OwmgcYcAt9Uzgb3n33v5dH/AoKHrEUgImO9SXmkMh2CxECXXtH+HX5QdlNpxgpOEns9P0Kbnc06qxBaZFad54oLE0fc6Ufl7MLDygE5oaL4RgKgxkAesoLcWy7iW+4h+Wedh/UoDykT1pQL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546023; c=relaxed/simple;
	bh=V6eDMsF201LSaKGElhYRpw80JYrI4MpDxrLTo4pbt1g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MlJdAiIedsviUn/EfJZa3BRHVxLNfScUygRSliSMGLOo70gFa+37KeqsEo7tOaYZL3y6R0VKoUtqoknisaYkFx1CQP/qvtY2E43LRi8carfy0ycHhmQBnfBMSYSL37tIJTgSe3zR076gTENOHOxPJgkbhvGNBOzWLCaeA+6FA7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mD3TnxOF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A7HqW9024438;
	Thu, 10 Oct 2024 07:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KbTn3ClwIGDQpoiNKWsyaHJbQBmRMiYyUjld5fiJjvg=; b=mD3TnxOFq1/6hMzq
	LqSfpWn1WojGnirALcPDD0xfs31eJCnymkd2ERE9moE5aUwzdjWKeZE8+z9fP+0x
	7EGFOwTHvqv0ciq7YH1MDfFBdApSM5HLvZiCe2LUb2pYkxPwDxdLQPS06nuKqRN/
	//v3P4sVE/g+hVHkTB+0aHKJYw9vkUXjfuHSSMuDYJXHd1UWmn75kfL2CClNG2zQ
	JwZmnL+s6OJ3CrZtGWT/Ljdf2Wfb4tOh9dt0UKaBp54MZMIKrrHuASLMMvj9xA0R
	RjnGUFHViu4+yVH76r2NbCnZcvyzSXlwcjiXc5rk4TEQZpB07chiUjrsYyM7K1bF
	AFU7vg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426adhg1nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:39:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A7dZiX028668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:39:35 GMT
Received: from 3b5b8f7e4007.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 00:39:35 -0700
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
Subject: [PATCH v2 5/7] coresight-tgu: add support to configure next action
Date: Thu, 10 Oct 2024 15:39:13 +0800
Message-ID: <20241010073917.16023-6-quic_songchai@quicinc.com>
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
X-Proofpoint-GUID: SkpuPlQRWWu46_gZkecaMbAvDwZjiU0_
X-Proofpoint-ORIG-GUID: SkpuPlQRWWu46_gZkecaMbAvDwZjiU0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100049

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 +++
 drivers/hwtracing/coresight/coresight-tgu.c   | 51 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tgu.h   | 30 +++++++++--
 3 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index e2c66d545912..8dce2b46b48a 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion   6.10
 Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
                 (RW) Set/Get the decode mode with specific step for TGU.
+
+What:           /sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:           August 2024
+KernelVersion   6.10
+Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+                (RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index b21283c89373..860fab854b95 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.c
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -34,6 +34,9 @@ static int calculate_array_location(struct tgu_drvdata *drvdata, int step_index,
 	case TGU_CONDITION_DECODE:
 		ret = step_index * (drvdata->max_condition_decode) + reg_index;
 		break;
+	case TGU_CONDITION_SELECT:
+		ret = step_index * (drvdata->max_condition_select) + reg_index;
+		break;
 	default:
 		break;
 	}
@@ -62,6 +65,11 @@ static ssize_t tgu_dataset_show(struct device *dev,
 				  drvdata->value_table->condition_decode[calculate_array_location(
 				  drvdata, tgu_attr->step_index, tgu_attr->operation_index,
 				  tgu_attr->reg_num)]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+			drvdata->value_table->condition_select[calculate_array_location(
+				drvdata, tgu_attr->step_index, tgu_attr->operation_index,
+				tgu_attr->reg_num)]);
 
 	}
 	return -EINVAL;
@@ -99,6 +107,12 @@ static ssize_t tgu_dataset_store(struct device *dev,
 			tgu_attr->reg_num)] = val;
 		ret = size;
 		break;
+	case TGU_CONDITION_SELECT:
+		tgu_drvdata->value_table->condition_select[calculate_array_location(
+			tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
+			tgu_attr->reg_num)] = val;
+		ret = size;
+		break;
 	default:
 		break;
 	}
@@ -131,6 +145,14 @@ static umode_t tgu_node_visible(struct kobject *kobject, struct attribute *attr,
 					drvdata->max_condition_decode) ?
 						attr->mode : 0;
 			break;
+		case TGU_CONDITION_SELECT:
+			/* 'default' register is at the end of 'select' region */
+			if (tgu_attr->reg_num == drvdata->max_condition_select-1)
+				attr->name = "default";
+			ret = (tgu_attr->reg_num <
+					drvdata->max_condition_select) ?
+						attr->mode : 0;
+			break;
 		default:
 			break;
 		}
@@ -168,6 +190,16 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 		}
 	}
 
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_select; j++) {
+			tgu_writel(drvdata,
+				drvdata->value_table->condition_select
+					[calculate_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j)],
+				CONDITION_SELECT_STEP(i, j));
+		}
+	}
+
 	/* Enable TGU to program the triggers */
 	tgu_writel(drvdata, 1, TGU_CONTROL);
 	CS_LOCK(drvdata->base);
@@ -318,6 +350,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -368,6 +408,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 		return -EINVAL;
 
 	drvdata->max_condition_decode = drvdata->max_condition;
+	/* select region has an additional 'default' register */
+	drvdata->max_condition_select = drvdata->max_condition + 1;
 
 	drvdata->value_table =
 		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
@@ -392,6 +434,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata->value_table->condition_decode)
 		return -ENOMEM;
 
+	drvdata->value_table->condition_select = devm_kzalloc(
+		dev,
+		drvdata->max_condition_select * drvdata->max_step *
+			sizeof(*(drvdata->value_table->condition_select)),
+		GFP_KERNEL);
+
+	if (!drvdata->value_table->condition_select)
+		return -ENOMEM;
+
 	drvdata->enable = false;
 	desc.type = CORESIGHT_DEV_TYPE_HELPER;
 	desc.pdata = adev->dev.platform_data;
diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
index 243a22098370..0d3b966dafc7 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.h
+++ b/drivers/hwtracing/coresight/coresight-tgu.h
@@ -49,6 +49,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(0x0050 + 0x4 * decode + 0x1D8 * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(0x0060 + 0x4 * select + 0x1D8 * step)
+
 #define tgu_dataset_ro(name, step_index, type, reg_num)     \
 	(&((struct tgu_attribute[]){ {                      \
 		__ATTR(name, 0444, tgu_dataset_show, NULL), \
@@ -72,6 +75,9 @@
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -102,6 +108,15 @@
 	 NULL           \
 	}
 
+#define STEP_SELECT_LIST(n) \
+	{STEP_SELECT(n, 0), \
+	 STEP_SELECT(n, 1), \
+	 STEP_SELECT(n, 2), \
+	 STEP_SELECT(n, 3), \
+	 STEP_SELECT(n, 4), \
+	 NULL           \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -116,13 +131,20 @@
 		.name = "step" #step "_condition_decode" \
 	})
 
+#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_select" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
-	TGU_CONDITION_DECODE
-
+	TGU_CONDITION_DECODE,
+	TGU_CONDITION_SELECT
 };
 
 /* Maximum priority that TGU supports */
@@ -138,6 +160,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 /**
@@ -152,7 +175,7 @@ struct value_table {
  * @max_step: Maximum step size
  * @max_condition: Maximum number of condition
  * @max_condition_decode: Maximum number of condition_decode
- *
+ * @max_condition_select: Maximum number of condition_select
  * This structure defines the data associated with a TGU device, including its base
  * address, device pointers, clock, spinlock for synchronization, trigger data pointers,
  * maximum limits for various trigger-related parameters, and enable status.
@@ -168,6 +191,7 @@ struct tgu_drvdata {
 	int max_step;
 	int max_condition;
 	int max_condition_decode;
+	int max_condition_select;
 };
 
 #endif

