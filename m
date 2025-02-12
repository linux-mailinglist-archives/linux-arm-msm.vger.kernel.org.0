Return-Path: <linux-arm-msm+bounces-47750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E807A3250D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 12:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E88F3A2CFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7F2209F46;
	Wed, 12 Feb 2025 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EhKzYmaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C31E205E16;
	Wed, 12 Feb 2025 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739360043; cv=none; b=ThSm9EqfcBj4ylG7BQeRgGd7ydfI1pyXv94onixVMD71KXDGnMH1i59SGafem8jJb8h+ioRxf5o7QwM+Z78HcuPb3MEaGEhJSGuW4X9JnY/C/n3GION82+40M+ANkPqCQpnpWxV+MGbU4F30tQ4l0jnHuiXuAPaa773tStqmXwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739360043; c=relaxed/simple;
	bh=Kl9uSHy1YsmOUXOxd5pp5qBC/nEeUs7ScD2erF+GgIM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vca+Iur/3fOddBC6JI6NzDAooVetUw3v2NySDuEg19wQ207H1mvv+kgK9SRYNOzlH/AwY1Deq44VZLpqJ4eOM7OT916xRl0xUYVycIzF9LtcnMRpIl7G7FGS59+O5u3yls0FB5amNtDTM2O6H8W6DLeKkWTz1wKhFy0SZeNNWoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EhKzYmaF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C6721W006115;
	Wed, 12 Feb 2025 11:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U7vfdJrgpLXzf7IGPKeCWF
	hsGLope4so7q/iE9mgwo0=; b=EhKzYmaFdr7/PYS/x5Os84VInET7VyXfJ+m1u4
	B+oA3vE/V2gDRca+Fz/WfQIJhgTV+UR7kKiYMDEREoGRNEhMhrUdTGM2nw7373ct
	HB+7C4RAnxd4+p1cMTmopglQXmu9AbQy9bWk/++WGH2XgiYfPvNvs8L+rBEbUgCp
	x1ReAmXiJl4hAZu4jYZO6GMMFeZP9c25W/RHdDdkhR7KJzW80ZaGGIEK8q7RPOZi
	lBu45tot8L2gu91wYXd00PjXdtFVz98SIJJ2vQjQo+HiJ+xX5TbxnQgKhn8wEr9J
	jyWcOJM+DvBLv7/4C+xdQQ77fr7mlgqmRkeJNtiAeQPN8N5Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5myc1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 11:33:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CBXukk008772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 11:33:56 GMT
Received: from hu-kotarake-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 03:33:52 -0800
From: Rakesh Kota <quic_kotarake@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <konrad.dybcio@oss.qualcomm.com>
CC: <quic_kotarake@quicinc.com>, <quic_kamalw@quicinc.com>,
        <quic_jprakash@quicinc.com>
Subject: [PATCH V3] arm64: dts: qcs6490-rb3gen2: Add vadc and adc-tm channels
Date: Wed, 12 Feb 2025 17:03:42 +0530
Message-ID: <20250212113342.873086-1-quic_kotarake@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RNyJkEh9ne1EUIWDvGHUVim22sWU-xGT
X-Proofpoint-ORIG-GUID: RNyJkEh9ne1EUIWDvGHUVim22sWU-xGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=922 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120089

Add support for vadc and adc-tm channels which are used for
monitoring thermistors present on the platform.

- Add the necessary includes for qcom,spmi-adc7-pm7325 and
  qcom,spmi-adc7-pmk8350.
- Add thermal zones for quiet-thermal, sdm-skin-thermal, and
  xo-thermal, and define their polling delays and thermal sensors.
- Configure the pm7325_temp_alarm node to use the pmk8350_vadc
  channel for thermal monitoring.
- Configure the pmk8350_adc_tm node to enable its thermal sensors
  and define their registers and settings.
- Configure the pmk8350_vadc node to define its channels and settings

Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
---
Changes from V2:
 - As per Konrad Dybcio’s suggestion, removed all default polling values.
Changes from V1:
 - Update the Die temp name to Channel as per Documentation.
 - As per Konrad Dybcio’s suggestion, I have sorted the pmk8350_adc_tm
   channels by unit address instead of alphabetically.
--- 
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 108 +++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 7a36c90ad4ec..fe2d14865a75 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -9,6 +9,8 @@
 #define PM7250B_SID 8
 #define PM7250B_SID1 9
 
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -212,6 +214,44 @@ pmic_glink_sbu_in: endpoint {
 		};
 	};
 
+	thermal-zones {
+		sdm-skin-thermal {
+			thermal-sensors = <&pmk8350_adc_tm 3>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		quiet-thermal {
+			thermal-sensors = <&pmk8350_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		xo-thermal {
+			thermal-sensors = <&pmk8350_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -745,6 +785,36 @@ kypd_vol_up_n: kypd-vol-up-n-state {
 	};
 };
 
+&pm7325_temp_alarm {
+	io-channels = <&pmk8350_vadc PM7325_ADC7_DIE_TEMP>;
+	io-channel-names = "thermal";
+};
+
+&pmk8350_adc_tm {
+	status = "okay";
+
+	xo-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	quiet-therm@1 {
+		reg = <1>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sdm-skin-therm@3 {
+		reg = <3>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
 &pm8350c_pwm {
 	nvmem = <&pmk8350_sdam_21>,
 		<&pmk8350_sdam_22>;
@@ -789,6 +859,44 @@ &pmk8350_rtc {
 	status = "okay";
 };
 
+&pmk8350_vadc {
+	channel@3 {
+		reg = <PMK8350_ADC7_DIE_TEMP>;
+		label = "pmk8350_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@44 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		label = "xo_therm";
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,ratiometric;
+	};
+
+	channel@103 {
+		reg = <PM7325_ADC7_DIE_TEMP>;
+		label = "pm7325_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@144 {
+		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_quiet_therm";
+	};
+
+	channel@146 {
+		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_sdm_skin_therm";
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
-- 
2.34.1


