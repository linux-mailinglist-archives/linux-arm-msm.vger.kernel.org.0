Return-Path: <linux-arm-msm+bounces-57579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC5AB2EB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 07:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 044D8189A982
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 05:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F529255246;
	Mon, 12 May 2025 05:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SuvWY6nM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1586254B05;
	Mon, 12 May 2025 05:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747026336; cv=none; b=AnEAzRJY7lwui4gPqihYGCx/m+PateFwd9V1T9XaVCIfbP5IYWcXd9q15A1yh+LNCS2gSQB54ku9L5qBO8ISuiOzOjSftE7SMVf2Mn/ynEkQoHW/P7jBnHGGz9Jyw3LXAP/ih3E9nkXaf//DmojRDCk8LPe7CtFv+pTfLXm3oBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747026336; c=relaxed/simple;
	bh=zbvnlFVWj0XKZR0nvcVIWzHP+vCohCj3wb6obVt2udg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Lr3aTNbXcqgaoKGxtwH2qoXt3QF8PezRPfS2wnKGsP+Y4TKvRNPGlq5Ii+FkwXBpY00Rz111MnKkFZRTB/OdvXKD13N6jAYX3YBfAWO6Tbw7p9BOuq+OC1Sbtsa2ccyTiLJGItFdxNumGw6kFJRUyOrWlYGGxVi3wW5MCGv93xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SuvWY6nM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BMdbHP020526;
	Mon, 12 May 2025 05:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0i+DaVo6pdGgXdnezJYZ73V9TZmxM2s3l3IAPHGSMRI=; b=SuvWY6nMZo0WmMOV
	aLzVkepBIgI4mi9FfVanBKEUr79xA83T6dPDIbz+VSFsxIZXShpTCfa67jAgl/YN
	C/ccO+NsylGvPSnChWKKPel72EGpRG0n/oTaqIjYFbqiOa1WsUxRzMOzHpoPE1o6
	TNJ2WdKJ1puOP0ju70+FRkEgv8K3uU+A8UDF3xBtuZVA7BLuboaw/1cSz19O0bVj
	su9BRN+fRg01d8HmKoKKslbpsxlr8N0iUC3Yvc2mg802n3yyt6sX4GO14KNuvC9Q
	MecwvKL63MMd1BAX19dTEBEfN41HGikD1nkk+C02oqG9itT6UWJGPjMKjDXDGgoM
	S0uLVg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hy15u3mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:05:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54C55VAG019031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:05:31 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 May 2025 22:05:26 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Mon, 12 May 2025 10:34:39 +0530
Subject: [PATCH v4 4/4] arm64: dts: qcom: Add camera clock controller for
 sc8180x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250512-sc8180x-camcc-support-v4-4-8fb1d3265f52@quicinc.com>
References: <20250512-sc8180x-camcc-support-v4-0-8fb1d3265f52@quicinc.com>
In-Reply-To: <20250512-sc8180x-camcc-support-v4-0-8fb1d3265f52@quicinc.com>
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
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z3Dri9qWpMo3AfekdnBYOAt1ZDMOFH3t
X-Proofpoint-ORIG-GUID: Z3Dri9qWpMo3AfekdnBYOAt1ZDMOFH3t
X-Authority-Analysis: v=2.4 cv=P9U6hjAu c=1 sm=1 tr=0 ts=6821819b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=fv2zVKLHILqpzYTyU3AA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA1MSBTYWx0ZWRfX6gN48BOHd49Z
 PHRjLl0Z1PjfGJ/esf2RGt1Gw5hu85tTwx4213rwakAkX7poL+hYHqjuSAH4pttnE+2V15I2rwm
 llcoazEUldmUNHJTAOLe++b5tw0jXQrwRyOxxVWqQTMJMQNnhg8VZOs7yxJwehlKIDXjzNpIbDn
 cAojxOMrngzvcvNl7Wb9gGmkDYlJgTjN1joDCAwRfyUSOW09cw63bUnG8VwgXEgM/RWDwJMfu/T
 NUc3j3l6Ahpc12SLPf/FnwH4IKrK5FCpQqs2DVae+KMhFciWBj5FZ/FblOgcolmnzu3BZw/BNKw
 /VzdoiCZHT0NaxhPTj79croottPq6XdkpDR38Cna04ilUochXU2KPN5M/T1dr5S8NLkv/Rg8/Gd
 tDYiuYhkqD2+ikZFFGGjqaySxTQ5gGhFxDPERHqO8w0BKKSjAj1DR0In2o8nqg8EwjR5Dzpd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 mlxlogscore=852 malwarescore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120051

Add device node for camera clock controller on Qualcomm
SC8180X platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index b84e47a461a014871ef11e08d18af70bec8e2d63..e53c242fda12b2b53a27e549e2e2e2ead9e88cf1 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sc8180x-camcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8180x.h>
@@ -2934,6 +2935,19 @@ usb_sec_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sc8180x-camcc";
+			reg = <0 0x0ad00000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8180X_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: mdss@ae00000 {
 			compatible = "qcom,sc8180x-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.25.1


