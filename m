Return-Path: <linux-arm-msm+bounces-118001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id whhaCZ6gT2o4lQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:22:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE87731841
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:22:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JIuzuFc8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cfo4rcVI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118001-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118001-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 687E1301DE97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD18283FD9;
	Thu,  9 Jul 2026 13:21:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4359285CBA
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:21:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603282; cv=none; b=NBh5rr8GR8/LwJiilvc/qIUYxOyA4NhYFRe9D/380t7z8oU2IZjok0ASdTKvTx71dTmwolJtsKj6/Q7/6BVTp6g3b4+faC105OCBNd1v+NP7qM4B9qQHZ7xxjAtGxEFjfSkiNOAab7SYbgSHOY+EdFKInOUh2N+9E3N+2c8RYWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603282; c=relaxed/simple;
	bh=lKGQpygmXkP2XzUA51svAvEuuS7E2znTol+OjxD7hk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VfvDRgqlCPTlo3/48pSdai+B5nX3ekqyxjm3QYPzhdXAFaBvKGslRNpPl0n5XY1NV971MWd4qRxDX8GK71lOmdWAdthYkAha+iu6upLEztuhKny1OwnM3F2ImYW3LO/AhdxwxrjbuEVwLwP+lrp9frOj2b5Aka8G7GpxpTdrdOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIuzuFc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cfo4rcVI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNCPL1450485
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=91kfL6G7lYN
	hupV2+UZH7kfXoXNDRDGpHUfmE1YIVzE=; b=JIuzuFc8DqYkRtOQ7mPpzsQIlHX
	/NQE14Mo+hbvBDPlR1u4/zc1aDoHv5o/qsBjWrAtV1QU93jRklr2yXww0V9/euGn
	yXDTTLJwHq93mUANK+ClwqK+pC0kSlMdeHEkrqyj2390kuhK5xuQrFrB4FA0SLgv
	HDfeHrOCMjGXucIMnpAyTc1oGJcNG4BqO+WJxb3LSUiIEgxPaS4mHfS5jS8sUY6U
	YuW03jS8T/E8uSQhPBU7xzbP8UDM9KlopGWhViGRIMaJvE+GxQKTEmbLXhcejFwy
	/WTuwAfbWrU8MJ8n7VmRjxFbQnL9hkCNijQV5HLzon91fSdkTcSbjvU5rYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vj4uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:21:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so102525985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603279; x=1784208079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91kfL6G7lYNhupV2+UZH7kfXoXNDRDGpHUfmE1YIVzE=;
        b=cfo4rcVIN4s6JckKaEnrB11OpTN9k7U0f+Ojlq2tIeF3ZSbYcmNG7SlzQARmqdDl90
         yIehiiHm4D+PYYdfZNSghs/CpRZHL9L0Tm7xvd3MdrZr3U+ljNsBf0y++9A58pG0U57Y
         lKuSef4qnTL7QhqLeVWbKpiNX+3CBRCxNmrhKWG0IK/KVaiSMipxIuh20ze9Lp/3wNE3
         FFz/alGl2PqMNOn0DfGya1sSRFJO8t/veXOhktiUFJEMEWcv8pDmZ5xAbkPja53/gglL
         mjnpLUel1CtfK+mvCdSafsZaChq+nafBlSAGM6AxqOos+miHpnVAHDJhZAIftJp376bJ
         /0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603279; x=1784208079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=91kfL6G7lYNhupV2+UZH7kfXoXNDRDGpHUfmE1YIVzE=;
        b=P9O/12O4nv0+Zdo8iE4+htUgWWXkbJZBBG5NaHq7J/rrljZuWQQOnscn0pW2HL0kvj
         DvTR4NTU/u1nvdk2gU1JXYsj3CDZJk8vvJjWnshlheWVFOutifAuz6QvGDyUIYoeieQf
         6wqGwVwqUm1zI7+2qr6DlKv8w09ucZbkwVmGNAVPZEz4uEdZbZ3j+XAimAyIFe8cgVHP
         11H8I5m02AazhnLohIOOaFUe2X4HIhrTcNEoxTT8Jjpd8YJWTOjWz83cckmP76kQLP6I
         3RgcdqVPrMHA1C+YC1wL3SrLkiaYbfuZk6+5/q4xnUYvdHsx/xQFM2M+3pyV68DYtuvi
         FKvw==
X-Forwarded-Encrypted: i=1; AHgh+RqnTF9EUWfl2rGgeI8wLnw4QVjKLSSFw6IQ4DJpzh/SZZVL2jl8/7hwUs+eX3aPVEnmMd0W3fiySR3s4tYx@vger.kernel.org
X-Gm-Message-State: AOJu0YyNOUIj3BjAZha8reBl0+PunfxKQdsNsIWcvGLYakFw0sXg0RRd
	td6j/T46hTpLWB16i48w8hR/W7HugORC7B5wh9xs+afKVb+qDj/zft3ZhxVpuv7QNnokGf3AwpH
	6gSxo/2rTLE/wfj47wVoPOuRMrYBICs8vAmL54w4qAhtdyNeMSox43A4FvTmpynXGiZ45
X-Gm-Gg: AfdE7cl29/GhEbe0kE3Gfwg0NX/eh7Vgy2ifxYo8wHzCviYLwjWRB3QkeoarBjvU8lC
	6XuRCtpv/A2qwzTYisRL5uLjP/KxO5rawARRjwpIkmuBERj1bT6vDRoaEic97TBIJ7v84hIlq7H
	lbx9wMHM2rfd5/NJI44ygvCIMybWM4B/fVPFwywgcF9r6vCWF/jKXR+O/AQaDFfZtH0yLKruRYn
	/nkLyvnqf7PvSxusSb7W8gcHFtfbmWVwkhPOZ7IZaWUz1UpJ+wxUQFlRmXPJfcVFK0yjSMFo6Ru
	2Ey+z6qHKF5FTfdH3iM+AXrxw/sNZScibuWIeaFWUnSYBvh8EM37ipAst7S8R7tz45DolPHPo6L
	1NEKcUn+w5KmbGoKaMW28F9d4lBb+E4nm44yu09B0aLsw2dS2bZkVdZ7P01WTHKCVVBOz8U8=
X-Received: by 2002:a05:620a:2913:b0:92e:a48d:251e with SMTP id af79cd13be357-92ecf550f41mr758830285a.24.1783603278726;
        Thu, 09 Jul 2026 06:21:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:92e:a48d:251e with SMTP id af79cd13be357-92ecf550f41mr758824385a.24.1783603278057;
        Thu, 09 Jul 2026 06:21:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ce5126sm1654976385a.41.2026.07.09.06.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:21:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 4/7] arm64: dts: qcom: Add device tree for SA8797P Ride board
Date: Thu,  9 Jul 2026 21:20:10 +0800
Message-ID: <20260709132013.4096850-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfXyXXJkdTcmYYv
 rJyUcwEEInPK+g5rWEcjUP5DklEXoLT9pQT3IkOxf/Wwwt0MLCtjJ0OEs8vI89lVJI196+5pVNP
 4FBoktfx4YnRnnvIXS39zSSg4iaRKkxssqA+8P8dcDxLun1GcWvcSe8cJ0r10o8CuLKARCLyXyW
 y1s1BseKvc+mEYWv72QYUOJraPCKivHm/QL8iNCMet1P+4gHkRHAlkJiWBtl9r9ptUjAmEML9EC
 Kyrio75ZOCl07BlGaQaXDmx6pIeuwMJcm194Cot+30QZ8LoAuIpWXgQ7t4lkK6W3P6uW8LwCJui
 n36BBBOmbueQVUDjiCPwpB/6a1389ixQPh0g0wW6hdxizayTJQo6fGVz3tF82i/eKtuIK/FkR6d
 EpwAuSUqQvpsb9aN0bBjAgRaVkPh8y3TAh78nRZK4taS5cpg1IRIC0XCWUsy0UBTWvD28H7SVj1
 7F5NifyA4LPajh+OBZQ==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4fa04f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mTzsPlHQ6iguFW8dCWoA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX3MyLg4hei0vl
 rgevRSWlJYEiFL1xek4V60IzT+4z2PZVJSNYeW2Le0Ni4eDs7CqP3PS2/kuXWamnSOD72N030cK
 22RTRfvBJ/hrcX4e5X3Gsh3rI7nUol4=
X-Proofpoint-ORIG-GUID: Qt5NC-YAywgmsqR51zirvTZZdRbyTwUi
X-Proofpoint-GUID: Qt5NC-YAywgmsqR51zirvTZZdRbyTwUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118001-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BE87731841

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board,
which is built on Nord GearVM variant.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Enable UFS storage support
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile         |   1 +
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts | 240 ++++++++++++++++++++++
 2 files changed, 241 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fb1a99a3e01c..8e6ef4116146 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -217,6 +217,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8797p-ride.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
new file mode 100644
index 000000000000..4ced77e3482e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "nord-gearvm.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8797P Ride";
+	compatible = "qcom,sa8797p-ride", "qcom,nord";
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
+	pmic_kobra_thermal: pmic-a-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 3>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_0_thermal: pmic-e-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 4>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_1_thermal: pmic-f-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 5>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_2_thermal: pmic-g-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 6>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_3_thermal: pmic-h-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 7>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_4_thermal: pmic-i-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 8>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_5_thermal: pmic-j-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 9>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_6_thermal: pmic-k-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 10>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_7_thermal: pmic-l-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 11>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_ufs_thermal: ufs-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 0>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram0_thermal: sdram0-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 1>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram1_thermal: sdram1-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 2>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
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


