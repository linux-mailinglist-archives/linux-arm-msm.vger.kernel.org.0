Return-Path: <linux-arm-msm+bounces-1060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9F77EFF9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 13:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BA05280D78
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 12:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40303111AF;
	Sat, 18 Nov 2023 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RxdncbbN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB55130;
	Sat, 18 Nov 2023 04:40:28 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AICYlUu003643;
	Sat, 18 Nov 2023 12:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Lb6dyCD8ylRcQzXPHqPYqGZ83BPWesGMtRU9lEP1SVM=;
 b=RxdncbbNoQ+uSkYECF2FOATg2ucvSMe/u5j2qGGRARVdNSF1OW99q9X2zRJuJhVvh27n
 luKikC4dykH0tz3JgyaSA8cPIMnxNx3N1xy9F/acu9ZZaK28SxcFQhCSxwc9SskmF7wJ
 Yjetw62u0RUU86tsqagqJbl75hXYI0CXOC7HIVW/v3Qk0X4pzeAFxt9EyJ2oZellOOln
 Rash+ahCA2L6ss+gWflCxin4J7/K5iQk/1lGJH92gm0nH4+zw0t1JUkGhGH3R1+NezX2
 lffN2TI/6HRcIVnTIDZjFXYXaigX34E9BFYJZSWQOzolgFdVsi1atm4GN34JdWBHl0qq ug== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uejmurqu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Nov 2023 12:40:23 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AICeMlv002105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Nov 2023 12:40:22 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 18 Nov 2023 04:40:18 -0800
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>
Subject: [PATCH V2 0/4] Add runtime PM support for videocc on SM8150
Date: Sat, 18 Nov 2023 18:09:40 +0530
Message-ID: <20231118123944.2202630-1-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pOfWTpfzxsYc4IbnSSzrDRAzw56XRTfF
X-Proofpoint-ORIG-GUID: pOfWTpfzxsYc4IbnSSzrDRAzw56XRTfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-18_10,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311180094

Add runtime support for videocc on SM8150 and update the resets
and video_pll0_config configuration.

Satya Priya Kakitapalli (4):
  dt-bindings: clock: Update the videocc resets for sm8150
  clk: qcom: videocc-sm8150: Update the videocc resets
  clk: qcom: videocc-sm8150: Add missing PLL config properties
  clk: qcom: videocc-sm8150: Add runtime PM support

 drivers/clk/qcom/videocc-sm8150.c             | 25 +++++++++++++++++--
 .../dt-bindings/clock/qcom,videocc-sm8150.h   |  4 +++
 2 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.25.1


