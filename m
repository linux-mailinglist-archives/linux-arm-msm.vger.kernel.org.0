Return-Path: <linux-arm-msm+bounces-72366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB72B46390
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 21:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF6D7188BF4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7213627814C;
	Fri,  5 Sep 2025 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRKKAWzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEFD277CA0
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 19:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757100252; cv=none; b=AX7R4posuJyNJRaA89sa1RYREQZVYx5Sm9+/Yl522PRBUreT7HwLSKBMnkn5gjlP8li5zUxj3dcwDbq4zSQCac+2bcmQcOSp1SIgey0kALYzgPoJzt0+DrdxyqOYWHl+RCS2cT1JZzDvGq32B0RHJTEZDmFHsVgNGcsuUKQMaG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757100252; c=relaxed/simple;
	bh=ohJ8L/lmC5nzXIJdYhjD0hYmjz4xt8lZxdhQOuGx3oY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TKcLdYN8TwlFUH9NnDJIcZp3EfOmybnbmBYWtEvVhQ6/G4Vyvq6Zh8SFyafRnvvAO7sFW8ekcdZdeQpBPj2IwjX281ZbAMFomcwR43Se8qDJUKeQ9KI7QrdGln+tkQUQXAnfch7FY0yMw8lGs0+L+7U3RIxqStDsgaSKcqqLuqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRKKAWzV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585G8nJo002956
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 19:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p7mv9u0Gj/t
	Mm7VoZy3yzk7wVTi8XlrY7vzvKp2G86s=; b=TRKKAWzVEvyOfLj2A1lQbipoLMP
	UJAuAOiCUdtO1ElY1WX5CRNoGdY5ShRaAfVdpM/v1jwC9eYFJ2Vty8OUQyYqgecw
	xrjNO4a/OK64iZefrsCoFDJFdFRk5h6VzyntzmuBqa+15m9IlaaORWbUVskGxYfo
	oskJVHxjTQFWsDwO/CPrOQVcBEhmsKLFELJP4dqwEBEzfYglHUCaqDjYI/aWWs45
	0n4dK7QLe4DGqAkSTdQVUi58pFPG9wcx1tJzDAbz5lIrpKsw4pYVuctEXcaKvGEx
	zJ6Hoxtv+Hbn7zZJfQlWE+euVhatuTgaMEkD9TzXXPO0zzy77P1KCb+4beQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush3c89s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 19:24:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24cc57791caso5408605ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757100249; x=1757705049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7mv9u0Gj/tMm7VoZy3yzk7wVTi8XlrY7vzvKp2G86s=;
        b=Gb0XAA8rep20JC8NulvmNsEe5KKGru5zUhKJCRAed9zr+LzRWDOAijcg5c5tOcAtQv
         Wi4kR/eePnwnsokQzebhKOk1QkdqJMzn/TaDlDBArs/vApD+BPLubmLHrAmKLo6j3yK0
         eCmSetcd9jCRzVdQXx8LRSGqgk4Z7CpNzFXW6MR4xVgEB3fx9QvPolLTPXkWwbHStBz+
         ORjtapc53FC/pu/cxOa7nul1T0G/jxN8DHvj8rIYJf8wdaAAZCrewigp/Ef1OruqTfIH
         Z2hRS0/LwHfDacyq8ZYONQ4/TSH7yMTewTEZ5R7nYmzFsNhmaEovVqe097YHcYdA5U1F
         TJLg==
X-Gm-Message-State: AOJu0Yx9fzvdcFnj4toyAButli2ap92wRopwKhRcYoypQTR0KTgO25H2
	VsfkNOqO82UEsPlnt4TKGgnD4rfjvgeeM/WGPmVVeq54ImjpN3dEh23tgH+HdPR3o4q1ToeJapx
	iMHWTW3VtVbf7FugdoPlB6Y636i/0DPEc2618vR4n3k2QBEQkPTu7pAsj7PT8RK3/GGCI
X-Gm-Gg: ASbGncuVGm/kHmNYf4bjo8C1v/NSHKkNDZSVJ8xRPgrVWz7VVemVPMHNXZDtvJJhmlk
	xivL7rn5oeTb4UpkMz7BiEPfRkvfeoVja9/zX7jFUCB0EioM3xbPEw79ZW2CBAAEfYCSqFLNRVp
	ULPmjp2X5Xx1E3YcioKkCbWDi9901x+oQ1i4WAoUcbc8MziJSZHbfLLpGHufRx76w2to9ubnRrp
	iqhUsWj5Os8aLc9aO+M6rhMPxWgzH6Ic0BXUXRW8eWpMNCKAGifYyreF4PzA2JIPcKaT0gIYPXL
	Jokx22yKwutwD5PRr8r7mr0GXZXbg6tD0buPkWIDyGAzTPJsxxKEejF3INlE/Svddx0sXdo=
X-Received: by 2002:a17:902:e845:b0:24c:c445:87c2 with SMTP id d9443c01a7336-24cc4458d54mr53201785ad.4.1757100249095;
        Fri, 05 Sep 2025 12:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtqgC6cdjTbQhRBJgUbOadjdZwxr3fa6EVM+jgxs96DkcvY+d36XAEwF+upIFEVCbnKEnoNw==
X-Received: by 2002:a17:902:e845:b0:24c:c445:87c2 with SMTP id d9443c01a7336-24cc4458d54mr53201555ad.4.1757100248610;
        Fri, 05 Sep 2025 12:24:08 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cc1a82a34sm52397055ad.151.2025.09.05.12.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 12:24:08 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH v4 4/4] arm64: dts: qcom: monaco-evk: Add sound card
Date: Sat,  6 Sep 2025 00:53:50 +0530
Message-Id: <20250905192350.1223812-5-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
References: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX1FoNjM6zA4z1
 FluwADnMt7INMI9pq6AgsCgPhoZ0A42C5PCrn40ay3VlH0ZFz8VaOBGObDoLwNB8Gy7i3yGvZm5
 dYiqornlViq0RyxdoK5w2JDraPFBefN0yMTPQH0ajGbPkANLc/jvKjtxg0Ar3T987DJT8jtLGKJ
 F2K92W2AD0Bb/3CR5kxAOBblEQElbkEA3Zm86B1n30Om6QbWIsAYZHlhCfEioKi95PkR8bV+PA0
 Si5FegR7ZtxKuXypd++st+zvZbrkDoZ/5A9hitdRokzyJ+BCWLKFwxbOJuU3s2+21B2yTM8t+G3
 iQzp+bVGN87LNUrVwA44cb2QjQc2jKG2UVzD6rN5mhM4HUWEemwqBh34DHT2xz6iaEXgMyhYlmf
 2jHOPSO+
X-Proofpoint-ORIG-GUID: yceZ_JsY1X_HfAuBJnxrE_jkpzHSbpkH
X-Proofpoint-GUID: yceZ_JsY1X_HfAuBJnxrE_jkpzHSbpkH
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68bb38da cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LbBNwnm3mIGQqbDd4NkA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the sound card for monaco-evk board and verified playback
functionality using the max98357a I2S speaker amplifier and I2S
microphones. The max98357a speaker amplifier is connected via
High-Speed MI2S HS0 interface, while the microphones utilize the
Secondary MI2S interface and also enable required pin controller
gpios for audio.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 52 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi   | 37 ++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 93e9e5322a39..f3c5d363921e 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;

 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>

 #include "qcs8300.dtsi"
@@ -24,6 +25,57 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	dmic: audio-codec-0 {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <1>;
+	};
+
+	max98357a: audio-codec-1 {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+	};
+
+	sound {
+		compatible = "qcom,qcs8275-sndcard";
+		model = "MONACO-EVK";
+
+		pinctrl-0 = <&hs0_mi2s_active>, <&mi2s1_active>;
+		pinctrl-names = "default";
+
+		hs0-mi2s-playback-dai-link {
+			link-name = "HS0 MI2S Playback";
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
+		sec-mi2s-capture-dai-link {
+			link-name = "Secondary MI2S Capture";
+
+			codec {
+				sound-dai = <&dmic>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai SECONDARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };

 &apps_rsc {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 8ae843567ea4..8afd77a2d737 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -4804,6 +4804,43 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;

+			hs0_mi2s_active: hs0-mi2s-active-state {
+				pins = "gpio106", "gpio107", "gpio108", "gpio109";
+				function = "hs0_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			mi2s1_active: mi2s1-active-state {
+				data0-pins {
+					pins = "gpio100";
+					function = "mi2s1_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio101";
+					function = "mi2s1_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				sclk-pins {
+					pins = "gpio98";
+					function = "mi2s1_sck";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio99";
+					function = "mi2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				pins = "gpio17", "gpio18";
 				function = "qup0_se0";
--
2.34.1


