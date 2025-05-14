Return-Path: <linux-arm-msm+bounces-57963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B17B3AB756C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3B301BA5149
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B022918EA;
	Wed, 14 May 2025 19:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fVnNCn7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D388F28ECCF;
	Wed, 14 May 2025 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249847; cv=none; b=PDZEN7S26FEeX/xXBvqycS2s3+Bivl5JB1k762uTPdTV0hlCF/RFBtQu+DXGZAU+DmA8pZTMMk7G4jpxtXgT2x1SXURB17z4eUjFguj1MTlJnIgyi+FuH6ePJaogVpQBXvrN0NL1JB5wDidpTJUIIzXVjXkNRSp3VeZsnp8xGs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249847; c=relaxed/simple;
	bh=Fk8rhvUhAGjEOWqjMCbe3krZ4fOwcqs9I+zsTYbVW/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uIkVMyrWBybau3MZH/wnaBrHrIQ0XS2jvcYSkS4c8bXk3nCGV16e905/NqCjlg0tVroxfyj3uUrDIC3YNNsDeWjnln+5h7aR2ypr57FIBGX0Xge27Qk+nGZgVNmH1b6RNekQMribcMZoiDwGGQ3euIJwGvHV15eNoPSvuFH4Wm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fVnNCn7r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvAC030378;
	Wed, 14 May 2025 19:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLfW1owCRvNSjSopNndg3lCBZdoR0UVb7idQpUjAuiQ=; b=fVnNCn7r9mVnIsB9
	2rEk6vy2KtSWH3JDB3JaRJfYzluYT1re8CWDvnxQbOY6DT4TP07aah0Ov4O68Jxr
	Vf11mlrKlRmTfb/Z6OKnbW7DFOPyBUX8F8/o0QvGLOmLtxvKMNsdFwb/HVVqY4Uf
	KY+zVARKkqCAGxWZA18Y/CDVGJNrct1VZ2rjaKCIPrhN0otAW77Cn6gOOSdg2uV9
	UAo5rs73YmRqDr6IuM6TqGI+veDFf3S+UzBgXAXTKfCh44exkdV6rzRXwwC+Y7jb
	N6Ytu+PsYCkVaDKSwxaUlVsLU+GSCmIvk48HGo+JlSnt6ZCEC8PawSlS/UtsodLd
	TwULpA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnutu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:10:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EJAflx012790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:10:41 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 12:10:36 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 15 May 2025 00:39:00 +0530
Subject: [PATCH v4 15/18] arm64: dts: qcom: sm8650: Additionally manage MXC
 power domain in videocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250515-videocc-pll-multi-pd-voting-v4-15-571c63297d01@quicinc.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d071FedYAG0rM3KESri2iONLO5bmmA3v
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6824eab2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=yDpTXWEf0LF08gPbhRgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfXzpQMJv0TSHFt
 72ftORNfeFUj0Oj/Ir8wusOhnfLnvIs0wxITy/tvE1aqtJWu0Y7++S24oop5cemDVJ9qsAZ4112
 494UYMX0My4/yVOJIiGzPL+9T7d7zQw0PXZJB1byJb0dDyfcVr6lFbZqe/AEaaO5Yzs+/n2ICNt
 wSAAMvX2hFExpTo5WacNRmmmgUh3JUb9u1JsX7WjE6zN6OlGb6jCMBB8lyhnrCQAILKCQfoAS5Z
 DT/y5eQeBBq2tgrXvAzjHLx1ivLh+/RAsYuWy0C7p9LU52W5+J/jf3kkJNGLKU2IYZQzQs7/hj7
 KuEUm4943WrkLerSR7z/Xk3CMjJvOimpO4a8I2cpFtXjLZXsWsCNzRp4YmjmuNAj9rmYsYDeR06
 0NHGeMmEKIellCuq1TZTLq3oK+gSoP7Cg0Ek9oDW43CafGjE0Q4fK7AqfVZxTkrNhkbjwPpM
X-Proofpoint-GUID: d071FedYAG0rM3KESri2iONLO5bmmA3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=582 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140174

Videocc requires both MMCX and MXC rails to be powered ON to configure
the video PLLs on SM8650 platform. Hence add MXC power domain to videocc
node on SM8650.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 818db6ba3b3be99c187512ea4acf2004422f6a18..ad60596b71d25bb0198b26660dc41195a1210a23 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4959,7 +4959,8 @@ videocc: clock-controller@aaf0000 {
 			reg = <0 0x0aaf0000 0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
-			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


