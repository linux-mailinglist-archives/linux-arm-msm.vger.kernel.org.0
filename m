Return-Path: <linux-arm-msm+bounces-42608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6959B9F5E79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 07:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BA0C188E909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 06:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273CF156887;
	Wed, 18 Dec 2024 06:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cg6Rll0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE5015666B;
	Wed, 18 Dec 2024 06:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502348; cv=none; b=Dtr8/tTkxBE9OGDqvf11PoCXJMUhnYS1zTSwaXwNgTadO5LwQlJfL0sk8lmRZLjZyBfJR2jeuDZ4pWIOVVgYWXPcDXr1ne7Ma+tDGWXIkMFSAqJ0XGfSLO9XKe9QXoPfSLOQMUJXSs+LsiG5u5eb3y4C6LorppnOqzOzhmAknBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502348; c=relaxed/simple;
	bh=KF/zCKnz788qLeNsYHie7O/zgBBOdghtiGYWHeItmD0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dswLqbp5QysareM+HPC1AkYst5kvIuLMhKXyW9oWLrisqACpPpiXkje8wBzY8+Y4NflLjM2TNGHFrxL12Uh7HK6k2d9gkMQARwYEYSQlSDAd7eaj3aPSi6d9kYZXbZt9jKYNNUIMkjs6vteMcM/GJhdxGPA7GsOq0/hyt3w6yV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cg6Rll0O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI47X24000555;
	Wed, 18 Dec 2024 06:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZRTkpe3CsQfZwQxsq4cVAt7v
	G5KEG0DZ8DLQ5xkWe5g=; b=cg6Rll0OMgNxbVKh24hmwm5+aXSbXev5H+hYfxR6
	oawy7ds7o6eQm+M7lAGvusZ06lLe6MyiegateK5z6+XVoup4pCig4zet6mCczI9X
	A4z4HyyLSflnEpFS7Nnw7XP8uVYzZz5CExL9boPxxVFBguWoqYtRZT0r6W43VEL3
	n6P3+3zUZ2gWqMqtKmuNte+LHRZPp7DXkwd6wOmUC9b20C7JhDQE3amONem/UXan
	GQWK1xnC63YZjNGdbsZ2M6rAP5yHRWrPjmVCH5qOtaelP9D8qC0NNYGsnBlIBcqf
	Jgyy2SR3nx9wilJcjymXK2RljwimcUmKZS09vIPxtaSjkQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kq3g8894-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 06:12:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI6COfX024398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 06:12:24 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 22:12:19 -0800
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_sartgarg@quicinc.com>
Subject: [PATCH 1/2] mmc: sdhci-msm: Add core_major, minor to msm_host structure
Date: Wed, 18 Dec 2024 11:41:59 +0530
Message-ID: <20241218061200.3362-2-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241218061200.3362-1-quic_sachgupt@quicinc.com>
References: <20241218061200.3362-1-quic_sachgupt@quicinc.com>
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
X-Proofpoint-GUID: TyMyJdL8qVNLBIkKcEacRFmwUtYxsMnU
X-Proofpoint-ORIG-GUID: TyMyJdL8qVNLBIkKcEacRFmwUtYxsMnU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180048

Add the core_major and core_minor variables from local scope to the
msm_host structure. This change improves the organization of the code
and allows these variables to be accessed more easily throughout the
msm_host context.

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


