Return-Path: <linux-arm-msm+bounces-82490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CB5C6E51E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 12:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 2F5FF2D07C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91163538AC;
	Wed, 19 Nov 2025 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ElfO5cdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C307A2D6612;
	Wed, 19 Nov 2025 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552854; cv=none; b=AT9m51/vGh4OS456LJ2iBnW5ZRWFmWBh5sVxbD6IMQAHVo3k2MIYbdP4dLTK5Iq0karXyXQ958L4wvu/01nLl3nCBVhpRVyZNQyZ7DcJHXf8gpCSuGY/iAKE80Y2OEA8K11XK9o2BANhBRG1ZLxUjy3PK4CnbS4TXJZIMeoETJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552854; c=relaxed/simple;
	bh=ite0V2+AT8K1B5e1nErWE2jj4cZ3tFTKcHcds6qzNh8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pltfdXRWAlnU2CfWf1Kb9QJtqJ48iFn0J1wYS6sMtc/tf82VRzTMDHyPPBZN9IkTKjNN5RxfnAKLfQeglePXRPgAciC8vzyQ9zSLnAdUQlNci6fivYFoLMFaE984VWdj2qUxvoJLgd9UN+Df8rDLUxwxJCPgmtbyWaITszDht4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ElfO5cdw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJBRcVI840101;
	Wed, 19 Nov 2025 11:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rz5D3c/zwaB2OO2v62K6Cf
	LaBJtGA5IiqpsA4nuiytU=; b=ElfO5cdwZFO1DaTr6zp2F030sUhpAifpdtENDV
	sxR62s9vBESLJ+nCgEABC41yFrASJ+ol7s51y5J/FkPsyLv5xCbeTCXH9clgVL9r
	VwNHKqHdvCNM57227PK7MBQt9gmDHiWBfl9kjnZ29FbmXvHjrheWxh1aYrMfqfX5
	lV6rLsdyMf67vcr0sQAbb6aY0JetLYNW1Pc/vjQryI7DVMvEnOEVx1o4pnRx0hF+
	27T73dJgN4Be4nWAWCSGAvfnuX5i+jN+btOHHkiDu5R5PwrODWmTuyTt9FcGmwpu
	5msH6eU+33m6jw65oLcR0f1lVtAw6xwf1Gp9j8AY1YLNBJjg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6fg9bvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 11:47:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AJBlQl2026192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 11:47:26 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 19 Nov 2025 03:47:22 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <abel.vesa@linaro.org>, <ebiggers@google.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_mdalam@quicinc.com>
Subject: [PATCH v5] mmc: sdhci-msm: Enable ICE for CQE-capable controllers with non-CQE cards
Date: Wed, 19 Nov 2025 17:16:53 +0530
Message-ID: <20251119114653.751992-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LNJkxqjwwuy5VY0D3b0ontuoojNjXHoy
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=691dae4f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=raka8JUDq7p2293nCkMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA5MyBTYWx0ZWRfX/VfKmYOuFhoi
 NekxdKmA8KaA2FC7aTs/cvYehLVOlQraOkaOwK+1qFCk0KM5kfyXUQMY9i1zC1Qv0qDcUCTu1CD
 zRlokWf6aumhxXf+rH7vceu3G8t8o7rFIXZpWn8F+Utp10CfDQ9Zodow50+HpOIAIu0f9c71sF9
 q/CAr4/ViGGpm3lngb9cVeAhXnGdWG/5B+ZsRGkP1Om3z1tlg4YShcM/dI+K0Ti+Q2tDKs03po6
 wVo9AHlkCW64yNu5Dkh7FiUppniNVfs1JZhdd98GIkqFRU5495hAwbYzpaWi285gnbtIR9pFbLt
 y0vWpCIhsBI0c5Lhth/PL4dH/odxqwditWtr3ogS3VL3dmhcGbzDIUhXqN5ZgCUz9+m83uBZoMC
 Q4RFvuy5ZL3/o8ljBwqCTp6TBsi2mA==
X-Proofpoint-ORIG-GUID: LNJkxqjwwuy5VY0D3b0ontuoojNjXHoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190093

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

 drivers/mmc/host/sdhci-msm.c | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..69c67242519c 100644
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
@@ -300,6 +312,7 @@ struct sdhci_msm_host {
 	u32 dll_config;
 	u32 ddr_config;
 	bool vqmmc_enabled;
+	bool ice_init_done;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -2009,6 +2022,91 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
 	return qcom_ice_evict_key(msm_host->ice, slot);
 }
 
+static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_host *mmc = msm_host->mmc;
+	struct cqhci_host *cq_host = mmc->cqe_private;
+	u32 config;
+	u32 ice_cap;
+
+	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
+	config &= ~DISABLE_CRYPTO;
+	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
+	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
+	if (ice_cap & ICE_HCI_SUPPORT) {
+		config = cqhci_readl(cq_host, CQHCI_CFG);
+		config |= CRYPTO_GENERAL_ENABLE;
+		cqhci_writel(cq_host, config, CQHCI_CFG);
+	}
+}
+
+static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_host *mmc = msm_host->mmc;
+	struct cqhci_host *cq_host = mmc->cqe_private;
+	unsigned int crypto_params = 0;
+	int key_index;
+	bool crypto_enable;
+	u64 dun = 0;
+
+	if (mrq->crypto_ctx) {
+		if (!msm_host->ice_init_done) {
+			sdhci_msm_non_cqe_ice_init(host);
+			msm_host->ice_init_done = true;
+		}
+
+		crypto_enable = true;
+		dun = mrq->crypto_ctx->bc_dun[0];
+		key_index = mrq->crypto_key_slot;
+		crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, crypto_enable) |
+				FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
+
+		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
+		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
+	} else {
+		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
+	}
+
+	/* Ensure crypto configuration is written before proceeding */
+	wmb();
+
+	return 0;
+}
+
+/*
+ * sdhci_msm_request - Handle non-CQE MMC requests with crypto support
+ * @mmc: MMC host
+ * @mrq: MMC request
+ *
+ * This function is called for non-CQE requests only. The MMC block layer
+ * routes requests as follows:
+ *
+ * if (host->cqe_enabled)
+ *     ret = mmc_blk_cqe_issue_rw_rq(mq, req);  // → cqhci_request()
+ * else
+ *     ret = mmc_blk_mq_issue_rw_rq(mq, req);   // → sdhci_msm_request()
+ *
+ * For CQE requests, crypto is handled in cqhci_request() in
+ * drivers/mmc/host/cqhci-core.c using the existing CQE crypto infrastructure.
+ *
+ * For non-CQE requests, this function provides crypto support by configuring
+ * the ICE (Inline Crypto Engine) registers before passing the request to
+ * the standard SDHCI request handler.
+ */
+static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+
+	if (mmc->caps2 & MMC_CAP2_CRYPTO)
+		sdhci_msm_ice_cfg(host, mrq);
+
+	sdhci_request(mmc, mrq);
+}
+
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
 	.keyslot_program	= sdhci_msm_ice_keyslot_program,
 	.keyslot_evict		= sdhci_msm_ice_keyslot_evict,
@@ -2759,6 +2857,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
 
+#ifdef CONFIG_MMC_CRYPTO
+	host->mmc_host_ops.request = sdhci_msm_request;
+#endif
 	/* Set the timeout value to max possible */
 	host->max_timeout_count = 0xF;
 
-- 
2.34.1


