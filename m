Return-Path: <linux-arm-msm+bounces-25646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF4A92BAB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF40028DCFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B30A1586DB;
	Tue,  9 Jul 2024 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U1zkWpKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A830382;
	Tue,  9 Jul 2024 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530573; cv=none; b=USWDiM/qyeKSfvAGk6yWWsyc1vsOVnnkzOksBfEe3vcBuvYteJvIXjBQwPJOOE+AJMJSW0GzqgFYdWpsG3WKqmTC/Ga79zMQhjVYmEboolNC1yZUMxlT+gnk2WObf4yKvDamToPzf9LJz8P+2nxM+2u8HKCzxNlD3Dez5vGwmqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530573; c=relaxed/simple;
	bh=3Z7C/k1/OCInJr3E0eRERpLS8eMXVKBjkm5IMZj13QE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=OKZ1PKM80vjizj96KYqeo44bfZcuUg+NiQFTOiODkQdXRkv1rK+SDHY5keRdYNNGR30+DM9xml2viXdo9eOQYiXjv2esyWZpoeXKd9ckwHgL8nkb2YqBd34kbj/Gl0dhRdxaO2VxsvKnk5YM3NrEF6UAK6UaKJ0tZshrP2YYh6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U1zkWpKf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4698HAkd026705;
	Tue, 9 Jul 2024 13:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MJluPvsOPAnlDo8aYbkYhi
	dD7T6wP/LREsgsBkHtyeE=; b=U1zkWpKfm0efOWrsto6/6UPVitYWhVJNJSw3J4
	+5gZrLK+shQXAnECUoIcUu25uIHWDYkKhIref9LwImzD7fXex0Iu/yao1YjxJT6W
	IJrQf4FkuQ9SRO98SsvFIyPs4WUXOgcw0AlB2/sViLxw1rd8JdaRX3Wo9UVhiwQv
	3eRb6uVRFwfyx9gBywt2CiJ2N8EKsN8R3uIZt1qzC1rD2ZAoB7Z++Q3YVeBi72Ul
	AIzNM9eVHnbOAqAV3J1PUUgwkGiR8MBLjIy6dbAVoQD7Hlznr+XhXsf1pFYqG2dh
	8mqLbtvGFKea2skjsF3X3d3QvoZGf5bINKjY34Wi5skbcGaw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4091jdgrd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 13:08:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469D8OBF015271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 13:08:24 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 06:08:18 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 21:08:07 +0800
Subject: [PATCH v2] dt-bindings: crypto: ice: Document QCS9100 inline
 crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-documnet_qcs9100_crypto_engine_compatible-v2-1-59bd16b1a99c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADY2jWYC/zXNQQ6DIBCF4as0rIsZaanaVe/RGKI46iQVFNDUG
 O9eNOnyf4v3bcyjI/TsedmYw4U8WRNDXC9M95XpkFMTmwkQd8ig4I3V82AwqEn7IgVQ2q1jsAp
 NRwaVtsNYBao/yFE2KBr5qHVVsPg3Omzpe1rvMnZPPli3nvSSHutfuYGQuYREpJkAyHnKp5m0C
 tFoK/M6goxOosXKfd9/iuQmC8UAAAA=
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Tengfei Fan <quic_tengfan@quicinc.com>,
        Maria Yu
	<quic_aiquny@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720530498; l=2633;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=3Z7C/k1/OCInJr3E0eRERpLS8eMXVKBjkm5IMZj13QE=;
 b=tdxgb2nzo0CUI6WZQMGePXlr8dQXrZTL9IQKfE6mANIC5ixZs8mSFm3bbMwLFD5sWBgGOcfi2
 bM7et+6Iv3ZCK38LfFgvGp0emK522kNY13SELvPgLKSkAybI9osY1CU
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3h1GkmC6XB48gAEHaAc5xCyz7CmJ_vdi
X-Proofpoint-ORIG-GUID: 3h1GkmC6XB48gAEHaAc5xCyz7CmJ_vdi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_02,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=946
 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090083

Document the compatible used for the inline crypto engine found on
QCS9100.

QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-inline-crypto-engine" to
describe non-SCMI based crypto engine.

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

Co-developed-by: Maria Yu <quic_aiquny@quicinc.com>
Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
---
Changes in v2:
   - Split huge patch series into different patch series according to
     subsytems
   - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/1b32168b-7d1c-4b18-b4f3-a4979232b515@quicinc.com
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 0304f074cf08..ad0944e05025 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs9100-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-documnet_qcs9100_crypto_engine_compatible-e5de2d56bca9

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


