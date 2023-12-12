Return-Path: <linux-arm-msm+bounces-4413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7CA80EDB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 14:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04A811F21706
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 13:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F8161FDD;
	Tue, 12 Dec 2023 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="emsTTHWi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC89BAB;
	Tue, 12 Dec 2023 05:33:28 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BCBq4Ij029727;
	Tue, 12 Dec 2023 13:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=IOo6RE0Q9jieIhGNqctiHVCldIsGGrGuVvf9yOXOLS8=; b=em
	sTTHWinlOv/+6udR1f36kYDoKYF6r8TwR49v3nPVR9s24eIry5j4FvBwR0e9ZlM1
	sr+FBSh3kxu2ATtQ2lehYYM/CsZua8l/HKTTZj1v1lk9sWKylGRv3L41+RRetflU
	S5w0G/RN+Feu7r8dO92VUk+aC1zvfpSWqGiwVmGGdXu0NZdia0akt9TgvI8OPmA7
	+z0HZ07QLAgLSNGc8b6kII1/aOqHsRs39tzj6et+5dCKbnRNYMkIDsru4nko53St
	+0CNMaZMgwhSnfzhpc8Q9xBwjQGgm1ecsDGAI+TqgJp+crp5dqEINQnTZL2634mg
	e/oPtygZT7PdaynOaEVg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxepkhc1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 13:33:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCDXIYI029759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 13:33:18 GMT
Received: from hu-omprsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Dec 2023 05:33:13 -0800
From: Om Prakash Singh <quic_omprsing@quicinc.com>
To: <quic_omprsing@quicinc.com>
CC: <neil.armstrong@linaro.org>, <konrad.dybcio@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>, <conor+dt@kernel.org>,
        <davem@davemloft.net>, <devicetree@vger.kernel.org>,
        <herbert@gondor.apana.org.au>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <marijn.suijten@somainline.org>,
        <robh+dt@kernel.org>, <vkoul@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 1/2] dt-bindings: crypto: qcom-qce: document the SC7280 crypto engine
Date: Tue, 12 Dec 2023 19:02:46 +0530
Message-ID: <20231212133247.1366698-2-quic_omprsing@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212133247.1366698-1-quic_omprsing@quicinc.com>
References: <20231212133247.1366698-1-quic_omprsing@quicinc.com>
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
X-Proofpoint-GUID: UJFKa9vLh-04fJyR0k5q_ZiQbhKCnshv
X-Proofpoint-ORIG-GUID: UJFKa9vLh-04fJyR0k5q_ZiQbhKCnshv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=913 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120104

Document the crypto engine on the SM7280 Platform.

Signed-off-by: Om Prakash Singh <quic_omprsing@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in V2:
	No change in this patch

 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index eeb8a956d7cb..1797699cf454 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -44,6 +44,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sc7280-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
               - qcom,sm8450-qce
-- 
2.25.1


