Return-Path: <linux-arm-msm+bounces-97431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEZCFQrqs2l6dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:42:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B13B281A34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F84E30502B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335E039184A;
	Fri, 13 Mar 2026 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrzDv98d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhGO0pKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9F390CAD
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398345; cv=none; b=BkYv64NkcF6TiGfQL8EwQE95ZxzCvmfIE4ryb6c0XPapjPR234hm8xjI6Kc8vn8uCTmAAkdVQ27JaxBvi4rt+9xvBUXRYBRjgBWjEOQ8129/KRAmhYmjNGMTB8abRXCE/+gOBdeM0ymieHMyreKuduihJjTRdQtxhZoSvjJ2nmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398345; c=relaxed/simple;
	bh=7yVhILjAa9/m1Yq+VT4VNAA5omdAS1FCTO+tSNG3Snk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EqUEXgGqYptFoc/uZO6xOckyLnzK6bNqOfjTRHfPV365UfGp9UfMoDZOXb711i4CozL1sYd+nKE8FFMAAloHQDM9H2g1DgPKKz4Lu/ralClhttqZ8dymGzSf2xQeqcJRoHj7klhmJ3QUP/8OlAYewZQy7hRJlPezWgDWaO2HnmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrzDv98d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhGO0pKD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oJj8792849
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DX/c6F3QT4nueHHbZkNouoZ/NchMmAs1cDI/+ni9KEY=; b=DrzDv98dhYPzGlS1
	ANv/RApuIsAxT1hCYoc3SEQrwzG579oANJK9PY5MTw/qsHSBCbkQztap24Dqd1m6
	xfbcWCVPmxf+8UpVwgY/L0QQxRrtAQs0FOUEM94q09lteK2Fx2zt8I8LS76m+M9N
	PR7kgOAvpj4Xeayrb5OLHaxR1ZIrQXE+wfFxyha6EgF8a97s01lmS89UhvGIsS9o
	oK9HeWy33Obr3KFJeGExB9ZQFR/uNpiza1hBR91Yoz7vnhB2a2f9GESus7s3HNWx
	19v+ItGbLSZUVGaHoF+rVbvzNbTt2JBRX8YD23cKctN+9QZ1X6oz2USRy6NZz/bi
	O3NmlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt0tqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81be6f05so1197060585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398336; x=1774003136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DX/c6F3QT4nueHHbZkNouoZ/NchMmAs1cDI/+ni9KEY=;
        b=IhGO0pKDDvgYri9O6vdsgypiau/fnlwvYed30MNPPzKXaDLKnhOBHrLX+S5E2rcz97
         9cZcN+Hu0hqSviXdCOcUDPx5i70RpWZ2HjOeFAMBSC2XrQ/93ehv34rfAe6Oz6Oxnca8
         OenWNfXD3+wjVbDNNxq5pu7u4qa5U6eZ0e9yuz3UX91mtNH/A3/bdPj0hG0uF1Iom90D
         r5OvM6ApLyUa+ZctSY9sL/OrTvb0HnlCkjKGNeuswMKCExAJ8+jzmvz5e/tdyoxmfu1E
         XdSIXxWlxpxJyLFTd1Jj9Sht1Uk0mCZGLV+x14lzqDp2O2f0Snbu5JTBtSqFF9k2H8A5
         uuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398336; x=1774003136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DX/c6F3QT4nueHHbZkNouoZ/NchMmAs1cDI/+ni9KEY=;
        b=GcSNbC5ysJyrrygJPTF/bsJ5wYWJIhlQ3zmpxrS4iyZYTtQZ9KKiMN/j1Molza/8AU
         k90WJSCVA7Twg/UiTcK6GbvNE3ke+qodIzS9sJBOxxHWBUI6sxIn2Z5rvpPT4LMwUePs
         cq4Z8OnUCBCyXh0U1k5Vzp0Jkv2J8JE+qvGN/w7Q4h5xsyryiJlLDq9p2Piyp59sNMSR
         2hnUtuHlnPDs6izUSajcRErCbDvcnN5wWeW+Hhds3CaxEAS4hAvS1uW+k7Zd7FrVsqBw
         fq7w++KteLsrp50YhYsiz+6TSL+DHd9rB01L1Io/ccEJUZ5kocjosvpSy0d9Zc0Cowbf
         Da3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrWoWqOTzOAgXL4WaY7E0VtrZtwTnp/epH9ceFhVYArB3duydMOdLV3L5lad/QxFGOvnwobX76OcADRB1X@vger.kernel.org
X-Gm-Message-State: AOJu0YzrwSxPXgK5u+oB/BE/A/A1IxUjrSllyqloTV+/wqsVUNT1QUJQ
	6DFTJ+GFXyK1KdVpsl8nW9lYxxj1tauczaAjOMhak3axRkpGppuB5/9O6GCFfk7Ge1hmbN1kPGm
	ZTLnYlxzAChrA2uWfo1Hqi/nyf4pYY2Qo4yq8/tcXyA1rmj5oG/67f/jwmSrp1ZelVIvG
X-Gm-Gg: ATEYQzw8ImZ+fcvt0HFWgOF3/2pSgaYxvSJPCasw/dKsDGdIzmyaCi4ZY5kDv7FnhGD
	zCerEXuzl2n5WuruodPwZ9q8W52RWtGefNgKHLwpGD0vh0BTv9lnzdq6Fr4NJ7LlmxA0Jd9+zy4
	qGhnZfPCpIaGtUhh5+YsFzVx2y8lP6Cs45/vTcqchGiiGw9o2FWi1Yvhh8b5m8ui8rvqgJQ138u
	T++fqb8HMrfhbeBbF5kQ0yX3Ynq3hvLKB9b3rpu+8L+NK0AnArSaj9gPEXpEHV8dIvuLfr9bgQP
	IJrN5qF79q1USBs5MFR+SA1e18k0UjGXIhBNPHQwre2ukvtTE6U8iCPYXoddzR5bjSZFtLjnyPD
	OSejm2gl5ZTOl9lxGx/no3wGwZqXIJBvY8Krgj2n59dzT3JoXG3K3JbM=
X-Received: by 2002:a05:620a:2981:b0:8cd:96e5:f7be with SMTP id af79cd13be357-8cdb5b7cae0mr366015285a.69.1773398336209;
        Fri, 13 Mar 2026 03:38:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2981:b0:8cd:96e5:f7be with SMTP id af79cd13be357-8cdb5b7cae0mr366011685a.69.1773398335690;
        Fri, 13 Mar 2026 03:38:55 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556426be9sm20183445e9.9.2026.03.13.03.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:38:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, r.mereu@arduino.cc, m.facchin@arduino.cc,
        geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 6/7] arm64: dts: qcom: Add Arduino Monza (VENTUNO Q) board support
Date: Fri, 13 Mar 2026 10:38:21 +0000
Message-ID: <20260313103824.2634519-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3e941 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Xln9Pg-RQijGr6P42K0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 90r8GnYHkYkVrSkhOwz56UWvEa1YXgt4
X-Proofpoint-ORIG-GUID: 90r8GnYHkYkVrSkhOwz56UWvEa1YXgt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MyBTYWx0ZWRfXyUSLMALT37aT
 4T+8Np+bq/IQh2xUo9E/yiE0Vzqsy6W5Z728WByo4R2pxMA7JPTtDG0ZcVE0govulNJa6WxmzVb
 JRSAQqJDrR7juQ6w7ciW9Z0VmyLGYa3aPPSYWjap5tuwi2f7Ctipa42kXNhJ6QPP/Kp4wKAsGyl
 J8/EclYqYg0fQruYJ3fjyB4WtBwg1y4roF4WzPkg/KlN9bJBX4/tm4YIX1fdZyWsyBwRR/O0mCY
 DkjGUF68Nbf2cCy1c5S1Mh87u5BxryCZ/QcJavtNApufNSM/cIQnjiYmSt/zmwNXpP5kk/qrDP8
 JPvwOyH2vw5EkGsjgg1ZbQCj8Z3MwFPM5ltsffDin9YaJnY4IolT7S1EiZXAun3Soc+F+gmA62n
 iPSeT6flF6aOM43HABpdigoi0xVUO6YzmreYv+D0kM6VbNVGXoYpjNhqEQtfIAI+UwTiqEQTKu5
 Xq8c1nq0kgCkcy1w/TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130083
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[gmail.com,arduino.cc,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97431-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B13B281A34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

Add device tree support for the Arduino VENTUNO Q board,
based on the Qualcomm QCS8300 (Monaco) SoC.

The board features a Qualcomm Monza SoM and integrates various
peripherals, including:
- USB Type‑C connector with dual‑role support
- ADV7535 DSI‑to‑HDMI bridge
- MAX98091 audio codec
- 2.5G Ethernet PHY (HSGMII)
- PCIe0 (to onboard WiFi chipset and USB bridge)
- PCIe1 (to M2/nvme)
- Button (via GPIO‑keys)

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 466 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  55 +++
 3 files changed, 522 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6d87be639aac..0b26f0dbc6df 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -47,6 +47,7 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
new file mode 100644
index 000000000000..ca14f0ea4dae
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -0,0 +1,466 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+#include "monaco.dtsi"
+#include "monaco-pmics.dtsi"
+#include "monaco-monza-som.dtsi"
+
+/ {
+	model = "Arduino VENTUNO Q";
+	compatible = "arduino,monza", "qcom,qcs8300";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		i2c1 = &i2c1;
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-home {
+			label = "Home Key";
+			linux,code = <KEY_HOMEPAGE>;
+			gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	sound {
+		compatible = "qcom,qcs8275-sndcard";
+		model = "arduino-monza";
+		audio-routing = "IN12",  "Headset Mic12",
+				"Headset Mic12",  "MICBIAS",
+				"IN56",  "Headset Mic56",
+				"Headset Mic56",  "MICBIAS",
+				"MIC1",  "MICBIAS",
+				"Headphone",  "HPL",
+				"Headphone",  "HPR",
+				"Receiver",  "RCVL",
+				"Receiver",  "RCVR",
+				"Speaker",  "SPKL",
+				"Speaker",  "SPKR";
+
+		pinctrl-0 = <&quad_mi2s_active>, <&quad_mclk_active>,  <&lpi_i2s4_active>;
+		pinctrl-names = "default";
+
+		pri-i2s-playback-dai-link {
+			link-name = "Analog Playback";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai 137>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-i2s-capture-dai-link {
+			link-name = "Analog Capture";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai 138>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		hdmi-mi2s-playback-dai-link {
+			link-name = "HDMI Playback";
+
+			codec {
+				sound-dai = <&adv7535>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai 145>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	vdc_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdc_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vdc_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdc_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vdc_5v: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdc_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 49 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		startup-delay-us = <20000>;
+	};
+
+	vreg_nvme: regulator-3p3-m2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_m2_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <20000>;
+	};
+};
+
+&ethernet0 {
+	phy-mode = "2500base-x";
+	phy-handle = <&hsgmii_phy0>;
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&tlmm 50 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&i2c12 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	max98091: audio-codec@10 {
+		compatible = "maxim,max98091";
+		reg = <0x10>;
+		pinctrl-0 = <&max98091_default>;
+		pinctrl-names = "default";
+		interrupts-extended = <&tlmm 16 IRQ_TYPE_LEVEL_HIGH>; /* GPIO_16 */
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_3 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+	};
+
+	adv7535: bridge@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>;
+		pinctrl-0 = <&adv7535_default>;
+		pinctrl-names = "default";
+		interrupts-extended = <&tlmm 93 IRQ_TYPE_EDGE_FALLING>;
+		avdd-supply = <&vdc_1v8>;
+		dvdd-supply = <&vdc_1v8>;
+		pvdd-supply = <&vdc_1v8>;
+		a2vdd-supply = <&vdc_1v8>;
+		v3p3-supply = <&vdc_3v3>;
+		v1p2-supply = <&vdc_1v8>;
+		adi,dsi-lanes = <4>;
+		#sound-dai-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp0_phy {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&adv7535_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	vddpe-3v3-supply = <&vdc_3v3>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	vddpe-3v3-supply = <&vreg_nvme>;
+};
+
+&pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+
+	pci@0,0 {
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		bus-range = <0x01 0xff>;
+		ranges;
+		reg = <0x010000 0x00 0x00 0x00 0x00>;
+
+		pci@2,0 {
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			bus-range = <0x00 0xff>;
+			ranges;
+			reg = <0x021000 0x00 0x00 0x00 0x00>;
+
+			usb@0 {
+				compatible = "pci104c,8241";
+				reg = <0 0 0 0 0>;
+				ti,pwron-active-high;
+			};
+		};
+	};
+};
+
+&pcieport1 {
+	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
+};
+
+&tlmm {
+	pcie0_default_state: pcie0-default-state {
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio5";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio6";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	max98091_default: max98091-default-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		wake-pins {
+			pins = "gpio21";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio22";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio23";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio79";
+		function = "gpio";
+		bias-disable;
+	};
+
+	adv7535_default: adv7535-default-state {
+		pins = "gpio93";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+/* Internally connected to the MCU (e.g. for DFU). */
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 53cbc08d4df4..837adf569485 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2885,6 +2885,61 @@ lpass_tlmm: pinctrl@3440000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			quad_mclk_active: quad-mclk-state {
+				clk-pins {
+					pins = "gpio5";
+					function = "ext_mclk1_c";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			quad_mi2s_active: quad-active-state {
+				data-pins {
+					pins = "gpio2", "gpio3";
+					function = "qua_mi2s_data";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				sclk-pins {
+					pins = "gpio0";
+					function = "qua_mi2s_sclk";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio1";
+					function = "qua_mi2s_ws";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			lpi_i2s4_active: lpi_i2s4-active-state {
+				data0-pins {
+					pins = "gpio17";
+					function = "i2s4_data";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				clk-pins {
+					pins = "gpio12";
+					function = "i2s4_clk";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio13";
+					function = "i2s4_ws";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {
-- 
2.47.3


