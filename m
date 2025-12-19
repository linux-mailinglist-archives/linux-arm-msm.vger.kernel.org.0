Return-Path: <linux-arm-msm+bounces-85787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7FFCCEB41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 08:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 308E4308CFBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 06:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B452DECC2;
	Fri, 19 Dec 2025 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZbqotfi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIv7trGL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF7B2D877E
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766127579; cv=none; b=A3fCu/DnfbQn/j8Md2HrK+55RPdkHyfq3Afu+DrRZyTvVNwE1I70eXKr1vTYg24JaVMm1iOM7RkcBh2wXRyQ68PeSzQZGjmJrmfZ4sHn799mqzwaXOg51KqhjgZ5gBBtZkM4cl/+l4gDOAYCORxFzz0wIfnMRzju+bHRmvupLgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766127579; c=relaxed/simple;
	bh=qcSPqyQePvUXF45qTdxuZaj+bUdH+6NMxljSGrnB4cE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JylBJ5yuSXG8duy46346DFwJcp3u9bPE2ybcCQmsHgnp4k3TU/HVx8lwL1iWgnVXhiMAVXC24BHolfAOZBon7LnMkwcG2RiM8O5kxPdEa/aAo5H7f/PXNgAqh8/EDzQpRDuUdat6lFSVP0/weAkzc58eyiHZcB+scW+FQv0WtCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZbqotfi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIv7trGL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cQtH1771760
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AAHoK3E/1oe
	cqQ3t5XeeP2NOaVanUmmIQWh+9SYZv/s=; b=CZbqotfisGUedtKVnyjdzWM26kG
	TJRqYgeuqqIOJ3lmji0er+nstl0+5ZjrI4kMKolBL/aO+GTpysK4Q0fNvpeqvQxo
	vMxdZoRZrcwxyvnpuI1NtkbaOcOVafdvbDf0Z7Yn+TYFeWNdWLozCtIzUtrzUolQ
	Zd7/udCixYrbpXQNoE70Jh2gDORAbqImgXuRmPGvhCK5bYiOgBgaHErzpHW4kEk9
	g6yNoyTpSViieoEHJejzSWOPvczlQqXMtchdebYFRaNNT0swxiNFooQ/lpyUEyG4
	r4Sjz0gA4xOMMily+WV/5O6nXkDRg4EcFxR45lOSgLhq+JXFfjJjns1UGcw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bhmch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:59:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bc240cdb249so1373799a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 22:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766127575; x=1766732375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAHoK3E/1oecqQ3t5XeeP2NOaVanUmmIQWh+9SYZv/s=;
        b=SIv7trGLixkeHmF+CT52agWbDKz53udNoqwKS5JXzZYsWrZc6OoEvN06jZHaD2iRt6
         FzgaePSGudQmgVV57IJYP7caFyDAvLh0k5SQQA+/LZEtMqg2JTbRlrbYXaNKjz93JRu1
         FV3nnWmNgF4TdvKK1PdfTUF5gxBWUqV386yzdK/HtKG0hm1Pm02f9cytRmsoHHa5U1Sp
         arT18Gmt89Vu13F/LDUjLl7zpph58yniEcBBAFc1o6XPCjfzEaqLeqchtCAF+2I7EMmE
         T9NGRoTNVcBKcuX8XBVDeDJtWIq5VugDSiX4x6hzzK3MlBFsWY9BP480pRVC+fsKVaTt
         zW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127575; x=1766732375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AAHoK3E/1oecqQ3t5XeeP2NOaVanUmmIQWh+9SYZv/s=;
        b=WSTCqgwkFfEpDEepJFJk6BPYoS7rB2FsvV1mFilY5h0W1LHRYarXDapqashxBYELcH
         NnnQrq6R7UHaktwhRzCFTnGXSToZu+HGTFYyY1TWPaoZ0eSLVxyhVl0h8Qe5eu4GgaYB
         rs3K/LiF2ox3TIuQ0zA8nDEMYc7PPIQQ/rSiEZ/ZtGIsU8T56qZn1m2dwRERSIXcAeDW
         F2lozH4yfwfuF0g8Gf654LRC1enhLlt/A/bvgfjBkjjHkjZYreLx5i/gFpYJVBzXAg++
         tWBJsBuTH51o9AuP3Zxfzs+r7CMegXtdKSQ6KfHix7YqRS/ViIGGFxEIXHW8ZRIXsTdt
         Brsg==
X-Forwarded-Encrypted: i=1; AJvYcCXJuk9tgofOuZFAcjUIHYz7FL7ZNYGbs6In69y7Ajt1uq5U4pn2w6Yp066pmQXv1f8ZjUb9V1LK/CYgvgMu@vger.kernel.org
X-Gm-Message-State: AOJu0YyIQpA2akukydpByEm0ulVMlU7O6IZ6qpqlakpk726nX7PWE3H9
	W4KEUXEYyz5R5aUPiHq4sP9f42+HSXDjIKgvdDyKeupvpiH6LbwRGU1XSpwdG09EoECJtwEH0me
	v8X3GZ8f/wonFznGuCPdRMwJSurmJaLMsxm60sei3eeqn6HOzk9z35dVuQVgcsfCCs241
X-Gm-Gg: AY/fxX6tCCfOijPVR4tWxpa6kmJglPZuKf/3uDkjY1fmTrTlYPmGqzzorclgeM+SOIm
	vQYlLRc3/WtVBbV3uXbQBufU7XiSZM2NRiZk4kurnRffzmFcvYyaeTNGYvFkHte5NkK2LeiYe0x
	pQkpDf1Nwhu22O/+L+6Cq6Ns4EuTcO2/FThHIDCYyb4Wfn1VbJxDZ22iGiBYe+x0RPn0MftN7/q
	7stZpzepmsVOnuvDPpZmFqQFaSo3b0breLCK09LtOKy5Hkq5xJ2l8OhH+3uWrD5GdYUHMiSyopk
	MmKVxCNRiPxTlAaeAD5LpFuazhy6nDEPK718aHxb5/3D/1QiLizbvNQIBfeR1z1CTh+0KSTzMFU
	xmGOBNuK5HxbLU4h/1AAaxD0WTWJY5HpqdC8SDNg4T+5YwiY2oPPwuZEAa6AhIfIX
X-Received: by 2002:a05:7300:7994:b0:2b0:59da:f794 with SMTP id 5a478bee46e88-2b05ec745ddmr1683898eec.24.1766127575256;
        Thu, 18 Dec 2025 22:59:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHFZQ55XLG0hhz+Du5So6Zh30gXpnThAA+Zru3wBF9ghRk08A705BlyynLTBuO1EMWAHVI2A==
X-Received: by 2002:a05:7300:7994:b0:2b0:59da:f794 with SMTP id 5a478bee46e88-2b05ec745ddmr1683876eec.24.1766127574671;
        Thu, 18 Dec 2025 22:59:34 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm3614954eec.0.2025.12.18.22.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:59:34 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v9 7/7] qcom-tgu: Add reset node to initialize
Date: Thu, 18 Dec 2025 22:59:02 -0800
Message-Id: <20251219065902.2296896-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ExDZkS1mgIYR843FU1heExUvp8gSe4sF
X-Proofpoint-ORIG-GUID: ExDZkS1mgIYR843FU1heExUvp8gSe4sF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA1NiBTYWx0ZWRfXzl9w5D8H08cI
 FJyAWEX5hq4Ai1uv7f6VSepejcbUiCXZA6pzOlhzoCXidHzPy/tnjTX+ldnO8xE9i5g7LgF/7FL
 db0geEJIiJQhZxsUHsCWLH/s3u7qXpb0Jv6Gmt5ArI86N/S4om5BNFXA0Rq0irH1LPtc1yme5TB
 C2yB8KXgZw1FXtDixI3XpO3Gf+JryM2Ti7Q0BuF0fC2NQTig73Wh0FpSOO1PRKdBQcBDMB6OWK4
 o6QWWzQRYsMRSZnPrkFOjfEzuZHgOgUs3eiij83tH9cFaYMb9gJ7FMbuoccvuzopeiAPsOqk+m6
 +Njr0Zli3JretmAXep0tEjs7euzbdBM4nY3iel0nbbcp/fuiXIQR5CIRLIBkQO+buLW32M71v23
 CA6hmq8MfUyLrw7QGMo1+Q2gdIJiKQ7K00Hke3oY7kw5TJAV9MO1Y9tTDzYIuejHd1Nveg1n/EZ
 E69nBZRISjKoGUUGHLQ==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=6944f7d8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IgPCHI2mAnvcCQI4J_AA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190056

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 010eade0a1c5..0733b3e07b45 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.19
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		December 2025
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index d4210869556e..5a8c6af9b719 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -425,8 +425,82 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	unsigned long value;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value == 0)
+		return -EINVAL;
+
+	if (!drvdata->enable) {
+		ret = pm_runtime_get_sync(drvdata->dev);
+		if (ret < 0) {
+			pm_runtime_put(drvdata->dev);
+			return ret;
+		}
+	}
+
+	guard(spinlock)(&drvdata->lock);
+	TGU_UNLOCK(drvdata->base);
+
+	writel(0, drvdata->base + TGU_CONTROL);
+
+	if (drvdata->value_table->priority)
+		memset(drvdata->value_table->priority, 0,
+			    MAX_PRIORITY * drvdata->max_step *
+				drvdata->max_reg * sizeof(unsigned int));
+
+	if (drvdata->value_table->condition_decode)
+		memset(drvdata->value_table->condition_decode, 0,
+			    drvdata->max_condition_decode * drvdata->max_step *
+				sizeof(unsigned int));
+
+		/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			drvdata->value_table
+			->condition_decode[calculate_array_location(
+			drvdata, i, TGU_CONDITION_DECODE, j)] =
+			0x1000000;
+		}
+	}
+
+	if (drvdata->value_table->condition_select)
+		memset(drvdata->value_table->condition_select, 0,
+				drvdata->max_condition_select * drvdata->max_step *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->timer)
+		memset(drvdata->value_table->timer, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_timer) *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->counter)
+		memset(drvdata->value_table->counter, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_counter) *
+				sizeof(unsigned int));
+
+	dev_dbg(dev, "Coresight-TGU reset complete\n");
+
+	TGU_LOCK(drvdata->base);
+
+	drvdata->enable = false;
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1


