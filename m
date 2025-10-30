Return-Path: <linux-arm-msm+bounces-79631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D124C1F56B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1A9084EA33D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9E9346E5B;
	Thu, 30 Oct 2025 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGhctNEc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHlRe9Bo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6FF346A0F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761817081; cv=none; b=JPZ6yeZA3plMSqy0q5X7dWu09qrhC9jmIW+/OSae2HODMdMH81efsCEnnpmhOT27l8vlusjDJRJVukQ+GnbDbPCcWMpDaS3NMfVBUg0FzE3DEwK+6VItSK14ir7oOd3ENa6OHXCkF+tHtSGDM1gqNCDdbKCqg4NGv7BH34WuIX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761817081; c=relaxed/simple;
	bh=ZtETLkhF2W0kLCTmB3UKAwjQbraewB+Xn4eBG5R7W9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXbsFiO+08r3rzlkmknpSbWOhx654eWWI/paV/gVGaWgEb8x2z87FaYDq2ofI1jor5sFQPgnCOXFJxhNwyXQlVgwftLgnAUhNch5VBiyQctKSarFPYofI1K5hcYJV36IetEUEO/7AtBUV8IpkR88+EuZlBw9IByI3fv2s0ep1Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGhctNEc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHlRe9Bo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U4xhOn2623035
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gLsx4g5+L9XMMqHrNyhzAMuyIAr9cq3BTyp7uBdkvlE=; b=KGhctNEc/iiCVDT0
	tZ163+LevTNVYTnZ/3iyH9zq67YwbY19RXjznLS5Ma368BSDQIVTnZrv3JgqWg0O
	Qfmn6LlpFKe9ltFuHI1v4xXBTPPRmO+Ste3BX6b6eMJG3ycX9z2pBXOz3ktRn3ha
	IrQy8oU6lUa+FGhs0sRw8qXqvZsHNVbk5unJ4mTK6z/o/aSVgYapczE/bOK/bmxn
	Q8GhDZsgufdOzmKqc2/nloW+Bm3GnPi3e0mxxT+mme6aj6ZaQCDT8jaU9/1RVwvf
	9RYMAsxUo78m2uvopWGcDkv9jKKULTb1EeDh810LMs8R3HHPnEetzrVImllT+4sG
	j27rfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a41fxgsk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:37:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-272b7bdf41fso11900715ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761817078; x=1762421878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLsx4g5+L9XMMqHrNyhzAMuyIAr9cq3BTyp7uBdkvlE=;
        b=bHlRe9BocMu6CkJCjwxD7H3BSEaTpQeLBDSlN5XuAWrVbYzZxZElS9NMNgtkOFGqmh
         Peidntsxn4TLmdso9mvab/2JFyTz0HH5k9zRGTanXWQLqcHXV0n4WgEiyWZ7XvFnhTnf
         QlOfcNyBPSwL8PG3THcF2zj64AUS2pIZ0v/ZHQwtMpio7Vzw1zETdIcQBWrNLkySEhCQ
         0F0NtkQ6fxBLysqPxrU9uIYy+dhZXeu99jdN0SudxayUPv2wZC7qs4JtAM1XM5BcUT28
         icGhQkp6s/7lxByVeRWOsu0TlUGqB2SZLb8B1YQ8eawTWJ9EktIT79VF7mIo3D0eR2bS
         LL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761817078; x=1762421878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLsx4g5+L9XMMqHrNyhzAMuyIAr9cq3BTyp7uBdkvlE=;
        b=A0AQuLC8zZv4zR/gakD6A6Z8rViDHwki70YDb2Sh3bc7TqCHLP+sfF23q32t8jxv7z
         QSum4wxwdQ6bT6VBDBvBz8RJlkSjhnHbb7dGWaC9xKJQ41XBvBmY/AR5aOQSgWEjid31
         wbzvZF4W57u2xT7QWWTxH7SP7n3pHgi84P1waqrTZK/NahRqAmKLcVXNMEQQaEluoi/K
         ZpP6yNEFEkBJUraeKzQTIGqAmfmblTrFmENMFlEfWFK91/1RSxTAVtOav2gR4LnybW2d
         CENCZNKuv6cLqCIO5ooQv/0rW5H+ntAYgviBFwyFGpirwic1Vy0QlCBaGX0b9j0OKNSw
         z11g==
X-Gm-Message-State: AOJu0YxGjYhDOzMWwtPnL4xJhXDEwwMertg3U/Q8Nt0nlv4TZE1+7KCZ
	eI2RqBEGuzknHyofLHNHoFXXBfoTuFDJwCVOQx7PA4Pzg8+aUDEJRIoTzAoaly7goGw6WMWyv1h
	kn/qdotrGt1ZmEYHX8yBUy+NBTpkYcazGs3+oaMKqrVJNnouB48/6OhccKP5/1SzwS+W/H/lWH6
	vy
X-Gm-Gg: ASbGncsUAb5iIhIV1i5eifB6vmczB+V5PFsETzmqxDtGfC78EvwBos8DNLJUaUGavQX
	8sdXYsHzIWalxi9RpIhXfj6Kf9OkPbh3CBfr0Vd3hPNbcUv3b//ENH/OLYNqgC9VEZz9fBAvSkP
	QiLDPpC5Th9PcWCASSKbV5L6a2GiL/uHRKA7n1DL4QOgtUtsUPG7UGgL3VyyGUbPNJO90+YxLWL
	U0J0VUUjuDVy650ZJHWkArs79aW6PrdNzTmQZHRJVHf1Azq9WHorXZnrM1uz/YOhhAJR+DTmryh
	UqGRpW82fzHJP85SebKpMolugWtzAV8RjjnWbbcVWGTNgk9JugQVJKTldrHs+BUjhKeBQVMvokg
	obNRtTayxyffrU0itDsqvkxGAxbPI8uKvzEN0GETNC7Nxl1S33AfqYnmcsBN19j7lf1Lxf1pCpT
	+gFyRQ5aFbvYGE82mjgXHJDyFUjGHTHnvI8A==
X-Received: by 2002:a17:902:dac1:b0:294:fd79:41cd with SMTP id d9443c01a7336-294fd7944c9mr14647285ad.47.1761817077724;
        Thu, 30 Oct 2025 02:37:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIajuAw2WZ9gRsHWUS3kPt2qU6xqoyVKZrtQhy/9wTM8cMh0vEuWk7kQPYj0keKk3KAl0MpQ==
X-Received: by 2002:a17:902:dac1:b0:294:fd79:41cd with SMTP id d9443c01a7336-294fd7944c9mr14646915ad.47.1761817077156;
        Thu, 30 Oct 2025 02:37:57 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-294e3ae4ba2sm49350335ad.40.2025.10.30.02.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:37:56 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 15:07:49 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: add support to extract more than
 32 image versions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-image-crm-part2-v1-2-676305a652c6@oss.qualcomm.com>
References: <20251030-image-crm-part2-v1-0-676305a652c6@oss.qualcomm.com>
In-Reply-To: <20251030-image-crm-part2-v1-0-676305a652c6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761817070; l=4374;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=ZtETLkhF2W0kLCTmB3UKAwjQbraewB+Xn4eBG5R7W9s=;
 b=IPFK4HolnZejQwRQmrtCJxbGzqnocQUpEmECpwo9TTVnm120MdGaOZVgK6TsftJGZ5btQM5O9
 0ZFIO1GP8onAIgsvXsLOjXu0rD89fUdBoPIvjcplx/NoOlCRTFpOECS
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: FTzWAnWYOxh-JIn5rRhMK1Qtf-xCexdy
X-Authority-Analysis: v=2.4 cv=UJrQ3Sfy c=1 sm=1 tr=0 ts=690331f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZFAbIWG072RaKbRf4xEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: FTzWAnWYOxh-JIn5rRhMK1Qtf-xCexdy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3OCBTYWx0ZWRfX2F3hQ2pVrtNk
 tTUPQN/aiejDqb9ogaFf9eaGu12kT0t8aU1RgfXu1YnjvvCH9PHLofXz3BubjOXm9JNPySp8tQm
 4JxW6y0b+OQlKX8kQzAjtnF9PnQlHYph/EJbWYgYNHM2CGSXMh6Ac/M1sfrAVtMM6LgHxTlZHTU
 Un/MU94MKP4RMhSGYc0qGZ0/3xP2muIA9iQsdmrc/OzHKS/FDm1tpxzLbarIEEszyE7SA/koKDC
 ZNDiCNkyR61DYHzR78uZA88dlkgNoBXthmLqy+DA05EiGEqmwR4bKriwfq2GvMgCkjWF7z6KxFO
 Gkz4zQCR9qSWg0zJDvTp5YA6T1Ed3AP+hMXUI8OvvI6gMFwl7AB6pnP3R9uINYTD8pdCe6WrO9C
 eufDNKy08Dzg0hQ6VYUoUtbPYxd0jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300078

SMEM_IMAGE_VERSION_TABLE contains the version of the first 32 images.
Add images beyond that and read these from SMEM_IMAGE_VERSION_TABLE_2.

Not all platforms define the SMEM item number 667, in that case
qcom_smem_get() will throw the invalid item warning. To avoid that,
validate the SMEM item before fetching the version details.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 46 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 4fd09e2bfd021424b9489cd29eec29dc7c7a16d3..f832ae36942b10f68f0c3304f98d946796e8d1bd 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -67,7 +67,17 @@
 #define SMEM_IMAGE_TABLE_GEARVM_INDEX	29
 #define SMEM_IMAGE_TABLE_UEFI_INDEX	30
 #define SMEM_IMAGE_TABLE_CDSP3_INDEX	31
+#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX	32
+#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX	33
+#define SMEM_IMAGE_TABLE_DCP_INDEX	34
+#define SMEM_IMAGE_TABLE_OOBS_INDEX	35
+#define SMEM_IMAGE_TABLE_OOBNS_INDEX	36
+#define SMEM_IMAGE_TABLE_DEVCFG_INDEX	37
+#define SMEM_IMAGE_TABLE_BTPD_INDEX	38
+#define SMEM_IMAGE_TABLE_QECP_INDEX	39
+
 #define SMEM_IMAGE_VERSION_TABLE       469
+#define SMEM_IMAGE_VERSION_TABLE_2	667
 
 /*
  * SMEM Image table names
@@ -79,13 +89,18 @@ static const char *const socinfo_image_names[] = {
 	[SMEM_IMAGE_TABLE_APPSBL_INDEX] = "appsbl",
 	[SMEM_IMAGE_TABLE_APPS_INDEX] = "apps",
 	[SMEM_IMAGE_TABLE_AUDIOPD_INDEX] = "audiopd",
+	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX] = "audiopd_adsp1",
+	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX] = "audiopd_adsp2",
 	[SMEM_IMAGE_TABLE_BOOT_INDEX] = "boot",
+	[SMEM_IMAGE_TABLE_BTPD_INDEX] = "btpd",
 	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
 	[SMEM_IMAGE_TABLE_CDSP2_INDEX] = "cdsp2",
 	[SMEM_IMAGE_TABLE_CDSP3_INDEX] = "cdsp3",
 	[SMEM_IMAGE_TABLE_CDSP_INDEX] = "cdsp",
 	[SMEM_IMAGE_TABLE_CHARGERPD_INDEX] = "chargerpd",
 	[SMEM_IMAGE_TABLE_CNSS_INDEX] = "cnss",
+	[SMEM_IMAGE_TABLE_DCP_INDEX] = "dcp",
+	[SMEM_IMAGE_TABLE_DEVCFG_INDEX] = "devcfg",
 	[SMEM_IMAGE_TABLE_DSPS_INDEX] = "dsps",
 	[SMEM_IMAGE_TABLE_GEARVM_INDEX] = "gearvm",
 	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
@@ -95,6 +110,9 @@ static const char *const socinfo_image_names[] = {
 	[SMEM_IMAGE_TABLE_NPU_INDEX] = "npu",
 	[SMEM_IMAGE_TABLE_OEMPD_INDEX] = "oempd",
 	[SMEM_IMAGE_TABLE_OISPD_INDEX] = "oispd",
+	[SMEM_IMAGE_TABLE_OOBNS_INDEX] = "oobns",
+	[SMEM_IMAGE_TABLE_OOBS_INDEX] = "oobs",
+	[SMEM_IMAGE_TABLE_QECP_INDEX] = "qecp",
 	[SMEM_IMAGE_TABLE_RPM_INDEX] = "rpm",
 	[SMEM_IMAGE_TABLE_SDI_INDEX] = "sdi",
 	[SMEM_IMAGE_TABLE_SENSORPD_INDEX] = "sensorpd",
@@ -644,7 +662,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 	struct smem_image_version *versions;
 	struct dentry *dentry;
 	size_t size;
-	int i;
+	int i, j;
 	unsigned int num_pmics;
 	unsigned int pmic_array_offset;
 
@@ -788,20 +806,32 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		break;
 	}
 
-	versions = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_IMAGE_VERSION_TABLE,
-				 &size);
-
-	for (i = 0; i < ARRAY_SIZE(socinfo_image_names); i++) {
+	for (i = 0, j = 0; i < ARRAY_SIZE(socinfo_image_names); i++, j++) {
 		if (!socinfo_image_names[i])
 			continue;
 
+		if (i == 0) {
+			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
+						 SMEM_IMAGE_VERSION_TABLE,
+						 &size);
+		}
+		if (i == 32) {
+			if (!qcom_smem_validate_item(SMEM_IMAGE_VERSION_TABLE_2))
+				break;
+
+			j = 0;
+			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
+						 SMEM_IMAGE_VERSION_TABLE_2,
+						 &size);
+		}
+
 		dentry = debugfs_create_dir(socinfo_image_names[i],
 					    qcom_socinfo->dbg_root);
-		debugfs_create_file("name", 0444, dentry, &versions[i],
+		debugfs_create_file("name", 0444, dentry, &versions[j],
 				    &qcom_image_name_ops);
-		debugfs_create_file("variant", 0444, dentry, &versions[i],
+		debugfs_create_file("variant", 0444, dentry, &versions[j],
 				    &qcom_image_variant_ops);
-		debugfs_create_file("oem", 0444, dentry, &versions[i],
+		debugfs_create_file("oem", 0444, dentry, &versions[j],
 				    &qcom_image_oem_ops);
 	}
 }

-- 
2.34.1


