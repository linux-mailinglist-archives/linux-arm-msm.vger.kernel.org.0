Return-Path: <linux-arm-msm+bounces-33229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90090991EAA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 15:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB4231C20D03
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 13:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D783A8D2;
	Sun,  6 Oct 2024 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JHxjFDAv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B15D53C;
	Sun,  6 Oct 2024 13:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728222942; cv=none; b=r/wm5It4xWBTn6zeyR4X/sO9Vgs2/5DZAZAkNHDkOyk4thfwMJntavWiJ+eL7dnCf/HLVp6rNH2a0RF2PKMQUAOSmOdGqOguSfizisJA6ygE/bCg+Y02yjmeYWxJCYP1lFf4tkoH50/lHSti2bVyvbll5Inbk7c4RzM5iQUGLlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728222942; c=relaxed/simple;
	bh=i7Tj07DVGQnK1/yDgbRv2PMqc9dLminHBJWME4HreDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=PcIK80F94CV6MnHwT6X0xcmaUm9YvQJLXhs2Sorqfmt3s//R/45Fa9SQzwJpovMfHzqDfZhI8lf1GV3HnrFWV0sylZ2gyvcZO1MFwYhC7YUi2Xu+0Y2kZcZhYPMRgja6D+0A4bbnkth2Yyoum0zIAbjGQ10ZR4F7GiKQAFmXgGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JHxjFDAv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 496BlRh1020507;
	Sun, 6 Oct 2024 13:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=LfL3TpIBWRgObayjQ6MmvC7b0+pNk0isJmmj1w1B9Ac=; b=JH
	xjFDAvaKfWGaFs40yGqTJjWQQV7F1+tKyly4R1+XNv/ErlU1kaiIcdAu3j7uZ2Ys
	4zwI4qizWDstdCBog747qdP6mcB3+p3w9oMtvBnAO5LmDYefOaMunDWABLpqHwdf
	riSmZDt821z4/Mw0449SeQa+56L5T3Xz7gpmbr0dJKBkWB4L+W73rVn8tHLFjb/g
	Jgv9hcEN6OsIGKag/EXGkE8INR3dIXCrGNgIdDALBfRMpC942xILZs94F+M/Ed16
	A+UcVBb3o1GOEU+hdhbKQOCR+EcEacN1W26DUJzqrv0bnuYc0nLZ9aVoGo+zeA3A
	x3Vu5la5zDZ1YkgBoG0g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv6t2dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Oct 2024 13:55:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 496DtVVE015205;
	Sun, 6 Oct 2024 13:55:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 422xhkgnnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 06 Oct 2024 13:55:31 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 496DtVmZ015190;
	Sun, 6 Oct 2024 13:55:31 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 496DtVVH015186;
	Sun, 06 Oct 2024 13:55:31 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 9C1636017A2; Sun,  6 Oct 2024 19:25:30 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_neersoni@quicinc.com,
        quic_gaurkash@quicinc.com, quic_spuppala@quicinc.com
Subject: [PATCH RFC v3 1/2] mmc: core: Add vendor hook to control reprogram keys to Crypto Engine
Date: Sun,  6 Oct 2024 19:25:29 +0530
Message-Id: <20241006135530.17363-2-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241006135530.17363-1-quic_spuppala@quicinc.com>
References: <20241006135530.17363-1-quic_spuppala@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: V5GZ3Fmp88sUt84Q4erHAxilWmv4Mppb
X-Proofpoint-GUID: V5GZ3Fmp88sUt84Q4erHAxilWmv4Mppb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410060101
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add mmc_host_ops hook avoid_reprogram_allkeys to control
reprogramming keys to Inline Crypto Engine by vendor as some
vendors might not require this feature.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/mmc/core/crypto.c | 8 +++++---
 drivers/mmc/host/sdhci.c  | 6 ++++++
 include/linux/mmc/host.h  | 7 +++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
index fec4fbf16a5b..4168f7d135ff 100644
--- a/drivers/mmc/core/crypto.c
+++ b/drivers/mmc/core/crypto.c
@@ -14,9 +14,11 @@
 
 void mmc_crypto_set_initial_state(struct mmc_host *host)
 {
-	/* Reset might clear all keys, so reprogram all the keys. */
-	if (host->caps2 & MMC_CAP2_CRYPTO)
-		blk_crypto_reprogram_all_keys(&host->crypto_profile);
+	if (host->ops->avoid_reprogram_allkeys && !host->ops->avoid_reprogram_allkeys()) {
+		/* Reset might clear all keys, so reprogram all the keys. */
+		if (host->caps2 & MMC_CAP2_CRYPTO)
+			blk_crypto_reprogram_all_keys(&host->crypto_profile);
+	}
 }
 
 void mmc_crypto_setup_queue(struct request_queue *q, struct mmc_host *host)
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index fbf7a91bed35..cd663899c025 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -2704,6 +2704,11 @@ int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
 }
 EXPORT_SYMBOL_GPL(sdhci_start_signal_voltage_switch);
 
+static bool sdhci_avoid_reprogram_allkeys(void)
+{
+	return false;
+}
+
 static int sdhci_card_busy(struct mmc_host *mmc)
 {
 	struct sdhci_host *host = mmc_priv(mmc);
@@ -3066,6 +3071,7 @@ static const struct mmc_host_ops sdhci_ops = {
 	.execute_tuning			= sdhci_execute_tuning,
 	.card_event			= sdhci_card_event,
 	.card_busy	= sdhci_card_busy,
+	.avoid_reprogram_allkeys	= sdhci_avoid_reprogram_allkeys,
 };
 
 /*****************************************************************************\
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 88c6a76042ee..c4109d17f177 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -218,6 +218,13 @@ struct mmc_host_ops {
 
 	/* Initialize an SD express card, mandatory for MMC_CAP2_SD_EXP. */
 	int	(*init_sd_express)(struct mmc_host *host, struct mmc_ios *ios);
+
+	/*
+	 * Optional callback to support controllers that dont require to
+	 * reprogram all crypto keys on card suspend/resume.
+	 */
+	bool	(*avoid_reprogram_allkeys)(void);
+
 };
 
 struct mmc_cqe_ops {
-- 
2.17.1


