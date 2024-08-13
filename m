Return-Path: <linux-arm-msm+bounces-28366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E538695015E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 11:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7602728102A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 09:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584FA17C7C2;
	Tue, 13 Aug 2024 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DRSe25bh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D28BF3;
	Tue, 13 Aug 2024 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723542074; cv=none; b=hYBOVhs8YLT51afYg2ZhjfpkP9HuriEtGOje77vOspvBs+QQsdM2qr7f2jpofc8n8USKJliqc+3Xv/ke8X35BeF3k610FgqrA6jiDuPHN9cd5DizTIW2In9BLgb6hD7NxhxhLAF7b39olpeIHfIkyqBU+7njgQ73sss6iPTjeFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723542074; c=relaxed/simple;
	bh=/oZw4Yxm6i7OL1L0+QXuV+1b8dq/MqL5MzzWd2POf24=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J7tt3gCW6ez71fyt8aG3RDcZO7gVH5qrxUW4mVth3W6Lczw3lr6owuw48HCDu5n7OdO2D2LagW55M3Ccj8SxP8UEA4brmwW4STTEn8aDIf8TlIvgf9gFoeHbV0Sw3vMT9vhOZATvz1L5IrXSoQT9p6X2GnM2cWN3G6DWPmi4cf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DRSe25bh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D3k6Je002439;
	Tue, 13 Aug 2024 09:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t8eOWGf5URxoYcSQDTm+IE
	RCd4K6UU5bZ7PZ2y92kSo=; b=DRSe25bhPhk7PnLLcKh+GbaQGSQJ9T71UQcYqd
	tOzM12VsLUuM8iqfUHrqqFXH2KDtNYwIuMeV5INpTRi19yFrK+p/wIjbBK6doMw/
	EdSjiUiOmtAQyHTgGS04PSTDlXHhe5rzAfLaaLWZdmHdCubDLdCE7dnTemYanqRg
	zpAFU0LgWv5wnmsQD5TJpCApFwDOIso2Z7zXcufRKadPWpEvA1wCJYQGD1vDU7Xk
	+Q+67zwl8XQ2nWrEJ8hNqzUwrcrg6aDloqDwtz3mgOV/6F3GX6xSLe1BNTFD2Obb
	f71PLjwjs5ocg5Pg27ohfNfVA4M3OHRQp3x/SnriaL3mNzKg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x167y00p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 09:41:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47D9f6WI030306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 09:41:06 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 Aug 2024 02:41:01 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter
	<dan.carpenter@linaro.org>
Subject: [PATCH] clk: qcom: clk-alpha-pll: Replace divide operator with comparison
Date: Tue, 13 Aug 2024 15:10:35 +0530
Message-ID: <20240813094035.974317-1-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _dTJIzTVYMgzH9abpiNg-uPKSiAsI5zD
X-Proofpoint-ORIG-GUID: _dTJIzTVYMgzH9abpiNg-uPKSiAsI5zD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_02,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 suspectscore=0 mlxlogscore=988 impostorscore=0 malwarescore=0 spamscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408130069

In zonda_pll_adjust_l_val() replace the divide operator with comparison
operator since comparisons are faster than divisions.

Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 2f620ccb41cb..fd8a82bb3690 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2126,7 +2126,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
 	remainder = do_div(quotient, prate);
 	*l = quotient;
 
-	if ((remainder * 2) / prate)
+	if ((remainder * 2) >= prate)
 		*l = *l + 1;
 }
 
-- 
2.25.1


