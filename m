Return-Path: <linux-arm-msm+bounces-44923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B7FA0C3A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EB483A6E50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430331E00B6;
	Mon, 13 Jan 2025 21:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FtR8T6tJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ABE1D14EC;
	Mon, 13 Jan 2025 21:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803611; cv=none; b=AAP4ALiSZakJcy6qbRTtPSaTJxojII1MaKs2KozDsIImRk4Ij7JQQs2ZZ0jldQ9ePS0rqOV5BirND37QTlMTnITtf71ESYXFYqMyAQFL1AG6cRQq01QJC/56ttSzG2y7QpzurkTjdgIrj8UmrwjxmZsj6mwK3INNLofziWb1Oq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803611; c=relaxed/simple;
	bh=Oo5Wan4WeRP1RLXz/vr4TCyN83QR16zDtjGl2OzbwXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NOncZwR3825Lon1IOtQeJhXAdd2E9f57PiufHvviJ8YImL7OwGTqkzvTQk7jkW7weAM7TkPI9a9E0uPczHilVKPeg6mR6TL0vyDAm1UKZ9P8SqCAKf7CptldNd1tb7rrOAWmHl6dKzSkIkF7DNobxTtPyqhzibenOwtqE2zQQkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FtR8T6tJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DEIalW012633;
	Mon, 13 Jan 2025 21:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWfxrypBjgTnWO5y/d8SPmZXv8F6hs8J0W9ZmtnkMxM=; b=FtR8T6tJUeLzg2vD
	BgOIui/2Y01XdlLbAH9SIEEvVZydIRqZaAqZZHwFNpHbJL0obF1nv1x/xXaCCF/F
	DZqr0DvZfoN3bzZ43zMUJuccdLi2bAe1deQ+aVc8Up8t+IYXnU9R1nq5JYNzdFux
	1837MKLvQVt75Uopew20vj5//+PoS0xj96/rIXvMXFZ6Hae9p0fFzmviPgl0WPJy
	fD7ZAhEvCGq61XSLCOqlw0OdsHzgAwmidnXfwOGy50g2fPIPr9fSMJYn7+baW+u8
	omBimAdacu4oa6IPGwTIcYTLFhIgcjVoPb04jFvCnPZOUdl3t5GO37n/5BQps/B7
	FsxhQQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4454fe0ye9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:26:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLQjYR014898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:26:45 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:26:45 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:26:41 -0800
Subject: [PATCH 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_llcc_master-v1-2-5389b92e2d7a@quicinc.com>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
In-Reply-To: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736803604; l=10108;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=Oo5Wan4WeRP1RLXz/vr4TCyN83QR16zDtjGl2OzbwXw=;
 b=lbvyyZRQr/d/m2zo+xUS3O32AEDoUCJDqQCokfctXfxlLNu7fpWldBpoyCmpHGLIQGaJE5oTY
 U+VWNjG8kMKDz38thfzKx7NZMxSc2/UMuDvlrULT8qNccILBbPwM9SD
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jWUmSXPBo4m3wPor0l3RkWRXDgkzGh0i
X-Proofpoint-GUID: jWUmSXPBo4m3wPor0l3RkWRXDgkzGh0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130170

Add support for LLCC V6. V6 adds several additional usecase IDs,
rearrages several registers and offsets, and supports slice IDs
over 31, so add a new function for programming LLCC V6.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 212 ++++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/llcc-qcom.h |   8 ++
 2 files changed, 216 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 56823b6a2facc4345265e29b60da24a391e3707d..4379b5baa011aa850a2b65ec20b32519d9331be4 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -35,6 +35,9 @@
 #define ATTR0_RES_WAYS_MASK           GENMASK(15, 0)
 #define ATTR0_BONUS_WAYS_MASK         GENMASK(31, 16)
 #define ATTR0_BONUS_WAYS_SHIFT        16
+#define ATTR2_PROBE_TARGET_WAYS_SHIFT 4
+#define ATTR2_FIXED_SIZE_SHIFT        8
+#define ATTR2_PRIORITY_SHIFT          12
 #define LLCC_STATUS_READ_DELAY        100
 
 #define CACHE_LINE_SIZE_SHIFT         6
@@ -49,6 +52,10 @@
 #define LLCC_TRP_ATTR0_CFGn(n)        (0x21000 + SZ_8 * n)
 #define LLCC_TRP_ATTR1_CFGn(n)        (0x21004 + SZ_8 * n)
 #define LLCC_TRP_ATTR2_CFGn(n)        (0x21100 + SZ_4 * n)
+#define LLCC_V6_TRP_ATTR0_CFGn(n)     (0x41000 + SZ_64 * n)
+#define LLCC_V6_TRP_ATTR1_CFGn(n)     (0x41008 + SZ_64 * n)
+#define LLCC_V6_TRP_ATTR2_CFGn(n)     (0x41010 + SZ_64 * n)
+#define LLCC_V6_TRP_ATTR3_CFGn(n)     (0x41014 + SZ_64 * n)
 
 #define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
 #define LLCC_TRP_PCB_ACT              0x21f04
@@ -62,10 +69,22 @@
 #define LLCC_TRP_ALGO_CFG7	      0x21f28
 #define LLCC_TRP_WRSC_CACHEABLE_EN    0x21f2c
 #define LLCC_TRP_ALGO_CFG8	      0x21f30
+#define LLCC_V6_TRP_SCID_DIS_CAP_ALLOC	0x42000
+#define LLCC_V6_TRP_ALGO_CFG1		0x42008
+#define LLCC_V6_TRP_ALGO_CFG2		0x42010
+#define LLCC_V6_TRP_ALGO_CFG3		0x42018
+#define LLCC_V6_TRP_ALGO_CFG4		0x42020
+#define LLCC_V6_TRP_ALGO_CFG5		0x42028
+#define LLCC_V6_TRP_ALGO_CFG6		0x42030
+#define LLCC_V6_TRP_ALGO_CFG7		0x42038
+#define LLCC_V6_TRP_ALGO_CFG8		0x42040
+#define LLCC_V6_TRP_WRSC_EN		0x42080
+#define LLCC_V6_TRP_WRSC_CACHEABLE_EN	0x42088
 
 #define LLCC_VERSION_2_0_0_0          0x02000000
 #define LLCC_VERSION_2_1_0_0          0x02010000
 #define LLCC_VERSION_4_1_0_0          0x04010000
+#define LLCC_VERSION_6_0_0_0          0X06000000
 
 /**
  * struct llcc_slice_config - Data associated with the llcc slice
@@ -3161,6 +3180,33 @@ static const struct llcc_edac_reg_offset llcc_v2_1_edac_reg_offset = {
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
@@ -3173,6 +3219,13 @@ static const u32 llcc_v2_1_reg_offset[] = {
 	[LLCC_COMMON_STATUS0]	= 0x0003400c,
 };
 
+/* LLCC register offset starting from v6.0.0 */
+static const u32 llcc_v6_reg_offset[] = {
+	[LLCC_COMMON_HW_INFO]	= 0x00064000,
+	[LLCC_COMMON_STATUS0]	= 0x0006400c,
+
+};
+
 static const struct qcom_llcc_config qcs615_cfg[] = {
 	{
 		.sct_data	= qcs615_data,
@@ -3869,6 +3922,149 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	return ret;
 }
 
+static int _qcom_llcc_cfg_program_v6(const struct llcc_slice_config *config,
+				  const struct qcom_llcc_config *cfg)
+{
+	int ret;
+	u32 attr0_cfg, attr1_cfg, attr2_cfg, attr3_cfg;
+	u32 attr0_val, attr1_val, attr2_val, attr3_val;
+	u32 disable_cap_alloc, wren, wr_cache_en;
+	u32 stale_en, stale_cap_en, mru_uncap_en, mru_rollover;
+	u32 alloc_oneway_en, ovcap_en, ovcap_prio, vict_prio;
+	u32 slice_offset, reg_offset;
+	struct llcc_slice_desc *desc;
+	const struct llcc_slice_config *slice_cfg;
+	u32 sz = 0;
+
+	slice_cfg = cfg->sct_data;
+	sz = cfg->size;
+
+	attr0_cfg = LLCC_V6_TRP_ATTR0_CFGn(config->slice_id);
+	attr1_cfg = LLCC_V6_TRP_ATTR1_CFGn(config->slice_id);
+	attr2_cfg = LLCC_V6_TRP_ATTR2_CFGn(config->slice_id);
+	attr3_cfg = LLCC_V6_TRP_ATTR3_CFGn(config->slice_id);
+
+	attr0_val = config->res_ways;
+	attr1_val = config->bonus_ways;
+	attr2_val = config->cache_mode;
+	attr2_val |= config->probe_target_ways << ATTR2_PROBE_TARGET_WAYS_SHIFT;
+	attr2_val |= config->fixed_size << ATTR2_FIXED_SIZE_SHIFT;
+	attr2_val |= config->priority << ATTR2_PRIORITY_SHIFT;
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
+	if (!cfg->skip_llcc_cfg) {
+		disable_cap_alloc = config->dis_cap_alloc << slice_offset;
+		ret = regmap_write(drv_data->bcast_regmap,
+			LLCC_V6_TRP_SCID_DIS_CAP_ALLOC + reg_offset,
+			disable_cap_alloc);
+
+		if (ret)
+			return ret;
+	}
+
+	wren = config->write_scid_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			LLCC_V6_TRP_WRSC_EN + reg_offset,
+			BIT(slice_offset), wren);
+	if (ret)
+		return ret;
+
+	wr_cache_en = config->write_scid_cacheable_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			LLCC_V6_TRP_WRSC_CACHEABLE_EN + reg_offset,
+			BIT(slice_offset), wr_cache_en);
+	if (ret)
+		return ret;
+
+	stale_en = config->stale_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			LLCC_V6_TRP_ALGO_CFG1 + reg_offset,
+			BIT(slice_offset), stale_en);
+	if (ret)
+		return ret;
+
+	stale_cap_en = config->stale_cap_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			LLCC_V6_TRP_ALGO_CFG2 + reg_offset,
+			BIT(slice_offset), stale_cap_en);
+	if (ret)
+		return ret;
+
+	mru_uncap_en = config->mru_uncap_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			LLCC_V6_TRP_ALGO_CFG3 + reg_offset,
+			BIT(slice_offset), mru_uncap_en);
+	if (ret)
+		return ret;
+
+	mru_rollover = config->mru_rollover << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			LLCC_V6_TRP_ALGO_CFG4 + reg_offset,
+			BIT(slice_offset), mru_rollover);
+	if (ret)
+		return ret;
+
+	alloc_oneway_en = config->alloc_oneway_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			LLCC_V6_TRP_ALGO_CFG5 + reg_offset,
+			BIT(slice_offset), alloc_oneway_en);
+	if (ret)
+		return ret;
+
+	ovcap_en = config->ovcap_en << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			LLCC_V6_TRP_ALGO_CFG6 + reg_offset,
+			BIT(slice_offset), ovcap_en);
+	if (ret)
+		return ret;
+
+	ovcap_prio = config->ovcap_prio << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			LLCC_V6_TRP_ALGO_CFG7 + reg_offset,
+			BIT(slice_offset), ovcap_prio);
+	if (ret)
+		return ret;
+
+	vict_prio = config->vict_prio << slice_offset;
+	ret = regmap_update_bits(drv_data->bcast_regmap,
+			LLCC_V6_TRP_ALGO_CFG8 + reg_offset,
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
@@ -3880,10 +4076,18 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev,
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
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 8e5d78fb4847a232ab17a66c2775552dcb287752..7a69210a250c4646b7fd6cf400995e35d3f00493 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -24,6 +24,7 @@
 #define LLCC_CMPTDMA     15
 #define LLCC_DISP        16
 #define LLCC_VIDFW       17
+#define LLCC_CAMFW       18
 #define LLCC_MDMHPFX     20
 #define LLCC_MDMPNG      21
 #define LLCC_AUDHW       22
@@ -67,6 +68,13 @@
 #define LLCC_EVCS_LEFT	 67
 #define LLCC_EVCS_RIGHT	 68
 #define LLCC_SPAD	 69
+#define LLCC_VIDDEC	 70
+#define LLCC_CAMOFE	 71
+#define LLCC_CAMRTIP	 72
+#define LLCC_CAMSRTIP	 73
+#define LLCC_CAMRTRF	 74
+#define LLCC_CAMSRTRF	 75
+#define LLCC_CPUSSMPAM	 89
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor

-- 
2.46.1


