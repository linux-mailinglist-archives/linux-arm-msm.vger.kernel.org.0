Return-Path: <linux-arm-msm+bounces-35685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A16679AE69A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 244041F269D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8D81E571C;
	Thu, 24 Oct 2024 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B2udlmzN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922211E283E;
	Thu, 24 Oct 2024 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776553; cv=none; b=XeA8KVcn+cWamJrzlJQwfhT45G02UXtfa4frcfjJUthoOMVUJG4gRj7xVA6sPIrH6+pmqvkh8xmIldBP+qfhQ0Ao5tdxPLVSKOYdXDesSBbO3zFIKrHw8HJ5MH4ud5CrfB4eM12EgMLenqxss0u8XAW9qLTuVRBkbRvbepgRONM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776553; c=relaxed/simple;
	bh=C0PxOWxUABIbn4bVZ3b0fcNoLUZA3VjDKbwBoXarrJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=AZHmPpfwB8B5kMI1Rm365yWmNyxlYKfDrddqEhHsRNckFjJXd858w0x6m7EyuBuoKzNnyCSfsEKjHYHHvdhhm7B07amSqU4vRfhcV6rdp4YH0ojcudLEswIwPH7ea9deit9R/gecodT5dPtj+Z+Ndu4BaQusBTC0Rk9kTg+/tMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B2udlmzN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O8t7gY008302;
	Thu, 24 Oct 2024 13:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uXXd+3C/en7TMKshOhY0fw
	ftSpV48iCJnEoz8d9zI74=; b=B2udlmzNpOt176I0qeDiGvkdk/mPx9UK5rqfTg
	k9jIlpkJMm4N2HYIyjfbXmBuyKmdegcNwTQZLUeoZquj6eSVYtU+RJy2h+uaqeZa
	WUZqvuIhN1xEwLXPRl5khRovk4u6ia8PFN9MwBhpAnr/5/34jBcYeWHG1WylI7E9
	QqytWh8V23Jt4BwcOaCb0KcQjhbBGrg3TGZdOIpEUGbOYHyM7dCOtYetbrjga5ny
	OK9fiFSeAZPpiOlFyznWtjPh69pALabfETOZE0NMu0kCN1Y+Sihfogu7/m6EHJX/
	Ku5k/1/9UGALdYHABYwSl5hk4zpulka2LhlP+mlU8Fuoa9JA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fk52gp06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:29:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ODT4mp020862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:29:04 GMT
Received: from hu-krichai-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 06:29:01 -0700
From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Date: Thu, 24 Oct 2024 18:58:49 +0530
Subject: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Add PCIe nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-enable_pcie-v2-1-e5a6f5da74e4@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJBLGmcC/x2MQQqAIBQFrxJ/nVAiUV0lIkyf9SFMFCIQ7560m
 MUsZjIlREaiuckU8XDi21eRbUPm1P6AYFudZCdVXxHwer+wBcMQVhoMDtqOaqJahAjH739b1lI
 ++LUe3l0AAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <dmitry.baryshkov@linaro.org>, <manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krishna chaitanya chundru
	<quic_krichai@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729776541; l=2802;
 i=quic_krichai@quicinc.com; s=20230907; h=from:subject:message-id;
 bh=C0PxOWxUABIbn4bVZ3b0fcNoLUZA3VjDKbwBoXarrJU=;
 b=kjX7518Dz+LIvuH+cQcXXxxmPl9mP3DDLW2fsdTbh8m+eWV1GlZAW9hd9/1pORcxF4nrAx3/j
 eb2sPyJ+PLaCmLvZFhuBrXea9DYFRLXMNSxn3h/hVcxTXvXloBHSxl8
X-Developer-Key: i=quic_krichai@quicinc.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wgG0x__IrmCstQcsGp5Iieb0KdTrZAPi
X-Proofpoint-ORIG-GUID: wgG0x__IrmCstQcsGp5Iieb0KdTrZAPi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240110

Enable PCIe1 controller and its corresponding PHY nodes on
qcs6490-rb3g2 platform.

SMMU v2 has limited SID's to assign dynamic SID's with the existing
logic. For now, use static iommu-map table assigning unique SID's for
each port as dynamic approach needs boarder community discussions.

PCIe switch connected to this board has 3 downstream ports and
to the one of the downstream an embedded ethernet is connected.
Assign unique SID for each downstream port and to embedded ethernet,
and also reserve a SID for the endpoints which are going to be
connected to the other two downstream ports.

As this PCIe switch is present in this platform only update iommu-map
in this platform only as other board variants might have different
PCIe topology and might need different mapping.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
---
Changes in v1:
- Rebased on linux-next
- Update the commit text to summerize the discussions on v1.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20240207-enable_pcie-v1-1-b684afa6371c@quicinc.com/T/
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0d45662b8028..2d14bdc1ff2d 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -684,6 +684,32 @@ &mdss_edp_phy {
 	status = "okay";
 };
 
+&pcie1 {
+	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
+	pinctrl-names = "default";
+
+	iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
+		    <0x100 &apps_smmu 0x1c81 0x1>,
+		    <0x208 &apps_smmu 0x1c84 0x1>,
+		    <0x210 &apps_smmu 0x1c85 0x1>,
+		    <0x218 &apps_smmu 0x1c86 0x1>,
+		    <0x300 &apps_smmu 0x1c87 0x1>,
+		    <0x400 &apps_smmu 0x1c88 0x1>,
+		    <0x500 &apps_smmu 0x1c89 0x1>,
+		    <0x501 &apps_smmu 0x1c90 0x1>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };
@@ -819,4 +845,20 @@ lt9611_irq_pin: lt9611-irq-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	pcie1_reset_n: pcie1-reset-n-state {
+		pins = "gpio2";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-disable;
+	};
+
+	pcie1_wake_n: pcie1-wake-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 };

---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241024-enable_pcie-d2ce6fead849

Best regards,
-- 
Krishna chaitanya chundru <quic_krichai@quicinc.com>


