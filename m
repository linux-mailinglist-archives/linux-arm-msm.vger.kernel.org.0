Return-Path: <linux-arm-msm+bounces-84176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D02C9E616
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 54D3F348F30
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2572DCC13;
	Wed,  3 Dec 2025 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kqm9mjQq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOKbEYK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1352DC789
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752512; cv=none; b=dZY+bvFb02hjbsL97ZOuiwQbNYEQQgME90WegjHmX17Aw8BwCDVjmk7W561SRBKXsANu+Uu0orkc+a0tYjivHfitVps/5/T/2LaLeTFdEw26cK5TmS+0CTRPvDnPnK0YjRVyC3TwzbZ6eBf+81eIf3D9kjq5DmUQu11Vg5JR7c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752512; c=relaxed/simple;
	bh=Z90iT31gx2TdhPShR6J+FUYSiuTz8w9sVulPmvlv/kw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NT4XD6FuArxDFNwBKSAPVEvuU9v6zD6v5w+c++VZg15XSKlqc0uc4CeJlUO6DzNrxjk/yoenafQzilY0Nd83CKRc1A7kqZmRpRGo2jIKjT95C8bZ6z1yEAcQlt4f1wMzPV4jnCx2PccgBNa+ouj4x28RZQruvzbTaaRlNC8ABZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kqm9mjQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOKbEYK5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34iCco4130687
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 09:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HeqvFSmO/X5
	NfVnoW+j+jvl+LvG9c0Flpsq25vj+uJM=; b=Kqm9mjQqmAAWdQWir7f1A25P0CY
	/6lxOs75yOFYasUcJ7mLcuScNj4DQIV1rb/twGwXOn0gy4y87BVtP2MjYFZp/tkZ
	v6mY3+fUSQ9XUlRcyMqacV3HEKNF7fGb95CGabA57EsIB5ZHOg1j70F4uP1GniC6
	XUDsPGJBiFc39hgvhK5aVhyiNGXL/uExdjNN8lwyvoHcgTsXANX1PkBAIGZOjgIo
	sf2azAJ+nj+XDkbPfIurTWcSEjTFUqbePk+sxZy3Y0hNL8OlR0Tyxyoor4syCzlh
	jzqsXTJ2nllyVkClrYlh+mWZlt548hDPkZCCPmXuyijCgW+NWGaGAJIIpyA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5e7a94x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 09:01:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7d481452732so6930964b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 01:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764752508; x=1765357308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeqvFSmO/X5NfVnoW+j+jvl+LvG9c0Flpsq25vj+uJM=;
        b=MOKbEYK51gdLTZUD0UPh1Q3EuFM3jFstZSwkKdFzDtSVt7+1qoarADCMLPUQFRRXeM
         4ynfAxqafSzNbut9XKj9E88EDRLRv8vNWzpnl29+qZ8ss7+iS6fXm96OvbCVPmkKl+8/
         /UZ/bShiYv8B3zI+K2xt3KRvW1lj5DRy9qf16APLJOLmk+2eGI5IFV1Is22a0S2XtaMt
         WeJ6xU+pUyJ9td92j7hDnqSyPrshQRgRmGSEdQP7M0ZJF/MNMTN7v2WcblECMRwbFJTV
         +kCYn3IEEwMn3+u8b38qswjdj2oKWhwUchInjgpD6DSijZvG8kd9BHPtky6ast9QYOYO
         0MQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752508; x=1765357308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HeqvFSmO/X5NfVnoW+j+jvl+LvG9c0Flpsq25vj+uJM=;
        b=AF4L83x7nU0cLtYXnyhuyD84FITC9q3gnT33Yf87wBojKgcwhJuIsIbNU4c+r/ZCEH
         h0pRLt7kIsy49CCYikMSo6G7duAMBIYr72ux2TB6Rdez1gnHRP+ss8iQcZ3z+NZvgiZ1
         96y+S5gjSW36NmyHkv/SsbR/u07E2i/49w7DEg6UUDb06G+IoiT1jpl4DjwWHMGJKt7t
         faEtmuEP1WjlPP82fWvvOQOXp4wNTYsSJy6NqZGP0Ue09f7/c1bh56143WA7b/+Ty9NA
         V5L5avUVjbYnfhzaa2FJ0rhXA+52cbCZd50upg0/ZMyrOFnDZBawQvj0/hzX1HD0a8Bz
         msYw==
X-Forwarded-Encrypted: i=1; AJvYcCUVuPFK+lM5c0rbIWjEmdS8J6AQ7I350+PWe/GgzeQOwG/DFQz1/8PbFa0xLfYdlDToVdyqM/rx+AvoUGW3@vger.kernel.org
X-Gm-Message-State: AOJu0YwTMR26SvmBEewihrmhIsEoe4DOwUUQcalU2W3ds5uqWbJRP094
	JfmRkP4NC0WNoKNNV4pAG5A+h+T6peRVnKgleEl/x2ap/THiYF2MdYWeRz5zdLZ8pKbcGfSoBXD
	iWiSMF3ydO5bybiUl/f1a9KvGDVtwRRs+28Q0VLsoV4zpqjuPYOud3HQWfWHWEOO8SAlc
X-Gm-Gg: ASbGncuRPC/o+bVdoOrT8dJtK6RIwGRZAAcpQiP8nNwZgnEmRJWOS/mR5h24OqElJkT
	/bzqUItc7wY1W5CcBRfU/M6zLUUmFxvG2OfQzhTAPZN+e5lWwVX0AfT4v8FSgZ+9+S5Bxn35C2j
	LsjfYGHIySRXnk0Fw/EbK8e0aw2r4uPrZjn0+/jJ6qZXVZIXzBcyF/vG0Ni9mT2BfeKXLWkLsue
	NEJZX9m97pp2/k7PexM0Do2tJ+KhsffZouA9WJrmtisTTYbfKV/yCYH3hq/n3BIorl1pCEjA3Sq
	yef1+oOMxaE76vUrKkEIy1PCK7PCse3mEBXb7RiL3py5dANWxFGpc/ZX0RdSrOixm9QnOPsGVUs
	8A4i7ChSiOWLGFmeul0pqiDG3PZDKDkopdNkHbBsDHNDPMbfyWd/3ipibaxblPHoj
X-Received: by 2002:a05:7022:2594:b0:11a:26dc:eb61 with SMTP id a92af1059eb24-11df0bd1607mr1425383c88.7.1764752508378;
        Wed, 03 Dec 2025 01:01:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFypXEuJz7No3/j7ICVa2eD+6Rpgcb47Oq7j1Ii9KUfoZ+Bk3aepHX6cHoDOUML9Ec3RbqfAA==
X-Received: by 2002:a05:7022:2594:b0:11a:26dc:eb61 with SMTP id a92af1059eb24-11df0bd1607mr1425364c88.7.1764752507750;
        Wed, 03 Dec 2025 01:01:47 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm100001866c88.9.2025.12.03.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:01:45 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v8 4/7] qcom-tgu: Add TGU decode support
Date: Wed,  3 Dec 2025 01:00:52 -0800
Message-Id: <20251203090055.2432719-5-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MCBTYWx0ZWRfX4odp9Iw5XPF/
 G5iNpW76da2Ku4Cc4ukcKGKwOzo2JUVd7RgkFgQuuml7aPZugNJP8Rv/zl/dq/dxm534LvriMTV
 J9tfwUyhdyp+mfPVJ3s5OjFusr3LOM2CAFFp/LJjGsXf0XAuZ6XQqh31l7cEnzTpuqq61oqSCP7
 0sUyaKabND7u2ReixXjoFa/6iPYGGn/fmfJiKgIxklejFyL3pvhTjHwLMbkwunebR+dhjtFkuAc
 Nxx1HTxGxKkvtbHVGATlwvrE2HyLl5aqtBjAG0JOcGCRkbQXKnRK+eXH50Fu4u0BtyJDTqJ75eY
 SF972rKtwY8CHaPQ5EWTYpKG14I9BH9Hwk8dtFUBRDCZYDKMCjH5qND8KNggSp0mDrpuo/QQV9y
 RUF0heaCnARPiwuW0pL1euL5qq4Usw==
X-Authority-Analysis: v=2.4 cv=KcrfcAYD c=1 sm=1 tr=0 ts=692ffc7d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DXd_79bSlwW_W-LZS_AA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: oRJBvZvyt9Li5rPzoqxg_Bhl5AwKuU-q
X-Proofpoint-ORIG-GUID: oRJBvZvyt9Li5rPzoqxg_Bhl5AwKuU-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030070

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
steps.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 153 ++++++++++++++++--
 drivers/hwtracing/qcom/tgu.h                  |  27 ++++
 3 files changed, 173 insertions(+), 14 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index eafb0e0dd030..df73a9d5043e 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion	6.18
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		December 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index a1ad8d97e9d2..b4ff41cf0a11 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -21,8 +21,36 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 				   int step_index, int operation_index,
 				   int reg_index)
 {
-	return operation_index * (drvdata->max_step) * (drvdata->max_reg) +
-		step_index * (drvdata->max_reg) + reg_index;
+	int ret = -EINVAL;
+
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		ret = operation_index * (drvdata->max_step) *
+			(drvdata->max_reg) +
+			step_index * (drvdata->max_reg) + reg_index;
+		break;
+	case TGU_CONDITION_DECODE:
+		ret = step_index * (drvdata->max_condition_decode) +
+			reg_index;
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+
+static int check_array_location(struct tgu_drvdata *drvdata, int step,
+				int ops, int reg)
+{
+	int result = calculate_array_location(drvdata, step, ops, reg);
+
+	if (result == -EINVAL)
+		dev_err(&drvdata->csdev->dev, "%s - Fail\n", __func__);
+
+	return result;
 }
 
 static ssize_t tgu_dataset_show(struct device *dev,
@@ -37,8 +65,26 @@ static ssize_t tgu_dataset_show(struct device *dev,
 					 tgu_attr->operation_index,
 					 tgu_attr->reg_num);
 
-	return sysfs_emit(buf, "0x%x\n",
-			  drvdata->value_table->priority[index]);
+	index = check_array_location(drvdata, tgu_attr->step_index,
+			     tgu_attr->operation_index, tgu_attr->reg_num);
+
+	if (index == -EINVAL)
+		return -EINVAL;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->priority[index]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->condition_decode[index]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -46,6 +92,7 @@ static ssize_t tgu_dataset_store(struct device *dev,
 				 const char *buf, size_t size)
 {
 	int index;
+	int ret = -EINVAL;
 	unsigned long val;
 
 	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev->parent);
@@ -53,15 +100,32 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		container_of(attr, struct tgu_attribute, attr);
 
 	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
+		return ret;
 
 	guard(spinlock)(&tgu_drvdata->lock);
-	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+	index = check_array_location(tgu_drvdata, tgu_attr->step_index,
 					 tgu_attr->operation_index,
 					 tgu_attr->reg_num);
 
-	tgu_drvdata->value_table->priority[index] = val;
-	return size;
+	if (index == -EINVAL)
+		return ret;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->value_table->priority[index] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->value_table->condition_decode[index] = val;
+		ret = size;
+		break;
+	default:
+		break;
+	}
+	return ret;
 }
 
 static umode_t tgu_node_visible(struct kobject *kobject,
@@ -78,13 +142,27 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		container_of(dev_attr, struct tgu_attribute, attr);
 
 	if (tgu_attr->step_index < drvdata->max_step) {
-		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
-			attr->mode : 0;
+		switch (tgu_attr->operation_index) {
+		case TGU_PRIORITY0:
+		case TGU_PRIORITY1:
+		case TGU_PRIORITY2:
+		case TGU_PRIORITY3:
+			ret = (tgu_attr->reg_num < drvdata->max_reg) ?
+				attr->mode : 0;
+			break;
+		case TGU_CONDITION_DECODE:
+			ret = (tgu_attr->reg_num <
+				drvdata->max_condition_decode) ?
+				attr->mode : 0;
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
 	int i, j, k, index;
 
@@ -92,8 +170,10 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 	for (i = 0; i < drvdata->max_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->max_reg; k++) {
-				index = calculate_array_location(
+				index = check_array_location(
 							drvdata, i, j, k);
+				if (index == -EINVAL)
+					goto exit;
 
 				writel(drvdata->value_table->priority[index],
 					drvdata->base +
@@ -101,9 +181,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 			}
 		}
 	}
+
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_DECODE, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->condition_decode[index],
+				drvdata->base + CONDITION_DECODE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
+exit:
 	CS_LOCK(drvdata->base);
+	return index >= 0 ? 0 : -EINVAL;
 }
 
 static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
@@ -131,19 +225,32 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
 	drvdata->max_step = TGU_DEVID_STEPS(devid);
 }
 
+static void tgu_set_conditions(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + CORESIGHT_DEVID);
+	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
+}
+
 static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		      void *data)
 {
+	int ret = 0;
 	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
 	guard(spinlock)(&drvdata->lock);
 	if (drvdata->enable)
 		return -EBUSY;
 
-	tgu_write_all_hw_regs(drvdata);
+	ret = tgu_write_all_hw_regs(drvdata);
+
+	if (ret == -EINVAL)
+		goto exit;
 	drvdata->enable = true;
 
-	return 0;
+exit:
+	return ret;
 }
 
 static int tgu_disable(struct coresight_device *csdev, void *data)
@@ -260,6 +367,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -296,6 +411,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
+	tgu_set_conditions(drvdata);
 
 	drvdata->value_table =
 		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
@@ -311,6 +427,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 444804e52337..cac5efeee1e9 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -11,6 +11,7 @@
 
 #define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
 #define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
+#define TGU_DEVID_CONDITIONS(devid_val) ((int)BMVAL(devid_val, 0, 2))
 #define NUMBER_BITS_EACH_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -44,6 +45,7 @@
  */
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
+#define CONDITION_DECODE_OFFSET 0x0050
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -52,6 +54,9 @@
 	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
 	 REG_OFFSET * reg + STEP_OFFSET * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -64,6 +69,9 @@
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
 			reg_num)
 
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -86,6 +94,14 @@
 	 NULL                   \
 	}
 
+#define STEP_DECODE_LIST(n) \
+	{STEP_DECODE(n, 0), \
+	 STEP_DECODE(n, 1), \
+	 STEP_DECODE(n, 2), \
+	 STEP_DECODE(n, 3), \
+	 NULL		    \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -93,11 +109,19 @@
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
 	TGU_PRIORITY3,
+	TGU_CONDITION_DECODE,
 };
 
 /* Maximum priority that TGU supports */
@@ -112,6 +136,7 @@ struct tgu_attribute {
 
 struct value_table {
 	unsigned int *priority;
+	unsigned int *condition_decode;
 };
 
 /**
@@ -124,6 +149,7 @@ struct value_table {
  * @value_table: Store given value based on relevant parameters.
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
+ * @max_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -139,6 +165,7 @@ struct tgu_drvdata {
 	struct value_table *value_table;
 	int max_reg;
 	int max_step;
+	int max_condition_decode;
 };
 
 #endif
-- 
2.34.1


