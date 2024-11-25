Return-Path: <linux-arm-msm+bounces-39084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A909D843D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 12:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 860F328B75E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 11:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456181990CE;
	Mon, 25 Nov 2024 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F3UUQx1W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833C6198A19;
	Mon, 25 Nov 2024 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732533590; cv=none; b=JaBlDavFO1/G7F/9bucMrrFpwXVktfLZ+eXS4rUc7UDV8LMPKy0b65R0SlZNa1P6Rjs0cHHuGjMs7W4z7C+nK0VtIb6tQ0JgwaoeRph3Y77TGNlcK17HaJ4wOaPiLu/jd/3fbX9oFGgDXy5GMvcruEt3svw8GcfsxOWuZCkKuXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732533590; c=relaxed/simple;
	bh=l3hsmKRsV4Ct1jTS7r1A71aOa8ci/H7932FzxRedH3c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KuCZUzKjEYTqq26IqcXE7++p+S1xQPITbPGz+Gqw9fShCgFq9BmqrTjokddH59bneMbXSkpxJrWhjB3F0bPUPTbAOCcKLUj4Ag84BI4ewwvlQrdJRzUm9aZvVGPeaD7v5EIEnHqJ+YiuI5vh4ZMAno+dv4/hWgjal9CIrUjJ2vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F3UUQx1W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APArt95020204;
	Mon, 25 Nov 2024 11:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQE3JoWyUEHzxqv7EgKkRhFv3GHl4oOpjm5aPZSNOxQ=; b=F3UUQx1Wr+U+CD9A
	YQdyIx3PM9jBpbnJYvxEU1kkaBqyz6gLn3OkPmxIxWcjec+/CYyk4QaSNGuURFDn
	XebrIBEv0J/wSSmg31O5kVMbihdZCjqx9irhwMUh8t3c6SMOZ6zMVPq/znkiZhvj
	9d0ygVIzDrT//fiVOA9v/CVHYTu9yva/rrawnyN96lYSzHgs8bkoUsQ3/kabS7xZ
	V6JVTh4amWktB22DzmlkQGiXJfchH8+jb23CujRWv3ZLsdmb5ngrV1fEZDZlGeOU
	D6REawl0IhLlWlhIuek2gjzlqR5pTYZi/N6wX48oYce5K97Z+EQm0h6wGlSm/JQi
	4H5QtA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43387jc9wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 11:19:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APBJge3017969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 11:19:42 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 03:19:37 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
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
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>
Subject: [PATCH V2 1/2] dt-bindings: crypto: qcom-qce: document the QCS8300 crypto engine
Date: Mon, 25 Nov 2024 16:49:22 +0530
Message-ID: <20241125111923.2218374-2-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125111923.2218374-1-quic_yrangana@quicinc.com>
References: <20241125111923.2218374-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gUcCTPBAoA5xOlbF9JXD8We2BfL9UMZp
X-Proofpoint-GUID: gUcCTPBAoA5xOlbF9JXD8We2BfL9UMZp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 impostorscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250097

Document the crypto engine on the QCS8300 Platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index c09be97434ac..9fc82cd08a37 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -44,6 +44,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
               - qcom,sm6350-qce
-- 
2.34.1


