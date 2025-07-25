Return-Path: <linux-arm-msm+bounces-66682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C067B11BF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 12:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE9AE5A5B8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984322ED878;
	Fri, 25 Jul 2025 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBzw9wCZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AC32ED85B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438143; cv=none; b=kOi9LdFQhs0waN7IBe5S/Ysc7AZv7KOQqDReBOcreLnAV0eydV9ge1iIDOBkeAUrO1NneDf3WgwerVIy392at57NfImQGwLpeceCw+e5E5GRkmca9HUKwxsbFSLtEW9x8FaTc+efLOn2rQeiTJ1NFWjPojd8Q6MXTLJnsQdqv8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438143; c=relaxed/simple;
	bh=ab+Uam6+qCgeeyzW1mLzRBfg/DFM2tOzmX2HD9EDM74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P26aSXhFZIESQhmeH9C+U1HY0N2XBNuH8Vpfzpyv7equWkgE523768cwaUKOFMa9fZ8rJTs3Y1yuI7TNCmUCplAXxIkjUmK+jxR0AkPD2HKqZWf1Z61cpVmGznw2hPL1hJNA1gkg9K6WWuvqRoxDEhQYwofYtwCYp/x4dRvPO8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBzw9wCZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P88nTK008715
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jk8rhw+3ezl
	HXU/LdBbPr3lAiametlPEc9i/J7FBJU8=; b=bBzw9wCZ5NqJoAECm4nP3vriVoh
	FhHVfkiVdp59Bve/WNVOQmffD86zONT7Ce7u2k+aiBhxYjRYwnT3pgTpPIGzEYRN
	t9GJ0TcOxyp7T1VXHpOKrRZLJ0IoFBAcCy4tQLIfqgBt5wTR+lWH1mhmDGO11vaz
	2i7f4kbeccqykw7XWA+903UQ6eWyYmHwVWWlMWgE9PjMNwUryCJvpX6lVTIhMfuJ
	BvX4F3Y7G7hYWPO+Qd3+zF/xjOzROcilHxK1xtAw4qrkQ/EySJVCVXcJ3yUaApZl
	YzEFAkJFLsTPVX+IJ21wkOmVA6DYCaYG5Kd1uLSs686CYJrOskd29TVnwIg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4846590b11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:09:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b0e0c573531so1450925a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 03:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438116; x=1754042916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jk8rhw+3ezlHXU/LdBbPr3lAiametlPEc9i/J7FBJU8=;
        b=kyXx85H4+7URd/EiZSCp/sCn8TKqO+Jt56VmPcPLtcKmkK97fsSLlryNupC//IEeRy
         LG3PippJua+vaqLZMbGA5ksU/6ueIxsEnz2tCSspt+Y8y+Q6WzTobjRtIVb7YI3TXx/X
         SbJjBHKUVBVNzOpaw8NsVwWa3+NdnjcxVh4AdA7Ou9Wvuis7z+3RTpA4DS2NYBiHnIKD
         4xR6A0GgA85H5K76nAuuEaTOb82mOAkSuSXKzOU+FRO5/M4GA/oTCFE8GMvMlH2hAUwc
         xyn/HaIVa9e/JLheHce8U5RSjgDSr4mlR6RGOH/lBEvqUDfzeuX3aOTaHLxZY9QPorLI
         cPfg==
X-Forwarded-Encrypted: i=1; AJvYcCUPALoGvZd9W46R1VWzrubXCFoWOOY119E8m+Cg4ad1keC0OUy0K6Nt76LWbmIZGKB6USnhQhQynZF3hlFv@vger.kernel.org
X-Gm-Message-State: AOJu0YzuOVEGzvXTE3+3ij58u45JWgbrhT8jyNyy0/bEsr67xEfQUU2A
	E/MCtUe/2ClfEagEAkOzDFE2h2ohtAHwuDzsYdbdkRjEHtPmcf5lMpiqiG71XJafc2Pz/Z4eiAt
	CzwGQlyNkGRNy+rEqeKsev4A8QGaJItjZlMozYarl+usD++82XXdHiRBM487Pe6IPDj7P
X-Gm-Gg: ASbGncu4Et8LFPI7gd0A9vvAzVKJvHYBKjT4OXxfcaG4Qf62at/OmlwRyOCK3cWYei7
	V1nqLRasdyIjY75KC1eHDAi/cNdrl8W5nQ8qnyZQopEZDHAla/KxDrqY8PJ+Ml2qPt+1d+Tc9ZH
	CdR13QTAwwbzLBo1ez8d5aTgZoPHG1wnlh1yg97GsBJ1sxLgpl7Kg9qdvdKcVF933Bze5LW0N77
	0qpDoAqB75YkjxqpgdGRC8Ya8ESepPaKyoeMhxEK5PjFZZx15zIPI9Otp8l9rjZhTIWtp/OWu63
	lNkXl6DgEjUN5PIKF9JquQnSRGOPSf9mbb8cDfrD0rBqvMOFSuUN8J14GZttuKFM2OJNuX3mxpq
	e36FpxWhlRXKtFaXCyDE=
X-Received: by 2002:a17:903:181:b0:234:d679:72e3 with SMTP id d9443c01a7336-23fb3100766mr20201525ad.42.1753438116158;
        Fri, 25 Jul 2025 03:08:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGs0H0KGXgka7RDhfyUl5zCfbbvzjg0Kqg2pI0R60Jp3ieS0GcT2u8RGVpplg5Z8ydKHN+mw==
X-Received: by 2002:a17:903:181:b0:234:d679:72e3 with SMTP id d9443c01a7336-23fb3100766mr20200975ad.42.1753438115670;
        Fri, 25 Jul 2025 03:08:35 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:35 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v4 05/10] coresight: tmc: Introduce tmc_read_ops to wrap read operations
Date: Fri, 25 Jul 2025 18:08:01 +0800
Message-Id: <20250725100806.1157-6-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Wv0Yz6LSpsYAHCs-QUPHdnD9beA9Yr6J
X-Proofpoint-GUID: Wv0Yz6LSpsYAHCs-QUPHdnD9beA9Yr6J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NiBTYWx0ZWRfX+nFFngPD+kjo
 pgR7QmUYT4Q9mNUsaZe2e/AfbVIFGIV5B0cfiGRVTFkmVc9xJ4AVHdXQhkB08nPlIYjAP06F92t
 JmFInnP/H3hnWBdtLtpQHIo1OCucvz6R7Hp53CYHO+ArMeEKUsY9Ae2WW+4CQb3vaZOCIrY9HV9
 T+UMJLeWsViwyNEwV+t/F7uFoRm/RSNWEnmo7nDkE3sWF9pQVGhDxWh22Fm4Ctc+tOOgoyvJzUS
 aXu0Rsa/sGjxWKUp/O5kuvwP3lGGZJk6wPI28/wkQmvsdKbgn6xGUHOSN05yQswWCnkmO+Q9wB/
 MTv090LKkO0hZEo8/YyZr1VR1pX5zJEs3i9UAawX9/Dq/HvfBgY00kzF9NUWTPJEmTZpdKW/Rw7
 iKEvf2L61etkH6zI10jYtxjRJW6OJl0+ejzhEU7clyznH5K0qdXB+kk+liccgl2XoO377RrQ
X-Authority-Analysis: v=2.4 cv=Vo8jA/2n c=1 sm=1 tr=0 ts=688357bc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=1hiE41pZ4Zj50arX-_gA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250086

Introduce tmc_read_ops as a wrapper, wrap read operations, for reading
trace data from the TMC buffer.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 50 +++++++++----------
 drivers/hwtracing/coresight/coresight-tmc.h   | 17 +++++++
 2 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 4d249af93097..f668047c5df4 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->read_ops)
+		ret = drvdata->read_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->read_ops)
+		ret = drvdata->read_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
+	if (drvdata->read_ops)
+		return drvdata->read_ops->get_trace_data(drvdata, pos, len, bufpp);
 
 	return -EINVAL;
 }
@@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_read_ops tmc_etb_read_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_read_ops tmc_etr_read_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -818,6 +811,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->read_ops = &tmc_etb_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -831,6 +825,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->read_ops = &tmc_etr_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -839,6 +834,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->read_ops = &tmc_etb_read_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 3cb8ba9f88f5..2ad8e288c94b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -223,6 +223,8 @@ struct etr_buf_node {
 	struct list_head	node;
 };
 
+struct tmc_read_ops;
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @pclk:	APB clock if present, otherwise NULL
@@ -259,6 +261,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer for byte-cntr reading.
+ * @tmc_read_ops: Read operations for TMC device.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -290,6 +293,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
+	const struct tmc_read_ops	*read_ops;
+};
+
+/**
+ * struct tmc_read_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_read_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {
-- 
2.34.1


