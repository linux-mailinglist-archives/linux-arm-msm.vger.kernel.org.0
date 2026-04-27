Return-Path: <linux-arm-msm+bounces-104597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNaZOMTL7mkMxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 04:36:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E13C46C272
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 04:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 965E33028B2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A29231B11E;
	Mon, 27 Apr 2026 02:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flR74ZDu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sqz0RWuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A04331D371
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257342; cv=none; b=nIXdCmuivT59yc60c4LgEtK/0qchD8EtXC/U1ElI/MC0r4b5PQTQD0b+u17ooXf/WTGcyTv2KKFK/UaMUkyE9mkrXwqf1RLXahLwSiPq7wtk/f1RnVSi/+6bLHbgKyIkGNnV+rTnDLXEAnk/PkBo6F2xLxDw5blItNww0GNW/BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257342; c=relaxed/simple;
	bh=fqpkC3HGYcRxLFasJdUV/LyMtMln+CVq4520DbGBQOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZC1VbT3QP+BXujoUsYfZ2ZMNnbob8l31NIBKuC/h/JeRGWy2YeEDRwp9aWxeP38ZrkE0SnHdeDaO0aVyH/RMq/aKXTAtHORstNCKAV/ZZ2ZUJZPPNpR+OfrYAV9wt+bjkJuoN/QGWXvFuPOIyXJnWpXIhED4qM4pXRD4PBxyxUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flR74ZDu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sqz0RWuF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q9AMAj4190774
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3QWztm8lKBf
	nwoRa6+ip86yvuMd+fG19TXVJrPocKm4=; b=flR74ZDu2QPd5KYrMjoCUMOK+OO
	RH3yMXamHOcnKWZQqvO1+e5KyiQJOi3Nn3aUjL2XcZGRg9pSV30iN4FVEaOtvsmZ
	2gLfZbIJ+VQTRhteBM5PnElXJ6kKmg+YerJNASQOyGvCj+XW7U1+Y7CV1zUfsN1K
	Bxl6v1XA9QG7M3WZR2BF1alP/svkXcyt/aQAR9rnwj3u/07b/yP+8/9DCsIgg8no
	zpRAgbgtaN1shOvw80P9Z+v6lKG5HBqatvpC3i1UbO9hPG3zSJqhWf4+W24wHrN+
	xtPzncWe545xi8fou6f1SLl7sK2Ur/TD7vbPA0tbmYNYRl9aVMhUuc3bITQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2v27m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:35:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so15082967eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 19:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777257339; x=1777862139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QWztm8lKBfnwoRa6+ip86yvuMd+fG19TXVJrPocKm4=;
        b=Sqz0RWuFPKeJOlCWEDCFzuEp+Y+oWpNruIxcomIRIT+BI9lSxVfPKVCYlxWx1ffvyG
         Dt/JhmZAIDDjOVtdyPNquQtgFESc6zzdH8tamE2HTMxq4e5GK90EglAwdb5Ab8lf839d
         Vtkp+ngAoWzn/L8jKU1XYxwv7+2ensGNiew0i7mdJ0I6udDTRBoa76ufDUyLLs+/Xiot
         sbbJx9jmPsUu70jPllVMJhT1rJkFeY5QG8vVeZTTz/pkPxUQcF0xlncH6R69RmYBXCzX
         Ck7SktZyyA1PJ8PVEpajpbN5oArvpUZaVV1r3NfZRO349q2GZj2S63tR1Ctz+nOLyth8
         /wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777257339; x=1777862139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3QWztm8lKBfnwoRa6+ip86yvuMd+fG19TXVJrPocKm4=;
        b=W6WPn+Zl4BhnVCc46gWGUAz8Q5cEx2kl1h9nwpndTJJwDN6fqQQzDvUeQ4bXzKj6nD
         coJVW8Y96zHhWAuygcPp2r5qA+4MjGhwhUhmq8t/aUOvqSFToypQ4EQtcHts1pIbBJrt
         JqPQctvNCWRi7XzAmPLlsBF5i6jEPaO4/40eWqinsSWWY5FWcjUOjsgA//rJpHZyCTNw
         l+QPJsGtvKMr31gn+LCImwkIZC7VaBkjJ4ghIQ5MjGlmW+3pQQCM30nLSRULQ7EMq6/Y
         E1T00/LNSnkHWHo18TQ2fGDOekrp0z0TvYlAwVSwvcuuxgYoQGTIMjqhbC4TJmXGU2w+
         8zjA==
X-Forwarded-Encrypted: i=1; AFNElJ913ek8hLnO7wstE7xpC/CQun6gUF5AWP0AM2PN1eIS3ZvZ6z5w5vuVEkNAEd4pxdLTDJRufHuSRjA+q1WL@vger.kernel.org
X-Gm-Message-State: AOJu0YzpcdQYdvxDLr0NxXPe6xvq0XPdGTnMhuXinFfWOPn+Tk3/2H7p
	xEQM16x4TOiZAfFAoMTF6bsAO/VSkvev+5BFlJOfwVzHVyKdAFpz8MPQ10L8prBb4kPI/cj9aTQ
	ZUwAnVI2Ct78NZX6lQy/ABDat+QQicKlaUW7Yq7MTjZU8gInDzWzEjVdXcApKoU+R+7Fk
X-Gm-Gg: AeBDietqvG0EI9jWByxxSDaxbee4O1a2oSjgAMW06nXA+bjTN5d+e/Itb9KOa8SCigo
	NWoznOp31DBLQIjFHrUSkd+AKSFrRX5rDkywanec+f+g3wbAWrAQP0v1gLmi2bUlTQzmrT6QAn8
	ehOHSri6tvVxHkW6+bzy+g+1MSnhitYH9FK2H/Ax8GqWCXdAKTf7ykcyfQR2Iyhnt20EksSw10t
	M4nupaCJnW+nJ2dHpJE/+8Isqxnzt+3Q54hxBnR64tS3Xl31/HVKMvGmTpr9kvpO6XIwKOHdP1I
	NUpSRSDY5Gwn+Gc0IMwVEMVAA2hVb3AlRUGgMBkdBaLUm3mIg7gk2ZmVINlF2P8g/stFg571TdB
	T87EyjunTqsys6v79nrRkDuw/7nPJt/k/RxHMqo9ERTm6hZncjcpwvMKeVmsqYun8g3JHLNcgf7
	bap/vNbldzAjj3dDVp
X-Received: by 2002:a05:7300:ac8a:b0:2d9:bc8d:f62a with SMTP id 5a478bee46e88-2e47873aadbmr21848842eec.16.1777257338786;
        Sun, 26 Apr 2026 19:35:38 -0700 (PDT)
X-Received: by 2002:a05:7300:ac8a:b0:2d9:bc8d:f62a with SMTP id 5a478bee46e88-2e47873aadbmr21848823eec.16.1777257338196;
        Sun, 26 Apr 2026 19:35:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52916316eec.8.2026.04.26.19.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:35:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: Add device tree for SA8797P Ride board
Date: Mon, 27 Apr 2026 10:34:55 +0800
Message-ID: <20260427023455.236410-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Mve20MRnguZZN8ZcBml978h1fImJc5rk
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69eecb7b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=MxPmow6BhT1dHFM3JRMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Mve20MRnguZZN8ZcBml978h1fImJc5rk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAyNiBTYWx0ZWRfX8wVLd9iFdXL8
 y8/oeDTTyqIMPBaQHujJxbt5bzlqoM75hLK4j88FlqVC348RyjveLDIKIVmgBibhZlbpy4F80rL
 lDRnzCGNOnnH1inWdmk+HRS3TBwRjUP+ec0w1u/sLN675FSQ3KQoqtwaj9GRQGSUSsOVenw9une
 2NP6AVZL5Ko8h9u2uUDTAvoAoDgVb/ZRKAENX8nPdY7EMxQnMTa31fhnt34wFfy/mVNQsAC009c
 HHcGt+eRmLYlYRVmKmwQPqN0aMDt5YtgGLQHlG7CzUNJKmn5yWk8BUY/wDdQlHQ8R2RbRSuuCIB
 dZatYQ++x20eDxg0Oo3ZjEq2ta+7Y1OMVFGhI9PhVp58mk7LVjoCJRy+rjZpQRNssQC267aZ4Eq
 Rres9+W9agY89Ohf+4sTILgYdstQtlY9oacJ7sUIqMzEfe58/tPOyVL59BrjuEN8260HBmfSjdh
 zE9BZwhFLwBCtMytyBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270026
X-Rspamd-Queue-Id: 8E13C46C272
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104597-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

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
index 4ba8e7306419..b329678e04e3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -212,6 +212,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8797p-ride.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
new file mode 100644
index 000000000000..2eab2c6fc173
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			pm_kobra_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_e_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_f_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_g_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_h_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_i_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_j_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_k_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			kai_l_trip1: trip1 {
+				temperature = <115000>;
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
+				temperature = <125000>;
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
+				temperature = <125000>;
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
+				temperature = <125000>;
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


