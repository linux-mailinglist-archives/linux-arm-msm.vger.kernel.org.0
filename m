Return-Path: <linux-arm-msm+bounces-55036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1D3A97F22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 08:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DABF87A9AC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 06:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF21C1C863B;
	Wed, 23 Apr 2025 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DcqCpkxn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F2D267398
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745389625; cv=none; b=DSynqaZ8roDFsEMN+VpU43we36xrwm+PchdX9k46j5fz+AeUdKCmsKUXSs+y+jTi/TjuYFa4Rplca79zwXJPGd6J4uIDvLcrYlRn4JIJW7e5K3XMikl4807fzC+5ytjEF0wb8399jwqX0c2ouApZ8uTQWawMGgsL2X6doe94zt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745389625; c=relaxed/simple;
	bh=zDSWB5ZQL64jZdFU+N47vHveNi/dyeJWeMMzP1Bi+Ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sv+UIaSGY80rCI6qd+MitROIIAA+KUDOGRGLBOGYbGhZRvM1Z1G2asKLE13BPHHoW/g0hNWAF7VaG+Iu6csgsoDsyzht27GFdPGe/g6KQ7rki8UjSzROGrpckJw7vjCDIRPK2fxnYj7yX36uDCr6IbOVijUf8HfO+jWVKt/0EAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DcqCpkxn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i9Ns022454
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWMUpGQrKP1Bb90N8fg/CgqQ3YAIvi/iJCkmEnEet3Y=; b=DcqCpkxnnHfgW1oR
	jBJg8ZBK/W5ljK1FgeHWr63Yu6zgmtPvZNhJ/6C5eC7iTBSK28Y7ssbGRPXQRGAL
	6YMIsRlX8IZmAzlOGf/0tgsAMe30SUR0A3Z6Bulaqksya6vxlq4StdHUwjEzgbpu
	trFd4fJ3e313NLt8niJujVx/fGRps2gFeHIxHNTnPwU0vDQFsCW40YqHWT5XF2bO
	5ChQnE4LqagU2A/vPzfzvTmEYESSTnT+Gs3mBaQtjUqrjuO56Jrn8A2yMhD3p1ok
	fBjrzQdyGXBhM+ZXnSAi/mBjFjLXSEZM97aBl763BVSJQBLIrsQ5zxhjmBAdGtSG
	VkG0iQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2931t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6R2gF022936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:02 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 23:27:01 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
Date: Wed, 23 Apr 2025 14:26:48 +0800
Subject: [PATCH v4 4/7] coresight-tgu: Add TGU decode support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-tgu_patch-v4-4-92bbca66c766@quicinc.com>
References: <20250423-tgu_patch-v4-0-92bbca66c766@quicinc.com>
In-Reply-To: <20250423-tgu_patch-v4-0-92bbca66c766@quicinc.com>
To: <quic_songchai@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745389616; l=13645;
 i=quic_songchai@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=zDSWB5ZQL64jZdFU+N47vHveNi/dyeJWeMMzP1Bi+Ow=;
 b=lXxcrNt0mb+0neH8tT7SfY4wx6ofcayfH3F7mZzYgxv3UW5tBzOgPfHl1qG/CU9dI7vP+VujJ
 BIt13G5BWEXCQSzU6iYfweXyLcyd8UkE7LvPxTRuWRTP7yP7gKvZD5S
X-Developer-Key: i=quic_songchai@quicinc.com; a=ed25519;
 pk=uPEL8tAga6UMzd+eo6u4Mmg7ctrdZe8b/sjFJqJYEHA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TyrUQwq2nfKEKCDv8P6COeAD0We0tIuv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MiBTYWx0ZWRfX769LsOH2r86m qYgcHcFDfVnWVfRG9/FaA7klhLXhv1ho9Gxxtwb4HFd1KlD9ZLSJItnPZ3ErECPPk1zYEJ1AVjN JIKtBwvd69ptIgRHafE5uLGhh1g0/75GFTaCCqFKlXpG6E5XovaOB0DP9RRATzFjI3493eNvlwd
 xS4COid+wpoIdXJt/xr5JYQkTNPm4L4cZwGvr4U3jbHvWIdMy3WUjeBnTcc6nLv0JYxnQkp1IpZ KJXJ9F6U8ffBAH6HdglG8ABmBRb0/IZ6Vt06upEvWdbRXMu8QHCeR4LHEf8uYal0wsV/b3y/86w oUfpG/cn6QnN9C3+tpfieU7SOA1AJqt2gpUXkyMx3FUgiHvYLaYhQQx5IwFYy/WXEHv7YK5XSWY
 zd/IIqlukI4Du9i1M+1bzp1Hzg8K1dAcyvEiy4/tiaMJd1DGhVEL+6Y3w/rl5QT7M1+mw962
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=68088837 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Nw7lCmHzFsErCi6YrEgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TyrUQwq2nfKEKCDv8P6COeAD0We0tIuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230042

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
steps.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tgu    |   7 +
 drivers/hwtracing/coresight/coresight-tgu.c        | 186 ++++++++++++++++++---
 drivers/hwtracing/coresight/coresight-tgu.h        |  29 +++-
 3 files changed, 196 insertions(+), 26 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 58434097688388ab5d755030c52acca75f04cfb6..50967ca039d88d7aa16e3d9c92aec32fef2b3498 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion   6.15
 Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
                 (RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:           /sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:           February 2025
+KernelVersion   6.15
+Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+                (RW) Set/Get the decode mode with specific step for TGU.
\ No newline at end of file
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index 6dbfd4c604b1fe6335e0cdff69521a08325c1f4d..8dbe8ab30174d97d754dcac23e2666c2cbfe4a48 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.c
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -21,13 +21,35 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 				    int step_index, int operation_index,
 				    int reg_index)
 {
-	int ret;
+	int ret = -EINVAL;
+
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		ret = operation_index * (drvdata->max_step) *
+			      (drvdata->max_reg) +
+		      step_index * (drvdata->max_reg) + reg_index;
+		break;
+	case TGU_CONDITION_DECODE:
+		ret = step_index * (drvdata->max_condition_decode) +
+		      reg_index;
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
 
-	ret = operation_index * (drvdata->max_step) *
-		      (drvdata->max_reg) +
-	      step_index * (drvdata->max_reg) + reg_index;
+static int check_array_location(struct tgu_drvdata *drvdata, int step,
+				int ops, int reg)
+{
+	int result = calculate_array_location(drvdata, step, ops, reg);
 
-	return ret;
+	if (result == -EINVAL)
+		dev_err(&drvdata->csdev->dev, "%s - Fail\n", __func__);
+	return result;
 }
 
 static ssize_t tgu_dataset_show(struct device *dev,
@@ -36,13 +58,33 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct tgu_attribute *tgu_attr =
 		container_of(attr, struct tgu_attribute, attr);
+	int ret = 0;
+
+	ret = check_array_location(drvdata, tgu_attr->step_index,
+				tgu_attr->operation_index, tgu_attr->reg_num);
+	if (ret == -EINVAL)
+		return ret;
 
-	return sysfs_emit(buf, "0x%x\n",
-			  drvdata->value_table->priority[
-					calculate_array_location(
-					drvdata, tgu_attr->step_index,
-					tgu_attr->operation_index,
-					tgu_attr->reg_num)]);
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->priority[calculate_array_location(
+					  drvdata, tgu_attr->step_index,
+					  tgu_attr->operation_index,
+					  tgu_attr->reg_num)]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->condition_decode[calculate_array_location(
+					  drvdata, tgu_attr->step_index,
+					  tgu_attr->operation_index,
+					  tgu_attr->reg_num)]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -51,20 +93,44 @@ static ssize_t tgu_dataset_store(struct device *dev,
 				 size_t size)
 {
 	unsigned long val;
+	int ret = -EINVAL;
 
 	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev->parent);
 	struct tgu_attribute *tgu_attr =
 		container_of(attr, struct tgu_attribute, attr);
 
 	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
+		return ret;
 
-	guard(spinlock)(&tgu_drvdata->spinlock);
-	tgu_drvdata->value_table->priority[calculate_array_location(
-		tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
-		tgu_attr->reg_num)] = val;
+	ret = check_array_location(tgu_drvdata, tgu_attr->step_index,
+		tgu_attr->operation_index, tgu_attr->reg_num);
 
-	return size;
+	if (ret == -EINVAL)
+		return ret;
+
+	guard(spinlock)(&tgu_drvdata->spinlock);
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->value_table->priority[calculate_array_location(
+			tgu_drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index,
+			tgu_attr->reg_num)] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->value_table->condition_decode[calculate_array_location(
+			tgu_drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index,
+			tgu_attr->reg_num)] = val;
+		ret = size;
+		break;
+	default:
+		break;
+	}
+	return ret;
 }
 
 static umode_t tgu_node_visible(struct kobject *kobject,
@@ -81,34 +147,70 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		container_of(dev_attr, struct tgu_attribute, attr);
 
 	if (tgu_attr->step_index < drvdata->max_step) {
-		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
-			      attr->mode :
-			      0;
+		switch (tgu_attr->operation_index) {
+		case TGU_PRIORITY0:
+		case TGU_PRIORITY1:
+		case TGU_PRIORITY2:
+		case TGU_PRIORITY3:
+			ret = (tgu_attr->reg_num < drvdata->max_reg) ?
+				      attr->mode :
+				      0;
+			break;
+		case TGU_CONDITION_DECODE:
+			ret = (tgu_attr->reg_num <
+			       drvdata->max_condition_decode) ?
+				      attr->mode :
+				      0;
+			break;
+		default:
+			break;
+		}
 	}
 	return ret;
 }
 
-static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
-	int i, j, k;
+	int i, j, k, ret;
 
 	CS_UNLOCK(drvdata->base);
 
 	for (i = 0; i < drvdata->max_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->max_reg; k++) {
+
+				ret = check_array_location(drvdata, i, j, k);
+				if (ret == -EINVAL)
+					goto exit;
+
 				tgu_writel(drvdata,
 					   drvdata->value_table->priority
 						   [calculate_array_location(
-							drvdata, i, j, k)],
+							   drvdata, i, j, k)],
 					   PRIORITY_REG_STEP(i, j, k));
 			}
 		}
 	}
 
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			ret = check_array_location(drvdata, i, TGU_CONDITION_DECODE, j);
+			if (ret == -EINVAL)
+				goto exit;
+
+			tgu_writel(drvdata,
+				   drvdata->value_table->condition_decode
+					   [calculate_array_location(
+						   drvdata, i,
+						   TGU_CONDITION_DECODE, j)],
+				   CONDITION_DECODE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	tgu_writel(drvdata, 1, TGU_CONTROL);
+exit:
 	CS_LOCK(drvdata->base);
+	return ret >= 0 ? 0 : ret;
 }
 
 static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
@@ -139,9 +241,21 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
 	drvdata->max_step = num_steps;
 }
 
+static void tgu_set_conditions(struct tgu_drvdata *drvdata)
+{
+	int num_conditions;
+	u32 devid;
+
+	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
+
+	num_conditions = TGU_DEVID_CONDITIONS(devid);
+	drvdata->max_condition_decode = num_conditions;
+}
+
 static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		      void *data)
 {
+	int ret = 0;
 	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
 	spin_lock(&drvdata->spinlock);
@@ -150,11 +264,15 @@ static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		spin_unlock(&drvdata->spinlock);
 		return -EBUSY;
 	}
-	tgu_write_all_hw_regs(drvdata);
+	ret = tgu_write_all_hw_regs(drvdata);
+
+	if (ret == -EINVAL)
+		goto exit;
 	drvdata->enable = true;
 
+exit:
 	spin_unlock(&drvdata->spinlock);
-	return 0;
+	return ret;
 }
 
 static int tgu_disable(struct coresight_device *csdev, void *data)
@@ -271,6 +389,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -307,6 +433,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
+	tgu_set_conditions(drvdata);
 
 	drvdata->value_table =
 		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
@@ -322,6 +449,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
index f07ead50536581578bcae7248d913207db6ac8ea..691da393ffa30fe7501ba0e8c4a058d8d561fc14 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.h
+++ b/drivers/hwtracing/coresight/coresight-tgu.h
@@ -15,6 +15,7 @@
 
 #define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
 #define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
+#define TGU_DEVID_CONDITIONS(devid_val) ((int)BMVAL(devid_val, 0, 2))
 #define NUMBER_BITS_EACH_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -48,6 +49,7 @@
  */
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
+#define CONDITION_DECODE_OFFSET 0x0050
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -56,6 +58,9 @@
 	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
 	REG_OFFSET * reg + STEP_OFFSET * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -68,6 +73,9 @@
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
 		       reg_num)
 
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -90,6 +98,14 @@
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
@@ -97,11 +113,19 @@
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
 
@@ -117,6 +141,7 @@ struct tgu_attribute {
 
 struct value_table {
 	unsigned int *priority;
+	unsigned int *condition_decode;
 };
 
 /**
@@ -129,6 +154,7 @@ struct value_table {
  * @value_table: Store given value based on relevant parameters.
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
+ * @max_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -144,6 +170,7 @@ struct tgu_drvdata {
 	struct value_table *value_table;
 	int max_reg;
 	int max_step;
+	int max_condition_decode;
 };
 
 #endif

-- 
2.34.1


