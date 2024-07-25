Return-Path: <linux-arm-msm+bounces-27048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD80093C0ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 13:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E11C282E15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 11:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9580A1993A3;
	Thu, 25 Jul 2024 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="osHo5uZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF8B199E9C;
	Thu, 25 Jul 2024 11:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721907232; cv=none; b=mqTOHIZhRQ8v3i4c84xvZYblijGfjXM2NBGNIV2kQ7xBDCEp5xDZr4BNFhB/whE6yazDaUbrFlAEwbjBS68OdxzaOotWMuJui89MJlRWyfF1leBoT6eNWvPgWGKh+H0GJfNUOlGAoYvpEAJ8rpmTwaiqKBS3mtmcQc08dPz8J5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721907232; c=relaxed/simple;
	bh=cN7wO8P92GYyVon23GhNZkL4z9RlLfENpMuDefmydTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lExIOIWjX7d8MQMseokBxfxjMK4AS+d2ghxr0gyO9IzPK0x6wzW7+ifMchXvKUiwASwKG6m490wBSxsSOXQxMHqLms50BntO0mgv5T4KZEW7IWY7GNo7ohPO9hv3t1IIVyENPgDrr7HFXjRMzEU8mWCf0as/AmUd5cfC9dv6uJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=osHo5uZ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P9haRc010673;
	Thu, 25 Jul 2024 11:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWifCJ+xjHncZHHdnFKp9/vrSkqfkQyKMwXcnnrylEo=; b=osHo5uZ1iTIQTX94
	FA1sZMSL2SiR3ra0UJGswedkNNi7wIojAX+0fzLjneCCRa0OFjrMZ8P3975C6GhG
	zv6p6bMScWbys4zcQXfj0C3TT6435XASUX9zUpdsxC6UA+Ru1IQbudK8Me9/ZwKa
	sgOL//E43+grKTMDbqjr+s7b7NIs9pp0UhqCaAwFJfw1Jmd/HBanoWqL5wNmnBY7
	+HEv+SHFHUge33JOpDSMaNL2x8WNkRanyOZ3j61awnuvtnLS4lbGwDqPps4Xoo0N
	dLdT9lgfyoRAIUB8YzAJOnml3V+8OcxVsMybNos5lBOtxznKiPuYlpxmRsLDJhRi
	P39Ung==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g2xen654-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 11:33:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PBXl0X013527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 11:33:47 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 04:33:42 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Thu, 25 Jul 2024 17:03:13 +0530
Subject: [PATCH 3/4] clk: qcom: gcc-sc8180x: Add GPLL9 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240725-gcc-sc8180x-fixes-v1-3-576a55fe4780@quicinc.com>
References: <20240725-gcc-sc8180x-fixes-v1-0-576a55fe4780@quicinc.com>
In-Reply-To: <20240725-gcc-sc8180x-fixes-v1-0-576a55fe4780@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xer2wugq2heBghaeHOEdDl-jrfmoiCIo
X-Proofpoint-ORIG-GUID: xer2wugq2heBghaeHOEdDl-jrfmoiCIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_11,2024-07-25_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=744 mlxscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250078

Add the missing GPLL9 pll and fix the gcc_parents_7 data to use
the correct pll hw.

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/gcc-sc8180x.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 97bea5bc94c5..f9f3e1254ce1 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -142,6 +142,23 @@ static struct clk_alpha_pll gpll7 = {
 	},
 };
 
+static struct clk_alpha_pll gpll9 = {
+	.offset = 0x1c000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(9),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpll9",
+			.parent_data = &(const struct clk_parent_data) {
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_trion_ops,
+		},
+	},
+};
+
 static const struct parent_map gcc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
@@ -241,7 +258,7 @@ static const struct parent_map gcc_parent_map_7[] = {
 static const struct clk_parent_data gcc_parents_7[] = {
 	{ .fw_name = "bi_tcxo", },
 	{ .hw = &gpll0.clkr.hw },
-	{ .name = "gppl9" },
+	{ .hw = &gpll9.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
 };
@@ -4552,6 +4569,7 @@ static struct clk_regmap *gcc_sc8180x_clocks[] = {
 	[GPLL1] = &gpll1.clkr,
 	[GPLL4] = &gpll4.clkr,
 	[GPLL7] = &gpll7.clkr,
+	[GPLL9] = &gpll9.clkr,
 };
 
 static const struct qcom_reset_map gcc_sc8180x_resets[] = {

-- 
2.25.1


