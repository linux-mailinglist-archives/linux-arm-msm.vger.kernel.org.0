Return-Path: <linux-arm-msm+bounces-65467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D98FFB08D6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03472580488
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668D029C33A;
	Thu, 17 Jul 2025 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OleD3QDM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5C72D8364
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756508; cv=none; b=KXKtVr/8dWu1zsHm4HPm6fvtuf7NGKE1x74yQce3vWEFPDmhJwxNH99lstBzLMUHFBVCXgWcvYZow7dB8rpgrltzBlwq1ouHVlfMlhzxyJdDl03SZWsBGKZZk1gR46LuPicWRFZMbxmwVUxjqf6BPjI917IlDWPJiw6LcCYrrZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756508; c=relaxed/simple;
	bh=n0wa4AEusSMKTJa2REb6Zm/CPFmojeqETl81QHufxBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMpplK+xuX4PhFqyHg2XmbKQK1/h3dt0DYT/sHnJLC6ULYs65HPiOVCWKRetB69yw0PXdS/pYFYaTnJhAjpWeT2gTVl0zAvGyLLh5+fVRskHdcwkZGidLCd34Rx+OKsw54JOuZpZ8uq49R22Q323gEt/bMCq3CxmpI58zA5brIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OleD3QDM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCgu4m008506
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=; b=OleD3QDMSnB0kFR5
	QbrMf4A0Nu6i+xPLTRqU5b5RmVXSxaZ9+rrFo7PY++s6xYefUKFJNwYxZU1AMc/q
	Wd5vTJnnNcoNSdYZLkFZOIEcSv4aeQ753yuY5XjXYfeX0va5UGRrafeSM6GD8wq1
	I/SM2QArHsHlDdIfEoBN/Cg9oKqf7L0FMqVWNhmwhmOfZXkitG4dH4zww7+I31Pw
	1yNtfQ1YzGutK2wNmkolBBbUat4okFLBOmmyHOAzuMQFFcixxjKQBaUmMMwLzx9w
	SZdngh9Ed5PULMd/8BHHum3RlagD27Z2ZXEc3vHxB6aKHSU5LVQ/nj3x4Xk/ix9M
	HgfE3A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb7nyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:48:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311e7337f26so1083625a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 05:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756504; x=1753361304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=;
        b=RiNBWwAlY75+HP+l1uW5pvrK4pNgc8wuF+PQlKE5kdyjpzFMKMHELYYVVz9GZf2qHj
         rcOQ+nb5Bwekn0iKPKt0XbR6Q3iKqw28biobzsGjForUv9X/M3amZ75JZgcgqK2MUf9Z
         HyMlG5RYxnKaxOHvI7ArLuD/xSM9vVx9doLsbOJ7CCqfuIJbgVfM2gsLv1+wp7yYlcWb
         ssNZfBUwAxwYBxHcJhCx2xtvJ0McjtLvnTRrrJG4Mv1veWTAbs21O+PruHzTE8VfljYf
         1b79sKjTKCFxBVV5o7HiAW+1CDnxV9K/wVFa8erJpPWSN7tFdDgi4DYtoToNlaerNsOc
         cEMg==
X-Forwarded-Encrypted: i=1; AJvYcCXcptmLSA7ckJffCHf63IKsfeAhyVrduaaD5MIZSbMLXiSeYl/6MGBaWvv/Ra6YTJbR7E7QIZu3bYbqh8o+@vger.kernel.org
X-Gm-Message-State: AOJu0YwMcLCoeHBXIZ3hfnr6CyNUNaZxF9XJ/ngRMtlOCVTkfSMPF9CZ
	yMp53swrk5CTvE0AappL9LNJsqeFOwmKLkJZWmmCls90y/hlVkjSqc2egVsJ0un9rb0pJgHoA2o
	FllsWrwGrkZ+xtRPLycYS/paFrQS74fnAY00pYwYgae0yJlqTIMl1xLcwiFis1j8rbdQO
X-Gm-Gg: ASbGncvSO7RgJd2Mr/DZgPo1hVhaEq1ehx0YHKY/6hSTv930JIr2KVQsyeXXZ7qZYs2
	xoYh3lM6NO/nYpP9pfh8wvocR3jcYBDooNCYGEnjidcEZoTIuYzj5R6JkQtgfMVE4YSQZ/3UI1V
	G7dR77OSPukxWADgEQLy5bW6Wj0DKjNP5UWyGQ2bAOTbWWyapHjKWGWbkOUmLWS0UHu82AXLTOV
	mHySQ6pmSirRWdwfqyvZzV1XvB/FONFZwPFWG74cEABJuo81MoUhX1B9uDoP+d13T2w/gXMXRYL
	4/H2YqvqAdUcLPMPbpafigvndmhj6DVhag8p84s9U0NiWjfAEDyf2LjhX3qyWLP2UZBMeeZyeSm
	n
X-Received: by 2002:a17:90b:3d8c:b0:316:3972:b9d0 with SMTP id 98e67ed59e1d1-31c9e5fcacfmr10321303a91.0.1752756504279;
        Thu, 17 Jul 2025 05:48:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVfbBlxohsXCc2xaE5I67a16rXLDbWY2pLu/jks1PnLsDto+TVjiDWxjRUtHLmCkYlmqeVog==
X-Received: by 2002:a17:90b:3d8c:b0:316:3972:b9d0 with SMTP id 98e67ed59e1d1-31c9e5fcacfmr10321217a91.0.1752756503454;
        Thu, 17 Jul 2025 05:48:23 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:48:23 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:16:51 +0530
Subject: [PATCH v11 5/8] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-5-df3e2b2183c3@oss.qualcomm.com>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/OISjQAhUBAIE37ASE5b1kssDpdL8gfQSFob68FR4qs=;
 b=XSN/9ti8C5qipL44dj5FAZ2QRrNwANKVYhyqlCyp9SwpFFRbw/wawFmv17T5pBXhvUzvKxmxu
 NFzHvaaVO1rBYtjuTYcep97ASAoayTlgr9TSXw6xEqBBou95yYoBpy3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: Dx___dmza8BveBPntoNipYF5bko8zFhe
X-Proofpoint-ORIG-GUID: Dx___dmza8BveBPntoNipYF5bko8zFhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfX09gybgGU1F1J
 ageHuzELHGoV70mP+bVjWgVfUxkh9AGABxUxwEi5/TQf/UCgL8+S444Dt8NqQfhachE9gINRmbR
 GFwG7l9RG2hD4wonPxKLws8P1uZ6DETEpBGlD4WbNc+t8qKpklF5R8AzWD58aAm11U1tBoK7jFO
 XII7Eotjty3Ex2Wc3gwuur+mDnM0gqXSW0oupHXeU/wTxsZv/4XFDMnqQ1+hk1U4R/iCL6WSsNJ
 Xxli1PlEihwRlhZyaZwACs78yQjW2lPLxXyLnPjWLg5ZCbHSn8nnUXn6rZQoDHFQF5Ovh3NApWe
 81riuAhoXr+c9LG5+e7Ti5GCct0BkjFtM66l2ERHkkQZtsGmasSp6Jb+rTjtrzJLEAY7emX5srX
 VZ749d0hiZow1LYdvQbOQ4/PEFpO8opNTBdh5b4vqkGm0fBcjFUGJnHBj/RCeJj5jwazDHdC
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6878f119 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=956
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170112

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
index 7a155ef6492e176390faa3f2dbe419f5cfa62f0d..d25dbdde7dcee9fa3f1bd48a38baeae0f063023c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -654,6 +654,13 @@ &pon_resin {
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
index 64a2abd3010018e94eb50c534a509d6b4cf2473b..e6a99ef50b9b9ade9d2a71a14fcde429f8076dd5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -857,7 +857,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


