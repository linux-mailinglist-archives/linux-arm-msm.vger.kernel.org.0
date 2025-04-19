Return-Path: <linux-arm-msm+bounces-54785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C3A941BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 07:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4380319E7CF0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 05:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E74172BD5;
	Sat, 19 Apr 2025 05:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsLwM/GA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA718D643
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745039992; cv=none; b=kjqueqFzxp8522EPf6gfSuprGYoQkQXud5857diei8X9qeITRVv0u0oCekQX6f8ZRrixN/HJOzwpS8u/CAcVFQqKKdsPp0m9TNaPdoyhi2slbHaN42Zr4H3dgF2jK/7tOnYgOjMP8oBw9dYYqkvduY1yaNBjvPydPMNeffcAk6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745039992; c=relaxed/simple;
	bh=3DnAtxNAZDqNQqcmKUvx3DsvQPY0Kl35D9B1JCC1B6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SMKEKUpgFXlRI4SvPZMbGKNh4EMCW/1HPAXX6RCJNys4ByO3VZFhk945JJBA7gQRfdZ9KZR2tbPPy/X/B5c6I/G2ERdXe/1mVgTdm6Rd2zPFLLLxVthi0QZYXRqeYKpx63aCelleu94g85ZUzk2PaNYYneWg86udf7H+ABkdG04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsLwM/GA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53J3oNjA023524
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A1E51ikRCckN3+MRKz4vJMd+7q93fNBoH3GorSYwEec=; b=GsLwM/GAh8tkbf+K
	my46CeZWf0wqzJuHOg2NxtV+cO/Y1TAHsE83FhArRpYlsMW8EFPNpIyIRYXDPVXT
	JxUWslA1m24r6cdVLIprGClbDNPgC2inP87YfsRxNUqAmMGqOoPP7FnEmHnFvCQ1
	cWLszwJD8WLbgiqAhlZ0QXtYlTHjgrEkLjSJRUi4nprrUWX6Dy4BdZHU9hsqCfRL
	GkKrupESNXoenzRhEKnu+2QPkF9QhsOETIA9YBNZAlwbVgqNEc2zcQ/AVuXc7E1a
	duHBZGfTfBaRE0N/+hL2KT5NLYQhfgI4TcbFya1LA0P3qxY5Cl4np/AIToxtlVYk
	606Dcg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426g31n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:19:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af5156fbe79so2516465a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 22:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745039989; x=1745644789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1E51ikRCckN3+MRKz4vJMd+7q93fNBoH3GorSYwEec=;
        b=QnNqAz3xelNfBrAxCBa+UNKHMQmDcLHajt+Xm69kDBMcUBP/W8+AEj6OU9FOYhpLJm
         EJt+PjHc1G5NpzBoDEonMHRcqeWRO/UfNLPBh2F4cNttfwiz7F9F/5AGEViprRcV2Zgy
         DrYvsaAY7I4mEv+ivE2NfZnCmbm+o6t6tj2e8hzXan6s5kJRsLu2pnebxqd1o/xxQMBH
         3lZSQTlB831AUGbawNzVSJDtiuhYK+a5QhKleJkdTxwiblDoL4trSQcJXUF0cihvRTtq
         3dXvZ5dY6/mU8H5uHL0jNQJj4RVbJOfZwBGoiV2fSmGnPTQl7y5G0TjULnu3Pa/x96rS
         cy0w==
X-Gm-Message-State: AOJu0YxP/SDOzusNkqhz0xuV7Mya3OCQHM7nV+oAZuZKhjv90kTiB4hM
	A770AGplwr7xAwLPdgdN1TLAycsQ6bLB/A/oA3irNjBuy1dUCM9GQYsV+LUtNZbZ0Pp1953NRSt
	1w1v7tWcd/d6TuynDN2ZHZp8t0W4BOR0RoPwjcxj6yBbOiok9uW8IXvVE5JmsxAzt
X-Gm-Gg: ASbGncvn1y6Og0VpUBVCo1XYdR2c5EIS2uiMAbnIL6DQ1vqTPv2T8CB4PE0pJ15ddGk
	tsJ5ZbUtS9Ab2HVUgKilOPMQeVGVsN50bl0jLJQJ6H9Cpt4YMY9/qx/R/zR23HwK8f2e0zce26U
	e0sVtBj9AXmkAHcpQoAwKyLORo6hlxQiwiwymb2kjrnQmIWZ59LIYWrDxdi5EuEZRmayrLpbR+i
	JlJ7LN5xuYSQqo7f90rX368wCjhHG9sfraQlxOH4EjYrSOGyQmGmnaCc8v0MeFlqRTP0VwgsV15
	JoCbCUkfUb2SxP7v61GvQdFXDhjYCtdFVSZI0/KMZaAG2as=
X-Received: by 2002:a05:6a20:c90e:b0:1f5:9098:e446 with SMTP id adf61e73a8af0-203cbc0573emr8333328637.2.1745039989174;
        Fri, 18 Apr 2025 22:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRbu7EqDkT1Nj/uU8mVqGS+zdhQm81Ykk2C//aenToa25p2Tc/dc5T7ALGhEC7c4FKDOyS6w==
X-Received: by 2002:a05:6a20:c90e:b0:1f5:9098:e446 with SMTP id adf61e73a8af0-203cbc0573emr8333308637.2.1745039988817;
        Fri, 18 Apr 2025 22:19:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaac258sm2607932b3a.144.2025.04.18.22.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 22:19:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 19 Apr 2025 10:49:26 +0530
Subject: [PATCH v3 3/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-perst-v3-3-1afec3c4ea62@oss.qualcomm.com>
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
In-Reply-To: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745039969; l=3429;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3DnAtxNAZDqNQqcmKUvx3DsvQPY0Kl35D9B1JCC1B6M=;
 b=DkSLSP7iTAUMhyijELwXlNgBv5oqQeFeYWwepFB2dZoS6R8mMcJt/WlFR72Rni98O5mLUSOEt
 I91VDY8Pa5yA8+u/2AHDaN1UzlvOeEfsYAXRomY41Exvys59O681HAi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: UiLIRTBEaSWPpnvof4V-ApQ6Vu08vP35
X-Proofpoint-GUID: UiLIRTBEaSWPpnvof4V-ApQ6Vu08vP35
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=68033276 cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-19_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504190040

There are many places we agreed to move the wake and perst gpio's
and phy etc to the pcie root port node instead of bridge node[1].

So move the phy, phy-names, wake-gpio's in the root port.
There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
start using that property instead of perst-gpio.

[1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   | 5 ++++-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 ++++-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       | 5 ++++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi           | 6 ++----
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 7a36c90ad4ec8b52f30b22b1621404857d6ef336..3dd58986ad5da0f898537a51715bb5d0fecbe100 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -709,8 +709,11 @@ &mdss_edp_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 2ba4ea60cb14736c9cfbf9f4a9048f20a4c921f2..ff11d85d015bdab6a90bd8a0eb9113a339866953 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -472,10 +472,13 @@ &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_clkreq_n>, <&ssd_rst_l>, <&pe_wake_odl>;
 
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&pp3300_ssd>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+};
+
 &pm8350c_pwm {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 7370aa0dbf0e3f9e7a3e38c3f00686e1d3dcbc9f..3209bb15dfec36299cabae07d34f3dc82db6de77 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -414,9 +414,12 @@ &lpass_va_macro {
 	vdd-micb-supply = <&vreg_bob>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&nvme_3v3_regulator>;
 
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0f2caf36910b65c398c9e03800a8ce0a8a1f8fc7..376fabf3b4eac34d75bb79ef902c9d83490c45f7 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2271,9 +2271,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc GCC_PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_clkreq_n>;
 
@@ -2284,7 +2281,7 @@ pcie1: pcie@1c08000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2292,6 +2289,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.34.1


