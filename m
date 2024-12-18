Return-Path: <linux-arm-msm+bounces-42616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616D9F6117
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F01118951DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 09:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58EC1991A1;
	Wed, 18 Dec 2024 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XXPT+bdz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA4E198E80;
	Wed, 18 Dec 2024 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734513085; cv=none; b=PcNs7vFtaSoNq1PMM2s9WVkBW+FoVTLIQdn8pq9T/AkFXOIe1Y8Hyq2+/gh6YWucqGHiRgAVvo6rC///MpfAAuOKdbVPXpXWPJaytNab7BCm8MDa/JYHh5sYJfkJCRwGqODFu2xgu98N5cT8ackbBFhrZy4+04NfycMFQWJZmjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734513085; c=relaxed/simple;
	bh=nX2ynXBpwKAYIqbzRDNzfc3McT5fbyuUxhK28QeJxYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZKOJoQMq3MhbR28xtuIMM+TL2wnBhGo20/ezZCTX4h3c+MjNuDEIrlFDAR4koFFkKiKJ+GadubcSkf+rZR+l9nLsSiMZv9vwuxzyE7j/minjuIhwKiH6yTiJwVkIoPiMYPkdiHrRZbEIfbIjXFxAWsjOWrYCdjrNj/juMGtNSmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XXPT+bdz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI78mPn007531;
	Wed, 18 Dec 2024 09:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=05dL362rb7ZUuvDOynOzWkQW
	tgFbOqPNVBeQEzmhUso=; b=XXPT+bdzDRJNGo9yeEwrZUu7mz2LFREIcsmIwFyd
	34ZHHWePSOzOl0H7E9ajff8F73L9thqFnkoyC5jc7o9uetTNY5M1MAfRob0WwNV5
	MKm2xU6f+IXGivCjH610MRcU/rQC9XZ3Ve3AQhj9cbgt67jW7qmheAZws8mDyyEv
	ERd9hHPkV4m1m5fi19pkAoyGteAOK3I8XUTX3zEnQ7yo4VhLqbd+IVltxc4H3vyR
	onQPpfgc0BdWTDGt/7ZAc9aHq/cDkdGChkM1Z890gYrRyxmlnGRoCtzfatbjGxu3
	oR5hGO8zoCOX74jOvnjosv15GPZG4a6cc4fc/kSkeH0xYQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ksra0905-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 09:11:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI9BLoO004788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 09:11:21 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 01:11:17 -0800
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
Subject: [PATCH V2 1/2] mmc: sdhci-msm: Add core_major, minor to msm_host structure
Date: Wed, 18 Dec 2024 14:40:56 +0530
Message-ID: <20241218091057.15625-2-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241218091057.15625-1-quic_sachgupt@quicinc.com>
References: <20241218091057.15625-1-quic_sachgupt@quicinc.com>
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
X-Proofpoint-GUID: MGdL_M1EvKPJxECnRa2-58BlLOK1l0-W
X-Proofpoint-ORIG-GUID: MGdL_M1EvKPJxECnRa2-58BlLOK1l0-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180073

Add the core_major and core_minor variables from local
scope to the msm_host structure. This change improves
the organization of the code and allows these variables
to be accessed more easily throughout the msm_host context.

core_major will have information related to sdcc controller
major version number.
core_minor will have information related to sdcc controller
minor version number.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e00208535bd1..2a5e588779fc 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -273,6 +273,8 @@ struct sdhci_msm_host {
 	bool tuning_done;
 	bool calibration_done;
 	u8 saved_tuning_phase;
+	u8 core_major;
+	u16 core_minor;
 	bool use_cdclp533;
 	u32 curr_pwr_state;
 	u32 curr_io_level;
@@ -2557,6 +2559,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	core_major = (core_version & CORE_VERSION_MAJOR_MASK) >>
 		      CORE_VERSION_MAJOR_SHIFT;
 	core_minor = core_version & CORE_VERSION_MINOR_MASK;
+
+	msm_host->core_major = core_major;
+	msm_host->core_minor = core_minor;
+
 	dev_dbg(&pdev->dev, "MCI Version: 0x%08x, major: 0x%04x, minor: 0x%02x\n",
 		core_version, core_major, core_minor);
 
-- 
2.17.1


