Return-Path: <linux-arm-msm+bounces-30201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7032965CBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 11:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FC1A284792
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A3A17C208;
	Fri, 30 Aug 2024 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gpkt4PzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B7D17994F;
	Fri, 30 Aug 2024 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725009837; cv=none; b=LSU+czTP55YFjdJfvol9iNIx6fzNDZMYpq4mw4LTlpsMWEBcHY73hX/HPKleO5I/OSMdxja303wVUzN6gWq2d+hAggR2RF5BsYoalwbkUiegnzQ+Wn8sEHjpBC9Cutkqzv1bvTc10aLDFfyH8fs+OJaeKQQFyECZP2RuyPu1x6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725009837; c=relaxed/simple;
	bh=XFeo7OLU1rEuLNj1WAeONMNZiJgm5jsztOPu2GmO+3g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nRTgTgVNNhGEwTprW+8wq1MquYQJyAt2TfWGYgmqmoFFQShYcm/J4KiXersY/pN9SrQIA5JnCRMNTu6Psj5sOo0Twz8tJCM66w6BcbdYAOEWcu2xSdEQ5rLN3+ltwRjiz5V2kOx0yG+U1adWRMVhuP+/guEabxKUEW3AiSXWbW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gpkt4PzY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U8MFk2027880;
	Fri, 30 Aug 2024 09:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nTqPCRg/nFO2f+e0eMt8zOL4ssOS/asPFwz/Xt8kGA=; b=Gpkt4PzYUplo0ITb
	mWispXR0xy3mTOPdixgRwsKebN7KeDMjGUHUZO76xes+6rJEuuILW7KVFNGZxzqN
	ONy2GmoG6cdEeVjMYg9ItZPHnLys8qBPoBIZkIzn7CHzdp9B/starQcmGng8KS2I
	q4vPHnCkpcpVKavhAGEkUZqCPoI+Q9IUnDIG6MqNumN+MzBNciTFW7swcyVqqIpp
	RL1ooaUO1bKQzhnRAbjqR8ybfqnMMXEMctdreLILtgrddHtuTjRBodJ3wXCdS7PX
	YEHh+VRSC6wmtU7RkydSpHEVq+QeHHC9CVBFZX35fsj1Udw9N7YplxdiXT16NRBZ
	eWoDog==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puug2th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 09:23:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47U9NiFQ019074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 09:23:44 GMT
Received: from 3b5b8f7e4007.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 Aug 2024 02:23:43 -0700
From: songchai <quic_songchai@quicinc.com>
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
CC: songchai <quic_songchai@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 6/7] coresight-tgu: add timer/counter functionality for TGU
Date: Fri, 30 Aug 2024 17:23:07 +0800
Message-ID: <20240830092311.14400-7-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830092311.14400-1-quic_songchai@quicinc.com>
References: <20240830092311.14400-1-quic_songchai@quicinc.com>
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
X-Proofpoint-GUID: kRO9iVokf88990VhjIgok3BMvR_ta2xG
X-Proofpoint-ORIG-GUID: kRO9iVokf88990VhjIgok3BMvR_ta2xG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_04,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300069

Add counter and timer node for each step which could be
programed if they are to be utilized in trigger event/sequence.

Signed-off-by: songchai <quic_songchai@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   | 14 +++
 drivers/hwtracing/coresight/coresight-tgu.c   | 95 ++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tgu.h   | 47 ++++++++-
 3 files changed, 154 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 8dce2b46b48a..e404e0d6f8f0 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -28,3 +28,17 @@ KernelVersion   6.10
 Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
                 (RW) Set/Get the next action with specific step for TGU.
+
+What:           /sys/bus/coresight/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:           August 2024
+KernelVersion   6.10
+Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+                (RW) Set/Get the timer value with specific step for TGU.
+
+What:           /sys/bus/coresight/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:           August 2024
+KernelVersion   6.10
+Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+                (RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index 6b49856f5fb6..a5f194fecdb0 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.c
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -37,6 +37,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata, int step_index,
 	case TGU_CONDITION_SELECT:
 		ret = step_index * (drvdata->max_condition_select) + reg_index;
 		break;
+	case TGU_COUNTER:
+	case TGU_TIMER:
+		ret = step_index * (drvdata->max_timer_counter) + reg_index;
+		break;
 	default:
 		break;
 	}
@@ -70,7 +74,16 @@ static ssize_t tgu_dataset_show(struct device *dev,
 			drvdata->value_table->condition_select[calculate_array_location(
 				drvdata, tgu_attr->step_index, tgu_attr->operation_index,
 				tgu_attr->reg_num)]);
-
+	case TGU_TIMER:
+		return sysfs_emit(buf, "0x%x\n",
+			drvdata->value_table->timer[calculate_array_location(
+				drvdata, tgu_attr->step_index, tgu_attr->operation_index,
+				tgu_attr->reg_num)]);
+	case TGU_COUNTER:
+		return sysfs_emit(buf, "0x%x\n",
+			drvdata->value_table->counter[calculate_array_location(
+				drvdata, tgu_attr->step_index, tgu_attr->operation_index,
+				tgu_attr->reg_num)]);
 	}
 	return -EINVAL;
 
@@ -113,6 +126,18 @@ static ssize_t tgu_dataset_store(struct device *dev,
 			tgu_attr->reg_num)] = val;
 		ret = size;
 		break;
+	case TGU_TIMER:
+		tgu_drvdata->value_table->timer[calculate_array_location(
+			tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
+			tgu_attr->reg_num)] = val;
+		ret = size;
+		break;
+	case TGU_COUNTER:
+		tgu_drvdata->value_table->counter[calculate_array_location(
+			tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
+			tgu_attr->reg_num)] = val;
+		ret = size;
+		break;
 	default:
 		break;
 	}
@@ -153,6 +178,15 @@ static umode_t tgu_node_visible(struct kobject *kobject, struct attribute *attr,
 					drvdata->max_condition_select) ?
 						attr->mode : 0;
 			break;
+		case TGU_COUNTER:
+		case TGU_TIMER:
+			if (drvdata->max_timer_counter == 0)
+				ret = SYSFS_GROUP_INVISIBLE;
+			else
+				ret = (tgu_attr->reg_num <
+					drvdata->max_timer_counter) ?
+					attr->mode : 0;
+			break;
 		default:
 			break;
 		}
@@ -200,6 +234,26 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 		}
 	}
 
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_timer_counter; j++) {
+			tgu_writel(drvdata,
+				drvdata->value_table->timer
+					[calculate_array_location(drvdata, i,
+							TGU_TIMER, j)],
+						TIMER0_COMPARE_STEP(i, j));
+		}
+	}
+
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_timer_counter; j++) {
+			tgu_writel(drvdata,
+				drvdata->value_table->counter
+					[calculate_array_location(drvdata, i,
+						TGU_COUNTER, j)],
+				COUNTER0_COMPARE_STEP(i, j));
+		}
+	}
+
 	/* Enable TGU to program the triggers */
 	tgu_writel(drvdata, 1, TGU_CONTROL);
 	CS_LOCK(drvdata->base);
@@ -358,6 +412,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
+	TIMER_ATTRIBUTE_GROUP_INIT(0),
+	TIMER_ATTRIBUTE_GROUP_INIT(1),
+	TIMER_ATTRIBUTE_GROUP_INIT(2),
+	TIMER_ATTRIBUTE_GROUP_INIT(3),
+	TIMER_ATTRIBUTE_GROUP_INIT(4),
+	TIMER_ATTRIBUTE_GROUP_INIT(5),
+	TIMER_ATTRIBUTE_GROUP_INIT(6),
+	TIMER_ATTRIBUTE_GROUP_INIT(7),
+	COUNTER_ATTRIBUTE_GROUP_INIT(0),
+	COUNTER_ATTRIBUTE_GROUP_INIT(1),
+	COUNTER_ATTRIBUTE_GROUP_INIT(2),
+	COUNTER_ATTRIBUTE_GROUP_INIT(3),
+	COUNTER_ATTRIBUTE_GROUP_INIT(4),
+	COUNTER_ATTRIBUTE_GROUP_INIT(5),
+	COUNTER_ATTRIBUTE_GROUP_INIT(6),
+	COUNTER_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -407,6 +477,11 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (ret)
 		return -EINVAL;
 
+	ret = of_property_read_u32(adev->dev.of_node, "tgu-timer-counters",
+				   &drvdata->max_timer_counter);
+	if (ret)
+		return -EINVAL;
+
 	drvdata->max_condition_decode = drvdata->max_condition;
 	/* select region has an additional 'default' register */
 	drvdata->max_condition_select = drvdata->max_condition + 1;
@@ -443,6 +518,24 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata->value_table->condition_select)
 		return -ENOMEM;
 
+	drvdata->value_table->timer = devm_kzalloc(
+		dev,
+		drvdata->max_step * drvdata->max_timer_counter *
+			sizeof(*(drvdata->value_table->timer)),
+		GFP_KERNEL);
+
+	if (!drvdata->value_table->timer)
+		return -ENOMEM;
+
+	drvdata->value_table->counter = devm_kzalloc(
+		dev,
+		drvdata->max_step * drvdata->max_timer_counter *
+			sizeof(*(drvdata->value_table->counter)),
+		GFP_KERNEL);
+
+	if (!drvdata->value_table->counter)
+		return -ENOMEM;
+
 	drvdata->enable = false;
 	desc.type = CORESIGHT_DEV_TYPE_HELPER;
 	desc.pdata = adev->dev.platform_data;
diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
index 0d3b966dafc7..9fa23033b4af 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.h
+++ b/drivers/hwtracing/coresight/coresight-tgu.h
@@ -52,6 +52,12 @@
 #define CONDITION_SELECT_STEP(step, select) \
 	(0x0060 + 0x4 * select + 0x1D8 * step)
 
+#define TIMER0_COMPARE_STEP(step, timer) \
+	(0x0040 + 0x4 * timer + 0x1D8 * step)
+
+#define COUNTER0_COMPARE_STEP(step, counter) \
+	(0x0048 + 0x4 * counter + 0x1D8 * step)
+
 #define tgu_dataset_ro(name, step_index, type, reg_num)     \
 	(&((struct tgu_attribute[]){ {                      \
 		__ATTR(name, 0444, tgu_dataset_show, NULL), \
@@ -78,6 +84,12 @@
 #define STEP_SELECT(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
 
+#define STEP_TIMER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
+
+#define STEP_COUNTER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -117,6 +129,18 @@
 	 NULL           \
 	}
 
+#define STEP_TIMER_LIST(n) \
+	{STEP_TIMER(n, 0), \
+	 STEP_TIMER(n, 1), \
+	 NULL           \
+	}
+
+#define STEP_COUNTER_LIST(n) \
+	{STEP_COUNTER(n, 0), \
+	 STEP_COUNTER(n, 1), \
+	 NULL           \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -138,13 +162,29 @@
 		.name = "step" #step "_condition_select" \
 	})
 
+#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_TIMER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_timer" \
+	})
+
+#define COUNTER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_COUNTER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_counter" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
-	TGU_CONDITION_SELECT
+	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER
 };
 
 /* Maximum priority that TGU supports */
@@ -161,6 +201,8 @@ struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
 	unsigned int *condition_select;
+	unsigned int *timer;
+	unsigned int *counter;
 };
 
 /**
@@ -176,6 +218,8 @@ struct value_table {
  * @max_condition: Maximum number of condition
  * @max_condition_decode: Maximum number of condition_decode
  * @max_condition_select: Maximum number of condition_select
+ * @max_timer_counter: Maximum number of timers and counters
+ *
  * This structure defines the data associated with a TGU device, including its base
  * address, device pointers, clock, spinlock for synchronization, trigger data pointers,
  * maximum limits for various trigger-related parameters, and enable status.
@@ -192,6 +236,7 @@ struct tgu_drvdata {
 	int max_condition;
 	int max_condition_decode;
 	int max_condition_select;
+	int max_timer_counter;
 };
 
 #endif


