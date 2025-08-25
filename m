Return-Path: <linux-arm-msm+bounces-70606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBC0B33C6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E41767AC394
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A482A1CF;
	Mon, 25 Aug 2025 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzgBnMLs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4B42C0F89
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117181; cv=none; b=N9SbWXdsBxr/DMw3EnclKlhfipBAFWiLJHnv7oQtCZBkmvybRe6fTA1Lk1vzE3toZb0axeRyHeRIUNFfRbqZ9e6z/8ytaq5/V6joUpizaskha106ZjzlTtubmwdzHaO1zWplhy7pi0MAG+cRB+bKb5YJSygmX8bQMVCZz0DYoTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117181; c=relaxed/simple;
	bh=i7cI71Pcxql08kk2kwqG/6j2bFPZ8SFe8wIXxO2rngk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qlzXer3m/H0FNDETsZwE1DIO76opkIaYkvxewiaI0XdvWteKBwUs0Ye9WSvWMLMvtNG95WpbUHTzesLz1hCyu0+0X4m+wHhLI9qHWP+wROzQ61K+OYKdByfo5P68VxZsjvFzGV33/UHIetpO+kZiBIkcUVXgDk9k3IhPE+HWJZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzgBnMLs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Zdc4018085
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SvXUQ5Jy3Vl
	UkW0CoM5cWbRhM6SwTH97KeAegzR7NvQ=; b=EzgBnMLsT6mzG00BmRmANWSDpH3
	SHSuDjrnxTdGkyMN/m6caeDORXynpEOYvzvIFypb3odQ5FtDEljNK+rSqkU8QFYQ
	XwrJT36ONXlEcTFh9qSdWc50Cf01DAIIW/5/mTuMyPG5SZKedtsl6cwLzTF6gPtc
	rHmuLSyahyAOqkhTpSpLUJK/Qdm941deEUmr1rEmqf5JHr82oqtr1p/A/yzjJqma
	O4tp3W2lTjKfKlpvCCZ4VWTsIKRmAMHwSNQNNFzPIbY5M/sfpnasIQ9Ojb6wu+FH
	h+9tWPO/7W3GNA0BvRsve/cRAuLSyhoJmQCz/Scou7VZ/O3HqgYT7czUgxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unmp1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-246088fc25cso46590535ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117178; x=1756721978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvXUQ5Jy3VlUkW0CoM5cWbRhM6SwTH97KeAegzR7NvQ=;
        b=wA9rM+GUmycE49eSxqtWUPeAmcqttHltoO3ahTBDI8lnSjbtL4PSCit5GzEkF0Z+P9
         +zBOUa3/kcd7yDaDJ6maSs0NFu/FZGJYWatFAOWuN+dDragp7x+RJQr/yBy7z0mVTfY3
         DfQHy4XVhAPjOSYv+B4ToqOqYdrKWbgNCa+GqYdKICxyg8L39y1b+7PDasQW4ow9stGa
         FjRDffece4DyT6LhQ5T+I0x5MziBTIOpZjBr4A1NGrRRrGbafBFvsj5MHdfi5zI/D2xL
         ZprMzg95VHvalPNILPB8IoVLxWKXCneDrr724gYyZuSr/V//WwHnEFE0GJ3KPx30SxAb
         7IUA==
X-Forwarded-Encrypted: i=1; AJvYcCUIeKgg3SdQYlA0ky1Ril8Nwu68G9kynZBOHM1Zcdxiym2K8LXI92AESWbgeIlnzsy7d02wWUJuwSJyI3GC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz66O7CWOTtsxjrxbpf08wTfp6KWbf9OO5TyTO5pktI8cl1IKm
	GwyGapm8XwMdHksXA6g/tQgmkzXLESvSk/5O2ECc0na2EnLQOxN39aEhDTCwpNCl4hNFoVTco9z
	L0x64AV0U7Rbh+1ewENIH4WIm98a21ohbWpdXuBZcwXzdtPMPczoCjXidZ427jP3+lMzB
X-Gm-Gg: ASbGncuJ0hzUusqpZAbBHAh0eXQpYi/sEztF4L2sR+dhPixjdfIP4pMts7HolDSMLRq
	nh2Fp+9FFxfgmYTfzv0jGM/Nz02Nf75N4QVlxZe81QIacwvttJLnqj58X0uMoWSQONh37IzDJDt
	DP/1zddcSUwZuI46+4VW4wbbj7w5aZ5yt5PtR6cBPzm5tQNwHoEV1o66BkzNQFLQHdG+O3xwgWA
	RF+fUlhZw+XnsP93OCW6tASkDu3RtjUanURYAFj2f5JZWSWl7S0XRMGrYBusp8Y7l10WSTco/I6
	1p4C9VIyDaq1CcIFmdn3Xin2jttC4PfSrr3Rt0mMbIuY7kgGsjD27oq8lrjShvXuKplUdQ==
X-Received: by 2002:a17:903:3d10:b0:246:e1f3:77b2 with SMTP id d9443c01a7336-246e1f37a2fmr26904525ad.53.1756117177593;
        Mon, 25 Aug 2025 03:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNSUj+lpNNk+JGaWvnmoLdd6I2WTKiDp+oNxGou+sWeJzSpb4y1wyeamhwYGp2wKMaH+mTiw==
X-Received: by 2002:a17:903:3d10:b0:246:e1f3:77b2 with SMTP id d9443c01a7336-246e1f37a2fmr26904135ad.53.1756117177090;
        Mon, 25 Aug 2025 03:19:37 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:19:36 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 02/12] drivers: accel : Move AIC specific image tables to mhi_controller.c file
Date: Mon, 25 Aug 2025 15:49:16 +0530
Message-Id: <20250825101926.2160554-3-kishore.batta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eXxeiuEfRULQ4CSbcxYUOLbqHNtC96jk
X-Proofpoint-ORIG-GUID: eXxeiuEfRULQ4CSbcxYUOLbqHNtC96jk
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ac38bb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ygN-36B7P9ONzL3nHOgA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX4ipDfnLmkZj6
 qil1VUwaRg3ultyKI+kiaMk3TzTFELKw1JIHetV+N5bflqWDYwKhxMrE6jscCn/lccg6key+t8+
 W7K2AUiSAisLnTYkI+d9ljDjoTGW5wL+ZlPvz8oHfBQjDSYDaRMxJfWLDzHJH6v/DiE4UIjZOp/
 HcBhcDzechG+ITr4zqaMV9kL7+3JqVo50Pp+7RIR42jnc0BO72HYf6VlZGuHXhieBhJFUOaJvYA
 +KWz48JAYdGIUv3ZbPRC5wDtxPYZOxCSqBmL9r3p51rbY5Cil1Fij5D55hu9cTUHQMQ2toiH36O
 sSU31OTQXPwiQqsRI6HetT49M5wB9XInbe/Qa8fcX13NHh1ArOT8jaW/b6LKDLVdSKlC2UE686b
 vBzB1DZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

Move the AIC-specific image tables from the Sahara driver to the AIC
specific controller file. This change prevents the Sahara driver from
being tagged to a specific Qualcomm device, making it easier to add
support for new devices with their own image tables.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c | 43 +++++++++++++++++++++++++++++
 drivers/accel/qaic/sahara.c         | 43 ++---------------------------
 drivers/accel/qaic/sahara.h         |  7 +++++
 3 files changed, 52 insertions(+), 41 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 13a14c6c6168..5cc7994f4809 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -790,6 +790,49 @@ static struct mhi_controller_config mhi_cntrl_configs[] = {
 	},
 };
 
+const char * const aic100_image_table[] = {
+	[1]  = "qcom/aic100/fw1.bin",
+	[2]  = "qcom/aic100/fw2.bin",
+	[4]  = "qcom/aic100/fw4.bin",
+	[5]  = "qcom/aic100/fw5.bin",
+	[6]  = "qcom/aic100/fw6.bin",
+	[8]  = "qcom/aic100/fw8.bin",
+	[9]  = "qcom/aic100/fw9.bin",
+	[10] = "qcom/aic100/fw10.bin",
+};
+
+const size_t aic100_image_table_size = ARRAY_SIZE(aic100_image_table);
+
+const char * const aic200_image_table[] = {
+	[5]  = "qcom/aic200/uefi.elf",
+	[12] = "qcom/aic200/aic200-nsp.bin",
+	[23] = "qcom/aic200/aop.mbn",
+	[32] = "qcom/aic200/tz.mbn",
+	[33] = "qcom/aic200/hypvm.mbn",
+	[39] = "qcom/aic200/aic200_abl.elf",
+	[40] = "qcom/aic200/apdp.mbn",
+	[41] = "qcom/aic200/devcfg.mbn",
+	[42] = "qcom/aic200/sec.elf",
+	[43] = "qcom/aic200/aic200-hlos.elf",
+	[49] = "qcom/aic200/shrm.elf",
+	[50] = "qcom/aic200/cpucp.elf",
+	[51] = "qcom/aic200/aop_devcfg.mbn",
+	[57] = "qcom/aic200/cpucp_dtbs.elf",
+	[62] = "qcom/aic200/uefi_dtbs.elf",
+	[63] = "qcom/aic200/xbl_ac_config.mbn",
+	[64] = "qcom/aic200/tz_ac_config.mbn",
+	[65] = "qcom/aic200/hyp_ac_config.mbn",
+	[66] = "qcom/aic200/pdp.elf",
+	[67] = "qcom/aic200/pdp_cdb.elf",
+	[68] = "qcom/aic200/sdi.mbn",
+	[69] = "qcom/aic200/dcd.mbn",
+	[73] = "qcom/aic200/gearvm.mbn",
+	[74] = "qcom/aic200/sti.bin",
+	[75] = "qcom/aic200/pvs.bin",
+};
+
+const size_t aic200_image_table_size = ARRAY_SIZE(aic200_image_table);
+
 static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
 {
 	u32 tmp;
diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..cf8f8b585223 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -177,45 +177,6 @@ struct sahara_context {
 	bool				is_mem_dump_mode;
 };
 
-static const char * const aic100_image_table[] = {
-	[1]  = "qcom/aic100/fw1.bin",
-	[2]  = "qcom/aic100/fw2.bin",
-	[4]  = "qcom/aic100/fw4.bin",
-	[5]  = "qcom/aic100/fw5.bin",
-	[6]  = "qcom/aic100/fw6.bin",
-	[8]  = "qcom/aic100/fw8.bin",
-	[9]  = "qcom/aic100/fw9.bin",
-	[10] = "qcom/aic100/fw10.bin",
-};
-
-static const char * const aic200_image_table[] = {
-	[5]  = "qcom/aic200/uefi.elf",
-	[12] = "qcom/aic200/aic200-nsp.bin",
-	[23] = "qcom/aic200/aop.mbn",
-	[32] = "qcom/aic200/tz.mbn",
-	[33] = "qcom/aic200/hypvm.mbn",
-	[39] = "qcom/aic200/aic200_abl.elf",
-	[40] = "qcom/aic200/apdp.mbn",
-	[41] = "qcom/aic200/devcfg.mbn",
-	[42] = "qcom/aic200/sec.elf",
-	[43] = "qcom/aic200/aic200-hlos.elf",
-	[49] = "qcom/aic200/shrm.elf",
-	[50] = "qcom/aic200/cpucp.elf",
-	[51] = "qcom/aic200/aop_devcfg.mbn",
-	[57] = "qcom/aic200/cpucp_dtbs.elf",
-	[62] = "qcom/aic200/uefi_dtbs.elf",
-	[63] = "qcom/aic200/xbl_ac_config.mbn",
-	[64] = "qcom/aic200/tz_ac_config.mbn",
-	[65] = "qcom/aic200/hyp_ac_config.mbn",
-	[66] = "qcom/aic200/pdp.elf",
-	[67] = "qcom/aic200/pdp_cdb.elf",
-	[68] = "qcom/aic200/sdi.mbn",
-	[69] = "qcom/aic200/dcd.mbn",
-	[73] = "qcom/aic200/gearvm.mbn",
-	[74] = "qcom/aic200/sti.bin",
-	[75] = "qcom/aic200/pvs.bin",
-};
-
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
@@ -779,10 +740,10 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 
 	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
 		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
+		context->table_size = aic200_image_table_size;
 	} else {
 		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
+		context->table_size = aic100_image_table_size;
 	}
 
 	context->active_image_id = SAHARA_IMAGE_ID_NONE;
diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
index 640208acc0d1..d7fd447ca85b 100644
--- a/drivers/accel/qaic/sahara.h
+++ b/drivers/accel/qaic/sahara.h
@@ -7,4 +7,11 @@
 
 int sahara_register(void);
 void sahara_unregister(void);
+
+extern const char * const aic200_image_table[];
+extern const size_t aic200_image_table_size;
+
+extern const char * const aic100_image_table[];
+extern const size_t aic100_image_table_size;
+
 #endif /* __SAHARA_H__ */
-- 
2.34.1


