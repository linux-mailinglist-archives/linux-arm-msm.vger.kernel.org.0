Return-Path: <linux-arm-msm+bounces-60467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4ECAD00BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 12:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98DB81896716
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 10:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED7C286887;
	Fri,  6 Jun 2025 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="neHZTkBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA327FB35;
	Fri,  6 Jun 2025 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749206873; cv=none; b=TEN0P7P86Yj8l3lI3GaTPcLFsDAcE+Fqzx8jlbgh0SictIGE4zXN4UWhu9yMPfz147gyDC85LqlxYKEw+OfUhvcMT0LlVQ6KCO575MGyCmZ4/nUhJEnIMsFWqO+wGTzMBprj1OsRMILY7LDlaYqeMTnHBuruXvFXvW4unB9XcvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749206873; c=relaxed/simple;
	bh=QskOF1fBwiApH4/AwXD144gfb0R5kxegs360iIkwX4A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cs0EoqcDChiEeES+uQG2O2lYLn7hWAhQwE5KRMq9HqVYmlOtobqqbhfVaZAu4CdnCDLBjcc6+5rD/ZOTbbTC37xF8jkcZKHohP+fCR6dNNPEyLFqaeOafsCkObEpawFUEI9BeZG56X8mU2RnJp76mStxwY+leOLILKAec/mp5FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=neHZTkBR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565pR89006326;
	Fri, 6 Jun 2025 10:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hAPSsiUdvJ416pcpm4p/aT
	AD3Uul2pKU2G/WCD7xAW4=; b=neHZTkBR04EjSx8zUJeogduVY9E1GMt4xf7fDx
	b0IBRXIF/cfpRO7RoQKutkBh4Q/NeMuZVNDD5VMw6PYHyhCghNoQdfs4219bvTMt
	ubXNhtwA9hYvQhDrmCOMkU4MhwHWhDbtrLKb6aeVl4PnRG1C1IMjDpV2YEE4Rh8w
	wqPGyPRq0ERfaBDT89JPkkfalZ7FudRN219clT+W+z43UUeMEFRWyo0TJS5IBBVn
	Cr5iuRUJKRXEYH2Zqz1XT2ngUSRIYqM3+lFmgWIu/5dBDvNdUM4uGUhHur7mxQaG
	grQMnZUme6Yt3xFA11++0bWZ9Axfa06p0NxNyQEBpsjT4kOA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t4bud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 10:47:46 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556AlkAK001122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 10:47:46 GMT
Received: from hu-dmukhopa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 03:47:38 -0700
From: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <kernel@quicinc.com>,
        Eric Biggers
	<ebiggers@kernel.org>,
        Neeraj Soni <quic_neersoni@quicinc.com>,
        "Debraj
 Mukhopadhyay" <quic_dmukhopa@quicinc.com>,
        Ram Prakash Gupta
	<quic_rampraka@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        "Sachin
 Gupta" <quic_sachgupt@quicinc.com>,
        Bhaskar Valaboju
	<quic_bhaskarv@quicinc.com>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>,
        Seshu Madhavi Puppala
	<quic_spuppala@quicinc.com>
Subject: [PATCH v2] mmc: Avoid reprogram all keys to Inline Crypto Engine for MMC runtime suspend resume
Date: Fri, 6 Jun 2025 16:17:14 +0530
Message-ID: <20250606104714.1501297-1-quic_dmukhopa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: LrZwEgCPuoX7sMsO1t2kE6T5iZhrp6zt
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6842c752 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=1QBs8BvCmvQ6mH5QngwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LrZwEgCPuoX7sMsO1t2kE6T5iZhrp6zt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5NyBTYWx0ZWRfX/ryXZDAnRGlG
 OjiKXRUYxye73XvmkJr3Ne9b5DaMrdDswdbF4fOr6goipqfAw2wG/Kf9U2/nx3JS+qwyGJyN5/8
 U8qg0hzGLNIbY9SfKn5KxEQ+ySI+RM7loyrSDjTv4PgsFmRFzv5dY6McaBh6ZSOy/6+dKXJBOrn
 enRtDZF8vNj/71Gacq6ElUDiWN1WCwJFzq0wvEU8loaQXJETHjrjeSCOgWHE257GHJQPmTjDNrB
 lmy5in2ui9nxzsK70ft0rHOwJfceZ0I/mKo0xVHw1WLtKH3uWCtRDnxvgStDI7B1BUa/Bn8dygV
 k12BkOanWeXpaFSntQ/5NPN+T9JNdvFYDMaluJwhH4Qgb4BDgo7nym/aWdsbvUlZsG7AfC7l8ey
 pjmAwKwxsx8ZVNpZXOHOHzwYkG9pgCpzCGiZj9Uf5xRRBHfjwIBF4wclFzsB2WNGyR5iJQ3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1011 mlxlogscore=946 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060097

Crypto reprogram all keys is called for each MMC runtime
suspend/resume in current upstream design. If this is implemented
as a non-interruptible call to TEE for security, the cpu core is
blocked for execution while this call executes although the crypto
engine already has the keys. For example, glitches in audio/video
streaming applications have been observed due to this. Add the flag
MMC_CAP2_DONT_REPROGRAM as part of host->caps2 to control reprogramming
keys to crypto engine for socs which dont require this feature.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>

---

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
index fec4fbf16a5b..d41672e2856e 100644
--- a/drivers/mmc/core/crypto.c
+++ b/drivers/mmc/core/crypto.c
@@ -15,7 +15,7 @@
 void mmc_crypto_set_initial_state(struct mmc_host *host)
 {
 	/* Reset might clear all keys, so reprogram all the keys. */
-	if (host->caps2 & MMC_CAP2_CRYPTO)
+	if (host->caps2 & MMC_CAP2_CRYPTO && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
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
index 68f09a955a90..af3b3720aa9c 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -459,6 +459,11 @@ struct mmc_host {
 #define MMC_CAP2_CRYPTO		0
 #endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#ifdef CONFIG_MMC_CRYPTO
+#define MMC_CAP2_CRYPTO_NO_REPROG	(1 << 29)	/* Host does not support inline crypto key reprogramming */
+#else
+#define MMC_CAP2_CRYPTO_NO_REPROG	0
+#endif
 
 	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
 	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */
-- 
2.34.1


