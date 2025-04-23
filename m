Return-Path: <linux-arm-msm+bounces-55037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D99CA97F24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 08:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D04121895E2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 06:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24935267383;
	Wed, 23 Apr 2025 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cF8ojDCI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEAF26739A
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745389627; cv=none; b=gAm4K+MkwQdo28CMyeDdf06k9WG8LdyJvSF3q1NxZ+87DWLu6IO0qGdAmyD7dTG5GWjzdrO/nu18SKsHWZ6jr4V2uN2UVFyssslwRK5v9MvPfA8sw8pDp5AFp7FXuAejxsBvRWw5ZaO1pNTlDEd2cYf0eUaxNQHsMeQimlLXhMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745389627; c=relaxed/simple;
	bh=DDZf1FFvkn306mZt9cI8qAb46tMV89ydtiYpLLqsJUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ddxbouOVlUlGsJ7/URkffkK/ZPNx5rV1xUMktYqiBN/XLrnWC56cdwln5qunqmJenooHoxkNJqk6mYiqlfap5mziisGc4cQI6qD6pHyojLvW3mQ5x+d9tgx/uHwQ7kMAPufETI3Gxu9mtcPSSvtpXOQeTnZxFuyzn+ISg1PFh7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cF8ojDCI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0imB8023624
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NTCphIHjibI+QtOK35pNm7Oak3oZM3JJBp8wKmZ/VVM=; b=cF8ojDCIPhz9sXSe
	Jez0KfrmaMNLVdDmnkgksOTgy1I0mMEK0YfXiGWJPMEzkotwHTQOwwjRJg/0A4RF
	52klX6RFoioIKs5sE1uhGGbjrwdj+LTv1RA3YwLgmBoRwpGsH4uR4NL1WsgjlFNT
	WxTkHyDmizVRHAGO576YmkB2sI2vP6aEu89ZoMl1FFCRXVntVnM/UcXYAiFwiQga
	O0RIMOAhWxFMdayjwXKAMfBviXuBp5UB4OXsX5lTV1aXItRl0D89R/EfrE4Wu3Tc
	jOPpCNYHSiva19VSVrzK6ClLVSrC55XRuc5Hq37kQYj9KyZlxFBDm7y4PwCfaazh
	q3AcJg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2931u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6R3gT028964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:03 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 23:27:02 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
Date: Wed, 23 Apr 2025 14:26:49 +0800
Subject: [PATCH v4 5/7] coresight-tgu: add support to configure next action
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-tgu_patch-v4-5-92bbca66c766@quicinc.com>
References: <20250423-tgu_patch-v4-0-92bbca66c766@quicinc.com>
In-Reply-To: <20250423-tgu_patch-v4-0-92bbca66c766@quicinc.com>
To: <quic_songchai@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745389616; l=8826;
 i=quic_songchai@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=DDZf1FFvkn306mZt9cI8qAb46tMV89ydtiYpLLqsJUc=;
 b=muk5Kzja0e6vsncezVlv6y33nY5JItm691+ZzPlqRDpI4IYlXJ5NqEiY1q10xnD+V8n+BhJG8
 VwzRk3RS6UcAYatoLA2WOYemCr3kBRbJl7RVsRexAEz5xacuvH1yiX4
X-Developer-Key: i=quic_songchai@quicinc.com; a=ed25519;
 pk=uPEL8tAga6UMzd+eo6u4Mmg7ctrdZe8b/sjFJqJYEHA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1mbQkTzYaTCWD3Udb9U3DuVkxe3V-9Ao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MiBTYWx0ZWRfXwatCfXdieYsx SvZGl31X1oYoNUv3874Z8jnAZSjilorPgQhNaN+JajzQrWub56BHPpRR5DkkkH6vyf/0KQu0uY/ CGHpvRD/oGR91lHib/GJBoSCVrPDkb5Dh22p5Nxo0Rwj0EyIVCbEPYTXfHa4FTs0FwNnORaWJ7e
 LlRohYTHq7Dw7OrnBd9hngNpByo+5xUgBTnvPmRMD9zS4oJ+e1b56ASAJCawVYukGXS+WOqr+QH fNrqokvAdL1G8RBAsj4gifd3JQPXspFQXAI/5HoStess/Fr3em24MM4y6qHNOy6oLuGGxo9ZL2p 3I2C0waD+OcX1i/5nJHbNCuoLi2zZcZB6ArUhelQentL5jNdTn+SfAIJTxbwE7tC0VJo5cUnduV
 O1VuA0+FnDf1kZgJWePC9HVrrIGiiX7v27ufJef2FVaq258pRxJxnDmax3CHeO98vGj2FvvD
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=68088838 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=PC4GMqSRiiGiLr4DLo4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1mbQkTzYaTCWD3Udb9U3DuVkxe3V-9Ao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=942 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230042

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tgu    |  9 +++-
 drivers/hwtracing/coresight/coresight-tgu.c        | 59 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tgu.h        | 30 ++++++++++-
 3 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 50967ca039d88d7aa16e3d9c92aec32fef2b3498..5e82fc91f8f70ac1b4c2f283466fec4e56178b16 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -20,4 +20,11 @@ Date:           February 2025
 KernelVersion   6.15
 Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
-                (RW) Set/Get the decode mode with specific step for TGU.
\ No newline at end of file
+                (RW) Set/Get the decode mode with specific step for TGU.
+
+What:           /sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:           February 2025
+KernelVersion   6.15
+Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+                (RW) Set/Get the next action with specific step for TGU.
\ No newline at end of file
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index 8dbe8ab30174d97d754dcac23e2666c2cbfe4a48..41f648b9e0ee59e91e5c64c510dd40a828d37fd0 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.c
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -36,6 +36,9 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 		ret = step_index * (drvdata->max_condition_decode) +
 		      reg_index;
 		break;
+	case TGU_CONDITION_SELECT:
+		ret = step_index * (drvdata->max_condition_select) + reg_index;
+		break;
 	default:
 		break;
 	}
@@ -81,6 +84,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
 					  drvdata, tgu_attr->step_index,
 					  tgu_attr->operation_index,
 					  tgu_attr->reg_num)]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->condition_select[calculate_array_location(
+					  drvdata, tgu_attr->step_index,
+					  tgu_attr->operation_index,
+					  tgu_attr->reg_num)]);
 	default:
 		break;
 	}
@@ -127,6 +136,13 @@ static ssize_t tgu_dataset_store(struct device *dev,
 			tgu_attr->reg_num)] = val;
 		ret = size;
 		break;
+	case TGU_CONDITION_SELECT:
+		tgu_drvdata->value_table->condition_select[calculate_array_location(
+			tgu_drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index,
+			tgu_attr->reg_num)] = val;
+		ret = size;
+		break;
 	default:
 		break;
 	}
@@ -162,6 +178,16 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 				      attr->mode :
 				      0;
 			break;
+		case TGU_CONDITION_SELECT:
+			/* 'default' register is at the end of 'select' region */
+			if (tgu_attr->reg_num ==
+			    drvdata->max_condition_select - 1)
+				attr->name = "default";
+			ret = (tgu_attr->reg_num <
+			       drvdata->max_condition_select) ?
+				      attr->mode :
+				      0;
+			break;
 		default:
 			break;
 		}
@@ -206,6 +232,20 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				   CONDITION_DECODE_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_select; j++) {
+			ret = check_array_location(drvdata, i, TGU_CONDITION_SELECT, j);
+			if (ret == -EINVAL)
+				goto exit;
+
+			tgu_writel(drvdata,
+				   drvdata->value_table->condition_select
+					   [calculate_array_location(drvdata, i,
+								     TGU_CONDITION_SELECT, j)],
+				   CONDITION_SELECT_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	tgu_writel(drvdata, 1, TGU_CONTROL);
 exit:
@@ -250,6 +290,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 
 	num_conditions = TGU_DEVID_CONDITIONS(devid);
 	drvdata->max_condition_decode = num_conditions;
+	/* select region has an additional 'default' register */
+	drvdata->max_condition_select = num_conditions + 1;
 }
 
 static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
@@ -397,6 +439,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -458,6 +508,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
index 691da393ffa30fe7501ba0e8c4a058d8d561fc14..214ee67d194748aeb2dfe78502e5d778673bc973 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.h
+++ b/drivers/hwtracing/coresight/coresight-tgu.h
@@ -50,6 +50,7 @@
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
+#define CONDITION_SELECT_OFFSET 0x0060
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -61,6 +62,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -76,6 +80,9 @@
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -106,6 +113,15 @@
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
@@ -120,13 +136,20 @@
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
@@ -142,6 +165,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 /**
@@ -155,6 +179,7 @@ struct value_table {
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
  * @max_condition_decode: Maximum number of condition_decode
+ * @max_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -171,6 +196,7 @@ struct tgu_drvdata {
 	int max_reg;
 	int max_step;
 	int max_condition_decode;
+	int max_condition_select;
 };
 
 #endif

-- 
2.34.1


