Return-Path: <linux-arm-msm+bounces-45782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 333E9A18EB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05F621885005
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 09:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33CA2101B3;
	Wed, 22 Jan 2025 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eWdtcwzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D95E2045B8;
	Wed, 22 Jan 2025 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539268; cv=none; b=jQGkvikAKg92N6dWu4FB0ReGegKFRRkcnv/56qHQ+DCN0eS56JP//fWP/2i5FFBfMIyFoywk3d56bY+Hab+78n/wAem+bwR6+R5zG64KnNx1m+mcIx350M93Dq2k+XO9d0GSHoMf1XcPIU9l8jFwfwHx8nHr/sfIapNu8jYXYX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539268; c=relaxed/simple;
	bh=2vHIPKLtZ2t+xF8Jk0+RscKZ/NTrz1FN3rJXy+dFbF0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l8djlLnzJTowqveJqi6fwYTEVz46iXkm+y6sOhdt9ZUq9nSelVYUqlgHEx3gFC8M1vOtHKYNDDTWyN05aWAw29QL6VlRqAovKPY93xl35qkQTGxbCEVzHXKfjF3n/oCwr27H3L80ATc/UezilYTA598B/F5jtxxgsq1pkzT2E14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eWdtcwzf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9Cr37011285;
	Wed, 22 Jan 2025 09:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9+GVJilRkjRmijSx4TTaZJD8
	Ux7+0yDr0iqhNkEInGw=; b=eWdtcwzflZQ1et3oRrSfhlZVSni4LAcyVtCHoMb9
	MNLAu3Q8d172wOSh/3lKhK505N6G+nKi4Ax8OF53bzkc558fqOmSkpa5NDPn8XV5
	TVztji7b9mT21R4sG3hzEGT7MSUxtKV1GCmGRObv85NNbSiHKsQHclHqueDIn9JT
	XzGqouzFpcCVU2wa9ms5jONuIg/RdXWZJXehfX5CYv8/37wipy7JgfflsOgJIFyO
	oEZ1oXEvFp7kCypZVpxvk5aoeyuvlFpa8kV2IKvd1lu6EELv5ooyH7Ci+mX/2MQd
	McDlGFGxSACrpCSKH36KOhj2w84YT4LZfXT6KAh7KMZGhg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44awuh02vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M9le7U015288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:40 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 Jan 2025 01:47:34 -0800
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_sachgupt@quicinc.com>,
        <quic_sartgarg@quicinc.com>
Subject: [PATCH V3 2/4] mmc: sdhci-msm: Add core_major, minor to msm_host structure
Date: Wed, 22 Jan 2025 15:17:05 +0530
Message-ID: <20250122094707.24859-3-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BthDaR5UUmn2pRRGUnAnOYSxcj0F2xGX
X-Proofpoint-ORIG-GUID: BthDaR5UUmn2pRRGUnAnOYSxcj0F2xGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220071

This change adds the core_major and core_minor variables to
the msm_host structure, allowing these variables to be
accessed more easily throughout the msm_host context.
This update is necessary for an upcoming follow-up patch.

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


