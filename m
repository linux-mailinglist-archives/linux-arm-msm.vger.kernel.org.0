Return-Path: <linux-arm-msm+bounces-50283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6E8A4F033
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 23:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 956C6171A39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 22:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF8627932E;
	Tue,  4 Mar 2025 22:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LJo4d37y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D507B2780EE;
	Tue,  4 Mar 2025 22:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127057; cv=none; b=GzRdw+RIyxB3NMzi7tkzfcmpL3Rub6wDBEXxI7810w+cS1BhMhQvmWJt0/sgqPrRvhs0hO7HcM6PBufmLt8QoHDUkKKQkC4aWNPjzrKIqPhZpXqIIB6wXSqFoJLXUYcMwaT200FZ1E5pW19PlIC79WJBmv9fy0V+tGhsBDW+55E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127057; c=relaxed/simple;
	bh=qhHvJoTvR3Iu80YbP0BXew1SGND4ix51shTopOY5ez8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bC2XKVvZuTPsvtOeav2of6k0lbL8PswLmroF/SRgoskh2puUSglSDK+8mfonRuZ3I/5X/Cg+JyYICv8DHm4EEJUHoI5T8u9IbDM6yfhW3PfgsJlgOZDn4saGE0/BkTmpah/xvGMXfNaBfqA3ut7xlo3lrtBkL9ersD72Wvuk8as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LJo4d37y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524LhCO9020930;
	Tue, 4 Mar 2025 22:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9JTxTgdqz5/EqudvwtoYLmtjgG72Va3HEqcvmahFueg=; b=LJo4d37yfybDvx7P
	Gxf81RVslkhMeVAAuFVR9zge19gME7wslxA7Ae3v9oBQFVrU3dSxV0p+D0mLZFRi
	W2F6b4yOMiYXwreE+jCfltynqaMKjMRJT4/VWJBNjSuH7p5/fpQllRhJ8kcnfWJT
	8kdje5OWwbl33E8k72SP0S8kI/mGDNobcpZ19MkhWpQgSvQg3vO8V2LiJSQTmYqX
	XPZnq0W4+ZF3qt0WPw8gwN3pz7lwGfGn7NMPCjAqcaereRonoOaNcvEP22JnN1Hl
	kTkfmUY4mkUqzgQFpVX5LiqV0kAXDu0z0F/wLMg76E9uQOtKD1uW6ochNk8RCdsX
	AwEdbg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tubeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 22:24:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524MOA1J007663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 22:24:10 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 14:24:09 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Tue, 4 Mar 2025 14:23:58 -0800
Subject: [PATCH v2 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250304-sm8750_llcc_master-v2-2-ae4e1949546e@quicinc.com>
References: <20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com>
In-Reply-To: <20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741127048; l=9748;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=qhHvJoTvR3Iu80YbP0BXew1SGND4ix51shTopOY5ez8=;
 b=jOToGZBwrW/0O5YCvM+PUbek+4OQgeDWVYRVa9Ne55Eky8VZchpEosDNNfKpoA5swoN2zCxtS
 K3rehFz6tvpChlWW+qcCfGKjjELgjAWk46lzDMVAjuOo2JI+MJ9YQZ/
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R2no04L0Ts46Mjd38APw5cS_d_zU9hDm
X-Proofpoint-ORIG-GUID: R2no04L0Ts46Mjd38APw5cS_d_zU9hDm
X-Authority-Analysis: v=2.4 cv=Sf4NduRu c=1 sm=1 tr=0 ts=67c77d8b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=p8GoH-Z5idOhyqHZTWQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040179

Add support for LLCC V6. V6 adds several additional usecase IDs,
rearrages several registers and offsets, and supports slice IDs
over 31, so add a new function for programming LLCC V6.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 215 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 211 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 56823b6a2facc4345265e29b60da24a391e3707d..ae271b112246e50fa6165b92a5562457f23d9e4b 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -35,6 +35,9 @@
 #define ATTR0_RES_WAYS_MASK           GENMASK(15, 0)
 #define ATTR0_BONUS_WAYS_MASK         GENMASK(31, 16)
 #define ATTR0_BONUS_WAYS_SHIFT        16
+#define ATTR2_PROBE_TARGET_WAYS_MASK  BIT(4)
+#define ATTR2_FIXED_SIZE_MASK         BIT(8)
+#define ATTR2_PRIORITY_MASK           GENMASK(14, 12)
 #define LLCC_STATUS_READ_DELAY        100
 
 #define CACHE_LINE_SIZE_SHIFT         6
@@ -49,6 +52,10 @@
 #define LLCC_TRP_ATTR0_CFGn(n)        (0x21000 + SZ_8 * n)
 #define LLCC_TRP_ATTR1_CFGn(n)        (0x21004 + SZ_8 * n)
 #define LLCC_TRP_ATTR2_CFGn(n)        (0x21100 + SZ_4 * n)
+#define LLCC_V6_TRP_ATTR0_CFGn(n)     (cfg->reg_offset[LLCC_TRP_ATTR0_CFG] + SZ_64 * n)
+#define LLCC_V6_TRP_ATTR1_CFGn(n)     (cfg->reg_offset[LLCC_TRP_ATTR1_CFG] + SZ_64 * n)
+#define LLCC_V6_TRP_ATTR2_CFGn(n)     (cfg->reg_offset[LLCC_TRP_ATTR2_CFG] + SZ_64 * n)
+#define LLCC_V6_TRP_ATTR3_CFGn(n)     (cfg->reg_offset[LLCC_TRP_ATTR3_CFG] + SZ_64 * n)
 
 #define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
 #define LLCC_TRP_PCB_ACT              0x21f04
@@ -66,6 +73,7 @@
 #define LLCC_VERSION_2_0_0_0          0x02000000
 #define LLCC_VERSION_2_1_0_0          0x02010000
 #define LLCC_VERSION_4_1_0_0          0x04010000
+#define LLCC_VERSION_6_0_0_0          0X06000000
 
 /**
  * struct llcc_slice_config - Data associated with the llcc slice
@@ -153,6 +161,21 @@ struct qcom_sct_config {
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
@@ -3161,6 +3184,33 @@ static const struct llcc_edac_reg_offset llcc_v2_1_edac_reg_offset = {
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
@@ -3173,6 +3223,27 @@ static const u32 llcc_v2_1_reg_offset[] = {
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
@@ -3869,6 +3940,134 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	return ret;
 }
 
+static int _qcom_llcc_cfg_program_v6(const struct llcc_slice_config *config,
+				  const struct qcom_llcc_config *cfg)
+{
+	u32 stale_en, stale_cap_en, mru_uncap_en, mru_rollover;
+	u32 alloc_oneway_en, ovcap_en, ovcap_prio, vict_prio;
+	u32 attr0_cfg, attr1_cfg, attr2_cfg, attr3_cfg;
+	u32 attr0_val, attr1_val, attr2_val, attr3_val;
+	u32 disable_cap_alloc, wren, wr_cache_en;
+	u32 slice_offset, reg_offset;
+	struct llcc_slice_desc *desc;
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
+			cfg->reg_offset[LLCC_TRP_WRS_EN] + reg_offset,
+			BIT(slice_offset), wren);
+	if (ret)
+		return ret;
+
+	wr_cache_en = config->write_scid_cacheable_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			cfg->reg_offset[LLCC_TRP_WRS_CACHEABLE_EN] + reg_offset,
+			BIT(slice_offset), wr_cache_en);
+	if (ret)
+		return ret;
+
+	stale_en = config->stale_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			cfg->reg_offset[LLCC_TRP_ALGO_STALE_EN] + reg_offset,
+			BIT(slice_offset), stale_en);
+	if (ret)
+		return ret;
+
+	stale_cap_en = config->stale_cap_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			cfg->reg_offset[LLCC_TRP_ALGO_STALE_CAP_EN] + reg_offset,
+			BIT(slice_offset), stale_cap_en);
+	if (ret)
+		return ret;
+
+	mru_uncap_en = config->mru_uncap_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			cfg->reg_offset[LLCC_TRP_ALGO_MRU0] + reg_offset,
+			BIT(slice_offset), mru_uncap_en);
+	if (ret)
+		return ret;
+
+	mru_rollover = config->mru_rollover << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			cfg->reg_offset[LLCC_TRP_ALGO_MRU1] + reg_offset,
+			BIT(slice_offset), mru_rollover);
+	if (ret)
+		return ret;
+
+	alloc_oneway_en = config->alloc_oneway_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			cfg->reg_offset[LLCC_TRP_ALGO_ALLOC0] + reg_offset,
+			BIT(slice_offset), alloc_oneway_en);
+	if (ret)
+		return ret;
+
+	ovcap_en = config->ovcap_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			cfg->reg_offset[LLCC_TRP_ALGO_ALLOC1] + reg_offset,
+			BIT(slice_offset), ovcap_en);
+	if (ret)
+		return ret;
+
+	ovcap_prio = config->ovcap_prio << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			cfg->reg_offset[LLCC_TRP_ALGO_ALLOC2] + reg_offset,
+			BIT(slice_offset), ovcap_prio);
+	if (ret)
+		return ret;
+
+	vict_prio = config->vict_prio << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			cfg->reg_offset[LLCC_TRP_ALGO_ALLOC3] + reg_offset,
+			BIT(slice_offset), vict_prio);
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
@@ -3880,10 +4079,18 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev,
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
2.46.1


