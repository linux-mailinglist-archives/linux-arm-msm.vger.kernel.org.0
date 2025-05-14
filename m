Return-Path: <linux-arm-msm+bounces-57825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 137CAAB698E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B970618974B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 11:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7F72749EC;
	Wed, 14 May 2025 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lJWRGsXq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31293274660;
	Wed, 14 May 2025 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221130; cv=none; b=UJUkTMiIddmDNZkiQFWiz8Tpmh/RpCB10YbH4SiQ1k+M2s2E+avnDMivBOzUka0cGhF+InSp7cORXLXmg7DKaiZlScbSn/mzY0eZNDpJXrcXTeD2IzNkURNA8c02rWGKDeBB0ZySYZygOAFM7TOLMYeAjQ2Fm0v+LQ4l0dV6hCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221130; c=relaxed/simple;
	bh=fGENwVCbv5FAl23VQVhGJhL7mKWawg7rz15OWL9A3oM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=GSuieDZsWJbe5jb5ht/dQlH+Hg35VHqjKyVagfavepruXwSof7ce92oTHt+BJuvfXMNF02BHWED0gqCOZb2VlitZHNpzPA6k4tmSrGk6AKT7HPcEscasFPEsA+eejkZjluVCxEJt6+tpqi69VNHpvcMtvUjDW6snCzUPnh1DRf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lJWRGsXq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuogu012655;
	Wed, 14 May 2025 11:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=pgWmG9XpBGKvrmuf44Q57jGgbxAKC1iXH0u+e7BDa/k=; b=lJ
	WRGsXqlSEj4LxaPbVWAt3SKwgYQcYE4wttikRqyZdIVDKSwhlV+7DSvhiSUZJzXG
	WC/j0GZfA0ONL0tyVzZ2C5CN0ZfzBCXjHgVD8oJYnUeUGPnwFlqVxi1rFBsD1ij3
	cLEItlataG6Pnkboc6Uc+e4xvLIkHMSP+N/Z/NfT+rDWJN3078/TlVqy8PxEUYx3
	5+RkKyoRtjvnpgewuWcBGRtGaOnI66/Z0Dw/KOjvCdYUnSSv1z9U1kbaf6oZDhJ7
	6x3AUrDUv14cm+O0g36/Q4YxKyFFonvE9MChy2bs3SR2H3WKOAnkK83qkn1+A6Jc
	JhprBOcqg+SacdbqhY3Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyjegv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 11:12:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54EBC4Ji008632;
	Wed, 14 May 2025 11:12:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46hyvm3g4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 14 May 2025 11:12:04 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54EBC3PU008615;
	Wed, 14 May 2025 11:12:03 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 54EBC3v5008603;
	Wed, 14 May 2025 11:12:03 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id B7CE75000C0; Wed, 14 May 2025 16:42:02 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V2 2/2] mmc: sdhci-msm: Enable force hw reset during cqe recovery
Date: Wed, 14 May 2025 16:41:55 +0530
Message-Id: <20250514111155.10896-3-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250514111155.10896-1-quic_sartgarg@quicinc.com>
References: <20250514111155.10896-1-quic_sartgarg@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LQWUspixiVJ9QTgcgvRhUnjhh9JV0bya
X-Proofpoint-ORIG-GUID: LQWUspixiVJ9QTgcgvRhUnjhh9JV0bya
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68247a87 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=utWEQhmKpaP70r5422AA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA5OCBTYWx0ZWRfX8+0OOOW+eGQR
 YFII00faMMgkaclsYA8UeOgcOQAeHDO4/9iIWO9mgKT/p4iHaZ/Ym+IbpXoeeJaDUJYkKzJIDNk
 f29Cszagwv2eHd8+yvhpvVrcRMpmh35yM6F12tF1sVVl5V7ZP5XsJgRV3MzqITSxfP1Vl9YIfLz
 BeMcmRCcDiQ6dPlArNlsA1YbRmEC7RLq3QedPXyTX8oCazRwZKLDnbL5gMFbiervkV6LY7uncgZ
 EJsraxrzTnG7/zw56cJ0QqYTXDvcRVzqGmpZ8fCzYftBwP2J56xc+T6NJ2OM31Hp8CHH3XM7emA
 1sEYa9ce5go08LiGpqX+MetYBlpNTXCPbzJAv0m6q48gV+nzKOu9ozbYidYy6CCU+4x7NVzHmcm
 L7P81hfmuWwI3pld9CIGCRfRc2bjkIrAxkmnMwjcDiRcsTm2fko4L9/FM6onbt/aum1FPWNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140098
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Enable force hw reset during cqe recovery to make recovery more robust.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci-msm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 66c0d1ba2a33..711252ad24a9 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2730,6 +2730,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
 
+	/* Enable force hw reset during cqe recovery */
+	msm_host->mmc->cqe_recovery_reset_always = true;
+
 	/* Set the timeout value to max possible */
 	host->max_timeout_count = 0xF;
 
-- 
2.17.1


