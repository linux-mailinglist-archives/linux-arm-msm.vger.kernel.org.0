Return-Path: <linux-arm-msm+bounces-89107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B46D22A42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57E68304A9A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CA72F3C3A;
	Thu, 15 Jan 2026 06:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAWuxurN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7/yv/Fn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64C32EFD86
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459765; cv=none; b=SiBgCPEVCzJEhXdMRe67/JHUUq5+9la/2Su/jr5QYwKGkS4E4jySpMj+Jxb2PDrlG4RXaADd2CSRTtesvUEgSEBKQKlNf2WlqUmhOO1q/VDlIG7yuKpr686rY5e33O6bN39mM8PN3mba887MH5pHXIqzGKneBPHQdpewnSiV0Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459765; c=relaxed/simple;
	bh=u95A8UwyluWeNfm0lyuwz9WrIcKpWk1eFWpIny4kZ1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3UmbWBdljX2bx3GvOr2yjdTU7/mofbDDip+gut4vwtFjYEjwqs83GKs86CU0IR5n2s1w5n3c4MJV+tZubkhgbQmiWymzSKj+iwG2IVSS3fFO93t6KZMLkg2WFXl2uXCQIIjtT4AtE0xdXXBvCxEQtX7kjkv9Y03ZfDHbWGfvBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAWuxurN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7/yv/Fn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6gE2l783880
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X2rfBioPjQwzQbpLVtzK/BeLLYkfjD6WSYVIUijLeZI=; b=cAWuxurNywzUZWlm
	ZGmxkH45gS9Utt5uyLkjrgXv6GHH8S88WNdGhyNpA3NvJySI2Ai0WCEXOgk02Cpo
	TGPGNZ5Oz/WAW+nI2OX2l6/lYwuxrtMokmRRzxSEAmXIZgYKNKEHZFm8JWqFeo10
	Hhc044C/utmbRnP6kDL6W+UprzHjYVLOSkd92E2vt3rOuASul7vCqp2P0HlV0xjt
	m5dJgBozWTkPAQN4+tu8sGZ3sMnsmkabwyCvP0MAKL0jsaE/7eygZkcnp+zAJv6M
	gpFTgKYUQAXUrlqMK2/SKk7zZ0uskt/AHLHnwGbuakrSlOssxeCtioOJAus+hqIP
	u4Qpfw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5jv45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ae32686ed0so4711848eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459759; x=1769064559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2rfBioPjQwzQbpLVtzK/BeLLYkfjD6WSYVIUijLeZI=;
        b=O7/yv/FnhIh+Yt68Xfwu6LMuKd6xrmghxglgHK8g2mbD4wXwHA19Htq1Lme/9vZy9f
         eZ9ehEoTFm6dbCUL8EwsdTmuMWCAaAEO9/aZ1NsaaOInwCgkB50lhEglRd7S3jA9rS2q
         pENwaC5IksRES541fBYuGP+0GWjtP5ezzjcaJDLvoPmXLjHxaP2MGEK/pyeTdDF9bcci
         WwDqph3bcGcaJt2dMjwLbGevPDZjhkb3k8rxYTt/gut7Zce93ldhPyajMS2AOyxTAdFj
         I3GRMucwf7CyzRnYr8KrAthFjbuwsJAKkgzAbuUdmYs6rHb6paWZ/9p9zDS2sedNzACN
         2urA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459759; x=1769064559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X2rfBioPjQwzQbpLVtzK/BeLLYkfjD6WSYVIUijLeZI=;
        b=oLMQzS8mz3qmNcxQjJVNi2p0WxjE30fqniiEgTRiiOYoYjslQiHChAMtOHu6YvTq0j
         ifRVb+k9YJA9m14azkgwo0jwUjntVRf362e9f4DSvkqPVJmbekF3swD54M7u5l0aEtan
         RIPQ0W+xcAHs997dRrJcoUX2iEpsbCnMafwPHLpTBmbeEvTjoEl8RBnHZqT0GMV5iXIt
         CyaVQfrXZUaWrW8hvuucOz7Q2IVH3PiGG0qpIjry3DMDFxWtwTx0FS60h7gj81AHhtqL
         GFZkVlTGzaULG+tfmquKPWweCoWdEhzzna55b4E8l6C1qB3cwTubtVIAMfUj1rlPXIsq
         RYLg==
X-Forwarded-Encrypted: i=1; AJvYcCUIYHoh0DWJ5NfCQuaQT8puUFU6ZwqbAcwB/se6nFifB0UPp+03MJDQ852PS1J4wnViqfB/bVZk3B87wpma@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf/laT89mgqBNfTBy5qAmVga3UTXplKpE9JQd2zYCSNvS4X0mu
	6CnYliWU3X85UAWdpKFeJH1P8giKnPFXJxIJ39zkicWaswVEaLyqBsG4nDp2OUT7DHipH2tJchh
	w8PV5HbEPTgrSyTBqZYJiNZuygXiXEWkLNDJCVflcyEp4FnE+6FGCagtXcQV5ipn4Nqpr
X-Gm-Gg: AY/fxX7CrjeeiWQVka1TSAWWM+1pYxX4HuFIloQpSKuPqaqg9fPi6Mmm/LgeJoYxSV7
	TtkmU9nL/qpBYzZw4/66S49U9iQAVMqP9+TC8lU9dFzKxvzHgvQ8hyZmiXWKDfG/8Agyop3gKt8
	Ukj6DZQQZ+W0dN/jq8moWYINStXG9PkHqy4o8icWjchLXBIyIohPpXvkM0LtbzkGbXmYIhppXQ1
	YrAFWcK4/pK0xHFbY3Z7Tew9qQJ1+TY4+CNzfqfHPKUjpylefnB4y4F1nMUx97oelDTCI6uHwdv
	yrKaF+6hF3hgu4iuRRKkE3sevVVtczybuzb7r8jBlAp2oIqWc43NC6Kpjt6ctw6s7txKrSseZTf
	IZ5VvV29chCAL5VoJDPAtXbmdlt6yfoxB5yNC1YtET6cUjhP+f5+3o/4tLIPf
X-Received: by 2002:a05:7301:4441:b0:2b0:51a7:509a with SMTP id 5a478bee46e88-2b4871d122bmr5822701eec.33.1768459758824;
        Wed, 14 Jan 2026 22:49:18 -0800 (PST)
X-Received: by 2002:a05:7301:4441:b0:2b0:51a7:509a with SMTP id 5a478bee46e88-2b4871d122bmr5822678eec.33.1768459758253;
        Wed, 14 Jan 2026 22:49:18 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b480dea94fsm3259143eec.24.2026.01.14.22.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:49:17 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:49:05 -0800
Subject: [PATCH v3 03/10] arm64: dts: qcom: kaanapali: Add TSENS and
 thermal zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-knp-dts-misc-v3-3-a6cc9e45de93@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
In-Reply-To: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459754; l=15525;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xsbt0rRwzUDug/wq2K92JTDC0hDjKb1OPNxV1nAAGew=;
 b=pvTFctAuq0EivxfJ0Vb5vcCyh5QkCdK+dpi+BUDayaSgjgx9BN0hvEzZE9ioy8EXt24anVzR2
 bdRqN1sgL+2Bi+lnHTmEsZuH2yWlOOJYiGScMeCRJG/itMwU6CUfOK3
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MyBTYWx0ZWRfX46VIpvJutT0H
 YeMEGQf1xCwfDmX1kSpZzhwLtaBnm+AHDAn6V6QVGEt/zRdNXfjNmCPUQulVd3LaT/Oi0hw0fIE
 kFaU5mlhoWcHM+BiXvMocWabajmMlm/Woo+wjWNo+hatkgZ29WhgyBlsFtNvd1OG/ugPDRLh1rM
 d35LFdp5bLldZxTk7ddNjD6UYize57xFB1JWhV8osRDlm8+HT8wUb/Fbm7nSRqkXjHWErHGLv7H
 uiqXvouDhC+tqHRlYpfrMjx6kNc76s40nwCaoRdPYy6cUhxFc6ujuRJ7e6ItsfsrHpzZvdRa4am
 /05LoVEmaiuupIyyQd0HePqhuRodim6E3+wTGytJ9UV3XqyIP9sGs5TS2JdFtOlxSCPDcT1v/Ug
 7xCBKVSW8dex61LFOpoTbg9O1wtlrqfIPeqh9cM9bHdI24QFLs1RE/1BWVgxKtrQfO5PYT6fCGX
 CpE+Ssl8MfCYUP0VhHw==
X-Proofpoint-ORIG-GUID: cDd9-s_JDJEC14gO_lXNW0_efbFvqX9o
X-Proofpoint-GUID: cDd9-s_JDJEC14gO_lXNW0_efbFvqX9o
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=69688df0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zKtFf2yZKBNpUNyYmgcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150043

From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

The Kaanapali includes seven TSENS instances, with a total of 55 thermal
sensors distributed across various locations on the SoC.

The TSENS max/reset threshold is configured to 130°C in the hardware.
Enable all TSENS instances, and define the thermal zones with a critical
trip at 125°C

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 745 ++++++++++++++++++++++++++++++++
 1 file changed, 745 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index df05d204ed41..c736cebbf597 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2583,6 +2583,90 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		tsens0: thermal-sensor@c229000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c229000 0x0 0x1000>,
+			      <0x0 0x0c222000 0x0 0x1000>;
+			interrupts = <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <5>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c22a000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22a000 0x0 0x1000>,
+			      <0x0 0x0c223000 0x0 0x1000>;
+			interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <12>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens2: thermal-sensor@c22b000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22b000 0x0 0x1000>,
+			      <0x0 0x0c224000 0x0 0x1000>;
+			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <7>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens3: thermal-sensor@c22c000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22c000 0x0 0x1000>,
+			      <0x0 0x0c225000 0x0 0x1000>;
+			interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <4>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens4: thermal-sensor@c22d000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22d000 0x0 0x1000>,
+			      <0x0 0x0c226000 0x0 0x1000>;
+			interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <8>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens5: thermal-sensor@c22e000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22e000 0x0 0x1000>,
+			      <0x0 0x0c227000 0x0 0x1000>;
+			interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <12>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens6: thermal-sensor@c22f000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22f000 0x0 0x1000>,
+			      <0x0 0x0c228000 0x0 0x1000>;
+			interrupts = <GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <7>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		aoss_qmp: power-management@c300000 {
 			compatible = "qcom,kaanapali-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0x0 0x0c300000 0x0 0x400>;
@@ -4795,6 +4879,667 @@ pdp_tx: scp-sram-section@100 {
 		};
 	};
 
+	thermal-zones {
+		cpullc-0-0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				cpullc-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-0-1-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpullc-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-0-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				qmx-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-1-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				qmx-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-2-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				qmx-0-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-0-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				cpu-0-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-1-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu-0-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-0-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				cpu-0-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-1-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				cpu-0-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-0-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				cpu-0-2-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-1-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				cpu-0-2-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-0-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				cpu-0-3-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-1-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				cpu-0-3-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-0-thermal {
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				cpu-0-4-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-1-thermal {
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				cpu-0-4-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-0-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				cpu-0-5-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-1-thermal {
+			thermal-sensors = <&tsens1 11>;
+
+			trips {
+				cpu-0-5-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-0-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				cpullc-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-1-thermal {
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				cpullc-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-0-thermal {
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				qmx-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-1-thermal {
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				qmx-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-2-thermal {
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				qmx-1-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-3-thermal {
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				qmx-1-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-4-thermal {
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				qmx-1-4-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-0-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				cpu-1-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-1-thermal {
+			thermal-sensors = <&tsens3 1>;
+
+			trips {
+				cpu-1-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-0-thermal {
+			thermal-sensors = <&tsens3 2>;
+
+			trips {
+				cpu-1-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-1-thermal {
+			thermal-sensors = <&tsens3 3>;
+
+			trips {
+				cpu-1-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-0-thermal {
+			thermal-sensors = <&tsens4 0>;
+
+			trips {
+				nsphvx-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-1-thermal {
+			thermal-sensors = <&tsens4 1>;
+
+			trips {
+				nsphvx-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-2-thermal {
+			thermal-sensors = <&tsens4 2>;
+
+			trips {
+				nsphvx-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-3-thermal {
+			thermal-sensors = <&tsens4 3>;
+
+			trips {
+				nsphvx-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-0-thermal {
+			thermal-sensors = <&tsens4 4>;
+
+			trips {
+				nsphmx-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-1-thermal {
+			thermal-sensors = <&tsens4 5>;
+
+			trips {
+				nsphmx-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-2-thermal {
+			thermal-sensors = <&tsens4 6>;
+
+			trips {
+				nsphmx-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-3-thermal {
+			thermal-sensors = <&tsens4 7>;
+
+			trips {
+				nsphmx-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			thermal-sensors = <&tsens5 0>;
+
+			trips {
+				gpuss-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			thermal-sensors = <&tsens5 1>;
+
+			trips {
+				gpuss-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			thermal-sensors = <&tsens5 2>;
+
+			trips {
+				gpuss-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			thermal-sensors = <&tsens5 3>;
+
+			trips {
+				gpuss-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-4-thermal {
+			thermal-sensors = <&tsens5 4>;
+
+			trips {
+				gpuss-4-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-5-thermal {
+			thermal-sensors = <&tsens5 5>;
+
+			trips {
+				gpuss-5-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-6-thermal {
+			thermal-sensors = <&tsens5 6>;
+
+			trips {
+				gpuss-6-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-7-thermal {
+			thermal-sensors = <&tsens5 7>;
+
+			trips {
+				gpuss-7-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-8-thermal {
+			thermal-sensors = <&tsens5 8>;
+
+			trips {
+				gpuss-8-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-9-thermal {
+			thermal-sensors = <&tsens5 9>;
+
+			trips {
+				gpuss-9-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-10-thermal {
+			thermal-sensors = <&tsens5 10>;
+
+			trips {
+				gpuss-10-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-thermal {
+			thermal-sensors = <&tsens5 11>;
+
+			trips {
+				ddr-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-0-thermal {
+			thermal-sensors = <&tsens6 0>;
+
+			trips {
+				mdmss-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-1-thermal {
+			thermal-sensors = <&tsens6 1>;
+			trips {
+				mdmss-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-2-thermal {
+			thermal-sensors = <&tsens6 2>;
+
+			trips {
+				mdmss-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-3-thermal {
+			thermal-sensors = <&tsens6 3>;
+
+			trips {
+				mdmss-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-0-thermal {
+			thermal-sensors = <&tsens6 4>;
+
+			trips {
+				camera-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-1-thermal {
+			thermal-sensors = <&tsens6 5>;
+
+			trips {
+				camera-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens6 6>;
+
+			trips {
+				video-critical {
+					temperature = <125000>;
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
2.25.1


