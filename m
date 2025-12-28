Return-Path: <linux-arm-msm+bounces-86746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B709CE542A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 18:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D98B3010E4E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 17:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768DD22A7F1;
	Sun, 28 Dec 2025 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzoJRjUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIZlcZxe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C84F23BD1A
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942494; cv=none; b=uje7aft+993gazYK64Q/1kCoqDvWVdDGeK5oTx9ZulGOfoRsfrt0hvAvaVtfrLfMKzo2gvBySeIwkayzLu7RCA/EEOp6/DJmz15nmffKk1fA0b3ZPSClc8J6YZFLvAgHD9EpuTjdCbjYDc4/nmMWUfzz2lwfI5I0OdJdWIB/Vc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942494; c=relaxed/simple;
	bh=Uo7klXz4CKVLIAFhyMsmgHyzo6vZoHcxyIjPIsWKeLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvbhM2c2GlRyFTdmCcO+HW5g4XcLfIRjuz0Ps+cPv3ihzaWeEfhsjLBirfu1e6uZ265MXx2+serUosRA87zymd/7UyWBWUld3ozgMJjso0ya4iEs6t4xI7D120sm00aqEKcV6B6V/XrIUMt2KjT5nNmzY6pd9QQWHSTiPwvgFic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzoJRjUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIZlcZxe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSGfjMq3359574
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=; b=EzoJRjUL8QD7E1Ae
	HKl2pINuG45uoRMGUNlAD/al3FkjgqxLl/ps3pgvOW6E+dusZO9NvAQT7Fy9nteh
	4nQayV9pkeBHCjzIZVQpsywW4KEIllG5mAyWystic3c3F756tV1FQD/dr6uB7YQ1
	t1NZAUURUOYgsChzdx6ByGKbigmuQN0j5xjsWc5fOJiRL7zNbTzYIFhWCauUwIab
	iMOixZTTd1TwkXocvpypOX+d5wGjKkKD+v4L8ROpY0OyNGUPpTuai8mjAAUMu7pU
	RZhvCG8l3TLtLleQ5GtD4utdZV1JUuaf7pX2YDW3DrnTQv3uRFbEEUPUSBZVt9oC
	pkN6cA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsafuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0c495fc7aso126275975ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 09:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942487; x=1767547287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=;
        b=CIZlcZxe7D3AvHVYlUJiNZiKnxi22zaL0ubmiWyF7I+bXNYrJVLzDozGuT5Hd/+5PK
         zcZZ+wUizoJyMBuPPMZIM+LLi5puhg5x/uECcVP4QBFogyK4cd9AJloJdFsHHASRl8If
         /vYhTjVgR2Rz98gOqpywRqpp1c0SnJ61qut/k9WRa6ooIFHXNKLVCmrmEm66K2go5H9d
         9W98LPLjmth0aAkm5yrDnbMmlbhmVGCMQFV4Ow4Pkr0ggbrMfOjesd+91l38rovQrs+V
         9p9ktgCdPtimxrx8qm6Kb0CINNMQU6egc891tx/DqVOOppAW+E1Agqec6/pt2w3MDt9F
         E+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942487; x=1767547287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=;
        b=vvWqXgRRuX1YHwyj4CmsaD284Kkfv5vZ8IbAF9oeMZ9fjn9tR5F8i6f31YfpKmRqx8
         e+Vf3G7o5nQaC+twqYMS36CEeprtNhN71rZsK+FlXAEyVjJMwBuhDTVTRcO9niZyLhZA
         HR/Zcm4qP98HC82sjRB0iAjZkhRPYlj6wncj9CmGfv4REF5TmOq+OLus8ky0qUY0kxgL
         kXWmj/WprOLuR4w1zUzpZW0Ida37yMzFbmLQdcvNmleKWXs044ab9mdlEuESbwr5QTTD
         BYxACmbth2e1j7/PDlmoDr+v2Py8ypFKy5YksPcqzJYh0bMhjYGG/Sti2k5dtBY6kM25
         1VtA==
X-Forwarded-Encrypted: i=1; AJvYcCXwXiryZTg7cmBVsDHktU6JuH/9uAKfmnL2FdSZQH2B77Quja6sY3pcBnE+3SS3q0U74UbLa3E0gYJy4ahh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0cuCWv7NtNEccrOIHSS9yTxTEFMGZgkUn6pMAZsGX7IvooeyX
	XlpS2/8qtjWXL6VC/e+VI63jAoERZ9JK2zyHVWrJfPJ2mlvrEfwUFvVSH9Rq8zxHAwAalXSp+oD
	WujWEUiHNLNZBmuyoUVYXau+KlNux17V72qsB6A0UEOvwrYGbwt67lOLlMRiAxq4qWvDK
X-Gm-Gg: AY/fxX6mvwm40LYKwwbOAeL2xTOYxDwgNPKP0Cgo3LzZq0tyX6l9oz1ouuy/7hYdmXw
	juSwxUy/FNq+2Z6qE+s1LMUj/0DNOONGT5mVALadKECY76UmdutoYGJJgjW8UPOESWPZ6h0tPC3
	GYdP9Jvi99pY0hjGXIopqzA1N+41Lfqva3OOtQr8WZsyNfA8aSeIb4BKH4JSdmLMQbU5fKoo+t5
	nbTmZChYdplybM79C6sm6BIj3sqd9jwI+Y3COQZNZe5b59CrSVoi6G1uNkEsavk33Hhok978ofB
	hdrM3O41B8Tvjr46zOCmK781B6WscZiR/KkaOBlI88Jc1G1/cFx5P7CZdY4lUWUSvvg2Age/puH
	eW7BkiWEFa6pWepDJC7wnyDg64LRnWWh3LiGecy/iwyDygg==
X-Received: by 2002:a17:902:f60e:b0:29f:cb81:8bd1 with SMTP id d9443c01a7336-2a2f2a3b006mr265902315ad.55.1766942487233;
        Sun, 28 Dec 2025 09:21:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJSx0CMlPpO1gbVee/NasF0jklirO9YTG+DoM9fRKyeRuAQjt6WQfhSmoqGrvLFTbitc7NEQ==
X-Received: by 2002:a17:902:f60e:b0:29f:cb81:8bd1 with SMTP id d9443c01a7336-2a2f2a3b006mr265901855ad.55.1766942486618;
        Sun, 28 Dec 2025 09:21:26 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:26 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:25 +0530
Subject: [PATCH v19 07/10] arm64: dts: qcom: qcm6490: Add psci reboot-modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-7-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=2238;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Uo7klXz4CKVLIAFhyMsmgHyzo6vZoHcxyIjPIsWKeLY=;
 b=zjun3NJ8FbNcNuWN/6W2esPCepQblwL/KYhsLnapaNMIgfPaJlJOlH3y48HuSQBk1iYvQhDM+
 ar18UWmDTO+AJOzp1Ozc76c7Cd1XOxCe0UtGpGJnqzOhsYWwxlYo5Y3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: C4e-Djpa9jT_EH7uvWSCW91-SIx2RolQ
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=69516718 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: C4e-Djpa9jT_EH7uvWSCW91-SIx2RolQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX/FCbfwIzO36y
 lyAMqIBx6NLpRvSL+4wWDcAMBiQNqjlK+qb88cBUEwooe2UDje3Bu6OkFhjzwg1Dr1QHzNgiUJi
 bomKmlnvJOBIBIhAM1MmEPxDfaRuNC5uoO7JS1dHqbu5umwZeIvd+iDNT+c0axZP7xdl16XF4w0
 T+4hQ1glkFmMPG3VeI8n69XeHN58prYzqXK0hfJ9FnsBKNU1p7t2hY0WP5fum/oJ/jWaJChbDrk
 mGWsAXRSYkbw0YTAXHs9/YQOwAyfuY7KH+hY4U2COBPCQ3fafp/ufWvIj0ALuwEOr3NLyRu+FKm
 VAnMwp7CIQo8eihcbDvlgQTzmvXNDaXsukyjqspS/mdBXCOc8SVczUqrrgsR8RM/3UGMA7yi+uF
 JYHQqDNpZNCYR7qzqav7/909Zv7CC/bI97ARWG3gW9fpZmDUjZ3amH5fK+Tq1v46I8LKOpNvX6G
 6PjDRoXKuzF5BRnbU/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280159

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci_reboot_mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all sc7280 based boards.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c2ccbb67f800cb9927627f991e3d97174cc73c64..e319a1894901cc9c56a89cb8b8ad0acb7a18dc99 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -858,7 +858,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 089a027c57d5caed103f41f20c01fe1294b4c950..5816cc1c033c396f49fddbbcd4b09e5a633bc804 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -695,6 +695,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f29a352b0288e9ef554ecfff59820ba39bf2cdb1..6e836e476d595b7e1b69a0859cf2f697c529cbfa 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -935,6 +935,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


