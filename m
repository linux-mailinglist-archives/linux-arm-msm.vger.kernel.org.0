Return-Path: <linux-arm-msm+bounces-33228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264CD991EA8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 15:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50D17B217B6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 13:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B7319BBA;
	Sun,  6 Oct 2024 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iLgR1s2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ABFB67F;
	Sun,  6 Oct 2024 13:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728222941; cv=none; b=F5loLYkEw+VJF8LUIoKUiUnKi6+oF0+wHjbBjy13QUVWXO0GWCzzbK3kTazXlIZjDsQcjP1F2Q2Z1R5Ko+9vkGNacWDA7XI8LcAddCyHyU93qSiEyiM/SeAX6S0DISFsuY0DKeGFEuYsQVDV2cwBIdtTSiszDHHnFMChu2a2MsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728222941; c=relaxed/simple;
	bh=MYHJf4lj3n+HDqcWGj7t3rIwqbbwt9t4VigKu2pCda0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=PNwpUfb1O1JXGE2/zYha4/COyRe1qwtpulelSQMj1MlJCv2bdcaoStaVmUqZ3RFZ0fYc/a2XrM94Ms7uxz1xvO/RVoO65eswYffRV2WOsH38wi2aiYpve15IlrPAWIRuVTQtZyQSbyHqCKRWy8/jmRklupmChZ6iJ+dFkZl70t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iLgR1s2e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 496DLi0E007514;
	Sun, 6 Oct 2024 13:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=GM0WgxExW4LzLiSDR7xysZkDOr6U+InUUJOFL+PRPO8=; b=iL
	gR1s2emduvV0hZEsSPr0+9A9OSHnEcmsLtYv8XNzxBU7vB/D2/cg1q9fE3HMONzm
	bQg33UmNFgkCLYBlNFfIDh4jsDg3iw4LxzHJBuxR+GYDyl/vvVfQmkqV9g9o5V0D
	IusIFud/m82o8r0j896g5RSmNgczHxXbUJPDYMzGlXqDZx3o9GW5X7FjVr0LfjXD
	DjgEmdzf3YIMYjCb/IoniBDIGBZERSlCzqkGuiyyTspI687gpfISggA1tijxXXrw
	YPNsCmtO4l1ko2C/fyHa+g/vOBvz9ZLrSqffm1hfnhrt4uB77LL2t3GZnYD9DlS7
	gWvWRQ0XofTXKW8IgQSg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv8a1h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Oct 2024 13:55:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 496DtV2k015204;
	Sun, 6 Oct 2024 13:55:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 422xhkgnnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 06 Oct 2024 13:55:31 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 496DtVrP015189;
	Sun, 6 Oct 2024 13:55:31 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 496DtVL2015185;
	Sun, 06 Oct 2024 13:55:31 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 9E59B6017A3; Sun,  6 Oct 2024 19:25:30 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_neersoni@quicinc.com,
        quic_gaurkash@quicinc.com, quic_spuppala@quicinc.com
Subject: [PATCH RFC v3 2/2] mmc: host: sdhci-msm: Avoid reprogram keys for QCOM socs
Date: Sun,  6 Oct 2024 19:25:30 +0530
Message-Id: <20241006135530.17363-3-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241006135530.17363-1-quic_spuppala@quicinc.com>
References: <20241006135530.17363-1-quic_spuppala@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3O8pDHRBymviQolMkFDSabsMaYmMo8b7
X-Proofpoint-GUID: 3O8pDHRBymviQolMkFDSabsMaYmMo8b7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410060101
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Implement Qualcomm hook to avoid reprogram of all
keys to Inline Crypto Engine on runtime suspend resume
of MMC since keys are not lost for QCOM socs.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e113b99a3eab..427e0126459a 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1183,6 +1183,11 @@ static void sdhci_msm_set_cdr(struct sdhci_host *host, bool enable)
 	}
 }
 
+static bool sdhci_msm_avoid_reprogram_allkeys(void)
+{
+	return true;
+}
+
 static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
 	struct sdhci_host *host = mmc_priv(mmc);
@@ -2641,6 +2646,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	host->mmc_host_ops.start_signal_voltage_switch =
 		sdhci_msm_start_signal_voltage_switch;
 	host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
+	host->mmc_host_ops.avoid_reprogram_allkeys = sdhci_msm_avoid_reprogram_allkeys;
 	if (of_property_read_bool(node, "supports-cqe"))
 		ret = sdhci_msm_cqe_add_host(host, pdev);
 	else
-- 
2.17.1


