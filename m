Return-Path: <linux-arm-msm+bounces-35429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 615899AB0AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24E2EB22A75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 14:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660A61A0BC0;
	Tue, 22 Oct 2024 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Il0BWlQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CDC1A08B2;
	Tue, 22 Oct 2024 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606745; cv=none; b=FMrnNXgHTJxmwdrCy37GtqrxEqfdNBYnPRarUpyuWqxjhyRkZ+/fIjr5zo/PL2bUcuF0coffLG5XfeU85blQ8gPqcFssuDbgThxJE5oHXnKuy51gelDP9XAr0FcGfPnMyVugoPP0E9XYaTY3FRIPBzkMSm3th8pEw/qcxi8nLQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606745; c=relaxed/simple;
	bh=hnVKgy3Ku36lhkN6qCdjhYKqO5Z25ILOzofbc2dpWB8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FElC+bD7fesN5E42r52/NDX9tF6fr+wwmqD4ybhbWoSkvfAJ1JFlYKRZnqmZ1m140VjmyQGNX4/HTkD1o4SVjqFWXi5MfnwAyk1pmlG5lE5fZFMjs+TUH4LX7DTvIBZXndlSdunMeMnbHYXMp372nOqY/OXXuDQf8PU1lwPhFD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Il0BWlQq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MDFljH026200;
	Tue, 22 Oct 2024 14:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=1wg0oRf9Aw11F8KaSVBrgct06rRtIeTeHSKXgbq4gPE=; b=Il
	0BWlQqu+kftrNQOx0HOB3eJUAgWHE1XwBQwL5Gw8Mrptn1Ns2wJ5saeAo48BXFhZ
	qKP5+bPOMpYtlfePL0beoe2aZK7R/TEov24ECD390wz1OwBkFE9jKLb4rpIbBZbq
	HGe3QxW81Cd9W2iUv0aK2PzVUlmmNhokFxdsiV7epL2CJxF1HnwaE8bBatVzScM6
	GjFecazau47Qa3gLjLCCNLPmJ/S4dUOPzAr2D8/VoaRja2BBqP2/nMSJZx1DyE2x
	R+6VaoiUmZ5qURWpD0RWsRZvVryrhmpx577lMoa9ZnZNfHi4v8TNmH9059wMIL9j
	wH4jk16qN+N0hHbtwQFA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ecse05u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 14:18:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MEIpZX023136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 14:18:51 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 07:18:47 -0700
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_sartgarg@quicinc.com>
Subject: [PATCH] mmc: sdhci-msm: Slot indexing for distinguishing multiple SDCC instances
Date: Tue, 22 Oct 2024 19:48:28 +0530
Message-ID: <20241022141828.618-1-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x4wMfrx8KFrcbAJDfpLeTYg-XHDwKOlb
X-Proofpoint-ORIG-GUID: x4wMfrx8KFrcbAJDfpLeTYg-XHDwKOlb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220091

This update addresses the requirement for accurate slot indexing
in the sdhci-msm driver to differentiate between multiple SDCC
(Secure Digital Card Controller) instances, such as eMMC, SD card,
and SDIO.

Additionally, it revises the slot indexing logic to comply with
the new device tree (DT) specifications.

Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Maramaina Naresh <quic_mnaresh@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e113b99a3eab..3cb79117916f 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -292,6 +292,8 @@ struct sdhci_msm_host {
 	bool vqmmc_enabled;
 };
 
+static struct sdhci_msm_host *sdhci_slot[3];
+
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -2426,6 +2428,14 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (ret)
 		goto pltfm_free;
 
+	if (node) {
+		ret = of_alias_get_id(pdev->dev.of_node, "mmc");
+		if (ret < 0)
+			dev_err(&pdev->dev, "get slot index failed %d\n", ret);
+		else
+			sdhci_slot[ret] = msm_host;
+	}
+
 	/*
 	 * Based on the compatible string, load the required msm host info from
 	 * the data associated with the version info.
-- 
2.17.1


