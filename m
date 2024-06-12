Return-Path: <linux-arm-msm+bounces-22421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 606C5905118
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 13:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2D101F215CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B14416F0FD;
	Wed, 12 Jun 2024 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l+FKGIyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55D716D4C0;
	Wed, 12 Jun 2024 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718190536; cv=none; b=C7Cc87p3U3H/b1vhYUAH4ge1wTP5KZihGHUUywdq16uaFXmSdKJT1XURvsRqq8DKkN0Fs23gEU7dbQ+5CK2H5S3g7F2VfZMeborydEF3gSx8qlYBrDOebpqPXW6TKpjMKDYY+gjvDbwkOSZwDcIc6OSaeqAX8gD7UhPyEc0LiLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718190536; c=relaxed/simple;
	bh=rIcjMBSXazBqcvGy8BmCrNvAHJfeSwQxdHLUIYD3Zak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=E13jUlJgBFXA7l0g5BNOfiAoAd7LVdt6fNzY+GgAzU1AdmJP8rN8LaS/diownfUv5BeC4R/pr6Bpeaf5BR2uRRqQu1pGNyPDniixrwolRylJ8rZWjKl4Cxkf7A+jQxL/OcZZJzWUCek1FtkVjraK2H0UTthRK2H6rol6u76pqYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l+FKGIyT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C63GM2000770;
	Wed, 12 Jun 2024 11:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVufAAxvtUUMGRL44tiXFFEKX+k8XmzfFmNbgBw0Ezg=; b=l+FKGIyT5wO7ZrdG
	55B/ddTUqW1dUZGe9fY6D97W/aZZRxydJ5ZXzN1v/4x5iCabe3sq6AbNW/KiyT51
	iE/ma7TQ1a26XKwBH5Y4b1RVz86gtk5yBDHeLTSyKvOV9jfEDQV47h1axPC0fLUL
	vrd+2fwvR6YIfWEjJRi9kV5ehf7hFoeBXcPQ/HesveWrtqi+MZPZtSCIZ4/Skmxu
	HIMAlI6pTAVWwu/20VqAfDfKxTrqMFHS8JhN4wZMsE+PmbTXMK5YrEJthi3TTrdl
	ViYmtM6EV3XXdMoe/x/2STQiMjImByZkI31hZLzvL4Sm1Sk2rW6iokKVWxT27H32
	WpTaDA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yphsaupjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 11:08:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CB8m1a021192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 11:08:48 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 04:08:45 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 12 Jun 2024 16:38:22 +0530
Subject: [PATCH v2 2/6] clk: qcom: gcc-sa8775p: Update the GDSC wait_val
 fields and flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-2-adcc756a23df@quicinc.com>
References: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
In-Reply-To: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_jkona@quicinc.com>,
        <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oN7JFJkOcSyc6HMxj19jLAU56NLabeNu
X-Proofpoint-GUID: oN7JFJkOcSyc6HMxj19jLAU56NLabeNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxlogscore=710 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406120081

Update the GDSC wait_val fields as per the default hardware values as
otherwise they would lead to GDSC FSM state to be stuck and causing
failures to power on/off. Also add the GDSC flags as applicable and
add support to control PCIE GDSC's using collapse vote registers.

Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 7bb7aa3a7be5..71fa95f59a0a 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4203,74 +4203,114 @@ static struct clk_branch gcc_video_axi1_clk = {
 
 static struct gdsc pcie_0_gdsc = {
 	.gdscr = 0xa9004,
+	.collapse_ctrl = 0x4b104,
+	.collapse_mask = BIT(0),
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "pcie_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
 static struct gdsc pcie_1_gdsc = {
 	.gdscr = 0x77004,
+	.collapse_ctrl = 0x4b104,
+	.collapse_mask = BIT(1),
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "pcie_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
 static struct gdsc ufs_card_gdsc = {
 	.gdscr = 0x81004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ufs_card_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
 static struct gdsc ufs_phy_gdsc = {
 	.gdscr = 0x83004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ufs_phy_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
 static struct gdsc usb20_prim_gdsc = {
 	.gdscr = 0x1c004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "usb20_prim_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
 static struct gdsc usb30_prim_gdsc = {
 	.gdscr = 0x1b004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
 static struct gdsc usb30_sec_gdsc = {
 	.gdscr = 0x2f004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "usb30_sec_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
 static struct gdsc emac0_gdsc = {
 	.gdscr = 0xb6004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "emac0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
 static struct gdsc emac1_gdsc = {
 	.gdscr = 0xb4004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "emac1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
 static struct clk_regmap *gcc_sa8775p_clocks[] = {

-- 
2.45.2


