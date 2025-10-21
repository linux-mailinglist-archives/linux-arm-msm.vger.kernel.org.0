Return-Path: <linux-arm-msm+bounces-78078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE33BBF46F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 05:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D5D144EC925
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 03:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144A12D238D;
	Tue, 21 Oct 2025 02:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkNBMhmG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408402882BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761015582; cv=none; b=t2ahzmISHRG0TxGL77Xk1SO4+AgPA2sIsxT0ULw+4V5L4vpW1zo4nRmSkbWpT2IjPtof0L7LKBTafzZQh1Os6igiIuCR8UFNcKnTKEEL9SVys4mpwU8dMB9TxLwk3yxDybnjh4HpLJaTS2OpAqZCVivHJjAswLNNWOBNgLjVZEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761015582; c=relaxed/simple;
	bh=t2uVYh/HzkReb7Ne11GHihtlx7yqNuzMvoH0yKsSjjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VtFRlce1DyDT0FaAdPBymlIyaPKvfixPQAVQ+OKFpP70Z6C6xW6+WpZvXhqlRwh5OfhLyDTR6oy4Y/9FxIeh7eb/rFq2Sa3Q1lGjmCBZW3KyaebbBn139xPmaErzJKB/6rsTMcSe9IKkao12CH86Jk4fFxgJRFoBo2Y8zLVJLoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkNBMhmG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL1cjj025592
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=61wqR+p6AOf
	wOPpxfJOD/8OkOXPQFLfK0xcBfQVi6rk=; b=jkNBMhmG7h1AWI8VcIbt+UjKcSt
	b+9cRwYa3OyNWmLfA4/gYQr0W3S41bUW6D2/EwgUYZ7EJr9oMzaxhv13wU655X4J
	eZLr2i/lnMLwRqiAZypgWJ5hUCvD1qfrw1WXUHsrNUMqnFbqLARUcC2bArBGG/Nd
	ob250C/JNcrJyS+Kr6jO94ZEY50smI3QtJDVLMozKBLU5oV00gVybzYt+2a4HF6j
	6WOYATq/CTQv9/yFY9+kZPR0X8fP53MQd+zngiEiErKUQtmYDmrdkteoKMULWjIa
	VUzrXhS9eQToqK/MYxs72LRTZAVunL9rm01Z3aYjQYh/RypkAl0Lgaa1L9w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w7xya2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:59:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6a33319cb6so3731784a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 19:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761015578; x=1761620378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61wqR+p6AOfwOPpxfJOD/8OkOXPQFLfK0xcBfQVi6rk=;
        b=mDLOloRGYINFRwq1A5zN582y7PWpj5W+WBNO7MRkj/B+8hTpfrIdH5AN3H5wScyZUa
         2691kESKDbCBwgOwbax7XtbWenuBoYgIrKBV3iEyHcYOitOGzVY2q0voPA+73XNGXfnE
         xobC+nHICK++ny13K7pitxRhtcDg74Qjw0YeB6ZnEYkUljH9WF3XZkga3x9VGJzobVnq
         UXBb/CU9xBNjzZZZH9ilaASNIb+tr0djq2TrGofOo98H7Oj8b616/tK6lRfBCLX00cIe
         ZWEXgCvp7utEZnkbIx2RqgfYdbY/8eA76wDKWQ05aYoH8OgvD0407KnDOtsfPaOXZkfO
         8QNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6/9t8bvP5X7nc2T9U6F37iFm8KNtyUFSyNne/ukbRl+cQ7nltyg5xM76d1EKgowPk4AxYwcVELiKzKA6F@vger.kernel.org
X-Gm-Message-State: AOJu0YzOaP27RRiJMGT+3F8cgAvJugyKJZRohppYXOdScjOWchzfNTyl
	C729vf8uOK1DPcOp3XUKY/oKr7/TevsNNAn9VxuznU9e0RYagCtp+pi2sqmcVQQt/iOmQwybUEj
	QZFukMt7tJSic3+vI278dJLbqjMsyJckaJrLNdJyWv7KSwbWjrO1SD7POG4meeBGEj4wj
X-Gm-Gg: ASbGnctrJyaboqdYwZcnBIFWa3c4AJk1sUU5bIdKDJoymA4Cif4LcPf27Ow8e10FVuX
	ylgcUVV7GfHNewE4rf6SBgbd7rlfXXPipGJUVMuxTW8k7nsTV/6CmUBuF2lUlIbb1uWKX5Jouth
	CnzEnsTBHzjg1z7fL4l/4XNXda+/epqKjSfXGbRzHFRIqBVVyp7+NyWftfYM1V8X5fLVVQnxKpP
	tbUMOiUeT8KvOoL2pVduGHJyEjwDKiXaDvCZK3/QyYPqhvbByZhDcGEhG4rjYhtEP4uIk15nQJ0
	YqQXU6OLxJ4RM7U09RkTod4QPKfja5KX/lPvt3BRyz1lQ6yLhmRhkDqSpCMjY7mQReXZX5X51C/
	fdZXvzK9AOM6+J7r3GPxa9XcdZdQXCw7ozAFf7PKerDwnJfnbu0jPIw==
X-Received: by 2002:a05:6a20:9745:b0:2f6:cabe:a7c5 with SMTP id adf61e73a8af0-334a86077fcmr15736798637.34.1761015577856;
        Mon, 20 Oct 2025 19:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiNfzPG3qZGj1HFVjWDlXG/d9MdQ0tchsr8s3lng+hGtxhzM1REOOHFZIDmvzHWszSIh4qwQ==
X-Received: by 2002:a05:6a20:9745:b0:2f6:cabe:a7c5 with SMTP id adf61e73a8af0-334a86077fcmr15736784637.34.1761015577402;
        Mon, 20 Oct 2025 19:59:37 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76673a86sm8855787a12.10.2025.10.20.19.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 19:59:37 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [RESEND RFC PATCH 5/7] qcom-tgu: Add support to configure next action
Date: Mon, 20 Oct 2025 19:59:07 -0700
Message-Id: <20251021025909.3627254-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021025909.3627254-1-songwei.chai@oss.qualcomm.com>
References: <20251021025909.3627254-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX2vLKxMEkV0jN
 sO6gtRUCeHD0oJkOWcHdMIG0fv5CZPX4Ifqnv/2O2CL1uB/3Tccv5JY8c/Cyz7U/KrCsx2n+FjL
 35bNxW8P6LWPnRyMGU3bnz8TysaRN+H8QpE4I6eDGoev3cqUzx7/v5kUua9tWoKnYCsXixfxAht
 /W3IyTtE5D3ZtdzdD/6ox3Kv+1Vt44JdXMGzE0mag/oG3HGeWAqKe9NQe0m0Tyhu8mnX3zdfiYF
 Lt9JyM8Qyw8ZTlUNFc8bB6RMiDMQthvFw+Ydpk+YAVAUkMc6a9QaM3qyO4P9E2oPDLH6ozET1YN
 DKeR6nr7n/12i99wBmQv6qBlp73Fwl9qm/HPpE66Ljoq7onVXAAWlhLGi7AxPRC5PKMlr//aHSX
 obTbUx3C2X2GKo+MKPYNNydwYhFPDA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f6f71b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=xi9iTe-FYOb_EUe3slkA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: SEyE8hBl2ZDB9K1fmFdD54KJ27SjpGo7
X-Proofpoint-ORIG-GUID: SEyE8hBl2ZDB9K1fmFdD54KJ27SjpGo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 +++
 drivers/hwtracing/qcom/tgu.c                  | 52 +++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
 3 files changed, 86 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 5034df7d52a4..ea05b1b3301d 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion	6.18
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		October 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 70675e19176b..ccb1144e7562 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -36,6 +36,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 		ret = step_index * (drvdata->max_condition_decode) +
 			reg_index;
 		break;
+	case TGU_CONDITION_SELECT:
+		ret = step_index * (drvdata->max_condition_select) +
+			reg_index;
+		break;
 	default:
 		break;
 	}
@@ -81,6 +85,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				  drvdata->value_table->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->condition_select[index]);
 	default:
 		break;
 	}
@@ -122,6 +129,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->value_table->condition_decode[index] = val;
 		ret = size;
 		break;
+	case TGU_CONDITION_SELECT:
+		tgu_drvdata->value_table->condition_select[index] = val;
+		ret = size;
+		break;
 	default:
 		break;
 	}
@@ -155,6 +166,15 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 				drvdata->max_condition_decode) ?
 				attr->mode : 0;
 			break;
+		case TGU_CONDITION_SELECT:
+		/* 'default' register is at the end of 'select' region */
+			if (tgu_attr->reg_num ==
+			    drvdata->max_condition_select - 1)
+				attr->name = "default";
+			ret = (tgu_attr->reg_num <
+				drvdata->max_condition_select) ?
+				attr->mode : 0;
+			break;
 		default:
 			break;
 		}
@@ -193,6 +213,19 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_DECODE_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_select; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->condition_select[index],
+				drvdata->base + CONDITION_SELECT_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -231,6 +264,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
 	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
+	/* select region has an additional 'default' register */
+	drvdata->max_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
 static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
@@ -375,6 +410,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -436,6 +479,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 3974d8e6ab04..ced10b3daaa2 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -46,6 +46,7 @@
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
+#define CONDITION_SELECT_OFFSET 0x0060
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -57,6 +58,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -72,6 +76,9 @@
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -102,6 +109,15 @@
 	 NULL		    \
 	}
 
+#define STEP_SELECT_LIST(n) \
+	{STEP_SELECT(n, 0), \
+	 STEP_SELECT(n, 1), \
+	 STEP_SELECT(n, 2), \
+	 STEP_SELECT(n, 3), \
+	 STEP_SELECT(n, 4), \
+	 NULL		    \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -116,12 +132,20 @@
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
@@ -137,6 +161,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 /**
@@ -150,6 +175,7 @@ struct value_table {
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
  * @max_condition_decode: Maximum number of condition_decode
+ * @max_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -166,6 +192,7 @@ struct tgu_drvdata {
 	int max_reg;
 	int max_step;
 	int max_condition_decode;
+	int max_condition_select;
 };
 
 #endif


