Return-Path: <linux-arm-msm+bounces-38784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E839D5A5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 425BDB213A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BC1187346;
	Fri, 22 Nov 2024 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UaeGTkaJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554761865E7;
	Fri, 22 Nov 2024 07:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261880; cv=none; b=GKmEUbh8h9ZURC6rsybK/DfPP5+/bLaFNwZ9+WxkAicOgcBOpIIS2vzP3eRbJLsweGm/Xy96n9cIPajsvVB3bTsZwDVc9J+tmDMDzpIyENJiJyiSIANrl77OsjHyn92h/orf/bpDRTwPvvaQJf8e/OP/QdIxUnuvB1VpBbFrDc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261880; c=relaxed/simple;
	bh=C2xxxCSxcgNZJ6leMsg28bVXsfJ/P2l084v0AQ4W7Fs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hMjZL34aTb3Vqn6z2B/nUe0+YH/rviya/1iO5yPFy1ZQld9xnf8U+5hQoPt8OZ3ho9pLgpncc0796SWvYTDjs5B/LpWqa8ldhoYdOl5TG8gdhm6yhcyp9DLWyybwhMaCV3ToxFuCWFTOdVM68+anpwXfdOWckWZjb04U6J0infE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UaeGTkaJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM5F6bP020377;
	Fri, 22 Nov 2024 07:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sJEwCo+ghoL55XsmCLIJU0
	a7yfszGQc288qfvj5WF3c=; b=UaeGTkaJsD6dNVtelSCpxE/ffXN+65DhSuSZTQ
	2+ippeS/2wYBRCVcAR0lZufOFXwK3mfzldUzkAWwAHJWthVZ6KPlBBWQLNiPsskG
	n/nhQ180Du2QmtRvfSk+/vlc+5znN/+Rp2c7rtV0ujO9rDctSMDw4gsioEdI2s7S
	YvqO0LXB2Syu+x7HRQxpyjM0g070iP6+FW5NvCTGc9qEhwVOiy9VWpLQ9G88Gea0
	P0JRo+yz+yUa4UPXzwintrnPSJi/hiFrZI3IP+lLYBhD0AzCwwJ52ef2eAgjgllf
	0UOaxT/xyaOypkxQTaPqaf5f0M3efQ38rqRkEKeSzbXMt/Vw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4326ataanm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:51:14 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM7ov2T022164;
	Fri, 22 Nov 2024 07:50:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 42xmfkvmx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:50:57 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AM7ovth022159;
	Fri, 22 Nov 2024 07:50:57 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AM7ouBd022157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:50:57 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 297891801; Fri, 22 Nov 2024 15:50:55 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: adrian.hunter@intel.com, ulf.hansson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: quic_tengfan@quicinc.com, quic_tingweiz@quicinc.com,
        quic_zhgao@quicinc.com, Yuanjie Yang <quic_yuanjiey@quicinc.com>
Subject: [PATCH v1] mmc: sdhci-msm: Correctly set the load for the regulator
Date: Fri, 22 Nov 2024 15:50:48 +0800
Message-Id: <20241122075048.2006894-1-quic_yuanjiey@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: m7wjLmSXfswSyEaL9qyKFzVChZmvczbq
X-Proofpoint-GUID: m7wjLmSXfswSyEaL9qyKFzVChZmvczbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1011 mlxlogscore=938 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220065

Qualcomm regulator supports two power supply modes: HPM and LPM.
Currently, the sdhci-msm.c driver does not set the load to adjust
the current for eMMC and SD. Therefore, if the regulator set load
in LPM state, it will lead to the inability to properly initialize
eMMC and SD.

Set the correct regulator current for eMMC and SD to ensure that the
device can work normally even when the regulator is in LPM.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 91 +++++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e00208535bd1..f2a2260d54c6 100644
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
 
+enum {
+	VMMC_REGULATOR,
+	VQMMC_REGULATOR,
+};
+
 struct sdhci_msm_offset {
 	u32 core_hc_mode;
 	u32 core_mci_data_cnt;
@@ -1403,11 +1421,70 @@ static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
 	return ret;
 }
 
-static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
+static int sdhci_msm_get_regulator_load(struct mmc_host *mmc, int max_current, int type)
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
+	if (mmc_card_is_removable(mmc) && mmc_card_mmc(mmc->card))
+		load = (type == VMMC_REGULATOR) ? MMC_VMMC_MAX_LOAD_UA : MMC_VQMMC_MAX_LOAD_UA;
+	else if (mmc_card_sd(mmc->card))
+		load = (type == VMMC_REGULATOR) ? SD_VMMC_MAX_LOAD_UA : SD_VQMMC_MAX_LOAD_UA;
+
+	return load;
+}
+
+static int msm_config_regulator_load(struct sdhci_msm_host *msm_host, struct mmc_host *mmc,
+				     bool hpm, int max_current, int type)
+{
+	int ret;
+	int load = 0;
+
+	/*
+	 * After the initialization process is finished, Once the type of card
+	 * is determined，only set the corresponding current for SD and eMMC.
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
 
@@ -1435,6 +1512,15 @@ static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
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
@@ -1642,7 +1728,8 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
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


