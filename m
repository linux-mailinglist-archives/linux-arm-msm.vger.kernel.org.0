Return-Path: <linux-arm-msm+bounces-44915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E60A0C374
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E39F7A372E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5961D1F943A;
	Mon, 13 Jan 2025 21:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pg6bL3iB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CC51DE4D5;
	Mon, 13 Jan 2025 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803003; cv=none; b=JmBoAfG1uhX8ioNrEkzetrYarNsDsC+RpPfuQKM8wadrEHg9rhk+GOyO6MI+aKI1+RqDYGhHYQUGJhlYkjorbbN7r9Pe1qAoJQqv4aY8oydjdv7+/15Pyfm2mPBMfKEYaeAVJ7+ArVYu5aMERhQR3Ne+dRTIxep0qMeW1EHVdws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803003; c=relaxed/simple;
	bh=vwotZQuCp4XlEjPdjqTnW3gz6P5gi37hlCjCZ3PDUHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=t6le1c5vgVBh7TuHje8DB5GAuqyPWcwJCmLEMN6AoNB2mgYICP+GjfwlHjsvA59SDSctaX8qs1f/zpnOETQZSp+RzD29nore7xaHMivp/gaphTRmGOFuf5qPK6vZJrzEog0w8kpGeQ98XMu6sv+PE+D57XTCwgrnDT8BhJaq5wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pg6bL3iB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DIj2JL008164;
	Mon, 13 Jan 2025 21:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yNZPIsMlhLLChw8yUxGZj9EplGxp8wAMzaZs77aeCOI=; b=pg6bL3iB28pgnW3B
	C2f3pvOlTgAgLhzfNzAzFEwdRrTuPcIhm/fIepCRaeL+OAgbbaFi1drQALsD3df8
	Mhhpn03NddiKGItzbA06ILw4IR3kEr0rqnDt+o679g6+//5CK6sTm081CkrBekIc
	E5iNcovBX5khrvBkNHDZaz/91TWGcmpQRERPuVysYdvY5OtdjY8IF0gQwlHHfYr1
	O4y4m+OZrMA03Y+/5aWCAMaIbrT03KyeWEfiaHsYKbczVUe40dL+hdvcaP7dSU4G
	Q8lgDOkA3yfg98KWvTap5+9AKF+gZsG1jB7kxjar+QvrbJ/xiGYhTRw7JtvCNnJ8
	x9WLZw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4458cn0ac4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:16:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLGVcm000413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:16:31 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:16:30 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:16:21 -0800
Subject: [PATCH 1/6] dt-bindings: crypto: qcom-qce: Document the SM8750
 crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_crypto_master-v1-1-d8e265729848@quicinc.com>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
In-Reply-To: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "Satya Durga Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736802990; l=872;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=v9Nygg1WDPj+cjbz465lLusvYccztjG9b0eus+CYZWk=;
 b=MB8QZKGfKteRl6BMveSGEyL5cZvNRnUk+orArI+7wMdAp1FGogE7CaxmyttT+/p10yOxSY6ut
 6d0esmHPJaUBb1LJAhnutGwlFDkB6HvP2/7O0Wsqtw8IzybixIQI4JF
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zUbG9QEOf5W0Zr7zUJzAQQugOJyzgzBv
X-Proofpoint-GUID: zUbG9QEOf5W0Zr7zUJzAQQugOJyzgzBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1011 mlxlogscore=975 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130169

From: Gaurav Kashyap <quic_gaurkash@quicinc.com>

Document the crypto engine on the SM8750 Platform.

Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 7f8c0d55f6f5c300c5c5cbfefee03af628d49d7a..3ed56d9d378e38a7ed3f5cd606c4dc20955194f0 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -54,6 +54,7 @@ properties:
               - qcom,sm8450-qce
               - qcom,sm8550-qce
               - qcom,sm8650-qce
+              - qcom,sm8750-qce
           - const: qcom,sm8150-qce
           - const: qcom,qce
 

-- 
2.46.1


