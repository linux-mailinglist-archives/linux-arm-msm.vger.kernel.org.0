Return-Path: <linux-arm-msm+bounces-36285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FED99B4854
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51280282F4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 11:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284EC205E34;
	Tue, 29 Oct 2024 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YpVdRw8D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57177205E14;
	Tue, 29 Oct 2024 11:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730201459; cv=none; b=cZI9fF5jwE5n5o8vQ2WkWEStAJZ6MC6qa2pArzRWobtZk3Rx5OlgpX0rcki/6JG81JVe8n4MzUjIp5PkjBdNgZseYtl9gUt273tJ7m3mMLXnqREwB8WdoPy+in/v5BdcaJxWWPX+d0x8R6j/lWyFNFJ6qx8HSGILjEHlafMI124=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730201459; c=relaxed/simple;
	bh=6YG5Qc7BALHom98XDwbF4Z+IBIixgdbWaaLtifLrNVw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kcmAhX68TYccJvuK8FHTt3ATa6rTLhyWGgqyQVK1pD86ISqnmYLfAS59Ch8S41zIh4fOw5Cpa/D373jQIHXCTp/4IVu/55qQVUGEdoRaI9UpeF4y8854G2u/oF7o/3p5UQ0Mz3hQqS7PIDdjB69904WHXEoUc6CYhQuxkqRw8xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YpVdRw8D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T8gmWF017964;
	Tue, 29 Oct 2024 11:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mh9y55DnmCN3ZEYZSzJvG0OweooWa5rf9o860xxdZk8=; b=YpVdRw8Du8OTez3g
	79+s0I53w59Jz9xH2gcqMJObbl0duaWESH7ed/vgkjz71Rvzn4C8juTa55dCIJnn
	lnAkeSTdk/pqhwl763Piqdk3QdYhsR2b0fohd09IElpAsHhSIV317WzfFzjeo/w7
	SFlAkuQD0j96Fbpp8jyyJIfNRqFDT89LoxIRlq0P7QSOw7L1MwzzUA48s5BKi+SW
	xDq8N+v0pum1rRj30cWh7YGA52ypTDoCebod9WkFVRYxkxv3ukMdMmbEQe+Nkw/v
	ridopWlwxaHT7URpdlHvwGvcA2TN2N94ewj/zv/wZhBLOL0ft7mDbSdaN4nEF7+a
	QrMi2Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn50aac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:30:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TBUijM012197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:30:44 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Oct 2024 04:30:39 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        Can Guo
	<quic_cang@quicinc.com>
Subject: [PATCH V2 3/3] scsi: ufs: qcom: Add support for multiple ICE allocators
Date: Tue, 29 Oct 2024 17:00:03 +0530
Message-ID: <20241029113003.18820-4-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029113003.18820-1-quic_rdwivedi@quicinc.com>
References: <20241029113003.18820-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mowCTvR1e9b1K8gvKI-QQdkd4bQvPHuL
X-Proofpoint-ORIG-GUID: mowCTvR1e9b1K8gvKI-QQdkd4bQvPHuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290089

Add support for ICE allocators for Qualcomm UFS V5.0 and above, which
uses a pool of crypto cores for TX stream (UFS Write – Encryption)
and RX stream (UFS Read – Decryption).

Using these allocators, crypto cores can be dynamically allocated
to either RX stream or TX stream based on allocator selected.
Qualcomm UFS controller supports three ICE allocators:
Floor based allocator, Static allocator and Instantaneous allocator
to share crypto cores between TX and RX stream.

Floor Based allocator is selected by default after power On or Reset.

Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 228 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  38 +++++-
 2 files changed, 265 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 810e637047d0..27e71f9ce31e 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -105,6 +105,213 @@ static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
 }
 
 #ifdef CONFIG_SCSI_UFS_CRYPTO
+/*
+ * There're 10 sets of settings for floor-based allocations.
+ */
+static struct ufs_qcom_floor_based_config floor_based_config[] = {
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
+static inline void __get_floor_based_grp_params(unsigned int *val, int *c, int *t)
+{
+	*c = ((val[0] << 8) | val[1] | (1 << 31));
+	*t = ((val[2] << 24) | (val[3] << 16) | (val[4] << 8) | val[5]);
+}
+
+static inline void get_floor_based_grp_params(unsigned int group, int *core, int *task)
+{
+	struct ufs_qcom_floor_based_config *p = &floor_based_config[group];
+
+	 __get_floor_based_grp_params(p->val, core, task);
+}
+
+/**
+ * ufs_qcom_ice_config_static_alloc - Static ICE allocator
+ *
+ * @hba: host controller instance
+ * Return: zero for success and non-zero in case of a failure.
+ */
+static int ufs_qcom_ice_config_static_alloc(struct ufs_hba *hba)
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
+	ufshcd_writel(hba, STATIC_ALLOC, REG_UFS_MEM_ICE_CONFIG);
+
+	/*
+	 * DTS specifies the percent allocation to rx stream
+	 * Calculation -
+	 *  Num Tx stream = N_TOT - (N_TOT * percent of rx stream allocation)
+	 */
+	rx_aes = DIV_ROUND_CLOSEST(num_aes_cores * val, 100);
+	val = rx_aes | ((num_aes_cores - rx_aes) << 8);
+	ufshcd_writel(hba, val, REG_UFS_MEM_ICE_STATIC_ALLOC_NUM_CORE);
+
+	return 0;
+}
+
+/**
+ * ufs_qcom_ice_config_floor_based - Floor based ICE allocator
+ *
+ * @hba: host controller instance
+ * Return: zero for success and non-zero in case of a failure.
+ */
+static int ufs_qcom_ice_config_floor_based(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	unsigned int reg = REG_UFS_MEM_ICE_FLOOR_BASED_NUM_CORE_0;
+	/* 6 values for each group, refer struct ufs_qcom_floor_based_config */
+	unsigned int override_val[ICE_FLOOR_BASED_NUM_PARAMS];
+	char name[8] = {0};
+	int i, ret;
+
+	ufshcd_writel(hba, FLOOR_BASED, REG_UFS_MEM_ICE_CONFIG);
+	for (i = 0; i < ARRAY_SIZE(floor_based_config); i++) {
+		int core = 0, task = 0;
+
+		if (host->ice_conf) {
+			snprintf(name, sizeof(name), "g%d", i);
+			ret = of_property_read_variable_u32_array(host->ice_conf,
+								  name,
+								  override_val,
+								  ICE_FLOOR_BASED_NUM_PARAMS,
+								  ICE_FLOOR_BASED_NUM_PARAMS);
+			/* Some/All parameters may be overwritten */
+			if (ret > 0)
+				__get_floor_based_grp_params(override_val, &core,
+						      &task);
+			else
+				get_floor_based_grp_params(i, &core, &task);
+		} else {
+			get_floor_based_grp_params(i, &core, &task);
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
+ * ufs_qcom_ice_config_instantaneous - Instantaneous ICE allocator
+ *
+ * @hba: host controller instance
+ * Return: zero for success and non-zero in case of a failure.
+ */
+static int ufs_qcom_ice_config_instantaneous(struct ufs_hba *hba)
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
+	ufshcd_writel(hba, INSTANTANEOUS, REG_UFS_MEM_ICE_CONFIG);
+	ufshcd_writel(hba, config, REG_UFS_MEM_ICE_INSTANTANEOUS_NUM_CORE);
+
+	return 0;
+}
+
+static int ufs_qcom_parse_ice_allocator(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct device_node *np;
+	struct device_node *ice_np;
+	const char *allocator_name;
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
+	/* Only 1 config can be enabled, pick the first */
+	host->ice_conf = of_get_next_available_child(ice_np, NULL);
+	if (!host->ice_conf) {
+		/* No overrides, use floor based as default */
+		host->chosen_ice_allocator = FLOOR_BASED;
+		dev_info(hba->dev, "Resort to default ice floor based ice config\n");
+		return 0;
+	}
+
+	ret = of_property_read_string(host->ice_conf, "ice-allocator-name", &allocator_name);
+	if (ret < 0)
+		return ret;
+
+	if (!strcmp(allocator_name, "static-alloc"))
+		host->chosen_ice_allocator = STATIC_ALLOC;
+	else if (!strcmp(allocator_name, "floor-based"))
+		host->chosen_ice_allocator = FLOOR_BASED;
+	else if (!strcmp(allocator_name, "instantaneous"))
+		host->chosen_ice_allocator = INSTANTANEOUS;
+	else {
+		dev_err(hba->dev, "Failed to find a valid ice allocator\n");
+		ret = -ENODATA;
+	}
+
+	return ret;
+}
+
+static int ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
+{
+	if (!is_ice_config_supported(host))
+		return 0;
+
+	switch (host->chosen_ice_allocator) {
+	case STATIC_ALLOC:
+		return ufs_qcom_ice_config_static_alloc(host->hba);
+	case FLOOR_BASED:
+		return ufs_qcom_ice_config_floor_based(host->hba);
+	case INSTANTANEOUS:
+		return ufs_qcom_ice_config_instantaneous(host->hba);
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
+	ret = ufs_qcom_parse_ice_allocator(hba);
+	if (!ret)
+		dev_dbg(hba->dev, "ICE allocator initialization success!!");
+
+	return ret;
+}
 
 static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
 {
@@ -117,6 +324,7 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 	struct ufs_hba *hba = host->hba;
 	struct device *dev = hba->dev;
 	struct qcom_ice *ice;
+	int ret;
 
 	ice = of_qcom_ice_get(dev);
 	if (ice == ERR_PTR(-EOPNOTSUPP)) {
@@ -130,6 +338,10 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 	host->ice = ice;
 	hba->caps |= UFSHCD_CAP_CRYPTO;
 
+	ret = ufs_qcom_ice_config_init(host);
+	if (ret)
+		dev_info(dev, "Continue with default ice configuration\n");
+
 	return 0;
 }
 
@@ -196,6 +408,12 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
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
@@ -435,6 +653,11 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
 		err = ufs_qcom_enable_lane_clks(host);
 		break;
 	case POST_CHANGE:
+		err = ufs_qcom_config_ice_allocator(host);
+		if (err) {
+			dev_err(hba->dev, "failed to configure ice, ret=%d\n", err);
+			break;
+		}
 		/* check if UFS PHY moved from DISABLED to HIBERN8 */
 		err = ufs_qcom_check_hibern8(hba);
 		ufs_qcom_enable_hw_clk_gating(hba);
@@ -914,12 +1137,17 @@ static void ufs_qcom_set_host_params(struct ufs_hba *hba)
 
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
index b9de170983c9..7a462556b0c0 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -195,8 +195,11 @@ struct ufs_qcom_host {
 
 #ifdef CONFIG_SCSI_UFS_CRYPTO
 	struct qcom_ice *ice;
+	struct device_node *ice_conf;
+	int chosen_ice_allocator;
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
+/* Ice  Allocator Selection */
+#define STATIC_ALLOC 0x0
+#define FLOOR_BASED BIT(0)
+#define INSTANTANEOUS BIT(1)
+
+enum {
+	REG_UFS_MEM_ICE_NUM_AES_CORES = 0x2608,
+	REG_UFS_MEM_ICE_CONFIG = 0x260C,
+	REG_UFS_MEM_ICE_STATIC_ALLOC_NUM_CORE = 0x2610,
+	REG_UFS_MEM_ICE_FLOOR_BASED_NUM_CORE_0 = 0x2614,
+	REG_UFS_MEM_ICE_INSTANTANEOUS_NUM_CORE = 0x2664,
+};
+
+#define ICE_FLOOR_BASED_NAME_LEN 3
+#define ICE_FLOOR_BASED_NUM_PARAMS 6
+
+struct ufs_qcom_floor_based_config {
+	/* group names */
+	char name[ICE_FLOOR_BASED_NAME_LEN];
+	/*
+	 * num_core_tx_stream, num_core_rx_stream, num_wr_task_max,
+	 * num_wr_task_min, num_rd_task_max, num_rd_task_min
+	 */
+	unsigned int val[ICE_FLOOR_BASED_NUM_PARAMS];
+};
+#endif
+
 #define ufs_qcom_is_link_off(hba) ufshcd_is_link_off(hba)
 #define ufs_qcom_is_link_active(hba) ufshcd_is_link_active(hba)
 #define ufs_qcom_is_link_hibern8(hba) ufshcd_is_link_hibern8(hba)
-- 
2.46.0


