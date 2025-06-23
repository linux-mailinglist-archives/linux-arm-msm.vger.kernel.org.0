Return-Path: <linux-arm-msm+bounces-62011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C379AE3815
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D92F3A4B63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 08:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06078218ABA;
	Mon, 23 Jun 2025 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iTh/+ahL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333AE21765E;
	Mon, 23 Jun 2025 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666491; cv=none; b=N2dyYkFJbhLen/zC7dhxgGiok2fwXe3/8JngSWzpqLsw3Z/4OD9fpbnu4Ev4/UgLwxFJ5/2fNLb66xxIGdRfqdv4TEloxUrwVcE+EqtSXi1qDJvmsa6aWHf1PiH0xUz+kCpkBIY4a74BLblR4YEQxQei/O978zeda1DdvOCUDHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666491; c=relaxed/simple;
	bh=XEtoYmWydJuCgXNXIh5lvdCDhRvv5CZlmsc2mQLRbyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=F0A2jB9UuJ0UtVs5jhEx9ojWhSel0qViRKPm4ec9jc0VFVzCQw/EzxuYmTQDm75CrIG18gRbVWow7SiUUPbUhhH9b8AkSzZCTr2+35JkbvCiRkK6ukd1BQK2r8ijAxIERu+rW7HwgdoeLrC4jveayP8lrnibDfbOrze0m1N9c/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iTh/+ahL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N1EcrW023814;
	Mon, 23 Jun 2025 08:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c72lr0pk7H+QEl9TML4Go+
	1Hw2lpQACpD+ixGNWkpxM=; b=iTh/+ahL5mvD2hv8X/HH0rSnugaiXwR7IhZSpf
	5AbpewpS1bCP17PHjaEexewWN2alk9XgswPIP8u9OghetUfhNFpk8uEmbkXiBf//
	ByXDzwd5RlS9Wb1i95fB6WqhjVViOCF2LzEOxoPxc8EQtOtYNXhEL/9+ycKJHM53
	xj/qh5DnHihze/RhBODlZ7N6nhHTsrE8B/ex7nDKpa9FguC/rkMEE8fL1Iq0eeZl
	UZQuVpHen5T1XH3S1RD9QvSDX85Vz04C3wwUIBVgyguBSDEnLt6EHDwHRtMCjgAY
	SaYex1Ac9D+g9T5WYauf7D/lgj+/Rgaq8UoHqCVDc+ImFmsg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud092f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:14:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55N8EkAT018175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:14:46 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 23 Jun 2025 01:14:42 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Mon, 23 Jun 2025 13:44:32 +0530
Subject: [PATCH] arm64: dts: qcom: sc8180x: Add video clock controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOgMWWgC/x3MQQqAIBBA0avErBtQK5OuEi1iHGs2FhoRhHdPW
 r7F/y9kTsIZpuaFxLdkOWKFbhugfY0bo/hqMMoMypoOMznt1IO3eD6I0F/YM3WkRquD81DDM3G
 Q55/OSykfURCdImQAAAA=
X-Change-ID: 20250623-sc8180x-videocc-dt-4ec3c0761f8d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iUGxGQdRsYLgfERUYwTz7t7mPNy07cJ2
X-Proofpoint-ORIG-GUID: iUGxGQdRsYLgfERUYwTz7t7mPNy07cJ2
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=68590cf7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=VdR9ytC32kPbH48ryfQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0OCBTYWx0ZWRfX+AKTUSRrEaZf
 5Ccm8L70cZ87WDMl8JTKi6aGcwGqo3kyp6kJZPCPpu64Wq4RgdN6DeuhKJ1VB6Mtyj4qJIVcK4B
 14j74WbrVMWrk8uRo8TZMqSh3zO12SRavzCcHmKmDkR5TYRicC/g8E136hFkxNobGTX9NZ+s4Ht
 NCMFILHsD4a+3RDWUdFHSVqPfaiPBUssWu86cF8uOnYFZl2InNvEAdCc3xL4VqpDyw4lfTN71Ka
 DTnL44mhRwExTQL0yDJqFN0JJYDIMXsLk4Vji6x0jBdAz4Ke9pqXC9H7Jb7TN15RNDEErTzCs84
 cKu2h9FQMVW9VnXHEhJwKVVl/uk41FDIj7l2EApMEqfH1IIb0vnvtgnEfozKsSYKic3LGrE5LDZ
 cKbC5cMX9uzamD8WzMGq4Up7SR01omWyddaCR7EiZmw9xpvMh+ve0P5G5+y76tf2hLC2g2vB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=852
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230048

Add device node for video clock controller on Qualcomm
SC8180X platform.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Add device node for video clock controller on Qualcomm
SC8180X platform.
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index b74ce3175d209b569e634073662307964158b340..4590c2ff68a9885d8047d728bbf2dea0236d5b8f 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8180x-camcc.h>
+#include <dt-bindings/clock/qcom,videocc-sm8150.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8180x.h>
@@ -2943,6 +2944,19 @@ usb_sec_dwc3_ss: endpoint {
 			};
 		};
 
+		videocc: clock-controller@ab00000 {
+			compatible = "qcom,sm8150-videocc";
+			reg = <0 0x0ab00000 0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "bi_tcxo";
+			power-domains = <&rpmhpd SC8180X_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sc8180x-camcc";
 			reg = <0 0x0ad00000 0 0x20000>;

---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20250623-sc8180x-videocc-dt-4ec3c0761f8d

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


