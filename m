Return-Path: <linux-arm-msm+bounces-57641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85AAB45BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 22:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 758FB174193
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 20:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9F4299AA3;
	Mon, 12 May 2025 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Me1iFlfe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61EB299937
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083295; cv=none; b=M3OtNw0waWWW4F+Wz8KT1S8PZC2cxrI93Ipy6yx9syRUQKKz0pqMJr0ye3kjcN1FTjYn0HhJ0cvRwMci4GbgtTXMmSIB/RvzGMIYLpVIG2KUzNnItz+7v/a81eVKb7+YcI799Nir5fq228Fa37FtI+NLd5IvPdZ48Pp6fGRMEV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083295; c=relaxed/simple;
	bh=YEqQtTIL0+oionyh6+fMGZzuqqYWlpPwpOMahy3NfXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JiWcMsAN62u6C5Y6dNwGXITiyKSmZCbrIDg2ICnEuPpaRNaLnD2rpAlq3J2di2WMb78y9JAGfw/2aZpBT8CKoTJiFv9EmaSiLjK54WrrzOLgRYQd/OLA8slGLNe3ueqav+eaf9qz34Iv8K6JRMX9zS4OPRI0lhdJQw4lBcJslO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Me1iFlfe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIKsTV022717
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fn7Ezmt0B5GvhaM4fOargsOZNwFZXu65L4x1HKpS32s=; b=Me1iFlfethZTfjFD
	iizQzJV2thU/Qh4IQtn1OruP3zZCgxMpeAARTtnC12FDIK66ncMINqdz8RzJDaLC
	7BWN7xD5e57MZXyrHLoiqRBt8o2f1qA2fp3lurpPGLKP3y+XOLRVxEnuifi2ogb9
	F7OQ9Pix4bT35/5akLCmklX3iqH7pb0c2a0VLW6O8CNw9+dhcdpd25/RNUVVak5n
	JGOWyIHS0xIoZRxyMeWzAAVrGXkmXh3quIwZTJ8qmHtwIWUyzV3aemDgilzpaP59
	dJ4fJqqh97HfxxqMSxD4/AMb9racAuqVIxL9zzEaufvjNgKGgRuDzQ8cSKCwIBKJ
	S+SN+g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp1sxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:54:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30ac97eda56so8235235a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 13:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083291; x=1747688091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fn7Ezmt0B5GvhaM4fOargsOZNwFZXu65L4x1HKpS32s=;
        b=k3kWt8Xe9ksP8TVcswh5ZMpstsp83yYdUPlnhHlViPZnNAtgrYa6+yskqFw34c4NVZ
         c/SQmHeiBcIfpqCdTaY32PMGg5shweUS4bfJfcK20sFy2ZOxPUXPOnInt3hAwwQTzdXc
         qbabEhbvIHxKTb4kSksLHbWgsIZpF+FQODleVgJ9OG1hRHnHUXIAtbsogH0tZMj4zs/f
         WmFpB1Jx9sSON8VzbT4Hr9tAd3Gbw+EiOepOQqkCBa7emZlT48Hzd8siT58d8m/TWMmW
         E9BvdGuuAiQu4avSPGKrgsnOYuS4vHnFT/V2GLAVv56UBw/hyxwPCwDOq7Up3hmzFo+B
         BfBQ==
X-Gm-Message-State: AOJu0YwFEwGmL9GGASjt2iZikoNSvsHeuDk8slI4aZSshfRweCTTRApm
	v43nDrxXo3UOqOiYHhF4OCg8n9kIE20sEdKXN8xWArVRNO3ePnbkMMembUW93/rOC3IYhAmOU+H
	qyNF1P2TMwyKGy5YopycWkr/B+9pLdTO6AJwz2L3Jy4W+X/9IVhmOM96cg0VxseDG
X-Gm-Gg: ASbGnct6rBzlr+HjT33bDP++uEN8WvbeZyxJtne5B657Aak948dAyItSmrE8ZAW57r8
	YMsiDLAIu1XblUl0IxMzSdoh5zejrUegjLGcUvPbLEHZvCalUAzNRZUI0GVWywsIMcmvgNTU63T
	8nNqCrzA/HToyeIBqB0/aeuKTqTeaHTfF1VxxUUNvw/lz3ZLhYD6ZYJ7AP6feWSdlUYDLykreRC
	E5Ltu3lCYKpLYiu1xzqYjnQBuD6mIfp65Ry/GsKetJ+0HLfZXeHMukwgDjvizD7QdAF2st/r8Px
	XnYV4DQvWY0rB6ZV1FvA48CWBmagv43qfTTeCn/rdERv4+bLUjHXt75V56ymMo6q1yc=
X-Received: by 2002:a17:90b:1b4a:b0:2fe:b8ba:62de with SMTP id 98e67ed59e1d1-30c3d646f35mr22587763a91.25.1747083291070;
        Mon, 12 May 2025 13:54:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqvHjRcZCTGer9/g7B5Es9i6yJpPjvkO1E7zjSqOeaal6DUgNBFPKKBnvzJ4ABw6DNN1/SXg==
X-Received: by 2002:a17:90b:1b4a:b0:2fe:b8ba:62de with SMTP id 98e67ed59e1d1-30c3d646f35mr22587737a91.25.1747083290670;
        Mon, 12 May 2025 13:54:50 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39df09dbsm7084867a91.26.2025.05.12.13.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 13:54:50 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 12 May 2025 13:54:42 -0700
Subject: [PATCH v5 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-sm8750_llcc_master-v5-2-d78dca6282a5@oss.qualcomm.com>
References: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
In-Reply-To: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747083286; l=10622;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=YEqQtTIL0+oionyh6+fMGZzuqqYWlpPwpOMahy3NfXg=;
 b=t1pyIOjGpkISwnNgGPtOApFV0gW2Ug+mhDRKT+zdblDZUFs/OlnQ6h3l1a/r3NIJNDd+4OKsr
 zHtn8eZ5SXTCJENj/roafmqz3i3xPK0u6Z0JtBAw3BdIMIEvSoKwotC
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: HpcugdnQFcvEo8aFas8WjAG4sMOckLyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxNSBTYWx0ZWRfX7ykQrO8d6utg
 965MJAel4VzhMisB+utY3iWNl1nIcAr4KMYoqJFVz/Gd/BsBdSSssT4cHPiJVWNlbtmsBDC4773
 KDsGixgmSMymURWuOl8GzW4LTbdLIAyaq73LIlAjeI9mjdDx++F5QJ94RjfRPdHoNiB82YCm6Hf
 svlRkCB6Q6z6zlDjiecBixJp8VlR1KiEQNcd9Ygbpc1p3AfvTw1Zj2XEQzBJN+ijxVsXdMGvLie
 jl+yAM1do5o4YV3OTiIJAbJhXH2rFftSU/x4OE6P/qIsKDXG+vlgS13jT4uCNwke22TWPjwhUEd
 J8/4C2OhsttkhbqMEwuiL0lIxqJke6mqSaXR4QS8Y2fVpXn+ovAoEjRYiByfckQD1xavf+BOFUB
 WzAQNJrNKjdabd7+fFrFWoV9PYNgNV7arhLJiGufSwyyv5Kxoj+DM+qAlJGgMLTucGywVX1u
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=6822601c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=M3llXpa7WoU5VenA65MA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: HpcugdnQFcvEo8aFas8WjAG4sMOckLyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120215

Add support for LLCC V6. V6 adds several additional usecase IDs,
rearrages several registers and offsets, and supports slice IDs
over 31, so add a new function for programming LLCC V6.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 224 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 220 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 56823b6a2facc4345265e29b60da24a391e3707d..958f9e03f1d5e4946ca7ed340f05b8e01929794e 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -35,6 +35,11 @@
 #define ATTR0_RES_WAYS_MASK           GENMASK(15, 0)
 #define ATTR0_BONUS_WAYS_MASK         GENMASK(31, 16)
 #define ATTR0_BONUS_WAYS_SHIFT        16
+#define ATTR2_PROBE_TARGET_WAYS_MASK  BIT(4)
+#define ATTR2_FIXED_SIZE_MASK         BIT(8)
+#define ATTR2_PRIORITY_MASK           GENMASK(14, 12)
+#define ATTR2_PARENT_SCID_MASK        GENMASK(21, 16)
+#define ATTR2_IN_A_GROUP_MASK         BIT(24)
 #define LLCC_STATUS_READ_DELAY        100
 
 #define CACHE_LINE_SIZE_SHIFT         6
@@ -49,6 +54,10 @@
 #define LLCC_TRP_ATTR0_CFGn(n)        (0x21000 + SZ_8 * n)
 #define LLCC_TRP_ATTR1_CFGn(n)        (0x21004 + SZ_8 * n)
 #define LLCC_TRP_ATTR2_CFGn(n)        (0x21100 + SZ_4 * n)
+#define LLCC_V6_TRP_ATTR0_CFGn(n)     (cfg->reg_offset[LLCC_TRP_ATTR0_CFG] + SZ_64 * (n))
+#define LLCC_V6_TRP_ATTR1_CFGn(n)     (cfg->reg_offset[LLCC_TRP_ATTR1_CFG] + SZ_64 * (n))
+#define LLCC_V6_TRP_ATTR2_CFGn(n)     (cfg->reg_offset[LLCC_TRP_ATTR2_CFG] + SZ_64 * (n))
+#define LLCC_V6_TRP_ATTR3_CFGn(n)     (cfg->reg_offset[LLCC_TRP_ATTR3_CFG] + SZ_64 * (n))
 
 #define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
 #define LLCC_TRP_PCB_ACT              0x21f04
@@ -66,6 +75,7 @@
 #define LLCC_VERSION_2_0_0_0          0x02000000
 #define LLCC_VERSION_2_1_0_0          0x02010000
 #define LLCC_VERSION_4_1_0_0          0x04010000
+#define LLCC_VERSION_6_0_0_0          0X06000000
 
 /**
  * struct llcc_slice_config - Data associated with the llcc slice
@@ -106,6 +116,7 @@
  *              ovcap_en.
  * @vict_prio: When current scid is under-capacity, allocate over other
  *             lower-than victim priority-line threshold scid.
+ * @parent_slice_id: For grouped slices, specifies the slice id of the parent.
  */
 struct llcc_slice_config {
 	u32 usecase_id;
@@ -130,6 +141,7 @@ struct llcc_slice_config {
 	bool ovcap_en;
 	bool ovcap_prio;
 	bool vict_prio;
+	u32 parent_slice_id;
 };
 
 struct qcom_llcc_config {
@@ -153,6 +165,21 @@ struct qcom_sct_config {
 enum llcc_reg_offset {
 	LLCC_COMMON_HW_INFO,
 	LLCC_COMMON_STATUS0,
+	LLCC_TRP_ATTR0_CFG,
+	LLCC_TRP_ATTR1_CFG,
+	LLCC_TRP_ATTR2_CFG,
+	LLCC_TRP_ATTR3_CFG,
+	LLCC_TRP_SID_DIS_CAP_ALLOC,
+	LLCC_TRP_ALGO_STALE_EN,
+	LLCC_TRP_ALGO_STALE_CAP_EN,
+	LLCC_TRP_ALGO_MRU0,
+	LLCC_TRP_ALGO_MRU1,
+	LLCC_TRP_ALGO_ALLOC0,
+	LLCC_TRP_ALGO_ALLOC1,
+	LLCC_TRP_ALGO_ALLOC2,
+	LLCC_TRP_ALGO_ALLOC3,
+	LLCC_TRP_WRS_EN,
+	LLCC_TRP_WRS_CACHEABLE_EN,
 };
 
 static const struct llcc_slice_config ipq5424_data[] =  {
@@ -3161,6 +3188,33 @@ static const struct llcc_edac_reg_offset llcc_v2_1_edac_reg_offset = {
 	.drp_ecc_db_err_syn0 = 0x52120,
 };
 
+static const struct llcc_edac_reg_offset llcc_v6_edac_reg_offset = {
+	.trp_ecc_error_status0 = 0x47448,
+	.trp_ecc_error_status1 = 0x47450,
+	.trp_ecc_sb_err_syn0 = 0x47490,
+	.trp_ecc_db_err_syn0 = 0x474d0,
+	.trp_ecc_error_cntr_clear = 0x47444,
+	.trp_interrupt_0_status = 0x47600,
+	.trp_interrupt_0_clear = 0x47604,
+	.trp_interrupt_0_enable = 0x47608,
+
+	/* LLCC Common registers */
+	.cmn_status0 = 0x6400c,
+	.cmn_interrupt_0_enable = 0x6401c,
+	.cmn_interrupt_2_enable = 0x6403c,
+
+	/* LLCC DRP registers */
+	.drp_ecc_error_cfg = 0x80000,
+	.drp_ecc_error_cntr_clear = 0x80004,
+	.drp_interrupt_status = 0x80020,
+	.drp_interrupt_clear = 0x80028,
+	.drp_interrupt_enable = 0x8002c,
+	.drp_ecc_error_status0 = 0x820f4,
+	.drp_ecc_error_status1 = 0x820f8,
+	.drp_ecc_sb_err_syn0 = 0x820fc,
+	.drp_ecc_db_err_syn0 = 0x82120,
+};
+
 /* LLCC register offset starting from v1.0.0 */
 static const u32 llcc_v1_reg_offset[] = {
 	[LLCC_COMMON_HW_INFO]	= 0x00030000,
@@ -3173,6 +3227,27 @@ static const u32 llcc_v2_1_reg_offset[] = {
 	[LLCC_COMMON_STATUS0]	= 0x0003400c,
 };
 
+/* LLCC register offset starting from v6.0.0 */
+static const u32 llcc_v6_reg_offset[] = {
+	[LLCC_COMMON_HW_INFO]	        = 0x00064000,
+	[LLCC_COMMON_STATUS0]	        = 0x0006400c,
+	[LLCC_TRP_ATTR0_CFG]		= 0x00041000,
+	[LLCC_TRP_ATTR1_CFG]		= 0x00041008,
+	[LLCC_TRP_ATTR2_CFG]		= 0x00041010,
+	[LLCC_TRP_ATTR3_CFG]		= 0x00041014,
+	[LLCC_TRP_SID_DIS_CAP_ALLOC]	= 0x00042000,
+	[LLCC_TRP_ALGO_STALE_EN]	= 0x00042008,
+	[LLCC_TRP_ALGO_STALE_CAP_EN]	= 0x00042010,
+	[LLCC_TRP_ALGO_MRU0]		= 0x00042018,
+	[LLCC_TRP_ALGO_MRU1]		= 0x00042020,
+	[LLCC_TRP_ALGO_ALLOC0]		= 0x00042028,
+	[LLCC_TRP_ALGO_ALLOC1]		= 0x00042030,
+	[LLCC_TRP_ALGO_ALLOC2]		= 0x00042038,
+	[LLCC_TRP_ALGO_ALLOC3]		= 0x00042040,
+	[LLCC_TRP_WRS_EN]		= 0x00042080,
+	[LLCC_TRP_WRS_CACHEABLE_EN]	= 0x00042088,
+};
+
 static const struct qcom_llcc_config qcs615_cfg[] = {
 	{
 		.sct_data	= qcs615_data,
@@ -3869,6 +3944,139 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	return ret;
 }
 
+static int _qcom_llcc_cfg_program_v6(const struct llcc_slice_config *config,
+				     const struct qcom_llcc_config *cfg)
+{
+	u32 stale_en, stale_cap_en, mru_uncap_en, mru_rollover;
+	u32 alloc_oneway_en, ovcap_en, ovcap_prio, vict_prio;
+	u32 attr0_cfg, attr1_cfg, attr2_cfg, attr3_cfg;
+	u32 attr0_val, attr1_val, attr2_val, attr3_val;
+	u32 slice_offset, reg_offset;
+	struct llcc_slice_desc *desc;
+	u32 wren, wr_cache_en;
+	int ret;
+
+	attr0_cfg = LLCC_V6_TRP_ATTR0_CFGn(config->slice_id);
+	attr1_cfg = LLCC_V6_TRP_ATTR1_CFGn(config->slice_id);
+	attr2_cfg = LLCC_V6_TRP_ATTR2_CFGn(config->slice_id);
+	attr3_cfg = LLCC_V6_TRP_ATTR3_CFGn(config->slice_id);
+
+	attr0_val = config->res_ways;
+	attr1_val = config->bonus_ways;
+	attr2_val = config->cache_mode;
+	attr2_val |= FIELD_PREP(ATTR2_PROBE_TARGET_WAYS_MASK, config->probe_target_ways);
+	attr2_val |= FIELD_PREP(ATTR2_FIXED_SIZE_MASK, config->fixed_size);
+	attr2_val |= FIELD_PREP(ATTR2_PRIORITY_MASK, config->priority);
+
+	if (config->parent_slice_id && config->fixed_size) {
+		attr2_val |= FIELD_PREP(ATTR2_PARENT_SCID_MASK, config->parent_slice_id);
+		attr2_val |= ATTR2_IN_A_GROUP_MASK;
+	}
+
+	attr3_val = MAX_CAP_TO_BYTES(config->max_cap);
+	attr3_val /= drv_data->num_banks;
+	attr3_val >>= CACHE_LINE_SIZE_SHIFT;
+
+	ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(drv_data->bcast_regmap, attr2_cfg, attr2_val);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(drv_data->bcast_regmap, attr3_cfg, attr3_val);
+	if (ret)
+		return ret;
+
+	slice_offset = config->slice_id % 32;
+	reg_offset = (config->slice_id / 32) * 4;
+
+	wren = config->write_scid_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+				 cfg->reg_offset[LLCC_TRP_WRS_EN] + reg_offset,
+				 BIT(slice_offset), wren);
+	if (ret)
+		return ret;
+
+	wr_cache_en = config->write_scid_cacheable_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+				 cfg->reg_offset[LLCC_TRP_WRS_CACHEABLE_EN] + reg_offset,
+				 BIT(slice_offset), wr_cache_en);
+	if (ret)
+		return ret;
+
+	stale_en = config->stale_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+				 cfg->reg_offset[LLCC_TRP_ALGO_STALE_EN] + reg_offset,
+				 BIT(slice_offset), stale_en);
+	if (ret)
+		return ret;
+
+	stale_cap_en = config->stale_cap_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+				 cfg->reg_offset[LLCC_TRP_ALGO_STALE_CAP_EN] + reg_offset,
+				 BIT(slice_offset), stale_cap_en);
+	if (ret)
+		return ret;
+
+	mru_uncap_en = config->mru_uncap_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+				 cfg->reg_offset[LLCC_TRP_ALGO_MRU0] + reg_offset,
+				 BIT(slice_offset), mru_uncap_en);
+	if (ret)
+		return ret;
+
+	mru_rollover = config->mru_rollover << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+				 cfg->reg_offset[LLCC_TRP_ALGO_MRU1] + reg_offset,
+				 BIT(slice_offset), mru_rollover);
+	if (ret)
+		return ret;
+
+	alloc_oneway_en = config->alloc_oneway_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+				 cfg->reg_offset[LLCC_TRP_ALGO_ALLOC0] + reg_offset,
+				 BIT(slice_offset), alloc_oneway_en);
+	if (ret)
+		return ret;
+
+	ovcap_en = config->ovcap_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+				 cfg->reg_offset[LLCC_TRP_ALGO_ALLOC1] + reg_offset,
+				 BIT(slice_offset), ovcap_en);
+	if (ret)
+		return ret;
+
+	ovcap_prio = config->ovcap_prio << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+				 cfg->reg_offset[LLCC_TRP_ALGO_ALLOC2] + reg_offset,
+				 BIT(slice_offset), ovcap_prio);
+	if (ret)
+		return ret;
+
+	vict_prio = config->vict_prio << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+				 cfg->reg_offset[LLCC_TRP_ALGO_ALLOC3] + reg_offset,
+				 BIT(slice_offset), vict_prio);
+	if (ret)
+		return ret;
+
+	if (config->activate_on_init) {
+		desc = llcc_slice_getd(config->usecase_id);
+		if (PTR_ERR_OR_ZERO(desc))
+			return -EINVAL;
+
+		ret = llcc_slice_activate(desc);
+	}
+
+	return ret;
+}
+
 static int qcom_llcc_cfg_program(struct platform_device *pdev,
 				 const struct qcom_llcc_config *cfg)
 {
@@ -3880,10 +4088,18 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev,
 	sz = drv_data->cfg_size;
 	llcc_table = drv_data->cfg;
 
-	for (i = 0; i < sz; i++) {
-		ret = _qcom_llcc_cfg_program(&llcc_table[i], cfg);
-		if (ret)
-			return ret;
+	if (drv_data->version >= LLCC_VERSION_6_0_0_0) {
+		for (i = 0; i < sz; i++) {
+			ret = _qcom_llcc_cfg_program_v6(&llcc_table[i], cfg);
+			if (ret)
+				return ret;
+		}
+	} else {
+		for (i = 0; i < sz; i++) {
+			ret = _qcom_llcc_cfg_program(&llcc_table[i], cfg);
+			if (ret)
+				return ret;
+		}
 	}
 
 	return ret;

-- 
2.48.1


