Return-Path: <linux-arm-msm+bounces-42954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 233B59F8F5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76B5A160C66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E5F1ACE12;
	Fri, 20 Dec 2024 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gWuyofKk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE6199E84;
	Fri, 20 Dec 2024 09:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734688295; cv=none; b=XGcsOWfZ+f5PfETE+r43wyWMKnUOfTIuoubZeqbURbka+c7QjD/XE7Wn+JN6ejF4CX/Uu+rN7hxoWJAZKaR1EAZYgLkThcusxgKf8ppuPpv74axS5t6Fz9sLab7U08ExO/e398d8OYAThMpg+GZSMt2k7y+ZhCDlFzMUSBs0vs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734688295; c=relaxed/simple;
	bh=qOwso/SHpEXaGxkAyPG8iBkqg9GhvqY50oX+iClLyDw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hBAN9QTdkwBgnEfA3GWPywjwYz7gD84lJHThqGLUAVrwh0ntRD7BnS/XvdyYIKDmFX/4e5Qa6fr0Hhv4SET3Lu6LsO2NBH6jJWcRw2MWmiZw1SVyaiF3pju/OJOfWbY5SP4nM9grfONDE6x7cADVm1mIpFYpD39YGUcD3VzNF3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gWuyofKk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7LlOn028178;
	Fri, 20 Dec 2024 09:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kyJjQ+f+A9Q96aM7CytjoO
	GcvaHTb7ojyzn0FzjC/cE=; b=gWuyofKkd1rf3/iwWb29M8+KvFaXbgZtu2gefe
	PP4YXerP3twksQHe9BE1WBn8EkUoMTDD6+KUFmsf/ApB5ay9f4L4cKeYvQ5u1N42
	XN6EGZfLOTsjxWSEIeDTYHz35aNAjVWneJU8y6ZGM0hObbyUIRzdPXw7bBYmCUW1
	+SeL8yM+tyFoVE1mJgVbalU8HalRug3j9Ta1DR0XlT0rxlC/itnu58PlcsSYQ8cN
	BJql4YwwMZN93TBpeeRt2x0naXEtFcpr0+C6irVVSvEZ7NYcHStaYk4eAx2omGAC
	QXTGj9QvZXw9cP6ZxdE4xtbzpk/gmgGk05zXt0uH/XCdfwYw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44ggdef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 09:51:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK9p7n1016114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 09:51:07 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 01:51:03 -0800
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH] clk: qcom: gcc-mdm9607: Fix cmd_rcgr offset for blsp1_uart6 rcg
Date: Fri, 20 Dec 2024 15:20:48 +0530
Message-ID: <20241220095048.248425-1-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PqgmC2ury4pVMUrgV18OkEjZcn3oVcXV
X-Proofpoint-GUID: PqgmC2ury4pVMUrgV18OkEjZcn3oVcXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=806 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200081

Fix cmd_rcgr offset for blsp1_uart6_apps_clk_src on mdm9607 platform.

Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 6e6068b168e6..07f1b78d737a 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -535,7 +535,7 @@ static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
 };
 
 static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
-	.cmd_rcgr = 0x6044,
+	.cmd_rcgr = 0x7044,
 	.mnd_width = 16,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-- 
2.25.1


