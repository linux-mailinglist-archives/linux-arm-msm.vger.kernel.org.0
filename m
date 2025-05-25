Return-Path: <linux-arm-msm+bounces-59336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B87AC3590
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 17:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C46E7A2063
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 15:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D6F1FE46D;
	Sun, 25 May 2025 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUVdNVu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D5B1FDA89
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748188482; cv=none; b=Q1El+Yvz+l8nNelfe2Zuma8YuXVbwxgfOfbENUBKo+QXB6SW0+h3by0iOa5BmoSczFvN7bFgqQ1KjjE2eSnU1VaqGVWQrF/W08qDZghA9mfWopXAa3LLtAmZGlw6uL9ddnWo8RW+1WzVKs/L44VyKHbI20H04BcGGy/kD0g3Occ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748188482; c=relaxed/simple;
	bh=4OVsYXvm636kbBfiM8ZtZMPfRfHbcvvJiwYtG056HSo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kvMUAl7BFKK8LTSngYOz1zLwsdguJv6wUhvLIKrvKA8W7QFt4WpbOAyf8dwpYBMVijLb1fCrQXFwkzwRtEtZ6HWhEN0G+6uuch5jCrIuG/F86MyKwf7BU8KRK6n5cyA2yyPSCUqXqV90gvdQyWv8+iBb0dVD9Ycz436tVcIrIaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUVdNVu+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PB1Wlq013749
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 15:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dzKtiHuPNOm
	ylJT7507aK6lLExsMbd+U+1mGsRH52yI=; b=LUVdNVu+uWEigsw+yKr7sOWwk0D
	W0Tcnb7IZp3mDbPHjhLpWDQzZPFa6t+a/uigR1jMM1rId6GdcWe1GULYxKhXHPPS
	8Ymn0SrrbCTC1149z3qMqcgaywIX5s0TdNbrQ3KxlyAvk1BTvZIPfgEYrNO/2GN6
	mPD/Rws+GIkYVomMj8JkVNwMbSB1ZIBF8yYFFpdVObFPcPP4myLsTW/JUIprTYU1
	KLkUcz2tAMeCg820GKE/T2gh07V9jLLHYxDhmdKvOOU73l79pBkXFhqzpsWMm7vx
	wUxT2v2sXZURYEwlOOu1yqrAvQcl3HUkz2FcEZWlFFNt7sBHIb64EJq2pxA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wa4ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 15:54:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26cdc70befso776253a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748188478; x=1748793278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzKtiHuPNOmylJT7507aK6lLExsMbd+U+1mGsRH52yI=;
        b=kXKxlOc1+G0xODv+4bN9Qi6O5MGmZdMN9iyKAO8OgOstepFbpIfp+FfD8iOqO/zH+r
         qxYiRodQB93uaoVD4T0wohiCVdaws7JR8d3KQeIq0dCDblsED1daGPEtdowQ5J/QCnr9
         wfwTXDS8ESSN5om7PuzeIG4zzfF2S91FAQKqur7Q67D6cup9Ec021a5uojh7kzTdcqK+
         iq9uWqvoDUsK6zOszsGDslLCspCIUp4Pj45t2ugsRlO3gOauLhsA/rwOjbgIGMSC0H9s
         PZl4RUIGS8IEK0vT6Sll8uIADMu+SA12TLE1VIqNx4OEvf3GpYiuIKoHwyNlMTGQ3QYR
         4xnQ==
X-Gm-Message-State: AOJu0YwWRVPs1Dac8H5fDx3CWcvNVAqO1bujUpU7rLpwrPe4u/MCpCsR
	D8J/KWnOQ3irI22vs5Au6EQJuxIjKV6RsIqvh53m+CL/OU/mBuWLWhtc180Gh8uJ43sZqPyag+M
	bLlbGjx2/u/Z79J34l6cLKPdZlJYUNi5ADsHSgye3lzwRBTLQeYdeAuyvW5mOhpuNp4tH
X-Gm-Gg: ASbGnctr3pxk+rBn0GBk/+SDhTt8GYDkbtQLj035pvy/IL6P20d+B8CrGuEM+P77H9A
	hR8rbBB/rdkMLYBcmwxHgK7cMkgQhoMxr1qllhESpc8ISE0w9ZkVfbd2GxLx13S2eYZdNgBQVpf
	XqX0Uoghm+ZwNUSsapeecUqw5yyaxwUb3voLLifGpUujXGS1h1dIrNueOGqknZm2Q+hOeJ+3Zpm
	5+Hp1WdqBSVEJkxKr2j2nb9PDvEkIjCz/KpN2cldEPVcSokoTDoNZmXSn7DLmogkRI5MF6Vn8P0
	1z+pvFwSIbQ6/So9vtDFYh7NIPAv4JMpJOUCWXWeMb75MiFQ
X-Received: by 2002:a05:6a20:2d29:b0:1fe:5921:44f2 with SMTP id adf61e73a8af0-2188c299622mr7316874637.20.1748188478502;
        Sun, 25 May 2025 08:54:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFbB1JBHwonHEw+3UCejVEIzTnXDTtiBR04Gpp+fm7aF1mb/Tj2DYxKtm9QrJvSgbPFF7PUA==
X-Received: by 2002:a05:6a20:2d29:b0:1fe:5921:44f2 with SMTP id adf61e73a8af0-2188c299622mr7316856637.20.1748188478066;
        Sun, 25 May 2025 08:54:38 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de11csm15634488b3a.31.2025.05.25.08.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 08:54:37 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
Date: Sun, 25 May 2025 21:23:56 +0530
Message-Id: <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=68333d3f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=mKn8UeLdGVDd1___hkMA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: SqUX41_zruk5_gYG9RAv0cU-XdojR2jT
X-Proofpoint-GUID: SqUX41_zruk5_gYG9RAv0cU-XdojR2jT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDE0NyBTYWx0ZWRfX3TYhKYjjNzzU
 7u6eHR93d0FfmIlMkjhT5uGgWRfw1EVVzjRWdiRld4ETcTljYRPlbjyD57gtjCls6qYNrgN18bH
 wqq5tC4Z4Az2bFABc2Z6M0dJhsIDh0NuqhZVH4btxMkHnKof9Hi1w9N5CltuXwJ5Uo5gpvHkSWu
 s6lEhbLFf5LUqdiZkDxkTAxJJhHMY+SaA3HxIswHyo5QvyttEedj5VS6wDFHNbo00d80CvBvATv
 BWskqREHHBEZ+3zYqJG5NuHvXTHkTHK/cirJpaAjEVCrkPWHFXIet0CJOa5m00hYs3BdvfnQm/0
 QbGLtSmZNLgOGpE6IdlvQ7QYkkQVUMjxap84r1rDjw0TAidN91tBMtL+YQ/nQqxW/PFRYAoLEwI
 OhZxz6WkQaDewiHPTCgiR9s0RoM0uleJt1tBMeCVKmooF1jup4+wGlpOhIqLI7mx51zhdKF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250147

Add the sound card node with tested playback over max98357a
i2s speakers and i2s mic.

Introduce HS (High-Speed) MI2S pin control support.
The I2S max98357a speaker is connected via HS0 and I2S
microphones utilize the HS2 interface.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
index 0e44e0e6dbd4..1ebf42b0b10e 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "qcs9075-som.dtsi"
 
@@ -20,6 +21,57 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	max98357a: audio-codec-0 {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+	};
+
+	dmic_codec: dmic-codec {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <1>;
+	};
+
+	sound {
+		compatible = "qcom,qcs9075-sndcard";
+		model = "qcs9075-rb8-snd-card";
+
+		pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
+		pinctrl-names = "default";
+
+		hs0-mi2s-playback-dai-link {
+			link-name = "HS0 mi2s playback";
+
+			codec {
+				sound-dai = <&max98357a>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		hs2-mi2s-capture-dai-link {
+			link-name = "HS2 mi2s capture";
+
+			codec {
+				sound-dai = <&dmic_codec>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 187a59e29f59..23dad329cd74 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4536,6 +4536,20 @@ tlmm: pinctrl@f000000 {
 			gpio-ranges = <&tlmm 0 0 149>;
 			wakeup-parent = <&pdc>;
 
+			hs0_mi2s_active: hs0-mi2s-active-state {
+				pins = "gpio114", "gpio115", "gpio116", "gpio117";
+				function = "hs0_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			hs2_mi2s_active: hs2-mi2s-active-state {
+				pins = "gpio122", "gpio123", "gpio124", "gpio125";
+				function = "hs2_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
 			qup_i2c0_default: qup-i2c0-state {
 				pins = "gpio20", "gpio21";
 				function = "qup0_se0";
-- 
2.34.1


