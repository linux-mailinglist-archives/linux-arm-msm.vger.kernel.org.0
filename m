Return-Path: <linux-arm-msm+bounces-39053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51B09D7BC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 07:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BF88B226B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 06:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F54188A0C;
	Mon, 25 Nov 2024 06:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CsFjAHFt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3405188010;
	Mon, 25 Nov 2024 06:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732517911; cv=none; b=t6LKVSJWea1Kk7MYrxoh8yovjH9X5h6c6Sdccu74L+LpiVhJ0aPX4cZWE3OxPNPxw3OvX8aW83WjUn1lfsY5RkOkPwkF1Vjw4OWyYxtMXYVk8FzI1SFLPeWMqPW6Gwb29/jHX5tMwPEXere4ysxwiX9rJh1HJG2NrJm4CH93kus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732517911; c=relaxed/simple;
	bh=CGjYYuV2s8sSIKMGfBw//FLhJifkTYPh4ZjMvvTbehM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGw0RDeuHqCyrjFdrW4UIZEuGLWg/imCUtQOwhCrl0DgOC0pboXHN2AADO0h8/Bh5xvenlDoms6/jFRi4XDpZVQ8yXxLyT1ep1BD81nnrRm7g4XTJeYQw19m+nJz9gmNfmUB9IpFaPqhEyDIh1glna1ZETxLv1TogG1xT1bRvds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CsFjAHFt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMh3IQ027381;
	Mon, 25 Nov 2024 06:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UBwGI14pF4Lr0wGBdlEEGI7R4ni4Zwzi4ps0rdAWK0=; b=CsFjAHFt8uRcyfWq
	olxp0kzsTu3uzRed/Vg8ZVU6SPZtf0uNqMMvouHU/cRCd9G2Sxvb5evPNA858IjO
	eb6OUzefJ0E4ohFuzNh1gUmmC3Tw58qs6jpd+/IgSCrYZfK3JC2PpnBtI38da1/Q
	QLrHKVxkkVm4f1EX9tskT+Yz+jS8adPTEh34n3JjCMaK65LRPjFNcTm8hnmyQOtP
	Vh7TAlfhZ+332ILRPdKWNqLSSwiZT3yEXRZeS5K4im/t0oyJ8AWk3xUg33YauLot
	Gi4JIV9x9qgPzZY81v3qBHlnWLTWTjUQR8MpipBQvFFYYMHSYV2VXGzuLkvx+ww1
	hCioBw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334dmuwwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:58:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP6wNhc020132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:58:23 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 22:58:19 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>
Subject: [PATCH V3 1/2] dt-bindings: crypto: ice: document the qcs8300 inline crypto engine
Date: Mon, 25 Nov 2024 12:28:00 +0530
Message-ID: <20241125065801.1751256-2-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125065801.1751256-1-quic_yrangana@quicinc.com>
References: <20241125065801.1751256-1-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UpWl9nZ3bQF3eVydHLZKGvFo751L7u2V
X-Proofpoint-ORIG-GUID: UpWl9nZ3bQF3eVydHLZKGvFo751L7u2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250058

Add the compatible string for QCom ICE on qcs8300 SoCs.

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 0304f074cf08..657693867ddf 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
-- 
2.34.1


