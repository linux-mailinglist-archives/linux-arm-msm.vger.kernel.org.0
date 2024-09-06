Return-Path: <linux-arm-msm+bounces-31103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B296F33B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D067A1C2373B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 11:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DEF1C8FDF;
	Fri,  6 Sep 2024 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nWjxBUa6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAEF15852B;
	Fri,  6 Sep 2024 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725622789; cv=none; b=q6Nfh5O9yg9B8H7ULsou/LF8NJlgN3z6G9WUleuwCKJq0uax/0EmmrAi0efsK8WPtzX3wN7qEWxa1ILlGg+PoYtvwrCuZwagQCVvbVXz6lEDgqQrGJUaMausKAUmO45a7H651R/n3BVwP8asCrkW5ExuGPijX1JNyvHamSYU78Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725622789; c=relaxed/simple;
	bh=nR2isP9SzO3DZ0IhO9CCigww6hmPc5ghtYeDS7Ux/g8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u7tCm8rifu2HV6kLGqE0eYEfRPndKJdXtyceBbF3FMT5hmvCp+vVPdnRQYjCVNsy8PA8TDXGLrZbXkDBZuBimCS1b72nH7B6RXzHEmoNVjiYQ1zJ0iyyNk85gmQm5O21FvbLUjRcdkYz2vDIFlpKQ7eF/0hCkfTqTHKZsyhZ87I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nWjxBUa6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868eltj009479;
	Fri, 6 Sep 2024 11:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iKSTQRVXAjAYk0vB+VbvH9
	XYTepoF7oCutS3spRWovY=; b=nWjxBUa6TZTApa3ESELcTt4zit+bUUSrHwyll/
	msHWTlPKaTYcu7jKcgzasWmdSSDEOuNJb7xH+pMQPaX/UWEIG7mcf6oiNeJWISjs
	h48HloHX7dpRfFpNbYkcvjmzdPmqnAQoOnQ01u9QZOzFltvEY+zDKozetuVA4d42
	3sUPSFdEaw2iFliOY4ieU2N3sUBkumEZpNm7F1pruLRlp3Knp3i+Zy49vL+I47l8
	0Y144bd827gxUpaox4RgkxIRJgmkEFkz/YKSIPxKzx7CBMVTGqpXD1v2lWqy5cWk
	Ag59wvX3j3mnLz1VcHlHovLpWOPkVbSNJyypNoG2ui1+ozqQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwrt5p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 11:39:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486Bdegj012913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 11:39:40 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Sep 2024 04:39:36 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Dan
 Carpenter" <dan.carpenter@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "kernel
 test robot" <lkp@intel.com>
Subject: [PATCH V3] clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()
Date: Fri, 6 Sep 2024 17:09:05 +0530
Message-ID: <20240906113905.641336-1-quic_skakitap@quicinc.com>
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
X-Proofpoint-ORIG-GUID: d0yfOX_VjtyYl2xHa4V5VIv2t0LHPGcb
X-Proofpoint-GUID: d0yfOX_VjtyYl2xHa4V5VIv2t0LHPGcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_01,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060084

In zonda_pll_adjust_l_val() replace the divide operator with comparison
operator to fix below build error and smatch warning.

drivers/clk/qcom/clk-alpha-pll.o: In function `clk_zonda_pll_set_rate':
clk-alpha-pll.c:(.text+0x45dc): undefined reference to `__aeabi_uldivmod'

smatch warnings:
drivers/clk/qcom/clk-alpha-pll.c:2129 zonda_pll_adjust_l_val() warn: replace
divide condition '(remainder * 2) / prate' with '(remainder * 2) >= prate'

Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL")
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 019713c38f25..f9105443d7db 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2176,10 +2176,8 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
 
 	quotient = rate;
 	remainder = do_div(quotient, prate);
-	*l = quotient;
 
-	if ((remainder * 2) / prate)
-		*l = *l + 1;
+	*l = rate + (u32)(remainder * 2 >= prate);
 }
 
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.25.1


