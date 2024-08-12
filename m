Return-Path: <linux-arm-msm+bounces-28289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D2A94E5F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 07:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2132B2810E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 05:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CCB14B940;
	Mon, 12 Aug 2024 05:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eJyn39KX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3F1380;
	Mon, 12 Aug 2024 05:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723439617; cv=none; b=Q40ljz6EI7mOx0ZkmabAK098O1g6z8KJUA68EC2UdPse1FPKOVpEp8AK6V+2LAtNgTzbQkcZquehqqkzyTdFOJ0dPmcRrvHg56TvoY3e8l3DIKM32lxCf5Xv/9UyUOs2gpo6eC7Y+bIPVNYaLl0IKQOzBCR9K25SwmoOoGBoV+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723439617; c=relaxed/simple;
	bh=xQPgeGRBeiU5Ao8KXmafMsgCXzcbicJgtVMV8Oxx+YU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CBEp7GbFq2oPegykAn0dstGC6zNOgoT7FaP/yGA9dwg/OFs2s348KlevEnSdU1A/tVSg1BOpJJpOe4XcRGneN6WEEbjTbU5HGu+yVmLDX/IGSRHHJIEWJKzY1G40Hpb4HKvhhIy9nQjnwUHGMVkzB0rDrrC7f7StcGqQ9L7V2rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eJyn39KX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C2ZWD9024744;
	Mon, 12 Aug 2024 05:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8o78UkphjVAnyzqwav87TeNwA0f72W3Gc9q2izy4apg=; b=eJyn39KX1h8RiTFp
	/frYHvad55414DXfQusJSVXKCt+sAHbpihbEmLxWOA2Wmwqeh9i889XvfKms+3D6
	0sLjyXNFeuZ+dHqFi0W9v0ljXHfrtXixDWI3HuMZxkTe1SlLeBIx0ww43afEt/x3
	AgFG4oZv6GAwj3WzC0MxxkQhqX7bHrdhpB6Dr0rxR5g0H1SBmKUr14ZRlzOfx3/Q
	YXv17GuYaPw0RBr4dU049yBB26jQ2e9HnR7Xis0nuppWfBgE5RXHL+xi2P4EJ5mE
	QW63gk8JWZs/C+kY/wlnsFhzv/V/KET+b9OCa1V4wjjYZXP92r9Q+IJGgd/D3u2y
	oS7kdw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18dawne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 05:13:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47C5DSQG009059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 05:13:28 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 Aug 2024 22:13:23 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Mon, 12 Aug 2024 10:43:01 +0530
Subject: [PATCH v2 1/5] clk: qcom: gcc-sc8180x: Register QUPv3 RCGs for DFS
 on sc8180x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240812-gcc-sc8180x-fixes-v2-1-8b3eaa5fb856@quicinc.com>
References: <20240812-gcc-sc8180x-fixes-v2-0-8b3eaa5fb856@quicinc.com>
In-Reply-To: <20240812-gcc-sc8180x-fixes-v2-0-8b3eaa5fb856@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ssmqitDQe_kDuI7c_YDgHFQBDLEuNPzR
X-Proofpoint-ORIG-GUID: ssmqitDQe_kDuI7c_YDgHFQBDLEuNPzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408120037

QUPv3 clocks support DFS on sc8180x platform but currently the code
changes for it are missing from the driver, this results in not
populating all the DFS supported frequencies and returns incorrect
frequency when the clients request for them. Hence add the DFS
registration for QUPv3 RCGs.

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
Cc: stable@vger.kernel.org
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/gcc-sc8180x.c | 350 ++++++++++++++++++++++++-----------------
 1 file changed, 210 insertions(+), 140 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index ad135bfa4c76..97bea5bc94c5 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -609,19 +609,29 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
 	{ }
 };
 
+static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s0_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
+};
+
 static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
 	.cmd_rcgr = 0x17148,
 	.mnd_width = 16,
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap0_s0_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap0_s0_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s1_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
@@ -630,13 +640,15 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap0_s1_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap0_s1_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s2_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
@@ -645,13 +657,15 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap0_s2_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap0_s2_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s3_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
@@ -660,13 +674,15 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap0_s3_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap0_s3_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s4_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
@@ -675,13 +691,15 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap0_s4_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap0_s4_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s5_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
@@ -690,13 +708,15 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap0_s5_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap0_s5_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s6_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
@@ -705,13 +725,15 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap0_s6_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap0_s6_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s7_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
@@ -720,13 +742,15 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap0_s7_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap0_s7_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s0_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
@@ -735,13 +759,15 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap1_s0_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap1_s0_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s1_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
@@ -750,13 +776,15 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap1_s1_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap1_s1_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s2_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
@@ -765,13 +793,15 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap1_s2_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap1_s2_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s3_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
@@ -780,13 +810,15 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap1_s3_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap1_s3_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s4_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
@@ -795,13 +827,15 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap1_s4_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap1_s4_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s5_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
@@ -810,13 +844,15 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap1_s5_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap1_s5_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s0_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s0_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
@@ -825,13 +861,15 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap2_s0_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap2_s0_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s1_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s1_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
@@ -840,28 +878,33 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap2_s1_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap2_s1_clk_src_init,
 };
 
+static struct clk_init_data gcc_qupv3_wrap2_s2_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s2_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
+};
+
+
 static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
 	.cmd_rcgr = 0x1e3a8,
 	.mnd_width = 16,
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap2_s2_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap2_s2_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s3_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s3_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
@@ -870,13 +913,15 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap2_s3_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap2_s3_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s4_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s4_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
@@ -885,13 +930,15 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap2_s4_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap2_s4_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap2_s5_clk_src_init = {
+	.name = "gcc_qupv3_wrap2_s5_clk_src",
+	.parent_data = gcc_parents_0,
+	.num_parents = ARRAY_SIZE(gcc_parents_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src = {
@@ -900,13 +947,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_qupv3_wrap2_s5_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
+	.clkr.hw.init = &gcc_qupv3_wrap2_s5_clk_src_init,
 };
 
 static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
@@ -4561,6 +4602,29 @@ static const struct qcom_reset_map gcc_sc8180x_resets[] = {
 	[GCC_VIDEO_AXI1_CLK_BCR] = { .reg = 0xb028, .bit = 2, .udelay = 150 },
 };
 
+static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s6_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s7_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s5_clk_src),
+};
+
 static struct gdsc *gcc_sc8180x_gdscs[] = {
 	[EMAC_GDSC] = &emac_gdsc,
 	[PCIE_0_GDSC] = &pcie_0_gdsc,
@@ -4602,6 +4666,7 @@ MODULE_DEVICE_TABLE(of, gcc_sc8180x_match_table);
 static int gcc_sc8180x_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;
 
 	regmap = qcom_cc_map(pdev, &gcc_sc8180x_desc);
 	if (IS_ERR(regmap))
@@ -4623,6 +4688,11 @@ static int gcc_sc8180x_probe(struct platform_device *pdev)
 	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
 	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
 
+	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
+					ARRAY_SIZE(gcc_dfs_clocks));
+	if (ret)
+		return ret;
+
 	return qcom_cc_really_probe(&pdev->dev, &gcc_sc8180x_desc, regmap);
 }
 

-- 
2.25.1


