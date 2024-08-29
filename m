Return-Path: <linux-arm-msm+bounces-30007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A8964403
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B51FD2878F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99356191484;
	Thu, 29 Aug 2024 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d1SbyzOe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB214B96F;
	Thu, 29 Aug 2024 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933571; cv=none; b=Y2+toUV+/lLLH+qEXjcan85ezqpvbNub2qqzS+iJg4EMoQBGXxypNuD3V8zspfcQyJVAgprBcTBEInZPxd6f6pDI6QEdS1cNurYT6WgZ1QrqW6Q8Zlg3UNtIwTFt6vz1wJ8bdHFyn1Ypt+GdtQwYFbMIIx2vnN9Ti07IvZW5sFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933571; c=relaxed/simple;
	bh=9N9+0n+b/Oa7kbni7tVHqg5SPKO080u3lLNyCG6/hsA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o/NdRsDz70D4KTl1V3tSmy6+sU1FeQav1RKs+RIb2xstQb7erCfP+MGvvPmHa6+7ccUuHlpj1qixwYgAVaGenowy9hmps0VFjhicGsf8NjJ/99cd+t8+ZD+8LJCgWdqHarKcLamsyV36udTNXrbGuQy4+wQVMYff2UrBOSONeEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d1SbyzOe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8msFB014501;
	Thu, 29 Aug 2024 12:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=j1AWm7Q3h9bAi2EtqGHGnN05xWoDUjTdPNV7xpiZeSs=; b=d1
	SbyzOeWJPGAa7V1zah6tLLQTBy2XSGObd2Q3JktGQPyCiMXXaNissxANdk+atvqY
	ZehvMymkPv59U3/qE35KtZc6d4uivjcr1roAbT4zxEOvdJAMzGMg642abA3kA20I
	G6vuLYmrXo1R6mymhkiREhfnKWQ9KrasMxoyWm4PQAdu1OmwxYq81za/x8IZjYGd
	Z3hr3cx0q+g9DCVBuN+jV4jBO5FaqtUZwAe6EzcBg7d4BUAjsLX65sRXDX+W7WIs
	qMepK9nirp66uka1wZsZtR9LmB+7k7ZnEvwsr/FkGWC1oKhK0jlpZYUy7nHQvsv+
	SdcxxYeMUtExaj1xKRag==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv154nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 12:12:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TCCjs1004812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 12:12:45 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 05:12:40 -0700
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_sartgarg@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
Subject: [PATCH V3] arm64: dts: qcom: Add SD Card node for qcm6490-idp
Date: Thu, 29 Aug 2024 17:42:25 +0530
Message-ID: <20240829121225.14184-1-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: osKVRCWzOR-qbQ_aOJBzz2Glexozze2y
X-Proofpoint-ORIG-GUID: osKVRCWzOR-qbQ_aOJBzz2Glexozze2y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=709 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290086

Add SD Card node for Qualcomm qcm6490-idp Board.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
---
Changes from v2:
 - Corrected patch version.

Changes from v1:
 - Define sd_cd node. (Thanks Dmitry)
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index a0668f767e4b..95d5cf2d9bcd 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -641,6 +641,21 @@
 	status = "okay";
 };
 
+&sdc2_clk {
+	bias-disable;
+	drive-strength = <16>;
+};
+
+&sdc2_cmd {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdc2_data {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
 &sdhc_1 {
 	non-removable;
 	no-sd;
@@ -655,12 +670,30 @@
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
+
+	sd_cd: sd-cd-state {
+		pins = "gpio91";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart5 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>, <&sd_cd>;
+	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>, <&sd_cd>;
+
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_2p96>;
+
+	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
2.17.1


