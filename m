Return-Path: <linux-arm-msm+bounces-38851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 249A79D5FB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 14:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D13741F21F53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9861DEFC8;
	Fri, 22 Nov 2024 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ud8nCDdt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5F01DEFFD;
	Fri, 22 Nov 2024 13:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732281970; cv=none; b=mCTZx3DI36tPYEgkpgW6XpIHyVqBO2YCVBs2xIf4jJw8y89RW1qFtYfrDWI5PDCHaJ5UX5aQ8jk65b89/9KJyoxPP6l5mVkkbMNChY3alL5LPNSFNHx1i0FjhADB7IMxSBG5KYOjjXOIIxHKbi+dYSfe61bHpSyQnmEbV+BS2E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732281970; c=relaxed/simple;
	bh=eZoAv6hSbHxeaSbNPfTpBF+habOHlkApuQ0RM74broA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h9Zw0heaCmqmBP+klFZpRcwjCsJ3zkd0ba+BeaKbvgkSUBa4/flhqv5EP3x2AWWPlZxclsylpgf6lrd4rcJa4kOnb9IowEz5HG604gM9mg/rDd9KvL2muPlzhjnF49K3DHW1v1v+SxosKojGz/47QWW0wS9P2FIYbFzVh1/lao4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ud8nCDdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMD5ZPr020748;
	Fri, 22 Nov 2024 13:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K6N9AZQOnQBx/9N5W6+uuY
	oVJngUBFScBTgfgYZby70=; b=Ud8nCDdtRe8ZTB/CvbTbFk0Ge0JsZzm7HrjQwH
	DEIWVzNPrGfNRquyKR/A2Z55jgqgo6FhSqeLbL9jDKEwvoABkekbRSKCA5w8x8AB
	qwCo89RvMQx8nxdrZQUkTsDvQjTmzE3ryXpBQ6OxoI5pSLQjQa+JrHfUJew+3sKZ
	bsIYQxFYEcgTdtwwL6P9NX9l75ZFoVfcOngkQbrF/3Z7Y2if2qUasWwfvraSyrpq
	KRcMt0YbyYFoSWvTKvprw9rTjBt6/ZuLBgIDX6H0k5yuJNMOK6EQwFCNJwq9ndpT
	LRBrkUDbQhwI3M7Ox6ERdcJlNZRJtGxCN+XxCtOiwQXmH5+w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432thpg16p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 13:21:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMDL0ut009887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 13:21:00 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 05:20:56 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>
Subject: [PATCH V2 0/2] Enable Inline crypto engine for QCS8300
Date: Fri, 22 Nov 2024 18:50:42 +0530
Message-ID: <20241122132044.30024-1-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pkEXk4YRoGgSfqBxRw9ySUwikLQTyPfb
X-Proofpoint-ORIG-GUID: pkEXk4YRoGgSfqBxRw9ySUwikLQTyPfb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=700 priorityscore=1501 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411220111

Document and add device-tree node to enable Inline crypto engine for QCS8300

This series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed

Changes in v2:
 - extend UFS ICE to the full register range
 - Link to v1: https://lore.kernel.org/all/20241113043351.2889027-1-quic_yrangana@quicinc.com/

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
Yuvaraj Ranganathan (2):
  dt-bindings: crypto: ice: document the qcs8300 inline crypto engine
  arm64: dts: qcom: qcs8300: enable the inline crypto engine

 .../bindings/crypto/qcom,inline-crypto-engine.yaml        | 1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi                     | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.34.1


