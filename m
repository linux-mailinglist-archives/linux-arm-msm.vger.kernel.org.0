Return-Path: <linux-arm-msm+bounces-57964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68EAB7571
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B20B18995A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9904C2920AC;
	Wed, 14 May 2025 19:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GXOCXRVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E11C2918F4;
	Wed, 14 May 2025 19:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249853; cv=none; b=XEc0YRnUgWPixLIKdUC22Yh9a589kZUCdUBcbavNE3Adbqr8Nb1cxzzCs8WqLPxvcphdFMkwc8peFL5ArnYzfs15kdDpZzVuk8IXiz9v9CavP0Ne5dzSJlD995g18Qhmirtb/j106o5REJnjF1CT3VNYHPkEl+u0gJ3/pAVE9LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249853; c=relaxed/simple;
	bh=1fj6QxdkYv/WhfelCPDxoSPPmQnwUpaJSWoH5AB1iKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=p4eWDM2GrpFLfitpJN0PXOcQKVAbcDPrCPWAAcGQ8xO86bdF+xNEMH7fYBPAm5rmhWeRETS/2L/OuuXG8URS1BtkDtJuKTX5/7+QHVQAN5VhLYeFXSd/w9WRW5TgMP51cjky3qUTkPx50xBbux4hjquYkWe6Kyw/Ygnor5J9hn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GXOCXRVz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EIeSBG002748;
	Wed, 14 May 2025 19:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cf7g0UazzorT3xzCO728Wsoim5pu4BVEfNVq7pRphac=; b=GXOCXRVz7pQWlHJB
	E+QOXIBLEFpk/OSq18jQg/ScV9gMpgrNkN22+LNa0aBmAMQnuuCoWxUMcH+z0Fn7
	+50p32vwRI1cRnamBZGqVb8yal1vLrwg3A8WpTiCf4krBvFZNRTxCrzpwhx7yn1N
	iU9TVFF26qKMayMBUuXeMpR3MN92n/tGbPPpS6HLtH7TopNGf8Iun6xEcYBMhrrz
	ck9LEpCeRps5ZzSdi3zy0EceAFy/ngCZh57+o1VfwfBQs0xoMsNHu++21OXNFMUT
	vaBhslvLI1cNyinXyaiWjsvU5oo+7JccsyTcT7C4nQdj14bwe7UsotkUnXsC9xe8
	JV+Xjw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpbtab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:10:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EJAlge001358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:10:47 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 12:10:41 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 15 May 2025 00:39:01 +0530
Subject: [PATCH v4 16/18] arm64: dts: qcom: sm8450: Additionally manage MXC
 power domain in camcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W6EbP-x1ocmX-a44HuL13nV6-88nPH98
X-Proofpoint-ORIG-GUID: W6EbP-x1ocmX-a44HuL13nV6-88nPH98
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6824eab8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=yDpTXWEf0LF08gPbhRgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfX80sPiwVdqHaL
 IEzo3G/Tj90gRKhdf0Kgpv+sp3zvcHF2Y2246QfTOLWcz2c9R8HLM4hugnqaL7c/RubHOQNOusm
 hewBDHWYArVPNU5jqo0J+eSWIs9U1J5gaBZOtVE4zH+Uqg+Z3YjikX71N3GaEqQANjToGKhXHEG
 UzE+OZCv8GOGTeJzkXCzklEC+/703HDERcPQuJX0mTE56oGjXd0xhjrf7HMvoztFH861mWBw4Uo
 XjAIiD7aprftB2NNlL9wtjJz/3+IXBZbllB9ogoaDKSymsgGBci7j+frxkwDhS6pHxOQBam2On/
 c8KtPbUPf8ZQUcs1IAkmqa/bOOaxUkhvYJ5Z4yvHDG5sobvm32TG+RWK924eqifZ+riAIUdAcXX
 X1cnZy1ar9WFd6/PvbmK0IUxK6iKCR8uU8egKbKq/LB3JG0lLynAItCs9zsqwFq4U5YbeIxO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=477 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140174

Camcc requires both MMCX and MXC rails to be powered ON to configure
the camera PLLs on SM8450 platform. Hence add MXC power domain to
camcc node on SM8450.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 36a67c679fbaed944d7590528b696635c306da5d..624190c07c59f3e6714f296f1b264d2a88135116 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3292,8 +3292,10 @@ camcc: clock-controller@ade0000 {
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
-			power-domains = <&rpmhpd RPMHPD_MMCX>;
-			required-opps = <&rpmhpd_opp_low_svs>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


