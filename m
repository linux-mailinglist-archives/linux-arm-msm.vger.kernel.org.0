Return-Path: <linux-arm-msm+bounces-47539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BB4A307FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 11:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70B853A3A61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CD61F37CA;
	Tue, 11 Feb 2025 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZnGESr8X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE9F1F37BC;
	Tue, 11 Feb 2025 10:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268496; cv=none; b=ojsC8NIwFKnAzeOcdaPkh0GzGvE1vLkK2xpqa2s6lZAV0rjra1dWZgzzLD+L35YoiWr90Dc9WRlBzQUMdp+xNv3hetbW7kwZhuhnG+Wed089DVp1hi54yLOyQBgGG1GskynPdQZK0RFGhFHmDPzjeOtiWHbwWSB/RnUpPrlq5CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268496; c=relaxed/simple;
	bh=f/vytJK+MtTyRhNtiMnVekp3UKcMihUn+7HgkrKqY3Y=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Q/hC1YQzoMJ+Cqz8pgvOAG7gdxtblyy96u0D9hPzKFHCYTevdoqMuOvzq3UCzsghq8Gp+MtUx8vCFnN7WsZdQq1+3yUln+gSSUY8KNIsf5y+kZ83Do6UObuTm+9kBA88v222uMII5pZ2lf4KFdfCZlpNM3FbPDFoqVJAw6jnaDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZnGESr8X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BA2QWs013667;
	Tue, 11 Feb 2025 10:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=mjw/2uFMb5a+
	7/cLGkARvsCKn1RmWhBraleHyNxVAnI=; b=ZnGESr8XYdbj0zDQoArebEkp18r+
	tM56uFXRVNlu3MnUUeQh91suiLi/bgcv/XlcF+IacAibSim80kdkwTLNJJs4NLVc
	w8o/mlaLiYvpU/rOg88fgD7CfplrVZ5jN7YTeKFgeC5Uq0NJMmQ+eDJNSSPnl7FF
	9Vtz5laomUgZy//Xw1iLpirfbSlRk6vXPIJBpqch4hMdqGplpTUIvi9MRZFmMvtl
	vv64vOa7eXCiWsck72sq3RNat8BkpTa7xVKU6UK1weQ9XqLsAoImwOcahj+9AXiF
	oRCumVmyyPjkQfYASoISU/BIrFQwEQXdKoUHtaga0MoKRJnSd2UljMMWNQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyq9vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:08:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51BA88ol002554;
	Tue, 11 Feb 2025 10:08:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 44p0bkv363-1;
	Tue, 11 Feb 2025 10:08:08 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51BA884v002547;
	Tue, 11 Feb 2025 10:08:08 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 51BA87N8002546;
	Tue, 11 Feb 2025 10:08:08 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 2B4DF5000A7; Tue, 11 Feb 2025 15:38:07 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@quicinc.com,
        quic_neersoni@quicinc.com, quic_gaurkash@quicinc.com,
        quic_spuppala@quicinc.com
Subject: [PATCH v1] mmc: Avoid reprogram all keys to Inline Crypto Engine for MMC runtime suspend resume
Date: Tue, 11 Feb 2025 15:38:07 +0530
Message-Id: <20250211100807.26170-1-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uQn-82TMq0woyhnfQsCwkm6k_nAklXmn
X-Proofpoint-GUID: uQn-82TMq0woyhnfQsCwkm6k_nAklXmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110063
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Crypto reprogram all keys is called for each MMC runtime
suspend/resume in current upstream design. If this is implemented
as a non-interruptible call to TEE for security, the cpu core is
blocked for execution while this call executes although the crypto
engine already has the keys. For example, glitches in audio/video
streaming applications have been observed due to this. Add the flag
MMC_CAP2_DONT_REPROGRAM as part of host->caps2 to control reprogramming
keys to crypto engine for socs which dont require this feature.

This patch addresses the following:
- Addresses the comments from:
  https://lore.kernel.org/lkml/20241006135530.17363-3-
  quic_spuppala@quicinc.com/T/#m69c9ab538bd9efd54515646952d0d7d1d7c17690
- Avoids reprogram of keys for Qualcomm SOCs only.
- Ensures reprogram of all keys on host controller reset.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 drivers/mmc/core/crypto.c    | 2 +-
 drivers/mmc/host/sdhci-msm.c | 4 ++++
 include/linux/mmc/host.h     | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
index fec4fbf16a5b..d947cd1bbfe3 100644
--- a/drivers/mmc/core/crypto.c
+++ b/drivers/mmc/core/crypto.c
@@ -15,7 +15,7 @@
 void mmc_crypto_set_initial_state(struct mmc_host *host)
 {
 	/* Reset might clear all keys, so reprogram all the keys. */
-	if (host->caps2 & MMC_CAP2_CRYPTO)
+	if (host->caps2 & MMC_CAP2_CRYPTO && !(host->caps2 & MMC_CAP2_DONT_REPROGRAM))
 		blk_crypto_reprogram_all_keys(&host->crypto_profile);
 }
 
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4610f067faca..52207873e18d 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1865,6 +1865,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+	mmc->caps2 |= MMC_CAP2_DONT_REPROGRAM;
 	return 0;
 }
 
@@ -2451,6 +2452,9 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
 	usleep_range(200, 210);
 	reset_control_put(reset);
 
+	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
+		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
+
 	return ret;
 }
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 68f09a955a90..d1e6fafca21c 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -459,6 +459,9 @@ struct mmc_host {
 #define MMC_CAP2_CRYPTO		0
 #endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#ifdef CONFIG_MMC_CRYPTO
+#define MMC_CAP2_DONT_REPROGRAM	(1 << 29)
+#endif
 
 	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
 	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */
-- 
2.17.1


