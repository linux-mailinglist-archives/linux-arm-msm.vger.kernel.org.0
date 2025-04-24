Return-Path: <linux-arm-msm+bounces-55383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8979AA9AC9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17D56921D64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499362288CC;
	Thu, 24 Apr 2025 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bpfNySEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8575226CF0;
	Thu, 24 Apr 2025 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495963; cv=none; b=CxAnVPRZfusVS6Y/F2XacjRv/3hkcEU1MHwBj1ouo43qfx9l3AQfLNi+rz04GqXpf8yRFU4umJbwIZK8/r1cQ5IAVQPJ+lR3Z5TQdK2Bmjh6u8CUIJMgnS8maPmGP9syY3SbhyoCc97z356u3YXueLZ+txJuHfdzub1hvWSw9ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495963; c=relaxed/simple;
	bh=HN7lQm0/qqjxOw9DVkP3jLrsWwFBo8TuKc1o3pd5FVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H4ECsnconZJ78WPQbUPN3qfP1ZGAvmL0+lG5FSYVvmiz64a7qSLS++dhpnfp+FsSUhVW/YHMVx6kCuC30VPsoxrNTkmOBI8jxzH2udCBpWADchT1oWqgVhh8bn7281J0ZrB/tWygA+JM+2w/O1h/kmozbpaPnkMUgtSGNcUqWeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bpfNySEA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBop22012659;
	Thu, 24 Apr 2025 11:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZSkca6FVMjB8QThz1Bi75ILFytGxDxolxzYbi88ink=; b=bpfNySEAOU49RHCR
	rql1nHpxLCAH+vXIHfgJzBhZ5kEvBSyHbomHbxs9tmndJBmhtOLOTPML1DLWigmW
	SGb9o37r5BT1/GmXJ4EqFaHv5hlb30c5YvQoFYMeK//vNOFJgPsAiIJ9aWpQAYBQ
	ft/fHcVbOVVjNmSoMa7WZLDqqmOojPPTN/07j2RtLl6DEm40ENakQwKDSADbpulM
	dDLpkEWJrtpqiQGhMB0wvqbCq10i81ewLhlWeJP15u01Y+B2mmPGDUzR3+2ywdk+
	zHH2BgUONev5c680JyQva5g4vTvwnQrz/mV1E6fJ9/ebUC9laUhTPpYp9YxV7A3v
	FYPNRw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3de9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OBx9fJ031262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:09 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 04:59:09 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 3/5] dt-bindings: arm: Add qcom,qmi-id for remote etm
Date: Thu, 24 Apr 2025 04:58:52 -0700
Message-ID: <20250424115854.2328190-4-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uHUZutBLc-YHava4iQsl4pL12Q6G6FgV
X-Proofpoint-GUID: uHUZutBLc-YHava4iQsl4pL12Q6G6FgV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MCBTYWx0ZWRfXxxQZ3EJHjBr1 6URrNKfamWqJ4pLh4CLNEn8d8FcoMR63W4U+AgnaD5Yw3ughwWcvp3FkpKoRPcYhJfJxHRzfPHr thqBS+PiH0tkfe7UOesZB+WABkQOijgFgSBHKoUpJeAH9GaqdVoTJRyIBnIlgIgZ+a/WZMfsjqh
 YUpVktaomRdikgWNOvEtHGexSvXf/Jxwxhg3mXQ53Em+7cmKHLFcr3Ip6UsYaz5YOMf6kFv+/Hj utQmNKXXDNRmp1U/Y2ItV51vmfWz26Vd2IQo72MyW9q+A8tPZziDcn8Om4j8uwXYru7GF8mlT/a kiSIgQ/vlVu2ml3XoIFdek4QcI0XoOrS8+YmFX50POzxhnDWCa3sn2G0L+ZxT0K+Qgfpkg4amZ5
 /NgcvUzdG9PSNaIbelEXQK88OgSNW0dEMO1qtksAWD8moVY4P5gRrnN4gutZMpw2OUkkLrHA
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680a278e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=2lVA9jdi9NyXBL0CGyUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240080

qcom,qmi-id is required for remote etm driver to find the remote
subsystem connection. It is the instance id used by qmi API to
communicate with remote processor.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
index 4fd5752978cd..947fe33738a3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
@@ -20,6 +20,13 @@ properties:
   compatible:
     const: qcom,coresight-remote-etm
 
+  qcom,qmi-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      This id is used by qmi API to communicate with remote processor for
+      enabling and disabling remote etm. Each processor has its unique instance
+      id.
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
@@ -32,6 +39,7 @@ properties:
 required:
   - compatible
   - out-ports
+  - qcom,qmi-id
 
 additionalProperties: false
 
@@ -40,6 +48,8 @@ examples:
     etm {
         compatible = "qcom,coresight-remote-etm";
 
+        qcom,qmi-id = <2>;
+
         out-ports {
             port {
                 modem_etm0_out_funnel_modem: endpoint {
-- 
2.25.1


