Return-Path: <linux-arm-msm+bounces-37711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B239C673F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 03:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37C782842A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 02:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51F913D53E;
	Wed, 13 Nov 2024 02:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="THtsBem2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470A113D298;
	Wed, 13 Nov 2024 02:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731464632; cv=none; b=X3kH9OP6Eg3MFRC0B4+34YzG3/V1IevIoIELkNfNKLmvlXvIXKsYPuH+pHkaTjfEEHecv6xsoFqsgr/nVnROpgQaa2VV1NCqbbKGXCj4GF6zmmnAO8zgUerv9SvqzvMFGHx52ly6Kb94zmyrig8FYPVdAxPXvrzvr7/6pZTH/7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731464632; c=relaxed/simple;
	bh=5YALVs6ahiEWhHLASYP3/syi7J/pHnRFo9M5CmdWI/Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7oQJ0wHZNU+8Rz1NsqsUUV5aAUCfuWtHoYgI3wnpnTif6sbUS9o0iCwaGzqraD+jysmxrixgnPIuTFhFTFImTbPYkM3iopRai0XOgRgDbr8tQHYt3CbfppFPWudlTJYw5m89LOaAEP3WnfRo6JpMsTHENTULzAVlnlp/nrI9mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=THtsBem2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRVas009046;
	Wed, 13 Nov 2024 02:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDJGNEp5U479sXUs/TsO1fcx6fyzIcOBUJ4dEUH53WE=; b=THtsBem2VnFmRfVj
	vE7C/TSbCiTDhME8D+8d0shiE1iBxPPRRhODCT3udTv0hw6Gt9kB7f2emGrPNz19
	KcDSwP9LV/yxjXBFgv0sZQeTY0Dw7EBA5dtg1IkW9cHYz2uuFnj4H1jx2i7sbYEy
	OJ4d87TjFr6mO/PMdlxuyQbVqhfeoENSTvimnKtjWKDyWPK09ZIWLJLgbHGMEzh5
	zP8miRxL7ZIFUAOPtvU2TcR3qLU3jVS9Q8es6LqrVV5EuoO9ik7Oy6RRXa7zproi
	XR32Q0sc5umaQdk5jCn7fh2Y2nDcRPzaLzhAkQSikRjsrc8/QOzU890u6r1m+mlR
	sCSYfg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uwt5kcqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 02:18:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD2Ih0Q026580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 02:18:44 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 18:18:39 -0800
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
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul
	<vkoul@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V3 1/2] dt-bindings: crypto: qcom,prng: document QCS8300
Date: Wed, 13 Nov 2024 07:48:18 +0530
Message-ID: <20241113021819.2616961-2-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113021819.2616961-1-quic_yrangana@quicinc.com>
References: <20241113021819.2616961-1-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4hAgTCWW3KBpaYelrSzfv3WSIcfxUQus
X-Proofpoint-ORIG-GUID: 4hAgTCWW3KBpaYelrSzfv3WSIcfxUQus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=996
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130018

Document QCS8300 compatible for the True Random Number
Generator.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 048b769a73c0..2c959162e428 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,prng-ee  # 8996 and later using EE
       - items:
           - enum:
+              - qcom,qcs8300-trng
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
-- 
2.34.1


