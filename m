Return-Path: <linux-arm-msm+bounces-37133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1769BE509
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 12:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C5BF1F24829
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 11:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2E91DBB37;
	Wed,  6 Nov 2024 11:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VOcXmTqa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F41D7E4C;
	Wed,  6 Nov 2024 11:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890835; cv=none; b=rBLsy8LJbIzgpscoRWlVQuxPPw9RbXc2HdtSl7vXkTG0BJgKSD76aRe87HqKl7uf6wJeIr7dYXykwVq12zBjboOg/n5vGaiQUnD0wJ3ORNoyArPWG91DmPh1jmfJHEo7Qhbx+7l7yGf6f3GsbhsqWnDnhaezIE1E7CkGi9vrnL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890835; c=relaxed/simple;
	bh=WHO6Fbf0Co5ZuUbgBqbbt54asoPO4yQNGslciR+0aMU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YCr0H68zJAPX5zByoJ1okcC52iLj3z/qMjPD7W8M9sx/hJHlebEHlgfvQDyybT6JJ+QNo28JIoxVF8+ntX+KlTx3fwuIeBGR+rJ5UHSYPwqm6XYQh40r/n82uFL20j2V/oVeczLRIdito/ozItN6J309xrWQnTyM0kkGU5FSyks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VOcXmTqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A663JYd024800;
	Wed, 6 Nov 2024 11:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XZ5kGEBmjfULP5jtE/qgR3t1KVn5Jt5Sd1mWcR9+Fo=; b=VOcXmTqabCWFg3Ii
	MPuarkM2YLoY0MoxX7SdC7AGLiJDqEh+FQ3gPc5m3C8JAngwiXwESJX0XQmGX35B
	wlcuM6FTrc1DE54b7CWr42zA+ZCNCTQBXCCiMw2ifaRFVompY+QaNQLlvAdyLpOK
	Fj+lz6J5Qse3R9ww5Xf+H1vM/GJLSyGkiBR/+CGpgcEUs3Xv8DVbZlF1ZGiN9M70
	WTgSAWcobr/xkbefzcWizMxg/t647LRegsdDbyMopJQJ/RTE/4qov00zzG3WiMPx
	obSQsbqVCebpm4HJfbNK6sQjd4mgPJ1S3PIw2wiQMTcYr5dO0rJFqXRIJUTHHzdn
	0EfB5A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r2ugrrxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 11:00:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6B0QmI011476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 11:00:26 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 03:00:22 -0800
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
        <quic_yrangana@quicinc.com>, <quic_sravank@quicinc.com>
Subject: [PATCH V1 1/2] dt-bindings: crypto: qcom,prng: document QCS8300
Date: Wed, 6 Nov 2024 16:30:01 +0530
Message-ID: <20241106110002.3054839-2-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106110002.3054839-1-quic_yrangana@quicinc.com>
References: <20241106110002.3054839-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-ORIG-GUID: MJc86g3nDtU_9bsd8pEGhmbCKEnq4vNr
X-Proofpoint-GUID: MJc86g3nDtU_9bsd8pEGhmbCKEnq4vNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060089

Document QCS8300 compatible for the True Random Number
Generator.

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


