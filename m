Return-Path: <linux-arm-msm+bounces-65648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39382B0A17A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 13:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0037B1C42354
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 11:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41A92BDC1D;
	Fri, 18 Jul 2025 11:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YXYG7Knp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E532AD14;
	Fri, 18 Jul 2025 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752836570; cv=none; b=usTsSL7NDakoxbjUeZ0cm5cVhdyNYt2hY2ml8Gzl9vBbDtg9yoJKb+3xbhC74xNP6s9AOmenoDCIStDoQDf/6B5U9UYfmfrB27Z3/0+mrzWojBSoZpaLw7yUyltRv4EisS0nFCTQSJlgWLLyI3Tt0jXjveKcA91qkx2v/DYShR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752836570; c=relaxed/simple;
	bh=CB5crPiALbiWzAbsa8IxbmVvNnUAjwpypx0sLw4IrEc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fGeaBaY+ZnnrtjO6FmS2btDiLfl6EP8ZADAY9Bjp3XtU8RNtVcgWoBfYEZkun7whWQbob5uFLg6agaSScz9f9+L85cQ3xSIl6uMe5BTq5VT8Pr/1qmAcK4FNemcs5nVMoA9L6CZYW5e6Kd9iSUWzuuG3tar0P7yJs63vlr/7ops=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YXYG7Knp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I6v6MJ000567;
	Fri, 18 Jul 2025 11:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=41LvHptSb9Do9MJJk5TN8q
	meV50Kl2lR2JxpA8EmSc8=; b=YXYG7Knpa5LTF6R5xd16wz7/QLPhn8kPppblyo
	hnaeauAjkxGdFBxGmtMOU7e03fx4d9/8Gx+foC4C72WSbc54PjU6Nln4FlJJEgD1
	YxJpSf4oHmmuvmdrCO3oA0UZ1qou3qVppQ33pEnsBjaWL2HKma/i+rgi/3sewHLB
	8roKaNZSZCfwnlzqgKFSSsHvcMWhA2SG8tP37rXnuQhnEMJOxTvllTs4TpfMl5NS
	ApimVAJPJK1j6buzEoG/wpiZPvOY6ivI2S+pjjlL/BfYMBS/SxRQDjb0W9JaeFwc
	iKuaJwx+ECh+fy21WU9IerWlJ4HoXq3pk/3aj1GYc1Eu3qBw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drx9w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 11:02:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56IB2fmF018845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 11:02:41 GMT
Received: from hu-dmukhopa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 18 Jul 2025 04:02:33 -0700
From: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
To: Eric Biggers <ebiggers@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <kernel@quicinc.com>,
        Neeraj Soni
	<quic_neersoni@quicinc.com>,
        Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>,
        Ram Prakash Gupta <quic_rampraka@quicinc.com>,
        Nitin Rawat
	<quic_nitirawa@quicinc.com>,
        Sachin Gupta <quic_sachgupt@quicinc.com>,
        Bhaskar Valaboju <quic_bhaskarv@quicinc.com>,
        Gaurav Kashyap
	<quic_gaurkash@quicinc.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH v3] mmc: Avoid reprogram all keys to Inline Crypto Engine for MMC runtime suspend resume
Date: Fri, 18 Jul 2025 16:32:17 +0530
Message-ID: <20250718110217.1929526-1-quic_dmukhopa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: f1i0qkMC8opGaAwfVePuWbm4w7-Hzlhq
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687a29d2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=1QBs8BvCmvQ6mH5QngwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f1i0qkMC8opGaAwfVePuWbm4w7-Hzlhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4NiBTYWx0ZWRfX+WCqGoZHkAUo
 cBr2j/83KzCxlE1uWRxMtP2hnnrSygC7RtSIt9WJwW6tf2CxZhNPjtzHK1RGGPH4C+xYRWHFOZE
 /054osu+4YWzqc0BnIB7Co0O84Sd7gkCZrjMkaOvP83ystshHx4qnIXecb2YlDUX7fM9eFZ3dIp
 eM7Z6UrBVw+re5s3A1IKIeDxVc/c8Hc9tJHXY7TvT/8F6+Nbfwwovr5Q9RrEebU8MsgE9hmfxax
 vWI+V+2BtQY41YoAexQuMJLNNR0uNCj2exx7qTXwaNHikgVCAKWHcuupA43bUXrL+b8uKbdRS48
 Kgee/4QAGSErpRmGLglurGa/MNQRCSbu0kILLyDarUkbCtt6GSIly/TKu+Nq7KEWzeHrrWBrjkt
 NrskaG0gNs5bGHTskhN9/X7reUvqW87tAgvrxqpiN/RmDiWkNWY2/C1Ik+jv44/IKU/OQVoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180086

Crypto reprogram all keys is called for each MMC runtime
suspend/resume in current upstream design. If this is implemented
as a non-interruptible call to TEE for security, the cpu core is
blocked for execution while this call executes although the crypto
engine already has the keys. For example, glitches in audio/video
streaming applications have been observed due to this. Add the flag
MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
keys to crypto engine for socs which dont require this feature.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>

---

Changes in v3:
- Renamed MMC_CAP2_DONT_REPROGRAM to MMC_CAP2_CRYPTO_NO_REPROG
  in the commit message for clarity.
- Added parentheses around the condition: (host->caps2 & MMC_CAP2_CRYPTO)
  to improve readability and correctness.
- Updated the comment associated with MMC_CAP2_CRYPTO_NO_REPROG 
  to better reflect its purpose.
  
Changes in v2:
- Renamed MMC_CAP2_DONT_REPROGRAM to MMC_CAP2_CRYPTO_NO_REPROG for
  improved clarity.
- Defined MMC_CAP2_CRYPTO_NO_REPROG for MMC targets that do not support
  a Crypto Engine.
- Restricted the usage of struct crypto_profile to MMC devices that
  support a Crypto Engine.

Changes in v1:
- Addressed the comments from:
  https://lore.kernel.org/lkml/20241006135530.17363-3-
  quic_spuppala@quicinc.com/T/#m69c9ab538bd9efd54515646952d0d7d1d7c17690
- Avoided reprogram of keys for Qualcomm SOCs only.
- Ensured reprogram of all keys on host controller reset.

---

 drivers/mmc/core/crypto.c    | 2 +-
 drivers/mmc/host/sdhci-msm.c | 6 ++++++
 include/linux/mmc/host.h     | 5 +++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
index fec4fbf16a5b..a5a90bfc634e 100644
--- a/drivers/mmc/core/crypto.c
+++ b/drivers/mmc/core/crypto.c
@@ -15,7 +15,7 @@
 void mmc_crypto_set_initial_state(struct mmc_host *host)
 {
 	/* Reset might clear all keys, so reprogram all the keys. */
-	if (host->caps2 & MMC_CAP2_CRYPTO)
+	if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
 		blk_crypto_reprogram_all_keys(&host->crypto_profile);
 }
 
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 66c0d1ba2a33..ee6783555f2e 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1920,6 +1920,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
 	return 0;
 }
 
@@ -2497,6 +2498,11 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
 	usleep_range(200, 210);
 	reset_control_put(reset);
 
+#ifdef CONFIG_MMC_CRYPTO
+	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
+		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
+#endif
+
 	return ret;
 }
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 68f09a955a90..4a80da07cf39 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -459,6 +459,11 @@ struct mmc_host {
 #define MMC_CAP2_CRYPTO		0
 #endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#ifdef CONFIG_MMC_CRYPTO
+#define MMC_CAP2_CRYPTO_NO_REPROG	(1 << 29)	/* Host handles inline crypto key reprogramming */
+#else
+#define MMC_CAP2_CRYPTO_NO_REPROG	0
+#endif
 
 	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
 	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */
-- 
2.34.1


