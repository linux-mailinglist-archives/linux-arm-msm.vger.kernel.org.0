Return-Path: <linux-arm-msm+bounces-43365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D19FCAB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 12:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F00C160633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 11:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A751D5173;
	Thu, 26 Dec 2024 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K5InQDV7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035931D278A;
	Thu, 26 Dec 2024 11:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735213549; cv=none; b=NKgQBk7kY8C3hZPowudlK1GI7jH/l/n0CGllYl56akFa1rP1caRfm3mKXw4m1jyETGBOouwwNyYWQMog5dhjyRnOcI4peGZ8anQY8chdYkSJnavQDRAFcl8+Dlf4iKc87hG69T6HNeGnlm/yBnfOzyBsF9ITgjg+axPARidxZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735213549; c=relaxed/simple;
	bh=xxbDau5dh7L1YdX3pSUREw3PMLaszhChP6TlltWlKsU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rTY8n5fvbVnsjQ0+Ac03kjkg54k7mrCyZAUMJiYMSkrKTgNzYa7ypXoBoD+GGNbG60IdsIlyR4YMI3O1gzm8hboO0i5+7gq3hQ7ZUaWFuY5WW5H9oSCGBf79DFDmu7hSFMHIVaHlTonabpW8+H3bT+TKCw3sQICiNa4MZvUEvV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K5InQDV7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ6tqAu005080;
	Thu, 26 Dec 2024 11:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nDGN0EW69mGcSOPiGASnqdqVBmzEsc3rT4UMF5UWoU=; b=K5InQDV7ap0VPT5Z
	PROQ4i79Yd2tdls+m60YQWQy9H1lE9ZJn1cEs3pjy4p4OvTqYVvjjLk0EECZMyoY
	jk1YP5mWEwgICmoQccrZhhVURjGfyK5tHZsnxxfwinCdlf0zn8ztHcBAl02/Rah0
	4K4UXNAU+pJmuADPCCCZUoUjsjK6IEweowhqVpEDQF1Ndoq9ebXYtR05Z8qd6oAd
	td5hACidLCDS0ACowNEUbsZkB0QwoqJYXkSbRnT4DnsKrteE38qccgcJQiA49jBf
	2RCmmA2W3dLUeY2QUPpyBXahQWju0nfB+kUIh8+Gt/2QBtgHivkIWyTLhJegICF6
	WiXFwQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s2a8t58f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 11:45:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQBjeUB005369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 11:45:40 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 03:45:35 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <vkoul@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>, <quic_mmanikan@quicinc.com>
Subject: [PATCH v3 4/4] arm64: dts: qcom: ipq5332: update TRNG compatible
Date: Thu, 26 Dec 2024 17:15:00 +0530
Message-ID: <20241226114500.2623804-5-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226114500.2623804-1-quic_mdalam@quicinc.com>
References: <20241226114500.2623804-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yVvSjOryRbHzeiplnbSAq9LE2nsbdA3W
X-Proofpoint-ORIG-GUID: yVvSjOryRbHzeiplnbSAq9LE2nsbdA3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=964 clxscore=1015 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260104

RNG hardware versions greater than 3.0 are Truly Random Number
Generators (TRNG). In IPQ5332, the RNGblock is a TRNG.

This patch corrects the compatible property which correctly describes
the hardware without making any functional changes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v3]

* Included Reviewed-by tag

Change in [v2]

* Revised the commit message
* updated compatible string

Change in [v1]

* Submitted initial patche to activate TRNG

 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index d3c3e215a15c..ca3da95730bd 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -180,7 +180,7 @@ cpu_speed_bin: cpu-speed-bin@1d {
 		};
 
 		rng: rng@e3000 {
-			compatible = "qcom,prng-ee";
+			compatible = "qcom,ipq5332-trng", "qcom,trng";
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";
-- 
2.34.1


