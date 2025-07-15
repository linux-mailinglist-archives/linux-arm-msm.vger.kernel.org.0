Return-Path: <linux-arm-msm+bounces-64922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD3CB050E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87543A726E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 05:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C0A35975;
	Tue, 15 Jul 2025 05:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5pjkeah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14422D3EDD
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 05:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752557274; cv=none; b=L31g9l0zFMUAaafsBoXKN+aLNhAB4JTSXqjK8s6e1F8HFiRiXj4eK5VIP4qZhQRbZDd5L7zC55tXJ5L3chkao+/RpQBg6pa8AfRwo/428IIeb/eDjLOvCsSmFsWWM1UIWhHyE48jmevReiAVSP2iBOQC+q3vAYryFRNs89aOfRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752557274; c=relaxed/simple;
	bh=vainm/xNRpN24g2SmNn9CA25Khfl60n8jqCt7ca7nNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=btc1P2oXbJzRkxMog/Ue8HJnq2+XokpgXuyiRbLvgkvXDZLf0guOQ/jgyqfk2YiLTk3hL2OGwn0xUmlFTRBmiwRTmOzVBOMMquZyP1cgSwN4ysIB9fQdgJmNk83PWK2nDYFMtfe30qxKIgXWWigSK+P7nr6j4DBJKhIiUwNfs74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5pjkeah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGRRp2022088
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 05:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=52sZ/EqAgkg
	D1L1ASELuhg4WdghQGw/3nAe5HaeLCDU=; b=g5pjkeahSlPM3eZfFDYk4KJDRR4
	h5va7lOGiiJjzECK+cvmATOxowpelDnx02mSHqoyb8qlARAWG5XDrKmnKlFC2rh6
	IcaNA3iy/obQpe7mrNAGO7fpF/rFRA+Hus41shHNwSiFp+SaJSkgc7jYO8ikBIxd
	Qz2QtMRflpOJGcblrWIY5f5Qb1AUVKflk14sAxKDX6Z4LREUjldydWQFA2WTnQj8
	eotEknotVmTjtWT9iHKspWu/SYcVtjt4+n34jTH9NAMCeMkmqcKJIgJE7y0VhqQy
	4Cax6dspb4kwz/pUuTpI+O1KqkPxcd59nYwfWWU0ly3egeOX0/ruQcsQ1RA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dp9nvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 05:27:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748d96b974cso4285461b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 22:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752557271; x=1753162071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52sZ/EqAgkgD1L1ASELuhg4WdghQGw/3nAe5HaeLCDU=;
        b=Xkh/XCiqMCin/Ujj+fha0yEn1oeTXtYgOf2/LNVz4uweCfB27wmboEeHdKrJzRPrq5
         QFVkznSATAAPkjOQUa9wOK3dvh+gavUAKKaolXt953Tn3r6f65+O0BbcG1IqwRhlbSCh
         +MHIXYabWzvBZ2DMI3x9cQeae03aCB8rh9441F2/TCvBHIwiHA6SpWEtcO2VbZajh6Pm
         Obe8SFJEG8BxBcXOIuZFiqjUucX/E0I4Ya5pzKiZsNA6XYW9iRQ6VzXjPp0VtIvqd7Yr
         nyKYYuRU2+0HC7Kpg1uPUgzk79/RIgFEmna6bnaQn0fDB++0z+9UykAwNTTooGny0L4n
         qTaw==
X-Forwarded-Encrypted: i=1; AJvYcCWErVstTb682FoW9lo+XIAsNqTINP7uBYDOYAcRD6BBVWqxuqM3+tN1iXbbSiw5Tq73oR6x0Sdt8ulZxatR@vger.kernel.org
X-Gm-Message-State: AOJu0YwTpOUu/BswK0bG5CWH/1wR5xC+0tZqQjWmryz4mPUVa0DaaQFj
	L+f2+DOm9bq8rDg0zJvWTFuASybCiXaKAzc6u9UByjXVXO6pZBRV+2Xv/Jq8UyFM/1SxHrR7fUc
	X6oK6pKt0rsUNACI0kXWo3OE/IfU0LgxS7fExiwhIdhMheQRSxv/UEXrqScDH1in5h3+G
X-Gm-Gg: ASbGncsYf2r6PgEFolVGE/eCkrfOtiUYevwRhfzWKtUFCQ2vz8L/KjEa4JdgX6LHg6/
	gMxNbkGessSGeXoI2jPxDdxaGnVQwZ6rd/CxgwWcJHipDoxzxVCOO9vSoBY2aZN2JsCr7/CqNKH
	Jpl/aRvxa2OECbwb970KrvK++NVg/W952KTH0nI6RWAumiLiuxXXjhQD9liyaOvPtdx0XaNQt9v
	MZfO8Pkv5YqmFW+OcsX7cA2mWC8NMxCvYJwYETneiKX1eTlH1WL3Yd+NtIcbjfuoGdzHxRV3xSO
	D7QC+Ts6GZvhV3YL68WiX6ngmpswZ6i2W6/IL95YMETPmKpI5QcdHD+/eolnvv32AoM/5VG+YAK
	UAQ==
X-Received: by 2002:a05:6a00:21cc:b0:742:a334:466a with SMTP id d2e1a72fcca58-74f1e7deaffmr21401124b3a.12.1752557271062;
        Mon, 14 Jul 2025 22:27:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjHHRCqb843TFZouUVb+ppsFdAQ5P9WglVKciLnWHuaOIeW3ZTU6Z7D0yDvKTFScJr2cVt6g==
X-Received: by 2002:a05:6a00:21cc:b0:742:a334:466a with SMTP id d2e1a72fcca58-74f1e7deaffmr21401093b3a.12.1752557270635;
        Mon, 14 Jul 2025 22:27:50 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f8f24dsm11071535b3a.156.2025.07.14.22.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 22:27:50 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, neil.armstrong@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 1/2] arm64: dts: qcom: sm8450-qrd: add pmic glink node
Date: Tue, 15 Jul 2025 10:57:38 +0530
Message-Id: <20250715052739.3831549-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715052739.3831549-1-krishna.kurapati@oss.qualcomm.com>
References: <20250715052739.3831549-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA0NyBTYWx0ZWRfXw4se66t7PKFl
 Huik0SFGpVNWBuUc481Ks+rxx6k6SdFe564MriA+8JE6wXS5HbWZh3e33gi94aENAN6m24QeIVH
 7MtJfiLIAy97kwzto6Al+4/LD+kMguU2Jwww6uRGHki6RYZnrgOOlFWuilU9zR8B5aPvbdcDFUJ
 50D5FUMrfhnAgl6+CsnasHGEMQMC+F9eDsLjq4715anFeXmaX9OGQQgVmStSmkD2Ca8AIVsgXFm
 nf2dchbBjhTJs8Mu3kltUGofdj7ySZD71ZA+Mr6EDyxs/q+upwLvZkGlP2XI1aV5AzfMLXKZp5F
 t17SxGiQ7NUXYOqN07dmucMrLQHkkGI7LSnWeaafgQyJ/gV2RLjQJnMSD2ZvVtbfcPKdVRJbpqT
 c730uY0vDwFkJSYpbcralsyw30nFNsK/n7V6jrrXfeo8y64vEGYLMEX4AmdrqjhmJqDBLNWS
X-Proofpoint-GUID: kW5wgnNoCxXKE4yrcgKofHVKREDuXvrf
X-Proofpoint-ORIG-GUID: kW5wgnNoCxXKE4yrcgKofHVKREDuXvrf
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6875e6d8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=z-YkvCHTclE8bPj8c4IA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150047

Add the pmic glink node linked with the DWC3 USB controller
switched to OTG mode and tagged with usb-role-switch.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 51 ++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 8c39fbcaad80..56db5f79f59d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -28,6 +28,49 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8450-pmic-glink", "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+					};
+				};
+
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -461,8 +504,8 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "peripheral";
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
 &usb_1_hsphy {
@@ -487,3 +530,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l6b_1p2>;
 	vdda-pll-supply = <&vreg_l1b_0p91>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
-- 
2.34.1


