Return-Path: <linux-arm-msm+bounces-37038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB859BC95B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 10:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0B6F1F2315E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 09:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB0D1D2784;
	Tue,  5 Nov 2024 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UtfvhuZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C305C1D1F54;
	Tue,  5 Nov 2024 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730799324; cv=none; b=VrSbN79VEwHPjFGkSolv8Z9+V/hvq2gXBlnvzNrc1/Y3dtxqKo6ephFi9vn42MbxFjYQBPUZLt64w9e6sMwmXn3gwczt5KiObtynrR2LThSiScNBKdeLtZQlOInZ7eFjVcCWI882x4U8812slClAmMX96HyKgN8YQ7XUue0xze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730799324; c=relaxed/simple;
	bh=g+y6xSTDDc/4iOIBVWx79ClWRqfmXl4RFvMLEW9wxR8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=RBApoV35Q1jMWYoVFG3vPUkq8J7nJ1FflzLhtnKSyqBkKhlxy6YVkx9KL8nANGQqPzz2bTub2jgzTjZTlUesd2hIQjmBeTUjkp0XT0ryrRH1+5zyYkdHlLcM7ma1JvzacwRTuJp0Adj+/RwYT/OaM60EpRuOgqx83AxhN706QE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UtfvhuZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59WBmw021458;
	Tue, 5 Nov 2024 09:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=+3mobtsCqfmg
	gYkUHIHhRo0d7QRYbP9IuytZtXf6vV8=; b=UtfvhuZCDEGTe4pG19vjvOUSi6Sz
	IF+taeNNSOfak91Q7un4pFvDs7IRABjpO0PbNU1/iJuDOYJsFB7FXKFziyckLtuY
	dp7b75e6CKe2ecqsYsCihxQZRJF6vRI+K9f+RhFPHY9bQ1sOhgUaAAQpL1YiWI0a
	bNUFNF44oCI3gXvcqtddFEwxxmPBS/gwDDebplvCGOi50pYwNDUSzUVQujcJVIwk
	ElSdQ0PyMPy23NVs68oL+1wr0/bKX/TrrL8DZU3Gv4n9IRCwq+ywg5ZoCIb2vf1A
	47JeeMzOYZW2B61TH3LKka+C9RsXaIjL4hBVOPGiOYyZxFAx7KekDB1VEQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxy25x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 09:35:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59ZGj5018185;
	Tue, 5 Nov 2024 09:35:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42nd5m734r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 05 Nov 2024 09:35:16 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A59ZFp9018172;
	Tue, 5 Nov 2024 09:35:15 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4A59ZFfu018171;
	Tue, 05 Nov 2024 09:35:15 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id 8BE8F5001CF; Tue,  5 Nov 2024 15:05:14 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com,
        kernel@quicinc.com, Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V1] mmc: sdhci-msm: Ensure SD card power isn't ON when card removed
Date: Tue,  5 Nov 2024 15:05:13 +0530
Message-Id: <20241105093513.16800-1-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x9aDHvmvt2y_Csly4ndLBcZzAdca7YmA
X-Proofpoint-GUID: x9aDHvmvt2y_Csly4ndLBcZzAdca7YmA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050071
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Make sure SD card power is not enabled when the card is
being removed.
On multi-card tray designs, the same card-tray would be used for SD
card and SIM cards. If SD card is placed at the outermost location
in the tray, then SIM card may come in contact with SD card power-
supply while removing the tray. It may result in SIM damage.
So in sdhci_msm_handle_pwr_irq we skip the BUS_ON request when the
SD card is removed to be in consistent with the MGPI hardware fix to
prevent any damage to the SIM card in case of mult-card tray designs.
But we need to have a similar check in sdhci_msm_check_power_status to
be in consistent with the sdhci_msm_handle_pwr_irq function.
Also reset host->pwr and POWER_CONTROL register accordingly since we
are not turning ON the power actually.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e00208535bd1..443526c56194 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1516,10 +1516,11 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
-	bool done = false;
-	u32 val = SWITCHABLE_SIGNALING_VOLTAGE;
 	const struct sdhci_msm_offset *msm_offset =
 					msm_host->offset;
+	struct mmc_host *mmc = host->mmc;
+	bool done = false;
+	u32 val = SWITCHABLE_SIGNALING_VOLTAGE;
 
 	pr_debug("%s: %s: request %d curr_pwr_state %x curr_io_level %x\n",
 			mmc_hostname(host->mmc), __func__, req_type,
@@ -1573,6 +1574,13 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
 				 "%s: pwr_irq for req: (%d) timed out\n",
 				 mmc_hostname(host->mmc), req_type);
 	}
+
+	if (mmc->card && mmc->ops && mmc->ops->get_cd &&
+		!mmc->ops->get_cd(mmc) && (req_type & REQ_BUS_ON)) {
+		sdhci_writeb(host, 0, SDHCI_POWER_CONTROL);
+		host->pwr = 0;
+	}
+
 	pr_debug("%s: %s: request %d done\n", mmc_hostname(host->mmc),
 			__func__, req_type);
 }
@@ -1631,6 +1639,14 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 		udelay(10);
 	}
 
+	if (mmc->card && mmc->ops && mmc->ops->get_cd &&
+		!mmc->ops->get_cd(mmc) && irq_status & CORE_PWRCTL_BUS_ON) {
+		irq_ack = CORE_PWRCTL_BUS_FAIL;
+		msm_host_writel(msm_host, irq_ack, host,
+				msm_offset->core_pwrctl_ctl);
+		return;
+	}
+
 	/* Handle BUS ON/OFF*/
 	if (irq_status & CORE_PWRCTL_BUS_ON) {
 		pwr_state = REQ_BUS_ON;
-- 
2.17.1


