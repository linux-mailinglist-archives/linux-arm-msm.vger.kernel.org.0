Return-Path: <linux-arm-msm+bounces-100519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCs8JLAxx2mNUAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:41:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0901E34CF41
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CBA330457FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 01:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089A733BBA2;
	Sat, 28 Mar 2026 01:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpusVCmi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E3A33557D
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 01:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774662059; cv=none; b=nZuQExz1nLNPKVEQWG76vp9ykr1nFJXexJfNWunmpQZHUi63ajj5LkgvXzwuUjO79vAcBB+jIR54m/RnG8DMr8/Il3dH3yyV5PbXmiFtfUkIav65GJjT5np5hCS85Tx3UZHnvBNcSpLWe4yMOfF9cUPbZTdPT0VtprrfjAAIfyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774662059; c=relaxed/simple;
	bh=ldfChzN1uSXhCMGPYXDm8BcwE4V0pQzO6G3r6/xavw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=afXdW2CokHmUIQ6s9qPM3Y4sBPCEdFPFCsBMQAgaefKSUK3P7+81qqHPY7i3h2yUD40qtt2mqSsLPyCFP5vvlrUJdXq7TTLL+cMlIqDFPgM95wjWeiD/No2f1re0LEJT/7jJIcSv/SUtrr6ARBisqUzN1bS8Y9LOlsChQVlLcOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpusVCmi; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50baf2df711so6246721cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 18:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774662057; x=1775266857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HC6qv58XpG4CW/zjPsDlD07R3yCVlsOVxBcMpliJEEE=;
        b=JpusVCmikRrkx27oUiD9zNEXj9I471IlU0ofgjG8wpZi2sNg83V99MrC4F5eV+EuAm
         Tfv6w/Zp20UwdkTno5qiPgIRbOkgMVeHqgBKxmg/Wwn4clfUrHuEOVxjmMpuuzxO8C0q
         b7670yXvj3Mv+m1Ysi95MDz2Mhg+f9uU0ojRBI8UefnSaam20CplKn+BNTIac6qBxNzS
         HDNrWy+Rf/v7cFwN1jPNzup4e8B1h7J3KbT1oNDuPS++7lwgOxk7SnRgaI5s1Hb8UeF8
         9W0BspKqRsjJYOLFd3p+SmHCEWv76apgdoIcXukiwlTztHwsownRh9UKT9NstFpo0Aq3
         lzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774662057; x=1775266857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HC6qv58XpG4CW/zjPsDlD07R3yCVlsOVxBcMpliJEEE=;
        b=LXYIqpf3DfRa9Y8YrLYfJk9MvEIjd2THp9M+xbV0I5K1qMPe8bwGA7Dl7vbVr3cCnM
         wia5qJ+3LMxuIQJ4aMJJyEglyznkxTv9OsCv7KHKyvVsBcS6u8+QHWiE96Xk9kyHHxDa
         ZtB0kYbMj1kMRKOWD6ujIffp0M78lPl09n3ZT7u5Rc5mG0BD5FeTFeZgpSm6SXyvRlCK
         7BJGGErsKF3uQyVDMyRTj5/Mhy9VhCUbDE7eZnapODYSvRJpX4N4plPgscvbyeaLa4vT
         Dx464hzhz9c4oFe4ifzB0o7BqO1c9Cy/81I9M55issnDHdzysa6A4+CPwg26CfY7c3C8
         btAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy027Spzsa39IxpPQU1ZybDtH2IhWN0HyTgIou3lxSL0v/t/R6ht2h+QbWMogVsiuk2nMGqBqjocakM4BO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9sfnwzYK5Eb/PMe5IFwt36ANX86KsqD5XGI/g/TJbtspjfK5u
	ROOtaWJpvXXwZwobrIiQ0Nj5sNFzAFgQrkPDAx+cH6RSBh7gcbTlE5Kp
X-Gm-Gg: ATEYQzzVhuPtwjC5Ut9moTquNV0S1UPv36Ps/YQ4+pCjMsSsZXzZot6R75UZRCFiv7f
	6R8FiiZBGY5W+kFx2X418b+h8M31v86CKdM5NezV4BEeQpFcKaOzv6rm6Sj3rOCEB9/WEF7gkcX
	yXcj0hpRXGlAoLDbAswxbQ9rAgTi+63MGN1wyy07kXXnOAZBm225bdHYhejz/0Eotm/BFN5HSx7
	Hde6DayGogdWtEWqreDCLqOdG0LpVXpr3En1eiN9TshHTBGS3l6jA5VcNCgtEL4+vMAPRmxFk8j
	oPF1HYrVY19bfHH0n9y3vRTpfZezbxS1WaAc1YBK2YCUy9vLIpA/vfrc6xyPDoQ78dOHCXpIOB4
	50Dm+Q8b9aSs6JIANaHUbtNEdagR4FLSf63w8df4kz+fL83ji4+rjvbWVljpt2tc7JicOhoAgfq
	NdpwpfvOde6/QelMQAdCHt2IA4jg==
X-Received: by 2002:ac8:5cc6:0:b0:50b:4e72:aa9 with SMTP id d75a77b69052e-50ba37d1cfemr68110321cf.9.1774662057237;
        Fri, 27 Mar 2026 18:40:57 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf2820d8sm7441256d6.26.2026.03.27.18.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:40:56 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 4/4] arm64: dts: qcom: sdm670: add thermal zones and thermal devices
Date: Fri, 27 Mar 2026 21:40:41 -0400
Message-ID: <20260328014041.83777-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328014041.83777-1-mailingradian@gmail.com>
References: <20260328014041.83777-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100519-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0901E34CF41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add thermal zones to safeguard from overheating to high temperatures,
along with the thermal sensors (TSENS) and CPU frequency limits (LMh).
The temperatures are very high, but should still be safeguard for
devices that do not specify their own thermal zones.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 400 +++++++++++++++++++++++++++
 1 file changed, 400 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index f115bc6e64f3..c5f7655421a3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -62,6 +63,7 @@ cpu0: cpu@0 {
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&l2_0>;
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -89,6 +91,7 @@ cpu1: cpu@100 {
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&l2_100>;
 			l2_100: l2-cache {
 				compatible = "cache";
@@ -111,6 +114,7 @@ cpu2: cpu@200 {
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&l2_200>;
 			l2_200: l2-cache {
 				compatible = "cache";
@@ -133,6 +137,7 @@ cpu3: cpu@300 {
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&l2_300>;
 			l2_300: l2-cache {
 				compatible = "cache";
@@ -155,6 +160,7 @@ cpu4: cpu@400 {
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&l2_400>;
 			l2_400: l2-cache {
 				compatible = "cache";
@@ -177,6 +183,7 @@ cpu5: cpu@500 {
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&l2_500>;
 			l2_500: l2-cache {
 				compatible = "cache";
@@ -199,6 +206,7 @@ cpu6: cpu@600 {
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&l2_600>;
 			l2_600: l2-cache {
 				compatible = "cache";
@@ -221,6 +229,7 @@ cpu7: cpu@700 {
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&l2_700>;
 			l2_700: l2-cache {
 				compatible = "cache";
@@ -1408,6 +1417,8 @@ gpu: gpu@5000000 {
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
 
+			#cooling-cells = <2>;
+
 			status = "disabled";
 
 			gpu_zap_shader: zap-shader {
@@ -2100,6 +2111,28 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 		};
 
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,sdm670-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c263000 0 0x1000>,
+			      <0 0x0c222000 0 0x1000>;
+			interrupts-extended = <&pdc 26 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 28 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+			#qcom,sensors = <13>;
+		};
+
+		tsens1: thermal-sensor@c265000 {
+			compatible = "qcom,sdm670-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c265000 0 0x1000>,
+			      <0 0x0c223000 0 0x1000>;
+			interrupts-extended = <&pdc 27 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 29 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+			#qcom,sensors = <8>;
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm670-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
@@ -2289,5 +2322,372 @@ cpufreq_hw: cpufreq@17d43000 {
 
 			#freq-domain-cells = <1>;
 		};
+
+		lmh_cluster1: lmh@17d70800 {
+			compatible = "qcom,sdm670-lmh", "qcom,sdm845-lmh";
+			reg = <0 0x17d70800 0 0x400>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			cpus = <&cpu6>;
+			qcom,lmh-temp-arm-millicelsius = <65000>;
+			qcom,lmh-temp-low-millicelsius = <94500>;
+			qcom,lmh-temp-high-millicelsius = <95000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		lmh_cluster0: lmh@17d78800 {
+			compatible = "qcom,sdm670-lmh", "qcom,sdm845-lmh";
+			reg = <0 0x17d78800 0 0x400>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			cpus = <&cpu0>;
+			qcom,lmh-temp-arm-millicelsius = <65000>;
+			qcom,lmh-temp-low-millicelsius = <94500>;
+			qcom,lmh-temp-high-millicelsius = <95000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+	};
+
+	thermal-zones {
+		aoss0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				aoss0_crit: trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpu0_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				cpu1_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				cpu2_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				cpu3_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cluster0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				cluster0_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cluster1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				cluster1_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				cpu4_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				cpu5_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				cpu6_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				cpu7_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 11>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu0_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				gpu0_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens0 12>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu1_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				gpu1_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				aoss1_crit: trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		q6-modem-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				q6_modem_crit: trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		mem-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				mem_crit: trip-point1 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		wlan-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				wlan_crit: trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		q6-hvx-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				q6_hvx_crit: trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				camera_crit: trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				video_crit: trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				modem_crit: trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
 	};
 };
-- 
2.53.0


