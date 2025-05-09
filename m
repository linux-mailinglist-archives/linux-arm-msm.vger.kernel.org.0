Return-Path: <linux-arm-msm+bounces-57349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3291FAB0A26
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 581F41BC218B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 05:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5209526A096;
	Fri,  9 May 2025 05:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oYwmTfq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98AC266592;
	Fri,  9 May 2025 05:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746770275; cv=none; b=rb9fSbW2LiLu1fB7Ea2RF6iQLFPt2U4pKUUBRKtO26M5KU1/PTa+s4bXIFVT5Zhc3QGE55yTWv3/WYkSldwFzLBNkW0b3E0pYcc1sgWa5FopykkCkaqof2UH9FJ8azNN/bhmW3nUHdMsAgU/3UbQQEEBqwrX8V+ADZ2e8w3Ii20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746770275; c=relaxed/simple;
	bh=zbvnlFVWj0XKZR0nvcVIWzHP+vCohCj3wb6obVt2udg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=n5vQtqqfuqqnLrrIpnp4SQbgciHOZh+XMBAqAWgmqaNlLunPfU5Pz74HRQyN6gVOP0Q0k5BuLaV7Jybr7+JO7w+mvzv2O3LZBIJry+cRAwDbUv6v/iAUo4PoVy4zMW2Vic4U5yaPIqsFsK5mpiEU0vyjbf0VB5UA3JRQe9Pts14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oYwmTfq/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492E458010135;
	Fri, 9 May 2025 05:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0i+DaVo6pdGgXdnezJYZ73V9TZmxM2s3l3IAPHGSMRI=; b=oYwmTfq/BSj1pD/u
	CKkScnySY71YqaghhtUofNfy75A6L2PvJd70/KpSHC+CnZexTZTuRG91MHTnmWo4
	Yk1aN/0lqW2vqNPbFf/Wx0KgcnMi6wcLR7rUE08hCj9y3eHQA8lQQv9K89MqoZvB
	YL81Q5wBYWIoaDeScdjdNyrl8yMxB4k/3OR3x5YV+QPvWuUpmvfsLMrGh9BQC+xA
	FcP5svSJg9NcUwwwkm1c2E5B/C9UjyYkBSwqmHK/EkTt3ngSYxuerDFOxjQQBbQo
	Jqm2PUuoWIbY6E6MvFxdLIQuChwhyk4MGrvTWMlMnSPBh68Yv1+N9JqfgbYwjumw
	psryXg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7bm10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 05:57:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5495vnw6002137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 05:57:49 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 May 2025 22:57:45 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Fri, 9 May 2025 11:26:50 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: Add camera clock controller for
 sc8180x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-sc8180x-camcc-support-v3-4-409ca8bfd6b8@quicinc.com>
References: <20250509-sc8180x-camcc-support-v3-0-409ca8bfd6b8@quicinc.com>
In-Reply-To: <20250509-sc8180x-camcc-support-v3-0-409ca8bfd6b8@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA1NSBTYWx0ZWRfX2OW9RINUe3Nf
 TUBvpSXIwlAecTwTDVNpRret8AcF5/a/FqbBoBdXk99+tA5HvQdMNno75gNewTq4ItpJTiIcy62
 drJE4EIMHXEAlhn49ZSnmAkw2lGK9Z6W0rEbWGxQfECy4FrpHhhcd/t3AVkGDFi+jQZ5H+suGIY
 AJOqx9+tiNlAdyLhJEpcEMeDMvxvAdhw78O5IeNRjDT7SaxF1dvSNbfuJ2uIbWtD/kgQBpH4rm9
 2f4lAndzP5j8emtqT2XI7GjCFAypUPfaCmdiKyfCSs7AVQ08DH8FZDEHG3Fu0BUOF0TUHfVskuZ
 YkAnfsjoGc35uRjXFRyRS7qtlHZHVT9T4PVz8ygO9fYEAPDC1zT23kcjtPB60seO0o9J4LOH8eJ
 88MRGHV6O8d1tNabNfj16qXx8xjI4h9B502jJFppo17C9BhxmOcyQ+LxOM0h3f6RNK2vgFiR
X-Proofpoint-GUID: nFGm7j77eKGO5sjlc-Iql6RrJJgi3c82
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681d995e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=fv2zVKLHILqpzYTyU3AA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nFGm7j77eKGO5sjlc-Iql6RrJJgi3c82
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=852 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090055

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


