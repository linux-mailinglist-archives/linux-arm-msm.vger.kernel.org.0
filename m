Return-Path: <linux-arm-msm+bounces-86514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B018CDBC02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E71A8305D652
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C72932E6AC;
	Wed, 24 Dec 2025 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOBUPMmM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IiO/Mw06"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1A032F74A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766567239; cv=none; b=sYYLac9G0GqcfaNandA/qTtmuwf37cyCe/M7BtaLGvLkFyId/CSB4VWyxHaAuS5FP+6jbIpGk1/Zmx25H4z8fwM5y8nMSQiSdkAe4irWUk5NwPWQhzKS9QloCKORUkS3sZifKOSVtt9TyGTmcD3UBnrEQx1kYBF58DdQSKw/Frk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766567239; c=relaxed/simple;
	bh=adb+NstK0OrGdQHboby6lmZs7rWs2zBc775hVSg6Ay8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGgSOZNdHnyJmkCrj5i8e1T8zArzLznOyaeseFpImbg9ziNzjDXJzHhBmdHtyT2mroQ1SjDKDI/JO/eGSmwlyvuAvBIiVmgT/DZYy+P8pfNLkeBtKjurQ1G4KIQDprMgGXOaXOEfzFlSTaFR6xhDCvtBdC0D30XJBToELszGQW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOBUPMmM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IiO/Mw06; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7AVQp678609
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=; b=YOBUPMmMdrDmeAIx
	Huv1FMsfe4YCuYUYWjRNLI1S7ntZ22ELjQ3MckP4EgYL9z21DlhTwaVHWF014DTu
	4lDLayaKTXKzv1sZMCx+NiQNAHASjD6LlcT5DYgRli6raS29BmBwa/7THC2Sjqdd
	4dNFknNfqrommWeiboRHuQmSAgPPGz2UnxDA3DbxwSs3oG2WBn/XA7naTRkPrTQ6
	LzjihxAA3K+CQOeU0fK+2+Wx/WwjXOQUEEMUILCHNorecrPQ8OrVDBHEv7Z7ChNt
	6lWQaI6TUgplNeU7SsT0w7IPHGDXenPCxqTMbY9mrRv/ui2nxDvdEk2XqOA4QwzP
	ClCVYw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq24s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso113193185ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567236; x=1767172036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=IiO/Mw065efPTMCFpu12JhhCjilarF3wGucTrEqW3t/pbzV0fHzjPQZHtwYtZj545p
         xsYW95/jaoGyXO3Qcj3CPwGIQNigQ/B0hKQ66u2INBjSqkGs8gcEVbpa937yrKF1ter4
         xSxpd8wIyaVH+VPVhTh52/sWGGEx8+Ax0cnWFF1VdojCrex+YumVjEqYXpHvDUT3QOUy
         W3zSYhi7g9LoETi+jLhDMyFe4S8gwM1uekENihxzstc7uPxA1z4D0IkSFJ9U8vMZTDyI
         hZr1hpVd/6q+RDzLPhJl0ujowZlkMxkwFGT/Eo5UTwQ6aVjQTCzaKCU0+XPWHit4j6/g
         gB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567236; x=1767172036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=q1dy4eVkL09oeGtEWNK4Q0aH66Y7OsmOQ/YFmQpifblJKOaoiQGp2yIL4yPCoG5HSv
         ts4khm6iZ+Vt+8Grz8sib0ym0hXBeYDuOXkS7eTdgKIckmCKmmOvdx+11ndg413EY7jJ
         zXPKIsgqa5RnHkiLt8NUB3VWuY13EWKpewuhskkcQr0rZcorGGzenQPzVrch1Io2ouhu
         TtS1r9cClkaJiPa+kDVmHjmuH9S4Kchy3egTSN7qgIIqxdBWohDI+SvY053BTN0WDqFw
         YpoFypbKqjpPDFXzFTDcgsiuMxVF9mWv/iI3k+Z6xQyaP2Hc0yAI/esu8LtB2qM7pRlZ
         gpmg==
X-Forwarded-Encrypted: i=1; AJvYcCUxQkzSu7AbqPjb4R2s20DEJ/5eMUx2PptV4GSTLRBwCENcWadpN7X/r7ilRZ6x3sZqpzH4brQfsQMrsELp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2K35py0XY0NMzfYiIZ4Sc6VU+YveKTPX1rV5HIm/jxJzI/Xkp
	9KMD+a3H9XccHLG3iPXSPT74v1x8ToZdlOavruhefZjWqQ5L3jzAITKtOq/Ul5+MV6Acis4PBiq
	HUmVu+3PgOEL+XuM3cu0eeAutCUa0QYE8D+K85NFv9ISl99dmMiZ0vhTZpqEA3wPIP3WJ
X-Gm-Gg: AY/fxX6pBNEkWiidrTnbZK4jx4EoXgQpXBwB2DHQKOVmqj2pWwTsdvbpp+9K71KZEAs
	CaJVLgBadBOQCL01NCxT81Eta0lHN13H17O0kcbBzsNjZfIgNImzFE/NEl3EJSoBNnMipxxr4kc
	aGPx016IjHr8LIImciS9Q2LRVty2/y/DaWZJPGXpljkMQk2C62M8/FWADtW5Oiq8gf7IlJqNPIH
	CMtOoriFhHHWqG24870EKuswyTWB2W0CpH3DvAOfjqnFpTjukO/59QXVtndaWuVFDV8Bv7R10pi
	J94zUtuQ+RCZz7pA7u6fOuFZgco9KTqYuumarNft053VjCrvRPuN6dy0+KGRBGn4f4S3i6AI3Uy
	WJrOqCaUx7Bl4ulqJ9aIBU+m/7Buu2esucg8o04ci/RGiulvC2P4v5ObHyDso1L9A21Skrvm9
X-Received: by 2002:a17:902:c40b:b0:295:7b89:cb8f with SMTP id d9443c01a7336-2a2f1f78d07mr184952145ad.0.1766567236202;
        Wed, 24 Dec 2025 01:07:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9Hm3W3DFtHwdujiHhNesaWsev04lu15VpbBPkpdmQV4QFHQ8NusHUQeuYpvBKkLyYCjutdg==
X-Received: by 2002:a17:902:c40b:b0:295:7b89:cb8f with SMTP id d9443c01a7336-2a2f1f78d07mr184951915ad.0.1766567235667;
        Wed, 24 Dec 2025 01:07:15 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:15 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:13 +0800
Subject: [PATCH v9 3/8] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-3-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567215; l=5450;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=adb+NstK0OrGdQHboby6lmZs7rWs2zBc775hVSg6Ay8=;
 b=VCt4oiunM/XKuGR5ta/0wbou/1Ac6C8/Ako/ofvneEGNiOTCJzogA5q3kT1UhQ6oYti6pYWxo
 ueKG62Fh/mUDwZNVX1f/tUbvKvhVSVDe3VbYOgM3/0XwxcQQJmxX+1E
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: B-lZgVZBzIflFlD1JWUhjgktyqxQRdRa
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694bad44 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JzqEjpkVlBH90HjAhVoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: B-lZgVZBzIflFlD1JWUhjgktyqxQRdRa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfXx2r1QI95wt5j
 uEpmV2a6yGEYF4LSuVTAN3m9jgst9Khl/w6TJu2tQF1XoQS/B1vcEa5IKySiNJRjQn+2XGZ4pbn
 j+euRvNt6ys79uazZftBUSfpMCTYAerC7EWQ1VzB9HcNxVKYAATWwAx/inyluYVl+I9e8nRaAnK
 F1CivNRUj7YoPhKADHly3mCtDHlQ3wjWD3JcxR2eSr5065hKkoMNE5UY35VaY/VG5Q8TMAECTQ3
 U4Yt3d0aVDox+qc4BwzHCRc9cszbtorQhF8Su23DN+OALyUeU5DMk35UiirbcmibA+Ez4baIkQf
 MZ1cJoaQ6mUpSeTqcGoadV1iGgBlSG+S1nmF5JWKq4vSzL0Te9dnzrw1AdEbwMSo9Vgxf7B/sV6
 VExylVuTUfO7rZeiChR9O2gMd0Oa8GNTqoTckKUBzAL4cdAM9nXPvWqgmV8Yak/XSFVtXtnA1Ex
 4vcHh/YvhGmQp6RU88g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240078

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


