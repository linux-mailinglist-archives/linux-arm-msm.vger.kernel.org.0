Return-Path: <linux-arm-msm+bounces-94201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEbJDyqrn2m1dAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:08:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D761A0070
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6343230EE91E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 02:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA40376462;
	Thu, 26 Feb 2026 02:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVRY3XDS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYcZCQmq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C48374753
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772071532; cv=none; b=MhRIAeWjkGMC+VlbTM1vAk3jvZtIftJJqa0jhWzBmWmi3X3JeFMm/Dq5WF1UgKw1Imt1Eix3jX9nl/YAcXx7HYNMMlVmdF5AgEKqUy8PeJeGpCBsforAV1C0FL/HFYqlHxNYbH9fA0XtOi72PtsOoFKxYgt74KnZhtmJ0EfCO2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772071532; c=relaxed/simple;
	bh=gdiD7a4l3pq2HL8jRDC5CBSc8QG43CESkPzWmdctknQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dbij2ZvEs6mLbnx5eHDmJuzwcG4CY36cw+enF0ld2jtACHPhvq58uUVArbeTVe/UYxALty+uYBxrT5I6LGbiu8x2K294I4Ak6dznrMR9u1YCTjJDJMI0+Y/H3AokWhELs9q03XYiHPOCl0ZN1n8XqgFZdpX1RUtiRMXmDyqWOec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVRY3XDS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYcZCQmq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PN3cgs3095267
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bQq0lAUlGrO
	11icn77YtT7QP0MohK01/PRDre5JKNm0=; b=lVRY3XDS/39DEJqSoNqoXpIxCYB
	qOnGOZxzHszmpuZQ5hvqYMmuu9JzCAZ0/6RdbbLquR7ZVNlnFYJjMrFXMoJdKG+y
	nQA+VNTQfi6lpFVneVlzCJ7UGPfdX72mHsto4ZS/y6hKlPJRVoRH2Hn/1afivAXo
	jn6AOTMYR7L2ABw54VtnHktTKktyOe2vuhbrJwsoZdjFM3fa4XiJFqWwLfqWDyjT
	tqPG3sepb5HyO9CujkKiVGx2tEqJBQqV9Cce6W4m+3MgV7+XumAv3cnqoeGiN5xn
	qVOVflZoA0xUCWaivubC8ujjsogFNoPjDW/tg0dE2EdrAJQhqL9MCfriAXQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0rdby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:29 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-66308f16ea1so3231302eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 18:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772071529; x=1772676329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQq0lAUlGrO11icn77YtT7QP0MohK01/PRDre5JKNm0=;
        b=cYcZCQmq2HEjkJjytdoOJEgWtNHUy2pxuAechHqRE8t5ZspykPO3ATnudUDHMuZ/QD
         CftzD/9/GQMRP66fI2GO05mZtWc1jtup1dEUApQ4QSbWJY+wNK4mXEShqjhWPgsBHjS9
         mge80y9+TuPoR3+HJNHu3W8u+zfzmpeQWQTMiu6M5Q5oBk/XRprYWNx4oMmEpUqQRmo6
         ydUYgJCMykhLim8SfnclEU4TidKyuUvM95u3TNQdZ/DjFsMFGm4AN7f9Kl5Jg0fN0qtM
         Ff2zxnQcHSjZIPCMc99kGqWdcQJXh9Ucil9VNwtMQjAXzeQboAIU0CqOvotG5TCt2S8f
         2NZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772071529; x=1772676329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bQq0lAUlGrO11icn77YtT7QP0MohK01/PRDre5JKNm0=;
        b=gyqrcy6HgmEkArPK9GlFZwEQj9BnL3qDs+GmuSfE94u02Ll2b0wzYdWpsRT2waAMdi
         Uj8I/3iAlIe5ol1qGRuykTWDQyFg2NbrK/K/wC7rkrMr7fOfUpT6EnANeyxw0DDpUiuy
         BJ3HATjBZEU8tWVXXHZt6+LuBWxMXLb6me4IRfKb77zDFV8JY2Bxq/Sc1670f9leoEab
         jcam/2mCWYFNK/t6gsqZUOIZINu8hKLpGuJ2wguIfj7CpN1PLIlYU8UriNnujnX1ole8
         BqjXV5iNLShx6bNycGmjz2SHdw6dpeOF7NCMYc4XlNGDyP5J1okWm9lDS/UcEYnwYi/L
         pDBw==
X-Forwarded-Encrypted: i=1; AJvYcCUoUVbWIOax9k8ziSP03vwiOoxIo5O1FDBoHl7e9XXjOqpqosOTFMJ8TWSX6C3xQBGIKv/F4tAntcSmJ3l1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrw9J+w/tWQ+SXNy3zxyuwwXfHJ8SStHQauQypwH/5NnPyARog
	nJmjGeDriJnEd0OH7ppklDlqjdcQZhXYy3WNQAENRgWwbcoANXk0uO+SSkZ5gf6PAbY+/epkzv5
	lLN6D2D11+gqCLxYPSR7waQSrAAedxirs7xRMm+Nw8ioKnJZzKoJhudx0ZfV9qkcux9Bz
X-Gm-Gg: ATEYQzyZO3vr/m20rVwki8lOZzdRm0daaUvK20qgxRhUMT/cFWq+pPQ3CKNWWO2ZCuU
	zgccc4q0dQP7USR9kZk/llUZlW98eG97/vklf/ckt27bUfEVkvEBuqmgemuhjqDEiMJAsM4h0sR
	3vap1emSPohmmsllhJKpzLdb2hI0fE3L7uoJn64tZ82OFsoxr6jdXl2GcBxDBLbqLdCnSKXQF4z
	NeQphsTrQi+x9zwnL3bprROtb2NCQcAgV3tmltKvrG3GAAXjEOe2+5efK3kDFumuVCxGUN87uyv
	LwAeBj4ASurBgzHq0evmlhGEVB7PQjRtmq3F2FJPhzOGMhi7IHbAXXHfR5rleAFUiDnBSc0ZrUm
	kIqGrt2f9TpMt5bABQ2fK7IcccO942i/10Bdkshh8BrJiv4S4OxKyI7n0zbaxUdiPqquR86kkW3
	zJ
X-Received: by 2002:a05:6820:6ac1:b0:663:3ad:4c27 with SMTP id 006d021491bc7-679f3d700e8mr270639eaf.42.1772071528546;
        Wed, 25 Feb 2026 18:05:28 -0800 (PST)
X-Received: by 2002:a05:6820:6ac1:b0:663:3ad:4c27 with SMTP id 006d021491bc7-679f3d700e8mr270622eaf.42.1772071528097;
        Wed, 25 Feb 2026 18:05:28 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d9e8d6sm549939eaf.13.2026.02.25.18.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:05:27 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v11 6/7] qcom-tgu: Add timer/counter functionality for TGU
Date: Wed, 25 Feb 2026 18:04:53 -0800
Message-Id: <20260226020454.3210149-7-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNiBTYWx0ZWRfX50NUiVt41+XL
 WbBOc1lRQY6iW/JP4fsspSKxkswdBxBeIHW4Y0z5lj+CiTp+AoKthX0sHThn/lX0w8BLlVZ0kGx
 BrpJV6KOmlflF0M47cK1ZRX1L1LOwBPS5a9pVmUNR/drEKilziHfS40ajmD55JVnUeQA6eTYdkZ
 fbqdGjqeyqvWKLeWSZ3bR2T5mVFNf1PBMklhZXx1WKwDx2vjIw0XzWv4GvutMaNzM7XcIesLmL3
 IZ2tNry6PtkWEdyJuX4lClMbMRDeLwyCPoGvLYQYZZD8AE44FPZziV/fKUYclvR7rWSCkCu7sT+
 jvPcVI6+YEhmO1Ezz1eJ+UufTZCmFfQVf/OYrj5ylBY+4Bz8cms0Q2yAxs0eVEUI87O1IDHbpIv
 iSW/3JAYDulkXKeVpSjf5L5b0alUoDO/ySRBcje2MQgj5vs8pJWir+ePX72SZivdNYy44gLMdUG
 UBwZEbdACjXyRvc6lyA==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=699faa69 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=eGDQztGCVwpQsGOtWZEA:9 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: i929MQb1dMrL4JT5tUZApH83BZqRo7Cy
X-Proofpoint-GUID: i929MQb1dMrL4JT5tUZApH83BZqRo7Cy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260016
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94201-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93D761A0070
X-Rspamd-Action: no action

Add counter and timer node for each step which could be
programed if they are to be utilized in trigger event/sequence.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 +++
 drivers/hwtracing/qcom/tgu.c                  | 116 +++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  |  54 ++++++++
 3 files changed, 182 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index fbe8efe470d1..9daacd68eed0 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -28,3 +28,17 @@ KernelVersion	6.20
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the next action with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		February 2026
+KernelVersion	6.20
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		February 2026
+KernelVersion	6.20
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 1d996b9e303a..4539415571f6 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -32,6 +32,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 	case TGU_CONDITION_SELECT:
 		return step_index * (drvdata->num_condition_select) +
 			reg_index;
+	case TGU_COUNTER:
+		return step_index * (drvdata->num_counter) + reg_index;
+	case TGU_TIMER:
+		return step_index * (drvdata->num_timer) + reg_index;
 	default:
 		break;
 	}
@@ -77,6 +81,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_SELECT:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->value_table->condition_select[index]);
+	case TGU_TIMER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->timer[index]);
+	case TGU_COUNTER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->counter[index]);
 	default:
 		break;
 	}
@@ -122,6 +132,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->value_table->condition_select[index] = val;
 		ret = size;
 		break;
+	case TGU_TIMER:
+		tgu_drvdata->value_table->timer[index] = val;
+		ret = size;
+		break;
+	case TGU_COUNTER:
+		tgu_drvdata->value_table->counter[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -163,6 +181,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_select)
 			return attr->mode;
 		break;
+	case TGU_COUNTER:
+		if (!drvdata->num_counter)
+			break;
+		if (tgu_attr->reg_num < drvdata->num_counter)
+			return attr->mode;
+		break;
+	case TGU_TIMER:
+		if (!drvdata->num_timer)
+			break;
+		if (tgu_attr->reg_num < drvdata->num_timer)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -213,6 +243,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_SELECT_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_timer; j++) {
+			index = check_array_location(drvdata, i, TGU_TIMER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->timer[index],
+				drvdata->base + TIMER_COMPARE_STEP(i, j));
+		}
+	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_counter; j++) {
+			index = check_array_location(drvdata, i, TGU_COUNTER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->counter[index],
+				drvdata->base + COUNTER_COMPARE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -256,6 +310,27 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
+static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
+{
+	int num_timers = 0, num_counters = 0;
+	u32 devid2;
+
+	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
+
+	if (TGU_DEVID2_TIMER0(devid2))
+		num_timers++;
+	if (TGU_DEVID2_TIMER1(devid2))
+		num_timers++;
+
+	if (TGU_DEVID2_COUNTER0(devid2))
+		num_counters++;
+	if (TGU_DEVID2_COUNTER1(devid2))
+		num_counters++;
+
+	drvdata->num_timer = num_timers;
+	drvdata->num_counter = num_counters;
+}
+
 static int tgu_enable(struct device *dev)
 {
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
@@ -395,6 +470,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -402,8 +493,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority, *condition, *select;
-	size_t priority_size, condition_size, select_size;
+	unsigned int *priority, *condition, *select, *timer, *counter;
+	size_t priority_size, condition_size, select_size, timer_size, counter_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -422,6 +513,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
 	tgu_set_conditions(drvdata);
+	tgu_set_timer_counter(drvdata);
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
@@ -464,6 +556,26 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->condition_select = select;
 
+	timer_size = drvdata->num_step * drvdata->num_timer;
+
+	timer = devm_kcalloc(dev, timer_size,
+			    sizeof(*(drvdata->value_table->timer)),
+			    GFP_KERNEL);
+	if (!timer)
+		return -ENOMEM;
+
+	drvdata->value_table->timer = timer;
+
+	counter_size = drvdata->num_step * drvdata->num_counter;
+
+	counter = devm_kcalloc(dev, counter_size,
+			      sizeof(*(drvdata->value_table->counter)),
+			      GFP_KERNEL);
+	if (!counter)
+		return -ENOMEM;
+
+	drvdata->value_table->counter = counter;
+
 	drvdata->enabled = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 5beaf82b4b8c..6ea71963e672 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -11,6 +11,7 @@
 #define TGU_LAR		0xfb0
 #define TGU_UNLOCK_OFFSET	0xc5acce55
 #define TGU_DEVID		0xfc8
+#define CORESIGHT_DEVID2	0xfc0
 
 #define TGU_DEVID_SENSE_INPUT(devid_val) \
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
@@ -18,6 +19,14 @@
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
 #define TGU_DEVID_CONDITIONS(devid_val) \
 	((int)FIELD_GET(GENMASK(2, 0), devid_val))
+#define TGU_DEVID2_TIMER0(devid_val)    \
+	((int)FIELD_GET(GENMASK(23, 18), devid_val))
+#define TGU_DEVID2_TIMER1(devid_val)    \
+	((int)FIELD_GET(GENMASK(17, 13), devid_val))
+#define TGU_DEVID2_COUNTER0(devid_val)  \
+	((int)FIELD_GET(GENMASK(11, 6), devid_val))
+#define TGU_DEVID2_COUNTER1(devid_val)  \
+	((int)FIELD_GET(GENMASK(5, 0), devid_val))
 
 #define TGU_BITS_PER_SIGNAL	4
 #define LENGTH_REGISTER	32
@@ -54,6 +63,8 @@
 #define PRIORITY_START_OFFSET		0x0074
 #define CONDITION_DECODE_OFFSET	0x0050
 #define CONDITION_SELECT_OFFSET	0x0060
+#define TIMER_START_OFFSET		0x0040
+#define COUNTER_START_OFFSET		0x0048
 #define PRIORITY_OFFSET		0x60
 #define REG_OFFSET			0x4
 
@@ -68,6 +79,12 @@
 #define CONDITION_SELECT_STEP(step, select) \
 	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
 
+#define TIMER_COMPARE_STEP(step, timer) \
+	(TIMER_START_OFFSET + REG_OFFSET * timer + STEP_OFFSET * step)
+
+#define COUNTER_COMPARE_STEP(step, counter) \
+	(COUNTER_START_OFFSET + REG_OFFSET * counter + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -83,6 +100,10 @@
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 #define STEP_SELECT(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+#define STEP_TIMER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
+#define STEP_COUNTER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -123,6 +144,18 @@
 	 NULL               \
 	}
 
+#define STEP_TIMER_LIST(n) \
+	{STEP_TIMER(n, 0), \
+	 STEP_TIMER(n, 1), \
+	 NULL              \
+	}
+
+#define STEP_COUNTER_LIST(n) \
+	{STEP_COUNTER(n, 0), \
+	 STEP_COUNTER(n, 1), \
+	 NULL                \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -144,6 +177,19 @@
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
 
 enum operation_index {
 	TGU_PRIORITY0,
@@ -152,6 +198,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER
 };
 
 /* Maximum priority that TGU supports */
@@ -168,6 +216,8 @@ struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
 	unsigned int *condition_select;
+	unsigned int *timer;
+	unsigned int *counter;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -199,6 +249,8 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
  * @num_condition_select: Maximum number of condition_select
+ * @num_timer: Maximum number of timers
+ * @num_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -215,6 +267,8 @@ struct tgu_drvdata {
 	int num_step;
 	int num_condition_decode;
 	int num_condition_select;
+	int num_timer;
+	int num_counter;
 };
 
 #endif
-- 
2.34.1


