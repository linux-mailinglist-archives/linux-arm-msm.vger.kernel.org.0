Return-Path: <linux-arm-msm+bounces-46503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D89A21C81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 12:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7288C3A4147
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFD01D8A16;
	Wed, 29 Jan 2025 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CPs375ua"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855381D63CE;
	Wed, 29 Jan 2025 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151579; cv=none; b=H4fP/4mD1gEEu36dE9gSDJTk3IVY4agGFKoFwdPvmGyajMTQdva+XWta1L9HzTwjV5XM12ynkXXONi3wCikNSEqASS7Wa067FsR6GZOfyu3S5RONyAgFZiOT47CkDYuoM/YQQnJvHee3kMK+AnfEZChyJm69mgC5nxRwiIeIPcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151579; c=relaxed/simple;
	bh=TPYhsiGNBe0zj67MuYwYsH5Ln7hT3CrvcovyhXkc3Xg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PpZQrhjrtSdXmhV3rWFmp1M7wUaJdAHBcOEHrZm+KvaAJ7e53ZaHlCR7byeMryc6bV0D923iGEkKzy0JxRMmQXZMnLPYNv1JjoTzRGSgKsimx+fcwFZ1adz7zp1DxSxz3nRJ5wxjuEhU+J20fKff+t9XipPPy4VswKM8ZAVu8ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CPs375ua; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T8TZ5R013948;
	Wed, 29 Jan 2025 11:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=358xhYqGUWK78Sf6i+cyUm
	otcgttleyMvGoO/R9uzDI=; b=CPs375uaQjO3x86vpS4QLrVYvuLj3CwFSrm6Di
	Q6gnEP1l8MGwnumvKMTZdiUe9OWKCU7iMUzA8L47+E90D++h68MKqPkfypRKAkGz
	FGjJ0pKkAzR8r7uAawT4ij6CX0yQr0T/afrT22yDqYMpX6ZwQYaxjYWbXQhV8ywt
	klDE/Ez0Ax7vdidmNDdQZt6QIFxcApO60Xr7oxxlCLDJk/iP9Lro5wPkCPxL3uFP
	Wt1Do+64hRCU0CNKkHA7B6lJDnB+9DfEtIXnIYT8MMtLXWxVwb2fqF23ygx9vhYl
	xZ9c4QR1KV2wAKAdyeEg5QadpH7ZhIsjdlAbt6k8cszJUwUQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fguvgbb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 11:52:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50TBqqO4025983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 11:52:52 GMT
Received: from hu-kotarake-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 Jan 2025 03:52:49 -0800
From: Rakesh Kota <quic_kotarake@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_kotarake@quicinc.com>, <quic_kamalw@quicinc.com>,
        <quic_jprakash@quicinc.com>
Subject: [PATCH V2] arm64: dts: qcs6490-rb3gen2: Add vadc and adc-tm channels
Date: Wed, 29 Jan 2025 17:22:26 +0530
Message-ID: <20250129115226.2964465-1-quic_kotarake@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 2LMt4bhnOwDonqqnWyv0YCLNzaFhrHhd
X-Proofpoint-GUID: 2LMt4bhnOwDonqqnWyv0YCLNzaFhrHhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 mlxlogscore=942 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290097

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
Changes from V1:
 - Update the Die temp name to Channel as per Documentation.
 - As per Konrad Dybcio’s suggestion, I have sorted the pmk8350_adc_tm
   channels by unit address instead of alphabetically.
--- 
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 114 +++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 7a36c90ad4ec..54ad11d33b38 100644
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
@@ -212,6 +214,50 @@ pmic_glink_sbu_in: endpoint {
 		};
 	};
 
+	thermal-zones {
+		sdm-skin-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
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
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
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
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
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
@@ -745,6 +791,36 @@ kypd_vol_up_n: kypd-vol-up-n-state {
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
@@ -789,6 +865,44 @@ &pmk8350_rtc {
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


