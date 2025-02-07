Return-Path: <linux-arm-msm+bounces-47082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B23A2BC5C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 08:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E05F7188A58E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 07:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7812343AA;
	Fri,  7 Feb 2025 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VB/G72Tp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3723314B;
	Fri,  7 Feb 2025 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913773; cv=none; b=TC3N9XH0/6yxLdS++JUAv1Z88cK02is6t7SFae2QVmXXVc6PiptD4WcGXKZ7QXiGn5yhMQu2rTuqMutkBmVN81vsWZLvkL5eBDZvdcuHi+1PrpcROKbwHiHkctyM55KBleX6voHE7Z9ZNCAgxuuZrGA+WBnehCD5BIYiJoATuA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913773; c=relaxed/simple;
	bh=RdGyS8jaw44PMA61miWKAPXqq6Yi7mgYznTKZi/WWRg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s/aMNME05xGIjA96xhgC4GjQM2TIEixLX/ZlZB4SaFFdl36Y/CRBQrr9yyQ11bAMsIqCsrr51mgUoCnw+/JD7pxiFWQfqcFoTHULzgi4e8Ty5ukUGv7d/wmzSQav9C7ZEyq6mypKFUdr3h96Nj/Yc04ui25ToUm4ByJhxprCb5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VB/G72Tp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770d3G030052;
	Fri, 7 Feb 2025 07:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NiBWk9DCWoTA6Jx4lMjL4VvqiISHv3+Bj4lyIuOygqI=; b=VB/G72TpsoD0sGp3
	aD8o9bqGv3B9ug+iJLyvJzkirlMv0+ywLLMhc7Tz/9B0hHd8hsD/OJjKxjqOivVU
	WHqSSVCdxjsSrzj5kRuw6apLaXDDj8j8PewrqfGqifwHV0EWKKypbxu1AGol6FMD
	Ub6JR4y4kzoRkq8CQrO/NfK+YUqdlocEUkFIUFMQxwP6ehVCNWkzq84YiE/b4Jkb
	GauPNJ3IeTsBe7qiUWY2Q34j+znjBx+ysEQMCb5327z7XrcLgpEUYvExOG6WoBom
	lDtoUgU2kQAiH5tz6z6O0d6j0bapa4yTnxfvtoI3ocjTN0D22nGu8GkHFZpOsg0H
	6pPXig==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddjg2ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:36:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177a6Ja011963
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:36:06 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 23:36:03 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <quic_varada@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/1] arm64: dts: qcom: ipq9574: Fix USB vdd info
Date: Fri, 7 Feb 2025 13:05:45 +0530
Message-ID: <20250207073545.1768990-2-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207073545.1768990-1-quic_varada@quicinc.com>
References: <20250207073545.1768990-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -_-VQ57lHgFkyf7Nu7RvrO9sywskYB18
X-Proofpoint-GUID: -_-VQ57lHgFkyf7Nu7RvrO9sywskYB18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=715 priorityscore=1501 clxscore=1015 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070057

USB phys in ipq9574 use the 'L5' regulator. The commit ec4f047679d5
("arm64: dts: qcom: ipq9574: Enable USB") incorrectly specified it as
'L2'. Because of this when the phy module turns off/on its regulators,
the wrong regulator is turned off/on resulting in 2 issues, namely the
correct regulator related to the USB phy is not turned off/on and the
module powered by the incorrect regulator is affected.

Fixes: ec4f047679d5 ("arm64: dts: qcom: ipq9574: Enable USB")
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v2: * Reword the commit message
    * Format to 72 chars
    * No code change
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


