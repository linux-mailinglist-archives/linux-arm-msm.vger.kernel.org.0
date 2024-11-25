Return-Path: <linux-arm-msm+bounces-39050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 308E39D7BA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 07:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9B70282291
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 06:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6C8186E26;
	Mon, 25 Nov 2024 06:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hnq8TkFz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806DA183CC2;
	Mon, 25 Nov 2024 06:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732517037; cv=none; b=qf0T3wLBxqtRaX441HkY4D9RsRo5exD6Ja82l9gdSqaZioI1ppuQ+yKSEdkWPGRsiXwR5XcaQT1frezO0449Ye8BkJ7f9Ih/hFAOtgvWFg99i2sgyEN8Ffm9kVcr/t0yY5ZQSo90iBYdnROP7KFVvkrzhOP9yFZMUmlyJNcLt8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732517037; c=relaxed/simple;
	bh=5YALVs6ahiEWhHLASYP3/syi7J/pHnRFo9M5CmdWI/Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuChdd89FBe5NHU89FPMfyg+nPxmS5k72Tdc+kXwdhqXaOYPeRpnnuBADxCFdw9IkLdZXSpDAoDoUc1wuIkcTdo/VkoDfcDdN4nme8MK0KDpDn9xXSXP1y9nLRSUsJ786LtN4t7Xbt+sKY7tQcpcBeL7Y3bY+JXViZzE5pg25sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hnq8TkFz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AONxcip016714;
	Mon, 25 Nov 2024 06:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDJGNEp5U479sXUs/TsO1fcx6fyzIcOBUJ4dEUH53WE=; b=hnq8TkFz0RuN3e3n
	ANbkWqxr04/Nn6aSGFvd/v0O4SyuiSLTpYtpjeJ4pb/vQK67l3L5rPEXS00OwuHs
	tJ1PoxTfOs/miBFDy6XHSyGIv+UhAdGUsHLLyxxYsSHyrFEoHbelFPm1+Lp69iLg
	gnkIjK+kGoJpBdaNrnoIYqD7/z17jlOxJ14MstcnTdNaf4BuJ2mcokqnt+VnFOfh
	BxuxfdbQmQufl+gA88a6ArGWvc60c3sMB0YpRjwXEiPZC6h7qH+4WeEalPmNUwxL
	JhW2MOi1uX0DbahONGg663xtrlgeGl4wSreW+rNJiI0/ni1Pe8tJrMPR+SMrbpvY
	7PHW9g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4337e6um0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:43:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP6hkmo010204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:43:46 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 22:43:42 -0800
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
Subject: [PATCH V5 1/2] dt-bindings: crypto: qcom,prng: document QCS8300
Date: Mon, 25 Nov 2024 12:13:16 +0530
Message-ID: <20241125064317.1748451-2-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125064317.1748451-1-quic_yrangana@quicinc.com>
References: <20241125064317.1748451-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-GUID: pDKQfEFt6mKE85SgViG-nYUOiUqtUpj4
X-Proofpoint-ORIG-GUID: pDKQfEFt6mKE85SgViG-nYUOiUqtUpj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=983 adultscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250055

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


