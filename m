Return-Path: <linux-arm-msm+bounces-39051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807D49D7BAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 07:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46BB52822B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 06:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34A8143888;
	Mon, 25 Nov 2024 06:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HBsK5qwj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4291E517;
	Mon, 25 Nov 2024 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732517339; cv=none; b=ZXxNSef8mrG9f4g9y0w4ht7nb5G7wvFoWXpS8FjmMnngNTEhmemewz8qn04tM1q/NYLQFWJmuhBTpStS8OtpILuRfjpjtvym/gPk8Ym5K13lCItQ/GRN5AJnZ65T23BKnjnkaOVIp5GpHg5IMvk6m5rMqmCoH6WhgI+DkPuQCC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732517339; c=relaxed/simple;
	bh=BrsW610ZSTw7jovwFRrsZk33PhJk6qC8hmIWzSL2wuU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QOT66+JibfVQ+y47hU0qcPPgMl4dF25SfThADUPVPEQRch8n8eKHFRemef3YAW3+Ll+/5Vlzy7kZC6J4pRoP5Lvxy8ceOOpGhVQXn9TKrsawXJeQV+8ru/ZrIc6G2GQa/KMckyUgI6PNB4LAa2SP2PJfPfVJcC7Xfa9jBOg7FE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HBsK5qwj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOLGpnn007530;
	Mon, 25 Nov 2024 06:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSHCmIhXylkg9lJ6f3hi/oyz1tOig2WV77FB2wf1jeM=; b=HBsK5qwjnkqnwVIe
	9zqmCSAIw9qEC4p9hUVLVLi5gIp9ds0VB0i9QyZ729BqXJQ29KjnmWioMusjy+oH
	jMKQOpkKoAw+rsloxq6f79Yu/HgS1ieOb+JVb1vmTIfW6YuMVd2DkgapxeRirI30
	FufnV9gpmbgje16LCm6iC9kC618eqJTZ5oiGLzu/BT8fHCwAbOw4lWUCchhBEwsa
	t5eb9ca1fexaoQG4q5MUNCWsizKmZEu22qC16c4Q/zYXfXBeD3NrsbTTx6Hk/SI3
	xPl0HCiro2W2il+5NSKnWNHDsLbQIWZXUhtxF1xUhzKeADLYvhasW028o5msfssV
	rMUKLA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433dny313g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:43:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP6hosq021717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:43:50 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 22:43:47 -0800
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
        <quic_yrangana@quicinc.com>
Subject: [PATCH V5 2/2] arm64: dts: qcom: qcs8300: add TRNG node
Date: Mon, 25 Nov 2024 12:13:17 +0530
Message-ID: <20241125064317.1748451-3-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125064317.1748451-1-quic_yrangana@quicinc.com>
References: <20241125064317.1748451-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-GUID: 8GaN-0JyY5sHKv5sosvCHIIsyUJi7xiR
X-Proofpoint-ORIG-GUID: 8GaN-0JyY5sHKv5sosvCHIIsyUJi7xiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=888 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250055

The qcs8300 SoC has a True Random Number Generator, add the node with
the correct compatible set.

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..39c0c6b8516d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -588,6 +588,11 @@ &clk_virt SLAVE_QUP_CORE_0 0>,
 			};
 		};
 
+		rng: rng@10d2000 {
+			compatible = "qcom,qcs8300-trng", "qcom,trng";
+			reg = <0x0 0x010d2000 0x0 0x1000>;
+		};
+
 		config_noc: interconnect@14c0000 {
 			compatible = "qcom,qcs8300-config-noc";
 			reg = <0x0 0x014c0000 0x0 0x13080>;
-- 
2.34.1


