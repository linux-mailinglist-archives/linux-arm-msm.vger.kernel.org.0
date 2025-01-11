Return-Path: <linux-arm-msm+bounces-44777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BEFA0A201
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 09:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E25A3A5D14
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 08:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0900161320;
	Sat, 11 Jan 2025 08:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cESWYLrX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CC524B22C;
	Sat, 11 Jan 2025 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736584436; cv=none; b=IqZB2GJ7aaJqNHTnyybMgtjVBiiiVezoUDLM5t4BbphA1sjvEA1z7S2J6Mp4bPf/5GoG08WFtURvBShezoDTYnRT36XjTSUXPLQCd+ISgUtGRpNEXkB485wO9Q8bFHCvkamILAvT/qZj/pfVzoxYsLFLsa/G2TwU+9HY2NH9Cms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736584436; c=relaxed/simple;
	bh=Fpl9GMh2mvzyARsolfZ1oIJHKoFSqWjwKx54PTtmPcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UukOkFZgL4NiAjyvUdi8YaOnLkJkIPLZtxvbqHrMqXsSkVnxvOG7PfYR+r/VOQJa0KVCeS+k0KgUbZoHupmAHqy9VqiW7h9gbJ7HNaXK7srtpIFILoGNSllGc2xkBKBw3+0rt7dIT3iJBS44ixb6O5AJu2z7cj+kRomwppMtv0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cESWYLrX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2167141dfa1so49514815ad.1;
        Sat, 11 Jan 2025 00:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736584435; x=1737189235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/ntTmWXqLclk2csemENGMTOHhjxMzV1RCuBtoMyWuc=;
        b=cESWYLrXwIp5bWsusqYU17DT96HL65oeqW5jh/5FyKg6LxFtmvXnpgniUpTyslW9hA
         C1Nt4IR7LzSKA19LQxBhMaK0qEuPBKwAoDb5jLC5WBc+5VhSPPB1B7vp0M32H/wTEYnk
         vIsnzxDuejN30DwZnmaZOl5LrcjQwNsSXs0/oLk/Fr7jkVvIKk8xtCHt4wpQgodothlW
         236pijLpgxfpqVqFwU5wslFby/tybzxqM328Z03s4K+s1inA+eIne7D/JckzT1d1g2Ag
         2HUHg/vr+BYkw66a26uR4BEChwk5d61RkB7PR95hpnUbMyLZnf2/jXyVPm7IZnr40lSj
         Wwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736584435; x=1737189235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/ntTmWXqLclk2csemENGMTOHhjxMzV1RCuBtoMyWuc=;
        b=KeBJyVYbPW+hMMgt9dftHjI95gNFsOTFQm7RoW6iEAyOvoVtkiJ5D6HS7EANYhReFE
         P0x6t5prqa2+Nuqhzkz063+ZFZbotlyGUH7wzrConaEhBgnspjwvyzEn5gZNaKsnuBE6
         YHY+Hty8xxMRuVX8Le/QXNWsOPHHZ8byK2jyof3cQKS6u8M89NTocOlYv+nZJhVyblob
         P0QoD7OZauzgHd4KjwDNIvJoxyoWXCNtdctFQ6FUaeb5vw3dzsR7ur+ClKn0yNnml990
         Nrbj389YtngOHXJb/nfkMjcp9V9MQKtdGwORtkfDpcByHiLHHn0UmA33YxG9JIwCzyn+
         4GUw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5DtQHflTnxioqFe8XhpFqJB7g+oFPjtKx5AD2fTLbqbxElHXnmbjTDIIDUVImCID3CFiPGA7zoZAYVTrAQ==@vger.kernel.org, AJvYcCWcDuHNe0Quyo+/qXM1JpTcGrrIgavUyvJ1OsfK1ylEDlUQZgV95IXaLbp1+nRzvSQv0+J/aBHxEvGM0EPE@vger.kernel.org, AJvYcCWhRBbshejTaTclyIvmnPLrja1gfYhgSheJ7UaVP8DAoOfX0WM3H+Q98f+qgTsiB05sb3trBeN0NB23@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ywvTRtwewl48I+RtZEHtu+9XiB+a4dwrJ160tR74I58/77v8
	ucGouJM/MevDLoUsNBYbHmKWHKf2QigSDwGNFKKsyu0jrTCAKmDn
X-Gm-Gg: ASbGncv8XwFMa8rZwGBFhB+Jifg7wPaGcC6twysbz7sfvkzxMvwxOVnTvuP+KNNQP2I
	pvG1rlUe3pNxxFKs3buXeVWeH+c/KVVfmSYb9mWeqi5/iCI+Mw2eKRS/DKHiF+utXHW+63+7DQG
	6QcMfyp6it+1juMzRp9RoOppvM92OeebDgj5AKFhP3xFaiivfNhbe8IWHUEK1eICBr4Nlv0t6jW
	Oa5aM9SPk3e+c6+Ju0nCaiZCs7ZcFLgQ9XyJT7X8ZQ5BQLCdJMTBc4=
X-Google-Smtp-Source: AGHT+IH3iXkbBRCleKoyWhr2aU7bNcoKXHsj4hYjX4VBQ25VbEq5/oBsqZdwQC+35IpL9z6ESTJ/yA==
X-Received: by 2002:a17:903:234d:b0:215:58be:3349 with SMTP id d9443c01a7336-21ad9f4635dmr28220765ad.14.1736584434755;
        Sat, 11 Jan 2025 00:33:54 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f86bsm23443845ad.36.2025.01.11.00.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 00:33:54 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sc8280xp-pmics: Add more temp-alarm devices
Date: Sat, 11 Jan 2025 16:32:08 +0800
Message-ID: <20250111083209.262269-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250111083209.262269-1-mitltlatltl@gmail.com>
References: <20250111083209.262269-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are 4 Qualcomm PMIC Die Temp Alarm Sensor Devices under windows os,
in separate dt files, pm8350c and pmr735a have already support temp alarm,
add the rest 2 devices for sc8280xp-pmic.

Temperature trip points are from dsdt(Temp. in tenths of degrees Kelvin).

example:
    Name (TPSV, 0x0E60) // 0x0E60 - 2730 = 950
    Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
    {
        Return (\_SB.TZ15.TPSV)
    }

    Name (TCRT, 0x0F28) // 0X0F28 - 2730 = 1150
    Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
    {
        Return (\_SB.TZ15.TCRT)
    }

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 56 ++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index c19fb9c39..307df1d3d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -32,6 +32,26 @@ trip1 {
 			};
 		};
 
+		pmc8280c_thermal: pmc8280c-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmc8280c_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
 		pm8280_2_thermal: pm8280-2-thermal {
 			polling-delay-passive = <100>;
 
@@ -51,6 +71,26 @@ trip1 {
 				};
 			};
 		};
+
+		pmr735a_thermal: pmr735a-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmr735a_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
 	};
 };
 
@@ -181,6 +221,13 @@ pmc8280c: pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmc8280c_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts-extended = <&spmi_bus 0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pmc8280c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -235,6 +282,15 @@ pmr735a: pmic@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmr735a_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts-extended = <&spmi_bus 0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pmk8280_vadc PMR735A_ADC7_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
 		pmr735a_gpios: gpio@8800 {
 			compatible = "qcom,pmr735a-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
-- 
2.47.1


