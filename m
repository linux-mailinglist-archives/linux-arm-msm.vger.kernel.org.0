Return-Path: <linux-arm-msm+bounces-59906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29884AC901E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0503A843D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB83D22B597;
	Fri, 30 May 2025 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X9JM4T1u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8FA1E4A4;
	Fri, 30 May 2025 13:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611369; cv=none; b=RTUhANAIYwA9hDdX5j5bO+NaKrx34Qxfnc5lxDccpOBgGg1GfGp3j5HN3wd1shI2+g1t0bd7L8DbzvCxKoQnjP1svUn2UWje/j6M2QA1EH6vOE0152pHFiod5wNFrmxCjcwWfRZVzf+lwE/oLBh4Nk9gXWRmUdq9tyhcF11sZBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611369; c=relaxed/simple;
	bh=hhgazxwICJCoIpIqFdOgSAsC/QDrsMTTzkaVLNs+7ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CYURdPPatXcHxfhCJKB4EVQrl2WXzzFGoZQJXyh02GREU29b3CFhpdcTrtPdoCRhwDu9jGpu6dvPttXUH7EJcFCj0p7jL1N4KCWnMhBWSgp8DUyYu2oZebMRi3piTxxLsGzQEIzj8NrD1nZkUecLFRZJVLl8JmJjPbslGKn6UzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X9JM4T1u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAF1Qm026380;
	Fri, 30 May 2025 13:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+t3jAgry0lBDLxFsDvHjHSWiGUfpiEas1aoJPNtIoE=; b=X9JM4T1uJ0WB7kP6
	4E8SGpj9WenqiAZ0C651cszFMaIVQ++d7+gQB7PDgw+JSBYdhpYP15DXeRGvkN2n
	yQXy3KMxM5gTOartJaCOygnB56C2C92EV82NzrCreI493AM7yPfNz5z9xt6BVYAb
	3dhCRnKMbRfeinVLtFOR4nAX99sq1aL7F59zNrg13ltEBPFfv+A9MXGM4DatyOtw
	OGv3/ou1m6cgR9875LA/hsm4Bjx33b8nszU0zF98sJaFFi+toSkugWKbMOuiidDq
	VQc9ioY9NJsBbN/53GdMUSLw4lBZ4dcUOakcGq1LCiWL8ftKM466m/WobbLrtv5M
	0qIWVQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yarh0gnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:22:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDMhqv000528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:22:43 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:22:36 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 30 May 2025 18:51:02 +0530
Subject: [PATCH v5 17/18] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-17-02303b3a582d@quicinc.com>
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
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfX/8K9T4gLt6GU
 xbEsXIQpZaj4C7XKLEZvQ4UcQntb4fdhppu2dDnV3gnRQsb77vzlAgNvobKf8fFtUFr6KOzKI7V
 cAvyTJKOFxZXyry5gYC9Eam5WzM4dSdf7Z+N8Z8NMUJZRtU3zU+RtVp7AM+ysXZSEy9zHDqRGae
 8a5H58mptGnD5xlBNW6XIjX3VCCcAQ6puJ7LrXyH3zaB4Wux/yfR0vjs9m5mXuRizN9I6MB9+Wu
 lMpeULkrDdjkmvshu6MO3QH6kByo0AawOYdQ62JX9sUfaWd9zPJYKKqZLBJnpX05chouBiLk64U
 fVB77qlvIC3gMkZpSlj0OvB+NiFMu6zeGkLAf7gzXa2bZ85C1c8H4dvVFOG9hKD8dTtU5Ukmr+b
 BprPIE5j5nVoNTFxAZW5BdLWrQ5Mom0PVSgSycCWIrB2a9HryhypAXf3itBmR+OfFyE2Vj9/
X-Authority-Analysis: v=2.4 cv=EfHIQOmC c=1 sm=1 tr=0 ts=6839b123 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=jo5gyf6T4QpUFNk_kWsA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DTppu3zVfuDvraVWi_5xB9zEGpPsrN5l
X-Proofpoint-ORIG-GUID: DTppu3zVfuDvraVWi_5xB9zEGpPsrN5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=440 mlxscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300116

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Camcc requires both MMCX and MXC rails to be powered ON to configure
the camera PLLs on SM8550 platform. Hence add MXC power domain to
camcc node on SM8550. While at it, update SM8550_MMCX macro to RPMHPD_MMCX
to align towards common macros.

Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 92017caedbbbea12eb2e43f2e9f5bcad0c0ee40c..e9bb077aa9f0b8be28608d4a0345aae7df8cd167 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3333,8 +3333,10 @@ camcc: clock-controller@ade0000 {
 				 <&bi_tcxo_div2>,
 				 <&bi_tcxo_ao_div2>,
 				 <&sleep_clk>;
-			power-domains = <&rpmhpd SM8550_MMCX>;
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


