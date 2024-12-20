Return-Path: <linux-arm-msm+bounces-42927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D49F8D03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45D9418883E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B119119994F;
	Fri, 20 Dec 2024 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bFb/sVXQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB23918B464;
	Fri, 20 Dec 2024 07:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734678102; cv=none; b=Y9SuY1Xk6JgOVS8JvKiLTfraNyxHMHjRsJI09RY55sVg96ems9uKnbwCb4pSYcKnESL+cdTsReuIivnJ3xVGPqMHZ+KiKjtIJP5uXrIVy3/aDCW9Uq78vybkGHHlb3UAQCurfsBa71WxrffXxwwrfiOZqmWFNWOOeXXdzh52E+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734678102; c=relaxed/simple;
	bh=Zyk025q1osxf6eadSR4YxVCk37K612GGtF3dUJx8UIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NBOsRV6ByCnmAzUEmiw8fq/MY+Q+JSbaVX7jcXoYo0Uq363uhnEg81gCe+CIWT735BHQ5KdnAY5lEEoFzenf9LGDSxhxHvKNSgsDKBNUIdlDzEJ/LeZ5pX12R+Q0+uT8+wHeVcCtA8XakAbqjml5SAT6UEUTZSySH3leEOoQc2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bFb/sVXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK6nJMO004127;
	Fri, 20 Dec 2024 07:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEkwrbgTyC0pD7FMFU1ma/BfXWRgZgXGEoYnKDNyJFA=; b=bFb/sVXQN+VfHF2g
	kZgbwHA6fetQ1HZldYSXzllMydKYmAHau52Ra1NjwdpGlIw4IMp6/3F9gG4BUNvr
	gP/jb98CcRbaedKeQntUcJzyvgdJjPsjhYIe4qt0pIDxO/bkuWl78rpM3Cr9GL9S
	+SR/0vZN4fV8I+vNydHHpxJh1QnQmklmbgx/Ecygu7ay5obkBGiUX2szE97TWPUg
	mR0uGX8evNSow+G0jHSmvASM7Se0JLX3sMErIthgkalMqmgjDHcQG9Tx3AgSMp66
	ji8vT0G5tsOQVJk4dvVIm3Tf3b0Q92PssLblBrBjC6wceCI18A84fjkI/EWaRxo1
	+nAYXw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n3my0101-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:01:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK71Mu6021779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:01:22 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 23:01:18 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_mmanikan@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: ipq5332: update TRNG compatible
Date: Fri, 20 Dec 2024 12:30:36 +0530
Message-ID: <20241220070036.3434658-5-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
References: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
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
X-Proofpoint-GUID: lUDrey1Cu21PbgmcogZzm6ikujsSbF_o
X-Proofpoint-ORIG-GUID: lUDrey1Cu21PbgmcogZzm6ikujsSbF_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=949
 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200058

RNG hardware versions greater than 3.0 are Truly Random Number
Generators (TRNG). In IPQ5332, the RNGblock is a TRNG.

This patch corrects the compatible property which correctly describes
the hardware without making any functional changes

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

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


