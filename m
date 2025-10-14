Return-Path: <linux-arm-msm+bounces-77129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C0BD8751
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8B541921969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A19E2DCF6B;
	Tue, 14 Oct 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BIMlOTYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75155220686;
	Tue, 14 Oct 2025 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760434529; cv=none; b=uaZAo/jnP+RGEGSZgUWEebOE7AHbpafMWpW6vnqDNnRqqq0uK6yDGcgO8OjMMLm3sWCjtmfbNS26cOuKyCXOwrQVKCmfA77rWK8gW0LAaZ13i+BLhUSz3J4uPkVv2Pyu+m8aRfungJPghNdysrNzUxwxLpkiob3NFuMrWjn64Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760434529; c=relaxed/simple;
	bh=GuQ54ODu9//BJjdnvCRH0dn2X7XjPaIlXtYArHSP/A0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L79NlEUrYFhnne8UCKnaBBZsrq37aT98Hj8tAaBqRfgF8wiyaYZaoHvuimBsKN0PQ009u9SlY/gm6Jm268SuzRWTKL2B2/FA65P4pE0j3IMN51zUOXS+meCY4aYeMZX3MDUxLQczILT/EanIPYBkTkkySHQPmuD3u/QLYRQOkD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BIMlOTYQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87JoO009033;
	Tue, 14 Oct 2025 09:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3Lfr46/bHGYmycDON9ZRmS
	WGaeBc7VJJ0ctQkrOvUfQ=; b=BIMlOTYQg5+FFUcKonrlmN4g7y3ZSkZn8YmVpQ
	XRmTu/kUTpjZZL+MhuSAGQUf6ckrqfHVMfPU/0ln7FvFCOHNE2Y9DWfDMi8ybbx0
	tMtlRb5yWq4ApYbvnhVobEy7VsLvCGno/uLZbXZXXVdwAt4Z5cK89c+OvgM6hvTV
	taQyUzI0Fwnggc5eSAfuAnbMu7hPM/sVXNEH1CO/AHLdO3E2cYvQlUnVo5iEPa1H
	HzmuTEe6408t0iKkEeENkiJs8cdMvzLe+J3JxfLn5uQ0sI8aU+fYS7SNnnSH/bp8
	rtDIQbWs1FBEJ020xFBRThO1h+4PjmRUOKI/EuKZN9w6kLHA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5fy76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 09:35:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59E9ZNie002169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 09:35:23 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 14 Oct 2025 02:35:20 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_varada@quicinc.com>
CC: <quic_mdalam@quicinc.com>
Subject: [PATCH v2] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC devices
Date: Tue, 14 Oct 2025 15:05:03 +0530
Message-ID: <20251014093503.347678-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MM6qS4JsyrCsJpeZLTEHWyQwCXS_IYD3
X-Proofpoint-ORIG-GUID: MM6qS4JsyrCsJpeZLTEHWyQwCXS_IYD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX6pMinX5+s8u2
 i4iTRAt64UFqfWvfUGvSIC6q9a+JIqKgVZpjXvzBbsR5woJbUGl/03Vaf+eU5+5jJPfufxYGel/
 X5XD4QfwRXikZG8a8wcrslENFBNSjzmBPcu/IyAPu7JPSvDxXh0O9k8uR78FMf6GX1HnOPerGx2
 6UyLe88eWLrc7EmQzAGsVBkVD4aMTiXP3n88wcn04G47cO5HtcU1lLt6wh45W3/g07CwEGiZe/1
 Od4pDva8pkQwZnTQjJoqdJJb0cYZcqJupBwKG1dVszaP5SLZ/Lp1KvKlO2KUvfmNPSnyAFZ8Tsx
 s7yHn+/OAte02EZHTOYMeNuuzoUjcYK2j9BXByMn1G55eAf2ALpgjd9r5xTvFp4lEBjnY+o3xEv
 O+P55xpe+U72BiBiMZQwEHSksbPatQ==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee195c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=r8Aa1-mRj13QdKicrusA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Enable Inline Crypto Engine (ICE) support for eMMC devices that operate
without Command Queue Engine (CQE).This allows hardware-accelerated
encryption and decryption for standard (non-CMDQ) requests.

This patch:
- Adds ICE register definitions for non-CMDQ crypto configuration
- Implements a per-request crypto setup via sdhci_msm_ice_cfg()
- Hooks into the request path via mmc_host_ops.request
- Initializes ICE hardware during CQE setup for compatible platforms

With this, non-CMDQ eMMC devices can benefit from inline encryption,
improving performance for encrypted I/O while maintaining compatibility
with existing CQE crypto support.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v2]

* Moved NONCQ_CRYPTO_PARM and NONCQ_CRYPTO_DUN register definitions into
  sdhci-msm.c

* Introduced use of GENMASK() and FIELD_PREP() macros for cleaner and more
  maintainable bitfield handling in ICE configuration.

* Removed redundant if (!mrq || !cq_host) check from sdhci_msm_ice_cfg()
  as both are guaranteed to be valid in the current call path.

* Added assignment of host->mmc_host_ops.request = sdhci_msm_request; to
  integrate ICE configuration into the standard request path for non-CMDQ
  eMMC devices.

* Removed sdhci_crypto_cfg() from sdhci.c and its invocation in sdhci_request()

Change in [v1]

* Added initial support for Inline Crypto Engine (ICE) on non-CMDQ eMMC
  devices.

 drivers/mmc/host/sdhci-msm.c | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..483aadaca262 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -157,6 +157,18 @@
 #define CQHCI_VENDOR_CFG1	0xA00
 #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
 
+/* non command queue crypto enable register*/
+#define NONCQ_CRYPTO_PARM		0x70
+#define NONCQ_CRYPTO_DUN		0x74
+
+#define DISABLE_CRYPTO			BIT(15)
+#define CRYPTO_GENERAL_ENABLE		BIT(1)
+#define HC_VENDOR_SPECIFIC_FUNC4	0x260
+#define ICE_HCI_SUPPORT			BIT(28)
+
+#define ICE_HCI_PARAM_CCI	GENMASK(7, 0)
+#define ICE_HCI_PARAM_CE	GENMASK(8, 8)
+
 struct sdhci_msm_offset {
 	u32 core_hc_mode;
 	u32 core_mci_data_cnt;
@@ -1885,6 +1897,48 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 
 #ifdef CONFIG_MMC_CRYPTO
 
+static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq,
+			     u32 slot)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_host *mmc = msm_host->mmc;
+	struct cqhci_host *cq_host = mmc->cqe_private;
+	unsigned int crypto_params = 0;
+	int key_index = 0;
+	bool bypass = true;
+	u64 dun = 0;
+
+	if (mrq->crypto_ctx) {
+		dun = mrq->crypto_ctx->bc_dun[0];
+		bypass = false;
+		key_index = mrq->crypto_key_slot;
+	}
+
+	crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, !bypass) |
+			FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
+
+	cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
+
+	if (mrq->crypto_ctx)
+		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
+
+	/* Ensure crypto configuration is written before proceeding */
+	wmb();
+
+	return 0;
+}
+
+static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+
+	if (mmc->caps2 & MMC_CAP2_CRYPTO)
+		sdhci_msm_ice_cfg(host, mrq, 0);
+
+	sdhci_request(mmc, mrq);
+}
+
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
 
 static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
@@ -2131,6 +2185,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
 	struct cqhci_host *cq_host;
 	bool dma64;
 	u32 cqcfg;
+	u32 config;
+	u32 ice_cap;
 	int ret;
 
 	/*
@@ -2185,6 +2241,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
 	if (ret)
 		goto cleanup;
 
+	/* Initialize ICE for non-CMDQ eMMC devices */
+	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
+	config &= ~DISABLE_CRYPTO;
+	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
+	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
+	if (ice_cap & ICE_HCI_SUPPORT) {
+		config = cqhci_readl(cq_host, CQHCI_CFG);
+		config |= CRYPTO_GENERAL_ENABLE;
+		cqhci_writel(cq_host, config, CQHCI_CFG);
+	}
+	sdhci_msm_ice_enable(msm_host);
+
 	dev_info(&pdev->dev, "%s: CQE init: success\n",
 			mmc_hostname(host->mmc));
 	return ret;
@@ -2759,6 +2827,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
 
+#ifdef CONFIG_MMC_CRYPTO
+	host->mmc_host_ops.request = sdhci_msm_request;
+#endif
 	/* Set the timeout value to max possible */
 	host->max_timeout_count = 0xF;
 
-- 
2.34.1


