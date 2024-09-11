Return-Path: <linux-arm-msm+bounces-31450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A359974B34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 09:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C71E8287B2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 07:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20DE13C8F9;
	Wed, 11 Sep 2024 07:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nZwH4kPt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C313AA3F;
	Wed, 11 Sep 2024 07:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039535; cv=none; b=HhdimOJj+VucmYobBhdTjdUPWtA3LyzICd8Ot5hGoSmI2NGAmsPuP/xiDjAzTV5fSZoGsrzwOH1XB2BETjfMaeaIfXjG3Wh2HBquCbg5ph18ODdBkLX2YATuUy0GirAu1zizIWMikmzobVoc+o/gZyarW/wii+V2rqx5jCM3iwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039535; c=relaxed/simple;
	bh=fWh9wTT1hRsm06rNlOwK3vlWOTqq04CDdl3lI/fHXYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=kPCre6Ix01B2MW2GDy2SXZTPP6xZNQdCANFURh88hJ9IjkK8mr6Gy+bynpQTOg7DOPjORLNQtScHj5GmGPhG2WOK4ZhpwU0Fv9GH43EeeWfIqNXgfIQKFkQSHW5KFdof7UGtkrzl46UQF+HJEFuEpxWqyjZPD6jp+vhnF/ep/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nZwH4kPt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B4EokG021289;
	Wed, 11 Sep 2024 07:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=24DZE/gqBF4+eS49GMnnS+
	S0OuubCmpa5vHhdv/Zm7o=; b=nZwH4kPtSE9yxtbNKoE8kKj/MzxUqsPaq68/Og
	xgsLArpRrteh7AusnBfrOwyuzi2ADPQAhx9S5tfxBNq4VAIEakq/sc2/X7cKt3Ul
	Xs0fbg+SUeFUYzqZXARsazaRbBtGIAqQR9JHboFOg97ov4rs4dBG2mICm1bUK+F1
	4ROKkzOxrhGj7h8VkTW3J/r2SbX1WwuIWuIu+WtogJaRTBje88G02rxEYnh73e/7
	n/A3PyDjKM/GVuZz4eEj+ZWGwSsDk71L93/f54pvXmckMo4e/T07Ifbsn1r+RmdD
	xqdqY81Yj3opl1KB55tPtAxhkTPWZw+FQ8mW1DzkPEWFCW0A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybprpxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:25:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B7PTt1005738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:25:29 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 00:25:26 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 11 Sep 2024 15:25:15 +0800
Subject: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document QCS8300 IPCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-qcs8300_ipcc_binding-v2-1-ca15326c5d0f@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANpF4WYC/0WNQQ6CMBBFr0Jmbc20AgIr72EIqdMCk2iBFomGc
 HcrMXH5XvLfXyFYzzZAlazg7cKBBxdBHRKgXrvOCjaRQaFKsZRSTBSKE2LDI1FzY2fYdUIZSXm
 ayyKjDOJ09Lbl15691pF7DvPg3/vLIr/2F8T0H3Q8s743Zg4sFilQGLS61K0hxPNlejKxoyMND
 6i3bfsAeHq7k7oAAAA=
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jassi Brar
	<jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tengfan@quicinc.com>, Jingyi Wang <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726039526; l=1176;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=fWh9wTT1hRsm06rNlOwK3vlWOTqq04CDdl3lI/fHXYE=;
 b=TKaKt8elHR8A3WjuVql4a8Rs0tzM4v/CUGnG7xvEu7vMRieAvGcQCGgcfuHe7oQZeiHzGTpA2
 vmPOC4JuY6gBOxr3XI2UBoQjPH/j7G+mJ0rsxsNkD8Lv/egBgxDeqVR
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kPnRybWH6c78TR8WE4LCnMrocWuFfszs
X-Proofpoint-GUID: kPnRybWH6c78TR8WE4LCnMrocWuFfszs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=827 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409110055

Document the Inter-Processor Communication Controller on the Qualcomm
QCS8300 Platform, which will be used to route interrupts across various
subsystems found on the SoC.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v2:
- decoupled from the original series.
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 05e4e1d51713..6323c3519a8a 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc
           - qcom,sa8775p-ipcc
           - qcom,sc7280-ipcc

---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240911-qcs8300_ipcc_binding-2d1c646185c5

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


