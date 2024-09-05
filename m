Return-Path: <linux-arm-msm+bounces-31014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4685E96E2EB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 21:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCA2F1F258A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 19:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF8517BEDB;
	Thu,  5 Sep 2024 19:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bp+KKEI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E9C17741;
	Thu,  5 Sep 2024 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725563735; cv=none; b=n7G+tujIBzGtyXY+3c8YPmHQMCn0tj37El6tqrpsKJb+h8LjzPoZTNly+XabptjRUJvlspA7T3kfaj75MBu3HaxLCIuKw6mqSvR3SDgabuBCTAF4yGNB8dWELdyKjTseU/wBuPw8m8+PZCf28C9/6UajgQ3EgsMr5dvfo29ZgSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725563735; c=relaxed/simple;
	bh=I813gtRbFq5MQRXopmejuBK56WBN7maY0+nSUenwQbM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K+vZ3mOsTGPaQ0mRWmzASWKvFkleH/qkRyFxB+rgGLLQVrkFnsgr7aDw9YHsNG3B8G0NL/QmNkqOBg5MA+Fd8x3z4v8R5oBAzUYercvU9aVoJ89rupnBunLT/6fOAzh11sGmYv7kY0Ol8OgccJEL+xCKk8TyBKwZ347/0XD2tXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bp+KKEI0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IPhCA020859;
	Thu, 5 Sep 2024 19:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yl1QShcxvM9wsCi6Juzoqh
	D5JlX4AVjfXlDmdE2a5yU=; b=Bp+KKEI0HDFAdwuMobh2TKaCBkJ8vnINflB29G
	Ty9Ll7QrUtVGURd9Ru3M1JrHsklAleWLmqbn5wDYwyIMEN+RTCfwAvg6uF84Q4gP
	eO68+cnbzGQGKvaAFCWzCTXDx8iLqQFvddBPc4MW5bEAE6BK/Eo/7GAM+Ls0J633
	4Oxcn6nYfYMr3JiNDgTDOfVmTuz/A7GZ6HKT3pXOcbcU2rNZ5OFfZhMYMCZu5+S5
	NWFOYIDJwD8D25G1KxD9d620671nPhoyQAkE4ibGJgrkeDPBvD/cOgnazh9IGGt+
	uOzjQtDpENNAyTgzj9fmjBahOAg/QTWGKKBgxuRSSW68oSCw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhws0382-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 19:15:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485JFNgB032163
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 19:15:23 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 12:15:20 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <tglx@linutronix.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3] dt-bindings: interrupt-controller: qcom-pdc: document support for SA8255p
Date: Thu, 5 Sep 2024 12:15:10 -0700
Message-ID: <20240905191510.3775179-1-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wfhJ4Q0nufmZOcJOwb3ReLMkLOO9hngH
X-Proofpoint-GUID: wfhJ4Q0nufmZOcJOwb3ReLMkLOO9hngH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_13,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxlogscore=924 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409050144

Add compatible for pdc interrupt controller representing support on
SA8255p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---

Changes in v3:
	- Removed the patch from original series[1]

Changes in v2:
	- Added Reviewed-by tag

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 985fa10abb99..b1ea08a41bb0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -27,6 +27,7 @@ properties:
     items:
       - enum:
           - qcom,qdu1000-pdc
+          - qcom,sa8255p-pdc
           - qcom,sa8775p-pdc
           - qcom,sc7180-pdc
           - qcom,sc7280-pdc
-- 
2.34.1


