Return-Path: <linux-arm-msm+bounces-36875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A57089BAC54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 07:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6FBD1C20B9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 06:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3134A18BC13;
	Mon,  4 Nov 2024 06:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ps0ZnanM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2E718BC0D;
	Mon,  4 Nov 2024 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730700454; cv=none; b=DxgYEREguWrTF9rRBDrlDej1fPnqbJbmNy6g4OHxhxVqb64Cdqy/NLDvShsqyIZbMRN8Wwh/pEHqNrViqI4GBFGr7Zg76HYJGYALG+Tjf8IRVsgDxnb+MuYwIWS63KIXs+ckbxIerWtBJWmYntx0g0F9N3G+7OKb5hhv4j/BObA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730700454; c=relaxed/simple;
	bh=SUcaGBKEuufKEAxOQUtGgQ/TxG/c5ajxrCwDGqg9WOs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=XXZLnjcK9hUTOLs5HQoTg9CmairXI9kCdcw5cpIo7u1eLjqsS9/ZKqS+mO2X8Z1t9gjCxTK5ncwQkF2j6fxsU76bp6+0MzwYi/6LaW2Go6m2vGqO4Q41+vwMmR4x5ID9OdAgv1SFBrMAsrGhfHhG2qc6Vx2cS0quZ56N0z6aCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ps0ZnanM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3NLDH7026361;
	Mon, 4 Nov 2024 06:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=s54UzP9JI7D6
	AHRbqCrzy1vQqY3KlXI1sJJvVnKYbAw=; b=Ps0ZnanMIyEgwScbinIV9xVmWdgD
	+4J+sk2zVSWUH1Kfd9SXdzY1/PrDXYCcNTtjBooeIQqgPas6NTDKAv2N2nak0ai+
	31RTIH10P3Lh7J26fefH7kicg3Cm8MXuGn2NGMFUb3rDqE6Mz3mI25O5Uxtm2zUl
	mmyVohDl6C9s8SYOEhFPkywG+sSnM0J8e1cR1FQInxa2WM20DIplrbpUEuVVA2Ml
	c9doVL+Sv/XDB5DgdU8579EGrVFIbPQ4Xj/h3f6yxk4oI/ZqC1gy93b13DfDkprw
	EgFMTkxIAzx/NDvgSR3h/XTQLegCAXqBROyWfbvNlioDepydUeVEhpmRig==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ndc6u5kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 06:07:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A467PNw025939;
	Mon, 4 Nov 2024 06:07:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42nd5kqw7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 04 Nov 2024 06:07:25 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A467OFO025930;
	Mon, 4 Nov 2024 06:07:24 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4A467O31025928;
	Mon, 04 Nov 2024 06:07:24 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id D8BCA5001D1; Mon,  4 Nov 2024 11:37:23 +0530 (+0530)
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
Subject: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers
Date: Mon,  4 Nov 2024 11:37:22 +0530
Message-Id: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1_M2nQvFUXWR3diDO2n51JqGIgmHLkqC
X-Proofpoint-GUID: 1_M2nQvFUXWR3diDO2n51JqGIgmHLkqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1011 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040053
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
This enables runtime PM for eMMC/SD card.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e00208535bd1..6657f7db1b8e 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2626,6 +2626,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
+	msm_host->mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
 	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
 
 	/* Set the timeout value to max possible */
-- 
2.17.1


