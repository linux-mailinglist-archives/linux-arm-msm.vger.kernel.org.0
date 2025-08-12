Return-Path: <linux-arm-msm+bounces-68739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D2B224A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10B071B6317C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970FC2EB5D8;
	Tue, 12 Aug 2025 10:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJck6q9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35492DC325
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754994771; cv=none; b=Cy9vnr803gA7KOH4il6VKqO0/EOs83itP9tHV43zj62L7jhq90TxOe5wiNZ2omHCj/bFrKeZWhl73z7uAzF1c+D5w3wtNHR4ojsMHm2hdNqVhAWvfcJyYDJRTTbsm28MbIRaEnK1ZTuiz8Z59m0TLbUrSKv4Jy2/fY8A6IQcPj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754994771; c=relaxed/simple;
	bh=Zwix8pen6Yo1Fj/mEtsWMgFNTSBofUUZufpqCVfnogo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qD992bktYcaNIfUJNPxJMLFg8alWFQCTW3bD/GOx/6i9S+MarrlCun+DJm0vFlq5RfbuUaKJFxn1rZ5tUR3dW65SbB/RbqrFbWZ0N7vg7p++CVQca7e7suAVxZnQEUWffwgemgCNCd1HmylNkxiqjohiedZbIgg4jqfCsIDtoq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJck6q9F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C6V5OJ024514
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I/yvSv1Fr2dEsiKBH2Rhrq
	TX7XXrniE2jmkhiSsbkIg=; b=cJck6q9FJsLrFLtH1Af3cuzRUuYyO5QKLVqAcf
	Uo3ntCWxiwENGGviZJ6Xm9GoWyNpRmb21KCRvqSZRRGqVVIdraxYxpMd9KTSDL2r
	UgUhEx/+zVR6SmMXhfzk06RPvVCJ3A7NK2HbHEhqWAcZOxKWfGzjgbaj6+Jw8Tx6
	DNw/7jSbAlZtUc1DrVf9VqagQxqrK9M5kAbqAx+j/eGbCAlTwYOPU870vydQg5tf
	EJhVb4Yyb1JjJ50cefQxDz0jrxJtLE5+rMRCVQk4AgErLHOkH+j5r2NRgepgfYpV
	EDAyamIS8hG8Vba39NOnBG+6cVtJ1YKBul26wPy2MVRlT/Cw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4bs6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:32:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31f74a64da9so5865812a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754994767; x=1755599567;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/yvSv1Fr2dEsiKBH2RhrqTX7XXrniE2jmkhiSsbkIg=;
        b=vCE2ihsSb/7CfxbqRl1CzWAn8IWzpEsiI6kRJK0jJZraX8OuFQibEqnhCkdu+bwjvS
         ZouASKmvKPdqeSN2xKKED36lTsx4UK4o7Yci0rkZgDtgDjGdSvryDEYr8gA1MFR8Ssyp
         DWI/KshhWEvgQKiJ18V0O/xTDAyjpbxTZ4QtDrC8TDt0HwOmIJiBWOXomjsCxcDVflFk
         Yd6H7M0st/ZMeEGhmlkK43PQz0xwP5+Joat588Ugp8ASU8jqCKlj2mEq0m3ih8H0t7L+
         MZevrea5ShYkAFtn73Qv/mVsjsJIXH4Yzdou6u8f3cry/+pqHLAeyynLtWRyaQMPh7/V
         GuzA==
X-Gm-Message-State: AOJu0Yw9fFzc5dHLnUD8jE2ZVvy+3XD9C/nLX2252bopeyD9G8syc5yk
	4q7G8diSQDHEJoGXgqhoFr8du953qv/fdO7lyEQKLLb1sXkxy1jw/rUM8tG4au3ten5x9HjcgV0
	ytxOI9dufC2tGqlY0Y09VLGxjDGvk2W1klsEufODF1eg5O6QvOdoa/Sp3Gy2/9xHnGl87fo/6XF
	/K
X-Gm-Gg: ASbGncvTNPVvsU0uK4raXh4yA54Rc1C0rPF90T4SsvzEC+JbV/LEP5yGsXAmA/+3vbG
	vEUxq75MHg685N1Izdz1l0iRifTJeANnuomvLmN/4VYzi4pNZYXnIXHi7pIRZw9nc9d/D47+tWX
	etPZZHmA0Jxn9pav1EwXp2xd/q9Y9bzLNUcpmTunW/RnshTmnvFbbj9/ieXbGUNQ2TCBiUAb8+6
	kjC7EZlApFjaE6vLFV1IgfCC06nJqxWnaE8qZdmX3n/7Avf2kMF7CJWxViQSMOJJkZo5wmYV4dQ
	KzZL4/hNXtSj1rUd6D+LSxqB1o8cZsVP1fM4iHgbVloLH71S7NYaO5vUo5ZrwTygeW+pLyS95bs
	+jOzyvgRCei12TT4fx3SjpbSWDbjVrd6R3AzxKhrdWSqOdQuv48PVmwzQ6F7sGP324uaGFV9zRX
	o=
X-Received: by 2002:a17:90b:5805:b0:31e:f397:b5b4 with SMTP id 98e67ed59e1d1-321c0ac9f4dmr3525954a91.22.1754994767344;
        Tue, 12 Aug 2025 03:32:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNqzpXCGTc7BzJ+b+Y/i95FDTZGkUqpqGqRJHdC9mzekRbVPu2i61yvQQx3jX2Yxjf7qyC4w==
X-Received: by 2002:a17:90b:5805:b0:31e:f397:b5b4 with SMTP id 98e67ed59e1d1-321c0ac9f4dmr3525926a91.22.1754994766825;
        Tue, 12 Aug 2025 03:32:46 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b46e5074e87sm3886564a12.54.2025.08.12.03.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:32:46 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 16:02:41 +0530
Subject: [PATCH v4] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-ipq5424_hsuart-v4-1-f1faa7704ea9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEkYm2gC/13MQQrDIBCF4auEWdegxkjSVe9RShntpAo1JpqEQ
 sjdK90UunnwLd6/Q6bkKcO52iHR5rOPY4E6VWAdjk9i/lEMksuWd0IyP82tkuru8oppYUjYazK
 yE72BcpoSDf79DV5vxUOKgS0uEf4yuuH/ma1hgg3IO62NkNbYS8y5nld82RhCXQaO4wMPyANDr
 QAAAA==
X-Change-ID: 20250812-ipq5424_hsuart-aea96eb2819b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754994763; l=3222;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Zwix8pen6Yo1Fj/mEtsWMgFNTSBofUUZufpqCVfnogo=;
 b=6TydxKzUmyHfBHekNKC5K6tDmoenhnaF18uh+kLa6qKlKp20yyLu6+cUPDf9coyqRoTSWRTG0
 paCZLVLlbodCiXiZmMl/PJ8zipHKjtG/T61aa51c+bBsrThQrdG8hrh
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: vnVePV4aBMJNHs79w62Fh8q6XASdtpCb
X-Proofpoint-ORIG-GUID: vnVePV4aBMJNHs79w62Fh8q6XASdtpCb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXxoSFBvVOSi8O
 W8mYbIy4El8uPpVGxjliiBm2Qsx5CD5kSl9P1YQSmqNoISbMdjgvoCHNBbYHSQNsl3OtZgNAnkE
 i9zfPc6RI5gd8M8l4OqD7MnhL16J+9R1yZN8Y8hoD5sERbCZdJMhGsc93AszNya/dI/O5AJJGVB
 jxOABP7xvQ7IleAOVKgQgiI9Mq3TIBPfovyJqORuP3MozT/fFNhU1P7gkh49FjLTxSuCDSfEGSk
 ADoAo8aO3BW5heGOUcpoNsi7Q8vSQAhJbUIY4ZcIdQADslUicqS0uPGXYAuxr78fOCv4Quc9yWp
 NTcqyozAhOUrjnZyfW/74N99Eda85AbKJTFjlOMcQDF4yl0cv4fdjaGZleXhal6cR4ssLreQ5KB
 Exz/+4Bj
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689b1850 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=WJFIjaQOFed4XKsVb8YA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_05,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
first SE, which supports a 4-wire UART configuration suitable for
applications such as HS-UART.

Note that the required initialization for this SE is not handled by the
bootloader. Therefore, add the SE node in the device tree but keep it
reserved. Enable it once Linux gains support for configuring the SE,
allowing to use in relevant RDPs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
- Keep the device in "reserved" state (Dmitry)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250630-ipq5424_hsuart-v3-1-fa0866b12cbc@oss.qualcomm.com/
Changes in v3:
- Add the pinctrl configuration for the SE (Konrad)
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com/
Changes in v2:
- Correct the interrupt number
- Link to v1:
  https://lore.kernel.org/r/20250624-ipq5424_hsuart-v1-1-a4e71d00fc05@oss.qualcomm.com
---
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  9 +++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index 117f1785e8b8e3eef3ea4df005ac491ad4ed76b6..738618551203b9fb58ee3d6f7b7a46b38eea4bf4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -224,6 +224,13 @@ data-pins {
 		};
 	};
 
+	uart0_pins: uart0-default-state {
+		pins = "gpio10", "gpio11", "gpio12", "gpio13";
+		function = "uart0";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
 	pcie2_default_state: pcie2-default-state {
 		pins = "gpio31";
 		function = "gpio";
@@ -239,6 +246,17 @@ pcie3_default_state: pcie3-default-state {
 	};
 };
 
+&uart0 {
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+	/*
+	 * The required initialization for this SE is not handled by the
+	 * bootloader. Therefore, keep the device in "reserved" state until
+	 * linux gains support for configuring the SE.
+	 */
+	status = "reserved";
+};
+
 &uart1 {
 	pinctrl-0 = <&uart1_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 2eea8a078595103ca2d3912f41e3594820b52771..bd891e39f33e18864a1d4c2bd8399b8b7486fec5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -442,6 +442,15 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			uart0: serial@1a80000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x01a80000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_UART0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0 0x01a84000 0 0x4000>;

---
base-commit: 2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
change-id: 20250812-ipq5424_hsuart-aea96eb2819b

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


