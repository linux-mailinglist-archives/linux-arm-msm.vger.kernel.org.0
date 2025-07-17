Return-Path: <linux-arm-msm+bounces-65468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A568B08D65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8CEA7B1AD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5E52D836C;
	Thu, 17 Jul 2025 12:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGbiqt2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D22299AB3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756515; cv=none; b=g+POfGmS0AUUbItJiGOVxKYyKn3iJw1rzxK+Mm3QWEssm0GT41TtBKWrhtdTUANR+AS9HQT9RWgVCEUNFne4p5+82G86J316oFnVFU8uAaY52fKOQSrHrtZNFOIce4uX6sQqgDxtxSE4okGcii2mK4SI6D2EWq5SVut/tsOck1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756515; c=relaxed/simple;
	bh=wwP0wgs37G7SIgdBXKyajalMO8uencXdkJwBMyqMQK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPb8o1JzxJMvAgO320OHQ6FZy/1TiNTg92rAixc8RfGTH6tmTKIgId5YcH59+HiurMTDdiJ5UBm8n437j5thpC1cnu3PET3+UPTSguY5KSrhauAXSoXc4hbFeJfMw3E8X4lkw9vgDtBFDtPBxbSnbY2W9X/3ApKtgKoBtjHomCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGbiqt2X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBTNPD021536
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=; b=LGbiqt2X17LP031m
	pxacikIzoEWgrYhQvwMNhiCNOL59xdHJz5aL1u+U+aKHOGrsfuM2B/805zmzKG9w
	J7szGKPuWi/Np7FiRfqbkiO8jm7bB8R9TCO2vKpGPZaZ9DlSYGSJ0yN8QMcT5K/m
	WWOmbPDp4S09DONkrVAxOCktNlcBwZs+Hm7Bwd7VLT8q7o98tcHb4PwNAvmywWJQ
	QE2sts5wQyk8tcxpRnv4kwsP9m5E/2tNk0gKZb4zpdvRmteqHSdQicpjfyLYmPpO
	3Ei06IQj2d7V1sgDzYx6ZjNMlQDuvBfC+CudPkBveTUC0xUZTtwOBAKvHtzm2+3Y
	OTm1iw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpjq36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:48:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235e3f93687so14741075ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 05:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756512; x=1753361312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=;
        b=kBOspkFCDCKNcxz9m6R584G/Zr8+YS0il7O+UjwOpzDSFaME1lpsuxJ+RfzXfN81xJ
         Dcg2EjtVq7Dq8FZEWaepa8JEp/S5e05u8U4tylYVMnkQ6G4Tb6lMT4HWTuoXwDItV0pE
         g/Iv9YVcitbdUf0cChR7oZXM32o5mAbRgwmEzLR87vm4Vdbghy+ujq0RcaOW2lmqVnWw
         M69fBq/+dZhdbScHoA0LvdRmAyImJm54Qq2p3Jy9/hYfsLbww0A5ApQ/4ndBcOX28cxG
         ncwvswyWq/EEcdXRr9npseAWT0FZW8nFkxrSyQyxnH5pBy4B3J5i0lHKZHUtR0L8y00n
         +jYw==
X-Forwarded-Encrypted: i=1; AJvYcCWcxV2ZJDx4qmDnd3KAKA+ymYTvDUdIHAQCNnLVLve5yQBg6cBAmXkcY6axnUPiHvj86SCPKJU/L/shiYyy@vger.kernel.org
X-Gm-Message-State: AOJu0YxHij9vcwNy5e/ODy0H7FzZTfvqxA1xzGT8LbeM2FX77bazH1h0
	wbwwAKdvmrw2vJFJDmXed5l8jAkuvetlpYFq7EoCnGyn+LhOA1Bcl/w8GIWGMtmH4hKay/YbAWp
	PxHJcHjCML9fZBzNFbs8eZyW8FYZlRCKqn6z0xhwmQ49m0zAC5hx6oLMAwnQUdMYPxbgB
X-Gm-Gg: ASbGnctCObbcx9C3kbnvWwGTkN46M9ZhCFI3wD5ZDbF7DM5abDjVRpC4AbFEFfo3lpz
	kG3RkzAuujLTxxrCuOuWnKwQVgzrpOSNEmyD2x8EA8AM0tIcOq4/FSrF6iHyqrioh4jrN33sWQn
	tOHaVNrc4FOvQgiaeHIMgISs/7KsApOfoSaw/nGwCyr6hIFV0NnHzkD5OAJvJrbShaHBIBX46Xx
	vXn+R8IX56Py5ahBa+I65YlvYr8K67MUlF04We8XRVNWd3ed7KnEnQb38+SMDAwKF8LsLxf2npL
	KUNJ8kP29abduqkeWeedoPdcgu/ZtnEzDjed8JSJnMDTBckpOv/i7lmi9YXiq5c8syKtYd9sqh5
	7
X-Received: by 2002:a17:903:230b:b0:23d:ddf0:c93b with SMTP id d9443c01a7336-23e257435e3mr88941455ad.37.1752756512241;
        Thu, 17 Jul 2025 05:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8DUsFwY4tYypfpmfxBilLBUvP2Z+g2tucXJh7Sk3ZEP6OFjznFBKFx5xkkD6zUVMZmlHT7w==
X-Received: by 2002:a17:903:230b:b0:23d:ddf0:c93b with SMTP id d9443c01a7336-23e257435e3mr88940755ad.37.1752756511748;
        Thu, 17 Jul 2025 05:48:31 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:48:31 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:16:52 +0530
Subject: [PATCH v11 6/8] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-6-df3e2b2183c3@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=rmo18nL+UB7XAtgXRRqne0fPUU/Z0j3760cEPwsemB8=;
 b=ppLcpvC8rVl1IEadr9ZLl9ZareIhC7diBss7JmDD0pOFm/RzNVRac0cIFzMaJsT3pSWLwEtkk
 xwfXL7h/RO3DNbgHkoFJAo3qHKOrXDxQ7WVxfN1TuspSeNiFGreIQFp
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfX+aPa4Q/1vZt8
 lJThko8u1CVAFNB+AUM+U9Pevk6c/8n6PO9BZeGWvsO4NssyrJpVsBqKkIeHYG9/qh+OvDOPCCe
 B8ovuygaCX0iU4AfuFAxBWUZ7xeC98IR6HAHN/l+Ex/+5sA4pML42V05lcBkMjaHv7U1VYOHq0W
 Sg31JNjKuGswPbbBQJ94BgEfIPLNYqv7UXkSlfrGMvmBCsMsGLOClMUvAf8LeTExKSPQu77NJAc
 1Xa6Ka9oN/NL7CKpt1kzk8cW35JcnDG+oztT+M2V3fpN8FPHWwVmPVtR3GqQ+HpP1t1JmAN+xAZ
 cTso/cnD/lfYUFta9XDvEO8tpc7H0u/Gp4ISjpMYT2BXboFVl325IB564gPs4/CKGw5YnZWJbz7
 cVgD9Q8XIBZR9fSQryXDyPDM/G1Bbze7pKpLjeFoJQTSD6WTRy9qa3EqOqrGX+N8R9Otbm+m
X-Proofpoint-GUID: 9XsmgOmf-z1KL9EQobYF1XgQp9tRPKLa
X-Proofpoint-ORIG-GUID: 9XsmgOmf-z1KL9EQobYF1XgQp9tRPKLa
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6878f121 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170112

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode. "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d839835fa464a8d5682f00557f82e..8cf289a3cfc4ac7014885494c27fb003a7258519 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -966,6 +966,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


