Return-Path: <linux-arm-msm+bounces-29697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD84961BBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 04:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F097D282DF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 02:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35F513B2AF;
	Wed, 28 Aug 2024 02:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Iwc79S4G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670ED1332A1;
	Wed, 28 Aug 2024 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724810576; cv=none; b=kxs6M2YLK0RapEJPqrtCkpwRPrvL9OmOlFPr8w5/YLg8IXAjEX5PZ+FCVH9NiWZMTuiez/YiriQ3scTfqnaWX0EsEVyiMAWsG+HawaRttiapKi/Z8fVXqzh2oDYHbUC6+6STf1d0YWgwlGRyKAo4tRZLsd9p06i1q+r0sprjohg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724810576; c=relaxed/simple;
	bh=meumI+sLs9Rba0UtfUQ/JaLdjDjFASS4+P+a6iILQyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=W3iadK2ZHZk+it+cnOLRYOZdrztN6HHGEhUs3YlFLQS++Wnbyn73XFsW8y4apCwoWl3CgOMZNNWkS0UxE4XMzJYLDwS1wWyoF/CmL2lxJP3+koNXzSMRd10LgLCZagwETYaVv4yYgXGmlULCRNxIXcJR29LTfGsfl8rtD9bP2X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Iwc79S4G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47S0g5hT008208;
	Wed, 28 Aug 2024 02:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aozfj5AbvOeisevJZv25dJAdsa7I0guF4I75sgBNmvc=; b=Iwc79S4GL0ej1QZE
	yBEdjVEO9D7D3fNnDlX/thxVW9FGw0EyN43O4skA3ElKHArR+R8e/3BaTTVigl00
	jNy9Mgq1rQo5iw+zSorlzepa3jI3lRP8l1fD3BgGeQzV6K9FlDmOZiw6KBEf9otv
	+F615WRWtwNLwm3xh3lsELIJwAL5b/Zel/CbZFKkk/d77NKzE7yYIuTCDgC2EG3j
	tAw5y6bQUwi+N2NzvGaS72olL5pkefYc/qjCtSCB4bbY/y00ZntsxE1Bbwp6M8KI
	x8f2nMFuatcxwe3Oa7WnqtnSo/myU9CNJvWAsVdW2cIOmhCQwIvYzSChVmQ0sgKv
	4uo8gg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0gdbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S22fjr017566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:41 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 19:02:36 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 28 Aug 2024 10:02:12 +0800
Subject: [PATCH 2/6] dt-bindings: arm: qcom: document QCS615 and the
 reference board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240828-add_initial_support_for_qcs615-v1-2-5599869ea10f@quicinc.com>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
In-Reply-To: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724810550; l=943;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=meumI+sLs9Rba0UtfUQ/JaLdjDjFASS4+P+a6iILQyY=;
 b=olENmKzSFnQ5xbw39bbkyKLbMS5/+abDySicooYHAWALH7BYjFaNhj9F1f7FGf0Bze35Cgksq
 y+Dh6NA/+uEC4RzAK20XC0amMIUGpVuhM5iM/qvxE0MEa6NBmnADycE
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QAQVFFKtsWYKzZfMoWBtRmu1L1On7hlK
X-Proofpoint-ORIG-GUID: QAQVFFKtsWYKzZfMoWBtRmu1L1On7hlK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_01,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=916 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280013

Document the QCS615 SoC and its reference board QCS615 RIDE.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c0529486810f..957c3bc91ef2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -42,6 +42,7 @@ description: |
         msm8996
         msm8998
         qcs404
+        qcs615
         qcs8550
         qcm2290
         qcm6490
@@ -895,6 +896,11 @@ properties:
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
+      - items:
+          - enum:
+              - qcom,qcs615-ride
+          - const: qcom,qcs615
+
       - items:
           - enum:
               - qcom,sa8155p-adp

-- 
2.46.0


