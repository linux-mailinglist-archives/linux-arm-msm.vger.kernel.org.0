Return-Path: <linux-arm-msm+bounces-25650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42B92BB73
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0ED13B21689
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B815715FCE5;
	Tue,  9 Jul 2024 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FqOumSBJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2615015749F;
	Tue,  9 Jul 2024 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720532126; cv=none; b=IjARprZifN/92K1J6HzdmBmm2ATK74LelhDFSZkQ6cFeEsyWADdUpZB9JXOxsZCyqp6DZxht+tP1xAyUEud4i9uyYDarBQShd/rlJ3+iOhJe10x6DQ2iRSMVpcDuAYtbwCZ7v1vD/BioyHPdwtXCEuOS1bS3+Jp6Qg3Yq46GJjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720532126; c=relaxed/simple;
	bh=DU3VRQnrYNqDNAW1kRz+FjafMjZRpBs2Xr3aTHym4Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=uP5ydGjWAj6lXqR+pSzlafOTP/hexgUGtEbu01noNs5xPmKEneVPytj2Tn7+wquH3Wk1FS4mraWDCD2nYrAwQfCdoQSnvWjdPBlS2PeUJX8VFuCGzjHTrSzOobX0InjeN2+Wj5Cnj/zkufGhHxTEZMlh69xWwxfVIRSJbgg81k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FqOumSBJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AF32V003367;
	Tue, 9 Jul 2024 13:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rJHuFR7kdC5Bjk0We68ws0
	8urMZfuY363j5+cZKIEJc=; b=FqOumSBJUMv7GICTS7iSidR1uNIsCJj0i25PZz
	DgZE2qiGDwvuQjvCWuun/3v8bSLTeCkXp34kJXMJNe2Yt3hGgbFKNxLW5TpqNIPg
	8wglncJ/T+Ly4SaBc1J+oNU4mnX/VWUJ7BTAAp1wQM7c0w1ou/CjjOE8Kr+p06kS
	JIPoekePTdEYCsbIjrow2RSWo3e4FgVqbz8FoMrL+Mkd3a7sztLVUbvs3tFhhZHk
	azbhXyOaMT5Mkfx/TOH6dZqsQjUY1lPT23ZbSdU4qpGdu3SZbcyWhZ/sFCEfTM+x
	Fy9joXulxgsnhEIEEl0rVwqyhIIilZ6hzh3oSKUCxcCCo21Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wjn6t2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 13:34:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469DYFd1015308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 13:34:15 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 06:34:10 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 21:34:00 +0800
Subject: [PATCH v2] dt-bindings: crypto: qcom,prng: document QCS9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-document_qcs9100_trng_compatible-v2-1-3a924ee68511@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEc8jWYC/zXNQQqDMBCF4atI1o2MMVbtqvcoIhpHHaiJJlFax
 Ls3Cl1+b/H+nTm0hI49op1Z3MiR0QHiFjE1NnpATl0wEyAk5FDyzqh1Qu3rRbkyAai91UOtzDQ
 3nto38hblvUtB5rKQLNzMFnv6XIlXFTyS88Z+r+KWnOv/PAWRFRnEIskFQMETvqykao966Bv9P
 EFaxaHFquM4fkURvSG8AAAA
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul
	<vkoul@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720532049; l=2396;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=DU3VRQnrYNqDNAW1kRz+FjafMjZRpBs2Xr3aTHym4Rw=;
 b=eoYm9hAAGEpoD5+EdVl0NLpFh5UQ/n9pGZscfw4+/7b8zEkDKOrIFM3LZHAULQ8+yfd6SM1an
 sqzO0T/RdBCBLVvQVXgBLWoJfLkG8dzo8UmhfzTJXWX05Vd+aMIYvxS
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8ZF87UzU--WJ7Fkvlj1LdnXKuL7cHp0o
X-Proofpoint-GUID: 8ZF87UzU--WJ7Fkvlj1LdnXKuL7cHp0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_03,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=946 clxscore=1015
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090087

Document QCS9100 compatible for the True Random Number Generator.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-trng" to describe non-SCMI
based TRNG.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Introduce support for the QCS9100 SoC device tree (DTSI) and the
QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
While the QCS9100 platform is still in the early design stage, the
QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
mounts the QCS9100 SoC instead of the SA8775p SoC.

The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
all the compatible strings will be updated from "SA8775p" to "QCS9100".
The QCS9100 device tree patches will be pushed after all the device tree
bindings and device driver patches are reviewed.

The final dtsi will like:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/

The detailed cover letter reference:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
---
Changes in v2:
  - Split huge patch series into different patch series according to
    subsytems
  - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 89c88004b41b..e97226eb7a50 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,prng-ee  # 8996 and later using EE
       - items:
           - enum:
+              - qcom,qcs9100-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
               - qcom,sm8450-trng

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-document_qcs9100_trng_compatible-be46d3047484

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


