Return-Path: <linux-arm-msm+bounces-43172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0EA9FB8E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 04:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95442188524A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 03:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AD1153BF0;
	Tue, 24 Dec 2024 03:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CeS3xqoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A32717996;
	Tue, 24 Dec 2024 03:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735009703; cv=none; b=a/uoKY3DI7SN1ueIkWdZiU6Sf4QEHQ8qydXDhS1c+l244UI8qz9yir9JX4tmSwiUA+bMrdpp3zh3qJY5N8zSnkMdV9qRuQZU8G2MAaU1BCUkGCySyfJ86ks9nWJj9UyZGzIFTWyNjfdO+CcdzzpDkoFHvxaZ6FFQBYs9ZaQHcmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735009703; c=relaxed/simple;
	bh=/VMItlwpHEXpGvrvqSDfxrRyzHap72Aup3wx/u9EWlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=erUiw2lB3skcIvIwvXDdaHRRbH9nLH9j7l+uBF/G2uKpvS5r3rEt3d3E8MOcPy3UCNzK3UBcRH0cWWqQ5kkNDR08i/CsBxS4Mq2hj3FEkocCjGrXJ1j28PDxKumEhNxAL8EuRVY7M3k7RFtBdUtcT6PnFdwF20NMPNEDpGw3MlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CeS3xqoZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO00ZKm016000;
	Tue, 24 Dec 2024 03:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWVngf7vTOYVex5gEAY9FvR1sif9ZzVGKSEoRQHAYvo=; b=CeS3xqoZO7xisTJU
	8BpoldSP9+G6gHMhiEVZQincPue+xzjDkm2YVvPGFoH8ZVLmBUzGhsAj8biAK8on
	MbzYnmInNgEpJgWO/Ffo+u2nrWaxXVcY0ksWxZRgFUYSvdD7VlGEaY8cNA4P3DTQ
	+X4yos6GBKLSRfL4w5IDmqDit4PjeZ1zLgg8wky6+HMuWvcif6SFeZAwJUX5Sg/o
	bVSxlHNAYKW3ngAn5Po/AEduC4x+iw0uwcmAzIEgC2EUNQ/MgtQSrKhH+IPFJcy5
	jgWQBA2k8m9lnJh8741z5+NmrIliR3DEIpZlMBKuwCgaMVHKohYkfbEIGqZJL4DI
	9N1h9w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qj1qrcgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 03:07:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO37klL018486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 03:07:46 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 19:07:40 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Tue, 24 Dec 2024 11:07:01 +0800
Subject: [PATCH v2 1/3] dt-bindings: net: qcom,ethqos: Drop fallback
 compatible for qcom,qcs615-ethqos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241224-schema-v2-1-000ea9044c49@quicinc.com>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
In-Reply-To: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <quic_yijiyang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735009653; l=1391;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=/VMItlwpHEXpGvrvqSDfxrRyzHap72Aup3wx/u9EWlo=;
 b=WZnSvTNz/5y4TEFyzC8f8oCe3pOPFbm4Wku/vTlq8A94CoOpMT/bAg8UeKzdbU0S0clUvXf3C
 dUeanByLkjGD1rU8P9uuC8LtmbGZ+K7s1kqShYRxj8d/l1sQrl4vQuR
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sf0fzc5iOCwdAsL_bnZNBkR7Xyp0bXgu
X-Proofpoint-ORIG-GUID: sf0fzc5iOCwdAsL_bnZNBkR7Xyp0bXgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=952
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240024

The core version of EMAC on qcs615 has minor differences compared to that
on sm8150. During the bring-up routine, the loopback bit needs to be set,
and the Power-On Reset (POR) status of the registers isn't entirely
consistent with sm8150 either.
Therefore, it should be treated as a separate entity rather than a
fallback option.

Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 0bcd593a7bd093d4475908d82585c36dd6b3a284..576a52742ff45d4984388bbc0fcc91fa91bab677 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -23,12 +23,9 @@ properties:
           - enum:
               - qcom,qcs8300-ethqos
           - const: qcom,sa8775p-ethqos
-      - items:
-          - enum:
-              - qcom,qcs615-ethqos
-          - const: qcom,sm8150-ethqos
       - enum:
           - qcom,qcs404-ethqos
+          - qcom,qcs615-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
           - qcom,sm8150-ethqos

-- 
2.34.1


