Return-Path: <linux-arm-msm+bounces-37202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 314739BFFAA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 09:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE65F2831F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0681DC745;
	Thu,  7 Nov 2024 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nOENropn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5A51DB372;
	Thu,  7 Nov 2024 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730966725; cv=none; b=OR7gMfRodkU41jv8UrWOWzXkjNNNn0spRiCY7T7nCGlQj3IM0YtlDCO/1KkgtfSv9gCSQMsoYEdg1bnbZzApFXwkOO7VG83nmi9EvqTV4MFei3DvJjJf/PU4F9ZkSdhrM7StE/fa5fnrBqnBaxGK0OhKAVVH0xmB35MaJT8NCuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730966725; c=relaxed/simple;
	bh=+Qv4Z6158Iv+7BItSSfBSo/w9yMs1NxgL3uRJbM2cjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=HcAxrCdtB9RIiSuKIDKhVNPcnHEbPLNhUG1BtCyPBaqWcGao9BVMBwd9x8pAVunKLYGYE3oLJb6UWD1VQU0HSYRGNfHBnU8dHh3shKYGI+g45bypPq9wo0HjRE7nFfKZ2HfrxENUBTSrb5X9rPXo94xa1RXhfct8Quq4VYEg6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nOENropn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A71HEOr005306;
	Thu, 7 Nov 2024 08:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=MNn9gnfQccnQWE3qEzReoQ4ozshVH41Oucj/8xiR6Lc=; b=nO
	ENropnDKqLHTrBHMAZCNnWViyfAo5E1a/k72vD+BCmq9IOMYawtUMchOuRwNUC/R
	HdxgHZiyZpMaijq08wZ5c6hVNTgdQkOUpKNAE7ZuoXoZJUsnJMcazWAdEoJo/MTn
	P6hZ4CcA2M32mnXag/5fjfn9vGES8/iLtfSZUnfmd5jATwouQkiDHAyJftgf/G1p
	Tf+tfV4CyflFvLCKiUXNajvRTZlMNXOpBM/WUEZKKh0hs7RaBCMUqpLWGCmMwgNw
	akcP56rLv+Y7QKOD7XN6/YEq4cDSKCqwLfKJqVw1ZtmpjvP1BhWj00K8nsv8fsOW
	YE93ojAWREWSL40W71Cg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qvg3vf9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 08:05:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A785G1d004533;
	Thu, 7 Nov 2024 08:05:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42nd5mu5nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 07 Nov 2024 08:05:16 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A785DfI004498;
	Thu, 7 Nov 2024 08:05:15 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4A785FUa004527;
	Thu, 07 Nov 2024 08:05:15 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id E2F105013D2; Thu,  7 Nov 2024 13:35:14 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_narepall@quicinc.com, kernel@quicinc.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V1 3/3] mmc: sdhci-msm: Limit HS mode frequency to 37.5MHz
Date: Thu,  7 Nov 2024 13:35:05 +0530
Message-Id: <20241107080505.29244-4-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
References: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LkANyD9lYgCDZA9MYRePx1y3Fhq-FenZ
X-Proofpoint-GUID: LkANyD9lYgCDZA9MYRePx1y3Fhq-FenZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070060
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

For Qualcomm SoCs with level shifter delays are seen on receivers data
path due to latency added by level shifter.

To bring these delays in normal range and avoid CMD CRC errors
reduce frequency for HS mode SD cards to 37.5MHz for targets which has
level shifter.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 16325c21de52..5e1dc06c4707 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -138,6 +138,8 @@
 /* Max load for eMMC Vdd-io supply */
 #define MMC_VQMMC_MAX_LOAD_UA	325000
 
+#define LEVEL_SHIFTER_HIGH_SPEED_FREQ	37500000
+
 #define msm_host_readl(msm_host, host, offset) \
 	msm_host->var_ops->msm_readl_relaxed(host, offset)
 
@@ -287,6 +289,7 @@ struct sdhci_msm_host {
 	bool use_cdr;
 	u32 transfer_mode;
 	bool updated_ddr_cfg;
+	bool uses_level_shifter;
 	bool uses_tassadar_dll;
 	u32 dll_config;
 	u32 ddr_config;
@@ -366,6 +369,11 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 
 	mult = msm_get_clock_mult_for_bus_mode(host);
 	desired_rate = clock * mult;
+
+	if (curr_ios.timing == MMC_TIMING_SD_HS && desired_rate == 50000000
+		&& msm_host->uses_level_shifter)
+		desired_rate = LEVEL_SHIFTER_HIGH_SPEED_FREQ;
+
 	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
 	if (rc) {
 		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
@@ -2372,6 +2380,8 @@ static inline void sdhci_msm_get_of_property(struct platform_device *pdev,
 
 	of_property_read_u32(node, "qcom,dll-config", &msm_host->dll_config);
 
+	msm_host->uses_level_shifter = of_property_read_bool(node, "qcom,use-level-shifter");
+
 	if (of_device_is_compatible(node, "qcom,msm8916-sdhci"))
 		host->quirks2 |= SDHCI_QUIRK2_BROKEN_64_BIT_DMA;
 }
-- 
2.17.1


