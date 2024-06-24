Return-Path: <linux-arm-msm+bounces-23840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A7391406A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 04:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E491C21BE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 02:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EA54409;
	Mon, 24 Jun 2024 02:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nv47qU4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8F2905;
	Mon, 24 Jun 2024 02:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719195582; cv=none; b=lPz6x7n0XWGVJInTthUGuUsaFV35YKM9W7Q8qIqYxDQD6PBpq9I+rvJ6xXKGsSWUWIPVrTYTt/iip4vBVza12LtyKkT3ja1JTvrmp6EoeWa2pwKqrAVx3tJ0s0biVzMRfQe7/XKJupwX9qCJfo6emurLjvEKpPLM91U234lLZWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719195582; c=relaxed/simple;
	bh=NITAiZOXWR0AMDwXKLo7OIdl3pNsSluIS3m9emOj6k0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KleUd/2JV0+eQylxjAm+PPhOFJM9mIrzcbEIkvKMZUW6BgVPU5pYbXYFZCmWZRl3iLU/eL+Kc4veQkmWzpsBo2uKX+UXCOn+XxupV1cfwHsg1GIlCzTxgEFiN4KgHcVLyxOLtW7oSW8pXOTs2zhYQm+4jn+UHzq6CXowAYxj1gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nv47qU4q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NK02VO028034;
	Mon, 24 Jun 2024 02:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TAka9rd39DBhv9dKnNLxvM
	PUR6xptv6Pi0xprJWs2es=; b=nv47qU4q5fDK2ngBEsh/Wb+2Vf6jm7h7wv8EDN
	6PjyS9Z2tKHllKYFRRxQBA3JS1j8KkSQlo+6UJ73kBjAMgAhW8BIu8xh4keBMche
	Jp3LDtHEgg4dv+yMjosvcofxXwkxZbCK+KS2AoJSC6kIchdy6GNzHfo9HDoYYyYk
	48EP4NZUKnTJiTrB6CnSJWxipEkQK17VyMYqq/L3rCdSf5rhq1BIMzbiYgJ4EbmX
	MP1hUGACA6Wp5GlR8zacgVRoEWGislMp9SCMx71pUa5jxpRgxuKOYKiNCAMYt3SF
	QWLVpPUUaQkHboC/TvFF14DfnLC0q1pU7lcGgAzQiGIE5chw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaetnjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 02:19:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45O2JWpH020906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 02:19:32 GMT
Received: from yijiyang-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Jun 2024 19:19:24 -0700
From: YijieYang <quic_yijiyang@quicinc.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_tengfan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_jiegan@quicinc.com>, <kernel@quicinc.com>,
        <quic_yijiyang@quicinc.com>, <stable@vger.kernel.org>
Subject: [PATCH v2] dt-bindings: phy: qcom,qmp-usb: fix spelling error
Date: Mon, 24 Jun 2024 10:19:16 +0800
Message-ID: <20240624021916.2033062-1-quic_yijiyang@quicinc.com>
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
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: k9_EWkq0bHgBIpT0TNBmaDfqmYboLvip
X-Proofpoint-GUID: k9_EWkq0bHgBIpT0TNBmaDfqmYboLvip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_01,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=691 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406240017

From: Yijie Yang <quic_yijiyang@quicinc.com>

Correct the spelling error, changing 'com' to 'qcom'.

Cc: stable@vger.kernel.org
Fixes: f75a4b3a6efc ("dt-bindings: phy: qcom,qmp-usb: Add QDU1000 USB3 PHY")
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
v1 -> v2:
 - add 'Fixes' and 'Cc-stable' tags

previous discussion here:
[1] v1: https://lore.kernel.org/all/20240621061521.332567-1-quic_yijiyang@quicinc.com/
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 5755245ecfd6..0e0b6cae07bc 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -20,7 +20,7 @@ properties:
       - qcom,ipq8074-qmp-usb3-phy
       - qcom,ipq9574-qmp-usb3-phy
       - qcom,msm8996-qmp-usb3-phy
-      - com,qdu1000-qmp-usb3-uni-phy
+      - qcom,qdu1000-qmp-usb3-uni-phy
       - qcom,sa8775p-qmp-usb3-uni-phy
       - qcom,sc8180x-qmp-usb3-uni-phy
       - qcom,sc8280xp-qmp-usb3-uni-phy

base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
-- 
2.34.1


