Return-Path: <linux-arm-msm+bounces-48381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6135A39FE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A94003B6D33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 14:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811F026AAB2;
	Tue, 18 Feb 2025 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GdAuMFBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D399226AAA4;
	Tue, 18 Feb 2025 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888874; cv=none; b=Nft1HxaNKcDelIs3rbkM0UhqalVXftIPHfDv95ryV8Lr60myAVJk05JbgXlLDgagf8rsSc6QwdDTRW+E1FEhz8ajKkv9ybVczk25spPUV73B2ZSmFoNg8xWCKW3C9BgTAvxwfTd4N1474tzzrl+n2IdCg0KD6gdYT7dRH2wUX78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888874; c=relaxed/simple;
	bh=BV2VgzfcOo4EzLX7IZlkv3VsP0RMnY60MoLfDujX8BY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IqjzpVb1giby8FRU9/naf4wpwuHuKSX6ztd5AUhI6yirzuyVRTVczVarR13s2Y5EzbZQu8A0RmECfpbESji5Axv/CFUeZOQo0XwkcOuEtaeNLSY0cKcY+YHI2gdgvVmTxB5gN/Ia1EtW0iJQumJzZIbMNB7RuBTjByLmyP2PSqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GdAuMFBB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ICD348032460;
	Tue, 18 Feb 2025 14:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3mtRmAim5IvSoDPxMoM0Z1QEP1vYuBgxWn2KbVtPck=; b=GdAuMFBBRdtrCyCr
	KBM/gtumt6t4PR4r3s0by1mGiDGWGdNkxeVQawqI7nyckOyy7TURCTUcOchdZlMt
	Ff4KEJ/uuH7TIH/ZTiEeEpaE8n3UXXGrMCTTvhp5XUhuk6RIRW79ya4l4p5S6U1P
	oTzduusdbQ2H3J8liNuHYnAEpgHYuX+a6V6OvgLVk5tJ1qTDIEnviSIRJ0IAHMxP
	wiFMHsa9OOTfmNto5WyDT3urfqB0tQ4QAZ3I485e3I8b71J6WNp1utxLSA69FLr8
	AsJ9po8nX3kNKtxgQUjHojQHVFM7H/mndtoTQNz7rn5hvN7pfv5S1kt52BhqOxex
	PxYh8Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7ww3am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:27:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IERXL8026537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:27:33 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 06:27:28 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Tue, 18 Feb 2025 19:56:49 +0530
Subject: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -3WHwkDTAykQ-gPqrCZuaTHkfrcKJBAN
X-Proofpoint-ORIG-GUID: -3WHwkDTAykQ-gPqrCZuaTHkfrcKJBAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_07,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 mlxlogscore=896 spamscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180109

During boot-up, the PLL configuration might be missed even after
calling pll_configure() from the clock controller probe. This can
happen because the PLL is connected to one or more rails that are
turned off, and the current clock controller code cannot enable
multiple rails during probe. Consequently, the PLL may be activated
with suboptimal settings, causing functional issues.

To properly configure the video PLLs in the probe on SM8450, SM8475,
SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
Therefore, add support to attach multiple power domains to videocc on
these platforms.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/videocc-sm8450.c | 4 ++++
 drivers/clk/qcom/videocc-sm8550.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
+	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
+	if (ret)
+		return ret;
+
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;
diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
 	int ret;
 	u32 sleep_clk_offset = 0x8140;
 
+	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
+	if (ret)
+		return ret;
+
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;

-- 
2.34.1


