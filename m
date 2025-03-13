Return-Path: <linux-arm-msm+bounces-51269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FC9A5F1EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 12:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB36B188F759
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 11:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A12266578;
	Thu, 13 Mar 2025 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cWX8LuTZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F319B1EE028;
	Thu, 13 Mar 2025 11:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741863923; cv=none; b=DB1CHRnqAp812tqttjvxtq6WPM+1U8nz/FXmD/hF6710SVQyIL/yUGjFbzUwHMv5F7ghfZwm3jJysgxWiNPtYM64wry5V5InLG2JNmKGRCdkKT3rvi2BhnhUluTt6AQydN9+5LKGugbPv/bC5Tw6pponMrtQmu8vNdydoHBGwow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741863923; c=relaxed/simple;
	bh=o1OiobDcJrL8mGJP69zaQBiXxg5J7rT93C8Xr7AEEK0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CC3hRU8o4IM19qzVeYGwUU7jPiJ+dDqnrc1PzO8/LdDz0/m5JXPg1lLCuU3Fzhxf5+3EYDW2i1Mdo+Q5bXvbXj4cirzrip9YSL4tfeziy28zyHmyGczhVRvmLcwBzouOLhFg8VzOmkuPwFndQZaVqFgjuNYLDm9qNF5+lT2cFYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cWX8LuTZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DA8ev1027346;
	Thu, 13 Mar 2025 11:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCeRIqlWJK0Tk88HirSBhuq27rKsoVOAJFdyzK4RF6A=; b=cWX8LuTZZb0YVWqB
	406mgc0MJ2KMFXraMosDHr69z9IxBX4cX+Q0DxnyXE0LkWnvgFZ6PAEGK/HPSYfp
	52UjWpz0ehYn6E7qmcgpL2xJz+3m9dZ/UyvSMZ3pH+0gja3O7N0Aj4Hs4VxesUQ1
	BUUS45umccr2Amfjz1OeXGX6VsfLKvSV9nVl6VIL3vY/Z72oNz2j6cKfE7AYnoqw
	Visz9r2f89BfoSGqCZzPNwHBMx5bzgfRZreP5sAc13c4tAcfb2vZSPSFUTm0uFgt
	ETtGGPjLU8Z3MglBp2X6UDrzV2D6bPWl4uk1LsQF5KVyg1HhpSRXl5BRvZg6rpv5
	/uN4zQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2pwkdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:05:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DB50YM013624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:05:00 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 04:04:51 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <lumag@kernel.org>, <heiko@sntech.de>,
        <biju.das.jz@bp.renesas.com>, <quic_tdas@quicinc.com>,
        <nfraprado@collabora.com>, <elinor.montmasson@savoirfairelinux.com>,
        <ross.burton@arm.com>, <javier.carrasco@wolfvision.net>,
        <ebiggers@google.com>, <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v12 5/6] arm64: dts: qcom: ipq9574: Add nsscc node
Date: Thu, 13 Mar 2025 16:33:58 +0530
Message-ID: <20250313110359.242491-6-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d2bbdc cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=f3IO2J1BiS9j5L7VamwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mJds94K-yDGdOAcrg_Gqd4AbwrRK4GXc
X-Proofpoint-ORIG-GUID: mJds94K-yDGdOAcrg_Gqd4AbwrRK4GXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130087

From: Devi Priya <quic_devipriy@quicinc.com>

Add a node for the nss clock controller found on ipq9574 based devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V12:
	- Pick up R-b tag.

 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index cac58352182e..346de8ccfd0f 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -1193,6 +1193,35 @@ pcie0: pci@28000000 {
 			status = "disabled";
 		};
 
+		nsscc: clock-controller@39b00000 {
+			compatible = "qcom,ipq9574-nsscc";
+			reg = <0x39b00000 0x80000>;
+			clocks = <&xo_board_clk>,
+				 <&cmn_pll NSS_1200MHZ_CLK>,
+				 <&cmn_pll PPE_353MHZ_CLK>,
+				 <&gcc GPLL0_OUT_AUX>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&gcc GCC_NSSCC_CLK>;
+			clock-names = "xo",
+				      "nss_1200",
+				      "ppe_353",
+				      "gpll0_out",
+				      "uniphy0_rx",
+				      "uniphy0_tx",
+				      "uniphy1_rx",
+				      "uniphy1_tx",
+				      "uniphy2_rx",
+				      "uniphy2_tx",
+				      "bus";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#interconnect-cells = <1>;
+		};
 	};
 
 	thermal-zones {
-- 
2.34.1


