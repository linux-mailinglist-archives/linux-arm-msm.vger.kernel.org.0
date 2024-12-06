Return-Path: <linux-arm-msm+bounces-40712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D59E67E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 08:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50F7B1886345
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 07:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4549D1DE8AC;
	Fri,  6 Dec 2024 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HC3Fb6jK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52AC1DE4FE;
	Fri,  6 Dec 2024 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733469693; cv=none; b=FanpbYihWMcqFfQH16dj8g67dfQMw4rAj1XdBIDL+p4oyuZfXv65/ZHXIkq5E7IfcOYyIZgYpw/59jkbzzLeJfRh+B3Rrueae7bywRCoXXtfiyCuZj0t7Iu95FD0rJ/uCi95ML41XT/wEkMcjeBC0Yicc7ciiKv9etKBEHGBnAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733469693; c=relaxed/simple;
	bh=f/xTmHkXK+mD7pRVI+xzkPsb/JB65LZQdhXEW2ZP3MQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GB1JW1rKsLgkHpVrjC2yXQLv7S/gAT3ZaRcfkcG20fl7TSBG3rSz9fNVWHk8wNUfQQvjPujYLM4UZM9EAxuzc4Iy9usyw9sMSMibg0VRkUwMH8afwvFJPBbuXGIhH+nI2Rw4DpTfnu82YRI6o9BBNCxVTJB+68ldcp7j0BmETXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HC3Fb6jK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B64aack003107;
	Fri, 6 Dec 2024 07:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQP9+L9U4j1jCtFuPBHQ9QNcIpU0ot462RVp+Vo5H7Y=; b=HC3Fb6jKZuBtjWXo
	SirsqUniM3rPQ4M3NMgujrAXgTD5Et20IvTc63elVbN7dIfI1cjyLReB5+lqn9aX
	No0bHvaeosDef+iYl8X2jKhPstZ3mIi0E95o+2+vb9e0JBG/UYYR2doIsQuxUtgO
	T1172i9eNLqk33MTL9ueAeGM/c5H0Yi8DnY6BEl4XhUIfUK3dv0a1ipLDtHNF5wu
	2FW6DXznogI+/DYAMYV0ou5PYeyB+sAJcTzGfXK8EPe7j5N0EgPEmMFJBzlyuVpX
	zBkavs+0K40u6fVyhCC5rpTGwmLzOXDnUl7UunOHNl0sd4HMe8/SrKaSdufoz/Z9
	OELn9g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43btd30dj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 07:21:29 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B67LSl3027316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 07:21:28 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 23:21:24 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>
Subject: [PATCH 3/3] arm64: dts: qcom: ipq5332: Enable TRNG instead of PRNG
Date: Fri, 6 Dec 2024 12:50:57 +0530
Message-ID: <20241206072057.1508459-4-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241206072057.1508459-1-quic_mdalam@quicinc.com>
References: <20241206072057.1508459-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NDdAjME9E3Aj6ReSGzAZbSpsyszonlJm
X-Proofpoint-ORIG-GUID: NDdAjME9E3Aj6ReSGzAZbSpsyszonlJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=738 spamscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060050

RNG hardware versions greater than 3.0 are Truly
Random Number Generators (TRNG). In IPQ53xx RNG
block is TRNG. Update the corresponding compatible
property to ensure the hardware block is registered
with the hw_random framework, which feeds the Linux
entropy pool.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index d3c3e215a15c..5e71c86c6935 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -180,7 +180,7 @@ cpu_speed_bin: cpu-speed-bin@1d {
 		};
 
 		rng: rng@e3000 {
-			compatible = "qcom,prng-ee";
+			compatible = "qcom,trng";
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";
-- 
2.34.1


