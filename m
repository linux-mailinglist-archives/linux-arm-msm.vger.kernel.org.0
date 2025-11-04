Return-Path: <linux-arm-msm+bounces-80225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7ADC2F755
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 07:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19D6E189C49F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 06:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3621F7098;
	Tue,  4 Nov 2025 06:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VyT54GP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B032227FB26;
	Tue,  4 Nov 2025 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762238471; cv=none; b=GnncfT+steR+PBEQrQSeU+HkLRPHNm4HuHs1tq9sj5REdh6ZvryAxtHM8+Q5cRCR8Rm/rGKRFf744VfpCOroeNUeQFC0xc+OsoFrrdu4JuizWewx/n9AmHAnBmLludHDLnRd/bPZbWc35COo0ucePtMN6ciiOfNUgOD2lkmJhSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762238471; c=relaxed/simple;
	bh=UJxTEjQ95ClmWkcsnrxh2LJUK25djJB4PtacZ84MACc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WRFaI0OQ3kI56h03+LBcWH6ijXxyZHwdDYA8qiT0qEVsj6K5SYPlqYbXquubDFMRfpVb6rb3I48GnEzlWYBXurB94acPp+FDSbdPRgJB32m9h6vW+492zZXmQovf/wyOk//57NDZCwfPCBuLJ/66q52E2GvLbS4BR/8E1DtLnaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VyT54GP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A439elE3845962;
	Tue, 4 Nov 2025 06:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xE+Olix1oNUA2M6hmGdgW0
	tawu5KU+7pz+9/68+YvMw=; b=VyT54GP2HB7gCdxdrGZArz+VsPO21XfgeA/cdc
	HqMTab7Gxry6bpjzJ6GLamWnRtY6mDZthv5qCoRuSJTGr96Ca7YQNz5pn6rIQl+N
	xX7hLFwuSrAjyzbXm+DE5iqRvQMBbdOxnkTj5fRePkbr5Stg73LsFwqwEArk8EQm
	O/JVvlbqyuXyLwU18sYbq+6lq+2Lq00/WXCStOhlk3NeX1pD/qhv8jBBOGn0WgSS
	zZSnqkImPkjJ6oXv9mhVQcTD5zhxl7uUJl2PdllRbFmJEytmIUOhxZ9cIrfgkQoP
	UKvKAoU+G6uuxEJDuffBX+36k8769oyVoRzW1EqcHKOKhejQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70f1hxfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 06:41:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A46f2Xx000774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Nov 2025 06:41:02 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 3 Nov 2025 22:40:04 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v3] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC devices
Date: Tue, 4 Nov 2025 12:09:43 +0530
Message-ID: <20251104063943.3424529-1-quic_mdalam@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=JLQ2csKb c=1 sm=1 tr=0 ts=69099fff cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=Kz769Q8VOxYrdAtN4ygA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA1MiBTYWx0ZWRfX/YTl7FDtGpBe
 N192phW9wt/amq/8rUhjZGP/sOBlhnY23zR2blK0Qk7RHGnbMuETDw3u/+ditwCJxcrDBW5zDE7
 aot1yQ0Ll8HY6wA6oTbbRbUi13EWRIE3kUcJAzEKkJIiPTI5Ph2gctQYsNfgMt1MaJQNktskvXD
 cDY4i5c0j+GQXpdMefih4uXa18sfg2NTxNZUMAi9aCNL+IcggZpnO1mB6XWdBayJNfA/JF15EsL
 plfuShgd7Xb3BN18KXaKtFY9+03wmB5Tt4qeDu9AYpuUey8KsuQA+zEq0hnPVYtklvxNo5zBg9U
 aJEJMPvXiAiXxSSNB3f0UzQyPHSAOv++2LgW1eFaa4ntF0Szf3GYD76pjbitOIwYNXIdduGgKMq
 oYhI6gsrNko5UYLUzD0TWWvetImGig==
X-Proofpoint-ORIG-GUID: C-2hlIutwTFjszgoq9s6591goq-zB32I
X-Proofpoint-GUID: C-2hlIutwTFjszgoq9s6591goq-zB32I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040052

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
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---

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

 drivers/mmc/host/sdhci-msm.c | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..6ce205238720 100644
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
+		crypto_enable = true;
+		dun = mrq->crypto_ctx->bc_dun[0];
+		key_index = mrq->crypto_key_slot;
+		crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, crypto_enable) |
+				FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
+
+		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
+		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
+	} else {
+		crypto_enable = false;
+		key_index = 0;
+		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
+	}
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
+		sdhci_msm_ice_cfg(host, mrq);
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
@@ -2181,6 +2237,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
 	if (host->flags & SDHCI_USE_64_BIT_DMA)
 		host->desc_sz = 12;
 
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
 	ret = __sdhci_add_host(host);
 	if (ret)
 		goto cleanup;
@@ -2759,6 +2827,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
 
+#ifdef CONFIG_MMC_CRYPTO
+	host->mmc_host_ops.request = sdhci_msm_request;
+#endif
 	/* Set the timeout value to max possible */
 	host->max_timeout_count = 0xF;
 
-- 
2.34.1


