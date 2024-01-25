Return-Path: <linux-arm-msm+bounces-8203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F03183BCD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 10:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D6D1C215B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 09:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947281D530;
	Thu, 25 Jan 2024 09:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b="Owo7p++X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964711CFAB
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706173487; cv=none; b=QgA3tD2JBZ1v2YzyUCVosgPQQZM3ZvkHjrNpMTw0N1JJgDVTWTrWp8CpWEAFR5CpPtGhVrqRM4dAxUh1J7TgvFGA2omhuZ8BWV0dgUIxfmt/1rjnHhy0PpMBalz0wajKlIMtWgvWVdWdXAsohGIE8SgT6PvGLhRwlLK+kDlPd4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706173487; c=relaxed/simple;
	bh=6Wrp/Rh7g2JRqGMXr7Kxyiy8NHVcDuyn2kD7EmsJJfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=pZKPGYIhCm4TECB2WwRk/afBDPorRWEVlNMOKruJn4sIym1nhiwqeo0vMwuK1usmd0bvKEBBFooXTZmp2ZV39y7974qFIH7A7E2Mu+1hprM9NQxkcr9A4hspkzng3PlbNkT65f4dvwHV89DM5heIBC5BebRFyfGMk5WlP7aXCNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com; spf=pass smtp.mailfrom=8devices.com; dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b=Owo7p++X; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8devices.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cf2fdd518bso10781371fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 01:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1706173484; x=1706778284; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZA8ITQmXH67a4MbXLZRtTrGVOfb5zy3I23H5qUM12E0=;
        b=Owo7p++Xp6CvpSG2vOw2bn6ue5f470hHsECOMNHej3JUHcpHbkV/DuDcX9WLRPE73+
         TusED+zAx6XhS4DSkvMI2R+t/FTQq8Puaq6Gt1bq1GgV6eqB6TY0/R3N71Q0/XbqlxuG
         +Sf3v11BohhhOBkEzx0afca6HnVm2zPzTol0TK/7VOOGr4P3482VYekjyn3Ji53d5/k8
         /LuzdXPRiufIosB/xmo7yFwlimi/wp+1LOyuLkYjegGN1qAwb7QsX/1g8XdaUwb6vcC1
         qms5UW43A5en9Pb5lbT2qF6wyVqkxwYkwqyuxRz/LQpAZL5QExZp94SIU3f/dJX7p/UJ
         FlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706173484; x=1706778284;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZA8ITQmXH67a4MbXLZRtTrGVOfb5zy3I23H5qUM12E0=;
        b=Z0BdO6dtsib6xTZ5nBIru7oKOjHLbZA5KMhKqJGYRkL2m4yPb0RISuBGQsALnm8yAM
         OqfhUOpIxHd7rs++mILAsnMmXm8TO2OU6VceThskJUbjs+hjhGx/LeDbBn4Hj2AEvGH5
         DWM0Ulpp0DKhcH2Sqin1U3d9qBFbgYbpfIQgSwm9YAt6fSlWhYvVc5RN5hlB8+X3Puof
         2X2pAMYm440fEXUiFfI8OGOTpz9j90fxmY/rn/2bzjzu5/d4COo+nHK0oy7nymn9cfui
         nd1rUL6ivKUSUHjfbGk5nymNfkHTFpDawIc7Sdxb2bdalX+04YI9gTx7Db32APs4Cct0
         qoVQ==
X-Gm-Message-State: AOJu0Yx4gnI52X9rMKgG/u3omkvhhgY4vtGsrxOTdH70ZSrQO5/tQDvx
	R+r30J/GxnhIJ8/9My8UukSyI5codtBJtJL3oDUaROg4czseCPsgwXlRYmXTjAk=
X-Google-Smtp-Source: AGHT+IGV5hFPtJQpKhAggzHO+h17QNxpuZoz05HMk0EkeGrRidecDaIzxG7BR8AxqWKJk50LwCs0Jg==
X-Received: by 2002:a2e:804f:0:b0:2cf:24c5:8089 with SMTP id p15-20020a2e804f000000b002cf24c58089mr236151ljg.56.1706173483922;
        Thu, 25 Jan 2024 01:04:43 -0800 (PST)
Received: from mantas-MS-7994.8devices.com ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id m10-20020a2e870a000000b002cdf8c9af34sm229123lji.57.2024.01.25.01.04.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jan 2024 01:04:43 -0800 (PST)
From: Mantas Pucka <mantas@8devices.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Mantas Pucka <mantas@8devices.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: ipq6018: add thermal zones
Date: Thu, 25 Jan 2024 11:04:12 +0200
Message-Id: <1706173452-1017-4-git-send-email-mantas@8devices.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1706173452-1017-1-git-send-email-mantas@8devices.com>
References: <1706173452-1017-1-git-send-email-mantas@8devices.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add thermal zones to make use of thermal sensors data. For CPU zone,
add cooling device that uses CPU frequency scaling.

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 121 ++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index f2765fe8c20b..4fb253b845c8 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
 #include <dt-bindings/reset/qcom,gcc-ipq6018.h>
 #include <dt-bindings/clock/qcom,apss-ipq.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	#address-cells = <2>;
@@ -43,6 +44,7 @@
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-supply = <&ipq6018_s2>;
+			#cooling-cells = <2>;
 		};
 
 		CPU1: cpu@1 {
@@ -55,6 +57,7 @@
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-supply = <&ipq6018_s2>;
+			#cooling-cells = <2>;
 		};
 
 		CPU2: cpu@2 {
@@ -67,6 +70,7 @@
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-supply = <&ipq6018_s2>;
+			#cooling-cells = <2>;
 		};
 
 		CPU3: cpu@3 {
@@ -79,6 +83,7 @@
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-supply = <&ipq6018_s2>;
+			#cooling-cells = <2>;
 		};
 
 		L2_0: l2-cache {
@@ -996,6 +1001,122 @@
 		};
 	};
 
+	thermal-zones {
+		nss-top-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 4>;
+
+			trips {
+				nss-top-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nss-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 5>;
+
+			trips {
+				nss-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		wcss-phya0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 7>;
+
+			trips {
+				wcss-phya0-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		wcss-phya1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 8>;
+
+			trips {
+				wcss-phya1-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 13>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+
+				cpu_alert: cpu-passive {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		lpass-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 14>;
+
+			trips {
+				lpass-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddrss-top-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 15>;
+
+			trips {
+				ddrss-top-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.7.4


