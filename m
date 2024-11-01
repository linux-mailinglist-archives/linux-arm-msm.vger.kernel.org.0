Return-Path: <linux-arm-msm+bounces-36664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A1F9B89C9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 04:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F3401C213EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 03:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC60414601F;
	Fri,  1 Nov 2024 03:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H1t9XVOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3183CD2;
	Fri,  1 Nov 2024 03:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730430950; cv=none; b=FWu2BIm5SGDZeUOb8jH7h5jL5xo58FdulQzsVe7T+yvoxJyRrvaJAQpwXvB5fRu2w9q42BkCLmquF9SafIChIvJT0cX6AKxt0An4uR2H7mHyiY3HZ8LHGtfrYsTyI+GEI4rZhV+bio2NWbLqfLLrjzMtBFOlBpGdMpraF/7iJ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730430950; c=relaxed/simple;
	bh=GuWWKSeR/xNatDcRsPYg1EfWJZ7eZ7CgdI+vagixp5c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=JmH6zNLlb7COFQjcuTIf0OWVx9TaHi7+HrmOZk375Fs54SUTEndy2LbVYDk5F0ZtR/CfU9QVphnip1O0+QkuIGVAVPyU6s9uxKnQBBKLimNxxTZG30rgl0ioHtHiTsDuMWceR7EBVP9EwT+O70YWi+pkFqdNxv82vpDsBtKVU1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H1t9XVOo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VIXGRK003880;
	Fri, 1 Nov 2024 03:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=pAAKEslGDmKlUmubCe9qlzDUjPpQGe5AJtyoPPD01fw=; b=H1
	t9XVOokBQLGV8XqLW6b37vijT9e4/TX4pf7uoKCFq1c85JMYDrs9BcN6zizI6oc5
	fXtpSCK0r3XL1IkdRYVVYWUh9HIARJG7/UvF0P6IzKn4Gj9mq5Gqk1M0UReykcaD
	ceH/AhL1onJ7BjIHRk0iWPqMJb/gOT6RtR4ys+Bby81yi3Lxde392lTKfx3pry5C
	NjsEj5FUzZfeqmH3EXwaB1G0a3S7WFkZ+bT+3TcIURc2NqCKjsoxrzeIM0YPJQva
	GghoyxHPxF/++qbWzVOefu2O0KECHvL7Ivv/bICxp70+/+H+uQME5Fqpg8UlHtBz
	bbQD9yMUohm8DY7/Nbyg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m65pasvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 03:15:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A13FfF4010613;
	Fri, 1 Nov 2024 03:15:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42gsgmd4ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 01 Nov 2024 03:15:41 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A13FeTo010586;
	Fri, 1 Nov 2024 03:15:40 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4A13FeFL010583;
	Fri, 01 Nov 2024 03:15:40 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 842BC500921; Fri,  1 Nov 2024 08:45:39 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_gaurkash@quicinc.com, quic_neersoni@quicinc.com,
        quic_spuppala@quicinc.com
Subject: [PATCH RFC 4/6] mmc: host: wrapped keys support in mmc qcom
Date: Fri,  1 Nov 2024 08:45:37 +0530
Message-Id: <20241101031539.13285-5-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241101031539.13285-1-quic_spuppala@quicinc.com>
References: <20241101031539.13285-1-quic_spuppala@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: voRrEGtRlKVC3TQeXO4L1metYcSjAK2D
X-Proofpoint-GUID: voRrEGtRlKVC3TQeXO4L1metYcSjAK2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010022
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Use the wrapped keys quirk when hwkm is supported/used.
Whether to use HWKM or not would be decided during an ICE
probe, and based on this information, MMC can decide to use
wrapped keys or standard keys.

Also, propagate the appropriate key size to the ICE driver
when wrapped keys are used.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 0f2ce93f85cc..f031a4dbc719 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1834,6 +1834,9 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	msm_host->ice = ice;
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
 
+	if (qcom_ice_hwkm_supported(msm_host->ice))
+		cq_host->quirks |= CQHCI_QUIRK_USES_WRAPPED_CRYPTO_KEYS;
+
 	return 0;
 }
 
@@ -1880,7 +1883,11 @@ static int sdhci_msm_program_key(struct cqhci_host *cq_host,
 		cap.key_size != CQHCI_CRYPTO_KEY_SIZE_256)
 		return -EINVAL;
 
-	ice_key_size = QCOM_ICE_CRYPTO_KEY_SIZE_256;
+	if (bkey->crypto_cfg.key_type == BLK_CRYPTO_KEY_TYPE_HW_WRAPPED)
+		ice_key_size = QCOM_ICE_CRYPTO_KEY_SIZE_WRAPPED;
+	else
+		ice_key_size = QCOM_ICE_CRYPTO_KEY_SIZE_256;
+
 	if (cfg->config_enable & CQHCI_CRYPTO_CONFIGURATION_ENABLE)
 		return qcom_ice_program_key(msm_host->ice,
 					    QCOM_ICE_CRYPTO_ALG_AES_XTS,
-- 
2.17.1


