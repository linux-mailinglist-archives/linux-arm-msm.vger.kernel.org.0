Return-Path: <linux-arm-msm+bounces-41216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5567B9EA8E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 07:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7681A1889BDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 06:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3735822D4FA;
	Tue, 10 Dec 2024 06:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NGLdqBmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EB122CBD2;
	Tue, 10 Dec 2024 06:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733812928; cv=none; b=NL1SxgRrEPRuw4zuqG58ufurvZxEFUEDnOt4RwuUF1LMvPYxxcu0sjEYIfJVCpWEYIVxkrEF/oudfbvDABVF9eZe6pOlDDZMXE1bIO7F8lAM9z/Z0ImSKTV1jV/yIgorJVlEYqUA9s0R+ziSzqgrkdXY7+qMCUeMf5WBG/vmBEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733812928; c=relaxed/simple;
	bh=nRJRbmC/+4oDF4B8lr2qEkw6gMH9ao0FKeHhdQoS08c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C4nUxjmY6TKCuwPwgqUwEl+S9plfHVGYcp5Xm4m+iisoV22G+d3/aaWswV4fvvxNZ9jyU5mqG2tKfdkGK59pZD3hsghAIEDOZvLlosJ2oEXPZiOXBCgpGTkw/U+i/f60rBZQH9bS7w+l+t1NNkPKNKEcMrNtPO3zJ6bTmXNHo/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NGLdqBmb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA2Wq6v014059;
	Tue, 10 Dec 2024 06:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BYjteXDO9K1QxrO9QqwHq+9KZmZklpLpvfhxvWWMmdk=; b=NGLdqBmbTziPZ+GI
	JMUivXBORmEpKZFsOXpuJPpJSHYtYk+BVz2mPjpRj58V9zIWE56Ql6GratbTLP6p
	YzbSptWoXlSuzDRV60cNBN48iHH86kfwlF7STK3KgUQxiQ7TGkPpZQrMg/OVlZlc
	Qdeqo7uNMSekcs44zFlf9ek6ea+vFOWqHUb+3Fd0/ryNgMtvGmr4lHb52Bf3/lCQ
	yvN0MUrirzLCjUnU6PSaD0bAk4m/56pghNJKh6a/UAwLjlG87hTs/XZtCok8/MmD
	wWXuKj+MjAWEtEYDf/IZpQU2mE9CcHsWltfYpelCZ7YeivstScXshi7Bxcppt/6L
	c5e/wA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dvyakkfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 06:42:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA6g1ag030986
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 06:42:01 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 22:41:57 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 2/2] clk: qcom: ipq5424: add gcc_xo_clk
Date: Tue, 10 Dec 2024 12:11:10 +0530
Message-ID: <20241210064110.130466-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210064110.130466-1-quic_mmanikan@quicinc.com>
References: <20241210064110.130466-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ek_nEVzDo36iugzqJm9SqYgKtqbocvw9
X-Proofpoint-ORIG-GUID: Ek_nEVzDo36iugzqJm9SqYgKtqbocvw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxlogscore=847 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412100050

The gcc_xo_clk is required for the functionality of the WiFi
copy engine block. Therefore, add the gcc_xo_clk in gcc driver.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 88a7d5b2e751..a30287f6a517 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -325,6 +325,24 @@ static struct clk_rcg2 gcc_xo_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_xo_clk = {
+	.halt_reg = 0x34018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x34018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_fixed_factor gcc_xo_div4_clk_src = {
 	.mult = 1,
 	.div = 4,
@@ -2920,6 +2938,7 @@ static struct clk_regmap *gcc_ipq5424_clocks[] = {
 	[GCC_QPIC_CLK_SRC] = &gcc_qpic_clk_src.clkr,
 	[GCC_QPIC_AHB_CLK] = &gcc_qpic_ahb_clk.clkr,
 	[GCC_XO_CLK_SRC] = &gcc_xo_clk_src.clkr,
+	[GCC_XO_CLK] = &gcc_xo_clk.clkr,
 	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
 	[GCC_QDSS_AT_CLK] = &gcc_qdss_at_clk.clkr,
 	[GPLL0] = &gpll0.clkr,
-- 
2.34.1


