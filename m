Return-Path: <linux-arm-msm+bounces-28469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA12951890
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 12:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBD58286836
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 10:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C021AE02E;
	Wed, 14 Aug 2024 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SYAxHTLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0A51AD9FB;
	Wed, 14 Aug 2024 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723630847; cv=none; b=tXmY5M6INTL3VFnFWgkiFzFL/IOvW7pf0Iac8cE8Ft7qQ7RTHHSUNzKboxhJX4l2xUN5zre0YfbWuqdy6un4psU0E14oVJmCI1Efy/0yUnjdKFo9IZn3GVItOcCwJSIpJtCix8SZaFdMLVfukU4e+mTavS0Z7+8vvJTvihGjDTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723630847; c=relaxed/simple;
	bh=PCipO6aO89n17fEmsijtEDXMLHYcvzFyvE8dyg23yXA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F5A0EdPdmqPwTbFASn2E/eSfhdmMBG5NQu7D7CMbE+44lfXBW1W/OabqHwtd5UsK4lhuXH1tlL/pRww/T0O9R/Ah5fG9ElmMEUNuNWSMRLhDeLzNl3xZex2skg5emAj4Dcfvl9s+CSIQ+74To5t5ryv6EJJ5nbX2d6gVQt9fsLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SYAxHTLF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNFjNR027666;
	Wed, 14 Aug 2024 10:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eKK5V0RLxyU0dvvI/xvmLQ
	qda/gVganrDWsGYytc0CI=; b=SYAxHTLFzYFcc4Qxk6yxAREDts6opRAqrxKx+l
	xSKTZkbnwi0DNcpnv7VHXbvL9VAcMCb/b7Bc5NwDu8dSWMue4LADjIc10cWWYbx7
	3apVcnn2GcvM2y1xynwGtjJIZDHc89XJpu4TbxMQYQFrkxWefRJDYrD/zBeyg5DA
	a4hdXogw+E0IKa6b0fUtkhZ0OYXi4fvGPLud9soif1VdaHU9et5y1WoK1J9ByzC+
	Fk4SxdCe9Y4+Ck8B7wlFIHjwQeNwtkWJ6bvPHjuLh4JsQQmZuY+9k7FshxWDCubz
	9fsb9oub/MaL/iFI6T4D9faw0Amp88W/WCz4F3lcXL3C6yDQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x3etaq9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:20:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EAKbQO012768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:20:37 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 Aug 2024 03:20:33 -0700
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
	<dan.carpenter@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
Subject: [PATCH V2] clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()
Date: Wed, 14 Aug 2024 15:50:05 +0530
Message-ID: <20240814102005.33493-1-quic_skakitap@quicinc.com>
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
X-Proofpoint-GUID: q7uaszz1a1vs4v7urqS4Cx1RFmKTGskL
X-Proofpoint-ORIG-GUID: q7uaszz1a1vs4v7urqS4Cx1RFmKTGskL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_07,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140072

In zonda_pll_adjust_l_val() replace the divide operator with comparison
operator since comparisons are faster than divisions. Also, simplify the
logic and remove the unnecessary 'quotient' local variable.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes in V2:
 - Simplify the logic and remove unnecessary quotient variable.
 - Remove Fixes tag as this is just a simplification.

 drivers/clk/qcom/clk-alpha-pll.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 2f620ccb41cb..4ce3347beb39 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2120,14 +2120,11 @@ static void clk_zonda_pll_disable(struct clk_hw *hw)
 
 static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32 *l)
 {
-	u64 remainder, quotient;
+	u64 remainder;
 
-	quotient = rate;
-	remainder = do_div(quotient, prate);
-	*l = quotient;
+	remainder = do_div(rate, prate);
 
-	if ((remainder * 2) / prate)
-		*l = *l + 1;
+	*l = rate + (u32)(remainder * 2 >= prate);
 }
 
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.25.1


