Return-Path: <linux-arm-msm+bounces-106445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKwHOCqj/Gn2SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:35:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5F4EA487
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42C3B3017E4A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D513402BAB;
	Thu,  7 May 2026 14:35:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33DA406293;
	Thu,  7 May 2026 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164505; cv=none; b=g2ZXZn4kZ4u3CRuhJ7mNWZL3nyF+L5h6IpjX5X1yKNTXXhenweEIx21ItcIZ/hv7WXNR2GKUnVGBZltW8Nx3htM2j8z96RnrjIx7ikUzO8JPsO4v6W3NdZaVBbWmi4byz8HeU83lIDeDVdpYy8kDP+8z3ooL61prEDE5AX1ziv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164505; c=relaxed/simple;
	bh=xofvCSv46PG+P1vhJYNF5HsL/Ghvs7rqB0aB7bomDNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVXVXsDRX5Jkn71ot3LMBCHy06Q6OxrzZyQqo4qxygLEEgQa1Xod4XBaW9X/noZJnr9BmhG/psiqp746S0+s10Caf9dlVa4JBW2vGDQi8X/Y9WshDQNtxHD8Fr2kv8Uyj5jdpfv+VzGIYN8luzvbd0hHWZfEGtOgUH5dLoaDsBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz20t1778164484t21c49ec8
X-QQ-Originating-IP: 4RzPZa8Knj0Inwzie4sUgEkNa0I5BuIx0bwwHqY0DbY=
Received: from [192.168.30.32] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:34:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17987659072616751745
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 07 May 2026 22:34:36 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: sc8280xp: Add more thermal zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-sc8280xp-thermal-zones-v1-2-33d4395b1be9@radxa.com>
References: <20260507-sc8280xp-thermal-zones-v1-0-33d4395b1be9@radxa.com>
In-Reply-To: <20260507-sc8280xp-thermal-zones-v1-0-33d4395b1be9@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10952; i=sophon@radxa.com;
 h=from:subject:message-id; bh=xofvCSv46PG+P1vhJYNF5HsL/Ghvs7rqB0aB7bomDNg=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJl/Fv21KirPv/zJ5YTNvilR0yr1d87yX70/bKZ0htBm4
 Uu7hJbO7yhlYRDjYpAVU2RRiGeYy16Ze+2pWKkezBxWJpAhDFycAjCRM78YGX4+E2Y9PGlubvT6
 Xf8nfZ16PVPjFv/OA2sNXpp+/rLaVtqVkeHR4amd3Ad8XjzPnrC24qL/Fc1wAfYzS3dyO2ttil7
 c+YYbAA==
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N0qKxtPla0aMRNhZksJM7I/6AdYP1OVEPf0hK+t+MWqOAmlnFmmnnsst
	8tTylAkgIaVjSXjkf3DQBolMmzqYMUIIqJJpDv9wvec/Ldzhuv2D6zXP9A2Xbfe/stcRtuL
	baul0T1PgLLtnJ4zWoox3BJvdtRE1UMbqtX1SvQ31IarIu3yjDXhQQc1dFisB59XViO0pN8
	DuK4jvgemogn4NVDnIuwhk5v1R0S691uxJfeGfuIna9BsPQKJn574lwYNRM+c/KMCEQ9/Q1
	AcOXJM3haUlza2ZfM7eswc0IEkBeybSJWIVIp2ftHzEd7H1Fz6+SAoy/oYr1xbwTWIkbBPs
	45WlUv0fdCIACe/fLhtPbpznGa+9AdJ+35kRxk0NR4wNZ6CQmOuGpi4rDBePc2J9VgG3fAM
	kbk64hbp7nuLwSlzbJgSGnRMWye2bn8arXKK4yAy5XJQ3DLhcw2mswVBMNomekLduVU1Jid
	AtGtsHfOtHmeG2XsYtKq6RGF3oHc2aLyoWswSujJSjxik8Vp+eu9vPQRvjR5ITLhOVh0szy
	NeSHET9MSqLk54CyAQcnr4cT85vkuad/Q0Xocpi9DWaBZzTSzE0noDcMVICW3jVZWprqkn8
	8XPddKVFupcInUGj/Xfwqeas9hcbHbFEm1Ag0AuefM0emrOub9viVTWNMt184pv6l74CrrP
	fstKE2eJW6QiiRDux7B00oo6xVi5pMXn3wom1gmU6hjxhP+pM9yo4zss5mb97OKiFicwEjo
	3EwGxzSVZWAPh93Gx+HEn5jiDB+A5NbuAaSSw2T6q1354RDgHYBWjTOj+QWKnl7QI1MqCMV
	sb35IzLSvOgVjutZj82RWnZefuKgTP2tq7Bn3EIoQ4o+Ekpo5paPlhApaJdr4ceme5ErGpm
	lSPt27dTszxXw8IuHQnZJ51q96yIoUWL6iLkJrLtKE3ENRyhkiUz93Gcb2HY3H2EhIi1+4R
	lwoHUggEs+kxh+aoV//W3WKz1ZVfOMBbPMnij6E3mCeTf3qRl714rb5sA6Flg3oyHMGkSxb
	U+4cTqAYYPaI5fjXpDlGmAxI0SQvdM941iOz30aYPLlMiI4KQhCXdIa4RmOR8=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: B7E5F4EA487
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-106445-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

The SC8280XP contains a lot of TSENS sensors which are not yet described.
Add the thermal zones for them.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 513 ++++++++++++++++++++++++++++++++-
 1 file changed, 501 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index af9b3f8a0817..152218186983 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -6870,7 +6870,19 @@ sound: sound {
 	};
 
 	thermal-zones {
-		cpu0-thermal {
+		aoss-0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				aoss-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-0-thermal {
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -6882,7 +6894,7 @@ cpu-crit {
 			};
 		};
 
-		cpu1-thermal {
+		cpu1-0-thermal {
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -6894,7 +6906,7 @@ cpu-crit {
 			};
 		};
 
-		cpu2-thermal {
+		cpu2-0-thermal {
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -6906,7 +6918,7 @@ cpu-crit {
 			};
 		};
 
-		cpu3-thermal {
+		cpu3-0-thermal {
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -6918,7 +6930,7 @@ cpu-crit {
 			};
 		};
 
-		cpu4-thermal {
+		cpu4-0-thermal {
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -6930,7 +6942,7 @@ cpu-crit {
 			};
 		};
 
-		cpu5-thermal {
+		cpu5-0-thermal {
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -6942,7 +6954,7 @@ cpu-crit {
 			};
 		};
 
-		cpu6-thermal {
+		cpu6-0-thermal {
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -6954,7 +6966,7 @@ cpu-crit {
 			};
 		};
 
-		cpu7-thermal {
+		cpu7-0-thermal {
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -6978,10 +6990,238 @@ cpu-crit {
 			};
 		};
 
-		gpu-thermal {
+		nsp0-0-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				nsp0-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		smss-0-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				smss-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camss-0-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				camss-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-1-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				aoss-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-1-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-1-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-1-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-1-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-1-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-1-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-1-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-1-thermal {
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cluster1-thermal {
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0-2-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				nsp0-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		smss-1-thermal {
+			thermal-sensors = <&tsens1 12>;
+
+			trips {
+				smss-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camss-1-thermal {
+			thermal-sensors = <&tsens1 13>;
+
+			trips {
+				camss-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		pcie-0-thermal {
+			thermal-sensors = <&tsens1 14>;
+
+			trips {
+				pcie-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		mem-0-thermal {
+			thermal-sensors = <&tsens1 15>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		aoss-2-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				aoss-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
 			polling-delay-passive = <250>;
 
-			thermal-sensors = <&tsens2 2>;
+			thermal-sensors = <&tsens2 1>;
 
 			cooling-maps {
 				map0 {
@@ -7005,8 +7245,101 @@ trip-point1 {
 			};
 		};
 
-		mem-thermal {
-			thermal-sensors = <&tsens1 15>;
+		gpuss-1-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 2>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert1>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert1: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 3>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert2>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert2: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 4>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert3>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert3: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		pcie-1-thermal {
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				pcie-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		mem-1-thermal {
+			thermal-sensors = <&tsens2 6>;
 
 			trips {
 				trip-point0 {
@@ -7016,6 +7349,162 @@ trip-point0 {
 				};
 			};
 		};
+
+		audio-thermal {
+			thermal-sensors = <&tsens2 7>;
+
+			trips {
+				audio-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens2 8>;
+
+			trips {
+				video-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0-1-thermal {
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				nsp0-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-3-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				aoss-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-4-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens3 1>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert4>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert4: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-5-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens3 2>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert5>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert5: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-6-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens3 3>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert6>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert6: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-7-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens3 4>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert7>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert7: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
 	};
 
 	timer {

-- 
2.54.0


