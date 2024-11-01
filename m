Return-Path: <linux-arm-msm+bounces-36663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 051A29B89C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 04:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0C1B1F24144
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 03:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F871459F7;
	Fri,  1 Nov 2024 03:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BI27d5Tj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA3413C83D;
	Fri,  1 Nov 2024 03:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730430950; cv=none; b=cXJ+JqIgj17s2l7uc1A0kcDD6l4xBCN0IFWCSdS2xy26WN1nf9CzKfVd8ow9qce1oMQuP7RcG2g7VQpuIMJYrWYzdVmBN6lVjejBcfvjXBxumLcpHL4M46CVqXro+VOyFHD7wO2vz0IErh3+2O98XG0pECqCBv6w5e2O/HEeePQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730430950; c=relaxed/simple;
	bh=Zbw3cciU18XnMOna37Dl9R+P5jMoeNsP2pVcoTOzDV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=G8jNDwiQSRK2ykbyi887YvSG7smFwHS3oTdDlp5GVqyF6bFToR8keTMZu0dgyc3Im4RAeK40M3jNWWLc5cFv1o6vv0+5tgfiFpHBjNGnM037yYIaspJ9ktgksjGnZlSoliRn5edai+9sPOD1SU8hCf1hwOHscvwpXvaQWz2FqLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BI27d5Tj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VCX9jH002324;
	Fri, 1 Nov 2024 03:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=k+I3jfrOqM1I9wbUUj7pxuJz32A7kXUo2hK6Ue5/OqI=; b=BI
	27d5TjZKfsNWs54L5cGD6LcxOOCp+qHrvyQT2720Vrwd95TZhXUbRTbQVaRt4XQg
	FME8/amRNuqLwFufCKy66b4f+ARaOENGvoRvOMeGwrw4MVlfkPr6i2x1P6Akj667
	XDFkauQCv/wpbdekRQlPyA1h5F73+iVwYb8v+b3dnbDRksi0p0/gGWkcoIn83giX
	PaO7+duZGHOWxWBrL+Z4d3UeQlxIrHZArOrONjbv4ojjmDL4mIAo+izAHRGnLZqQ
	uW1BHJ/RvY1VDIoWLq1IDWxkLZBzCuvGGb/zsg9dtNxzCuAJ3JsMowL6Z+Ol0yzN
	Qu7Ws0npgCN3AiutyUEw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmn5dm4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 03:15:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A13Fen1010609;
	Fri, 1 Nov 2024 03:15:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42gsgmd4ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 01 Nov 2024 03:15:41 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A13FeNE010587;
	Fri, 1 Nov 2024 03:15:41 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4A13FfVR010628;
	Fri, 01 Nov 2024 03:15:41 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 86991500922; Fri,  1 Nov 2024 08:45:39 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_gaurkash@quicinc.com, quic_neersoni@quicinc.com,
        quic_spuppala@quicinc.com
Subject: [PATCH RFC 5/6] mmc: host: implement derive sw secret vop in mmc qcom
Date: Fri,  1 Nov 2024 08:45:38 +0530
Message-Id: <20241101031539.13285-6-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241101031539.13285-1-quic_spuppala@quicinc.com>
References: <20241101031539.13285-1-quic_spuppala@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: E6qh5HOpKUXt6sS4s-yC28VEZpKy1Q2u
X-Proofpoint-GUID: E6qh5HOpKUXt6sS4s-yC28VEZpKy1Q2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=982
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010022
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

MMC defines a variant op to tie the corresponding
derive software secret blk crypto op to the vendor specific
implementation of wrapped keys. This patch implements
this variant op.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index f031a4dbc719..aba1d6e688b6 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1897,6 +1897,21 @@ static int sdhci_msm_program_key(struct cqhci_host *cq_host,
 		return qcom_ice_evict_key(msm_host->ice, slot);
 }
 
+/*
+ * Derive a software secret from a hardware wrapped key. The key is unwrapped in
+ * hardware from trustzone and a software key/secret is then derived from it.
+ */
+static int sdhci_msm_ice_derive_sw_secret(struct cqhci_host *cq_host, const u8 wkey[],
+					  unsigned int wkey_size,
+					  u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
+{
+	struct sdhci_host *host = mmc_priv(cq_host->mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	return qcom_ice_derive_sw_secret(msm_host->ice, wkey, wkey_size, sw_secret);
+}
+
 #else /* CONFIG_MMC_CRYPTO */
 
 static inline int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
@@ -2003,6 +2018,7 @@ static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
 	.disable	= sdhci_msm_cqe_disable,
 #ifdef CONFIG_MMC_CRYPTO
 	.program_key	= sdhci_msm_program_key,
+	.derive_sw_secret	= sdhci_msm_ice_derive_sw_secret,
 #endif
 };
 
-- 
2.17.1


