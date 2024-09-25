Return-Path: <linux-arm-msm+bounces-32433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB899853FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 09:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2952C1F252EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 07:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F190E18BC1F;
	Wed, 25 Sep 2024 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P5Hru2nV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B4E158DD0;
	Wed, 25 Sep 2024 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248918; cv=none; b=Fi0z1fMvdweo8oJWsYjOKpF+nY4pBnhxA0SppozJb/xJmJqUr1hz8BKW7u2KtzWdlLtJYpV6XYksdKyhBx60PKFKSqufI21F5okABSfgPgPb4sLK43Q3pMbkkrUVMWmad6zvjvi34AfvYJ6pGBW9x1WUTqTZSM0GTqkaTvGe6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248918; c=relaxed/simple;
	bh=0duqzIbJP+EDWRh7SEq4Wcci126tHAwp/wCmCR//9nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=GLwBtXdDnC+iPxxHhwXeeNT4tmUN/9sd6jcKDPTAPFiRO+hyQBrZ0FH8feIW006LqZkaV6x9+clq2j4neO84tazDcD55o2ZVbf5qCj0LWDeSGrsVXYF+QGkHngcdP59F+/E+fMQeVp6iSKqil4AswyOvCAztuKGv/0oHzzvFnDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P5Hru2nV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P6hbi3027146;
	Wed, 25 Sep 2024 07:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=79E9zqvI3/eeioYKUDiUFB
	rrI7q47XV5VAK8F7+EBx4=; b=P5Hru2nVgcnsawSMAdSpfA/coYszn7Ie86pdlP
	6JF/zqTuEznKs1cLxbsaT9Q+GiYDTNzk8gZCQduafXwXcdo9sVJqaxHUyIWr6kpe
	ewG1yhMnMDJ0g+Jk90vG+UIIuDF3CwatZjSrvoDmJ+Jw8gC2lnaHmQH/oUQ5vE5t
	JYZxvlKoymdhIbUGMiA4ddKHBRkWFjAQj8RYkLLzSRn9JeZt5bV3zdm6blG/pfXm
	3FS33a8mXaHh9PhvLvptcryUMLbyoUWtOisPaoMqA0ulWmSnQCLMDioxGJ/MADsB
	PKKxHAOVOLDPGKj3HoIrmdP4rqskfq5M/TxP4z3xZ9br39bQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe9aybm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 07:21:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P7LqjE018597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 07:21:52 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 00:21:49 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 25 Sep 2024 15:21:37 +0800
Subject: [PATCH v3] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 QCS8300 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAC682YC/33OQQrCMBCF4auUrI3MTC1aV95DpKRJagc0qUkNi
 vTuxiKiG5f/LL43DxFtYBvFtniIYBNH9i5HuSiE7pU7WskmtyCgFdRUyYuOmxKgCfbsRzsEr5u
 WnWF3lIo25bpVLWEFIgNDsB3fZnx/yN1zHH24z1sJX9c3C6sPy45HVqfGjJFlQgnSgFW16owGW
 O8uV9bs9FL7s3iRib4YxH/fJZKZw5qwRYSqpF9smqYnU8TgwQ0BAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Xin Liu <quic_liuxin@quicinc.com>,
        "Jingyi
 Wang" <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727248909; l=3254;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=0duqzIbJP+EDWRh7SEq4Wcci126tHAwp/wCmCR//9nc=;
 b=dg9l5ZosjWrzndKWgJ/Yl7QgeLsRsQGgkQayQMeehnKTms3KOOu2hede1HFr4xpZ3oNTgyGeE
 P2VVk2eZ9iuAvpvKxT8ukY07tWGPv2GX1VEEWAH/ajnh4vMfOcuSDoj
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Gv4m6-rrN6Ki5Vk_RYCXJYeMioBJrqda
X-Proofpoint-GUID: Gv4m6-rrN6Ki5Vk_RYCXJYeMioBJrqda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250051

Document the components used to boot the ADSP, CDSP and GPDSP on the
Qualcomm QCS8300 SoC. Use fallback to indicate the compatibility of the
remoteproc on the QCS8300 with that on the SA8775P.

Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v3:
- add "contains" and remove redundant compatible.
- Link to v2: https://lore.kernel.org/r/20240911-qcs8300_remoteproc_binding-v2-1-01921b110532@quicinc.com

Changes in v2:
- decoupled from the original series.
- Use fallback to indicate compatibility with SA8775P.
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
---
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      | 44 +++++++++++++++-------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index 7fe401a06805..a66007951d58 100644
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
@@ -63,8 +76,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sa8775p-adsp-pas
+          contains:
+            enum:
+              - qcom,sa8775p-adsp-pas
     then:
       properties:
         power-domains:
@@ -79,9 +93,10 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sa8775p-cdsp0-pas
-            - qcom,sa8775p-cdsp1-pas
+          contains:
+            enum:
+              - qcom,sa8775p-cdsp0-pas
+              - qcom,sa8775p-cdsp1-pas
     then:
       properties:
         power-domains:
@@ -98,9 +113,10 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sa8775p-gpdsp0-pas
-            - qcom,sa8775p-gpdsp1-pas
+          contains:
+            enum:
+              - qcom,sa8775p-gpdsp0-pas
+              - qcom,sa8775p-gpdsp1-pas
     then:
       properties:
         power-domains:

---
base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422
change-id: 20240925-qcs8300_remoteproc_binding-a2837bab2150

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


