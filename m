Return-Path: <linux-arm-msm+bounces-84177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 096F0C9E619
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3D16D34A5C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74642DC328;
	Wed,  3 Dec 2025 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMXM5Smx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdPNbmBP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A77F2DAFAF
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752514; cv=none; b=P6M8ua8Vl1Yn0c5M/6lENVMgBUZTr8AtH6PCEi/bz5KTVSAt6f6teFbmJJQpD28NDtzg7ksbunD1NY8khEwV8rFlYNt5H/24YN3Y8IJrnMIrIz67kgHq/JMvri6qVQxuF2iIsNYoFuC9sdEIvIXVo4TAz3asdX9+bEf/jbrwmH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752514; c=relaxed/simple;
	bh=XKoihAZvNtpRvWq+OS9VakW0XXxiix/5r98xBkm3Fs4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=peSCh354ImOc02r8OjCgNteiT4+DX9E+yjYjHGMYO7rw77X6UfD9F3lNdghAeyfa5RqF+c9ridOYstfonIK/tpQawxL3o6DAkP+EKytixsoRxfHXbBRdjJAC5awUoqhlST9TPGCUr6DJTIcFxnn/ZjpjjXC34bFfKB2Jq70LDb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMXM5Smx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdPNbmBP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B31WYtI807318
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 09:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9bIRhKus1dF
	qwZ3vvpi/ou3+lJE0pioMrLFSKPQXZx0=; b=MMXM5Smxcm/n9f68yAUYfIhSzNt
	SMJdCF7089xPtMYkvhX37jr95+Z/qr0BS+/gKhxRDPSDSQvW6f5EinV5ZxHxL/ww
	L34TxRboVJwHUCNUCCnZ3F0K/wB2/d6+AU+WXTNkT0Li2BjEsQ/UC8qYYVCqaInx
	+chQL3fXKhbKZaoW2Ert13oPi92NSWqdO7S60mCYXynQselTb8tkgQVRZagLtcvP
	CJGrWkdmP50jHK1BBjNCCZs0dc6CFzpBbL+43nuchrRmYFMLdaASbmTFX1dkgo2c
	Wqp6S7eiQqnDZ0x6RToDLt6+6Q1/mfcjI9KFbgxnmy5YrEK3nzkRkZUz7Bg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atbmmh8g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 09:01:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9ceccbd7e8so11209060a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 01:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764752511; x=1765357311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bIRhKus1dFqwZ3vvpi/ou3+lJE0pioMrLFSKPQXZx0=;
        b=OdPNbmBPyfSHMvE8flu0SHda6hf54Yc3YGorrhUJtMKnfyDL58eElzbW5AMRPITNqX
         cR3VFAnSBasqA3CCqiNEZeYfAxfv2Vbwkqp5T80Krdkmc/6XP66er7E8eep9wrOpH7RP
         W4tgUCwtxB13m2l26OQdKKWgHnqy27mOVxjtIyDajZsekZpAg7S1v2ZfMPENCAGol6RR
         uolo+ES38gDr95+1a53vKqYeJ/1yVVudbcPwd7dtPOxfGu4IUsAe7v4dUZncx2/RbuBy
         tEn0PM+B+G52TMHxlJY+lfOtTsZOmfPGpH8aUg9W3j+Jjpf5OjCP4ChOvozAZcSo+yC8
         eb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752511; x=1765357311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9bIRhKus1dFqwZ3vvpi/ou3+lJE0pioMrLFSKPQXZx0=;
        b=fAFFYeUvyuha51H3AuwShPc0CTsRjkSIIt6JQnAlYJalo4NGpdTi8Ikjw7IXKbtAM1
         +Cay2Xir6do5iZ9pI8RJC6xBOicpSr9DcpGgm/uj5S6ZXq6/HgQQJmV0O8mN8fmDszC5
         cth3JX3zA6HW499a70NyjGzHR7tI8xmSfZSYKa9HTXZX5mAnJp9Hj+GOgwzAegRpKzHj
         ao9S7DZEhnOarTTQHDh4XglCOm43WBy/oSTSxDbgtWysJ1fiSNWKmBzePxNRzOBaN0zg
         XoESLJyEu3FU84I3WVXVkFieqEIIzI0FARmlNzaUT49A0ZcIYUMAnWVCRBn2SljGOJlX
         howA==
X-Forwarded-Encrypted: i=1; AJvYcCVwLDp57rrmGPuWSVDOpcMRivKqJi/ePJu8zS8kR7tWrD5ahUl/sQXwzMLNkoqWOj+BSJDzGFVyMfJr73f4@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYY14KOgNO1I1G5OljXjdMBH2Q+aVQHK+Y+JOMo0bIa5Bshe8
	XDYSUFCYTo1/wa+TS0tqmMw44fKM9kopsGN2w93XhePC/WF4ntPSPjVGKrfuUd1e03iyygRAFkr
	Qnmnio+7z05jNg7hXVUa8ZZkSDJQd95DvIp56nw7VqVjgNEdUTnxKD/Rot2o5r1EuWexT
X-Gm-Gg: ASbGncvn6wr5cVVHUnseE7f/vh4/97HGVAZI3MJDwrzalLyMcWSumQaxS0oFQ/bC6He
	3uJhWwNylFGIG1XGbW0TTpBCcxFQT/jk76Z7uHq0l4RsqcO2eCFpO0vymc1ZiRn14l5EqcCcq0U
	GadflnuGOseKf381cYEOln6IwczkKQCYmSbSQP1hQVj/TT26Z/aVDo+3Kc4PdWjtSP5hIOqmRqG
	Ndj2Dy4fvNgZGWgYI93IFSBkyUwOyQzhLmtQav9pxt0YlDm+zXl/1gvl7igJgcqsisISSAwpeWS
	my4sBrjI9DOw4S9zU0aqZxzTIY3s9NySTIAIg5Q7iKa9jxi6JRgXFKAuwl8oFpMlSft79WmjxK/
	9+ofdRqJzEL2q8r5UsPTT46/WgJUBl8cDTNBDg9jZrMFYJZ0Fr74pSJbOhbDYfkdX
X-Received: by 2002:a05:7300:d517:b0:2a4:3593:9698 with SMTP id 5a478bee46e88-2ab92e0993bmr1217371eec.21.1764752510608;
        Wed, 03 Dec 2025 01:01:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8/OkhOr7ph/dfYHXJKP3LjJC7/e6GI5WyVvyFFjgYdffuKOOYpUCd2+MMzoNGnrgWJypi9Q==
X-Received: by 2002:a05:7300:d517:b0:2a4:3593:9698 with SMTP id 5a478bee46e88-2ab92e0993bmr1217330eec.21.1764752509957;
        Wed, 03 Dec 2025 01:01:49 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm100001866c88.9.2025.12.03.01.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:01:49 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v8 5/7] qcom-tgu: Add support to configure next action
Date: Wed,  3 Dec 2025 01:00:53 -0800
Message-Id: <20251203090055.2432719-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9GLNdD1kw_x0N5HmxOhiTUOmkEoaPKQR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MCBTYWx0ZWRfXx06aiZW5FPdF
 lNkTD0AHJW4+6cv7W3N0HCfsuSxsqQNhznc5y+3zZCTyNYiqgUguEVL+ZNQ67cl+7ZJMfVJL47l
 5+X4fKhcCtTEDopeQKC/etKuByt5zEdBRq4R2mukK22n9KFZHelMU441+KwTBygLTd1NzwfLNT4
 eDaiRmGbBj3eMu7zQXcdUglDBJ+Kyi9Fk6kBhHJ7fvfwiQyEWHqG9sakSNjLvwhyLnJgTPt/bje
 XZjz+vYdXsfmqUVRb+LVxGDixGiSe58a9iUxZMNI1mu6OD8xL7Gq2zmxlHGIDWXcM99QrzJdGF5
 rDxvY5NGzVHY5PJL+UzFaDyjgZNKYmahQFPeHQyYQt1c7aKwt0chUQJnOpzccfuZge8v4Z630wg
 AGkhUXMZcBm5X/hhIp1uhmGEeKBJ9A==
X-Proofpoint-ORIG-GUID: 9GLNdD1kw_x0N5HmxOhiTUOmkEoaPKQR
X-Authority-Analysis: v=2.4 cv=ApjjHe9P c=1 sm=1 tr=0 ts=692ffc7f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xi9iTe-FYOb_EUe3slkA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030070

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 +++
 drivers/hwtracing/qcom/tgu.c                  | 52 +++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
 3 files changed, 86 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index df73a9d5043e..a0d5e2eb141b 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion	6.18
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		December 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index b4ff41cf0a11..98721891251a 100644
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
index cac5efeee1e9..5056ec81fdae 100644
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
-- 
2.34.1


