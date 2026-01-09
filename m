Return-Path: <linux-arm-msm+bounces-88157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 804BAD06D09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 03:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9965630329E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 02:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF73D2765C5;
	Fri,  9 Jan 2026 02:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1n92uk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzsvfI3J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F140726D4F7
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 02:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767924736; cv=none; b=WftB1T6JSXn0cPlISUZcaEO7KHYT+UxMkGXbuLLdK6RmJnMn6RPZXaXeIbcevUDOQ79sGobbltXZdwmzhmppYBLWjhcsB+n47oelTjP6XGRzoNepL/Oxg5t6ECe+8X9SREJK/uTtxssKD+NAhf1BVmXFFv7fvFtFBaH82Jwu4QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767924736; c=relaxed/simple;
	bh=EEkNfbmQBN+8dnYOxY65nW4ZVEiCodIqcZ8MJeoNU6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CbajfimQ+ZxNYUzSAn4lQetyoYs+eGYQOXJfxNI2Q2g/krY2U/xqj7XD6lojNxCa07o5MO6eHQfOK2SIRtvaDITiBhTHDywKhT3zCw2pZNtxgZFJzQJsfynWbdGgFwrrP3nrrCnPtOmw8Xsw+xZrEJaiQZT8RgGmLfV+YReeN/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1n92uk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzsvfI3J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Ir6sw3142492
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 02:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l8ZUSHgXPwx
	I60cMjU2VQsRQlj6MWG27O1WOHBdsivk=; b=D1n92uk4Xuz6NJo5ZjVbZwac/CL
	NDQZhMPTufFo+Sasuv4EKbMKGui54p5pPcuFDdZWuwW6dXdpjAydlrdoPYphU5FA
	KiCjrkzuJoRY+6558EG/XuSm5wdzWdTdpywYzsCEtqXMsuNKqvYbwSYlc1gyEiut
	Dk1ii7llcboGL1Lcj3RsODXD7BLv9WIeOSs003/HUlK4+56p9yqQD9FbVfMNJWL9
	zPXK3ZDrgKmG+862xglhG7EPVIjwKSQfpLbONKuhghBrRufefCK5fDKCtOLEhPYX
	S3QpDZUbQVmIlAIf0Y3rzjfRTeUQuHF+RJZhxGH0wxg7wYgy6YxNskVNfRg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j0yd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 02:12:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b0531e07e3so3222657eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 18:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924731; x=1768529531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8ZUSHgXPwxI60cMjU2VQsRQlj6MWG27O1WOHBdsivk=;
        b=KzsvfI3JBVRMIQcDZv5US+eN3IgaXIP2CDyLmxPpWLbD+gC/bp4TJdQCAJugaVA9VH
         n4s4/8lkPjCYX6zQrVrKVtUx9z2GQXOG3xOyEgVkyl3gAGERpm/mVf5OX4rLu8B6XWfq
         qFGFLuK40gqfBYSfGqwn5S8fCBvW+X9rfSBOfR+Bc04/200fpbeIthDboBypoBjPOt9h
         33BmNREmDCeMMz/89CbUWT6Yy9WVvPDiAivewuX5Sss+XEAHbnEUtJSxgGspClEX6f7u
         cqoP6fEp1kJbg3XDUFs8n2aMT/ld1kISWpyBgGG7WxHj8oOGL9QQiGkKrLD4QSfl03f7
         XFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924731; x=1768529531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l8ZUSHgXPwxI60cMjU2VQsRQlj6MWG27O1WOHBdsivk=;
        b=T9ROpS/YZnIJ0A9z5IQWRg2F9MaI1gUEMK7gx1GsbYdx4yg7hw18W9VcRleHqHWXk4
         7q2Y9VzmOmSC+jfkRQGm/th5FQU1Uk0W+ABA0qfLGKsYwz0We0G23A3HoqoVmC+37+iZ
         /zq9F7sEKgszZS9vtWKgQ6Y/c/0IFE15kqKnJq0TCfmM7S1+kOt7fPHHCBmesuWkq/WD
         x90GvzVxJDZDXRcJaQnNDiPbBWAGZuLFYjRHrrvuL/gSzzly0r7w1jkgBkDATAvZoNG/
         8Bep5IpmdCcKBmYnlWU6KNqpkXUHvG9jII+5UJs329jam7pN5vf7N33X4KYBP3VAUDru
         3E6w==
X-Forwarded-Encrypted: i=1; AJvYcCUvpWkkTWhOkrF4p3pY6UVpvtmbZ900NDjWLSk9hjWz6DcuW1cm/D7EeGnbfsANuTFKByugX/1lKgIx7pJR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8CFsFkq8f0mZy7+YizgSKSBIQ2xqqWsPchG4R9DnSJJ1phjpV
	HvYyzRRRK6ECIzKY2BU6T54o+tYjLpHaLXGB4U06D8DpWgml7VDwcKBjtyNE7nz0mm3R2GNX64H
	7EPI9qJC5rXjbfdKedhhaQf76IoOAaF6Eo9bdmkby+K+ELVDtbAx4Amt1KODUOYivFi//
X-Gm-Gg: AY/fxX4Rkbex3f2o3qv0dOisqqkA/a15SAs5CgiwRUd8GeoS8139yvxRtIGJs9hY3VP
	QaLadU2KMA0LG1d6Md5gef5WkdmeH7cuYLbeeTc2aex3CxrN+Og1hKGHkGCHtGLVOa9fn5+VHEj
	Od9eFz5svTiGyjC/EbansH2vL3CsnCmUlBtNWQdy8nzDNPGySbXXG1Ta+DNQ1Ua2zlxynBYYzip
	aGwfViFrhNLnRFTrG7QNzHOaHDwAXlEM+r4QXlXvqW1/vRDThXhSEBAqGpjxTg1MeBRRciQnVhc
	erdQqhTR2tpYVrJfnAYFez2EXZaI5/G1ULfrBp3+49vczO8dHjJvHG6YFWYtC7ze91MUgugBoGp
	oTW24YX4ygsOxVUCvihsnbcgihg71nvBReOlTz52YLC+RoyXButvuBobUU8hUaRRw
X-Received: by 2002:a05:7300:fb09:b0:2a4:3593:466d with SMTP id 5a478bee46e88-2b17d226c06mr5084512eec.9.1767924730249;
        Thu, 08 Jan 2026 18:12:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvY/KIw1x5A1D0EeHpkihkYg3QpZfby76yqehvPy8YBwjD2Fqm89ZI+vwkayOWry45JN4POg==
X-Received: by 2002:a05:7300:fb09:b0:2a4:3593:466d with SMTP id 5a478bee46e88-2b17d226c06mr5084502eec.9.1767924729642;
        Thu, 08 Jan 2026 18:12:09 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:09 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v10 3/7] qcom-tgu: Add signal priority support
Date: Thu,  8 Jan 2026 18:11:37 -0800
Message-Id: <20260109021141.3778421-4-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfXxP9nPVQ7OItF
 3v2fzDKyS0HS/E6j2smrWcNKIZLx9uxTs2ZVn0KjXxh3aa/hMM2tP3Lkl+h/TdvrXQ6bmNRkcv2
 X3kOl5rb9hewO3pemnfnUqvr0yU/1Tw2yYWFWhuQDa44yAtwFbOiNTNH7z5Zr4mfejAMF0VncRW
 VB7FSfhmdFalL5lKdHzOlkek4aVhwvFiGXrr2KXh5V37Qd3GQBC8auPZopY9gStL9Z1qznAm5Lp
 ZcIbblyIwWDylHjnVh9YflXCNf0fzJR5GM9n3Z6wvHEIn0mRRLIEQ3D0ISHRv6T0g9R6DI6joiF
 CD1z8ebD1h74JKDJlSDbaTuI+7WIHMOl6iOu7Klne1Frqx4sPrnEXkVLlYFHKSOxvE0nkOseLmz
 W1S5XaKL7QJvV2ah8i9Qo2DFcPon4ln8yMsFZmw3W1FgMWKSn4RZQ26TNvF54V5yxNRV4Q87XMK
 WXOcaKrwpKgn1o+TkjQ==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696063fb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aHbVEu0FunmFpxPyS6YA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: vPIuwb2GxpyIWkVBS1sO37ywTTrTrD--
X-Proofpoint-ORIG-GUID: vPIuwb2GxpyIWkVBS1sO37ywTTrTrD--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090012

Like circuit of a Logic analyzer, in TGU, the requirement could be
configured in each step and the trigger will be created once the
requirements are met. Add priority functionality here to sort the
signals into different priorities. The signal which is wanted could
be configured in each step's priority node, the larger number means
the higher priority and the signal with higher priority will be sensed
more preferentially.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 160 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 113 +++++++++++++
 3 files changed, 280 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 56ec3f5ab5d6..ec630e6ff2ee 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -7,3 +7,10 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : disable TGU.
 		1 : enable TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
+Date:		January 2026
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the sensed signal with specific step and priority for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index c5b2b384e6ae..f8870766d624 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -14,14 +14,120 @@
 
 #include "tgu.h"
 
+static int calculate_array_location(struct tgu_drvdata *drvdata,
+				   int step_index, int operation_index,
+				   int reg_index)
+{
+	return operation_index * (drvdata->max_step) * (drvdata->max_reg) +
+		step_index * (drvdata->max_reg) + reg_index;
+}
+
+static ssize_t tgu_dataset_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+			container_of(attr, struct tgu_attribute, attr);
+	int index;
+
+	index = calculate_array_location(drvdata, tgu_attr->step_index,
+					 tgu_attr->operation_index,
+					 tgu_attr->reg_num);
+
+	return sysfs_emit(buf, "0x%x\n",
+			  drvdata->value_table->priority[index]);
+}
+
+static ssize_t tgu_dataset_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+		container_of(attr, struct tgu_attribute, attr);
+	unsigned long val;
+	int index;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	guard(spinlock)(&tgu_drvdata->lock);
+	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+					 tgu_attr->operation_index,
+					 tgu_attr->reg_num);
+
+	tgu_drvdata->value_table->priority[index] = val;
+	return size;
+}
+
+static umode_t tgu_node_visible(struct kobject *kobject,
+				struct attribute *attr,
+				int n)
+{
+	struct device *dev = kobj_to_dev(kobject);
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct tgu_attribute *tgu_attr =
+		container_of(dev_attr, struct tgu_attribute, attr);
+	int ret = SYSFS_GROUP_INVISIBLE;
+
+	if (tgu_attr->step_index < drvdata->max_step) {
+		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
+			attr->mode : 0;
+	}
+	return ret;
+}
+
 static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
+	int i, j, k, index;
+
 	TGU_UNLOCK(drvdata->base);
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < MAX_PRIORITY; j++) {
+			for (k = 0; k < drvdata->max_reg; k++) {
+				index = calculate_array_location(
+							drvdata, i, j, k);
+
+				writel(drvdata->value_table->priority[index],
+					drvdata->base +
+					PRIORITY_REG_STEP(i, j, k));
+			}
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 	TGU_LOCK(drvdata->base);
 }
 
+static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
+{
+	int num_sense_input;
+	int num_reg;
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+
+	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
+	if (((num_sense_input * NUMBER_BITS_EACH_SIGNAL) % LENGTH_REGISTER) == 0)
+		num_reg = (num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER;
+	else
+		num_reg = ((num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER) + 1;
+	drvdata->max_reg = num_reg;
+
+}
+
+static void tgu_set_steps(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+
+	drvdata->max_step = TGU_DEVID_STEPS(devid);
+}
+
 static int tgu_enable(struct device *dev)
 {
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
@@ -105,6 +211,38 @@ static const struct attribute_group tgu_common_grp = {
 
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
 	NULL,
 };
 
@@ -112,6 +250,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
+	size_t priority_size;
+	unsigned int *priority;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -127,12 +267,32 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	spin_lock_init(&drvdata->lock);
 
+	tgu_set_reg_number(drvdata);
+	tgu_set_steps(drvdata);
+
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
 		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
 		return ret;
 	}
 
+	drvdata->value_table =
+		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
+	if (!drvdata->value_table)
+		return -ENOMEM;
+
+	priority_size = MAX_PRIORITY * drvdata->max_reg *
+			drvdata->max_step *
+			sizeof(*(drvdata->value_table->priority));
+
+	priority = devm_kzalloc(dev, priority_size, GFP_KERNEL);
+
+	if (!priority)
+		return -ENOMEM;
+
+	drvdata->value_table->priority = priority;
+
+
 	drvdata->enable = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index b11cfb28261d..f54cea01e427 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -10,6 +10,113 @@
 #define TGU_CONTROL 0x0000
 #define TGU_LAR		0xfb0
 #define TGU_UNLOCK_OFFSET	0xc5acce55
+#define TGU_DEVID	0xfc8
+
+#define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
+#define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
+#define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
+#define NUMBER_BITS_EACH_SIGNAL 4
+#define LENGTH_REGISTER 32
+
+/*
+ *  TGU configuration space                              Step configuration
+ *  offset table                                         space layout
+ * x-------------------------x$                          x-------------x$
+ * |                         |$                          |             |$
+ * |                         |                           |   reserve   |$
+ * |                         |                           |             |$
+ * |coresight management     |                           |-------------|base+n*0x1D8+0x1F4$
+ * |     registe             |                     |---> |prioroty[3]  |$
+ * |                         |                     |     |-------------|base+n*0x1D8+0x194$
+ * |                         |                     |     |prioroty[2]  |$
+ * |-------------------------|                     |     |-------------|base+n*0x1D8+0x134$
+ * |                         |                     |     |prioroty[1]  |$
+ * |         step[7]         |                     |     |-------------|base+n*0x1D8+0xD4$
+ * |-------------------------|->base+0x40+7*0x1D8  |     |prioroty[0]  |$
+ * |                         |                     |     |-------------|base+n*0x1D8+0x74$
+ * |         ...             |                     |     |  condition  |$
+ * |                         |                     |     |   select    |$
+ * |-------------------------|->base+0x40+1*0x1D8  |     |-------------|base+n*0x1D8+0x60$
+ * |                         |                     |     |  condition  |$
+ * |         step[0]         |-------------------->      |   decode    |$
+ * |-------------------------|-> base+0x40               |-------------|base+n*0x1D8+0x50$
+ * |                         |                           |             |$
+ * | Control and status space|                           |Timer/Counter|$
+ * |        space            |                           |             |$
+ * x-------------------------x->base                     x-------------x base+n*0x1D8+0x40$
+ *
+ */
+#define STEP_OFFSET 0x1D8
+#define PRIORITY_START_OFFSET 0x0074
+#define PRIORITY_OFFSET 0x60
+#define REG_OFFSET 0x4
+
+/* Calculate compare step addresses */
+#define PRIORITY_REG_STEP(step, priority, reg)\
+	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
+	 REG_OFFSET * reg + STEP_OFFSET * step)
+
+#define tgu_dataset_rw(name, step_index, type, reg_num)                  \
+	(&((struct tgu_attribute[]){ {                                   \
+		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
+		step_index,                                              \
+		type,                                                    \
+		reg_num,                                                 \
+	} })[0].attr.attr)
+
+#define STEP_PRIORITY(step_index, reg_num, priority)                     \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
+			reg_num)
+
+#define STEP_PRIORITY_LIST(step_index, priority)  \
+	{STEP_PRIORITY(step_index, 0, priority),  \
+	 STEP_PRIORITY(step_index, 1, priority),  \
+	 STEP_PRIORITY(step_index, 2, priority),  \
+	 STEP_PRIORITY(step_index, 3, priority),  \
+	 STEP_PRIORITY(step_index, 4, priority),  \
+	 STEP_PRIORITY(step_index, 5, priority),  \
+	 STEP_PRIORITY(step_index, 6, priority),  \
+	 STEP_PRIORITY(step_index, 7, priority),  \
+	 STEP_PRIORITY(step_index, 8, priority),  \
+	 STEP_PRIORITY(step_index, 9, priority),  \
+	 STEP_PRIORITY(step_index, 10, priority), \
+	 STEP_PRIORITY(step_index, 11, priority), \
+	 STEP_PRIORITY(step_index, 12, priority), \
+	 STEP_PRIORITY(step_index, 13, priority), \
+	 STEP_PRIORITY(step_index, 14, priority), \
+	 STEP_PRIORITY(step_index, 15, priority), \
+	 STEP_PRIORITY(step_index, 16, priority), \
+	 STEP_PRIORITY(step_index, 17, priority), \
+	 NULL                   \
+	}
+
+#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_priority" #priority \
+	})
+
+enum operation_index {
+	TGU_PRIORITY0,
+	TGU_PRIORITY1,
+	TGU_PRIORITY2,
+	TGU_PRIORITY3,
+};
+
+/* Maximum priority that TGU supports */
+#define MAX_PRIORITY 4
+
+struct tgu_attribute {
+	struct device_attribute attr;
+	u32 step_index;
+	enum operation_index operation_index;
+	u32 reg_num;
+};
+
+struct value_table {
+	unsigned int *priority;
+};
 
 static inline void TGU_LOCK(void __iomem *addr)
 {
@@ -35,6 +142,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @dev: Pointer to the associated device structure
  * @lock: Spinlock for handling concurrent access
  * @enable: Flag indicating whether the TGU device is enabled
+ * @value_table: Store given value based on relevant parameters.
+ * @max_reg: Maximum number of registers
+ * @max_step: Maximum step size
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -46,6 +156,9 @@ struct tgu_drvdata {
 	struct device *dev;
 	spinlock_t lock;
 	bool enable;
+	struct value_table *value_table;
+	int max_reg;
+	int max_step;
 };
 
 #endif
-- 
2.34.1


