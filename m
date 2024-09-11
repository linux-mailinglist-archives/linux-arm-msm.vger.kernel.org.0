Return-Path: <linux-arm-msm+bounces-31447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857DA974A7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 08:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B81881C21773
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 06:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB277DA6A;
	Wed, 11 Sep 2024 06:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gXs1jg61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834622BAE3;
	Wed, 11 Sep 2024 06:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726036956; cv=none; b=IbLZbKHvcjMiE0xZkwmQ/e1sEgGJMM2qelGrv7lWi5HpoFdTHAVvI9DGUKcPc10tnaw5h1+oGV5EgTPv97Zu1bb9dWN8ngvKMptqv8vqXY2QX3F1v1Mx3z74Wk/sJ7+g4T4I53z83NLo6hoUDh95ECAEkV+dMtjzesXsOnwMSv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726036956; c=relaxed/simple;
	bh=uaojO9GqqzmiZeiLvGMx4mp9pGLEMUMvpV91bs4aKp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=bTaXeBlZso4JXIgYVibCmLvcOICBb2mPfFxMqFvqQjREeDwvdY7zfy5cwDYaDQFeTW8Mo8Uya11wR/rarZ4yvtBGGb606IqEOi2df3TxRD/aH7IDYkaOtYwkLcqQJDu0/WpZ6hSCN510o7X2On02wPZV78xMZWcWgjjDPsJ2LE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gXs1jg61; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B47epq028325;
	Wed, 11 Sep 2024 06:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XoGYG4UIsvAMfmoeFuukCw
	yIeurJJZ74L+K7BSzK+hw=; b=gXs1jg61d0BMCe8pVf4mJH3u+zMAgOHSZYe5ec
	HX7qpQkOJcv2ivhOSu5XuDCZUmN0s1VZhcxlmJLLHuwxtwxFY6ufA+KZfxwvoU2W
	isV67FhtXrYrhni7sA42KI+Uu424uC5xevFGK7Yguo4m9f2cjVX+RirnKRqHIBCA
	BLqC73Fylruwy6VkyqbqbAJHB+RJCYG0Ye4o3an9FSH13jU2PlmIqatpVs2+yTqR
	oAd9HnTauHF1A6JHwuTNqMk38d/QFz65GFwLNyFEpna2CSXEESZDQXnBiG+wkC2P
	cItuWI1vyl4sj2NSnW1xqVyuAtCBRGG65RMuFReXpv3I1A9A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6e8hmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 06:42:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B6gFCm000898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 06:42:15 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 23:42:12 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 11 Sep 2024 14:41:43 +0800
Subject: [PATCH v2] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 QCS8300 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-qcs8300_remoteproc_binding-v2-1-01921b110532@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKY74WYC/z3NQQ6CMBCF4auQrq0ZKlVw5T0MIaUdYBJpoa1EQ
 7i7lRiX/1t8b2UBPWFg12xlHhcK5GwKcciYHpTtkZNJzQSIAqoc+KxDeQJoPI4u4uSdblqyhmz
 PQUjTSllKec5ZAiaPHb12/F6nHihE59/715J/1x8LxZ8lS5HUozExEF9yDtwAqkp1RgNcbvOTN
 Fl91G5k9bZtH51CI2fAAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jingyw@quicinc.com>, Xin Liu <quic_liuxin@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726036932; l=2713;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=uaojO9GqqzmiZeiLvGMx4mp9pGLEMUMvpV91bs4aKp8=;
 b=lMp1SWL4+sqcvaKhHPF90ySXeCkLb/XBS5CWsqqsLakEB53xEy0uwS0CtccR73NBL2zZ7N0NH
 Rv4JwG6dndzBxqGOgmjAdXVlZcN/A92XXWjMps1yU/1cXRGst3zDfVC
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Tf7Xq9c9OOBsVdqJA6Dk-TLOUYIWPgyu
X-Proofpoint-ORIG-GUID: Tf7Xq9c9OOBsVdqJA6Dk-TLOUYIWPgyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409110049

Document the components used to boot the ADSP, CDSP and GPDSP on the
Qualcomm QCS8300 SoC. Use fallback to indicate the compatibility of the
remoteproc on the QCS8300 with that on the SA8775P.

Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v2:
- decoupled from the original series.
- Use fallback to indicate compatibility with SA8775P.
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
---
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      | 28 +++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index 7fe401a06805..44b5ed5b1c92 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -15,12 +15,25 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-adsp-pas
-      - qcom,sa8775p-cdsp0-pas
-      - qcom,sa8775p-cdsp1-pas
-      - qcom,sa8775p-gpdsp0-pas
-      - qcom,sa8775p-gpdsp1-pas
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-adsp-pas
+          - const: qcom,sa8775p-adsp-pas
+      - items:
+          - enum:
+              - qcom,qcs8300-cdsp-pas
+          - const: qcom,sa8775p-cdsp0-pas
+      - items:
+          - enum:
+              - qcom,qcs8300-gpdsp-pas
+          - const: qcom,sa8775p-gpdsp0-pas
+      - enum:
+          - qcom,sa8775p-adsp-pas
+          - qcom,sa8775p-cdsp0-pas
+          - qcom,sa8775p-cdsp1-pas
+          - qcom,sa8775p-gpdsp0-pas
+          - qcom,sa8775p-gpdsp1-pas
 
   reg:
     maxItems: 1
@@ -64,6 +77,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,qcs8300-adsp-pas
             - qcom,sa8775p-adsp-pas
     then:
       properties:
@@ -80,6 +94,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,qcs8300-cdsp-pas
             - qcom,sa8775p-cdsp0-pas
             - qcom,sa8775p-cdsp1-pas
     then:
@@ -99,6 +114,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,qcs8300-gpdsp-pas
             - qcom,sa8775p-gpdsp0-pas
             - qcom,sa8775p-gpdsp1-pas
     then:

---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240910-qcs8300_remoteproc_binding-025db5585561

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


