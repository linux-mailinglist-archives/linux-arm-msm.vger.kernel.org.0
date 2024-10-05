Return-Path: <linux-arm-msm+bounces-33174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC49914F5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 08:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C4AC1C21776
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 06:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A70313E028;
	Sat,  5 Oct 2024 06:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hih7v6RA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538E960DCF;
	Sat,  5 Oct 2024 06:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728110650; cv=none; b=GRGIXqcftzwKrvJZJMUzXbno2gcd5jkYOFvmsXIpXlWsMxkZw5UghM7kHxAblhgZmGWakSqfJVbRltgd0VDiXUrMnd6BfvSn0feiI+OawIp4RZ4rA3pdY1dNtvjBBG0xHKNP8ND0rmxooig+yNsSZfUVmBVW8adCihT04t3uG6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728110650; c=relaxed/simple;
	bh=e3UcihN5WhCRsfKIzCUmvHE2XXjxW64JyaWJm3/UDc8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lP30/3UVnVMTisY1GYrGrhoN/3az8oM2n5EuDfJzLsXJm1XTZ1MysENeL+3n5Wbi1Ko8xXysDD31DkBOgNxZWrbxhvHD1yL4L25O/I/JDXRZxvxse25IW+YzkZ3rVK6Oqprr3jPWQHBHjy3HP9f3G5jb5blaeF5XZBpEoW+Ewwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hih7v6RA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4955YGpw017597;
	Sat, 5 Oct 2024 06:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3M5grHj5xero39sOtdsfvtvQyu/o9arXXl3UOqSYwzM=; b=Hih7v6RAkfxXEw7s
	oFB2W3q42QsDQeuPWHK95Lg0j46hmhnLmleXvvI24XgF07wTIKdTZ7g0EoKMaGf1
	+fCHkj/BP6sHLFY+m5R9iN8SX79g2s2HJHd9wwgr5bpzWVuvtdJVL4EuyDhuLG+/
	hG/UEbMuatgp9oJHCfwjRSZq9TF43WQiTOXJVEwvJDEs+CpyWcGh0FMCgM61Q/Lt
	V6FeAOh4zowe37SI6T6jok6gNTYW2J6muniJElFc+t4G4/xZWbHoiq13R50CBJQT
	ePTiMV/Bq1Hv90yGfJWfcOFFFZ6rRGEtZJf6SWrhWjn9DjbRUwfpYC2cwMyYcF7Z
	i2xisQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xu683hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 06:43:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4956hsPP019618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 06:43:54 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 23:43:48 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rdwivedi@quicinc.com>, Can Guo <quic_cang@quicinc.com>
Subject: [PATCH V1 3/3] scsi: ufs: qcom: Add support for multiple ICE algorithms
Date: Sat, 5 Oct 2024 12:13:07 +0530
Message-ID: <20241005064307.18972-4-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
References: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GrxMev1OC5i4Ak5Kj2JuSMIMTES6BzGq
X-Proofpoint-ORIG-GUID: GrxMev1OC5i4Ak5Kj2JuSMIMTES6BzGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050045

Add support for ICE algorithms for Qualcomm UFS V5.0 and above which
uses a pool of crypto cores for TX stream (UFS Write – Encryption)
and RX stream (UFS Read – Decryption).

Using these algorithms, crypto cores can be dynamically allocated
to either RX stream or TX stream based on algorithm selected.
Qualcomm UFS controller supports three ICE algorithms:
Floor based algorithm, Static Algorithm and Instantaneous algorithm
to share crypto cores between TX and RX stream.

Floor Based allocation is selected by default after power On or Reset.

Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 232 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  38 +++++-
 2 files changed, 269 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 810e637047d0..c0ca835f13f3 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -105,6 +105,217 @@ static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
 }
 
 #ifdef CONFIG_SCSI_UFS_CRYPTO
+/*
+ * Default overrides:
+ * There're 10 sets of settings for floor-based algorithm
+ */
+static struct ice_alg2_config alg2_config[] = {
+	{"G0", {5, 12, 0, 0, 32, 0}},
+	{"G1", {12, 5, 32, 0, 0, 0}},
+	{"G2", {6, 11, 4, 1, 32, 1}},
+	{"G3", {6, 11, 7, 1, 32, 1}},
+	{"G4", {7, 10, 11, 1, 32, 1}},
+	{"G5", {7, 10, 14, 1, 32, 1}},
+	{"G6", {8, 9, 18, 1, 32, 1}},
+	{"G7", {9, 8, 21, 1, 32, 1}},
+	{"G8", {10, 7, 24, 1, 32, 1}},
+	{"G9", {10, 7, 32, 1, 32, 1}},
+};
+
+/**
+ * Refer struct ice_alg2_config
+ */
+static inline void __get_alg2_grp_params(unsigned int *val, int *c, int *t)
+{
+	*c = ((val[0] << 8) | val[1] | (1 << 31));
+	*t = ((val[2] << 24) | (val[3] << 16) | (val[4] << 8) | val[5]);
+}
+
+static inline void get_alg2_grp_params(unsigned int group, int *core, int *task)
+{
+	struct ice_alg2_config *p = &alg2_config[group];
+
+	 __get_alg2_grp_params(p->val, core, task);
+}
+
+/**
+ * ufs_qcom_ice_config_alg1 - Static ICE Algorithm
+ *
+ * @hba: host controller instance
+ * Return: zero for success and non-zero in case of a failure.
+ */
+static int ufs_qcom_ice_config_alg1(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	unsigned int val, rx_aes;
+	unsigned int num_aes_cores;
+	int ret;
+
+	ret = of_property_read_u32(host->ice_conf, "rx-alloc-percent", &val);
+	if (ret)
+		return ret;
+
+	num_aes_cores = ufshcd_readl(hba, REG_UFS_MEM_ICE_NUM_AES_CORES);
+	ufshcd_writel(hba, STATIC_ALLOC_ALG1, REG_UFS_MEM_ICE_CONFIG);
+
+	/*
+	 * DTS specifies the percent allocation to rx stream
+	 * Calculation -
+	 *  Num Tx stream = N_TOT - (N_TOT * percent of rx stream allocation)
+	 */
+	rx_aes = DIV_ROUND_CLOSEST(num_aes_cores * val, 100);
+	val = rx_aes | ((num_aes_cores - rx_aes) << 8);
+	ufshcd_writel(hba, val, REG_UFS_MEM_ICE_ALG1_NUM_CORE);
+
+	return 0;
+}
+
+/**
+ * ufs_qcom_ice_config_alg2 - Floor based ICE algorithm
+ *
+ * @hba: host controller instance
+ * Return: zero for success and non-zero in case of a failure.
+ */
+static int ufs_qcom_ice_config_alg2(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	unsigned int reg = REG_UFS_MEM_ICE_ALG2_NUM_CORE_0;
+	/* 6 values for each group, refer struct ice_alg2_config */
+	unsigned int override_val[ICE_ALG2_NUM_PARAMS];
+	char name[8] = {0};
+	int i, ret;
+
+	ufshcd_writel(hba, FLOOR_BASED_ALG2, REG_UFS_MEM_ICE_CONFIG);
+	for (i = 0; i < ARRAY_SIZE(alg2_config); i++) {
+		int core = 0, task = 0;
+
+		if (host->ice_conf) {
+			snprintf(name, sizeof(name), "%s%d", "g", i);
+			ret = of_property_read_variable_u32_array(host->ice_conf,
+								  name,
+								  override_val,
+								  ICE_ALG2_NUM_PARAMS,
+								  ICE_ALG2_NUM_PARAMS);
+			/* Some/All parameters may be overwritten */
+			if (ret > 0)
+				__get_alg2_grp_params(override_val, &core,
+						      &task);
+			else
+				get_alg2_grp_params(i, &core, &task);
+		} else {
+			get_alg2_grp_params(i, &core, &task);
+		}
+
+		/* Num Core and Num task are contiguous & configured for a group together */
+		ufshcd_writel(hba, core, reg);
+		reg += 4;
+		ufshcd_writel(hba, task, reg);
+		reg += 4;
+	}
+
+	return 0;
+}
+
+/**
+ * ufs_qcom_ice_config_alg3 - Instantaneous ICE Algorithm
+ *
+ * @hba: host controller instance
+ * Return: zero for success and non-zero in case of a failure.
+ */
+static int ufs_qcom_ice_config_alg3(struct ufs_hba *hba)
+{
+	unsigned int val[4];
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	unsigned int config;
+	int ret;
+
+	ret = of_property_read_variable_u32_array(host->ice_conf, "num-core", val,
+						  4, 4);
+	if (ret < 0)
+		return ret;
+
+	config = val[0] | (val[1] << 8) | (val[2] << 16) | (val[3] << 24);
+
+	ufshcd_writel(hba, INSTANTANEOUS_ALG3, REG_UFS_MEM_ICE_CONFIG);
+	ufshcd_writel(hba, config, REG_UFS_MEM_ICE_ALG3_NUM_CORE);
+
+	return 0;
+}
+
+static int ufs_qcom_parse_ice_config(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct device_node *np;
+	struct device_node *ice_np;
+	const char *alg_name;
+	int ret;
+
+	np = hba->dev->of_node;
+	if (!np)
+		return -ENOENT;
+
+	ice_np = of_get_next_available_child(np, NULL);
+	if (!ice_np)
+		return -ENOENT;
+
+	/* Only 1 algo can be enabled, pick the first */
+	host->ice_conf = of_get_next_available_child(ice_np, NULL);
+	if (!host->ice_conf) {
+		/* No overrides, use floor based as default */
+		host->chosen_algo = FLOOR_BASED_ALG2;
+		dev_info(hba->dev, "Resort to default ice alg2\n");
+		return 0;
+	}
+
+	ret = of_property_read_string(host->ice_conf, "alg-name", &alg_name);
+	if (ret < 0)
+		return ret;
+
+	if (!strcmp(alg_name, "alg1"))
+		host->chosen_algo = STATIC_ALLOC_ALG1;
+	else if (!strcmp(alg_name, "alg2"))
+		host->chosen_algo = FLOOR_BASED_ALG2;
+	else if (!strcmp(alg_name, "alg3"))
+		host->chosen_algo = INSTANTANEOUS_ALG3;
+	else {
+		dev_err(hba->dev, "Failed to find a valid ice alg name\n");
+		ret = -ENODATA;
+	}
+
+	return ret;
+}
+
+static int ufs_qcom_config_ice(struct ufs_qcom_host *host)
+{
+	if (!is_ice_config_supported(host))
+		return 0;
+
+	switch (host->chosen_algo) {
+	case STATIC_ALLOC_ALG1:
+		return ufs_qcom_ice_config_alg1(host->hba);
+	case FLOOR_BASED_ALG2:
+		return ufs_qcom_ice_config_alg2(host->hba);
+	case INSTANTANEOUS_ALG3:
+		return ufs_qcom_ice_config_alg3(host->hba);
+	}
+
+	return -EINVAL;
+}
+
+static int ufs_qcom_ice_config_init(struct ufs_qcom_host *host)
+{
+	struct ufs_hba *hba = host->hba;
+	int ret;
+
+	if (!is_ice_config_supported(host))
+		return 0;
+
+	ret = ufs_qcom_parse_ice_config(hba);
+	if (!ret)
+		dev_dbg(hba->dev, "ice config initialization success!!");
+
+	return ret;
+}
 
 static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
 {
@@ -117,6 +328,7 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 	struct ufs_hba *hba = host->hba;
 	struct device *dev = hba->dev;
 	struct qcom_ice *ice;
+	int ret;
 
 	ice = of_qcom_ice_get(dev);
 	if (ice == ERR_PTR(-EOPNOTSUPP)) {
@@ -130,6 +342,10 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 	host->ice = ice;
 	hba->caps |= UFSHCD_CAP_CRYPTO;
 
+	ret = ufs_qcom_ice_config_init(host);
+	if (ret)
+		dev_info(dev, "Continue with default ice configuration\n");
+
 	return 0;
 }
 
@@ -196,6 +412,12 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
 {
 	return 0;
 }
+
+static int ufs_qcom_config_ice(struct ufs_qcom_host *host)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -435,6 +657,11 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
 		err = ufs_qcom_enable_lane_clks(host);
 		break;
 	case POST_CHANGE:
+		err = ufs_qcom_config_ice(host);
+		if (err) {
+			dev_err(hba->dev, "failed to configure ice, ret=%d\n", err);
+			break;
+		}
 		/* check if UFS PHY moved from DISABLED to HIBERN8 */
 		err = ufs_qcom_check_hibern8(hba);
 		ufs_qcom_enable_hw_clk_gating(hba);
@@ -914,12 +1141,17 @@ static void ufs_qcom_set_host_params(struct ufs_hba *hba)
 
 static void ufs_qcom_set_caps(struct ufs_hba *hba)
 {
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
 	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
 	hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
 	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
 	hba->caps |= UFSHCD_CAP_WB_EN;
 	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
+
+	if (host->hw_ver.major >= 0x5)
+		host->caps |= UFS_QCOM_CAP_ICE_CONFIG;
 }
 
 /**
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index b9de170983c9..6884408eb807 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -195,8 +195,11 @@ struct ufs_qcom_host {
 
 #ifdef CONFIG_SCSI_UFS_CRYPTO
 	struct qcom_ice *ice;
+	struct device_node *ice_conf;
+	int chosen_algo;
 #endif
-
+	#define UFS_QCOM_CAP_ICE_CONFIG BIT(4)
+	u32 caps;
 	void __iomem *dev_ref_clk_ctrl_mmio;
 	bool is_dev_ref_clk_enabled;
 	struct ufs_hw_version hw_ver;
@@ -226,6 +229,39 @@ ufs_qcom_get_debug_reg_offset(struct ufs_qcom_host *host, u32 reg)
 	return UFS_CNTLR_3_x_x_VEN_REGS_OFFSET(reg);
 };
 
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+static inline bool is_ice_config_supported(struct ufs_qcom_host *host)
+{
+	return (host->caps & UFS_QCOM_CAP_ICE_CONFIG);
+}
+
+/* Algorithm Selection */
+#define STATIC_ALLOC_ALG1 0x0
+#define FLOOR_BASED_ALG2 BIT(0)
+#define INSTANTANEOUS_ALG3 BIT(1)
+
+enum {
+	REG_UFS_MEM_ICE_NUM_AES_CORES = 0x2608,
+	REG_UFS_MEM_ICE_CONFIG = 0x260C,
+	REG_UFS_MEM_ICE_ALG1_NUM_CORE = 0x2610,
+	REG_UFS_MEM_ICE_ALG2_NUM_CORE_0 = 0x2614,
+	REG_UFS_MEM_ICE_ALG3_NUM_CORE = 0x2664,
+};
+
+#define ICE_ALG2_NAME_LEN 3
+#define ICE_ALG2_NUM_PARAMS 6
+
+struct ice_alg2_config {
+	/* group names */
+	char name[ICE_ALG2_NAME_LEN];
+	/*
+	 * num_core_tx_stream, num_core_rx_stream, num_wr_task_max,
+	 * num_wr_task_min, num_rd_task_max, num_rd_task_min
+	 */
+	unsigned int val[ICE_ALG2_NUM_PARAMS];
+};
+#endif
+
 #define ufs_qcom_is_link_off(hba) ufshcd_is_link_off(hba)
 #define ufs_qcom_is_link_active(hba) ufshcd_is_link_active(hba)
 #define ufs_qcom_is_link_hibern8(hba) ufshcd_is_link_hibern8(hba)
-- 
2.46.0


