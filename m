Return-Path: <linux-arm-msm+bounces-45783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00225A18EB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44C02160EB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 09:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED29210190;
	Wed, 22 Jan 2025 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DTPX4dLb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65062045B8;
	Wed, 22 Jan 2025 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539275; cv=none; b=V7u1LfA+SeYZvRMM9kTxmU+ZFQVb2ZXqNYq2CkKC+Jb0VHjwyZh6umBzu7yLipdUxWzIrMnYGRwsX4A9fbnPHqViu/FNOtCwbGWx6OCH1QExmM3aYmkkX3oC3biPt+AD+PcQ/DXjTGYtJNFzBVgYVuKhROCc4cIuaPa+2fkJO5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539275; c=relaxed/simple;
	bh=6MQTm0M+4JRN14R2eEGNkVlhwNA6fJMYo9T+BuvkwLU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aj91igv6T7yI9Ddk4x/FBytE/X9Ao6xMFMJCxIJG86QgJvv6eqtNb3RaManJObu2sDdPGblVg5qvjrt3HgvhQOEChn85oWgzxnwQgbvslwRan3NX3/k8z886kIyij2cIbWNLcgR9u484VNySPPUgEdOacwLKANDvMt2bezUIv9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DTPX4dLb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M50qjZ028601;
	Wed, 22 Jan 2025 09:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x0hjGoAlxes+TCXc/ILkT4sj
	QR0wC/aPxjbcWnB/3mI=; b=DTPX4dLbS7p03atc9cNCBgT/QDuhHQg6f81LGVnR
	MjvNeb+Se8wlk1xTRq4AEI8MzYYAwKvfCBs3RAlZQNX6wrbjZAb7quXHl3p3/Lvx
	VwHZ9AAyqt6cOnGHXP/eBPW8vlNt577wXWoIgBPqHq1cEffyTKoXyaE3VvUh07l3
	isK0S67ZVp244XHbcISXVgDBkZAboT3YAe6SFwdlBt9IobHfRiJop/xmLmG9epom
	OdaZ0umxOYdJuSV1I/3i/RjIvtb/OIbtNvSHQjZ0HmO1oZmw61KzmtpcOihqUgvj
	yALCvQ3Zv/ds+Abe/2sGcix9jxpDkGTTpr22FV/kkq6RRw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44at5dgnch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M9lkAC011432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:46 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 Jan 2025 01:47:40 -0800
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_sachgupt@quicinc.com>,
        <quic_sartgarg@quicinc.com>
Subject: [PATCH V3 3/4] mmc: sdhci-msm: Add Device tree parsing logic for DLL settings
Date: Wed, 22 Jan 2025 15:17:06 +0530
Message-ID: <20250122094707.24859-4-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: y0dLewZrzgBIgPzxfH6XQbnPM8oUwb7l
X-Proofpoint-GUID: y0dLewZrzgBIgPzxfH6XQbnPM8oUwb7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220071

This update introduces the capability to configure HS200
and HS400 DLL settings via the device tree and parsing it.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 86 ++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 2a5e588779fc..cc7756a59c55 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -256,6 +256,19 @@ struct sdhci_msm_variant_info {
 	const struct sdhci_msm_offset *offset;
 };
 
+/*
+ * DLL registers which needs be programmed with HSR settings.
+ * Add any new register only at the end and don't change the
+ * sequence.
+ */
+struct sdhci_msm_dll {
+	u32 dll_config[2];
+	u32 dll_config_2[2];
+	u32 dll_config_3[2];
+	u32 dll_usr_ctl[2];
+	u32 ddr_config[2];
+};
+
 struct sdhci_msm_host {
 	struct platform_device *pdev;
 	void __iomem *core_mem;	/* MSM SDCC mapped address */
@@ -264,6 +277,7 @@ struct sdhci_msm_host {
 	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
 	/* core, iface, cal and sleep clocks */
 	struct clk_bulk_data bulk_clks[4];
+	struct sdhci_msm_dll dll;
 #ifdef CONFIG_MMC_CRYPTO
 	struct qcom_ice *ice;
 #endif
@@ -292,6 +306,7 @@ struct sdhci_msm_host {
 	u32 dll_config;
 	u32 ddr_config;
 	bool vqmmc_enabled;
+	bool artanis_dll;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -2400,6 +2415,74 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
 	return ret;
 }
 
+static int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
+				  u32 **bw_vecs, int *len)
+{
+	struct device_node *np = dev->of_node;
+	u32 *arr = NULL;
+	int ret = 0;
+	int sz;
+
+	if (!np)
+		return -ENODEV;
+
+	if (!of_get_property(np, prop_name, &sz))
+		return -EINVAL;
+
+	sz = sz / sizeof(*arr);
+	if (sz <= 0)
+		return -EINVAL;
+
+	arr = devm_kzalloc(dev, sz * sizeof(*arr), GFP_KERNEL);
+	if (!arr)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(np, prop_name, arr, sz);
+	if (ret) {
+		dev_err(dev, "%s failed reading array %d\n", prop_name, ret);
+		*len = 0;
+		return ret;
+	}
+
+	*bw_vecs = arr;
+	*len = sz;
+	ret = 0;
+
+	return ret;
+}
+
+static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
+{
+	int dll_table_len, dll_reg_count;
+	u32 *dll_table = NULL;
+	int i;
+
+	msm_host->artanis_dll = false;
+
+	if (sdhci_msm_dt_get_array(dev, "qcom,dll-hsr-list",
+				   &dll_table, &dll_table_len))
+		return -EINVAL;
+
+	dll_reg_count = sizeof(struct sdhci_msm_dll) / sizeof(u32);
+
+	if (dll_table_len != dll_reg_count) {
+		dev_err(dev, "Number of HSR entries are not matching\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < 2; i++) {
+		msm_host->dll.dll_config[i] = dll_table[i];
+		msm_host->dll.dll_config_2[i] = dll_table[i + 1];
+		msm_host->dll.dll_config_3[i] = dll_table[i + 2];
+		msm_host->dll.dll_usr_ctl[i] = dll_table[i + 3];
+		msm_host->dll.ddr_config[i] = dll_table[i + 4];
+	}
+
+	msm_host->artanis_dll = true;
+
+	return 0;
+}
+
 static int sdhci_msm_probe(struct platform_device *pdev)
 {
 	struct sdhci_host *host;
@@ -2446,6 +2529,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
 
+	if (sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host))
+		goto pltfm_free;
+
 	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
 	if (ret)
 		goto pltfm_free;
-- 
2.17.1


