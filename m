Return-Path: <linux-arm-msm+bounces-55019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB98A97BBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 02:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0F8A189F8E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 00:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1ED255249;
	Wed, 23 Apr 2025 00:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eW+Xq4iF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59FE1EA7C3;
	Wed, 23 Apr 2025 00:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745368738; cv=none; b=H+IJzSHA9usa4ydqw2Wrd1yNs8KDc4QKHIwz8Byqo6crPM5VpRVWhWj00+SKV3Ni2NeruVfdhFOr4x4JQnSocWw5YNkKFcUvqMOVCTsPs23r4BvSh2SFiFbWi+kNoZELi2T7d7G2o/eGDhpS1j9LgHZFgLC4qaT6ckIjBSTtJUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745368738; c=relaxed/simple;
	bh=3reR6DxtUZCA5LPVIJw8McPNOcN3HkBvgNpR130vmcs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZhSm9P8hb26UIWCm0yh4a0fbEXpTEc2Ky0W7HQOfljmTc77+d6BvDQ2Q63RCj5Jj/21zuYZZytTAtuNRS9eClvJh9WVCPJIr3QbBanw34T6tlcFS4uRPfpem/4hKAORh4pgOssDVI3QrgbOK9go2pxw4ASmkWJGXhbTILr58580=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eW+Xq4iF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKpMua020721;
	Wed, 23 Apr 2025 00:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aPGtqtyvVRCM1LlzoTmuBO
	6mn2leG1iuqML8BkVOIEo=; b=eW+Xq4iF/qJqnRb0pQIn6meeC2l7wbw6VlL6r/
	fMjALC5XMAwnW6XUIG4HzwTjBNLxzsracSziPnKbepneEEacX3zuBUYbgc6Mo1iA
	5dHxNSek8mUSSWRdYyAhqXIp8kWsKTvTL6SHiDhkyN1x4fKQJpEuU1n+HRvfBGL9
	npPK2Sy0IY73ZfGfj2gTr6XZvjslbPFjBUeM+Y+J8wP5s9NJGIvurZXZ1vMkRXaS
	iU0ufNVlRfabUbyjHHDbzcxwnhFUCiMlqxMFig+bBofFD/qBPlDynDrLnXh1W7uc
	2cfiI7+rOMnWHGXm/+WfYGNI3YAH+J2ErhshR4RJBs/fBr4Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1gcrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 00:38:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N0cpPg024523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 00:38:51 GMT
Received: from hu-djaggi-lv.qualcomm.com (10.49.16.6) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 17:38:51 -0700
From: Deepti Jaggi <quic_djaggi@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <krzysztof.kozlowski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_ptalari@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_djaggi@quicinc.com>,
        <quic_shazhuss@quicinc.com>
Subject: [PATCH v3] dt-bindings: arm: qcom: add SA8255p Ride board
Date: Tue, 22 Apr 2025 17:38:45 -0700
Message-ID: <20250423003845.3980330-1-quic_djaggi@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZWa1VJilE0XsWqVE37Zb2SqS731m9KH3
X-Proofpoint-ORIG-GUID: ZWa1VJilE0XsWqVE37Zb2SqS731m9KH3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAwMSBTYWx0ZWRfX0Bq5oTSjJiw6 WZVQzGYj6vySF6kTy0zFi9obXcUShO7RwxlP0NL8HH4EDO24wrAIXufYKfaUAk+m8LQhCr1kYSD pq3V5nbutsAzsJkrY/Q+stogBIe8H1rrISGyrgLMTB7zDRf0ilW+MuLapIng0Zu5F9Tv65ZNrgV
 fOZ3FB70Asc9pZdBoid4HBox+MYoCcXV7fkVIsnz/ud2LTHlWyIDMIJcwM2/xARHZPunxcIZImW gVg/LsDlYtKg0rwXsomPz1TUBSD5+D5Avb9MId8+sstm/S3ttCQzYojZDCKw/vp5K/t5AsNTdbD d91DlCqietCEep3jhjjKeRcVgEwPDOL8yVmkh9+L/y/6JJZOGDTAvVyhpOx0LJq+A8bev9IMfJa
 nu8sDcSfICSLdVnCEQtS3ysZk3JXsfPb7Yg1TWNaW1oTCDgZoxJXPh/RIfjyu1LLvYVl0mtJ
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=6808369c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=Xa2697xR4UaWZu1uWHMA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_11,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230001

From: Nikunj Kela <quic_nkela@quicinc.com>

Document the SA8255p SoC and its reference board: sa8255p-ride.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <quic_djaggi@quicinc.com>
---
Changes in v3:
	Removed the patches from original series[1]

Changes in v2:
	Added Reviewed-by tag

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 08c329b1e919..5fe098566979 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -64,6 +64,7 @@ description: |
         qrb4210
         qru1000
         sa8155p
+        sa8255p
         sa8540p
         sa8775p
         sar2130p
@@ -948,6 +949,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8255p-ride
+          - const: qcom,sa8255p
+
       - items:
           - enum:
               - qcom,sa8295p-adp
-- 
2.25.1


