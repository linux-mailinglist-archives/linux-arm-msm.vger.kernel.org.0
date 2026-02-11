Return-Path: <linux-arm-msm+bounces-92567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMRdBPkRjGnnfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 06:22:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF312152C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 06:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C81A300C275
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 05:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424F9340A72;
	Wed, 11 Feb 2026 05:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8W52fv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuAm0ZwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA23EBF2C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 05:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770787317; cv=none; b=Ojc/j7MSrK511e2/iufUgcptvpzgz0VsrOJ2/Fn1itBuORtP4M9kR4mthaN/1O2+NGW15sBW71tcWRjMgG0bGKYfJzgYdSMhgNQu2Jkxqmw5ZZT7nTr7eYN08PHPTpES5NCt+bB57uOVeWUZ5LI2JMewSOl07ZnPE9Bzw+/jsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770787317; c=relaxed/simple;
	bh=PcGaK6KgYnSrAyu1cmf9etzsXUS1gTw7ofw0nqD0/uI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJgm97b8MMLTgD+qIcYqBwt0Yc0k6AQy20UwYLKH9yQuZQoXU1KrPJ1kaM1x35ii2uKQEBcS0pWwq+YnZ8Aay8BVyEdlt7TtWz8+kS/COo4gfNjTaAimQx74gZljvoWKNXNTz04KJ98V/PoVQBjgFtFa3p2BAqgETe34t+61bfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8W52fv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuAm0ZwA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B0446d4176958
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 05:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2mGekC0M2yjAAuN4WY4fhNZAavvVZXR8J38
	63w8fhoc=; b=Z8W52fv6Q1x+IAYV2CWEo06m4vLrbMKwNr2+VnXXadWYc2/c92o
	xuM4GWS4rg6WL8/BBBMRv46eGun8l0sfCTTbf5LzZri6VLqgtYm+/WkTEGECzLho
	2BjzvBopk3f8T+r40D0PlTireYvUj9uEm9FFw9etyysQLpudZsqcsYLEbAF/K7W0
	83UPKMx90yNT8Mfe/gvseQ295jdHJ/OBv+JE5ZhrqXAdPot9JZDuMHVpOYFl1Fug
	I8lVgj++S8sJLjr74V1hVELlOiq3bQCpf3K4G0/hdNnaraFkWjsDc98rgMlTsS7j
	2VhusliRD+8NXmZ1Me/cu2lzMux11x2rycA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c879mjefc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 05:21:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6dde310601so2634910a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 21:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770787314; x=1771392114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2mGekC0M2yjAAuN4WY4fhNZAavvVZXR8J3863w8fhoc=;
        b=fuAm0ZwAz/i8fd0/Z9fLwY3jlNupotHfcJK4HrtlrvJKKOWdR+sS5MSLDvl8i2JcSE
         Xq8lvs87s43nZ5u9R1CJ0FIM/1EaOk3JVMN7k1JrMXLZxPxQyD4BZIWIyC1T/5nDofbt
         GW9IfFYqTrNp0OmLLnVM29mcLsaSi/eLVdVjokoDQqWA6SMd6ac+2mMyBmMCe3pnkU+E
         RYiNOENUkB6ny5aiHvlFtzSYLQBDpJI46obFQDMam9g2/Z0G0ieSnkjaGRmUxbBjOZv4
         sXZMw9QEDH4QZZTFmkFh0YsWhnXIbi2RkApw4DULMHmCaqrTt3BIuusLuUr739Twiyr2
         5KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770787314; x=1771392114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mGekC0M2yjAAuN4WY4fhNZAavvVZXR8J3863w8fhoc=;
        b=p/j/UL+1rG7zPNkrj3g9l5BCbppES8aNBgZVOLOESP5UsrFpjlumJna4njNxAjLWuw
         kRgDYhqZmvG6RYluPjDKyOoMrMiHNywgltR9PK62klBUsnMqk6bG8ID26mro3XYlo/Wt
         zQ1sXY46r9qISVVDBgfRzFvH1aDXJwsndEikWNM+OxaVCvQBolTNjSAg/hTs95p+Y4q4
         MUD/osegm2tBjniLyd2imml2PYbmXk9NSe+R23I86lstiv1h4/00O6gS7ocGrptvVVGN
         fjWkMksC6Hfn9zL8BB3V96ZWmg5BWJbh1JWyViX20KbhoyRBmIg7iXO0Z/XivJyygceV
         NVVw==
X-Forwarded-Encrypted: i=1; AJvYcCUbNczmD8a+tqtJjxQEojsaOj69kkmxnwak0rY//NfgaGZ3hmo26AaZ/bMTbLjdcwqNLr9FxslNamoHyisX@vger.kernel.org
X-Gm-Message-State: AOJu0YwIDU0YXQqhnLNtumpPf2+eMwqbHd2aSvS13Krd2g7lPuN6krtr
	2e02DKgxLN1ebNYrETcj1M1Y9tnmKqa7cW0I7JesbgCvquptoY8bhQfjyeUNwYS38hdEXoDWcUQ
	J9lKZluwx+YVD9FyEDAYfutdT8tgiIhiITcJe/rRz7kJWQGfabFkegG2/TfoVac2dhdhO
X-Gm-Gg: AZuq6aLsvEkhX6XoOHs7C8U6/CdlyjMaeqRyOq6MOoTCpFCgZPURvtINQLUF/QbjGoE
	vHg0rO3QSQuUUaNQYih07FlKWYOkU60TYMZNllZMcIRnMFpFXuxigTkcMnbkfE+8cFwTdIrIhQW
	SxGXrtEh2sjKgXdDZ7SY2UlnuOD8jDzK1139LEowjpAk/Hca4TABDmQ8EozGnOmf6lziYddEXZ+
	YZeqvL+NLqWY821ZBHH7rcpBIYoHuavVL/PZoA5K2iJZLgR2lk9w7jeasyzqy8ZicySG+qo/6ex
	Cj3WoRSt2Hii8f259m8Ms9rgX1Gn0snwfMDVM9FkdHQZLYnyLhH1K1QRj5yUXamDKoBj4PdZAj2
	MkENRiV8eDPCMN77/xk7A3F8usyK7iyK1jP8v+zZiFWtuNe5k4Q==
X-Received: by 2002:a05:6a20:431e:b0:38d:ebdc:3558 with SMTP id adf61e73a8af0-39432253f51mr949286637.6.1770787314346;
        Tue, 10 Feb 2026 21:21:54 -0800 (PST)
X-Received: by 2002:a05:6a20:431e:b0:38d:ebdc:3558 with SMTP id adf61e73a8af0-39432253f51mr949267637.6.1770787313862;
        Tue, 10 Feb 2026 21:21:53 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e7d8eb9sm864675a91.1.2026.02.10.21.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 21:21:53 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2 controller Micro-USB OTG
Date: Wed, 11 Feb 2026 10:48:18 +0530
Message-ID: <20260211052146.3760500-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UKjQ3Sfy c=1 sm=1 tr=0 ts=698c11f3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nDjxtR87dJjKcGfwTHQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA0MSBTYWx0ZWRfX9piS+995qZiG
 +u2prRRRAaYUFG1gifIs66ewH+Xhwqz18ZVx69VWYb9thVrgQdgBy90fkszrehysvoxNL6GyLWy
 FA9q4X3woDth6cRgEr2FVxPeka/VhX8FJsFqHeZeMlPqj2L1Lx5AKT3bZscbbjGcLoWCDEkN+Sb
 qeBsDNmsfuVmXqEL6oOwyzCW47fS7MJMCzA0D4H05lGzt7HdYXT8eajTmsvVsHKdQ9Pq7xvBUDo
 m/PzWPoRTX/JoQlaaOiZGz8K2qWO24GsyJmildZMylHG1U2X0qTLmVvcSdQKhkOwq/F+NNvGsdy
 QRF1o9uCFKMI+oRawZs+4dLBr09pd7jAJglZC/OBLGbv0WJcFNQqcIB/SduaZd8GBQs/4hAwr05
 Br/0gRAltr97sowqmHyBAfWzckjAc+OOQZLiryo/vb8Hq/iRMGFQ7123dhnmzi2FSDYHEJx6cqL
 wStCZickkUCMN7zlnfQ==
X-Proofpoint-ORIG-GUID: 6sh-KYVhHiCr_SkTOsQREVB3btqgLA1I
X-Proofpoint-GUID: 6sh-KYVhHiCr_SkTOsQREVB3btqgLA1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110041
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92567-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78EF312152C
X-Rspamd-Action: no action

Enable the secondary USB controller (USB2) and its High-Speed PHY to
support OTG functionality via a Micro-USB connector.

Define a dedicated 'usb2-connector' node using the 'gpio-usb-b-connector'
compatible to handle ID and VBUS detection. Link this connector to the
DWC3 controller via OF graph ports to satisfy schema requirements and
enable role switching.

Specific hardware configuration:
- ID pin: TLMM 61
- VBUS detection: PM7325 GPIO 9
- VBUS supply: Fixed regulator controlled by TLMM 63
- Define a gpio-usb-b-connector node for Micro-USB support, mapping the
  ID pin to TLMM 61 and VBUS detection to PM7325 GPIO 9.
- Add the 'vdd_micro_usb_vbus' fixed regulator (controlled by TLMM 63) to
  supply VBUS to the connector.
- Add the 'usb2_id_detect' pinctrl state to configure GPIO 61 for ID
  detection.
- Enable &usb_2_hsphy and populate necessary voltage supplies (VDDA PLL,
  VDDA 1.8V, VDDA 3.3V).

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
v2: Fixed minor comments on v1: https://lore.kernel.org/all/ad294a50-027f-4caa-a9b4-e145f709b50a@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 64 ++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f29a352b0288..af21c8ab48fa 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -217,6 +217,16 @@ pmic_glink_sbu_in: endpoint {
 		};
 	};
 
+	vdd_micro_usb_vbus: regulator-micro-usb-vbus {
+	       compatible = "regulator-fixed";
+	       regulator-name = "MICRO_USB_VBUS";
+	       gpio = <&tlmm 63 GPIO_ACTIVE_HIGH>;
+	       regulator-min-microvolt = <5000000>;
+	       regulator-max-microvolt = <5000000>;
+	       regulator-boot-on;
+	       enable-active-high;
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -262,6 +272,30 @@ active-config0 {
 		};
 	};
 
+	usb2-connector {
+		compatible = "gpio-usb-b-connector",
+			     "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+		id-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		vbus-gpios = <&pm7325_gpios 9 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&vdd_micro_usb_vbus>;
+		pinctrl-0 = <&usb2_id_detect>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				usb2_connector_ep: endpoint {
+					remote-endpoint = <&usb2_controller_ep>;
+				};
+			};
+		};
+	};
+
 	wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
@@ -1137,6 +1171,12 @@ qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
 		 */
 		bias-pull-up;
 	};
+
+	usb2_id_detect: usb2-id-detect-state {
+		pins = "gpio61";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart5 {
@@ -1200,6 +1240,30 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb2_controller_ep: endpoint {
+				remote-endpoint = <&usb2_connector_ep>;
+			};
+		};
+	};
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l10c_0p88>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	vdda33-supply = <&vreg_l2b_3p072>;
+
+	status = "okay";
+};
+
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&redriver_phy_con_ss>;
 };
-- 
2.43.0


