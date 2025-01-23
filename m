Return-Path: <linux-arm-msm+bounces-45950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD6A1A2BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23DD018831B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E139820E00F;
	Thu, 23 Jan 2025 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SHqaqb1g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5714D145A16;
	Thu, 23 Jan 2025 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737631012; cv=none; b=CB2MrvvObjIu6j6DHyEyWgFUr+7oMVOqZLKpbjU3bhpyrPBBg4uTOSRfJ2vwFUpHOXQLN1a5Wt8MtSC1VsQU02LHILTfO/5SNyXTcXGogu/CzkLKtA/FGhispa2C9x83srE/kiPalA8yRt9tUL0OLmijJXf9NI23wovSWea0no4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737631012; c=relaxed/simple;
	bh=mrukQwvTv99nXrlLk0C+HKWYnzaKoBLYPgJiCns7NLI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k7WahZzoevkMUmgr1oLOZF/s0yZoKJ3DUKJKw88o4szozuflu1AvuhFuZta+5zTT0kquGsPH3J4goPesUviIadQTAA/ZcUQ/siHcXdocxuZSLMn9z6doXBUodg4d+GVcWHb5+GpRtvkSLX68qBL+jtAzsHRnP9FxSkoKj2t9k7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SHqaqb1g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NA2d5w015501;
	Thu, 23 Jan 2025 11:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=27HmRAv23tCc6Veb5as0+h
	xBdx8B2mj4c9z+c3VuVaw=; b=SHqaqb1gd2jSm7+UXSvqJ/6Jso8fLwPHwcDYQO
	i2jhjmr0E15u51h69diPksySrZtORePwq/lEFzXh1zE6TGWfUH2JVTZJOGa/BjAi
	oLsrQ56DXAeFG3CdiqdbVl0PXWZOpWw6QV3XJtLvVdjhcIyCUVsdKfFUEBTAOblB
	+m6vBmVYv00OIfK8pgTfIfdm6+vw+gHbS4CIts23RWz76j8mwbWrVJpaLTrt8pTb
	IhtBEa8VMo8N69lUG7L+NFi5yBrwWrQGY01xH/aaPzPf3sj5d9IrZaq+FsFoF8xc
	s8N8v/gATUHKRFovKYFWTX2pxvvAxfAk/tB2CkefZhrUNbNA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bknxg5qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:16:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NBGkTq010370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:16:46 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 03:16:43 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH] clk: qcom: ipq5424: fix software and hardware flow control error of UART
Date: Thu, 23 Jan 2025 16:46:18 +0530
Message-ID: <20250123111618.1048461-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: M1SrIPCAtk0p4JmBUE6nObn-fDVmkvWV
X-Proofpoint-GUID: M1SrIPCAtk0p4JmBUE6nObn-fDVmkvWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230085

The UART’s software and hardware flow control are currently not
functioning correctly.

For software flow control, the following error is encountered:
qcom_geni_serial 1a80000.serial: Couldn't find suitable
clock rate for 56000000, 3500000, 2500000, 1152000, 921600, 19200

During hardware flow control testing, a “Retry 0: Got ZCAN error” is
observed.

To address these issues, update the UART frequency table to include all
supported frequencies according to the frequency plan.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index d5b218b76e29..37b1a3ff8f4e 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -592,13 +592,19 @@ static struct clk_rcg2 gcc_qupv3_spi1_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_qupv3_uart0_clk_src[] = {
-	F(960000, P_XO, 10, 2, 5),
-	F(4800000, P_XO, 5, 0, 0),
-	F(9600000, P_XO, 2, 4, 5),
-	F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
+	F(3686400,  P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 144, 15625),
+	F(7372800,  P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 288, 15625),
+	F(14745600, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 576, 15625),
 	F(24000000, P_XO, 1, 0, 0),
 	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
-	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(32000000, P_GPLL0_OUT_MAIN, 1, 1, 25),
+	F(40000000, P_GPLL0_OUT_MAIN, 1, 1, 20),
+	F(46400000, P_GPLL0_OUT_MAIN, 1, 29, 500),
+	F(48000000, P_GPLL0_OUT_MAIN, 1, 3, 50),
+	F(51200000, P_GPLL0_OUT_MAIN, 1, 8, 125),
+	F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 100),
+	F(58982400, P_GPLL0_OUT_MAIN, 1, 1152, 15625),
+	F(60000000, P_GPLL0_OUT_MAIN, 1, 3, 40),
 	F(64000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),
 	{ }
 };
-- 
2.34.1


