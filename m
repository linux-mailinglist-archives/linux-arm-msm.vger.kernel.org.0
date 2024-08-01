Return-Path: <linux-arm-msm+bounces-27722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5619449E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 13:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0BB71C22E0C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F68616DC03;
	Thu,  1 Aug 2024 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M2VQjQzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2D115252D;
	Thu,  1 Aug 2024 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510083; cv=none; b=ur0KXkAQYlXXOS9YBSGniHVZpyR2eV6njicxCChWkiRuL2ao7Hctu0QCtXL5UxhWRhGkVURrDAQoqZDBTDWUX+wovHEQ2PGWcwI33zKbWmjro2NJeyr6aEj6NfJOyIWW2ZVeFBfzM4tCWjmZrIITfCgXuHXqvU2tPx8Mp2N2fTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510083; c=relaxed/simple;
	bh=qI/XiZI7oO51SnGLGW1CkCUAnP0KmZgBpmTdZKVqdNE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ERRt07zGziTUOcbiyWE5hHSjQ8LOATys6+omtoWra6ytlApTc/X6a37ezbZjG0nsY0I3zJntziX6Vk1ymmND0TVHiwciVikQ87kKmAHHy71bOZ5ZJZBCiNmc9zWx1umJ3+5JbbrWvnYWZg6s4IlZ/VslvO83563i0P17CPNJgUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M2VQjQzU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4718Opav026847;
	Thu, 1 Aug 2024 11:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EESac9ZfwqVSp9rYMshfEx
	42E1KXTo5awxSx82x1F6g=; b=M2VQjQzUTv7WkW2B46PCb8fw7DKUzmCmAJNtST
	ztpznaNfy9jlIPFD3Y/H1uJhXh5tY5mjn5WgD918VF5nmA/0x2LUDgpspB6su3sj
	JSvrxwtto9OyBklXisU/bEXETeLI+SAVjVCNxGP5ciLxtGwUTReOZiR5OM5qo+ci
	+v5cFHBdlxv865sNt9eXjUj8+F11qFVvItAx9QrIrlk7zN9FaGOO5BkgsszjbBY0
	X/OxPtUh5VOHqWs2H9hzNH+2YmTyowCut8OTEuJqj3uhbfeOR2EWlThuWBsmIBMf
	IEIMte3mboXQQqGjXoXLaFEVxDh+DrBTzO8rQm630naHWrtw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msneeh0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 11:01:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 471B1EYW008197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 11:01:14 GMT
Received: from hu-amansing-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 Aug 2024 04:01:11 -0700
From: Amandeep Singh <quic_amansing@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_devipriy@quicinc.com>
Subject: [PATCH] clk: qcom: ipq9574: Update the alpha PLL type for GPLLs
Date: Thu, 1 Aug 2024 16:30:40 +0530
Message-ID: <20240801110040.505860-1-quic_amansing@quicinc.com>
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
X-Proofpoint-GUID: k5sWvqIYxbsXBVSq186kmFfjdSadxXt5
X-Proofpoint-ORIG-GUID: k5sWvqIYxbsXBVSq186kmFfjdSadxXt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_08,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=921 priorityscore=1501 clxscore=1011
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010070

From: devi priya <quic_devipriy@quicinc.com>

Update PLL offsets to DEFAULT_EVO to configure MDIO to 800MHz.

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


