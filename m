Return-Path: <linux-arm-msm+bounces-83381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 534EFC884D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 07:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5A3FE356125
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 06:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4D930CDA4;
	Wed, 26 Nov 2025 06:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XZmc4rU6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8C23126D4;
	Wed, 26 Nov 2025 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764139403; cv=none; b=HZxkSwDdul5fDqjTY3jAenR9C1Bw1u6L3y7UDMsiBwmo+rU1C7+swwgiQtUP88PlJw90AnqLHYk1YgJfPf2mjORI70OHu16TUaG6nXMWyDEqGBSOC4QLoqLzzG7f7+MYR1hUB+JcXc+rxbjg0R7VrWkrHunYneU0Vpg9bwI4nvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764139403; c=relaxed/simple;
	bh=kmKsnZpFmEl6BUWq+YciP0YejMR7MApvaXYd8yMllik=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sJDf410krx3CNtVXQFdr73FtmfuMWR+lXcAPqS12KCCGaWQCmzYdkY8D5XS2PyodBakF5N8dmcK/ZgbLDXluhSw5W3mAKliloLJUrIJu5wuG+JupDTUAwuEqQPRqf0rDQ0xNRNw9azR2NKUVneOFYPBmRFrQqXn37+mXrS6I+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XZmc4rU6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ52wxA2726797;
	Wed, 26 Nov 2025 06:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6lRzbzAne2eodyVs4ztJeD
	MaNBKrvZMbavDV0LKHBPk=; b=XZmc4rU6iiXZY8zMACsoKLIO/ABuze9+Ev/0m5
	kUsFgA+Wj7W7sQ7veyIEFd30O43rO135Ip4KqhGAOEilPt2bhqBuJWDXOEO2ha4p
	tGbBTXD94JUrftahsn9llcwNaoRYhHG7UhWvieLDtI+MB7yS5PDRdeSy1aqTehrv
	KpYL3Jiqwgif3FMAjjjcGg/pt8xGXUtkIy3ZvCuFMHRrZ9TcilBH+IJbAU6KUAAN
	Hwz2zTQpgQGPw4vpbdN0k0yunSzcHMxnT3Z4c03bBSyZK30NvNOSlEK7j6pWXkl7
	NTPZ0sGldGzFq3Qd2Jyw8RmLoy7brNCHzeNBv277dVwTDyCA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an8rvuevn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 06:43:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AQ6hESm032106
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 06:43:14 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 25 Nov 2025 22:43:11 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <abel.vesa@linaro.org>,
        <ebiggers@kernel.org>
Subject: [PATCH v6] mmc: sdhci-msm: Enable ICE for CQE-capable controllers with non-CQE cards
Date: Wed, 26 Nov 2025 12:12:51 +0530
Message-ID: <20251126064251.1928529-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CJVqr-JiKHHL38SMHLvniMKDyJzjz7ct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA1MyBTYWx0ZWRfX3lxRAOMJWaLw
 CSVJ5ZBtFSyCBgQGBOpDJlW6emTXLbtSo7KktP1EoFmB8QDhQmcrzqUl6ujwnvk87MRqbwrNWvq
 WP/0fmt/Ju/+jXF+lkVROrbc1RJzSLuW3koGRghu+/UMgIPSCFp/TcCPgI7FPvG9ntroRXmfhf4
 EMI3iIY/j7HzWlttinuf4J628FR9gcDCylrwdyhK1D2ScYBV0cZVV0Wqnl3ocJtTmyWjQlG57wh
 mcpIG/K66M6+/k/5mwnYergKZ1uyi1f7pCiY+32jDCvcWt++Foav6OMP5JDauwqrSqhnR7yQFiv
 kEta/rS/8gBYfKmdonTj+CHv7Uvgj253ADzrvyYMJRPG/GJVDJ4nhESP29TXkfLwVgLudKGusVM
 KIYSCMNHSuXgv03JoLlxeSUDPY52NA==
X-Proofpoint-GUID: CJVqr-JiKHHL38SMHLvniMKDyJzjz7ct
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=6926a183 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=VFLTqZJuPoDEIE11KTgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260053

Enable Inline Crypto Engine (ICE) support for CQE-capable sdhci-msm
controllers when used with eMMC cards that do not support CQE.

This addresses the scenario where:
- The host controller supports CQE (and has CQHCI crypto infrastructure)
- The eMMC card does not support CQE
- Standard (non-CMDQ) requests need crypto support

This allows hardware-accelerated encryption and decryption for standard
requests on CQE-capable hardware by utilizing the existing CQHCI crypto
register space even when CQE functionality is not available due to card
limitations.

The implementation:
- Adds ICE register definitions for non-CQE crypto configuration
- Implements per-request crypto setup via sdhci_msm_ice_cfg()
- Hooks into the request path via mmc_host_ops.request for non-CQE requests
- Uses CQHCI register space (NONCQ_CRYPTO_PARM/DUN) for crypto configuration

With this, CQE-capable controllers can benefit from inline encryption
when paired with non-CQE cards, improving performance for encrypted I/O
while maintaining compatibility with existing CQE crypto support.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---

Change in [v6]

* Changed the variable name from ice_init_done to non_cqe_ice_init_done

* Eliminated the ICE_HCI_SUPPORT check inside the sdhci_msm_non_cqe_ice_init()
  function

* Updated the sdhci_msm_ice_cfg() function to use a void return type instead
  of int

* Removed the crypto_enable and dun variables from the sdhci_msm_ice_cfg()
  function

* Revised the comment associated with the sdhci_msm_request() function

Change in [v5]

* Removed unused variable

* Added proper comment for sdhci_msm_request()

* Removed sdhci_msm_ice_enable(); it is already invoked during resume

Change in [v4]

* Moved ICE initialization for non cmdq into sdhci_msm_ice_cfg() and made
  it conditional on mrq->crypto_ctx to enable lazy setup.

* Added msm_host->ice_init_done guard to prevent redundant initialization.

* Updated commit message

Change in [v3]

* Refactored logic to use separate code paths for crypto_ctx != NULL and
  crypto_ctx == NULL to improve readability.

* Renamed bypass to crypto_enable to align with bitfield semantics.

* Removed slot variable

* Added ICE initialization sequence for non-CMDQ eMMC devices before
  __sdhci_add_host()

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

 drivers/mmc/host/sdhci-msm.c | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 3b85233131b3..da356627d9de 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -157,6 +157,17 @@
 #define CQHCI_VENDOR_CFG1	0xA00
 #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
 
+/* non command queue crypto enable register*/
+#define NONCQ_CRYPTO_PARM		0x70
+#define NONCQ_CRYPTO_DUN		0x74
+
+#define DISABLE_CRYPTO			BIT(15)
+#define CRYPTO_GENERAL_ENABLE		BIT(1)
+#define HC_VENDOR_SPECIFIC_FUNC4	0x260
+
+#define ICE_HCI_PARAM_CCI	GENMASK(7, 0)
+#define ICE_HCI_PARAM_CE	GENMASK(8, 8)
+
 struct sdhci_msm_offset {
 	u32 core_hc_mode;
 	u32 core_mci_data_cnt;
@@ -300,6 +311,7 @@ struct sdhci_msm_host {
 	u32 dll_config;
 	u32 ddr_config;
 	bool vqmmc_enabled;
+	bool non_cqe_ice_init_done;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -2012,6 +2024,68 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
 	return qcom_ice_evict_key(msm_host->ice, slot);
 }
 
+static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_host *mmc = msm_host->mmc;
+	struct cqhci_host *cq_host = mmc->cqe_private;
+	u32 config;
+
+	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
+	config &= ~DISABLE_CRYPTO;
+	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
+	config = cqhci_readl(cq_host, CQHCI_CFG);
+	config |= CRYPTO_GENERAL_ENABLE;
+	cqhci_writel(cq_host, config, CQHCI_CFG);
+}
+
+static void sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_host *mmc = msm_host->mmc;
+	struct cqhci_host *cq_host = mmc->cqe_private;
+	unsigned int crypto_params = 0;
+	int key_index;
+
+	if (mrq->crypto_ctx) {
+		if (!msm_host->non_cqe_ice_init_done) {
+			sdhci_msm_non_cqe_ice_init(host);
+			msm_host->non_cqe_ice_init_done = true;
+		}
+
+		key_index = mrq->crypto_key_slot;
+		crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, 1) |
+				FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
+
+		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
+		cqhci_writel(cq_host, lower_32_bits(mrq->crypto_ctx->bc_dun[0]),
+			     NONCQ_CRYPTO_DUN);
+	} else {
+		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
+	}
+
+	/* Ensure crypto configuration is written before proceeding */
+	wmb();
+}
+
+/*
+ * Handle non-CQE MMC requests with ICE crypto support.
+ * Configures ICE registers before passing the request to
+ * the standard SDHCI handler.
+ */
+static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+
+	/* Only need to handle non-CQE crypto requests in this path */
+	if (mmc->caps2 & MMC_CAP2_CRYPTO)
+		sdhci_msm_ice_cfg(host, mrq);
+
+	sdhci_request(mmc, mrq);
+}
+
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
 	.keyslot_program	= sdhci_msm_ice_keyslot_program,
 	.keyslot_evict		= sdhci_msm_ice_keyslot_evict,
@@ -2762,6 +2836,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
 
+#ifdef CONFIG_MMC_CRYPTO
+	host->mmc_host_ops.request = sdhci_msm_request;
+#endif
 	/* Set the timeout value to max possible */
 	host->max_timeout_count = 0xF;
 
-- 
2.34.1


