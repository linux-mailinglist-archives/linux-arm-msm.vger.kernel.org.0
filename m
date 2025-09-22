Return-Path: <linux-arm-msm+bounces-74430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 271F9B91786
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 15:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A195119001BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 13:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3049310763;
	Mon, 22 Sep 2025 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QsGWt0dE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7D830F554
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548510; cv=none; b=MtyEybW1bwPbNDdoMCDmkBGeBl48DeDYh3rW4WGeUeNQz/lMcWpDmwid2cEZvXxFAu/dz8DTYlmXoOq04v01ORajlHD6ILKbO5Iyx11qjcspfpcwPusrNfsMn+ruYPKvbBL7LUckvUH4xkqpK7q4Vk0Unh3mnf9rlkG25ZE+cCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548510; c=relaxed/simple;
	bh=jt2htmKgLAbDjy2GYCODQ70+pePb2+pA3k9K3wbnmBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHeWEYMsD+gvj2ClwfNMI3OIpNfhSK/wUiZWrYtAyUdq1CTMQXV0s2iLqt9HVdiZ1MwfNFG5QZRpxMSx2GSowkkPXQoAy9cwHKsSJ4u6XZeJSGLMGIYDG0Fkzsr2dR0I1JOKGTMkAPoDHaWwHv6Hevf3XxLX2SbLBPmf/vdbhiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QsGWt0dE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8rqGq031715
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XX86OrjTks5Leb3+o6s3i4q/wmypiYTlR/U8wdD3TE=; b=QsGWt0dE/ChdseDI
	HZp7l9iSEIy852PjlP1haS+wrWWzb3edOqlYm5RjQQV8iKYM8IT2wY0hCUqh/nbE
	VLeJUC5lp8VL/hnXGWz7BaFyYyQA9Fo8BOrdeFGSo+IBGJvYA3TLimX4NYXt6Ujc
	xu4tIo3mrrud6cMxjUPrruolcdrSqOkUDFBWFg3NkZemrkaX6bt9kpdru/NGcU72
	R0Lbfhsjf+13Fdiv4CaZAoNzanCXaSh1tZ8PZYehhf7wUO0ID400WL+6SY/LLA41
	FmVozoctQwwmI7P7pkwYrRBTcrksGaWOazf68DQaITClPOQAU8rUzCh/e9Mo5/Wh
	1TPqag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhmy0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:41:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-272ed8c106eso11170325ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548506; x=1759153306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XX86OrjTks5Leb3+o6s3i4q/wmypiYTlR/U8wdD3TE=;
        b=hW81GYnOZhgRM5BSxU8MspKhN0d4qJ3R3zJLnsl7PDLj9htU8yaP1l4HB1pb6JL3wE
         2Pcvf21Y8m3q1qL+vmB1UTGxL54iv6Tz7k3PdLU7Y9P/qm2UbhChGH4hlGHI4paJOIlz
         CnFl7Qiy5Lm6Shqo2MVNzwj3vEZq6lMnQ8lORRjb8dl8bSpikHfRLkKkEznZQEw/umIn
         v751izwH0j2Bs1nVE28MFmbRHEHJjQNoXn/VP4HUH3GzdNjT93gQ1wgFePg4nBxQ8GGA
         PAqbPuCvP8kPOYRHZEursZeyOzKCh69BsglBpEcUDppa3Rdwqc/XEgga+MIRDNT7Mh4C
         f/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk2CNIa/VjRoMYQkjD7vUC3WNCUeh2kjru2mD4twWbAe/rEU0n7Nik8gerfPCRMXn4V+RBwoGyOVZb36lv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9sbI4EIhw+VDN5+QaTtZIOcLUYMp2ErrXpPKESSNQLEc4G3S/
	fbG9M7zoK3yZBUBEibbduwGv0opPNYdJFYqor8exL2aqQz9G+aAkeYHf/vKL1elZ5eDkWPcz/Kx
	pxEAc9H41ZrnkKHCTp+3b7pnZ5nZnpgA4wl3lrDH2CMxFGwMVc8HXWlnMcINeO0EpOQd9
X-Gm-Gg: ASbGncvMj6Ba5GCd95R+UFFfvFbsoZCAMhJ7NSS9+6zExatrgPQ1mmtvtyBlws2fqXB
	QsXCwTkRdS57Nl9JXCoUsKfM8EazF8FNUeXYyycdfxIMeo9yWFZ01mn1r+PIqpivzVK+0+isfJD
	/CiQWL5DFvEQkmr2yS46LTuZUHFMLNteld8Jzn5y0eU3chskVgh+9vadnls3cbMMh5qG1dAAwWF
	c+3HjtYwKqpZ1Ys5+YBaE80pkaJyJnyLMm7knNZGBAk7wmwYkIAXLn8jpJ5osfomymVrt2z/fR9
	6kEjrwaejnDG2WgaieMVy+WiBuCnBx5C3o275Zu5yzlnvozL1jhounbHpm1+e2cSeoTu5EpGiSU
	l
X-Received: by 2002:a17:902:e34d:b0:24b:1589:5054 with SMTP id d9443c01a7336-269ba459b10mr113332425ad.23.1758548506380;
        Mon, 22 Sep 2025 06:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgNNvAsHHiGeaZP5VoAA68roYo+dylnrvlMM5UcciZSIuXaq9nHAxUEjxfhhDGauwJ/C7wsw==
X-Received: by 2002:a17:902:e34d:b0:24b:1589:5054 with SMTP id d9443c01a7336-269ba459b10mr113331885ad.23.1758548505861;
        Mon, 22 Sep 2025 06:41:45 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:41:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:18 +0530
Subject: [PATCH v15 08/14] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-8-7ce3a08878f1@oss.qualcomm.com>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=SNQVZvT2DjzWoTyJ6c2xvqRrn5RNzP7FXJ+E143gp5o=;
 b=cXxhuEtcDtlLV8MbUWnz95YMzEkXXM9COlMe1WkI4LfKje+lywF9OJa4i2AekHnGx7dhm86zA
 TeShTpKJYqcBxvl8B0sIHfHocfMC4IReLyv/Qv9fiQba51ttSWvHuez
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: PbIrS-s0L0s7SyePI4fW8yb3wMunUtM5
X-Proofpoint-GUID: PbIrS-s0L0s7SyePI4fW8yb3wMunUtM5
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d1521b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX1UInt1CP/d3C
 Nmsp9oYdF3M1DcCwUNymWE4WL4Gs3wBYcM8Obp+LZxeEksv3e5DqMBJsqitMTf9mHGlsT3e+vKB
 y7WbYH6uQuBjxxGvRspe1xLphHqlrw2KrJoouDs57klqRGfwXk4eHKCirUJBZgp2LKM/pIp0urk
 zErZchsKARxchMtucwcL5ouJLkZr4Me1Xu+WQmHvwLGW3dCmeYAfkS909jyBjnnwHVpYc8zuxXs
 IwNFz87Q6hZBy1Lg8moJY2dQuonFweev/SVmOcpVJ5OnVPhu7fvbJyH8xextsZVPkCbFZCksi01
 fnuG/UDNKu8c3WC+S9MUUfZLtnuYpmTFJyhcuWqbLkLWVmjbMMhR6ydGQapxRm2zw+sedMd1lg2
 oZ70B93M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcm6490-idp as reboot-modes.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode. "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 73fce639370cd356687f14a3091848b8f422e36c..84322b74917f3a70adce5a4182adfa5d787ab11c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -695,6 +695,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 4ac909214a8690111b2596d36a8e6e79d0f05131..bed389aec1c944a849fd2212e4e35e2a729fa935 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -858,7 +858,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


