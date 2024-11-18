Return-Path: <linux-arm-msm+bounces-38166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7BA9D0975
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B02DD280F28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 06:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A92149C6F;
	Mon, 18 Nov 2024 06:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mCho3Vt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A2914901B;
	Mon, 18 Nov 2024 06:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731910724; cv=none; b=rMXOg73jyDGBdCHsP92pk4KullEAtrjuGeIpuUzcrNo3/iklYjA6q7KwDX1yZMKIlr/0YjqNWNAmXL+YO+PcqEVTblsVK2U3QYtFL65j/caV7gOc0fDop98RdnhHT7qIFON1zfSjNh+JVf/PwU7KH2Pa3pL3T3OGw464mgaIGMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731910724; c=relaxed/simple;
	bh=/VMItlwpHEXpGvrvqSDfxrRyzHap72Aup3wx/u9EWlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PHOIyz4YkbjJXxFWROUMq74i1wp+aeH1X8vazsh8+Vv0TVksfSt5fE/4zXu03QLURky1/UNNhLMLx0H3bCUPJrIdTGj80M9oAbHcQ3sEv//sKsk1spl14I71b2TBg9C+9F9SlVK+eQm3aUW/4nQGpjNgGixDZhlJP+CG/bwHyPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mCho3Vt/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5S5q4001763;
	Mon, 18 Nov 2024 06:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWVngf7vTOYVex5gEAY9FvR1sif9ZzVGKSEoRQHAYvo=; b=mCho3Vt/5yQc0fP1
	ak0MiCSan+i8qRrw75W0J9TVqz2LWegXxTjhCphRGZvfxN5Lwhk52WRkUpa1N8vT
	lB9+TZu9/wK9gTGCnso0PZeLDHyLCV3WedNqjsA1eGNK2uqmL5SgJ389T1cXJS4X
	wFPWxR33F+64iBPOBFIDMyv9NStTyju71nHmXnsKRfDelDXHtIOqW37zNNKzvbn7
	M8j5QyMTrTeXYRmsvxI0JeXzy2zUnfgqjAZBJqWkKSuqAszTn2ouamNgGIGE5jTs
	x+kDxWk515YO32KY5lnQxI91vxnhu8hpDxOlg++nSvzNwP7kIGj0JqhBfP860Iqe
	58DOVg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ycuf9jdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:18:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI6IJHW015106
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:18:19 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 22:18:12 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Mon, 18 Nov 2024 14:16:50 +0800
Subject: [PATCH 1/3] dt-bindings: net: qcom,ethqos: revise description for
 qcs615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-schema-v1-1-11b7c1583c0c@quicinc.com>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
In-Reply-To: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
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
        <linux-arm-kernel@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_jingyw@quicinc.com>,
        <quic_jsuraj@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731910683; l=1391;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=/VMItlwpHEXpGvrvqSDfxrRyzHap72Aup3wx/u9EWlo=;
 b=fYrVMSRn/6skEZ/FB1RnOmQEbOtVDkIqzjZGXfvVLjW6/d1Q4TtWXFBkijgf14TdePMhcnhoh
 0o4FIU0DEg9BLmRrkEtmcGbco8TKXZ6EJ1GfoKNz8vwKdu8OvN8zdHw
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZypiISRDyohw9aiUCyv4iWE9CHFV2h1N
X-Proofpoint-GUID: ZypiISRDyohw9aiUCyv4iWE9CHFV2h1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxlogscore=958 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180051

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


