Return-Path: <linux-arm-msm+bounces-63422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32336AF5C60
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 17:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A97FE3AC582
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 15:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10422D3754;
	Wed,  2 Jul 2025 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HS3suiYz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF72C2D3726;
	Wed,  2 Jul 2025 15:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469214; cv=none; b=Bi5+IncnGkey8cGVwSytLaT8whrNVf49EFG8xwwl12ZTbAhWlWSTtJE5Ttl0tNw5/YrbnTvrDMgBcv40Aj3P/EF5HksM49Ejz8h9ixQQbJJx3clpRtXY9GsyHtWcbZ+SkUcFABJjyjlI183IvUqlOSdv31lVIxxRm85BGzYB/bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469214; c=relaxed/simple;
	bh=ztBqQJeSt6XmLxkH8AgL8AaagruSAXxb7MRd1Fe1tqI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Flz43aq527JutCOckd28PMLPbmrqPysZdAOcjvhOZ2ADdX1R1vBTt6rsIhantdKtYD7r7tz1CvTIc32/8ixypb3ju8BnTaiGEo4rDU4bftVt5ynpoIpDYjl61ZcfXE/ZHkwTMlyUdxhwiMnFX92BYJRfxgvufJoZ51LHxXyM/fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HS3suiYz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562EJM7R024904;
	Wed, 2 Jul 2025 15:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C1feAWETzSEvnrAm1Fn8O1
	ECAHwkbb7sCvHiC87JnzY=; b=HS3suiYz/q0buQDqCAy15+nexkexOXKJCEIyvs
	3O6PEGKaiZJOQCW3eCoPTftryNWf+5sQFyOWn5xqEl9TtLvdwEBSjpMeiiSVMAok
	uzJveu/J7yGOpYqzStivCdSL+uguxjH8s85gSNrn71d7USOl0b/pyIQ4rTXTpoFi
	PepvgLCofVsB1jPV1/Q7zomUZ4vjICfHozmppTI6qqav2UfgG7sdHUOKpeyeWJ5S
	BSFtv5m0BmyJ8qlL7vaRxiwy1MMPDEaoUZ2ORbMti5O0ohxxKIGkEOmzg5zKfsbX
	UjdIEobJDWF0KtxS/AJG7npbrKDaqKN10mtYTzQZImr56NHw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8024x28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 15:13:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562FDRSn010528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 15:13:27 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 08:13:23 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH v3 0/2] Add video clock controller DT support for sc8180x
Date: Wed, 2 Jul 2025 20:43:12 +0530
Message-ID: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhMZWgC/33NwQ6CMAzG8VcxO1vTDhjoyfcwHqQb0oOgGy4Yw
 rs7uBgT4/H/Jf11UsF5cUEdNpPyLkqQvkuRbTeK20t3dSA2tdKoCzQ6g8AVVThCFOt6ZrAD5I4
 zxtJQU1mVDu/eNTKu6OmcupUw9P61/oi0rH+5SECwt5qQKUeDeHw8haXjHfc3tYBRf5AS6SeiA
 aHGwtbGMFNjvpF5nt8Vv0aY+wAAAA==
X-Change-ID: 20250623-sc8180x-videocc-dt-4ec3c0761f8d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QA9b2gclp2hudqi1JZt5ghtNJRQoDo3w
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68654c99 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=yiBUYm-Hlfb03F32K2EA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QA9b2gclp2hudqi1JZt5ghtNJRQoDo3w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNSBTYWx0ZWRfXz7lL8mtw3ANp
 AJhjgGOV1lZGR/RDokcPfdfZI33kqF56Kv+mPabzQk+M6plCxXDk2Kzs1u8qayMWrpFlYBAvn8q
 sMSXD85RQaaYk7gZlC30dGsVrRfA9vWBBcSbLtjsDeQRmqUzKQDk3RE2APXghHCT2gd1HsMn6cC
 w03jw9OmgJtctT1Md9VLCeJIGKZn+EocIPW7grjnXNn2tk0kgvvJxr4rk8VSx2bGl4GgmcQBnwO
 Yq0LE8mAVVMsxcgc9kFaFerh+cUp0brlo4BAkCPTdjq/qqG8iOcSHPDvLJBgCNXCACJMojxPyLB
 WCsM0hv99KXOo0rordb2PaQ5LxxdFaefgL6lngg0+jO3rfG8keuos3i/5xfJ5UXF/SB59DsxBwP
 NRn6xEmp5ItjYcqy1PPOtzrPko5C8qxFfksLyKHQrEmVIts7YCpFEQtJhU9adSM1OLyCjrcL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=867 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020125

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Changes in v3:
- Fix the yaml binding indentation warnings.
- Link to v2: https://lore.kernel.org/r/20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com

Changes in v2:
- Introduce new compatible for sc8180x videocc and use sm8150 as
  fallback. 
- Add new patch to update the bindings accordingly.
- Link to v1: https://lore.kernel.org/r/20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com

---
Satya Priya Kakitapalli (2):
      dt-bindings: clock: qcom,videocc: Add sc8180x compatible
      arm64: dts: qcom: sc8180x: Add video clock controller node

 .../devicetree/bindings/clock/qcom,videocc.yaml       | 19 ++++++++++++-------
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                 | 15 +++++++++++++++
 2 files changed, 27 insertions(+), 7 deletions(-)
---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20250623-sc8180x-videocc-dt-4ec3c0761f8d

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


