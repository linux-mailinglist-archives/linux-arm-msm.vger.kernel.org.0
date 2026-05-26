Return-Path: <linux-arm-msm+bounces-109708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IbtJ7MXFWqQSgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:46:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E1A5D072C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1E36301BF68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 03:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA912848A1;
	Tue, 26 May 2026 03:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoZj7iXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCEiN+FZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15F92D0C8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779767200; cv=none; b=AJVFSpEwLolo2wADiQhSLWS+hqgAYTZg6uYQmA9O40FtTLe7PapauCe+Kyr7Cwnyir1AT3oiWS+E943jayYYs414HgwkVbJCZRjvegABGJd0newoIB/Ftrbea/actY6FbLhtTqbnlDkFop5gyh80nVFmOXpi6cGFYYg8lFpQ6lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779767200; c=relaxed/simple;
	bh=cd7Lv3gHALiOnDd9kTk4goO5mwyskrhI0eEGS8i7o2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+Y7RqI0fXgSVTxtkgDfEbLQxjqzLWAta1QkGqQgLDdJI4l71SKcQJirfJTYJbMzYFpnPI6ThKqmwf4RAGqOelLWuCrHKG4TEroks61M+6LN4UfPT76yTJoDGdt7jzb1yxmvtYUKPcM8rlXyeyHMD2nQNRv3yY5bsxvn7r4oo08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoZj7iXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCEiN+FZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q1aBmo3604073
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aAWUzZEf752
	JzQGgDomzJSno3XJVOKvj5fNxQP1q+Ko=; b=OoZj7iXf2QBR6DrEuTTtcnGJXiV
	GwHH7+98QRAHOc3jxf02Z/AvcXB3ygNBvhfoQ0vOy1Pn3pPbSb0mVKD7+oFDvGPL
	3ZzlXicVUMZERlewOTL8b3v0dM8RtbfwYOYUOa01GDI0C07TioLOsFhlqRoAYLPW
	S9e2kWHQX88vY3o0Ddi1esoro7EG3YXHIpzySgksaUDyApR1XBlPOubli4uSYsWY
	QkahpVzKzpNFM+f1BoYsN5t9wQt5nJN6GzBG6nWPpF3mshTk5DzKJ4C0IE3Cl9uo
	RBDJwHqlsl+FFKceGejJx54YZqCaCY7loivDzWP70U8682dVPF/RvGhHnYw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqj4jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f2d983d109so1472036eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 20:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779767197; x=1780371997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAWUzZEf752JzQGgDomzJSno3XJVOKvj5fNxQP1q+Ko=;
        b=WCEiN+FZSJM5fDMZJfFB5+fdRokyd3AVN/3GBp+gBWtCKW0lJj8kpCPIgr+rfnObY1
         nFpHrHr53tgtgp2QQhHc8naCKZg8lY59n78EGK3OkzPVQ6Nti2HKMBH+hiEX8BhivSWT
         VxzYaOuXbUTh1+xgE13Z9cFa9yFDg0L9Y5yz3QEif8bN++Gm/JFdLfAbGX22scR4cJIu
         AbrVBt27Xz0ei0eYjnuk+LS2LEE79zLY8Bh8I2l6ASQQBHALCqCDji9w3R8IASTHBcIj
         0Id7l6pXj8sW2N4gzPZzHAHtsYXBM69Z2zjv0xMKNXKhGB+f1+a+RlNCbJ4uePk3U3jl
         HiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779767197; x=1780371997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aAWUzZEf752JzQGgDomzJSno3XJVOKvj5fNxQP1q+Ko=;
        b=scfWqwpnYdIZS3ReZ8RhuQRavNvIq0MADu+9o1V6HPaYNKMHQfUXhD+V6qlCrCXlHJ
         YVQ7AKMIwSeuWupBtt2XJqK+f+Ut+1piOhx9G0ZiK7a7RckTcggr2F+xTlp8dhhceTKQ
         Myo0XsuZDB178gBKesnrgxmXfBFKpKvEi0xPZiASAVISU599wcIk0Q5ND/W2FuwgvM6V
         MZB0C8g5N8y0cz0jCYjm4d6t7J4/ULywRSqU/cWlIM2QykiakJxd4eYtRDfWzSvkJssD
         qeZQtC0ptP5TzArQetGnnti5jwag9PvuCrE7ckLSrrQUQ9tRNxICz24RdGEMw/vbPxIV
         hyXw==
X-Forwarded-Encrypted: i=1; AFNElJ9RP1yOXdPnjVOjhE1R0I+C93xL0jN0UdcfM1vPXPLtls3GlJZf4zZjQnpBSnM4Jak1LizRvicBorIr9MF2@vger.kernel.org
X-Gm-Message-State: AOJu0YzNcrxOfjqsLvWBQcZz5QBL/ndYYHoh4wcGLfoH45TTOZPCFM5K
	Xq45SG1ll63koMPXJX06LpoI850mYfPLCq80MoxcDv04knMzNrb7wChSpPoR6FjSg7gXWJIODw4
	+gmnIofnZdKvMvRnjrkcmdS9esOfqpnZ0RpdKX8EmylgenchiEQu2RGMU/2OV2CrUB/NY
X-Gm-Gg: Acq92OHw5/KFuY12D8YtbVcc1VEXCHO/7uL9jqwDT35vwOotMKT0ItsE3jpdrO6FFfQ
	DryfNfGCICtxYVoNK3ETvrv0IAwNjDHIr12MZJLSmC1yJsy1xSJFcT5dc9WsFW5A8fFY70ottrr
	0N69k3WeLTTK2uy2260cAqlRs9AtC517seQ0ieLXOJsiFgMv+YUnbaALi560/s5doCopO3OgkwT
	py0p179GkIfqhOKeAw8yB3f9SmVhdBHDxr2SlNNszn+yPNbhr1exiACWQQitTbAXOgIE5psTaMU
	vzUZ2loeXMevSqyq5shtNjSBT7+fPtN5KOW0Ficz3U5Pgl7XF+uwOikD6i8rCglVUYoY6tq2vei
	po/kSczntHpnLw3Ba17xWSG6aT65/bzAxcpi2b1maiESg5OxE/nb4RDq7TQeLJBLDiOSqai5gDc
	vCkcW71Q==
X-Received: by 2002:a05:7300:bc97:b0:2ed:6f94:9d9d with SMTP id 5a478bee46e88-304490264femr7372263eec.8.1779767197419;
        Mon, 25 May 2026 20:46:37 -0700 (PDT)
X-Received: by 2002:a05:7300:bc97:b0:2ed:6f94:9d9d with SMTP id 5a478bee46e88-304490264femr7372247eec.8.1779767196837;
        Mon, 25 May 2026 20:46:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304522547fesm9792271eec.21.2026.05.25.20.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:46:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.or,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 5/5] arm64: dts: qcom: Add device tree for SA8797P Ride board
Date: Tue, 26 May 2026 11:45:57 +0800
Message-ID: <20260526034557.1669007-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
References: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a15179e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TKQXpbtUPQeuIP00yFIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: zpyraEywelox4b-XibHh7kOJDTs3-Jh_
X-Proofpoint-ORIG-GUID: zpyraEywelox4b-XibHh7kOJDTs3-Jh_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAzMCBTYWx0ZWRfX/dZvlIz9H8ii
 RpceihfoPAuLJHLKy9dYIOUJeDfFxWEsYIBUvMBddtjK1oSZRCDBEeEto0SWeUHIddJmcstQvKH
 bXLsvMP9lg4z+YI5MzFuvKn0ZrruxyMlcQtkeULkueIHJRSuxeluYOMLICIpo0n9gdDUoW7PytL
 HCkEO4UJYTPoXE2ZgzFggPcqS+SD6RscDiPgGgiLiqP/++omRFssic+xRjviNBD7wnrPeMkoGcm
 W3VXzoLVr0HA2MCiBadqLGWEEWTBF19kRk9x75phllyrYfcnuHcA6rTliH/XH//wkp/cbGtUQ7V
 vbepxMCaHKWqjSNgHlBlAXqnx1SxfPJYJKWN0O5cbTYiDKDGKTJt+w1Dq8NeHUW0wmLN9wLX+Rq
 +QHDtUo0YzWrVXO9cPwlzI+tD0vZHnOw85rIUsz8ne/OMl+XawcEeYyLN3p2RkWRoMiWAt9ZCw+
 /8CFkWNLzhHwr39y76w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260030
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109708-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31E1A5D072C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Enable UFS storage support
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile         |   1 +
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts | 306 ++++++++++++++++++++++
 2 files changed, 307 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..2746fc29c45d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8797p-ride.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
new file mode 100644
index 000000000000..d429de313f24
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "nord-sa8797p.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8797P Ride";
+	compatible = "qcom,sa8797p-ride", "qcom,sa8797p", "qcom,nord";
+
+	aliases {
+		serial0 = &uart15;
+		serial1 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi15 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&thermal_zones {
+	pm_kobra_thermal: pm-a-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 3>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_0_thermal: pm-e-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 4>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_1_thermal: pm-f-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 5>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_2_thermal: pm-g-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 6>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_3_thermal: pm-h-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 7>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_4_thermal: pm-i-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 8>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_5_thermal: pm-j-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 9>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_6_thermal: pm-k-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 10>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_7_thermal: pm-l-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 11>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_ufs_thermal: ufs-thermal {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 0>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <125000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_sdram0_thermal: sdram0-thermal {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 1>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <125000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_sdram1_thermal: sdram1-thermal {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 2>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <125000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+};
-- 
2.43.0


