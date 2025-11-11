Return-Path: <linux-arm-msm+bounces-81218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B799CC4D329
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A805D4F7DDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7112934FF4C;
	Tue, 11 Nov 2025 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SZL0x+a0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D401F03D2;
	Tue, 11 Nov 2025 10:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857995; cv=none; b=MxU8UzwE6Or/4PwCMlZ7o114SWOCXv5YDJZEKnJMcDKwvw+zEW8fi5xEwRB7y3Oi8AQNu9eKeGd7fNqrELaO5vf/WLmP2Qj5D7l4t3eyf1sbpnwCMSY7pCAPipfMQdwk1yH1yFPvFjbiMbR+Lv3VlU5JGmTn6iy8nm61ZvCSyeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857995; c=relaxed/simple;
	bh=7Gj4ELieYeiWyEEpQoBYEuGNma54Bl/4LhSTkGAa64Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=olBIvtX6DzcKa5zYNHqhm9Vme3Gprp5Ek0U2xTXrJKHmF0wSyNqsc1dD5zjX62kq4jMU5L8R6F1JEl4uzB1nx8ju43Q7jJVK4+L+6I17Zh6vlv0ZGSWdIRcESNlsHbDPNzipAYxIclFKQkwAdaSn5yAyqbvXpGBhnLFcHCu1IxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SZL0x+a0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB7LDAs410088;
	Tue, 11 Nov 2025 10:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZXagMfHHjL29NMvJC5NnMH
	m1p/Cvakq5t63tLh8CgFg=; b=SZL0x+a082t6ONGML67EUDNvsqyMq+x4Iqcpj5
	yEP0ZmjIa1sTotvH2wayrtjP0jzbJFByXcsZn62mGZ5HpZnGdYOuEZM4lLc8YMCA
	eus68EVDurzQDeIDEZFPCbNfHit4CQAWi+IjIbfPBFWaVIpx05TKgKnTJz0d3PtH
	1AqtpYD5UG0qHpu2apinGz+iznC6Bd4+OwViUrLLYOhNugmnO5ShB7JL7cBhXizp
	HLoA9atmALfIRQOGbLqRLERYbDp26YUBO77Dq1AbDH1CsvRQxoe5BG6seycxX99v
	iNUfwmNKNUEMK6SW0v1/2O4KFdOPw+KzGJnly7mpXOn/G5rw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abppu2543-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 10:46:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5ABAkR3U025472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 10:46:28 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 11 Nov 2025 02:46:24 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v4] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC devices
Date: Tue, 11 Nov 2025 16:16:04 +0530
Message-ID: <20251111104604.2494305-1-quic_mdalam@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=TNVIilla c=1 sm=1 tr=0 ts=69131405 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=Kz769Q8VOxYrdAtN4ygA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: y2uJSZxDksyLDJLm1XySNPTg4nc1KMan
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4NSBTYWx0ZWRfXz7zJwl4i+46a
 Bi3g2NZKHFdRf4/vUEzpLRoZaDV3ah2w0jPutw4OzH1Xo1xaP+2dWhW6+hzh22e8gnJnUoEE92D
 YWpffl1vZ1Qy8L7DEKCbZJXibtH0CcPB1JkY/NRmrK6rqfKXEGLIbLo1cbfbKazZspPbJE2/xWF
 nPr5ujg4rDtWYUb7HFwECeVlWto60qp64woOx+juFnHpbHWaFvT6a7b3mp/Kh1L8iXA2p/jfTV/
 yRZjDFuMmIODHl8Gr2a9qTBsNsdJZXdSdUnqr/wb4TSy4qx0XSwpJP/GzMHqAgfXQ5zEwTRjLF2
 eT8OmS6KRt0tUOFhbfDpCCEVC2WhqGyTZE0uRObw5N/R5f8BwU7gx4L/yLv6ocBgrRIueJM0gTC
 yg5CqOQnF+gpKnUrgLDIImWaXVllAw==
X-Proofpoint-GUID: y2uJSZxDksyLDJLm1XySNPTg4nc1KMan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110085

Enable Inline Crypto Engine (ICE) support for eMMC devices that operate
without Command Queue Engine (CQE).This allows hardware-accelerated
encryption and decryption for standard (non-CMDQ) requests.

This patch:
- Adds ICE register definitions for non-CMDQ crypto configuration
- Implements a per-request crypto setup via sdhci_msm_ice_cfg()
- Hooks into the request path via mmc_host_ops.request

With this, non-CMDQ eMMC devices can benefit from inline encryption,
improving performance for encrypted I/O while maintaining compatibility
with existing CQE crypto support.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---

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

 drivers/mmc/host/sdhci-msm.c | 84 ++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..3c1c20182ac7 100644
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
@@ -2009,6 +2022,74 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
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
+	sdhci_msm_ice_enable(msm_host);
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
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
 	.keyslot_program	= sdhci_msm_ice_keyslot_program,
 	.keyslot_evict		= sdhci_msm_ice_keyslot_evict,
@@ -2759,6 +2840,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
 
+#ifdef CONFIG_MMC_CRYPTO
+	host->mmc_host_ops.request = sdhci_msm_request;
+#endif
 	/* Set the timeout value to max possible */
 	host->max_timeout_count = 0xF;
 
-- 
2.34.1


