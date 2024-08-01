Return-Path: <linux-arm-msm+bounces-27719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 400629449D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 12:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66D151C220AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 10:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F9118452B;
	Thu,  1 Aug 2024 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cr8rzDqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA6D170A32;
	Thu,  1 Aug 2024 10:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722509841; cv=none; b=ic/Qdn3POZLhiWSnvN67jkqqzlyXTYgCBeGS/BoMbU7euz8IjDsls6X6mEW85rLgcxum5BMQEV3yoZdJ1tk1KhHivzptlMJt3EKe3x7odUxLYuZJzCrZuWv/FDMDfoj2a3ZOLgoHm09y3OVpA75uXOShDQhbT0NQ9BxJ1pQIdVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722509841; c=relaxed/simple;
	bh=qI/XiZI7oO51SnGLGW1CkCUAnP0KmZgBpmTdZKVqdNE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jc9AslSMfnoSVNDGwt4Rwc1dYeYmtfW/LMYSWk2IbOE8p2f71CvKW3Hh8YetMjkaUXPI2+8PRYMkrAEgboAR7H9qSwCM7KnYcR2wuf2S/sv5mdKaE1njqaQQcNkiDZudTctVyh1FXBPBPCHqMyLQ/5rGvIKH0Y1V9rHre+nOFRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cr8rzDqG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4714sL2B030011;
	Thu, 1 Aug 2024 10:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EESac9ZfwqVSp9rYMshfEx42E1KXTo5awxS
	x82x1F6g=; b=Cr8rzDqG91CcZ91DBpsnPHc8tbYDS5Jk66xweiz/Bauv/BbxbuT
	1CcfXzc2d1oyXtqzWtdkf5Lbg6y3JJ0NIj0Y2B2dx21s+ITsS6dOJwHJCsaNIBGO
	YeXrWtSXIRNI6u+fR3t2PAoGNh6IAryOTUz1BuTmvjLNpGtgMuZiki+EiufJxvx4
	aAjrs7yj57uV/VF027EUheZBD4ehcTF2TvjLJroY0LVDTuTq4mWEayNbyqCD8NGm
	I3d0dpyPAAk+BOtjyvcCMj720r4Mu8U4HPnCdl97tnLcxnJaYAVxgdHjwn/LjsP+
	T/CLVfp49RJLqH4YHbAlmVgHuleKcCOWfbg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pq528uvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 10:57:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 471AvBIO032594;
	Thu, 1 Aug 2024 10:57:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 40msymje82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 10:57:11 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 471AvBBG032588;
	Thu, 1 Aug 2024 10:57:11 GMT
Received: from hu-devc-blr-u22-c.qualcomm.com (hu-amansing-blr.qualcomm.com [10.131.38.23])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 471AvBUa032586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 10:57:11 +0000
Received: by hu-devc-blr-u22-c.qualcomm.com (Postfix, from userid 466264)
	id 48C46503; Thu,  1 Aug 2024 16:27:10 +0530 (+0530)
From: Amandeep Singh <amansing@qti.qualcomm.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: quic_devipriy@quicinc.com
Subject: [PATCH] clk: qcom: ipq9574: Update the alpha PLL type for GPLLs
Date: Thu,  1 Aug 2024 16:27:10 +0530
Message-Id: <20240801105710.498569-1-amansing@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BL1EmhztOfM-jmZsU1w45cWZB2xSpcHV
X-Proofpoint-ORIG-GUID: BL1EmhztOfM-jmZsU1w45cWZB2xSpcHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_08,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=889
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010069

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


