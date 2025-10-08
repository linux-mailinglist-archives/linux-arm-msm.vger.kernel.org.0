Return-Path: <linux-arm-msm+bounces-76371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8184BC4816
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 85DE04E5714
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880712ECE9C;
	Wed,  8 Oct 2025 11:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m4BepKPY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E722D4F6;
	Wed,  8 Oct 2025 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759921703; cv=none; b=rGFuRc/FYIM/XY2E4CohozIFucJ7cqbZK5NU7fP+YwQPQSLijyp1bEFugt93f1Ajx2VsbtDzLlvbB5QGKS2oMSYw24Dl9tOsbbwLVOUoTLQNseJYSVoZHAbtyi+ORMcdnvY4Cqb7/7Unccfo1Oz/vDcY7d44FKObmT4yLZvyWc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759921703; c=relaxed/simple;
	bh=sk5WIvRK0N1Tm1xpfKtFMrUft4y8QAQc6kkNgLrBUeE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WfzSbtdiguN0ybDesTY4O7ZACUPXRAN2n/sOnzkzFtRYhyMo4TxRsdHN6jLjGKVtJvjA9pnBJexzwk1BDmgwxhBwaRU7gqoGtrYVnd+Oq2QUcC67OCW+Nl0GWHvylZ03jVClIRWJXrGU0cl26ZUXarrmAutAuGm8AmaUN1uORrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m4BepKPY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890nR4029797;
	Wed, 8 Oct 2025 11:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pWZh6qeNk7G0jxoHNP7vx3
	oxC+FCtYWHP7fnDeNwkMA=; b=m4BepKPYqBQ/36Njjrjg+q5uNvK1BC3kCmcCTj
	3QwrOqVbsb2ZTkxN1L7kTm7XYb1uPmoLVy/TEuFjnUNzqbanyh9YMoxi0zCfoOqA
	y2ajVwS2jIrCfrgcG79eACCJ8nmt80y6Gn7UmSxXVsLsVbA1TF/B4CT4NSAKAwpz
	wl4LuQ8g11n7UP+Ea0ARaBNOD7sbFxKv2RwxzD3SpFsuHiQkZm73yHMZXPj1l2Ed
	sAeG+jfiCNZGLfpct+hn9RxZfLTE861Hvspn5okIA+i+SJFYuwgHFAao9E/jTXSJ
	c+4K9ndtmNUb4nbIXNFbRZTvJCul9OH5bsH1PUzif1DpkdtA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e2c7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 11:08:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 598B8I22012236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Oct 2025 11:08:18 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 8 Oct 2025 04:08:15 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <adrian.hunter@intel.com>, <quic_asutoshd@quicinc.com>,
        <ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_varada@quicinc.com>
CC: <quic_mdalam@quicinc.com>
Subject: [PATCH] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC devices
Date: Wed, 8 Oct 2025 16:37:58 +0530
Message-ID: <20251008110758.718944-1-quic_mdalam@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e64622 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=x0BWNmWj6fMoAQ0tY0IA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: VsMqdFUa2BqiPYpGR7DorjRO2db1ox-i
X-Proofpoint-ORIG-GUID: VsMqdFUa2BqiPYpGR7DorjRO2db1ox-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX0+2APgXc54oc
 JvDHCm7ew2UX0J7GghP3WU2ejxA0CRLhvsO3LIFy14OFx7b2KsxKm7SByRhnCxlGNs1vNK/1U/U
 F6uZxiWRIn40ZP0DifDGC9+rqthSrLsMlUVOB0QS3hBHy5LgIGxaO/7iGwjgj0zLyUZSXsCA/ZI
 cSyq6EsSi5b+Ml1FTMoUL1GtTVNeGWmPw7S8MOQsQNqLPBtaHHAofIah+SrgPI4ZaNt16jFAjzH
 mSBkX9M1IOgwr29ePuUxJ373JmQQleTT8LBksps30Ybak+K1fsJsOSv2FHAxEkChJt4GyU4Guyg
 IdSMWDRgDZWzrbPewxj3AC/JHUmWCGi4lGIvIms0d3sE9cT2MLpRXj9AVXQS7qfFkjz7Q3VEeZB
 n1z45njy3e0VNU+4TUhKgURd0mzpEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

Enable Inline Crypto Engine (ICE) support for eMMC devices that don't
use command queuing (CQE). This allows hardware-accelerated encryption
and decryption for standard eMMC operations without command queuing.

The changes include:
- Add non-cmdq crypto register definitions
- Implement crypto configuration callback for non-cmdq operations
- Initialize ICE hardware during host setup for non-cmdq devices
- Integrate crypto configuration into the main request path

This enables non-cmdq eMMC devices to benefit from hardware crypto
acceleration, improving performance for encrypted storage operations
while maintaining compatibility with existing cmdq crypto support.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mmc/host/cqhci.h     |  4 ++
 drivers/mmc/host/sdhci-msm.c | 74 +++++++++++++++++++++++++++++++++++-
 drivers/mmc/host/sdhci.c     | 20 ++++++++++
 drivers/mmc/host/sdhci.h     |  2 +
 4 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
index ce189a1866b9..9bf236e27675 100644
--- a/drivers/mmc/host/cqhci.h
+++ b/drivers/mmc/host/cqhci.h
@@ -119,6 +119,10 @@
 /* command response argument */
 #define CQHCI_CRA			0x5C
 
+/* non command queue crypto enable register*/
+#define NONCQ_CRYPTO_PARM		0x70
+#define NONCQ_CRYPTO_DUN		0x74
+
 /* crypto capabilities */
 #define CQHCI_CCAP			0x100
 #define CQHCI_CRYPTOCAP			0x104
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..2204c6abb3fe 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -157,6 +157,23 @@
 #define CQHCI_VENDOR_CFG1	0xA00
 #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
 
+#define DISABLE_CRYPTO			BIT(15)
+#define CRYPTO_GENERAL_ENABLE		BIT(1)
+#define HC_VENDOR_SPECIFIC_FUNC4	0x260
+#define ICE_HCI_SUPPORT			BIT(28)
+
+/* SDHCI MSM ICE CTRL Info register offset */
+enum {
+	OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CCI	= 0,
+	OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CE	= 8,
+};
+
+/* SDHCI MSM ICE CTRL Info register masks */
+enum {
+	MASK_SDHCI_MSM_ICE_HCI_PARAM_CE		= 0x1,
+	MASK_SDHCI_MSM_ICE_HCI_PARAM_CCI	= 0xff
+};
+
 struct sdhci_msm_offset {
 	u32 core_hc_mode;
 	u32 core_mci_data_cnt;
@@ -1882,9 +1899,47 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
  * Inline Crypto Engine (ICE) support                                        *
  *                                                                           *
 \*****************************************************************************/
-
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
+	if (!mrq || !cq_host)
+		return -EINVAL;
+
+	if (mrq->crypto_ctx) {
+		dun = mrq->crypto_ctx->bc_dun[0];
+		bypass = false;
+		key_index = mrq->crypto_key_slot;
+	}
+
+	/* Configure ICE bypass mode */
+	crypto_params |= ((!bypass) & MASK_SDHCI_MSM_ICE_HCI_PARAM_CE)
+			 << OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CE;
+	/* Configure Crypto Configure Index (CCI) */
+	crypto_params |= (key_index & MASK_SDHCI_MSM_ICE_HCI_PARAM_CCI)
+			 << OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CCI;
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
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
 
 static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
@@ -2131,6 +2186,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
 	struct cqhci_host *cq_host;
 	bool dma64;
 	u32 cqcfg;
+	u32 config;
+	u32 ice_cap;
 	int ret;
 
 	/*
@@ -2185,6 +2242,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
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
@@ -2450,6 +2519,9 @@ static const struct of_device_id sdhci_msm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, sdhci_msm_dt_match);
 
 static const struct sdhci_ops sdhci_msm_ops = {
+#ifdef CONFIG_MMC_CRYPTO
+	.crypto_engine_cfg = sdhci_msm_ice_cfg,
+#endif
 	.reset = sdhci_and_cqhci_reset,
 	.set_clock = sdhci_msm_set_clock,
 	.get_min_clock = sdhci_msm_get_min_clock,
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index ac7e11f37af7..2d636a8ee452 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -2202,6 +2202,21 @@ void sdhci_set_power_and_bus_voltage(struct sdhci_host *host,
 }
 EXPORT_SYMBOL_GPL(sdhci_set_power_and_bus_voltage);
 
+static int sdhci_crypto_cfg(struct sdhci_host *host, struct mmc_request *mrq,
+			    u32 slot)
+{
+	int err = 0;
+
+	if (host->ops->crypto_engine_cfg) {
+		err = host->ops->crypto_engine_cfg(host, mrq, slot);
+		if (err)
+			pr_err("%s: failed to configure crypto: %d\n",
+			       mmc_hostname(host->mmc), err);
+	}
+
+	return err;
+}
+
 /*****************************************************************************\
  *                                                                           *
  * MMC callbacks                                                             *
@@ -2227,6 +2242,11 @@ void sdhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
 
 	cmd = sdhci_manual_cmd23(host, mrq) ? mrq->sbc : mrq->cmd;
 
+	if (mmc->caps2 & MMC_CAP2_CRYPTO) {
+		if (sdhci_crypto_cfg(host, mrq, 0))
+			goto out_finish;
+	}
+
 	if (!sdhci_send_command_retry(host, cmd, flags))
 		goto out_finish;
 
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index b6a571d866fa..9ac32a787270 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -709,6 +709,8 @@ struct sdhci_ops {
 	unsigned int    (*get_ro)(struct sdhci_host *host);
 	void		(*reset)(struct sdhci_host *host, u8 mask);
 	int	(*platform_execute_tuning)(struct sdhci_host *host, u32 opcode);
+	int	(*crypto_engine_cfg)(struct sdhci_host *host,
+				     struct mmc_request *mrq, u32 slot);
 	void	(*set_uhs_signaling)(struct sdhci_host *host, unsigned int uhs);
 	void	(*hw_reset)(struct sdhci_host *host);
 	void    (*adma_workaround)(struct sdhci_host *host, u32 intmask);
-- 
2.34.1


