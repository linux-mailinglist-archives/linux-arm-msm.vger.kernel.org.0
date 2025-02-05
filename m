Return-Path: <linux-arm-msm+bounces-46924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9888A28517
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 08:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 179D33A72F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 07:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24FB229B36;
	Wed,  5 Feb 2025 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N/3kbVUf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B193229B2E;
	Wed,  5 Feb 2025 07:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738741683; cv=none; b=HU8+qlNzZtI5tW4SN09W/J/3bcXGURHFx57w+W0jN5E11wDceIXaLDTE1alLrV0lT6Kd3u+UFpoQTYS0giK84v0uCkHkHaieVsB7slzkKCsnj+H3aRWAT9vI+HxnXmQslLtOkxuE6OiaIcynlWfoJ+jjnvVd3fIbS/w67QNOoi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738741683; c=relaxed/simple;
	bh=Utxw0SnMEG/YDKtxtjuk/OikaSc4nnjrllltus4vBqw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ld7/ClyS4cL6CxVXFBErLFt+5Vxe5VmS6EZLjItl4lrYaA9BxvrPGICB4WGa6JM5UIyuBqVJuOtDbgJdwMCc/cY7SFR+wT3BuNbzapdl1Y/RsP0KEnB7aRDNf/Eog6bUcHwyT1yYgq6wU2xKbWJyNqA/CXI30r1v63vYEA5AMb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N/3kbVUf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5156pXcM018149;
	Wed, 5 Feb 2025 07:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EhGfTlbKs/r3ujMgHUZ9vptMwV2xOc1pfaHW734jJ4=; b=N/3kbVUf5zT9kDO3
	NF0fLyEspCGX96BgXCKymgBbbvzGvOb2oys2MACHDPASazzAMIxO8NVmVZEG2lFf
	aeiMJNiBTIK9Pvy6vN7WgNBRb+gKbJje11fPwhtY14/IZHHwiuaN02GcxVrPvqns
	Fco+2ZxsGsdwAkLnqp/gaXxCbWVYWlptraenvxSFHQAeBcd7ip6C16UkBowfyoba
	7qC0Quin3beyYhCt6F7QHTRkKUSlufMfK+0jhq8Hv8pc2u445OGUHAD+FG63M7qL
	aNchVWZUsi6iY0FEVvcp6n2WNz1XBgzqBJNEnsQ3mVUjJQVJ4MvaNZwTKpS9SNVx
	NElD2w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m33b83sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 07:47:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5157lvX8015671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Feb 2025 07:47:57 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Feb 2025 23:47:53 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <quic_varada@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <stable@vger.kernel.org>
Subject: [PATCH v1 2/2] arm64: dts: qcom: ipq9574: Fix USB vdd info
Date: Wed, 5 Feb 2025 13:16:57 +0530
Message-ID: <20250205074657.4142365-3-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205074657.4142365-1-quic_varada@quicinc.com>
References: <20250205074657.4142365-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AZ6tG7GHMTBPuFxj8laziaxQPGY2Kl5I
X-Proofpoint-ORIG-GUID: AZ6tG7GHMTBPuFxj8laziaxQPGY2Kl5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_03,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 mlxlogscore=614 clxscore=1015 impostorscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050061

USB phys in ipq9574 use the 'L5' regulator. The commit
ec4f047679d5 ("arm64: dts: qcom: ipq9574: Enable USB")
incorrectly specified it as 'L2'. Because of this when the phy
module turns off/on its regulators, 'L2' is turned off/on
resulting in 2 issues, namely 'L5' is not turned off/on and the
network module powered by the 'L2' is turned off/on.

Cc: stable@vger.kernel.org
Fixes: ec4f047679d5 ("arm64: dts: qcom: ipq9574: Enable USB")
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index ae12f069f26f..b24b795873d4 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -111,6 +111,13 @@ mp5496_l2: l2 {
 			regulator-always-on;
 			regulator-boot-on;
 		};
+
+		mp5496_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
 	};
 };
 
@@ -146,7 +153,7 @@ &usb_0_dwc3 {
 };
 
 &usb_0_qmpphy {
-	vdda-pll-supply = <&mp5496_l2>;
+	vdda-pll-supply = <&mp5496_l5>;
 	vdda-phy-supply = <&regulator_fixed_0p925>;
 
 	status = "okay";
@@ -154,7 +161,7 @@ &usb_0_qmpphy {
 
 &usb_0_qusbphy {
 	vdd-supply = <&regulator_fixed_0p925>;
-	vdda-pll-supply = <&mp5496_l2>;
+	vdda-pll-supply = <&mp5496_l5>;
 	vdda-phy-dpdm-supply = <&regulator_fixed_3p3>;
 
 	status = "okay";
-- 
2.34.1


