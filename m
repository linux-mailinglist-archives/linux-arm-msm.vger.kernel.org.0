Return-Path: <linux-arm-msm+bounces-61878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C73AE16EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 11:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAE675A0B8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 09:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E324527EC97;
	Fri, 20 Jun 2025 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fP46PjRI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0931130E845;
	Fri, 20 Jun 2025 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750410225; cv=none; b=mmVajhgkagxJZa5h1l6wwHv5e6UOdTiiQgFeyAnvgqQvKxQoNWaOIGx9Cd1FFvuOb7llrAatrUmfie+35IFIpHbfEQwo/TvTX1fX/RS/W36IXY4vkSTEGDAn6Vs6nU3zc5EfV4OKFFY8Z7a+pBmP1YMNdtPh+aCABdZrlEfrHhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750410225; c=relaxed/simple;
	bh=NiroWWAQTPQmDKUSLQeuYYIybCwyICBp58ULQi6D1NM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nWQm9dc1RLaqCs85MxQpNFZCnjecOANUSI259HjZGD4ml0avpcjqKMVuNxMUqjfs7MKNTotYdqXgNjc9pGpKyIhvR5PpBItoZhvJQJymSi9TNZF/vQ0QzeuOYemg+PAZMqwtmrPKKjzS27IonfxCrL7OZfnFVK/Qrbm2xLk+4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fP46PjRI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K76nr6025769;
	Fri, 20 Jun 2025 09:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iI/2yIGDBcnfjcHVQrG4/lhQL5Mu6uGouh7
	2UAn+AS0=; b=fP46PjRISFCiNb9v4jboZy6+JsHeOyJrI2adLYTaJ7fr8BTOAcR
	qf87CWH8Zj94MFBbPuGyyUligG/+n+LbpylrcXocBbC/4RXE5RCGP0BZyQxgRQQw
	Qxp5jZXXAcSNGvvzwT2dg8ttVbbCLJ4SuolWa1TotH/gqPto4FoZtTRCHXiWWe1o
	8/pWx0rY+MMzeU27qFex6oDxextOpqaUaT42+GJDwxXcdmKBAqXwl6F/vG9fSqVH
	flhxLz9P3L/QX8IH8QN0XViqcSKurwoUJM8AyYGchyjIlKzJEMHSMWFbsIUHQJVm
	D1V4dENPxw/K4Flkht59B6rN/BqL8uASQDg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791cs2gt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 09:03:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55K93aAO013033;
	Fri, 20 Jun 2025 09:03:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 479k1hpv4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 09:03:36 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55K93af0013028;
	Fri, 20 Jun 2025 09:03:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55K93aRm013026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 09:03:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 509625BF; Fri, 20 Jun 2025 14:33:35 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V2] mmc: sdhci-msm: Ensure SD card power isn't ON when card removed
Date: Fri, 20 Jun 2025 14:33:33 +0530
Message-Id: <20250620090333.3068568-1-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5hn7trmWggPFowAdWSuYzNdR0U8ZpZas
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=685523ec cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=2lEq4vhO8TPxx0hvuHkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5hn7trmWggPFowAdWSuYzNdR0U8ZpZas
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA2NiBTYWx0ZWRfX5hRI4M8TkTzs
 Ad0am/pgP5sgegbYAygjmQ6mOnFhc1EpoidtJeTt+Oyl9mjUCBvg4Sq8vW54yq4EOy4MZJqek/s
 W+SRRiJNK6HmqWXxsjBf3/J0LZJcW7EGJ1F22BirxIZuTDMg6g3X9xr5BIvj5uxlwSm6MN5f52I
 ebr9Y0zIuDSa0CH1qnf9uDtitA1VIY1PM/zx2PbbQGOc+HDehJXymjmClviAE14bMN6nc48nJuV
 oEbI7myyXVncp+9w1bOJTUPpzRvGsUnbhCabzZ78vngiDfCXbw/UbRV37KizBrZyH6yxfapKs/0
 9zYsDh0G3tNZwIA7khD02uTibFB8Opk0APqkLjEx9uHEa4PhOIVIQYAv4b1hGgBkZ/BAxSReDik
 sQoOVIQVjbbcZuEQ5zO3S78vVl5bkvh7/w7BvOoauVh0l4m63kTuWhd3hCR6wyiXZTCNHFzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200066

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
Changes from v1:
As per Adrian Hunter's comment :
- Removed unrelated changes
- Created a separate function get_cd for cleaner code
- Used READ_ONCE when getting mmc->ops to handle card removal cases
- Reordered if check conditions
---
 drivers/mmc/host/sdhci-msm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index bf91cb96a0ea..97a895d839c9 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1566,6 +1566,14 @@ static inline void sdhci_msm_complete_pwr_irq_wait(
 	wake_up(&msm_host->pwr_irq_wait);
 }
 
+static int get_cd(struct sdhci_host *host)
+{
+	struct mmc_host *mmc = host->mmc;
+	const struct mmc_host_ops *mmc_ops = READ_ONCE(mmc->ops);
+
+	return mmc_ops && mmc->ops->get_cd ? mmc->ops->get_cd(mmc) : 0;
+}
+
 /*
  * sdhci_msm_check_power_status API should be called when registers writes
  * which can toggle sdhci IO bus ON/OFF or change IO lines HIGH/LOW happens.
@@ -1579,6 +1587,7 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_host *mmc = host->mmc;
 	bool done = false;
 	u32 val = SWITCHABLE_SIGNALING_VOLTAGE;
 	const struct sdhci_msm_offset *msm_offset =
@@ -1636,6 +1645,12 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
 				 "%s: pwr_irq for req: (%d) timed out\n",
 				 mmc_hostname(host->mmc), req_type);
 	}
+
+	if ((req_type & REQ_BUS_ON) && mmc->card && !get_cd(host)) {
+		sdhci_writeb(host, 0, SDHCI_POWER_CONTROL);
+		host->pwr = 0;
+	}
+
 	pr_debug("%s: %s: request %d done\n", mmc_hostname(host->mmc),
 			__func__, req_type);
 }
@@ -1694,6 +1709,13 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 		udelay(10);
 	}
 
+	if ((irq_status & CORE_PWRCTL_BUS_ON) && mmc->card && !get_cd(host)) {
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
2.34.1


