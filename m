Return-Path: <linux-arm-msm+bounces-43330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA749FC7D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 04:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B66E57A12D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 03:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22AF2747B;
	Thu, 26 Dec 2024 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gGgJGO6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9A7EAC6;
	Thu, 26 Dec 2024 03:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735183282; cv=none; b=ZBgzRroKCtoCQXERmMBT+nfZ/JHxePha0nos6ux07//AVkY7gDIuh4MgsvLTjbJzp+fcWmLf8q+wBP5waDfDW4EgMpCM8ON/nCafwVNPEM2wAUedZYzHgzCKxbtlP53Nv38mD6hhJexp6hJU0iBF/mIXZaRXr8EAz7e8LtE1ix8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735183282; c=relaxed/simple;
	bh=7sV2PFTMwXrSl9SYM1s+KV5pFfb5C8xkSXBtz+gmIqc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GyHiIuRcU/rZZXPEwlTxWPRhPFtDkZpvIoX+Wkxs51OtLNDYffu0vf+7GdxetWfsPW5XTVUAuQEHWEL0ZoM/Y6gOknZNarhPhQL/8zTogW8wEYEK2f64IZw1399qD3bpcxD+MfueLUFhmbi6gMDPJ6aEJgQrnGcSIs9tFk4O9uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gGgJGO6O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ1vdWr001940;
	Thu, 26 Dec 2024 03:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=E4dxPcvZ0LJQNndkiJ14Fb1xoOEFV7jOflr
	Yuo6I/SE=; b=gGgJGO6O50d1+zFs21wyru2LOBNpbEbqFq6fqcXS6eewZk4XQPS
	kf+4m4QSubjSAu/SrVHU58WsmENlFgMzcWHHgRCCXl1DZBHtjzqabUn0mgoALGEt
	2uzY9uinlczBIVKmKZOHyAafPb9F5QEx/VZeVK5GN/YNVFTzS8QPiwsmsDtmIuOY
	nukrnAUj8u3a4sctEDVDWCqtNfYeFDW1QQKcOjDVLJRPHMcOvUJmbaS/BVblJJmF
	kR0LSBFm6e6KyJOaVeWh5M/ySr1yPmPHrmPb1LOjOKNGMFngx25Uwf5q8EOoSG4m
	EA01oiz+NQcJ2fNOFDFMM71NF7r2d+/VFTg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rwxj8c06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 03:21:16 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ3L7l3021542;
	Thu, 26 Dec 2024 03:21:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 43nprkpwrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 03:21:07 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BQ3L7OU021537;
	Thu, 26 Dec 2024 03:21:07 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4BQ3L6O9021536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 03:21:07 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id A6CA91D1B; Thu, 26 Dec 2024 11:21:05 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: adrian.hunter@intel.com, ulf.hansson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        andersson@kernel.org
Cc: quic_tingweiz@quicinc.com, quic_zhgao@quicinc.com,
        quic_yuanjiey@quicinc.com
Subject: [PATCH v3] mmc: sdhci-msm: Correctly set the load for the regulator
Date: Thu, 26 Dec 2024 11:18:45 +0800
Message-Id: <20241226031845.2574669-1-quic_yuanjiey@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Rp9DYLYfiWEy95Dleg3LboFalD1y-QO8
X-Proofpoint-GUID: Rp9DYLYfiWEy95Dleg3LboFalD1y-QO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260027

Qualcomm regulator supports two power supply modes: HPM and LPM.
Currently, the sdhci-msm.c driver does not set the load to adjust
the current for eMMC and SD. If the regulator dont't set correct
load in LPM state, it will lead to the inability to properly
initialize eMMC and SD.

Set the correct regulator current for eMMC and SD to ensure that the
device can work normally even when the regulator is in LPM.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
Changes in v3:
- Optimize the code logic and separate code for regulator vmmc and vqmmc
- Rebase on tag: next-20241217
- Link to v2: https://lore.kernel.org/all/20241127095029.3918290-1-quic_yuanjiey@quicinc.com/

Changes in v2:
- Add enum msm_reg_type to optimize the code
- Delete redundant emmc type judgment
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241122075048.2006894-1-quic_yuanjiey@quicinc.com/

---
 drivers/mmc/host/sdhci-msm.c | 64 ++++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e00208535bd1..22811964ba61 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -134,9 +134,18 @@
 /* Timeout value to avoid infinite waiting for pwr_irq */
 #define MSM_PWR_IRQ_TIMEOUT_MS 5000
 
+/* Max load for eMMC Vdd supply */
+#define MMC_VMMC_MAX_LOAD_UA	570000
+
 /* Max load for eMMC Vdd-io supply */
 #define MMC_VQMMC_MAX_LOAD_UA	325000
 
+/* Max load for SD Vdd supply */
+#define SD_VMMC_MAX_LOAD_UA	800000
+
+/* Max load for SD Vdd-io supply */
+#define SD_VQMMC_MAX_LOAD_UA	22000
+
 #define msm_host_readl(msm_host, host, offset) \
 	msm_host->var_ops->msm_readl_relaxed(host, offset)
 
@@ -1403,11 +1412,59 @@ static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
 	return ret;
 }
 
-static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
+static void msm_config_vmmc_regulator(struct mmc_host *mmc, bool hpm)
+{
+	int load;
+
+	if (!mmc->card) {
+		regulator_set_mode(mmc->supply.vmmc,
+				   hpm ? REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE);
+		return;
+	}
+
+	if (!mmc_card_mmc(mmc->card) &&
+	    !mmc_card_sd(mmc->card))
+		return;
+
+	if (mmc_card_mmc(mmc->card))
+		load = MMC_VMMC_MAX_LOAD_UA;
+	else if (mmc_card_sd(mmc->card))
+		load =  SD_VMMC_MAX_LOAD_UA;
+	load = hpm ? load : 0;
+
+	regulator_set_load(mmc->supply.vmmc, load);
+
+	return;
+}
+
+static void msm_config_vqmmc_regulator(struct mmc_host *mmc, bool hpm)
+{
+	int load;
+
+	if (!mmc->card) {
+		regulator_set_mode(mmc->supply.vqmmc,
+				   hpm ? REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE);
+		return;
+	}
+
+	if (!mmc_card_sd(mmc->card))
+		return;
+
+	load =  hpm ? SD_VQMMC_MAX_LOAD_UA : 0;
+
+	regulator_set_load(mmc->supply.vqmmc, load);
+
+	return;
+}
+
+static int sdhci_msm_set_vmmc(struct sdhci_msm_host *msm_host,
+			      struct mmc_host *mmc, bool hpm)
 {
 	if (IS_ERR(mmc->supply.vmmc))
 		return 0;
 
+	msm_config_vmmc_regulator(mmc, hpm);
+
 	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
 }
 
@@ -1420,6 +1477,8 @@ static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
 	if (msm_host->vqmmc_enabled == level)
 		return 0;
 
+	msm_config_vqmmc_regulator(mmc, level);
+
 	if (level) {
 		/* Set the IO voltage regulator to default voltage level */
 		if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
@@ -1642,7 +1701,8 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 	}
 
 	if (pwr_state) {
-		ret = sdhci_msm_set_vmmc(mmc);
+		ret = sdhci_msm_set_vmmc(msm_host, mmc,
+					 pwr_state & REQ_BUS_ON);
 		if (!ret)
 			ret = sdhci_msm_set_vqmmc(msm_host, mmc,
 					pwr_state & REQ_BUS_ON);
-- 
2.34.1


