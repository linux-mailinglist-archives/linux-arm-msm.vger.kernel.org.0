Return-Path: <linux-arm-msm+bounces-63202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7C6AEF6D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 13:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 491381C00215
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC78274642;
	Tue,  1 Jul 2025 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FVzNAXP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FA32727E5;
	Tue,  1 Jul 2025 11:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370042; cv=none; b=cE9/Z0pSgEaxTqHnaPlrCkAtFPxYkYq8leqscp00Hz9JA0lCWB3LUI2j5KXXasDb9oU3jDKpD9TfJJgEEL1I3GptAlrzLX3tbl6/X/kxrejUaTtWXuchhs0J5m5wnGG9zyx6Qikq5PKcAiOrfuDmc8z9Mgss1Ol4seG4YkE2fo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370042; c=relaxed/simple;
	bh=o30Xdsqm4t1+buBh7HGvLrX7+VAmxJdc29QafqMIDVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UtV8vK/LO8tCVPwAwjOcUuv/RwFFxrH2s+PHKa1qjKCBPLGz4ormpq1X8MuO23zml0wPDOrnvFH83ZhTVFUlQIKeeLyS67YOH5F6ta8275MKjiEjn8sfrckoyfK4JbKAM7MIVIvbR7Pf2apjU0shcu25xkYNPf423+WFdAPIDUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FVzNAXP9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619TV8A008123;
	Tue, 1 Jul 2025 11:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfGvJP+/7K6no1/x/eiwDXn6ZXpxb2AY20ZvaKRGGss=; b=FVzNAXP9StptFJXd
	3CVeH4NQsAHKFisJKeaA1EmcNr1E8sGHUUbjSBLbYyO7yUGGXaGamM5mARRePXNl
	C6vowcQKL4XijoVWz/6+CBrpBvznOZFuSw6QU94aGM5vz31kX6QOC1i92/0mTjDk
	2gbnJR5morK6NmfNjGquIALAQ0zCevWlcXdPMS5SNTVqLUl3p91Px0RIqETDYgoW
	Hf2x1nYUMU9qtkGrrRQwe/kaWf3cvaJUKQkrNzBKpT/QPLVHqQvwtAIyH1xFd10C
	oCJwUD7rlnxcSQ9hCboPWRg6O45+uIoZvRvTDG+IrT89L/m2/pliveHzA60JLRyn
	E04sow==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jd2n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 11:40:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561Beadb022092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 11:40:36 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 04:40:32 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Tue, 1 Jul 2025 17:10:18 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250701-sc8180x-videocc-dt-v2-1-b05db66cc1f6@quicinc.com>
References: <20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com>
In-Reply-To: <20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6863c935 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=m3WaDHdJIJcFsLUxIFMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: esQsT33t1JXePi8DWWUtCpSvlZ897E_m
X-Proofpoint-GUID: esQsT33t1JXePi8DWWUtCpSvlZ897E_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3MiBTYWx0ZWRfXyjekvvI250JL
 Dy1BYIL+PZWgZKOX5y936uFxKaDxfXq/bJypWQBxYmcEBXs05tYRsMkiQO2dDh8x/GhtPZwvbSd
 9K4xw1p3TmaVtQ8MLwHvRhgKrFqdWmQYwlKlVVrKIB4KgfPspcvlHZxsdTfmQTDrTEGgNXsVTCc
 4U6ZP6rBHHi41AFpw4jwDujrf67cBWtwb1HuauLh26gqF4mkYlVuYCtxekXNFbniC1zkZiL525n
 uQlOTMIboYeR4TQ3bnJOGzSV0Ou3mJ3LBcaLDESY2J/WJXOAuvYfoXKX5zx0oDdXc6saf+90YwS
 +WpFv4FYOJk5ntwdf8GZsyxrj2c5jS4pvvPahE8O3wK6eKTlv5JkeN+6zW9kfPV6S0wEbhUQWfs
 MH8R92tLJb8W2hEtbEIQ0hXp1kSVjvROVEJeLnCVrjb0NSkE3x1pDB1MLhSJ0mEfONeBlGml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=987 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010072

The sc8180x video clock controller block is identical to that
of sm8150. Add a new compatible string for sc8180x videocc and
use sm8150 as fallback.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml       | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 5f7738d6835c4ba999402e163fc85a07e3a47a5a..25379f2f6a867f9559516730a257e49b77ec4028 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -23,13 +23,17 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7180-videocc
-      - qcom,sc7280-videocc
-      - qcom,sdm845-videocc
-      - qcom,sm6350-videocc
-      - qcom,sm8150-videocc
-      - qcom,sm8250-videocc
+    oneOf:
+      - enum:
+        - qcom,sc7180-videocc
+        - qcom,sc7280-videocc
+        - qcom,sdm845-videocc
+        - qcom,sm6350-videocc
+        - qcom,sm8150-videocc
+        - qcom,sm8250-videocc
+      - items:
+        - const: qcom,sc8180x-videocc
+        - const: qcom,sm8150-videocc
 
   clocks:
     minItems: 1
@@ -111,6 +115,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sc8180x-videocc
             - qcom,sm8150-videocc
     then:
       properties:

-- 
2.25.1


