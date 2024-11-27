Return-Path: <linux-arm-msm+bounces-39284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814529DA521
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 10:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218B2164F93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 09:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A380819343B;
	Wed, 27 Nov 2024 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S+4gAeZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8650191F7C;
	Wed, 27 Nov 2024 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732701136; cv=none; b=U8oBLSrB84BaCBemUqUDfOXsQWyqf+V4xJYXUmz5X0WITXsVHALX/BKb7jtJJQMTVUNPkyo7qVkYY4cIdb45xfzLLasJmStSZ8gmKb1Nketo194iecWx9ri2tHJqhsc3WtF7peTv68pzwn4AjLx/0drPRn2IdqNpJo0uKWd1uko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732701136; c=relaxed/simple;
	bh=6BuS9gaT9G4Qz4JKIlJWphDI2532BIgo0dP+a/mAPWg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h0IpSZ6WD1JXmnaMTYF9ltnVP3YyyRTNxftxsfWHoyBZueJIJgCKy58m/AOrfs2/D2aL5owk4kjiQYfabCMmIWohcGO4p1Fg3IQ8GBVs+uKQmABPeJjoi0daoCJAEbqvjMOJkD7jJy4fEBwq7rvh/sKlMFw7wc+3M1nf0vON7pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S+4gAeZN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR8F38k028826;
	Wed, 27 Nov 2024 09:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rwwmQdO7SbJa5FZkaXLdhRaWTNOCYfTaXXa
	QF+0Dc7w=; b=S+4gAeZN/k9MzMczAJlN9dw7HQjvgHKThFL3Mv4b/cdNcy1uXMH
	2xW433mYwXBQsfgayzOI/P1ZT/grhpLxpV4uYMsJ9+FyR0r3Ygf8drY6bMs4CYe5
	s++nnPO5AtS1QJIcErJjSMwvosIPe3tEkake9Lo+tGsM/Fi5JhKt+R9Pkd5JTDSz
	6rlsmnQJkXPnLUfH/l1c92oCEAFdRXtlmZeAaG56Qg4sHQ6OPmu4/m5Q7AJFUmL1
	27X2GvMjQJH9JpECiam5r5J5YWUePzQNdGVtkZOVlk8qMqWn2Xs9G/Kh2n1tA61s
	o/s2iMRuYd0LjHbG0+hchX4MpDBckEcmtYQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434nyg7aqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 09:52:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR9q8TO017675;
	Wed, 27 Nov 2024 09:52:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 43384kmh7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 09:52:08 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AR9q8wL017670;
	Wed, 27 Nov 2024 09:52:08 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4AR9q7Zo017660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 09:52:08 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 75F1518D8; Wed, 27 Nov 2024 17:52:06 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: adrian.hunter@intel.com, ulf.hansson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: quic_tingweiz@quicinc.com, quic_zhgao@quicinc.com,
        quic_yuanjiey@quicinc.com
Subject: [PATCH v2] mmc: sdhci-msm: Correctly set the load for the regulator
Date: Wed, 27 Nov 2024 17:50:29 +0800
Message-Id: <20241127095029.3918290-1-quic_yuanjiey@quicinc.com>
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
X-Proofpoint-GUID: vd1YDaakC2SsijUZdXPjtGU8TiyD01gE
X-Proofpoint-ORIG-GUID: vd1YDaakC2SsijUZdXPjtGU8TiyD01gE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270081

Qualcomm regulator supports two power supply modes: HPM and LPM.
Currently, the sdhci-msm.c driver does not set the load to adjust
the current for eMMC and SD. Therefore, if the regulator set load
in LPM state, it will lead to the inability to properly initialize
eMMC and SD.

Set the correct regulator current for eMMC and SD to ensure that the
device can work normally even when the regulator is in LPM.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
Changes in v2:
- Add enum msm_reg_type to optimize the code
- Delete redundant emmc type judgment
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241122075048.2006894-1-quic_yuanjiey@quicinc.com/

---
 drivers/mmc/host/sdhci-msm.c | 92 +++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e00208535bd1..fc13ef60ab61 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -134,9 +134,22 @@
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
+#define MAX_MMC_SD_VMMC_LOAD_UA  max(MMC_VMMC_MAX_LOAD_UA, SD_VMMC_MAX_LOAD_UA)
+
+#define MAX_MMC_SD_VQMMC_LOAD_UA max(MMC_VQMMC_MAX_LOAD_UA, SD_VQMMC_MAX_LOAD_UA)
+
 #define msm_host_readl(msm_host, host, offset) \
 	msm_host->var_ops->msm_readl_relaxed(host, offset)
 
@@ -147,6 +160,11 @@
 #define CQHCI_VENDOR_CFG1	0xA00
 #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
 
+enum msm_reg_type {
+	VMMC_REGULATOR,
+	VQMMC_REGULATOR,
+};
+
 struct sdhci_msm_offset {
 	u32 core_hc_mode;
 	u32 core_mci_data_cnt;
@@ -1403,11 +1421,71 @@ static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
 	return ret;
 }
 
-static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
+static int sdhci_msm_get_regulator_load(struct mmc_host *mmc, int max_current,
+					enum msm_reg_type type)
+{
+	int load = 0;
+
+	/*
+	 * When eMMC and SD are powered on for the first time, select a higher
+	 * current value from the corresponding current for eMMC and SD to
+	 * ensure that the eMMC and SD cards start up properly and complete
+	 * initialization. After the initialization process is finished, use
+	 * the corresponding current to set the eMMC and SD to ensure the
+	 * normal work of the device.
+	 */
+
+	if (!mmc->card)
+		return max_current;
+
+	if (mmc_card_mmc(mmc->card))
+		load = (type == VMMC_REGULATOR) ? MMC_VMMC_MAX_LOAD_UA : MMC_VQMMC_MAX_LOAD_UA;
+	else if (mmc_card_sd(mmc->card))
+		load = (type == VMMC_REGULATOR) ? SD_VMMC_MAX_LOAD_UA : SD_VQMMC_MAX_LOAD_UA;
+
+	return load;
+}
+
+static int msm_config_regulator_load(struct sdhci_msm_host *msm_host, struct mmc_host *mmc,
+				     bool hpm, int max_current, enum msm_reg_type type)
+{
+	int ret;
+	int load = 0;
+
+	/*
+	 * After the initialization process is finished, Once the type of card
+	 * is determined, only set the corresponding current for SD and eMMC.
+	 */
+
+	if (mmc->card && !(mmc_card_mmc(mmc->card) || mmc_card_sd(mmc->card)))
+		return 0;
+
+	if (hpm)
+		load = sdhci_msm_get_regulator_load(mmc, max_current, type);
+
+	if (type == VMMC_REGULATOR)
+		ret = regulator_set_load(mmc->supply.vmmc, load);
+	else
+		ret = regulator_set_load(mmc->supply.vqmmc, load);
+	if (ret)
+		dev_err(mmc_dev(mmc), "%s: set load failed: %d\n",
+			mmc_hostname(mmc), ret);
+	return ret;
+}
+
+static int sdhci_msm_set_vmmc(struct sdhci_msm_host *msm_host,
+			      struct mmc_host *mmc, bool hpm)
 {
+	int ret;
+
 	if (IS_ERR(mmc->supply.vmmc))
 		return 0;
 
+	ret = msm_config_regulator_load(msm_host, mmc, hpm,
+					MAX_MMC_SD_VMMC_LOAD_UA, VMMC_REGULATOR);
+	if (ret)
+		return ret;
+
 	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
 }
 
@@ -1435,6 +1513,15 @@ static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
 				goto out;
 			}
 		}
+
+		ret = msm_config_regulator_load(msm_host, mmc, level,
+						MAX_MMC_SD_VQMMC_LOAD_UA, VQMMC_REGULATOR);
+		if (ret < 0) {
+			dev_err(mmc_dev(mmc), "%s: vqmmc set regulator load failed: %d\n",
+				mmc_hostname(mmc), ret);
+			goto out;
+		}
+
 		ret = regulator_enable(mmc->supply.vqmmc);
 	} else {
 		ret = regulator_disable(mmc->supply.vqmmc);
@@ -1642,7 +1729,8 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
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


