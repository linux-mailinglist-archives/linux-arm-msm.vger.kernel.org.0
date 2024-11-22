Return-Path: <linux-arm-msm+bounces-38776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4487A9D5A23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5BC21F21337
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A3D172BCE;
	Fri, 22 Nov 2024 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RPNdS20R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D1513AA38;
	Fri, 22 Nov 2024 07:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261462; cv=none; b=bRrE2m8Eee2z5P8XAQFsgS3VVQaCRk9OOIbTnyR4O7vX3QQ0Dfauz7wDmVqC8nYhFH/A2VWylPQBhAVl8z8r9APf18NIVtCpue7ACDrProqv5J69mg9YaMjkVku4aj0anF5okUwKCMeWmEtSwffZ4mmicpSqTayTkqM4M5LfGts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261462; c=relaxed/simple;
	bh=bdWnhDVGnXdGm2E6QLfNnASfWPjEMbx2RpXDmdCGLxY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SW0yc9+eaHWcOuuQEjAiD5J7WsWS8NwG1Zj9TNVOEc2JTObk+rU3f1ruqJMTfeqPkgYUKFwYmt4sToeXtL7OL1pfQUleFTjh7GM7jvlmIxkSjXhQrhqx9hLALjLq0eJ1PEUw5qUrZO/aCum5yY5KW2INsx7tbt4Fzq4fmvVM3FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RPNdS20R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM0d34H004520;
	Fri, 22 Nov 2024 07:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCCAuMluOYsDYfcKJoa6kUG59ya1M0Ihu5AHWo0H7NA=; b=RPNdS20RzoPfCdh0
	Tg5cDAbkmP3MmMdHbftgqqqEXw8t0BCkcO9Hrvh7Kjrum5wgtZW82bflN90XQ607
	yzvKSToigKqSFpvwRQLiREiaXLXyFIx0JbfhzxmRjlnNJABharMwCj/H0yCDS0yV
	pDfINl8kRba0mBZFRJc3o5oXFgA7dv4PpcFTfsRMjCV1Jt73EpUozZnjqz9f/OQI
	KHkjYSb9YEdHFcL8hp7s0LxzXQ9xrDqS2yiLB346wb/yRZ7EnpvP9rFZexlqHGuT
	0NSfZXcNNBOKO433q28sKYDfShWbxbiCTXBkn9uiOTaQIpMRO8xuDtqKmmnr+SCd
	lUvT5Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea765sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:44:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM7iFj2005015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:44:15 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 21 Nov 2024 23:44:11 -0800
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
        <quic_yrangana@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V4 2/2] arm64: dts: qcom: qcs8300: add TRNG node
Date: Fri, 22 Nov 2024 13:13:46 +0530
Message-ID: <20241122074346.4084606-3-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122074346.4084606-1-quic_yrangana@quicinc.com>
References: <20241122074346.4084606-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-GUID: Zt3cUjwYzDyI2rnl2tFDvOZEU_VCYYFV
X-Proofpoint-ORIG-GUID: Zt3cUjwYzDyI2rnl2tFDvOZEU_VCYYFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=912
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220063

The qcs8300 SoC has a True Random Number Generator, add the node with
the correct compatible set.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzk+dt@kernel.org>
Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..a95baa432872 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -588,6 +588,11 @@ &clk_virt SLAVE_QUP_CORE_0 0>,
 			};
 		};
 
+		rng@10d2000 {
+			compatible = "qcom,qcs8300-trng", "qcom,trng";
+			reg = <0x0 0x010d2000 0x0 0x1000>;
+		};
+
 		config_noc: interconnect@14c0000 {
 			compatible = "qcom,qcs8300-config-noc";
 			reg = <0x0 0x014c0000 0x0 0x13080>;
-- 
2.34.1


