Return-Path: <linux-arm-msm+bounces-84984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66659CB4D91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 07:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FCBA303753D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 06:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EFF1F2B88;
	Thu, 11 Dec 2025 06:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KurbiStB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEQeU9yA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CE6285CA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765433514; cv=none; b=I2DwwAJmwf3qj9Iib8NVL6lkJy2cYD+80wmxNM0g/dgTRIOEPGy+31Q5P1T9AifxLV1AJOM5cvezcu7va1kkXBQC24Sk3+Sf02OssKLk2zatSfybMeHYwqFuwN7iVik0wMLh4JsPiLQTkVm0hYOu4EUiv+q2JcjFaxOSCTG4cTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765433514; c=relaxed/simple;
	bh=adb+NstK0OrGdQHboby6lmZs7rWs2zBc775hVSg6Ay8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmS92hTpelZ5f3gXGceHlVCTCQMCWuy0w0BCHmP0u8dzzt7WMNOiYum1VBuzNGpaJ94YjyO41UaN3NxlSq05fTmgVIdDLYoU+2KXamLpLNRiF/EmOIkNxLBCWjIx2DaoQ7vpOihnPK1/5UOk3iMWPs30R34HrJAAcgR75XXDWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KurbiStB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEQeU9yA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPN8X3735731
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=; b=KurbiStBBVL8b/jP
	OukJyoI+qoID3RDab0vbpy1BDR815qU2UERO7MBo8ddJwMgQLKJ3eiufYlmgQ6/B
	4mzTKSQdfLBRkPE4klWvtTHx2DCx9zV3zSEHlfv9IjUiKc8gMmGoAyTwp3kBBjxD
	5dmG/FH+wnIhblUZSKnFU2EUXfxJJxNGe/sg8m/hIHNCBKDINUxNIXXwIZLWFf2o
	guswoNOu71t3H1hKzwYUEsVLoEWu09AG1aLFdUTkIW2M7QGLZef99KwXTEDJyUTk
	Ef60pnlKg3QrZNKpeIJjkQfLg3VjAPhBsU+U4y0hkRTQplGfNX5ndndVwlF3f7oG
	ZIsB2Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0psbc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297d50cd8c4so17571015ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 22:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433511; x=1766038311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=gEQeU9yArVad5Z/KQnFwnROP2eMlkpSfW5RZFjOvpoZC3VdF07mnqK3uesB02DeqHN
         MtJ4N20k70GJPAaDeKBTQBwi3nrBs7h86EoekmsjAQiIAkn7lHWcMEtRqImvLIIXD/A0
         4adYegR17iTr5l+GiHr7jps3CRDKnZ06gH6P0zVn1CfW7fLi2q+tKmSBc7d8fyfP+Wzi
         K9kRJ9ZK2T4snOhM0xHZJX4CjjFh9zHgeRXkHxOUgAd54WjOo/NSV/Q5ztnV9Ke3za34
         yDVGgq87mF5ihK01uISvPLpWENCxtMwp5nLEUm1MPcZJ9d/Q92pWTbgPMi/cxuD+Trz7
         Pvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433511; x=1766038311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=bxLy44LAEPM2ZKG61Zn+kuS2558XpKfsCHS2u1R6Pn40rDnOJarVF8lRXU4FhKVDMZ
         I7PVcqPx4qpPs6r/nA60TrB9uzAFMBC2CDPGmLW1gKuF+RbDThOL5owgzSOXZcY5Ezl8
         M8+/FOxkBZVEReNSeza+wDlEBr9H6PhLNFQo5QVv64NFRpSKWetA7Jm1ZxeAeFsur7Em
         DsWa8xKE7sNvcVrtpbtJ+cX1vPtd+RIZ8SoOYosc3j9Ubo3y8HF4xEJA51Cbk+l3T0MX
         0k2HxY0nFkwWHXpULZ/kreA7M7bYwVwMBo1D9Uzj3ljjLcC88LEZv3ZfzJh6EXilMHCB
         e9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVWBbdD+tVpgmKO3iMBuMHGzZuC35F7gCIl/T2/UAo4ZZD+NM99ncJ4HzC0ul7XGJu2ZYPD848UUuXCIxk7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4LZLnFZ0kfEpORoRfiyX4fqMcQbz5C4B5Y25LEBHy+aGHRnMG
	bxExT/+8DGte3WV8tRf4vQNleIHUho1jQ08ilfp6XzuP8I9ABYIXI64totPYAmNM3P3bKe6/Ic+
	MJxAKci1jPc++BVP2oRDoi8uQp2V6QgQz7EC6PEvxice35YEZyRH4MRytNkU+dP1EJv/F
X-Gm-Gg: AY/fxX4cnBJ9Ic6SuL8Fiz+yZg9HMfX5moB8zpby7CPsgKOebhiY95t7WMGR6whrGKn
	20WqJlA6WP727HVIuUKUMxFq94+JchWHRovGxUIe/HWrE1ujcvoCEsaz7y8qwbMsxTxL/WyrBJK
	mxN0zvA7KddoVa08xFGoCsWF2izj2foAZ/yFN1ADGPPoN0jb0S/2BC14nu+VqpCdAoEL5mHxHD6
	JKqy8LCiV2A2SZLdYBeOzU4VROrtXYOpiLjGRFpFJYJ4vDP8PLxBRg1xpciDxDI1PmoAFrsJNAt
	TOcLRUVhGMl18fMuVY/Wowcxb63CTH0voz3flza6nQ8qjxSycWqQ1adhGAQBF48DTZLvdz4+00b
	TpyOsyJKtgqJSgQ21K1NJCtU+Nju60xEP5cDOQYnjtrN1iUOEOwfo85sw/dbPlgqdODJB25ga
X-Received: by 2002:a17:902:ef46:b0:29e:e925:1abb with SMTP id d9443c01a7336-29ee9251c57mr20447185ad.27.1765433510598;
        Wed, 10 Dec 2025 22:11:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlea653ROQml/NDqmt5Qi7x7FLFp59TsrT6XIC7awP3CpQ6dicUKXcpTFHchhmY95IxLT6Mw==
X-Received: by 2002:a17:902:ef46:b0:29e:e925:1abb with SMTP id d9443c01a7336-29ee9251c57mr20446935ad.27.1765433510148;
        Wed, 10 Dec 2025 22:11:50 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:11:49 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:43 +0800
Subject: [PATCH v8 4/8] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-4-3e12ff313191@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433484; l=5450;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=adb+NstK0OrGdQHboby6lmZs7rWs2zBc775hVSg6Ay8=;
 b=pNNGCo2sKcw17OfdCXYJbjXP6WA9w9ppuOEMl8czhsU9OnxyxSNPtIoM96fqchgeR8rCnn2Sz
 +lIREvdb64qDQogHnx7wEYF3nw4ZAiIaDryE1VaKklJFSn+qzXyQfwC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: SDQKn8atBgshak2ch9ISCUqGpjGsFMno
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a60a7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JzqEjpkVlBH90HjAhVoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfX2ljCNZgr0iQn
 dIYjXUoBNEj193XCfezST34ylmkjNFg9/v0HLAuc+JgDEZVuCy7zPwuFPbWU1si59boFtty52Kd
 dTUu5ekQEQOXXt7SWSsTYfgq79QrIlUAwvK3F+7UJGkbUH0A967aE6gTwj6EYxO/kOIyIS5/6Cy
 DWKUeelFgDoa7kWrX8ZbIFNX+O5j2LMdxm4yJe4nThp3Yj8Z38CDzZSiuXog0OxcYvlEzCs7PPV
 xhOzL1tbE6uDSoES20d9Zn0kBGBW8Sewfa4XMdfyGvBhDhYg9ST6lIABUKdMHtkitEYxRU7i7gG
 ROKoMDlFUIALPgdLV9JJ+iZvIeEK3tk7uaubr7vEYztqWpmzGCT+1p1zUY6Mbl40cCE5xoOz+Fq
 ysAFmH+B4ijhRWFx5qM+mKcLN+3Cbg==
X-Proofpoint-GUID: SDQKn8atBgshak2ch9ISCUqGpjGsFMno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110042

Introduce sysfs_read_ops as a wrapper, wrap sysfs read operations, for reading
trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 50 +++++++++++-------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++++++
 2 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 1ea255ffa67c..8b0397a77e57 100644
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
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
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
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
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
+	if (drvdata->sysfs_ops)
+		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 
 	return -EINVAL;
 }
@@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct sysfs_read_ops tmc_etb_sysfs_read_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct sysfs_read_ops tmc_etr_sysfs_read_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -828,6 +821,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -841,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->sysfs_ops = &tmc_etr_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -849,6 +844,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 9b3c4e6f0a5e..c9a82ff6cd00 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -221,6 +221,8 @@ struct etr_buf_node {
 	struct list_head	node;
 };
 
+struct sysfs_read_ops;
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -258,6 +260,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +293,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
+	const struct sysfs_read_ops	*sysfs_ops;
+};
+
+/**
+ * struct sysfs_read_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct sysfs_read_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


