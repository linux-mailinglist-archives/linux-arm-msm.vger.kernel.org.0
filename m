Return-Path: <linux-arm-msm+bounces-110412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN1SC5guG2qU/wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:38:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C557861223D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 780D93080E65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 18:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035BC3C5DCD;
	Sat, 30 May 2026 18:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mMCLFRZk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hB7IOxio"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB4D3C6606
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165726; cv=none; b=RQ8ZnGeBbPyxNVqcfdhJuHjfVQipo9Q/2kSHCvg/P+kKaZybT8QlaPMniZBPLt1B1u1400k6LKThEvtYpeTcjrW7E+477ZBY8usmPVSXySomQAcI2UYs3M8cvo/FftA45SeVJhGoEJEDyY7H5fGnbvl/2fEaDaIjeDUXnjqCToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165726; c=relaxed/simple;
	bh=o3A84TMZexBM1pwDxo3Kw7jFeLhMLOycNMF3Z9OKaP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gi4fSJc0Q9NN5gpcEvYy9Ukk5KqnpxfBKyGJ82X6s/6Lbnqu1913t3Gfa6Jw7IyRZN6H5XgshoFE+lYalwX6ZSdUUDh9c5z/dgt6ZU6xrIYtdrKrQDp9jNztuVZosrWJsNlUOzUigigd1VYsj9CTylYawv8xmNEUnY03I51gkAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mMCLFRZk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hB7IOxio; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEPEZe3073089
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOYi9IefuNlSV+Wu7JhS4ObVYHQlqpLnbN4ZIuehJxQ=; b=mMCLFRZkPDoVRWl2
	ch2Ig/UBatS3UDit5h1izHVU+XSBrZtGr7ZjCCFG6g2UhatbbmLLJBfwvzSzvU3Y
	L+u5BnfU4CpsQrQHuPt6Y+OD/NlwCl3ALSQfv8xeDQpP2xqIZAua9kaJ0NdBm4Il
	CcMoEtguWd2ixflz0gJ+zWoN6/zJoQ4yMPJ4S0DQ7m4OmmfhpEgJ51JTuFpolmhg
	koudjlx0fWlAxzYo0OPGbQodE4Tpd+pEkyFcLwSnP5w9tIQD7TdjMzpJwJBtBFyJ
	9+XihNHCyZNuckDs0+tIc8/3CtlgkUAAtyikalSJul3rP3Dvm54pNRnnHfBfqHTt
	ECbq6w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pj9q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so13809955ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 11:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165723; x=1780770523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOYi9IefuNlSV+Wu7JhS4ObVYHQlqpLnbN4ZIuehJxQ=;
        b=hB7IOxiozy2choIbNOws9c8W+pDP3qDiYPKcUcpuI60/sG6SUHYdMXk2rtHK9jYu3F
         gcsYDgz9Bt/CCk22yFHWDzPGfeLztQVnmasfy42T+QP2W7uLRRE6EmAuGAMggoXJu0V8
         wAicndetrSUVnJ9gepm3xTnkHi02wY/U/XRQA5edxPkJ94Nh9h6J6GkvDmqCrJgjiKTp
         9DJZJcOKoQ+Q8gJdFjSslMLFflA0VMu50f4O4F+TngmHbKNGEIV0RDzMKAuFvoXLhFMF
         QA3pLOsolXJGPQj953xe733x9DXtNnzsyuE+kc1j1WdF6+wvXeq8dP2Iz4yAfNWQeVZ+
         A6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165723; x=1780770523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOYi9IefuNlSV+Wu7JhS4ObVYHQlqpLnbN4ZIuehJxQ=;
        b=ZdSc6SKZ+POf6HMSfOeBJWVkR4arjzWBifI1P7he0+aL6LhCBFstgFLwb51tCmMO3U
         roGPVFDPo6ii+3jNfuiPfTcpp6dT40hI8LO4RghwKGcFTPfjd5p79SYYUnRsLr4kdZhB
         VXAFVpAzdpeGslwiQxyjr/pyQvF2LqF2HRXBM8NWhS+K75dTOE8cDmyeoD2jARsZQUn5
         OchRqE0U+MPFBgweMRl9drpcO3A/yny93ktDWQ9wICzv1HOIf6kuiIy507ChCpXSJIT1
         trFWy8q8UM/DgsZO8i51AOX/tbWdz2b71BAbRm3a+h/+DYWAHorTiUXGz7vVqUW4PzE2
         ur8A==
X-Gm-Message-State: AOJu0YwTnCr9rBkZV6r6FsFY755/924BVg8RvDBzo9W9LCoqydlmsKLU
	/PhDCRS62vX6FGmmiWwnhTguMYDJJcOiFaRR5tCRj2HD2C99Ysw+oewv0D4/7hrTxi20pEiDfaO
	rzBH9EVfWjOMKJ8GIHUWHBjEDX3Y66TpUKKHeh0WPzfr1i9z8iAW0lMMPjFhOMDRF/TxlNtBdek
	RF
X-Gm-Gg: Acq92OE1C5uZhhkedx5Q55Vwxoos7RJfKh6MoX9wqpm8ZlBXEosdqPIMxxlIIWv2+wH
	2RCYWm4cl6nT+Qsrlyl5IOgOgOVL0AmtHdtKwnfEu2PNDRBjO0TeWhELFjirTPAp7ZzBiKzZtUr
	RL4eh68prXMPRTiyXpeIAdlmukl/M13hOtT8Sf7MrTv86/lS7ST3YjpI5VvtRvUHnqqWg2m7Gwh
	pdoZVyD72wIP9FxEO5+BdOFpcc6i2N3oQpOgW2elQHGyG6J+SyGn39RYeRvq4m8F2eIGuL9PisL
	xwHd+mNkLI7Z1LuGEq7k1h6B0YIAKibDjC2PUhCHqKJqAXpOuc052yme5NWhuQCwwpRnlLiEI/r
	Uv21D4H9yjV1EWrEpzrafgaQuk8RfjO4BlpVAN/kJ3x4XPWc=
X-Received: by 2002:a17:903:1b4d:b0:2bf:2015:5b93 with SMTP id d9443c01a7336-2bf367d9879mr60481025ad.11.1780165723228;
        Sat, 30 May 2026 11:28:43 -0700 (PDT)
X-Received: by 2002:a17:903:1b4d:b0:2bf:2015:5b93 with SMTP id d9443c01a7336-2bf367d9879mr60480695ad.11.1780165722725;
        Sat, 30 May 2026 11:28:42 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf28973335sm51702635ad.63.2026.05.30.11.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:42 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:57:27 +0530
Subject: [PATCH v2 09/10] arm64: dts: qcom: shikra: Enable TSENS and
 thermal zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260530-shikra-dt-m1-v2-9-6bb581035d13@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165667; l=6253;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Ojqo87uQxTupglYyK4apEMvmRbEsINf/dsrmTKrIdHk=;
 b=zr4W3m1eSpjcPP4etV3b4+H92DICqQDDEu0Ly3X0o2UHpM7IgQ8FO7ZEobVVbgWszXclqvfMa
 JoejMlECx83A+JWNXCIFzy+Y1G2bwgaVoykQvPDK/2WoiG+IsdlihCW
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: Jo_eGvjPoXLl3vtsGnkOMhu_Qzdlw6eI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX85YM+w8XZkay
 2IFftXiiPqpaJcy41asCTTAyr3E0BAjm/r0RcT2IDCkb0TSQonx67Jeh2RfIEGjkAQBwkJpoDVC
 f0a9ldwqpzbEoY7LZrR9zOu9TDU0ayCjxOdOCjml5qz9HiKVjsYK7i+av3pftWnFORJF5Z8ARQ6
 t41ZV2GmzSaBazqEdqSJ8DEZ6u9YAaylFnWPfW7XPCmYcXJbvgpve7EBI74+fT7wSL0BcE9DbFh
 1nQ7eFzprO+PI7CMFVjtB4PHkm0RYeOijkBMZTQx4lOZ8QxipC7X7ub1ZUBgIPk8djnKztAt7Y2
 OsL8Y28ZvAHZ0QbY1I//i+W4pjWFP/1SnoNweGXNEJ2al62Mbw+6tdV/WZLgoOgV4mwnzJW7IWF
 mPgo/B7e7epLtZ/XslFIZnhhZzMaaySkOrEQH2qkZekAhxydMHFz3Qygx770xFBFJYU9lddYeBH
 3i4RXr4cOuB8gtQn/lw==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1b2c5c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RA8m1HTphegElRrk3pgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Jo_eGvjPoXLl3vtsGnkOMhu_Qzdlw6eI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-110412-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,45f0000:email,1c40000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.67.78.120:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C557861223D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

The shikra includes one TSENS instance, with a total of 14 thermal
sensors distributed across various locations on the SoC.

The TSENS max/reset threshold is configured to 120°C in the hardware.
Enable all TSENS instances, and define the thermal zones with a hot trip
at 110°C and critical trip at 115°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 267 +++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index eaed7c53d4cb..37e4ec799976 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -983,6 +984,18 @@ spmi_bus: spmi@1c40000 {
 			qcom,ee = <0>;
 		};
 
+		tsens0: thermal-sensor@4411000 {
+			compatible = "qcom,shikra-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x04411000 0x0 0x1000>,
+			      <0x0 0x04410000 0x0 0x1000>;
+			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <14>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
@@ -2180,6 +2193,260 @@ cpufreq_hw: cpufreq@fd91000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu00-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu01-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu10-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu11-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsp-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss0-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss1-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				video-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu02-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 

-- 
2.34.1


