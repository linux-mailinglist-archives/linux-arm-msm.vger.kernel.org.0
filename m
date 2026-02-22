Return-Path: <linux-arm-msm+bounces-93558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OHoDZA+m2m8wgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 18:36:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CA816FF48
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 18:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B97C300D4F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 17:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CE2350A3D;
	Sun, 22 Feb 2026 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ma8n57cM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSQex8QF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F422335B63F
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771781760; cv=none; b=hKNwyw5dA4i2YiwGjOGqz+F82I3nP/siQ+iUF0mWdiG9XuIF/wPaNziSFmcl86sb7KUQu8/zuj9hs1C7GzvRnkHrcPEUddVIovTeYl5LHrLk707vYABeP3pHS0IZugd/zi+YqyyjMiMtA0mWidSwcJOnfFad6q+1OypRQ3UBxP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771781760; c=relaxed/simple;
	bh=UBRzGvtTFre085RCuSkU3f9PquTNc72Y1CyyQDjKCQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=klzmnALSbIJavcUMM0gax2y8ErkAqB1mC77acNcCX312cqB4vjTh1aft4HADIZq6EObmsnPtcM/31cMq8dB0P7tLplEs8iuXKI+jJNr00vnJYyx3IwYIZgz6ZuM9FV3Jm0Wk96ak0nYjYgRhNUh/TAFRu1ihcHds/uJVLQJ9MfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ma8n57cM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSQex8QF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MHAqQj1060334
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 17:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z32pF/kacjQ
	eBSMKvxRXFmIguQZ2SMvLBwmrDLjPi9E=; b=ma8n57cMOIBEmSJYKv9Y+CNc0vT
	tlXF4rlAGbpG2xWLRtmJWz7BPO329OsopURNbIww5o317EUAZjbEn6D/sdiAiP0d
	DXeTlvAsKV4IhAYzylR2RDalykjaeKzPoJX9qlf7vXUoZ5ADmenet1MmVE84qBpx
	EuiIp9B0Wzg2BfhSJWb7WMpGjkqzf8ALrwYIGZbsNMk4mf8gcbD8Zpi5xwEDd7I4
	K0pC1Dwl7pFWVi6FKVMPae9OA+hyzhzAEscS0j427vEaUo2C+U2foBNjwlKyqRE5
	QwhFa5UqZ+JkyNre+MQn2+NFjnz2TN3gD45QDm6fuac9Lze0QTAmZZv/13A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9tge2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 17:35:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6d82308c28so2134950a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 09:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771781757; x=1772386557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z32pF/kacjQeBSMKvxRXFmIguQZ2SMvLBwmrDLjPi9E=;
        b=gSQex8QFxF7cx/XRAhne+e2HEn+XVeszgfQJxSUg1XV+2CBvz8GU3q3pcXLq5rLjD7
         Zgm+NGD80LwS+zjAEQfbaUJvQXHAhMF7Yko4qsaQrx3MNiNFr8xNLmVWcqNTi95Ea/qM
         OOjaYG6LbW78h/XJ9a693aWdArAN6GMd+/CQe/knS8dEkcXG8PMFksM8SdYutb//PtiA
         5xIBvEu9G0aeydizZT2//UF9yr2gCF1KDwfAvZgjJ6Fmrdt0ggnfrKasGyPjyX03w/u7
         uA77j7V0Ju3HyKgCojuT6z4JCgCVryKiQ2044KB176y7D7d8ADO3zP2tUw2hHsjY+f+6
         ljEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771781757; x=1772386557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z32pF/kacjQeBSMKvxRXFmIguQZ2SMvLBwmrDLjPi9E=;
        b=v8BgkHHbO8UPaj1zVzFWydNjTb/uFPwv+5bciC4GGar2R/3HJCcm8gChS9zVbWPRBu
         klMGlwUVjPfHclvAFVcMntHkppb0X1GxOJ+gvLzTwFQ5fxDcf+7Ybg9zp3J6x2eL20TO
         Ec9oeGGKdiO0v7FqrJ66hFgTXqn9WWtC0HpGA5QXMK9q/Im+xG6ytBEFfyDnj8wFnFK6
         IPFXwoPgSHT2Pv2aaWFwHeQ2qj7U6DtXSOyrA4QQRxiiOL0mRGidc1ENIiy7vfAzv+DE
         jAiiskGTrPMRwL5/Mb1LvADS3kJinqiyHNHXIt2ryqDWmYbx5etTFWvHtx8QJhnQGwLs
         ENCg==
X-Gm-Message-State: AOJu0YwetW6B6e9zmR5zgKx+lCZ0m9b2sTfAMMtpQeo1YnGRZAyyf0ec
	tQZp3pKIGhSSJK8NGBj7q91sqIbB//E/mz/HePdvEAAQEUwmWY6QvSy7Ab7Sqp5culcp8IRAovm
	cYb7bvpisJJslN6zJ3sU5dbF610lJFr6FJ0UzCBk264DwFL1xffj6LeYr1kYTw03e3mQq
X-Gm-Gg: AZuq6aKORkZ0Am8XnO5MZHUgxeu3He5QklcQFA+qiYBCfF8Ogb8U1yIUChtoOe7kTHn
	mRMEfe9aiNd8X53MaKpEfXwtyAWDvy/pPMForGhOOTJKITMsxM++PcWf4XATffcqpolVnbKTtoi
	uvon7KcYfX1lhoLbSdGErTPW8ZnC4UmiOhm3dn0d/UdcpJhBY2HK4UNfk1R3zc4i7RGDN+TxUta
	0dEQQWd19UNoiZqueJxx8kmQaPN1Nx4k3B07EbtHE5wWz17fgfHwYDIeZJMroEPrUklWtPcqMNE
	4LdoJLWEX6ef4pcM7NYHLItSYM3R7K3bsKnq0bBr5EIOhTJoi8F+EKYXCRICnaE/PhJ42FEKfXx
	37H7n8oqpn64quT+q+Thbo5zBiMDfqHbJfOmo1zyM4DuEiDVYUnqv
X-Received: by 2002:a05:6a21:6d97:b0:38b:e7ca:9517 with SMTP id adf61e73a8af0-39545f9a823mr3934832637.7.1771781756789;
        Sun, 22 Feb 2026 09:35:56 -0800 (PST)
X-Received: by 2002:a05:6a21:6d97:b0:38b:e7ca:9517 with SMTP id adf61e73a8af0-39545f9a823mr3934821637.7.1771781756312;
        Sun, 22 Feb 2026 09:35:56 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8cbb02sm5193757b3a.57.2026.02.22.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 09:35:55 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 1/1] arm64: dts: qcom: monaco-evk: Add Interface Plus Mezzanine
Date: Sun, 22 Feb 2026 23:05:45 +0530
Message-Id: <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
References: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDE2OSBTYWx0ZWRfX6OA/gQQUyJ0R
 3gKRVSfehf+zEzEXm0AXF1NhlpAo+Eqc0uiIusREpDnwfCUljGFNQG/1PPwMQlb8j3dSWQ0YRzd
 hG8qvqzYL579shZyMCuWFLviyVi/bfsDpy4LZKA7ZDM+Wj9/46nNssxYde1wm56PNdJDLQp5Bd5
 CVPsbT4mN4KQewZMKErW0yXEorjC6/9+lDHcVY04Kp8S7e5bryyA/BXumPyY5kqakRo0PNO+yj8
 I3HmYEtQJaLg5UTtGQsXMEqqAaeaAisXUQ8pYx1yIsW4eAadhay4Hq/MqvQw7Hv/tvAEZxJL8d1
 uA41pJweDXe5EH+MuQOHdCtk1CCCRPnJofQDIF3VtpsB7MBHL+LQ6sjzTLe98aaPizYLUQvyvhM
 Bop8Lo+KZWRCqoydJ9sRXwPohMwCV8tOzpktUBQH5EGpbnze3MTIeN/nsa3my3lYpgfV+rTPwlA
 1fTRYn70xKsiIOejTnQ==
X-Proofpoint-GUID: br2LxGB6Q0oAviWbBw761UPGjk61V1X1
X-Proofpoint-ORIG-GUID: br2LxGB6Q0oAviWbBw761UPGjk61V1X1
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699b3e7d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=7WwWSvKBDqV37eUiOWMA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_04,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220169
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.52:email,0.0.0.0:email,0.0.0.3:email];
	TAGGED_FROM(0.00)[bounces-93558-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41CA816FF48
X-Rspamd-Action: no action

The Interface Plus [IFP] Mezzanine is an hardware expansion add-on
board designed to be stacked on top of Monaco EVK.

It has following peripherals :

- 4x Type A USB ports in host mode.
- TC9563 PCIe switch, which has following three downstream ports (DSP) :
   - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
   - 2nd DSP connects M.2 B-key connector for connecting cellular
     modems.
   - 3rd DSP with support for Dual Ethernet ports.
- EEPROM.
- LVDS Display.
- 2*mini DP.

Add support for following peripherals :
- TC9563 PCIe Switch.
- EEPROM.

Written with inputs from :
    Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
    Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/monaco-evk-ifp-mezzanine.dtso    | 184 ++++++++++++++++++
 2 files changed, 188 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..9d298e7e8a90 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -45,6 +45,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
+
+monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
new file mode 100644
index 000000000000..f0572647200c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Monaco-EVK IFP Mezzanine";
+
+	vreg_0p9: regulator-vreg-0p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vreg_3p3>;
+	};
+
+	vreg_1p8: regulator-vreg-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vreg_4p2>;
+	};
+
+	vreg_3p3: regulator-vreg-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vreg_4p2>;
+	};
+
+	vreg_4p2: regulator-vreg-4p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_4P2";
+
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vreg_sys_pwr>;
+	};
+
+	vreg_sys_pwr: regulator-vreg-sys-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_SYS_PWR";
+
+		regulator-min-microvolt = <24000000>;
+		regulator-max-microvolt = <24000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&i2c15 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom1: eeprom@52 {
+		compatible = "giantec,gt24c256c", "atmel,24c256";
+		reg = <0x52>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
+
+&pcie0 {
+	iommu-map = <0x0   &pcie_smmu 0x0 0x1>,
+		    <0x100 &pcie_smmu 0x1 0x1>,
+		    <0x208 &pcie_smmu 0x2 0x1>,
+		    <0x210 &pcie_smmu 0x3 0x1>,
+		    <0x218 &pcie_smmu 0x4 0x1>,
+		    <0x300 &pcie_smmu 0x5 0x1>,
+		    <0x400 &pcie_smmu 0x6 0x1>,
+		    <0x500 &pcie_smmu 0x7 0x1>,
+		    <0x501 &pcie_smmu 0x8 0x1>;
+};
+
+&pcieport0 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c15 0x77>;
+
+		resx-gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
+&tlmm {
+	tc9563_resx_n: tc9563-resx-state {
+		pins = "gpio124";
+		function = "gpio";
+		bias-disable;
+		output-high;
+	};
+};
--
2.34.1


