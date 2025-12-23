Return-Path: <linux-arm-msm+bounces-86341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7633CD9469
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 13:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DEB43026BDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 12:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC59432E699;
	Tue, 23 Dec 2025 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6QcCRty";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gq70a+RV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E297A332EA3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766493238; cv=none; b=V4oukjWH1ydBqcmdnh99BaU5gmuMG40JcdrQ0lC3aUR3uYdWsM1hAmr5XRJnKPjn2SOg62ljUJcDbfsvtGJIX47UhgJhBgKEQyq7FqQJyWunN0EpHpTz6qDk8szjtxdWXAMaN4uio48kKZdfvwtiL338IAeLy3gq8dfcjvgZus4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766493238; c=relaxed/simple;
	bh=t+1pONdPmLz9thqLGoirXKmRtishbOd8pRYwruz++no=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GAB15gxrFcfQ+uO82vH7fGv+/ok8k9V4yC9It4wep/YZEonzCX77crM4E86ervhWRT/5SRxB9oGxX9jMESpsTcSw1YE/R/wZ9CPheKpV/cMed/2f6hjDEQ38+pYtfFgnpgBDGjTn/e5xyHh0yXpDvgTR/MOPWo7/wYtu1PsuOC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6QcCRty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gq70a+RV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7Fd2p2115304
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y1rAlFdJrZS
	OVjLiOHpjSKlV/hR268C4DVo9cIphRKs=; b=F6QcCRtygNQ9YiYZqE/chu1XDxN
	JSVUZhsnfr4rB1IGb01650BmuOZHNIVtYjUPjEKb/lzSbOUnBusPw3jtZTFKdfyI
	4uGzYKXyOjEhik9vNcdKeMdakCJDcMLVj/Hzrzx1trWC1n4hKezx1nPXYFZEQ2Ll
	6keOF9bPWqFTHgWHoLe6YGo6MjXXiNVX2MD7SOMpOw2GNkUxPuXFQlSJq3ljIjGT
	l82i0LFU8REFA2T4T9bkUtkbPDGD+Cyx0RZeX4hsHqKqmM9w981UrpY78HCSas5V
	q2tGzWpz+yIpcyll1tbpDWY9GwcNbKq+6gXprFodsVbz4M/4WqvEytwDW0w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudjnpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:33:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34cc88eca7eso9103572a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766493236; x=1767098036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1rAlFdJrZSOVjLiOHpjSKlV/hR268C4DVo9cIphRKs=;
        b=Gq70a+RVaOcST2hP7V88tnnOJtFftLvb5F2mNMy8F7/NdOSZyuGI2pNp31JsShL2vh
         y4g5XSsPUlDmwAgqRrh9KeYj5vYJ8bx0OgR+3OEUJcy8CHyScEOsyfGhqLUzhrftNYdv
         asa9UqivcM+wgWx0sS625cb8nmx1cgRUCq6fOI3wp4LWisARNxXNM48yCzYderW+LKED
         hu7qsDS9gNZhwqBmxMj9H9/FBAHj871N5Q4FO+AVgZHw8ygvp8K9htclOWd+vO3rX2ga
         fZw0SdPwm6vI0kj1GfbYyaPU4yhrmTMe44YMTiSW08XWYsOX6/4bP7JeebutyvkXoBhh
         q0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766493236; x=1767098036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y1rAlFdJrZSOVjLiOHpjSKlV/hR268C4DVo9cIphRKs=;
        b=LnqV0yNjhGWnsum16CGC9Y3uEteykkdL1N7GdMyFu/qVX8wnK0ni+we8VtCMG6I+PP
         +PH/a9jUiizpzV0zTAaMKSzm9dJwLIZAeWAf3B6JJ7DNNwh/gSqxFq2Gbt1/KEvhy/rN
         2spD6I/WLPPFxr5VH+zNBSWdSa+6igFFtdrMADIue9+lKPxC//v78vOFTDrfroRgf6OZ
         QSj+SRZ1xyrMelMXm5T+TAPHKLoZ1DCMUYoQKXsqsSOyNDwfS1XFJPawYHO6GsqEvJDb
         pkWQIAG0NTdrCVrqmrLUckBT0/ffmkyat4BrJRj460ZFRVj+PcYsJP+M1gsLsFWSqt58
         F5mg==
X-Gm-Message-State: AOJu0YzeooGJMQfU4a0h3EJVr3vbiXNBZHYjNZMsZ/5gnkSMaMYEZodI
	5Vfo4ZVMsgtQAw9djLvbNK/ggvXRi75Iopgi8n4iCAhzwLvkt/EIL17LjlY2ca6SyEo2JOM4fe7
	l00dFTpbfxFUyRaS7I4OCLy2m1WQCEVBTAQJhVUDkGC/oYxR5IqJZSpNoeCFbA+CjvbVR
X-Gm-Gg: AY/fxX6HPx9UZOnIp0pCs1KzIf+81BCKGuVgKT8CURllsAqRJhy9PaUzGVEVV3iV2L0
	HgsIuWOGpcCiD2ZcDaAz42Hj+ARHC1IaKw0qiA4KtbMYrDLW2riCxRXeBrUXzlrP8qU7VwnsGyk
	VhBiLwBZNasvN4mIZS8b1flC98Qu1IJ8umZDjlf5c6HPufANG3egAkRV4w1tcfG4tGcuPYF/J3Y
	MiFC/cCxHLjw4u5hHFVpc32671KsukJXounIGXTajB86Hwh9KqTZe50dDinxGgrmn7CMskq2Bpf
	GvSvy3kY4Ve5DFINEkfHaTEYECIAHZILlL3juHX+xa0c91/OH1Jd2GOBNNNYpfWTvpqlaNkYgEq
	KWKUcY9HY80i2p0AvvA0ljGI9Acd7A63gDUb1pfk=
X-Received: by 2002:a17:90b:384a:b0:34a:47d0:9a82 with SMTP id 98e67ed59e1d1-34e921a3df6mr11826809a91.23.1766493235385;
        Tue, 23 Dec 2025 04:33:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHveb3KmyUE9xrrxd+/CYmgePpKbT90CI0pF4EhDAa2a5cKJowrgCTGXrCE8Z0X0odRIJci9Q==
X-Received: by 2002:a17:90b:384a:b0:34a:47d0:9a82 with SMTP id 98e67ed59e1d1-34e921a3df6mr11826787a91.23.1766493234807;
        Tue, 23 Dec 2025 04:33:54 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b39dfsm12936044a91.8.2025.12.23.04.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:33:54 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v1 5/8] arm64: dts: qcom: Enable cdsp qmi tmd devices for lemans
Date: Tue, 23 Dec 2025 18:02:24 +0530
Message-Id: <20251223123227.1317244-6-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a8c34 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SR122_ySadgPJsZlA5MA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: EZ6nakjJbO_W0xBO6wZ8ylIpOxqzALVM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEwMiBTYWx0ZWRfX+a5nrl9Glicm
 VpcIC3510UO1/KcKNrE8ku5Mbfwzghp/cqMrMWal+QYA/NwjZ+S23aKBfJ9MWyHi5kcWc166wyP
 NOsjkS+ALza3oJFz105ASoOo0IUUaJti4jLOMyhEta5VBma+Q+98i41B9cPtUEKlaBXWCDkzFdR
 bN4P7z4m99zUsmbNFsmklC8cBaBgcVjvkjHtnHYJ8Cpds/SJKzFqNrr4/XSOf9BJz6HsIJvB+eB
 ll0Zm5SJ7f+CkD9h/XcNKBV9CvYW0/aej6uPeq6Zjq5Tc0hvT0gkG38QO9Yw8a1/nkhW7mFD/j5
 P2oKpDGq/eCyv1pUp8tkhbDLVSkNgtfimf0Dqe+DEqYuHZrwqe/fOvL2ENAwCVB92YB+WuhTvd6
 rZvshMNnAY9u67TBGsefOlZgOo/3KUkrs5+bU0TRS1BKutAQkRGRo6pll/7JTtvojCe2RyiuTUh
 2iOn5CYsj8FPuCaYwng==
X-Proofpoint-ORIG-GUID: EZ6nakjJbO_W0xBO6wZ8ylIpOxqzALVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230102

Enable cdsp cooling devices and thermal zone cooling map bindings for
both cdsp and cdsp1.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 138 ++++++++++++++++++++++++---
 1 file changed, 126 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..68cc4badaed5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -7018,6 +7019,14 @@ compute-cb@11 {
 					};
 				};
 			};
+
+			cooling {
+				compatible = "qcom,qmi-cooling-cdsp";
+					cdsp_sw0: cdsp_sw {
+						label = "cdsp_sw";
+						#cooling-cells = <2>;
+					};
+			};
 		};
 
 		remoteproc_cdsp1: remoteproc@2a300000 {
@@ -7174,6 +7183,15 @@ compute-cb@13 {
 					};
 				};
 			};
+
+
+			cooling {
+				compatible = "qcom,qmi-cooling-cdsp";
+					cdsp_sw1: cdsp_sw {
+						label = "cdsp_sw";
+						#cooling-cells = <2>;
+					};
+			};
 		};
 
 		remoteproc_adsp: remoteproc@30000000 {
@@ -7856,7 +7874,7 @@ nsp-0-0-0-thermal {
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
-				trip-point0 {
+				nsp_0_0_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7868,6 +7886,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_0_alert0>;
+					cooling-device = <&cdsp_sw0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-0-thermal {
@@ -7876,7 +7902,7 @@ nsp-0-1-0-thermal {
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
-				trip-point0 {
+				nsp_0_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7888,6 +7914,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_0_alert0>;
+					cooling-device = <&cdsp_sw0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-0-thermal {
@@ -7896,7 +7930,7 @@ nsp-0-2-0-thermal {
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
-				trip-point0 {
+				nsp_0_2_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7908,6 +7942,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_0_alert0>;
+					cooling-device = <&cdsp_sw0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-0-0-thermal {
@@ -7916,7 +7958,7 @@ nsp-1-0-0-thermal {
 			thermal-sensors = <&tsens2 8>;
 
 			trips {
-				trip-point0 {
+				nsp_1_0_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7928,6 +7970,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_0_0_alert0>;
+					cooling-device = <&cdsp_sw1
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-1-0-thermal {
@@ -7936,7 +7986,7 @@ nsp-1-1-0-thermal {
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
-				trip-point0 {
+				nsp_1_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7948,6 +7998,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_1_0_alert0>;
+					cooling-device = <&cdsp_sw1
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-2-0-thermal {
@@ -7956,7 +8014,7 @@ nsp-1-2-0-thermal {
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
-				trip-point0 {
+				nsp_1_2_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7968,6 +8026,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_2_0_alert0>;
+					cooling-device = <&cdsp_sw1
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -8110,7 +8176,7 @@ nsp-0-0-1-thermal {
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
-				trip-point0 {
+				nsp_0_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8122,6 +8188,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_1_alert0>;
+					cooling-device = <&cdsp_sw0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-1-thermal {
@@ -8130,7 +8204,7 @@ nsp-0-1-1-thermal {
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
-				trip-point0 {
+				nsp_0_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8142,6 +8216,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_1_alert0>;
+					cooling-device = <&cdsp_sw0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-1-thermal {
@@ -8150,7 +8232,7 @@ nsp-0-2-1-thermal {
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
-				trip-point0 {
+				nsp_0_2_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8162,6 +8244,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_1_alert0>;
+					cooling-device = <&cdsp_sw0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-0-1-thermal {
@@ -8170,7 +8260,7 @@ nsp-1-0-1-thermal {
 			thermal-sensors = <&tsens3 8>;
 
 			trips {
-				trip-point0 {
+				nsp_1_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8182,6 +8272,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_0_1_alert0>;
+					cooling-device = <&cdsp_sw1
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-1-1-thermal {
@@ -8190,7 +8288,7 @@ nsp-1-1-1-thermal {
 			thermal-sensors = <&tsens3 9>;
 
 			trips {
-				trip-point0 {
+				nsp_1_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8202,6 +8300,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_1_1_alert0>;
+					cooling-device = <&cdsp_sw1
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-2-1-thermal {
@@ -8210,7 +8316,7 @@ nsp-1-2-1-thermal {
 			thermal-sensors = <&tsens3 10>;
 
 			trips {
-				trip-point0 {
+				nsp_1_2_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8222,6 +8328,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_2_1_alert0>;
+					cooling-device = <&cdsp_sw1
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {
-- 
2.34.1


