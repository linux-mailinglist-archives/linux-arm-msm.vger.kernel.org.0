Return-Path: <linux-arm-msm+bounces-36665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E24C9B89CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 04:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5E2A1C20DFD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 03:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51461465BA;
	Fri,  1 Nov 2024 03:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l+xpdnZH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5C213C9A4;
	Fri,  1 Nov 2024 03:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730430950; cv=none; b=aM8YJny1/zAUsqTJyhLuysr1QVaejspUOL27LHHcQZuFkHuC5fb24KDow+eHziXO43p96PF7CVF09ub3HS2I8CulHETEdNJhVgrPlfndBjYwdl/0Yeg74nuTb5v4JYpD8/rWdWINvmfRBLn48BBQ8uoM+u5EOX/7Pf7256iZRFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730430950; c=relaxed/simple;
	bh=0RPPg0R4ALvfhtisl+UWHbWE/CvtOXVfpRFXof/yMDM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=MA3KMoCx4jKHPxLTAUbTZ3TLrTutq+qvpPQ6rs53Alo9s6mSSmzjDNbO5P/IGwjDvy6h5jNd+mfIp8fW6Ay6NW0fRhzyiZE7WyeXVESWmGm4Mrkv2gk7m42IDhIH5AEKn28CImCYcpAAin6C0SBRaGsD5N/53qDAoHE3NNJFY8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l+xpdnZH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A10jlEC009603;
	Fri, 1 Nov 2024 03:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=PSrDiGHQijChlXUShl5iswxDrOPeP3DojCKDMncNryg=; b=l+
	xpdnZHIp6cpmLCYR4pxiw9vLedSvsmP4/uO0qrrcHvgoW6DCYaBQxU2QaIrVslIB
	RNynXLCeFSn5nTli8bLyK5O+Y9lhzExz3DzFSb/gwIEK6KT/Ptp5fzyih7EswjOS
	DBgam6irpyvpvHFBz6J/4mync+XxN8jW+LmEkzyz1QLTp+ADvbYbsdOMoOq6C/Xg
	UNdUODIG7Wkg3I2bUZZDPsKo78Qb+4wfFYRyrFQ7Jccr0UP+S/HpdD8diDeF4yue
	T6vtuTYAHAuyawPtHnlVtjvy11VdRFYw8uq+rQFRKpQ6Dr4i2s8vjdrr1IuaPPCV
	uLAak2vh8t3y01+kXCmA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kjm1e09g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 03:15:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A13Ff8x010638;
	Fri, 1 Nov 2024 03:15:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42gsgmd4tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 01 Nov 2024 03:15:41 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A13Fe2C010584;
	Fri, 1 Nov 2024 03:15:41 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4A13FfTQ010629;
	Fri, 01 Nov 2024 03:15:41 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 88F68500923; Fri,  1 Nov 2024 08:45:39 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_gaurkash@quicinc.com, quic_neersoni@quicinc.com,
        quic_spuppala@quicinc.com
Subject: [PATCH RFC 6/6] mmc: host: support for generate, import and prepare key
Date: Fri,  1 Nov 2024 08:45:39 +0530
Message-Id: <20241101031539.13285-7-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241101031539.13285-1-quic_spuppala@quicinc.com>
References: <20241101031539.13285-1-quic_spuppala@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dOF_7oWszTKsNxF_Mm_34WLSxcDA-go9
X-Proofpoint-ORIG-GUID: dOF_7oWszTKsNxF_Mm_34WLSxcDA-go9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010022
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

MMC defines variant ops to support generate, prepare and import
wrapped key blk crypto ops to tie these operations to vendor
specific implementations. This patch defines and implements
these variant ops for Qualcomm SoCs which uses eMMC storage.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index aba1d6e688b6..9b3090c1f917 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1912,6 +1912,37 @@ static int sdhci_msm_ice_derive_sw_secret(struct cqhci_host *cq_host, const u8 w
 	return qcom_ice_derive_sw_secret(msm_host->ice, wkey, wkey_size, sw_secret);
 }
 
+static int sdhci_msm_generate_key(struct cqhci_host *cq_host,
+				  u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	struct sdhci_host *host = mmc_priv(cq_host->mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	return qcom_ice_generate_key(msm_host->ice, lt_key);
+}
+
+static int sdhci_msm_prepare_key(struct cqhci_host *cq_host,
+			  const u8 *lt_key, size_t lt_key_size,
+			  u8 eph_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	struct sdhci_host *host = mmc_priv(cq_host->mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	return qcom_ice_prepare_key(msm_host->ice, lt_key, lt_key_size, eph_key);
+}
+
+static int sdhci_msm_import_key(struct cqhci_host *cq_host,
+				const u8 *imp_key, size_t imp_key_size,
+				u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	struct sdhci_host *host = mmc_priv(cq_host->mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	return qcom_ice_import_key(msm_host->ice, imp_key, imp_key_size, lt_key);
+}
 #else /* CONFIG_MMC_CRYPTO */
 
 static inline int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
@@ -2019,6 +2050,9 @@ static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
 #ifdef CONFIG_MMC_CRYPTO
 	.program_key	= sdhci_msm_program_key,
 	.derive_sw_secret	= sdhci_msm_ice_derive_sw_secret,
+	.generate_key	= sdhci_msm_generate_key,
+	.prepare_key	= sdhci_msm_prepare_key,
+	.import_key	= sdhci_msm_import_key,
 #endif
 };
 
-- 
2.17.1


