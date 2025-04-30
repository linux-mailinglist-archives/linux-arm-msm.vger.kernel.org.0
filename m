Return-Path: <linux-arm-msm+bounces-56235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605CEAA4917
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C62E3ACF08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D4725D8F2;
	Wed, 30 Apr 2025 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fNI8AFpL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DD925C83D;
	Wed, 30 Apr 2025 10:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009584; cv=none; b=MQxcJm370pj3ELR3fJDBLs7rzswwE6t0va0h/NeDtM6U0jRvvo0k3yyol3F/Ayk/We6Y7IwqMBqcdMnylLVA9FatfrMFZUjc+eahrpvqyD29t/uZcFlbnjsrfZ2aVEFIr1moqHlo1UHBAXlAFjL+3o92enK5VB/LEtGEMgZjvng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009584; c=relaxed/simple;
	bh=zbvnlFVWj0XKZR0nvcVIWzHP+vCohCj3wb6obVt2udg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EIBQi3/nc2lNokTBNNta3g4O/QSvlnn+GcXbGX0vRnwoO1i7XGFdupX9As7NtD8Dx+YMYjyiVTwXjmgRktIclubD88k5+LBGtWxCLE4Ue5LHlqOB6REIUqtyTIj39UM4nFlclVUsjKhCzQTM8HzJYuttdd0r0pIyZMaqQs1MS1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fNI8AFpL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9XaSs005570;
	Wed, 30 Apr 2025 10:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0i+DaVo6pdGgXdnezJYZ73V9TZmxM2s3l3IAPHGSMRI=; b=fNI8AFpLNRpzZ8M7
	C9wR/AczxfqAn3sxxrJNl/SI7FwpNISb8rax51CuvzFshHGSbkfzZykipoJeaifZ
	lQ9t6g+HHLYPg1fPaGT9gGoaZ/UJNp94jgMdlMqAPZ0VHSYzrBCHh44MXYAVYa/b
	r9Oi9WxWj0R+0NMarwnbXNRyJHP74ovjfYPlJ3ckyd0rR+OZgmrpIHgGW7/pA2Z+
	LwEkUgOUPMEunp8f+iNLJXk5NbIGpcE9BThhcmIEZwIT1r/aZ/rcN4OKyaFTDcok
	mCriU93gelbhwTjXGPcRlO4s+eDhFeppUo3HnD9tUHQ7o93P0Xzw2i5A4zwT+aqc
	UtSutw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u89sqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:39:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UAdaXv015654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:39:36 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 03:39:31 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 30 Apr 2025 16:08:58 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add camera clock controller for
 sc8180x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250430-sc8180x-camcc-support-v2-4-6bbb514f467c@quicinc.com>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
In-Reply-To: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
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
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=6811fde9 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=fv2zVKLHILqpzYTyU3AA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LZboMHRVAwK78GaWp9rXBQP06Pb0GFYA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NSBTYWx0ZWRfX/8V3msOs/QOS uhcTmAJiKfFuwOBxRqI72IfqfBUiD5O1/sFGB+69dhmROQeUbClXHyh4pReZzu+AtYtuHV6hWxA GZMUlNhIO15nvlc/yXZ2rhx/NCfab7dDwI3UQZRZmNymLNYaP8zyd+mgOSEjS45TQtTJBrSdzt4
 6IstZBSug0ZjstA9F0ldaL5u9FgiDM4VewW/38HVOBAY6TWHSOgN8KdGuD4JHJdPD1scgWq1W+u USxB0ipVY6tgoWNP8bs3xczhpUxJiJUD3maZrYnut7+g3leRI7HD8qkr2jAI1Co3gXpgzIKFzUd 5uZKE3Vbby4gk29Kxvi6gqiiBNHZWlHSsscYTYGwd23bQ5fGErbvRc+YZ1j3RwyhUo56ituhwz3
 EgYxn57/ZTeeGEIy/zdJElKjJ1Zj33Gd/s4g49Qhbjg5qtFDymXZPO1GLCAA5GqGYiDNNK+1
X-Proofpoint-ORIG-GUID: LZboMHRVAwK78GaWp9rXBQP06Pb0GFYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=854 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300075

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


