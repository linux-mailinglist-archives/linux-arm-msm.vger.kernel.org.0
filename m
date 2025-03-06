Return-Path: <linux-arm-msm+bounces-50465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D09EA5458F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88742188FAA8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAD620AF74;
	Thu,  6 Mar 2025 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="De1FHugH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FF42080D3;
	Thu,  6 Mar 2025 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251392; cv=none; b=LccPikxNnOl1sNJGjPvmsjJBs2ixkdT28vehAfATbfe0ojXoACcwDN52JH7p3nRgEF3FF6sxE3Svb8wxlYt6V1onrKgbGIZriK0AT8rckIW9ZEvVMcM8TIPgsVFAYpV2uCE3x4bEhmjWsR/8tNVeEe5KjEWBjO5vnBbLmcezDkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251392; c=relaxed/simple;
	bh=zZdmaRKRSopSrNqTW/vOLy6yz5fn4/IwmZ27EgxU9sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bc3CV4Iyb6kOgtFpL2dg5XJUMy+HVIsIIUhLd5GgkyDG662YQViE/KKNwJVwx+yaQLdsUeryHD4kwb9OJ4Ztg6wyK8nc2y+PhA+9Fvugynwk0Qg6XnUadFktQ99HDBFTT+uJAAieLJWms5Zwl6tL8sgv9MnzvGJ4+xjmjACENXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=De1FHugH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525LGmCW020379;
	Thu, 6 Mar 2025 08:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7E+yqFmxA5e3FdG/tHDnJonS/o/4k5s/gqHx1ys/HU0=; b=De1FHugHlk3/Hq50
	h45YarYniM2qa8gRm9Z+ncgOBftMD5cWnexiXqq/7B5ynPq34MmA3twyiumjh371
	nOfqPkKhXmAlFwRTymogKfyRNolpDEtZx3lsoylJCtpycEdmFNPpkUqwUtafypjF
	uDevkeiznB0whKggJWHdWbBQJ3hae0Unc5L64gb887ii0WEmjA/Z2sCw++D36C3r
	PVfTT2oePJvYAUAWjJ4ldelbO/U1/1QRxNwhb4iN64Otagem9q9QTfKZPmh0qybQ
	gpGW72/Lk1QcH2+3/oYUV5p8Q2f1IER1LQgTwY2qklU80SJTKtnuDtRI6WUx7Gkx
	7KviFw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456xcuhhqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 08:56:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5268uQZ9001286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 08:56:26 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 00:56:21 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 6 Mar 2025 14:25:39 +0530
Subject: [PATCH v2 7/8] arm64: dts: qcom: Add MXC power domain to videocc
 node on SM8550
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250306-videocc-pll-multi-pd-voting-v2-7-0cd00612bc0e@quicinc.com>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: A39z6gZQRtnsKwdap4zJlh09tUWIuEI4
X-Proofpoint-GUID: A39z6gZQRtnsKwdap4zJlh09tUWIuEI4
X-Authority-Analysis: v=2.4 cv=eeXHf6EH c=1 sm=1 tr=0 ts=67c9633b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=1Oxtb1Hbc4BuIRmHjqkA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=669 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060067

Videocc requires both MMCX and MXC rails to be powered ON to configure
the video PLLs on SM8550 platform. Hence add MXC power domain to videocc
node on SM8550.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index eac8de4005d82f246bc50f64f09515631d895c99..a039ae71e1b7bba8124128d19de5e00c65217770 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2889,7 +2889,8 @@ videocc: clock-controller@aaf0000 {
 			reg = <0 0x0aaf0000 0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
-			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1


