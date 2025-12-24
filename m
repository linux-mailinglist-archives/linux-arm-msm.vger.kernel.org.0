Return-Path: <linux-arm-msm+bounces-86546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43636CDBF0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0060C30141E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5185E32D448;
	Wed, 24 Dec 2025 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c+AOozLx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777F72FAC14;
	Wed, 24 Dec 2025 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766571080; cv=none; b=YPkRefUR6JG5KfgNtmAwSjCtnzYGZA6tnhwEPE9V3cYvyy9fZmNDTyYZZOZ+Yarf1B3r8besnDpfBy9K/9RTPvpF1h6ABSTwoSGRdBpb/6HtyRIJ3lQvRluVQE/1Er417/HWObM4pYDjVYdS9MAEdbxGQocx9Cjr+rDfI207rBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766571080; c=relaxed/simple;
	bh=1XbbrD+pygxjwX7H0zpvsuIFw0OnTLPT+S2XYMivSK0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M/4mgb6f5Jiy/zCIMT+X+oTWesPmvJ9xm9n7TXoquUQMjXOOzuKBHPfgQpR/JBvlqjthMB2hjInPsMO/HyKqd941aKNOb8R3Xv3O4Of3glv7U1W1bVMSMiNb5d4jZ/L2cv/17cC02Uuy72ERGgrtNRsOER8usu6vE169oWdHB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c+AOozLx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9pujK561263;
	Wed, 24 Dec 2025 10:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KOKATNxM8R0xd0NYHBl8ac
	Meakc0YLalQSDQ4AEYxFc=; b=c+AOozLxgBkqu0PI8fcbjuEgf/zmascpMaWUw/
	wR+4knRye/bsu/9WmqCnOAoL3uZTjkCjH0ESFtj9X+0Qk7INpV7BGXa5hp80hNJr
	nVl4VgWDc4zCuCvKyn8LIG5RwaS7uohbTLlVzmB6or+gCFvp0f+7izX3DcR6rKIt
	2v7vtZCiHluPBcd61WGYEgCd2DzALpVokvBHRFXh3nYKWUIrqA7JWEMQg/FVoe78
	T6KjCT8coiKnWDT6drEr2cfHdVJrQZkbWhs/vbD8Rzfs/oFUa5O2xAO6AsE27KMt
	Jjg6FluOIWRUyCXg2jKkB026DaDn43/jQdhAwITX0+/kTZJw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cu7fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 10:11:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BOABB9o000879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 10:11:11 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Dec 2025 02:11:07 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <adrian.hunter@intel.com>, <quic_asutoshd@quicinc.com>,
        <ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <ebiggers@kernel.org>
CC: <quic_mdalam@quicinc.com>
Subject: [PATCH] mmc: sdhci-msm: Add quirk to disable CQE for ICE legacy mode
Date: Wed, 24 Dec 2025 15:40:50 +0530
Message-ID: <20251224101050.3497746-1-quic_mdalam@quicinc.com>
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
X-Proofpoint-GUID: oQhYo_dSsTKfkb5yUAfXppZlWat9ZqkW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4NyBTYWx0ZWRfX95i2WxKJThW3
 qepuBNtMvgn6jmLULYJe2hj0T3iOCYeLNJ/cokdwrBcDG9Rcl68TZsk2uEfe82NvhMTr15PLFPO
 98K2j284YxNi/nFlNiEIMWGI4nZRxbBoeccnThl5DqDN4SGNkldZ9hjUh3ZUKoix1mqyw4Afjsn
 YKfzBo5ZQZ8U9QYxM9IqGWTPy/uIZMusN3W799Fqu0IIPWcZ3Rk6S4hQ0/FOH+SEzpHyj21fTXu
 nnsrBIV7PiVyBoencLoZVotfMnTwDpeHDlzxrjCUK0FP94BGLgi6bAbkh5DTwIpPpRq71Sf0c9A
 ApsQrPzfTsDlWCGjHP72rCR8JVMEChiDKLBjp4+0sPUlIOfeoqAiecYlOOgnArdPT+NDh2yWK0S
 fCjX2odtQcvK83QvGgSrunbDxbJkplLbfHXotsB0yHif3SvKsQecL5EdfvSdj6zB7b8kiyXigwa
 NsMLsBVMes14cTi5Llw==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bbc40 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=adGaVkAdHRIPqEJSXlwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oQhYo_dSsTKfkb5yUAfXppZlWat9ZqkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240087

Some hosts require Inline Crypto Engine (ICE) to operate in legacy mode
instead of Command Queue Engine (CQE) mode for platform-specific
requirements or compatibility reasons. Introduce a host-level quirk
`host_disable_cqe` to forcefully disable CQE negotiation and allow ICE
to function through the legacy request path.

When the device tree omits the "supports-cqe" property, the driver sets
`host_disable_cqe = true` and avoids enabling MMC_CAP2_CQE during card
initialization. This ensures that even CQE-capable hardware falls back
to legacy SDHCI request handling. A minimal `cqhci_disable_ops` is
provided with `.cqe_enable = cqhci_host_disable` returning -EINVAL to
force the fallback. Other ops are left NULL for safe defaults.

For builds without CONFIG_MMC_CRYPTO, the driver uses standard
sdhci_add_host() to avoid unnecessary CQE infrastructure initialization.

This allows platforms to forcefully opt out of CQE usage and ensure ICE
operates reliably in legacy mode, providing stable crypto operations
without command queuing complexity.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mmc/host/cqhci-core.c | 28 +++++++++++++++++++++++++++-
 drivers/mmc/host/sdhci-msm.c  | 20 +++++++++++++++-----
 include/linux/mmc/host.h      |  1 +
 3 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.c
index 178277d90c31..32da3b856db1 100644
--- a/drivers/mmc/host/cqhci-core.c
+++ b/drivers/mmc/host/cqhci-core.c
@@ -334,6 +334,12 @@ int cqhci_resume(struct mmc_host *mmc)
 }
 EXPORT_SYMBOL(cqhci_resume);
 
+static int cqhci_host_disable(struct mmc_host *mmc, struct mmc_card *card)
+{
+	pr_info("%s: Host does not want to use CMDQ\n", mmc_hostname(mmc));
+	return -EINVAL;
+}
+
 static int cqhci_enable(struct mmc_host *mmc, struct mmc_card *card)
 {
 	struct cqhci_host *cq_host = mmc->cqe_private;
@@ -1135,6 +1141,18 @@ static const struct mmc_cqe_ops cqhci_cqe_ops = {
 	.cqe_recovery_finish = cqhci_recovery_finish,
 };
 
+static const struct mmc_cqe_ops cqhci_disable_ops = {
+	.cqe_enable = cqhci_host_disable,
+	.cqe_disable = NULL,
+	.cqe_request = NULL,
+	.cqe_post_req = NULL,
+	.cqe_off = NULL,
+	.cqe_wait_for_idle = NULL,
+	.cqe_timeout = NULL,
+	.cqe_recovery_start = NULL,
+	.cqe_recovery_finish = NULL,
+};
+
 struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev)
 {
 	struct cqhci_host *cq_host;
@@ -1188,7 +1206,15 @@ int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc,
 	cq_host->num_slots = NUM_SLOTS;
 	cq_host->dcmd_slot = DCMD_SLOT;
 
-	mmc->cqe_ops = &cqhci_cqe_ops;
+	/*
+	 * Some platforms may not support CQE reliably.
+	 * Use host_disable_cqe to force fallback to
+	 * legacy request path.
+	 */
+	if (mmc->host_disable_cqe)
+		mmc->cqe_ops = &cqhci_disable_ops;
+	else
+		mmc->cqe_ops = &cqhci_cqe_ops;
 
 	mmc->cqe_qdepth = NUM_SLOTS;
 	if (mmc->caps2 & MMC_CAP2_CQE_DCMD)
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index da356627d9de..3295e8c9650b 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2200,6 +2200,7 @@ static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
 #endif
 };
 
+#ifdef CONFIG_MMC_CRYPTO
 static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
 				struct platform_device *pdev)
 {
@@ -2228,7 +2229,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
 		goto cleanup;
 	}
 
-	msm_host->mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
+	if (!msm_host->mmc->host_disable_cqe)
+		msm_host->mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
 	cq_host->ops = &sdhci_msm_cqhci_ops;
 
 	dma64 = host->flags & SDHCI_USE_64_BIT_DMA;
@@ -2270,6 +2272,7 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
 	sdhci_cleanup_host(host);
 	return ret;
 }
+#endif
 
 /*
  * Platform specific register write functions. This is so that, if any
@@ -2852,10 +2855,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	host->mmc_host_ops.start_signal_voltage_switch =
 		sdhci_msm_start_signal_voltage_switch;
 	host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
-	if (of_property_read_bool(node, "supports-cqe"))
-		ret = sdhci_msm_cqe_add_host(host, pdev);
-	else
-		ret = sdhci_add_host(host);
+	/*
+	 * If "supports-cqe" is not set in DT, disable CQE at host level.
+	 * This allows ICE to operate in legacy mode.
+	 */
+	msm_host->mmc->host_disable_cqe = !of_property_read_bool(node,
+								 "supports-cqe");
+#ifdef CONFIG_MMC_CRYPTO
+	ret = sdhci_msm_cqe_add_host(host, pdev);
+#else
+	ret = sdhci_add_host(host);
+#endif
 	if (ret)
 		goto pm_runtime_disable;
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index e0e2c265e5d1..8b963ccbda19 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -565,6 +565,7 @@ struct mmc_host {
 	int			cqe_qdepth;
 	bool			cqe_enabled;
 	bool			cqe_on;
+	bool			host_disable_cqe;
 
 	/* Inline encryption support */
 #ifdef CONFIG_MMC_CRYPTO
-- 
2.34.1


