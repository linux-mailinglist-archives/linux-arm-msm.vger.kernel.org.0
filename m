Return-Path: <linux-arm-msm+bounces-27049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F4D93C0F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 13:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67050282E80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 11:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1152B199EBE;
	Thu, 25 Jul 2024 11:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UTeGty7N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD4199EBC;
	Thu, 25 Jul 2024 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721907237; cv=none; b=CaDnKXICYLGBEBMU+DGPv+8yLlfotjy9yFxDCmlVf4oC6ksNPuW15ggVIzcr1Jpcc5PZXa3+HyHbEa+acHe7vx77OJSQxP7HOCiIue6o2UKS16xvSrvMajCymgT5o9PW+n56ze4DcxYhpewH2hrs8GsmbliFYCiilr/4SFx8aCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721907237; c=relaxed/simple;
	bh=VIc+zncvVVJjd5TcRgoIeTCGg7y/W0ZxDKeKHmKNzBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LilHNcq9t2tTkaBrJo1LQZ7cPebJR2/B1jRHjy0pB0T0gyHr9Rbj6Tr7oPP7UVENpd3lC7xpTWlj6FI2W+gK563LhiXekUm3k2MRCWTB3KNIUmW7Mj3WoSigLjx95UO7jGaNKmxw3PqRjqQjYYvt3Owh9ec9y2Kpi5XED8sGcDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UTeGty7N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P97H4k010860;
	Thu, 25 Jul 2024 11:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Y3l5h45xc/Eq8mbuHh7yGTqAZrrBUvxy7/4q7bkF6I=; b=UTeGty7N2aBF7NPF
	+TpaR1ROwEzIcHREh3WAlOkuUWpQIRV5PhEPRvA2ZONs71v2y7EWM3E6Q5K/na7d
	zJn2ceWGVhAR1MRUgl39SHLRjbadj8F9kR+c5/xAxjVEAV2+wygDOzzJaoFDWj5+
	EzZuA0yWcpQcqtxUI0FvFd7nNhcf/WRaigHc5/H5MP9nh47xYl7mWA8NgBqVbK29
	bRHFlD6hKp2ESGW11budguOVNUzuK7hTADB3iq7tRm2H1K9STcj9cKNVyeLLlgmt
	2qnOrXWXJOEz74Lkgcfzx++zS1VH0sjigDakRcp5QqLsSAJ/lSh7e5yVq/fPqo0x
	/L2ecw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40jyrfkbq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 11:33:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PBXpcT031940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 11:33:51 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 04:33:47 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Thu, 25 Jul 2024 17:03:14 +0530
Subject: [PATCH 4/4] clk: qcom: gcc-sc8180x: Fix the sdcc2 and sdcc4 clocks
 freq table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240725-gcc-sc8180x-fixes-v1-4-576a55fe4780@quicinc.com>
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
X-Proofpoint-GUID: a17P9d2_WWqJ88pK2nkuvz7NS1mFx9nW
X-Proofpoint-ORIG-GUID: a17P9d2_WWqJ88pK2nkuvz7NS1mFx9nW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_11,2024-07-25_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=982 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250078

Update the frequency tables of gcc_sdcc2_apps_clk and gcc_sdcc4_apps_clk
as per the latest frequency plan.

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/gcc-sc8180x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index f9f3e1254ce1..e85e75792ac3 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -974,7 +974,7 @@ static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
 	F(25000000, P_GPLL0_OUT_MAIN, 12, 1, 2),
 	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
 	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
-	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(202000000, P_GPLL9_OUT_MAIN, 4, 0, 0),
 	{ }
 };
 
@@ -997,9 +997,8 @@ static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] = {
 	F(400000, P_BI_TCXO, 12, 1, 4),
 	F(9600000, P_BI_TCXO, 2, 0, 0),
 	F(19200000, P_BI_TCXO, 1, 0, 0),
-	F(37500000, P_GPLL0_OUT_MAIN, 16, 0, 0),
 	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
-	F(75000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
 	{ }
 };
 

-- 
2.25.1


