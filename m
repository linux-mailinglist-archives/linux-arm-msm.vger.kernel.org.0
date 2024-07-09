Return-Path: <linux-arm-msm+bounces-25689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E232E92BDDF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E5AB1C23B86
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C19A19D088;
	Tue,  9 Jul 2024 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fnUofVaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD4219CCED;
	Tue,  9 Jul 2024 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720537834; cv=none; b=A7gda7wJMNvYcthkXTW6xCc31tW4zJQisYKoy245ToTTggq73Z5eOAYHVTH8Oy80VxQe6BghDzgKc4/yuh71O2ujTeX+8WueIc7DsmWuq/jbFCkWYlutMbk+MHxYSD1vbnADp1ydawFUKLVvt5aa4rk0He9BZYWtmwak+tnyaQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720537834; c=relaxed/simple;
	bh=40EsfG6dOctIYsQS/gAYD4H9kVPjojt2+IzxSOQRyWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=s3BSEBxFyKTx22u9TYz9xs84mKGlC9sX2vKuviqsa7xEKZ1nm8yDhN14jVgZbf4IXYfj0v8Eb6Piw3fAJ9JJFhVlkr/W9G/nqP5EqoZElaJJufqWqX3qgDkVKHesekhq6Tn6/fkZkWK6xuAepv8MftPkkkqdLx1vH9bSwo6rPww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fnUofVaA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AU6tT009333;
	Tue, 9 Jul 2024 15:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	95eR78XQPuMH+Kfnl0TtLW+IkcW02xVHhyfEJgYGKcc=; b=fnUofVaAgue9zl7a
	ok8EKBK/aCtExg0E7f7iAIIp/t26KQcza7QaBfHydxfuZPcWuF3EW5nt+zDAlTKP
	ObyWEfp0mgTB8TxdRM4Auzgo86mHJ/hYsFDWxk+/h1cvdA5JZjuepzcnhKd3eGxq
	TFUXNACBzKwXu3AgeyjcddXnHN4jyPvB8yl5vfFWOXdTrQeXNpF1ja548v+qZFRx
	29sJKKlbQIgMYWZZVd3sMSl5S1mbY33lsSSI2o+s/N7w1kDCQzb/6y7QKafApSbo
	rzv7lzUbgrzWTFcZG1s5/8u7iIb4VQfeGJEdRpPKS1i2vFK6jqgw55CWUMaoLSGw
	MU3b6A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x516yf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:10:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469FASeF006180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 15:10:28 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 08:10:19 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 23:10:07 +0800
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: describe the GPUCC clock
 for QCS9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_gpucc_compatible-v2-1-c206bccc495b@quicinc.com>
References: <20240709-add_qcs9100_gpucc_compatible-v2-0-c206bccc495b@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_gpucc_compatible-v2-0-c206bccc495b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720537816; l=1168;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=40EsfG6dOctIYsQS/gAYD4H9kVPjojt2+IzxSOQRyWc=;
 b=OYSI0+L3P3Qblr6pUAfHM1NoWvx5QL5oFwh89BAa3U6Spkv+FH2tX03u2Ftty/z4j9pAiQvYd
 p34sJTKyov0BOJNVV0j5XQ8Peuq41KjGzilTZ7dyjmRJA3kpZ4HPuxt
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LiIOOKebuOpGJdr43axro_9Iks-a4CjP
X-Proofpoint-ORIG-GUID: LiIOOKebuOpGJdr43axro_9Iks-a4CjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=825 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090099

Add the compatible for the Qualcomm Graphics Clock control module present
on QCS9100 platforms. It matches the generic QCom GPUCC description. Add
device-specific DT bindings defines as well.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-gpucc" to describe non-SCMI
based GPUCC clock.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 0858fd635282..33eb62ec4745 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -27,6 +27,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs9100-gpucc
       - qcom,sdm845-gpucc
       - qcom,sa8775p-gpucc
       - qcom,sc7180-gpucc

-- 
2.25.1


