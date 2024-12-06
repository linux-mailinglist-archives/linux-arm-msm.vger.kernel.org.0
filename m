Return-Path: <linux-arm-msm+bounces-40713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D779E67E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 08:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4240728253C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 07:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CEF1DD0EC;
	Fri,  6 Dec 2024 07:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bHGPlQ9B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7511DC19D;
	Fri,  6 Dec 2024 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733469699; cv=none; b=cj4R1cJWGn56k11tZ+d5YmIH7EsqkZKj75TEZ2jrLXX70Uui0m3+av/1Rnw6Hqb3gPnWOkj1fLorhEyUr97sucejb21DX64nddTYwK3+YOSHWCkMkCf2bQhiUmKYhCJf4fughsFZ/Fdg6aUcI6QZqcyfQybDe701yca4EIwi1GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733469699; c=relaxed/simple;
	bh=J98SVXUms99TMSXg7hbspfbIvMhJG6F8Xc+lJlbcLDk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBh8FpM9/G2pR2qT+qv8vys5uSfDzGZMIcJSYbLjKIAvyRjP0BJwwyGSOz8zRMIElQj0N2Uh5u+uE7Fb7ARgNKl170S++zfNH9IlzaPO9GbfF0DOT+HmvNvB/TZhPcOu1qFrmyqNzZNhQ2vNIzOLS+XSR6wz0kABHGknE9nVMZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bHGPlQ9B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67BWfB017636;
	Fri, 6 Dec 2024 07:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJ3vHNhpXDzA8ihHivGsHoQvRYaeyBHq/BU+ZfgAxdk=; b=bHGPlQ9BAvfcqmBD
	CYJirlKir17Q5pMUX06nrsxN37f5BG3iIb2O0y0e5LjX3o6EVG3/erHPAfRu9Sb5
	oJqZsMSFIu90k16zzM/BRI9CxCfs+MU1bLhr7nD0HLsA1sov0nQr0MjGglUBzN35
	w4YvUhh+g/moh+IGJoMe0JszGkO4ghjg/sDMIAkHE8XB/WXhR7SU5EwDJP8koNV0
	FtpCRQ1FRrE2K6yHh7BinDnm6YoVaMN/DOKsh6vq7sCvtlBD7Ml0kQQY1m8/aA4p
	/QdoD3GvfcyvQj1/29+0W6HlhfEdtAOLKvrkuOzJs2dmUb7z7S2siL+kUKlKQZ/K
	IQXLBw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj2r8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 07:21:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B67LOlI005454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 07:21:24 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 23:21:21 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>
Subject: [PATCH 2/3] arm64: dts: qcom: ipq9574: Enable TRNG instead PRNG
Date: Fri, 6 Dec 2024 12:50:56 +0530
Message-ID: <20241206072057.1508459-3-quic_mdalam@quicinc.com>
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
X-Proofpoint-GUID: dNpFV5CWHO0R4B6hVQ_ppIEYDeG-RMDF
X-Proofpoint-ORIG-GUID: dNpFV5CWHO0R4B6hVQ_ppIEYDeG-RMDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=903 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412060051

RNG hardware versions greater than 3.0 are Truly
Random Number Generators (TRNG). In IPQ95xx RNG
block is TRNG. Update the corresponding compatible
property to ensure the hardware block is registered
with the hw_random framework, which feeds the Linux
entropy pool.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index d1fd35ebc4a2..db1afa0d5422 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -227,7 +227,7 @@ rpm_msg_ram: sram@60000 {
 		};
 
 		rng: rng@e3000 {
-			compatible = "qcom,prng-ee";
+			compatible = "qcom,trng";
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";
-- 
2.34.1


