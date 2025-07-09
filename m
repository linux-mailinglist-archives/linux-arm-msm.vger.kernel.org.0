Return-Path: <linux-arm-msm+bounces-64180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F59AFE60C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DE231C40EC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3984A28DF41;
	Wed,  9 Jul 2025 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vv9X2rPd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CE025A328;
	Wed,  9 Jul 2025 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752057696; cv=none; b=MHRoQH+PMAjpILTNqmcTpPskyImuKZRA1LtWcChneZOuswOjJ8GGVpUgGn/kvfOniY0mdKGwdkcxTrNpl1rnrbSx+cdlvZy0R3zmqNKpzk5JMLi9eEehmTIL159gRvNZMsD6Oz9iAKqP3ymwqudyIO8+Gh0rF2gshFy5skovA5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752057696; c=relaxed/simple;
	bh=eGjyQyt+1cjHSaR3R8kcCDQHsQ5GQ0dsaqT9INu4oKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=gdZlbKkD2Ogw3C340Tz8AIh4CFZn/e+Ktz1Vaoryr8nnxZV68cUK4aTtr3K2YoKrm1kjmmKpdUwDVL/LzWosdszflb0WX8XPAUlU1+Fx6jRIOBT/pd8DraFOpjaqxHNp9KYNykoZNgKM9Qr4T6iiwnBM/jnzqy1E/LiGUTAojuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vv9X2rPd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697j35R008644;
	Wed, 9 Jul 2025 10:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=9PrMAiiFp0LiGG8PUDKeefbBiaAqPS+vgUYJFQYsxbw=; b=Vv
	9X2rPdyr58L4EtiDkIFPY+V1vflMs42TAtx6c8PWp8dy3HMh0o2DcDX+KmicJoHt
	D7S5EGDQpkX9MbeZhVLyDRzCL2JZFIOfn+4THb9B7OrEcvbh4KVX+/GUx7hnx4MN
	oHC89Tl0FWqJcXnSG2AjnshA4zQ6WGOVNLVZB32QeO2QPzNbRKq2/iEOTZt9/svT
	hGHA6alq2xVjNbFRx/TyJKbI4aji583m1Y0gETFeYZDiDJkieBuKJ8Uod8ntxh7n
	3aui4TRdPRB/eYd5BQJ3dmuCG55aNT1JTeDw5ueR4EWS9Rfh7tvs86dVYBJGBwJR
	Oh4eMn/1oEoWyWXrHKpg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafghtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 10:41:23 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 569AfL3B008734;
	Wed, 9 Jul 2025 10:41:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 47snq40t5n-1;
	Wed, 09 Jul 2025 10:41:22 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569AfMbn008760;
	Wed, 9 Jul 2025 10:41:22 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-songchai-lv.qualcomm.com [10.81.24.255])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 569AfM5D008756;
	Wed, 09 Jul 2025 10:41:22 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 4201483)
	id 3AE505010D0; Wed,  9 Jul 2025 03:41:22 -0700 (PDT)
From: songchai <songchai@qti.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, quic_songchai@quicinc.com
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 5/7] coresight-tgu: add support to configure next action
Date: Wed,  9 Jul 2025 03:41:12 -0700
Message-Id: <20250709104114.22240-6-songchai@qti.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250709104114.22240-1-songchai@qti.qualcomm.com>
References: <20250709104114.22240-1-songchai@qti.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686e4753 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=p2n3lCMJEvriUG1kbLsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Vxu1iw_-ttRbBVzmy4Wi2VXqFI15MWvk
X-Proofpoint-GUID: Vxu1iw_-ttRbBVzmy4Wi2VXqFI15MWvk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA5NiBTYWx0ZWRfX61eyk+7udlig
 NshUtBNg9F5UN64JyTRsEezAISsI7J+mqkDwiskQ+k3uD3OxwrxQ+lu/wIR+uqQoULjPffa4ldI
 NLXccataJDeQJFZbTXhXGoF+cWb55cf74f+I55Pdn/t4PkdNgt45uNtYUoJ2Xz1nTVZDJFM9dEO
 n00WrFTHrJqszdfaRUnvjwYUG71NpdMNaKa73GQBFeDH7urYtOpDacIDApvLuPsUal2tWGn6+Bs
 X01h9WF+vK2B/KiF8zv3tEYmS9ngL/llKAWsPLmG9WPjquwEe3ficCiYaGIVH3Scr4nsax1fo0J
 FowzxJXCOw1CUqqY/ZZa9wolfnmokiOd4nFsKYH4n8CXeh8YBysGLjHtpw8JTu5+5uObL/GyuV8
 Hoj/4Im7RwsvM/b0irKl/QWbOiT4jKhXfFR5gOd30KrEKXSswNqAowG4YU9rfC5395I9rP+z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090096
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Songwei Chai <quic_songchai@quicinc.com>

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 +++
 drivers/hwtracing/coresight/coresight-tgu.c   | 59 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tgu.h   | 27 +++++++++
 3 files changed, 93 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 7530fff3338b..5ca91e122500 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion	6.16
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Songwei Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		July 2025
+KernelVersion	6.16
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Songwei Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index f123ae082555..71436fbdcc3e 100644
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
@@ -393,6 +435,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -454,6 +504,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
index 8d3c6ddc19ed..29f6fcf4d2be 100644
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
@@ -120,12 +136,20 @@
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
 	TGU_CONDITION_DECODE,
+	TGU_CONDITION_SELECT,
 };
 
 /* Maximum priority that TGU supports */
@@ -141,6 +165,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 /**
@@ -154,6 +179,7 @@ struct value_table {
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
  * @max_condition_decode: Maximum number of condition_decode
+ * @max_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -170,6 +196,7 @@ struct tgu_drvdata {
 	int max_reg;
 	int max_step;
 	int max_condition_decode;
+	int max_condition_select;
 };
 
 #endif


