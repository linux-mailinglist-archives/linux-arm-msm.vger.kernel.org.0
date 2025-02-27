Return-Path: <linux-arm-msm+bounces-49762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C08A489A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 21:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D67CA188B362
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 20:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8900270ED6;
	Thu, 27 Feb 2025 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NrTe7+wk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237E3270EC2;
	Thu, 27 Feb 2025 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740687412; cv=none; b=F91gdpX3/e788cc/I0rYghvD+eon06pEYLyaaUaZNBk13Cl5Vjt2VX2NgNur21VQa8SRQ0lhO0gSjivstStOiZSb/mZfJZBf4dBUtCxXa7XpOIHEUoWdMtqs5tTxFzKfIhf9bHCnc94IvYUXoopUStRR/fvAq2MhgM6wsfZzO3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740687412; c=relaxed/simple;
	bh=u/WBbs8Z9UKHIkogoCWdbAXz2ECojKaS6AJbiEVHGAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rMoTafzxRbZS9rQte2jF8/3FnPMO7MYUPCCzgmNW531Ubo0uMYF1uffEslJ4WCh1ApB7GpL4kc8B9GSaLg9gaqHL8y7zuztfrrOrTvwSL7C2pJ+NZyCDBhRgZRHUNFkKURFO5vXU8P0z4MS7fk5dsz5+7En6zgfpQPifRw3n++Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NrTe7+wk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RIwsfw015555;
	Thu, 27 Feb 2025 20:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PmEAF+IwLh1hi2oj/d9Appoy0Pc9jL/Y6LJg3J0jdnA=; b=NrTe7+wkCpKMpvxi
	yDXHmLdS1pkFoVUpqtH1Pohr1ELp/ClEpOuPLEhNIgGbFXxcUsPzx6rBF6ve3EUG
	sBCaZzstSl3BZWMdmJ8Ydav2Q2EhR8Vgz4yhru/jYXEbekZQyDkMkjWuuVRYPOk/
	bT7D/QxxtDJKC56AFCPTGJSfQ7j8alOPYUdZaof2vnDH3FfGLysnjIRMjbtn3uj2
	IJt85ZOe5UuVPHFrF1rS0lNC01ZF/1gIHFN/jEYNKZgbhaMLCDEZt6gELEPa9aO0
	deLRZKMjBwIP4ONbD9bMBPQOIe4Eh/ACS3MPWJ1VxwLpwkSFJ6FgbRLTzguonODb
	s/eX2g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prnpyqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:16:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RKGgGZ030127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:16:42 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 12:16:38 -0800
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Date: Fri, 28 Feb 2025 01:45:54 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom,prng: document QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250228-enable-trng-for-qcs615-v2-1-017aa858576e@quicinc.com>
References: <20250228-enable-trng-for-qcs615-v2-0-017aa858576e@quicinc.com>
In-Reply-To: <20250228-enable-trng-for-qcs615-v2-0-017aa858576e@quicinc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul
	<vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinaba
 Rakshit" <quic_arakshit@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Xr7w0IIbNVsseAA8VeCBe_W6Iwg4-KMo
X-Proofpoint-ORIG-GUID: Xr7w0IIbNVsseAA8VeCBe_W6Iwg4-KMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=909 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270150

Document QCS615 compatible for True Random Number Generator.

Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 5e6f8b6425454d6440a8653567235380d934cc2c..ed7e16bd11d33c16d0adf02c38419dbaee87ac48 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -20,6 +20,7 @@ properties:
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng
+              - qcom,qcs615-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng

-- 
2.34.1


