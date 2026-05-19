Return-Path: <linux-arm-msm+bounces-108360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPVbC7gHDGodUAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:48:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB31578557
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C25B30544E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DA838F949;
	Tue, 19 May 2026 06:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9DkifEY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKFmNXc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921D39022C
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172570; cv=none; b=PZ93D8zGwVHRP8hpSSX7hnrBqA1DUooKjrTc/bJUaL5D+TNxIGGMU31cjkF9CL7nc+L8ODEJ7NDR6x6m13hwllbOHOVmX8wJSI+THFzs07PWQpxsDMTfOZH5Daqz7hOUk54gxlWM8PODIHhoUYBJwByTzJZ5Ae7ovipJM/DC8dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172570; c=relaxed/simple;
	bh=3m+jffTolua7fbirYqE5GZjOdVjNuN3gLhcb3ZcbjZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0XKOPXRd9SFsGbXoWlVIxjcDrQwMoTPlzWKFMx0DlgU1dJ5HpFnbyAEk/ZLZhzXQpywbX/aPS80nwxqgc8rNETX/Na9IDC1z0ijXlTpExZXB8b+heMQ6Gwax/sd+D67h63tFqOc2SLWM2Ni++orN+zoAX4w6fHsLhvW8aXN9mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9DkifEY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKFmNXc9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1TfrA2975727
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wzfwmzu6La1
	sZY0pkQJ5fRHE6gyVdLFD7h8Q7EUED+Q=; b=U9DkifEYwMveXXmK2iDW0tUyQMa
	DzuzTpIBPtn/IarUGznAeYLCOVVjsYlCHjynGnDOgWU1j54vikxQO8VGd8KadWRs
	65X7qVO+b4ltMqhNF6VMF+WxoLM/yWsHzBKaJ+dUNJyAioXh3hq0k6/nuiwKc6aj
	uCNS0o/6s8Fl9aMKdJRnqAuIhzhDVIliXqPwhMuEXSaR3Es2pv1QmcOI34e6+BJH
	j8BhrdZxK262ShIIFdjO2H1DNOt0292KuybTLbmg3oUBMtDBoNhJabgWyUnHO0JR
	6Vt9oS38Fuf7/94xl0f8JjCMizUgCz25poRU7olikPu6yt+ObJ3KLkc+MEQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4ayyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:36:08 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-130aab78a09so3329789c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 23:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172568; x=1779777368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wzfwmzu6La1sZY0pkQJ5fRHE6gyVdLFD7h8Q7EUED+Q=;
        b=eKFmNXc90payYiXjPXInIhjDxctSKQ2ns2CnRdK04FNBaxwYzbW7I06rx8x21X6UkU
         p0EspyR+1u7MSUx1yfm30gWX2osxijHmVJ7K2uxCpzsTt1LgIFqr28nHMtGj0nYRUBUs
         lfvZwJJEHdeBjyHvdXeBioVD4OXMHUYqEL0iBv4vBJQm4Pf+U8xfmEMzVI1XJtnKtUbv
         Rbj30ifij/ziKu+AxxJFvzLJDFJlRaZIpvQZcT/JTSbgciWek8GTFQc6Fbe9p70ESZro
         Kl7wTqfkFwsuVIeKH4aToKVOUPqqnppnNc3+ZeXrRCAwcVWxOfgMfFj2xbY3MWX5qym/
         EB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172568; x=1779777368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wzfwmzu6La1sZY0pkQJ5fRHE6gyVdLFD7h8Q7EUED+Q=;
        b=QMUFlYvuP/I0yDAIzMirxB4CwsVWtehzGSdTgftjzLqG7fu/RELYKR+MD2CHPX8rRL
         FC0J2e2kEvT9bYL8f5qGqf5j09g4AiaC6T00TPhBRgroIop+RcvlT1er8+imzax+8WSD
         zuOCY/PmWccFCZm/IH7O+gB9zLPN779RHLrHfEzgTkRo1ZlJ8VQZZVdJIfXNMWQAc2nT
         BwVhRyBSEfO/nE5YrG3rHyQ0mzqdgkH54/URIIdysBsG3ShryZcKI7OBLnv9+H/Su4yQ
         IHjG+NSLwikipOWQBMpcB7lr3+7gPZ4LiEIWjG23LdmQzQD1GZ3A6uiEudpFWm+AH1Y3
         U/Vw==
X-Forwarded-Encrypted: i=1; AFNElJ/fGYEK3zQuwHj8cWDLP3OoUP9qeqcWI/9GsBjDlAz2TPYMgG+1+4z8SOF4n9WCjePaPkLAX2gGJQ9JC09x@vger.kernel.org
X-Gm-Message-State: AOJu0YytqYOG3hEMTIiDHuEBl63c3rRBe6ldZzAMMPOUIsEkolt7Bsc5
	tJ3b9cgFHYURwijkX041sTXbCdTHOCshOPVR0gW0oX5K0tcu2PJQ5qA6qCe+dbK3mKCkd9AYYGO
	3dh9rSQHeNBnC0nhMvequyv+qk7repoa8gdkcgVCT6zcpDh4Fsw/SfDZXf3PJZWQF2nT6
X-Gm-Gg: Acq92OHHW5+KQI3IKcLY9NfAkw0x5FMPcMVbe6isp3KPhcDHQiauEYdnMUeiJxw+4Za
	1AYxwxvpaFh/RbXD0ptTadPrQn5h3qbmAHjou1gX2MXfcnK6nv6PqsjBx1RLMc7YnXo0mCA63HO
	2e6nQStdwGN02UtoNd7vYwnFvP96R2q21QpfZaLzejLF7QNiFlshCUiAdhEkGgBCkzpGW+1NYDY
	nM+TljCgVsB5UU0k0CWC7/I0A9cuo2yi9ILfaLAwel25aWMvOG9LRV9zLGrvJbbMov8d82jMLvJ
	1LT5Q4Z/3OTa7gEZ19reWDvMzKX0INhJMOP+gzcVwdPTgUIF3KogOj9pBqbGJxVmvgrq7r+p8w/
	CxM2XZ02kafINE9bd8tGYIQZS5NOMhcSuJQqNABxIV2Aousof3Ko1KjDAeZRagqAAI/ae8YxKNf
	NdGrw8BA==
X-Received: by 2002:a05:7022:928:b0:130:5c90:5a22 with SMTP id a92af1059eb24-13504a50480mr7081764c88.42.1779172567674;
        Mon, 18 May 2026 23:36:07 -0700 (PDT)
X-Received: by 2002:a05:7022:928:b0:130:5c90:5a22 with SMTP id a92af1059eb24-13504a50480mr7081735c88.42.1779172567026;
        Mon, 18 May 2026 23:36:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:36:06 -0700 (PDT)
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
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 8/8] arm64: dts: qcom: Add device tree for SA8797P Ride board
Date: Tue, 19 May 2026 14:35:05 +0800
Message-ID: <20260519063505.883379-9-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c04d8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=MxPmow6BhT1dHFM3JRMA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: D12HbR8L6g6isAwB7_e4p325cDagSCoV
X-Proofpoint-GUID: D12HbR8L6g6isAwB7_e4p325cDagSCoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfX1Sly6meFrODk
 n/Je4vn2hqPZYXwPmU2sCK8IXPk6RWwuSBFZ5zUMP3TkiNrnDk/QPQN1ndZlJGgIq+SGZQ11oMc
 XZcczp579CXTMtBTscnZeOWVUAV/Qxs1nML6/affKuhwMZ2rNuBwZAu5sVIObSV/hwGpupEVrHr
 /MuoPO9zSYMaboUAdFTQojd3tmzi5eE8yhL9q5XTJ8cs2trujFbNI8AhHvCoChGB1rOBQOj8DhI
 /Qb/FZWtwikQemySbaZeuTtseQqNtrTBcNVvXjRq9zVASgrcYnng1i9qFJQ3Sr1wJru9RA0rjY9
 ZwjtjpVHdEEIDoNUUD5Gdm2g/uB1S0MJ38STWHs8gyn36Ey4cv3wPsqRXF0rFTpnPTyGlkYJqdh
 1JcruJt657jSBlWNmoFBxFxJrMe7VOMJkB86Bna3htN1AFCGiVahSD3xuGlaaMdcxndIlz1BIdS
 xpVdS5gBanRFzmkJX5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190062
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-108360-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2EB31578557
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
index 795cee4757ab..578e0da824f7 100644
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


