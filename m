Return-Path: <linux-arm-msm+bounces-39809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF39C9DFD60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3C3A161B82
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CA51FBE86;
	Mon,  2 Dec 2024 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="etubyiUe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80E41FBCAD;
	Mon,  2 Dec 2024 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132293; cv=none; b=MOb7AWGNnKYHOIs2WYcQUim2KTRP9tkhftnvl9VgW74jUA/LgAWDBB3Z9OsExyC1vUpF+3FXto5pY9+54IV9qYcFXJgJiiryc9ifpitz9DUzHt81CQR4a3zN+lRROOiJx3lcTDrusPXkKDYxUW75PxXyAPn36S7U1QR/2AYRmpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132293; c=relaxed/simple;
	bh=Fp2C3/+45c1sY0z1mEHEJxj+4BTgS4dYOPDUsTxLzMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sqZNj+U7LQ9OBn+8Q5TBvzg12Jl7+hjFmRGDBbUn4ojozgFXx9TdPTd7Cl1FMO6XTfjFR3oqylulIozEhZAnLf34alyC5ARXKnFAP58RQZk34Z+QIDmvdrLv7knQFTMteQm50oSOXI+b6Gw94dMQWEY8dE42Ub7IcPEgCpLqeCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=etubyiUe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28ei1B017944;
	Mon, 2 Dec 2024 09:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6r5ghltPl9xvnj9X8uZ9hgM9e3yfSELcVYYSgQGHao=; b=etubyiUeZznDnCfs
	tKsRIabODqgHOhAYLnuuYLY9Ps2llwmmIH5bb38uHxp4U1dI7pC4K7nvQD8x4DRA
	s/64BvfKkmtEzEayhlKAR3E62qDLd6+lywQ3w3N69VYKm9wRhD9ieQ4gPfuixr8y
	e88WUWqJZLOrtrwGVcB/U84e1ff9YFu6ILMkAgrHGb6WlJTLwDu3qsPzu8jPQ+JR
	LLrte2GJal4ZV+Z5cwYmajxoxJRnhOo0smNEooY4/mZil+UfX1k3VktQReRADQQq
	7zBY8DOkvvCAZJyfH5KvqnpXJER8+U8zJLFV32s4bPi6+1YotYYNEKpImCoRnJnN
	aduMgA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstcayy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 09:38:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B29c6EK026903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 09:38:07 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 01:38:00 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Mon, 2 Dec 2024 17:37:23 +0800
Subject: [PATCH v6 2/3] arm64: dts: qcom: move pon reboot-modes from
 pm8150.dtsi to board files
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-2-bdd306b4940d@quicinc.com>
References: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
In-Reply-To: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, <quic_eberman@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733132272; l=7828;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Fp2C3/+45c1sY0z1mEHEJxj+4BTgS4dYOPDUsTxLzMg=;
 b=HFsjUTNteXGy5Gjfc+iBFNn2rY0LgxaQPx35sYUHg153YiYg22GwcYU6yxftxtMDUul/5cGBo
 ln/B/fifji6A6lQv1NNwbDmUDwU328WZFN+/eJ6zcU1p1tSgusUm4gX
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2SkvFPS2EKJn4lp8hZJfaw9md4qFpKQh
X-Proofpoint-GUID: 2SkvFPS2EKJn4lp8hZJfaw9md4qFpKQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=875 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020085

Reboot modes were originally managed by PMIC pon driver on mobile/IoT
platforms, such as sm8150,sm8250,qdu1000... But recently, QCS615 is
going to adopt PSCI to manage linux reboot modes, which involves firm
wares to co-work with. In this case, reboot-modes should be removed
from pon dts node to avoid conflicting. This implies that reboot modes
go with devices rather than PMICs as well.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi                      | 2 --
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts                  | 5 +++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                  | 5 +++++
 arch/arm64/boot/dts/qcom/qru1000-idp.dts                  | 5 +++++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts                   | 5 +++++
 arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts | 5 +++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts                   | 5 +++++
 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   | 5 +++++
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts                   | 5 +++++
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts                   | 5 +++++
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      | 5 +++++
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 5 +++++
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts           | 5 +++++
 13 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index a74a7ff660d2b1be0df0dc26d79e1921a3935f14..d2568686a098cb4d78573000b34840d8f5f674aa 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -49,8 +49,6 @@ pm8150_0: pmic@0 {
 		pon: pon@800 {
 			compatible = "qcom,pm8998-pon";
 			reg = <0x0800>;
-			mode-bootloader = <0x2>;
-			mode-recovery = <0x1>;
 
 			pon_pwrkey: pwrkey {
 				compatible = "qcom,pm8941-pwrkey";
diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
index e65305f8136c886c076bd9603b48aadedf59730a..82f6b4a3e24aa2caba90715e12bca25b693a0d65 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
@@ -239,6 +239,11 @@ vreg_l18a_1p2: ldo18 {
 	};
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &qup_i2c1_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 52eef88e882c356a62bf563fcd7ce3d54b5ea824..7afa5acac3fcf7cb6f8c5274acdc2e55192c1280 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -964,6 +964,11 @@ led@3 {
 	};
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
index 1c781d9e24cf4d4f45380860c6d89c21e8df9925..fe0b782aa3ff5f4b73e921880fc3cd9908398705 100644
--- a/arch/arm64/boot/dts/qcom/qru1000-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
@@ -239,6 +239,11 @@ vreg_l18a_1p2: ldo18 {
 	};
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &qup_i2c1_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index bac08f00b303ff6e6d47697f1cd9bff53efaf27b..6ea883b1edfa6c511730550f4db0cb9c25fc633d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -578,6 +578,11 @@ pm8150b_typec_sbu_out: endpoint {
 	};
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index b039773c44653ae8cd5c2b9fdeccbd304ad2c9e5..fc11ef0373c6920e970886ce2eb2c4f20c75154a 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -430,6 +430,11 @@ &i2c19 {
 	/* MAX34417 @ 0x1e */
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 256a1ba9494560b93dc324751ee8327f763aad90..2e1c7afe0aa7d4ad560dd8e5aab2ce835991cc9d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -358,6 +358,11 @@ &gpu {
 	status = "okay";
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
index ae0ca48b89a59f669e0f359e48632b335050a2eb..70fd6455518b9101ba25dda6e1fb5f87c1053a71 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
@@ -601,6 +601,11 @@ main_cam_pwr_vmdr_en: main-cam-pwr-vmdr-en-state {
 	};
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 1bbb71e1a4fc0f1289663165e0a8f7ef88d9b429..f5c193c6c5f9b4bf007a17926bcce319f2608706 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -373,6 +373,11 @@ &gpu {
 	status = "okay";
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 21b2ca1def8363cbaf7857215f42ff8492a8f7fa..7f592bd3024868c6ab4c9c61051d3f2cf5707a1a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -627,6 +627,11 @@ channel@4f {
 	};
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index f6870d3f2886fc68aaf914caecdd3a22ba249c5a..d8289b2698f37bce0501ac20c356bd5ae017e1ab 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -591,6 +591,11 @@ focus_n: focus-n-state {
 	};
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 3596dd328c31d6f0430fed343c7e2307147d21f3..0bf3d6a826fcbad9c84303e6016c4657c5f89ef1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -673,6 +673,11 @@ &pm8150b_vbus {
 	status = "okay";
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
index 86e1f7fd1c2058202c9506d7e737fadabf476d5d..668078ea4f04a7ead052d28bf111be6daf25805f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
@@ -554,6 +554,11 @@ vol_up_n: vol-up-n-state {
 	};
 };
 
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.34.1


