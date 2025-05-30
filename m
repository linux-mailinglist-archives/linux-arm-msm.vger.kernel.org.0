Return-Path: <linux-arm-msm+bounces-59904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BA2AC9010
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4917C16D465
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9548233148;
	Fri, 30 May 2025 13:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BRKFihIT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1592EB10;
	Fri, 30 May 2025 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611356; cv=none; b=GgcQ0NrDlT5u/Pr5lP3H6arqszoNYnfKxjjLF0B8z8goLVSYL883EvNU4ZPUCblNc8HFW+5v3VkmGrUw2WM85HB289LW8y5ixNcOFMQDV+Vo5o4LJ3AaqE4ekKptv/O1EczYGbAj1jDYGl+ykdQfnSGJQCneNsKxOLO1OjRln3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611356; c=relaxed/simple;
	bh=9ovLZjRJ2xyuSX0AOB2XkTX170sLeSt95BZdLqvJL/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lB2Dr/dOnjvZ41nD6usC2rcmuUhKuG7o28YAL70N4Ztwv1Z0RK/dA36/T7gdlU+XlE8nNgUVitoR2b7frBYmMhkjB+cW4EfaBVL+klCdONu/pB/lY/3dSmKlx7Bn1b7gGxJ4vlFQD78YYt3et0VcjClwvr7K6Ldu/4kXRfzymzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BRKFihIT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBJqj5004898;
	Fri, 30 May 2025 13:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lioj7Wqr+AtPvV0zzbUycC8xkYtiQW1tp4qPXn8lq8A=; b=BRKFihITHPq3l3NG
	4cMwnTY8PBpH7mTD3NAnVpjrXA9YnW0BHZ3gS7U8OuYKKyWnhQ5VuE08Pm6SoQ5P
	qHl2plwIpba7z9M+N5zqd3et7UuMleTd58hojJuJXjuqDXmRxBMSrlcN0nbNKh3X
	UcsLWEedj+6WPGMYH5Mb/PBJ6fu5BKMhE8yxih4cOWnQXD1vjPcKFlFBNF2zn2fz
	5RQIe0njOhKXhWmnGV4O9uMXsJixSPbHKjo0lBEDlU6m+SQhcXMGYJ9l5zJnV0Ni
	YL90fT8vCaGaqUNr5fcHKS+y8lldfc3WO2f5U+GxMKwWIHVseDqWlsrBqHyt4tU0
	3QUyXw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek8y0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:22:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDMUVD016310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:22:30 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:22:24 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 30 May 2025 18:51:00 +0530
Subject: [PATCH v5 15/18] arm64: dts: qcom: sm8650: Additionally manage MXC
 power domain in videocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-15-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
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
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6839b117 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=yDpTXWEf0LF08gPbhRgA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HHrvbpNmwdyET8IezgyxOa36TBn9n7w7
X-Proofpoint-GUID: HHrvbpNmwdyET8IezgyxOa36TBn9n7w7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfX2JB7pBr1FjOW
 UQLfIpTAWrCI5uxtJ2zaXBcgDq31daJBx8mJuBzewZNP4BwrR789vGA4DyQeZsvoLR6JKRx1xVr
 lr3SHLUa/lUFCynImg6bh8DQ/4EB0yPoTEYs/mTgb6EgytlrCvOzQ1hQHYPPU+p4ArT1a5ZC52J
 I008bFkPdWZIhkwLMthdKFXfl0oBb7Jq2ELsjJdzuIerWaFK/r8EUhH0RJQzcMfkl2NaCpxPiXe
 NHEiAQL+skSmRzZkcHXmMNkQ1WoGxRIEKCjj2zvgV/n8yLYuhga30BF1SVy702Q9CLxFYPJ8Nhj
 C65FoCSc/2Z/NTM+4mjsR/UZw4+QmHFxarY5Hm6ttonvqg0dHI2Avvc4GbOLyw0uLns+hmGS5nR
 pXLoTccOsFpd367R/7q6FnPTnKhtBM9WgaxPVxmMFV/XbIbgbT3T7TkqaPn4Af+t9J8qj2GK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=573 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300116

Videocc requires both MMCX and MXC rails to be powered ON to configure
the video PLLs on SM8650 platform. Hence add MXC power domain to videocc
node on SM8650.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
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


