Return-Path: <linux-arm-msm+bounces-19960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB46C8C7F1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 02:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D7E31F22772
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 00:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7DF387;
	Fri, 17 May 2024 00:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sc/esD6j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FE43C24;
	Fri, 17 May 2024 00:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715905161; cv=none; b=PfD5t+wRPhZ3Z8HQmL+NBjFJFKkn8hQpgxAKUlGEEpPwcs4LRWHODNgBv7bb499HHutriXQRR0wdtLI6RG4IdpvBY93prcSF4ZOksu4m5I4ewtF8PInUJaqeZk22qxMC30p0WLnShddFubtup/swWMmURRjef8nGUdl3WJOscZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715905161; c=relaxed/simple;
	bh=8XzY2YB1aKCfaZ6jGaLgRfuz2R2bewKIkz1trKzNkkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=vBFATlutyF/cgs4X2D3OsJmR4Dtv9uGMQ3XC8vj32yq1KW5A91vrgO/RQuGwUOGeuw+f4en1p8dTcErTRjI6SZ21kvQr25AOS7pYrHPNSRlNH4Qx7ektb8jMHXZLb7gz2CvBFZ1zGCDwhTZn0vEvJRFF49Doow1U+MeIDRRgj5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sc/esD6j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GKN3f1007325;
	Fri, 17 May 2024 00:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=YCp
	P6Vu1yUGpMEN0G7p7iGWIYo+0Wxg88rvHSvAzPqw=; b=Sc/esD6jlcKmgMuDrvd
	R8JLKBwj4rUNksPDMFmSgsY/rkq2qUk5bzosIbpM8Xyw5m2/+ZamIUQHvYxW0MxC
	d7cWdXki9TAJH0RHJu9u5sBYTqVLGf3a1kUMs+amJGxQv7a+cR/AylDrzO0l74IH
	SmK73zDUMbHlnPzBde4W1ZjEAW8RlgQMECwGxS9h9qAVnzAOyaFuPc85FhS//IUE
	RrOiikMD+MoC+GPBY80l0i3OJ3ZlJPUSA0i1zzI2ImwJ8uajCQ+aXXV88ZGqf0Fj
	KseIiSE/qLnYfDaWcfCfXImhBDjxDVydGXKpQSC0pQHX5i82sUrrlfkYLRYm+lNd
	FRA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47f46wy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 00:19:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44H0JDbw025496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 00:19:13 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 May
 2024 17:19:10 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 16 May 2024 17:19:10 -0700
Subject: [PATCH] clk: qcom: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240516-qcom-clk-md-v1-1-baca27dd2fb2@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAH2iRmYC/22NwQ6DIBAFf8XsudsAEWx66n80HgChbqpYQY2N8
 d+Lnnuc5M2bDZKL5BLciw2iWyjREDLwSwG21eHlkJrMIJgomeQSRzv0aLs39g0qaaRqvPaa3SA
 bn+g8refbs85sdHJoog62PT46CvOKvU6Ti8e8pTQN8Xu2F35I/zMLR47SV0zJUhhVVY9xJkvBX
 vMI6n3ffzds4oHHAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6ac_nO1t1Fwp_iXxctSM3KF2i-KRgX4d
X-Proofpoint-ORIG-GUID: 6ac_nO1t1Fwp_iXxctSM3KF2i-KRgX4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=891
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170000

Fix the following from 'make W=1' with allmodconfig:

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/clk-qcom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/gcc-msm8976.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/lpass-gfm-sm8250.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/videocc-sdm845.o

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/clk/qcom/common.c           | 1 +
 drivers/clk/qcom/gcc-msm8976.c      | 1 +
 drivers/clk/qcom/lpass-gfm-sm8250.c | 1 +
 drivers/clk/qcom/videocc-sdm845.c   | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 75f09e6e057e..135e1d51f6fe 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -338,3 +338,4 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
 
 MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("QTI Common Clock module");
diff --git a/drivers/clk/qcom/gcc-msm8976.c b/drivers/clk/qcom/gcc-msm8976.c
index f60a8171972b..7fac0ca594aa 100644
--- a/drivers/clk/qcom/gcc-msm8976.c
+++ b/drivers/clk/qcom/gcc-msm8976.c
@@ -4154,3 +4154,4 @@ module_exit(gcc_msm8976_exit);
 
 MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>");
 MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("QTI MSM8996 Global Clock Controller");
diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass-gfm-sm8250.c
index 8a1ee52cbcc3..65d380e30eed 100644
--- a/drivers/clk/qcom/lpass-gfm-sm8250.c
+++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
@@ -315,3 +315,4 @@ static struct platform_driver lpass_gfm_clk_driver = {
 };
 module_platform_driver(lpass_gfm_clk_driver);
 MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("QTI SM8250 LPASS Glitch Free Mux clock driver");
diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index b7f21ecad961..80095a283a86 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -343,3 +343,4 @@ static struct platform_driver video_cc_sdm845_driver = {
 module_platform_driver(video_cc_sdm845_driver);
 
 MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("QTI SDM845 VIDEOCC Driver");

---
base-commit: 8c06da67d0bd3139a97f301b4aa9c482b9d4f29e
change-id: 20240515-qcom-clk-md-65b56dfafa08


