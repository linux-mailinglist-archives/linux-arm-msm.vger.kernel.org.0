Return-Path: <linux-arm-msm+bounces-37710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C23A9C6737
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 03:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48764B252B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 02:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE4B13D298;
	Wed, 13 Nov 2024 02:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lr8BDLr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A1D13C90A;
	Wed, 13 Nov 2024 02:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731464336; cv=none; b=P+GQD7rlsV59cQx/HqZlmvZ7St4PWWqHRSsk0jcynS+mDfEEBb9TjvjDr4Ex0Q7rTrBDgJHDEVgd4u35GARPsZzZEi1JgPhOKukURhjgCT1kOa7X4DiJYSi4cDuNU/1FEQ30DjbHr3a7RtJw6Q0vsXW+EqXld/5Le/PFi8AxxHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731464336; c=relaxed/simple;
	bh=Dm6mRQzD0qPWnY895p6MGxpmL6LblV4JIkCqyk6443w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETOUEXtVjSUUbE1qsywh/70TgVwAHcIK+XvzMJ7DKI3ctGcnSyOiuuJQ+bLKPTiBIcVYs7jYoHMJpisjprF045i0TlDsd4yHb1Xd8klBZYKeXgvC0cZMA8LT/2zEHjanwFBXi4vkX67QeiHYpobkp7Bp61YuehI68khPvOMG0r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lr8BDLr9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRTKg019579;
	Wed, 13 Nov 2024 02:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+58h8CFuBb03Di0DznnG4kQJwbxsWScIaiF7JzCwUw=; b=lr8BDLr9qOaT85+P
	iyp25Z8xkoMoYv+qz6smJPDjEpR3Qq3N+HK/pwSI6O/RDVp5OG2Nggaz5R65cm6H
	ABbUkbLNj+6y0kajOzzUAK0XeBFpvBoDK6KmLyP6jN+5UDJRoi1Q7rne/3FfRXpN
	k36XzMwzVIHC7pkP4UqQP8uKDlLiO/34tI8K7sEvAqGgC1xx1R1vrsg5PKh6fsPN
	Q/qCPbAuPwJFZYlhGdcaVS6/G4QnLZaP0uRmn+c6WQTHWfnCq9/vh0ecTujIW7r2
	SxElOLwrZdlvkgqCP61fyrSUs5aYfy6spgT79DwWJSOpIL7Zg3dOJCJPuNJ+7Y2n
	ClPuqQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1h6jxrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 02:18:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD2ImTH027432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 02:18:48 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 18:18:44 -0800
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
Subject: [PATCH V3 2/2] arm64: dts: qcom: qcs8300: add TRNG node
Date: Wed, 13 Nov 2024 07:48:19 +0530
Message-ID: <20241113021819.2616961-3-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113021819.2616961-1-quic_yrangana@quicinc.com>
References: <20241113021819.2616961-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-ORIG-GUID: knW3vd8on5yWEJ_dhgmrnB7W3jXnGr-F
X-Proofpoint-GUID: knW3vd8on5yWEJ_dhgmrnB7W3jXnGr-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=922
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130018

The qcs8300 SoC has a True Random Number Generator, add the node with
the correct compatible set.

Reviewed-by: Krzysztof Kozlowski <krzk+dt@kernel.org>
Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..2a3862568da2 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -588,6 +588,11 @@ &clk_virt SLAVE_QUP_CORE_0 0>,
 			};
 		};
 
+		rng@10d2000 {
+			compatible = "qcom,qcs8300-trng", "qcom,trng";
+			reg = <0 0x010d2000 0 0x1000>;
+		};
+
 		config_noc: interconnect@14c0000 {
 			compatible = "qcom,qcs8300-config-noc";
 			reg = <0x0 0x014c0000 0x0 0x13080>;
-- 
2.34.1


