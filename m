Return-Path: <linux-arm-msm+bounces-57824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D47B8AB698C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B83947B3F81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 11:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B739274671;
	Wed, 14 May 2025 11:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WZ4ATRzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED8272E7A;
	Wed, 14 May 2025 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221129; cv=none; b=IIo0FheB/+KTkIfFKY+RCJiwVlH/i4+aiYql4o4/1eKWt7u+7TFrfqSDnoKSfjqFurAoR36VXv+OSp/ky6uiphwh01XeR4JABYGPenSjeOan7YG7bsXAYs+OlwZ3dKqmwF00cNBz4UNtL/eZ4UcTxaRpKngCdy+hmXUC30kPalc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221129; c=relaxed/simple;
	bh=04nS+cfy0tGNWeUJnZLrl/1pgS709CRuAavvjB+NQok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=tNU9sFkZ+VAvwjp6G8FHmuR7Si76+0ikKrDKTKOnXJ29It0+vk8RxtoVvVbhkGlaX00Qb0RUzIKrr+p3R3aRzkXMKt2c4DaI9YTAiHRTEbDdBsnvZQ59OQ0n7tkItsz81bQzFs/+v6VlN4PfoywNEQTkVYMaorc+h/Ribe4q4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WZ4ATRzU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAv9ai014273;
	Wed, 14 May 2025 11:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=lta9GOl33c9Ar5b3241DrspYMGy1HhLFgOzyRkF+b4Q=; b=WZ
	4ATRzU+PzgsEWmcd/S/bjFHRy+1zYwBl4B7E+42LPokwsyllfl/miKNgJnA5zzMl
	N46PYvtG22cTpGcJ9v6cNtq9WHW0QB+ChYZmIu5Sms8YvQ2HQDlTar6BB1qHsFc6
	1cONDmWm+sBshTinDI+Nbingef8iYjLQkMQQ6TPnQhvel/qo5k0NL86LGA+i+Eqm
	Ld7b/EMWT/lD+h5neR4zXBDFegJv+WLeeHBHZdKWIwtSfM6A7Nd4vsyyqaIe+rXQ
	o0LaWqMS7OFL9vTkfxkLN6NI6WYgRoYAqJ5idujsi6gJKo21vQY2iQK/uijlJwiV
	G32G8y6T9eS/C/gaqFMA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmjegp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 11:12:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54EBC2Ov008597;
	Wed, 14 May 2025 11:12:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46hyvm3g48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 14 May 2025 11:12:02 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54EBC2hV008588;
	Wed, 14 May 2025 11:12:02 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 54EBC2Xx008564;
	Wed, 14 May 2025 11:12:02 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id 8B4FE5000C0; Wed, 14 May 2025 16:42:01 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V2 1/2] mmc: core: Introduce new flag to force hardware reset
Date: Wed, 14 May 2025 16:41:54 +0530
Message-Id: <20250514111155.10896-2-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250514111155.10896-1-quic_sartgarg@quicinc.com>
References: <20250514111155.10896-1-quic_sartgarg@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA5NyBTYWx0ZWRfX19J8pUk1jBmr
 Dq78ALMjz0hxNbLL3pT9aAhKSowCRXMdT59j71ejc5NYlIteVBcwNSLc2Bu8msQU3awt2kxp3I5
 xq1cOvCik0JX6zeTrvSoj6yF6GaYb2tlq2JC5HiFM6J4Td635b7n5xjliT+vfd58Y8yurAUcLIL
 pE/BNh/xybD88grQVRI11Ql+l3oEnnEn9rxoXbxESG4RS1w4C984VqsYVONekIytQ8EqavwTO4e
 4HONuqQ+h4WazKqtq64C1KufmAwubJxa1Uxx96m2lKK0QEB5u2cglflcDSCCTJyv13Dc5EYJak/
 MnZqPTL4tpDBRm0RTVkPAvNDIphtm4dEtSDPc1QGdtj5qr+AuU4U8D4Vlns2ZHXTYEiZQVU2Swm
 OTHujBta3d9yFQIiPTXiXD31lpnAcnw6DEjbHOlX2r6AzQb11odYOMGV6Y93Vrzi7/ZL++TZ
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=68247a86 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=gJLBfjksfsrz6O4xON0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GWmye46esodWB3DGXQPHijOs2JX3bpMF
X-Proofpoint-ORIG-GUID: GWmye46esodWB3DGXQPHijOs2JX3bpMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140097
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Introduce new flag cqe_recovery_reset_always to allow vendors to force
hardware reset during cqe recovery.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/core/block.c | 2 +-
 include/linux/mmc/host.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 585c2b274d98..dce2fb762260 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -1622,7 +1622,7 @@ void mmc_blk_cqe_recovery(struct mmc_queue *mq)
 	pr_debug("%s: CQE recovery start\n", mmc_hostname(host));
 
 	err = mmc_cqe_recovery(host);
-	if (err)
+	if (err || host->cqe_recovery_reset_always)
 		mmc_blk_reset(mq->blkdata, host, MMC_BLK_CQE_RECOVERY);
 	mmc_blk_reset_success(mq->blkdata, MMC_BLK_CQE_RECOVERY);
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 68f09a955a90..d686adf75293 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -554,6 +554,7 @@ struct mmc_host {
 	int			cqe_qdepth;
 	bool			cqe_enabled;
 	bool			cqe_on;
+	bool			cqe_recovery_reset_always;
 
 	/* Inline encryption support */
 #ifdef CONFIG_MMC_CRYPTO
-- 
2.17.1


