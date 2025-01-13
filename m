Return-Path: <linux-arm-msm+bounces-44897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E439FA0BED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 18:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56F4B164CAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 17:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829E11BDA8C;
	Mon, 13 Jan 2025 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R8IbzhOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76911BD9D0;
	Mon, 13 Jan 2025 17:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736789248; cv=none; b=OArGOK2eWF3YI7RBS1ai6pGX6CACaDm91oc+vKB64eP3iK9wfYWm8goJMktRssZIjESKf/k15Kt3Wuuvb+8WjWY8GjN5IdQmRdY5fBZfV7z9/xzRVQULl0waEXRY6ZwaADVYvbZvQw4zjSBalUfYnVPif1eBRBh39FfkSmtH2r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736789248; c=relaxed/simple;
	bh=XvgfwivGFi27luIVzHIswWuPRy/qX2OfFL6f8ctDtp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rig6nd3mXlaUL74GAVLQmnFHBxkToYX6wNE4fMnWb3RZUxknVxDmovEHQRS5DaWbsF7l3CqEYWEiy9hlFp4snZWWAgulQZooeeqvJKHovxIs56iw0YUeaSpuQW3BlRg3CP7rMdJKDYCydo2q1MgEY9b3SOyUQAIVF+/RWNJxNNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R8IbzhOR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DC0c00000325;
	Mon, 13 Jan 2025 17:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzv89IncZ82JoDEiuNwaX1jXappZehVOydG3x/iZO9o=; b=R8IbzhORQTMcnffm
	rzKCz+vDkrspPtJMfbIBYLACErqJwGFiH6iX5iTryd8gzs9DUxGM5V8IcmXVKuCc
	AS7eguTcLJq3BS65JqNfu/lYTTLFqOqU9vsbMaWanmcT7cfwnmpYWhYLmw9x+NF3
	l+FLSXJj4u9Rh/YxyWoSjfuf3ynR37XwQ6FkUNFf1TRdqFu9p9fPZC+kAgjWktgq
	yYTyGE41eqz2n18CmrbwgCCzkIZBVSID9B6yw1EltMknIwZAD5ER3j2RjGHNVHiW
	YNkmaPHmNVrytuzdoTO/m2oJr+mubGBnHfaiLDGcQ2XyxIVFdJHLxyk0+LBYCYo9
	MvCVjg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4452f90u2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 17:27:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DHRMYx008937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 17:27:22 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 09:27:19 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Mon, 13 Jan 2025 22:57:06 +0530
Subject: [PATCH 3/3] clk: qcom: videocc-sm8550: Update the pll config for
 Video PLLs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-support-pll-reconfigure-v1-3-1fae6bc1062d@quicinc.com>
References: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
In-Reply-To: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7rGEfOkiBJvdV63JySzYrpTY7f5ULLB4
X-Proofpoint-GUID: 7rGEfOkiBJvdV63JySzYrpTY7f5ULLB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=708 malwarescore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130141

The video plls are on MxC rail and needs to be configured before being
used for functional use case, so update the pll configs as part of the
pll structure.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/videocc-sm8550.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..ed94a72d6c1b064fd767df0c691d0273ef106e84 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -51,6 +51,7 @@ static struct alpha_pll_config video_cc_pll0_config = {
 
 static struct clk_alpha_pll video_cc_pll0 = {
 	.offset = 0x0,
+	.config = &video_cc_pll0_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -82,6 +83,7 @@ static struct alpha_pll_config video_cc_pll1_config = {
 
 static struct clk_alpha_pll video_cc_pll1 = {
 	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],

-- 
2.45.2


