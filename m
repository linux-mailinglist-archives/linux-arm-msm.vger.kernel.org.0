Return-Path: <linux-arm-msm+bounces-42932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F69E9F8D5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AB4D18872B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0AF1A8416;
	Fri, 20 Dec 2024 07:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxCUzdBm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C941A8404;
	Fri, 20 Dec 2024 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734680185; cv=none; b=Zy8v3hyuYs4Y1nMPNwAGYHfu6hi3WpGR6nGo3vvhZBkvFIuGQHMSew8XT6GbZC2V2VopL8wiXZs1WCiKgvgtIEFd4qfYecLwJGAGvgpJc3csFlI86Tc69B25wyu1tlnoastqtBkQoeJviz3vF8iiblhMPdPCnUALnrAo5NQI3MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734680185; c=relaxed/simple;
	bh=bB/cH1BkAsnNPyV0OvXZ7kfOHU9q1gs/7zfd18lXTe4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lGj7U3kgu8xCi2SUfCcSWea1mFnqPTETeNAgMdYtD5A0DlrFWbL7XaDZjWa+h1soQ84LO2pFvEYTLcYQv6USNCWQZ3w88MAlQlcALEe8kMr6AljWRN2xlYeIm20TSe3lmv/B8HA3AGNr283T8Xu5zmi1qZX9TusAzrLFwAgzNtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxCUzdBm; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso2951134a12.1;
        Thu, 19 Dec 2024 23:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734680182; x=1735284982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjvoTnLajbhK8stDtq3vTnpcqmR1DBp3TItoZOoWAbk=;
        b=OxCUzdBmD8108UaAYBCn/3ZIrCypdVjoaXL85Vitw6V4KArcGvfmz0LP9po9btKeqg
         JofTIu7aT1fegIH+kkPzwuuvEHTr5xD1KK4YFuEk3EnZH+pDEPn4bhjonB8a700i9zWd
         pa9UhAGhk9bbKI42YdoOhDC0mFPOLr2r7dm0fzBE/Xb7wSBB2Dlla2mVq52z415wJY0w
         mord6fFbwT676/7e82e5+9KUBaFIys2USW7NmhI9r+QLcuelzbFxOTLRH0Xgbv6suxIw
         /1QWET31JwRZTfEfe2/C/UegRRure2d3y02laY6T8Y7s3Smb7n12IWwoyL0goXUdPznq
         XhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734680182; x=1735284982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjvoTnLajbhK8stDtq3vTnpcqmR1DBp3TItoZOoWAbk=;
        b=ekVoy6TNc+GtJauhsCD5/Qh7s/gDkvO3BEg0BGSW420AgTdLIYg0PFiTPs99cdfsk5
         /ELqRjTc9jyGvVap45r4patXSlNBNgea3lWrQSGhJRb724yYsGxdjuCvh+fyHYreAJdR
         HvK7lL2D8HaksArDghalsrX0NiaNPCbtYFY+NjxtH4VMaBskHRTEAmgr+drJ1LhLfwwP
         s3RjCNz8/BHcxwMJu6s/63k0ODfnuTLL/fAISn6ewe1p3/rg9y/XFfxQgj7h3nWh1NTZ
         JNRKSJPT9nZ+117nGJevoTmFduQF7R/wyhv352AR2cNRO2MoNdVFYXcjJ6ZiHp8e66ir
         OcTA==
X-Forwarded-Encrypted: i=1; AJvYcCX/kyDX6egmMeoFEzHgWIeTjzIEMcqMhGUp3dm7yqBf6/m6OqVAaFUYBs7QyHE/y4P7fpL2J9c8@vger.kernel.org, AJvYcCXKwpoNfAdn8MTfU5MIe0PQe/VD1AtyRcJYnlcV4n8TTUbSfz8QFr5d+iv61eZ7H2mrwdEsdM1/czm2dtWR@vger.kernel.org, AJvYcCXimdoiIo+1mc+fLqN5PZlZDPhyMCzj+DwOyI1vM6fdF+LynR0wOgLMnQR2nFU8baWdUkMrjIHNcXcq@vger.kernel.org
X-Gm-Message-State: AOJu0YzpFCgmyAIKFLKyk1ZSuILz+zxYtimZXBLjZz03xoWoqMq0xkQf
	7p7Ur5+8iD8zcQ5DumAq0ZT5fEk7WS8q8og3V3DQZRkwG2faGJqyOFcg425v
X-Gm-Gg: ASbGnctSqjTRQn0O8KYG83PMosaDDA199Tq6CGHSmTcWT7lYBH5HLfwSdN6NdllbWim
	PgiM6d8atyzyc63nfVjyOgFfmRv+nuaR32nkAep58cMrd+nK8iOOmsn2fNvYD7sdDQH4FjruvZU
	UbwE1yFxStKMJydyD0gMFNAG9UZ6mOBkXmI/+jvepwwe5W8JYWzkzq4daX847whM/D3IiTj9Srt
	vOSYRDsH+o2HKORcIGPuFohvNWfZEErq7EW5NTKDEBEby0AFMdEUS9wVEZC9n2ck6V2pWAaP+K8
	diW3o7iK9qfPMw==
X-Google-Smtp-Source: AGHT+IF5hFtXwu90C8+PKA1Z+lLcJXUlxYVeoE8KY7FRpA8mHLqCsPWY6ZHEBkBJbGLKh8x3+jVFeA==
X-Received: by 2002:a05:6402:3585:b0:5d0:d845:2882 with SMTP id 4fb4d7f45d1cf-5d81e8c134fmr1090627a12.13.1734680182121;
        Thu, 19 Dec 2024 23:36:22 -0800 (PST)
Received: from T15.. (wireless-nat-94.ip4.greenlan.pl. [185.56.211.94])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a375sm1509229a12.2.2024.12.19.23.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 23:36:21 -0800 (PST)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Wojciech Slenska <wojciech.slenska@gmail.com>
Subject: [PATCH 2/2] arm64: dts: qcom: qcm2290: Add IPA nodes
Date: Fri, 20 Dec 2024 08:35:40 +0100
Message-Id: <20241220073540.37631-3-wojciech.slenska@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220073540.37631-1-wojciech.slenska@gmail.com>
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added IPA nodes and definitions.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 79bc42ffb6a1..0d39fd73888a 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -428,6 +428,17 @@ wlan_smp2p_in: wlan-wpss-to-ap {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -1431,6 +1442,47 @@ usb_dwc3_ss: endpoint {
 			};
 		};
 
+		ipa: ipa@5840000 {
+			compatible = "qcom,qcm2290-ipa", "qcom,sc7180-ipa";
+
+			iommus = <&apps_smmu 0x140 0x0>;
+			reg = <0x0 0x5840000 0x0 0x7000>,
+			      <0x0 0x5847000 0x0 0x2000>,
+			      <0x0 0x5804000 0x0 0x2c000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING>,
+					      <&intc GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmcc RPM_SMD_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&system_noc MASTER_IPA RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+					<&system_noc MASTER_IPA RPM_ALWAYS_TAG
+					 &system_noc SLAVE_IMEM RPM_ALWAYS_TAG>,
+					<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+					 &config_noc SLAVE_IPA_CFG RPM_ALWAYS_TAG>;
+			interconnect-names = "memory",
+					     "imem",
+					     "config";
+
+			qcom,smem-states = <&ipa_smp2p_out 0>,
+					   <&ipa_smp2p_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			status = "disabled";
+		};
+
 		gpu: gpu@5900000 {
 			compatible = "qcom,adreno-07000200", "qcom,adreno";
 			reg = <0x0 0x05900000 0x0 0x40000>;
-- 
2.34.1


