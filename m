Return-Path: <linux-arm-msm+bounces-84987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14708CB4DA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 07:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AD3E305579F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 06:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB2828C854;
	Thu, 11 Dec 2025 06:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqZFi+VN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbmY0EsB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FAA286D4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765433529; cv=none; b=mW2jhmHBWGgPjsYvKDb3qASxmnOq89cSYbiYeaOfPzXBD5PHuXFqVuiSCJiMsKEbLkeOZcevsK8SS/yaJJlG9CqW5t+ZeehlY2phpMoJ8/9FmP/Hz8BzRpKYc2MF1+yMkV+H0NQcuGejBydiykGdObeIrmIR2wOfSaFj1KeYngo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765433529; c=relaxed/simple;
	bh=xJnis8AYP6mUACqX8hrlzR6o4WFt5DY5g2nwBMuPaFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YslHQrV6cu1GIrjwEklh2jU6/gEVtM01q4tsIlpivMHmlqMGlm10dF+4mFVVygt//LdHHPGpKEFNzPVkWhrk88DA1azh5i1psHAEw0OVBTURkSvdz+dVCRfLVdcldLOw2gCmBg0b+LK9tsnYEDbrIdPe/fsPURyuxKvO9Bi2FLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqZFi+VN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbmY0EsB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP4ox3726640
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CiBtz0qC1MDsW7WxZbfp2FTkcuI+8Qu6DtaIpmNwpuU=; b=cqZFi+VNhTVteuRA
	OaTq6rL4MYQPmkffBoJYBxfC7fkwfug2tDIaXMOWejFGqNRV8B8qliNOc9stmqUf
	hpEIBiisViaVNYCkhV/VrVUlLqEyXPsMTHJ7RpRCFV8lGAilDG6TnD6uMYkz+jWy
	LmEsjVMTxUnIXrnoYjy+Aq0r+OospBkc6J2QsRk1edcONkGcoDS6HUfuogFn1Y68
	FaE2Vkbd9F153uP1+IEbMubGFYt3pP9H1KnCQgWFbSNQEdDOLkW3dIeI4LqmW0Q8
	dPkZHowfpQeqB9xQw1DpmhEu0fplvtf4vTSlfqJlQFu7+pqM8CKv2lqZFvDyPsPg
	1cfWtA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0psbdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:12:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297fbfb4e53so4349345ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 22:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433526; x=1766038326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CiBtz0qC1MDsW7WxZbfp2FTkcuI+8Qu6DtaIpmNwpuU=;
        b=EbmY0EsBdh4VaPliIewkWf9tVwFHhPenX0TplFVU7Iz4+lfNRPMhCxD4wydvVSQ9r7
         krp82Aq0yE5uoLnS0jmyXS+6kb3CxQdsNI4IvwOqs8cB8e4+k5eBywIPjm8DlQ7a0Y6m
         UUayq3uvnmLfumO8hAWnpQ96qkOnBACNv4aivu/UZvhcprNOSZveC2BrR4NqdbaFC2RH
         5k15g2DiqUGiR7Arz4PZ0DzYjsf+jRaYMAP3ym75LIkkDpp7yTQGJVljnpyFNT60pR/q
         pVpKEGAa0LQgUEWFfknhwAThdLGMORh5AesOaHOMY0zKidEVZBESUccCk88lMQ8W14YG
         7L2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433526; x=1766038326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CiBtz0qC1MDsW7WxZbfp2FTkcuI+8Qu6DtaIpmNwpuU=;
        b=O9djexrNumRGi1raY4ltrKh83Jc15NuP5xZgXOesY38A/S3uFLIcwxUdDbo5M/besy
         DPnSDph8zoGVkPUNdBiBBtJNSIYZ3lgcS7x5s8912hMS7/EPzCtNL2Qtiai/jbSYyeO9
         P9yHAc4KzpKIwEOZlMPWFGppSFGrWpDHMkH2YMRwGIyVpZ34j9S//Sb7g3B8Sow9iD7m
         BmegfN8icX5JVOoPmyeC1Xfz5Oel4TgtFzs/6vj26M5JH/DQ1kOCy7hDSZYO2uTCWKGH
         s1F+cSZwTIouqnYSvRmmOkYZZei0WAo5mRwA2QoTpQt+VRnfPDmjmN6FSiwlTitLFr6X
         Pd1A==
X-Forwarded-Encrypted: i=1; AJvYcCX/64bs+UucxcEBaw/2uLfwvMVrsLrj31u1gwXDSZtDfWKP0QEgdefYkyZttxEoczts/EIKQ93nIZAnS2Je@vger.kernel.org
X-Gm-Message-State: AOJu0YyqLvRk+kAXSSSrlWjh+rVDZvpHsVtf93jEtoIdMQnZU6uz2uhM
	lW5jxF2P0yNj6R39qmlSn4NwMKwYOpbaehFfKcM9srdyh7X8bWbFRZm16TCfSV7sov31OzT7fas
	9PPnzxYSvhV1EN7HmgCZCJaLOpYUeXQtpzCmRt18hIGVT/HmdPnIyiKx2kO2BTlJ8OFAH
X-Gm-Gg: AY/fxX48GygOXlymb9CClI2HThUd59w/DrYrm21F1tIraEXKh2a3p7gU1Gxa29eJUws
	2H6DvFAEng09Hu55FJlIlmgwjUyt1ofOansB6xde9R2ZydCmiAaL9/ms0lDk1RVEp2tqzRa+iCA
	KJr3Sgze/MLc9A26AAUM/5bFC6YLaahzbnrRegZnOKijmjhlWKhmkxNluYKAwIgJeok+Pg6F1m3
	jNyGG2SkSj9c1Vw/ml1Rivcy9WsmaiOuBXbz/NSSkeva5qL/YFa6kIUf6v/jouE+/QUcc3fJvwu
	tyIidQkJ2fC3SLzRC562jO9MRnc6weHweoVBiU7Z4OyXJxDiF9PHs2ITNeckF4Q+yNml+nWFklq
	2S/uROk/Ok35RwnUA4hYKcdjd1kHJADV7turgPbTQP4/63yjtAsnbURLvYaJoUr/AEsHLlQOT
X-Received: by 2002:a17:903:3d10:b0:295:5d0b:e119 with SMTP id d9443c01a7336-29ec233651fmr48988285ad.26.1765433526142;
        Wed, 10 Dec 2025 22:12:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6fC3G9cRxZnPr7R0wcUAZMWDvoLAxRPfLPw1ivs4Rflap0o6zBIzu42QGY9pF+eM4UFiEAw==
X-Received: by 2002:a17:903:3d10:b0:295:5d0b:e119 with SMTP id d9443c01a7336-29ec233651fmr48988055ad.26.1765433525664;
        Wed, 10 Dec 2025 22:12:05 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:12:05 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:46 +0800
Subject: [PATCH v8 7/8] coresight: tmc: integrate byte-cntr's read_ops with
 sysfs file_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-7-3e12ff313191@oss.qualcomm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433485; l=3607;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xJnis8AYP6mUACqX8hrlzR6o4WFt5DY5g2nwBMuPaFg=;
 b=XZKk6u6O8/W+/NKO3AjRcEidZmfWuImieEybj0q21Sad2eq2N8OitNcpHtzKGjthFpgvrpY9s
 h1fyVyKmYXdAH0DgyQQqpXNScBCrkDcNTfHx0curg8bHL4Eu37uSgJf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: hEQ3WeKEHqV_XJQIOvpAue3nhnsRTu-v
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a60b6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfX7OEotAoQy4nJ
 3HFjKAiXTG7nDlVCFj9YCLd1f+az7OYm1/Esu1DTxodfFKIIqrfBJZB0gYwWR5eGQnFGsrgAX43
 Xwzn2UrZphCB58NfCrEgu5xKqr6mUPCH/SRZ/ffFiJ7z7madOauF4H0hcpJqurn/aNTaZDyrGJS
 lIKnzxCc/+v2nz2D9RREHtBD3pHg39+rm4ZAFv0EmAXy3XHGKGiYGdbeR8tksUtQkVwI9qaPASX
 /1IDaCHz0HZc4Zj7NChwO9EMU/SQd10tIYMkGNMOUcw28NqA6NSyRB4/Ht1ozEuzOFBZ4HOcZQZ
 0XflJF8To9SYE/gf1qCiImg8eNA8JjL4vqZBXPc/hRQ/WG1aZOYODN4z7kVgBLj80tlbNe6cLjT
 puA/RrykXhUSsG4nVjQ/I/1tpE8Mcw==
X-Proofpoint-GUID: hEQ3WeKEHqV_XJQIOvpAue3nhnsRTu-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110042

Add code logic to invoke byte-cntr's sysfs_read_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 8b0397a77e57..41ac99b35a84 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -31,6 +31,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
@@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+/* Return the byte-cntr's sysfs_read_ops if in use */
+static const struct sysfs_read_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+	int port;
+
+	helper = coresight_get_helper(drvdata->csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_read_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
+
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops)
+		return byte_cntr_sysfs_read_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	if (drvdata->sysfs_ops)
 		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 
@@ -300,7 +347,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->reading_node)
+		drvdata->reading_node->pos += actual;
+	else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;

-- 
2.34.1


