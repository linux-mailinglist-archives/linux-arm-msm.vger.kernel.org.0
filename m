Return-Path: <linux-arm-msm+bounces-74825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D66B9CDC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA5247B723D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71FC22541B;
	Thu, 25 Sep 2025 00:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZkPuwwIJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E407221F1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759473; cv=none; b=TtWY+nk0ziK1fCVfc+mOggBnudzWUaHw4q0cjvodhNgxkUOJVrHbuMSpjSeSA2iRGPenY3eurajnKJH1WLltJWyZYhgqRTG71x9okDUmwQDHbDSLh8SWbGd6MITDE3wZ8esYZemyAoAn/Csi/ldjc1cgZKKnYe69Xz7cZ1QOw9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759473; c=relaxed/simple;
	bh=z0Z037hWw24cVUBzVLZT+qquWCEvTOnLgmp+A69jpvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePp/BtWgq9WUCjlvH0OQAH5Q4VaiwLrLkvV8m5SwIzLwaGBtjdNnFZ4EKojw7i4bbo6FblEUp4NGqecOPGSwZ44tbQgFI7LdaCnYyGo6trvN5ek3+dEeXaSDiEburxnRgNFtC2DLWvvZYAg6lIvsqsFw6Is55jaH0F3QvrU6aBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZkPuwwIJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODHsRI002079
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dC9WcuvfrSdegkoU/V3Q0oXCsMA3pUWVicoX7Ds1cWM=; b=ZkPuwwIJk98ug38L
	Y+GMorhK/Y/6vOAvZXM272FGOwWc5Q1MiOvPa39wkiLu4JaGgbYV+HwdYD92+wIY
	t31R55PYX6Rn+lPiEpZhyoavG1WLhsRdpv+b579l3T1aIxNUsOAgqomVYPHIVG5I
	2NPluPf852l8pD7JXxIjDW9oQDSgYrs4fCpJSGy2gA7PApGEma20DYUv5rw+g6Od
	mvw6aK7QWzzi3GvIcichuOkqTOvg4And/vXHSSLQeigSo7rb8JOt1KYZLwvJQQ+T
	+dTKQnEf/KNw0j+LQQ0I1jLHG3SHPZSq4pqjEA1s9kmacZElbF98NKckmwBX19ng
	/V61Jw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p5fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-781044c8791so37712b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758759469; x=1759364269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC9WcuvfrSdegkoU/V3Q0oXCsMA3pUWVicoX7Ds1cWM=;
        b=McWjDWi6DPvfnDQoACrngKaIPOeAQcwCIYEEMb1syccKqhOSnI7FWSomFa9aBCDu7a
         IPwvmFXW5cgcsCqZbo8nbZ4oRSfOYVJjasW5u4TofNxgdKTEXOV6mPWCntd3ydRahj8T
         yOf31lNdD39jcUgkgFd7fUzPSz/ogKS3XTmJZyBh9Pjc8vf4nNla4n3VM5lKrmOvse0J
         v7XDiejyUnrD10/yfVvMKTyCSmFwxV7/dUT7kTWOo5elWbjjpX9IUrmeDM6eEhT25ByG
         aQtAAEEr/LPS4JxG6rivNzX+PeyLjZ2By4agmUmO2jnxvgHgzcj1iZuQc9/IuaGiuCXt
         JxLw==
X-Gm-Message-State: AOJu0YwSd4WmgQOOnZP/RDBXjPIXZbcKWnpmdBD8YGbq9DJmnMsc0him
	Uusa3SXeJlABBrdyW9xzFl4vE2vjt/BmX9g7tR+4oEnQ3YyW7syfEYVfomy2ZQrBLt3jalp69UV
	tnYRcZIgpN+vRQ8FZxMM+IjLgcs129TO7Kt6tlPLoQuzArB3JAWlfjeE1BWzTHnLGfbWG
X-Gm-Gg: ASbGncu4CE9tOy66+SrD4pjMeGxtncW27eDTiboowz+waOeiQEJ1Eu46yndxIU7eqMW
	3dM2tu+GDeaO9a6gFZOb8qcSNjlQl2d7doEc4/wlEjWuDjtkluwv4p55xXjnDCEEQDR0PTQbMuB
	oofnW5Bfq/yInu3h5i5LFVcdHAyVd4YDdSN1X1w/TAobnnDk52Usfmjwos3u2rOqSosq536Heo9
	DHdSdmrv4wJFA1Dt+MnyM3VUlxrcIPtT2lMnT61wZiYD10Md207v8lfiJOqGuKhZy9I4ynypCWq
	QgUdJQzFwHwJlhZFXEeIIFiMPnSQsT3tEl0KqzbwQpV/85L8pScsFSB39TTlpvV1OKpdwT5fHDF
	hvSAqb6CWdFDrxSA=
X-Received: by 2002:a05:6a00:4b46:b0:77f:416e:de8e with SMTP id d2e1a72fcca58-780fceb5040mr1842033b3a.26.1758759468732;
        Wed, 24 Sep 2025 17:17:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5t41eGHGUdFo2rU4u5N91uxfuq0GLGcrTliVJuAjh3PUve0tJUZ9PP1PFX4PWHBJF/Ssq5Q==
X-Received: by 2002:a05:6a00:4b46:b0:77f:416e:de8e with SMTP id d2e1a72fcca58-780fceb5040mr1842007b3a.26.1758759468187;
        Wed, 24 Sep 2025 17:17:48 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e6fasm262748b3a.1.2025.09.24.17.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:17:47 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:17:31 -0700
Subject: [PATCH 14/20] arm64: dts: qcom: kaanapali-mtp: Enable more
 features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-dts-v1-14-3fdbc4b9e1b1@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758759448; l=15100;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=z0Z037hWw24cVUBzVLZT+qquWCEvTOnLgmp+A69jpvE=;
 b=NP+HLeCZflcZ34k25eMuZn789d9gbvUvaGo9IzidDhP+2WpN8BA4NiX7Olr/qI4Itle3agxg9
 5ZqceIEPATZBVy/rlIZqbMQH438dBvH4OxPnn+EDpR24DXWs+JeDBmc
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: HLrGPO70eESFR0cLJayM8bAicwwi_hG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX0G0P2dhrDM3h
 v/2JaarIh6ZfbJKAeTINU3yQKOpA7CQyiwFSUD1AygII6F1Voo+wFbrbZ0kseqTgbZRZX4e6bBJ
 kLfcT8W0FSrWkANv/A/UhV1Wz7ImQdviK1VsD8GgBA+kPbZa+f9VqCnjimmNG91A08T/pEhx3Cl
 3WEWfc1viPZ2hzieYfNEh0q5b2c5JyrGhAKftZb6NXMp4u2DmKMQKUB+jwKSoAu/KPubSvKDjjt
 N8WTT3gK33bBTwRU79PeGT7ZgtXq+p94mZsezAeVPLV+uNnECfPd+G6N6GitVUfCrr8QZWjKjNy
 YeyKueXYAFwgc+1mPYiZco6RGlH7/p2zpPX86MFZJ/1/L5tUOKzOa/nKcy4Wc7S9cOLUlDnqsQO
 V4cnLcXd
X-Proofpoint-ORIG-GUID: HLrGPO70eESFR0cLJayM8bAicwwi_hG3
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d48a2e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kSAxGx4E5t3efF1h-GQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Enable more features on Kaanapali MTP boards including PMIC peripherals,
bus, SDHCI, remoteprocs, USB, PCIE, WLAN and Bluetooth.

Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
(added USB), Manish Pandey(added SDHCI), Jishnu Prakash(added PMIC),
Qiang Yu(added PCIE), Yijie Yang(Added WLAN) and Zijun Hu(Added Bluetooth).

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 663 +++++++++++++++++++++++++++++
 1 file changed, 663 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9cf3158e2712..2949579481a9 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -5,9 +5,23 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "kaanapali.dtsi"
 
+#define PMH0110_D_E0_SID 3
+#define PMH0110_F_E0_SID 5
+#define PMH0110_G_E0_SID 6
+#define PMH0110_I_E0_SID 8
+#define PMH0104_J_E1_SID 9
+
+#include "pmk8850.dtsi"
+#include "pmh0101.dtsi"
+#include "pmh0110.dtsi"
+#include "pmh0104.dtsi"
+
 / {
 	model = "Qualcomm Technologies, Inc. Kaanapali MTP";
 	compatible = "qcom,kaanapali-mtp", "qcom,kaanapali";
@@ -15,6 +29,7 @@ / {
 
 	aliases {
 		serial0 = &uart7;
+		serial1 = &uart18;
 	};
 
 	chosen {
@@ -52,6 +67,304 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_vol_up_default>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	thermal-zones {
+		pmh0101-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0101_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmh0104-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0104_j_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmh0110-d-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0110_d_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmh0110-f-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0110_f_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmh0110-g-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0110_g_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmh0110-i-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0110_i_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmd8028-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmd8028_temp_alarm>;
+
+			trips {
+				pmd8028_trip0: trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pmd8028_trip1: trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmih0108-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmih0108_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmr735d-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmr735d_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pm8010-m-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8010_m_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pm8010-n-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8010_n_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
+		pinctrl-names = "default";
+
+		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
+		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s2j_0p8>;
+		vddio-supply = <&vreg_l2g_1p8>;
+		vddio1p2-supply = <&vreg_l3g_1p2>;
+		vddaon-supply = <&vreg_s7g_0p9>;
+		vdddig-supply = <&vreg_s1j_0p8>;
+		vddrfa1p2-supply = <&vreg_s7f_1p2>;
+		vddrfa1p8-supply = <&vreg_s8f_1p8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -674,6 +987,304 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&pmh0110_d_e0 {
+	status = "okay";
+};
+
+&pmh0110_f_e0 {
+	status = "okay";
+};
+
+&pmh0110_g_e0 {
+	status = "okay";
+};
+
+&pmh0110_i_e0 {
+	status = "okay";
+};
+
+&spmi_bus1 {
+	pmd8028: pmic@4 {
+		compatible = "qcom,pmd8028", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmd8028_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmd8028_gpios: gpio@8800 {
+			compatible = "qcom,pmd8028-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmd8028_gpios 0 0 4>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmih0108: pmic@7 {
+		compatible = "qcom,pmih0108", "qcom,spmi-pmic";
+		reg = <0x7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmih0108_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmih0108_gpios: gpio@8800 {
+			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmih0108_gpios 0 0 18>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmih0108_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+			vdd18-supply = <&vreg_l15b_1p8>;
+			vdd3-supply = <&vreg_l5b_3p1>;
+		};
+	};
+
+	pmr735d: pmic@a {
+		compatible = "qcom,pmr735d", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmr735d_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0xa 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmr735d_gpios: gpio@8800 {
+			compatible = "qcom,pmr735d-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmr735d_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pm8010_m: pmic@c {
+		compatible = "qcom,pm8010", "qcom,spmi-pmic";
+		reg = <0xc SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8010_m_temp_alarm: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+
+	pm8010_n: pmic@d {
+		compatible = "qcom,pm8010", "qcom,spmi-pmic";
+		reg = <0xd SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8010_n_temp_alarm: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0xd 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+};
+
+&pmh0101_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		function-enumerator = <0>;
+		color = <LED_COLOR_ID_YELLOW>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		function-enumerator = <1>;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>, <3>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
+&pmh0101_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
+&tlmm {
+	wlan_en: wlan-en-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio18";
+		function = "gpio";
+		bias-pull-down;
+	};
+
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio101";
+		function = "gpio";
+		output-disable;
+		bias-pull-up;
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		clkreq-n-pins {
+			pins = "gpio103";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio102";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio104";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&pcieport0 {
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/kaanapali/adsp.mbn",
+			"qcom/kaanapali/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/kaanapali/cdsp.mbn",
+			"qcom/kaanapali/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_soccp {
+	firmware-name = "qcom/kaanapali/soccp.mbn",
+			"qcom/kaanapali/soccp_dtb.mbn";
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
 			       <74 1>, /* eSE */
@@ -685,6 +1296,36 @@ &uart7 {
 	status = "okay";
 };
 
+&pmh0104_j_e1_gpios {
+	bt_default: bt-default-state {
+		pins = "gpio5";
+		function = "normal";
+		input-disable;
+		output-enable;
+		output-low;
+		bias-disable;
+		power-source = <1>;
+	};
+};
+
+&uart18 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+
+		max-speed = <3200000>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 217 GPIO_ACTIVE_LOW>;
 
@@ -702,3 +1343,25 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l4f_0p8>;
+	vdda12-supply = <&vreg_l1d_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l1d_1p2>;
+	vdda-pll-supply = <&vreg_l4f_0p8>;
+
+	status = "okay";
+};

-- 
2.25.1


