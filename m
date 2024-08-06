Return-Path: <linux-arm-msm+bounces-27979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC0D94893C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 08:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03DA3285897
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 06:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA27D1BC08B;
	Tue,  6 Aug 2024 06:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lt7evMMd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAA01BA87B;
	Tue,  6 Aug 2024 06:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722924691; cv=none; b=i6wAAbT3WNkbl4jcUK3/mSvdlRadcEPWroJEZ57+9IFqvRHsTyI/vYC4yYaEAL9f3brnwwSNSNCZxacvc6McbNwfydz0LFxiEJ5qMJXin30wKl2wY/nQDtsqg3mUONctAGNEQty5yQk1C3SKkZ78vVgfUoft949WES2pbuAzTUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722924691; c=relaxed/simple;
	bh=ggbTg3w5DaB27aS9nuUMEUMa4XGHsO9n/U7ORxnpZxw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l6p4rVqwnpgN4HfqE4s+KbtlBBzxz6+eF20VGfKQQQeoM2W8YOYdPUwebU0ldVQ+8mv0AhUWlPXvLifp3v0gVEDSRPEWYUZ4vNolmAWWF+aLaiFBBU4rqOW2PK1dzJJNF1FimEi9XY5OBfhTV21v70prqhp5hCXDJUhCDk8XEm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lt7evMMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4762IcYp011347;
	Tue, 6 Aug 2024 06:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZzaHtt/GOQjsAeZkbz9lRv
	0LUUYBHAWMfnCyEbHdH6A=; b=Lt7evMMdJs4iE6GZxsCwbYCAzojzHXA4DgArTe
	oZ77M/48pUdDlHAK5o5LpGEmTu5NfGKpRkvR7soWmHZY1x1N6ahoD6FhC3Yl+Foy
	w63WATnZimycak/QB0yRKuh22Rs2tOPCIo5dO2M2RCupm4diOwRatH59beiSvsb6
	1njuXPfWu60xdhuRlpp+5ru+iBx64oocFSNvQ2MAm8P+fVfieGeYROQR/xY7J2Jl
	X68dkzdcEJ2dFLU/32Fz3ReUHF4gWx32hfQcoQlSY7rAl+42Yj6I9JnxlGxBT1g9
	nsEl9al6kpNoOAz8IYx7GtfVaJM+DXv2vv4KrdJDL9gQ/brQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbj6pa7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 06:11:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4766BNX4000692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 06:11:23 GMT
Received: from hu-amansing-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 23:11:20 -0700
From: Amandeep Singh <quic_amansing@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_devipriy@quicinc.com>
Subject: [PATCH] clk: qcom: ipq9574: Update the alpha PLL type for GPLLs
Date: Tue, 6 Aug 2024 11:41:05 +0530
Message-ID: <20240806061105.2849944-1-quic_amansing@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jB5JX98LQZa1NHRqJZtykkPs-vdid3AE
X-Proofpoint-GUID: jB5JX98LQZa1NHRqJZtykkPs-vdid3AE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_04,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408060043

From: devi priya <quic_devipriy@quicinc.com>

Update PLL offsets to DEFAULT_EVO to configure MDIO to 800MHz.

The incorrect clock frequency leads to an incorrect MDIO clock. This,
in turn, affects the MDIO hardware configurations as the divider is
calculated from the MDIO clock frequency. If the clock frequency is
not as expected, the MDIO register fails due to the generation of an
incorrect MDIO frequency.

This issue is critical as it results in incorrect MDIO configurations
and ultimately leads to the MDIO function not working. This results in
a complete feature failure affecting all Ethernet PHYs. Specifically,
Ethernet will not work on IPQ9574 due to this issue.

Currently, the clock frequency is set to CLK_ALPHA_PLL_TYPE_DEFAULT.
However, this setting does not yield the expected clock frequency.
To rectify this, we need to change this to CLK_ALPHA_PLL_TYPE_DEFAULT_EVO.

This modification ensures that the clock frequency aligns with our
expectations, thereby resolving the MDIO register failure and ensuring
the proper functioning of the Ethernet on IPQ9574.

Fixes: d75b82cff488 ("clk: qcom: Add Global Clock Controller driver for IPQ9574")
Signed-off-by: devi priya <quic_devipriy@quicinc.com>
Signed-off-by: Amandeep Singh <quic_amansing@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq9574.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
index 80fc94d705a0..645109f75b46 100644
--- a/drivers/clk/qcom/gcc-ipq9574.c
+++ b/drivers/clk/qcom/gcc-ipq9574.c
@@ -68,7 +68,7 @@ static const struct clk_parent_data gcc_sleep_clk_data[] = {
 
 static struct clk_alpha_pll gpll0_main = {
 	.offset = 0x20000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
 	.clkr = {
 		.enable_reg = 0x0b000,
 		.enable_mask = BIT(0),
@@ -96,7 +96,7 @@ static struct clk_fixed_factor gpll0_out_main_div2 = {
 
 static struct clk_alpha_pll_postdiv gpll0 = {
 	.offset = 0x20000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
 	.width = 4,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "gpll0",
@@ -110,7 +110,7 @@ static struct clk_alpha_pll_postdiv gpll0 = {
 
 static struct clk_alpha_pll gpll4_main = {
 	.offset = 0x22000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
 	.clkr = {
 		.enable_reg = 0x0b000,
 		.enable_mask = BIT(2),
@@ -125,7 +125,7 @@ static struct clk_alpha_pll gpll4_main = {
 
 static struct clk_alpha_pll_postdiv gpll4 = {
 	.offset = 0x22000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
 	.width = 4,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "gpll4",
@@ -139,7 +139,7 @@ static struct clk_alpha_pll_postdiv gpll4 = {
 
 static struct clk_alpha_pll gpll2_main = {
 	.offset = 0x21000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
 	.clkr = {
 		.enable_reg = 0x0b000,
 		.enable_mask = BIT(1),
@@ -154,7 +154,7 @@ static struct clk_alpha_pll gpll2_main = {
 
 static struct clk_alpha_pll_postdiv gpll2 = {
 	.offset = 0x21000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
 	.width = 4,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "gpll2",
-- 
2.34.1


