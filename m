Return-Path: <linux-arm-msm+bounces-109395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLGKDGScEGpuawYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:11:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5AC5B8DE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8995305DEDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4576368D7B;
	Fri, 22 May 2026 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPQpNPse";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOabe8SB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD8F3672B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472987; cv=none; b=GE4injGQsdvs2rnKIQTm9yB3p+wfrSLx8PEVOyAF/3I8N0auSITlQcblXxbk/6ombX3RjkWw0pdUL+zwcWC1LXK+zsRNjHQfPFHWujX16kqsxHh/LzD5rBWHqQLNcNiflOWjb3WvKHVeFZ+EPSMq4GIkoIHYeorcGhm7gU9MGC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472987; c=relaxed/simple;
	bh=ODfMe8YwpE9zm6WOKy1yvRuBsZs9KnzIUkMMO4tFT3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOGwsxz4650PPymrg/umUW4OpY4kQVMrXBQGIz/eEkz+Xx0NQ91QUQ+P9Wk1WxFpF9EcmPFVttM/FzQGnTel+ZPeSnlMACUXnXhV3gN7mYzyn+tYzg9L6m9xzj7eS0bKP/oDsJ5M25cXiWXA19yRCShoZtb49kWnL/wlFlY8mJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPQpNPse; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOabe8SB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MCGfQV1959859
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=; b=fPQpNPseu/T78jvD
	0yn6iOPXMQufvBZZdgGzPqz4s3BU9EbcM8mXoJO/Ur/GyH56vgM6xigpTD/Fo1t2
	+4ewgfq6aCjYm6/U31NroVELaaE0pspoOVMOdhfVjjvul8SBi4eFgOjMqM+4mtUw
	5kV0ky/kF1sxujWsvEbFvOXf5eRHUhWrsN9DeT+I0KWi8MSPUsnp4flsg0N1mFYD
	jWYdnpz60meKNUOojMHzywlSjc9Q9x74KWMZFZ1P2zLEYA93E2vIOqQivKjI650I
	tU+LTslg3EWjFleE91wgsSpOfUMHpm7Wt4wMEZ9w6j8EN/LuGzJz5SJC+sXCqcEE
	qdhSAQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxets1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:03:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so80179465ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779472979; x=1780077779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=;
        b=XOabe8SBl6at3XeJUxiOiIUOV7ygKoB9opIu8i9ai/4zMW0IMzf9KCXp+jn943+q+t
         cXIoOsL8FDypawvzguDPDU49CDzLmi9DriENfyvdryC1UOwPstwQzspTBpG7J3oqgvRY
         eFfie1hZH5VuWpfyGcd158cRgoLr/0+HcGhlpUwqk1ZiTtDqcMgZnxZY1YmH468n76sL
         s70Z3FmO+qxankjuCWUD6BvFoYfGi18heyCfjxYQSLqqISEkH4DpUnHUs5IqKCXJURso
         vJ6GUsfahseml2+7UWwrvzWmS/hfSZjfaUeNTfLZM7lfsi+oHm9XZV7AlpTeekZwO0H8
         YR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472979; x=1780077779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=;
        b=lMWZUqayHxnSv/3RnOfB/4T9HGWma+KAlk1c9xt8rUwkT1Tzu6Nt+yrYwlZckcQC9H
         uJdVoHHASq/4wEKditsbX+8Fku+53oMD1oGQqGqxSFa9L877yX4SOzaLf2dPPEXSWJXD
         vRW7sX0yjEnvHC5D3tr5vBuy4N5yme1Mf7akl3lgjLagZRmlIobTAgEZden+oZX17sAo
         gx4JB5BvA4QUKCKrun8ozYHXDkWP/TeKM6U04MBdOof482sgmCb4l8sDIMH0p6HQLX5g
         VU236ot6xizoRV+eBaXpUJG407J7gZlaKDMpN/JvFidPx/la9f1eSdFRJE8vqQKQQYlo
         YBFg==
X-Gm-Message-State: AOJu0YwiAtHWzqWQ2ltntkyH0unI4BJoHfzYRyCJa5j9maJSvMy1toH4
	PEqzdky81g8RUd8kHgJmoRDIv8yHxKLc8lIZj60hCKrGRLhRK6nv4+ZvNGYyLVWqxwVpNpz04jA
	GV41iS4d10CAbz8B9r+qUaFVX6BTCcVEpyx7Q1VlJDUXmhtflM8glPsvU1NqR2cVcua8M
X-Gm-Gg: Acq92OG1miOO+4khDRB2DJfUKFw6RqeBNCfIfjycjK72ASKGX72uCZ8kJLsVOCYm7uI
	hVy6BudkXBrk0SuTJqplxdnmON01HoitzELSUyCnL0ibX+5lopvFWBnmFcLVsA9vSojlAV16Zf2
	1E/ZSpuCTXw+qMPOspYg2jo7IOqkAwZvLkoTVUWbahKN9FVBrqyjRUPPbvRunODUTz6zON9NEdu
	cY7l8DvrVgSM41ARKNPi3VhiJwKEcbPiYxWdbqkCM4dnx4YRwd7IWC/778QDZCWEHmMkJV6Rjus
	zrrslkBz7Wlj2or24mnQxrwRlkh0grdj111yI0Sr+9OcF152zpJUXQLqPVE3TTxxcCnY+kYa7R9
	SWpXbDBp1r9tMJvAG0cwGJxbtOruWXrUEv/RgnBlfonjHD4g=
X-Received: by 2002:a17:903:41c2:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2beb07db743mr50570475ad.37.1779472979181;
        Fri, 22 May 2026 11:02:59 -0700 (PDT)
X-Received: by 2002:a17:903:41c2:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2beb07db743mr50569905ad.37.1779472978605;
        Fri, 22 May 2026 11:02:58 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58ff106sm21193645ad.74.2026.05.22.11.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 11:02:58 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 22 May 2026 23:32:27 +0530
Subject: [PATCH v3 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-shikra-dt-v3-4-80ffde8a3dc4@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779472947; l=4539;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ODfMe8YwpE9zm6WOKy1yvRuBsZs9KnzIUkMMO4tFT3E=;
 b=KtKGO14IoZEn6XSmwkQjzh4RuB8D4vLo7VQiZcMsGVg9S8KCU8nTWc8JpyPOZ34BkgdurHD59
 ZFJAPGhlzEZCswyt7EKFSviffQ/DZ23ebGTm9J60w93SEh7BBnzHOsT
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE4MCBTYWx0ZWRfXw7GUO1GbVMsK
 nliELOBEtgrdkzBULncY9QpQk25ASsraNXcK/TqiMeB1YcmYg1VLO41dc6V7VfgqbrDgpUoJ13q
 AIsVZQ5K/mxpUuzQri3jCltyawTORBmJsANwwXtxWNcDXLGZnVqLC4MkjA4SrUWg+x63ej8Ys1O
 4rCFTA/cklaLfeWkszJQQ3YgGLLpdqne/TWByDRueuT+XxHzeTlz/ENeOyj8pZ9ge5r4TFJzJot
 Po8zmoNisdZy8ZnfiQKLL8AGp6d/Y2J2Bp+XhiMnZkaEPx/zeS5MiaxNYiZ2ZZjECEoXZu5IoBj
 a/KrzBlEaWepAKzdTU/wXSSsm49oCD1abFh6bpdxacv08rTbEgek/suKnpHyTB2qpLADR/i7fkp
 XvXYWVsAO3sKYS72hxLVOyvLAqRJWRV4ZbAzfaDrqbkecIGQrosdR3LtPBxNHRTHXrRLuTfjCVs
 ZhpPV3LNDXfaBqZkPNQ==
X-Proofpoint-GUID: iu7dftblhqaaaQBgA-MNu0lgG0B_Z9Kl
X-Proofpoint-ORIG-GUID: iu7dftblhqaaaQBgA-MNu0lgG0B_Z9Kl
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a109a54 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IZjsGcCFCfEoDLf82CEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220180
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109395-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA5AC5B8DE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree include for the IQ2390S variant of the Shikra
System-on-Module, an industrial compute module integrating the Shikra
SoC and PMIC for industrial IoT applications, designed to mount on
carrier boards.

  - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)

The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
definitions specific to this variant.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 170 +++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
new file mode 100644
index 000000000000..73945bf42112
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "shikra.dtsi"
+#include "pm8150.dtsi"
+
+/ {
+	gpio-key {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_n>;
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
+&pm8150_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8150-regulators";
+
+		pm8150_s4: s4 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s5: s5 {
+			regulator-min-microvolt = <1574000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s6: s6 {
+			regulator-min-microvolt = <382000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		pm8150_s7: s7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8150_s8: s8 {
+			regulator-min-microvolt = <570000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm8150_l1: l1 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l2: l2 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8150_l3: l3 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l4: l4 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm8150_l5: l5 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm8150_l6: l6 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l7: l7 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		pm8150_l8: l8 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l10: l10 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l11: l11 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l12: l12 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <1950000>;
+		};
+
+		pm8150_l13: l13 {
+			regulator-min-microvolt = <2921000>;
+			regulator-max-microvolt = <3230000>;
+		};
+
+		pm8150_l14: l14 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1910000>;
+		};
+
+		pm8150_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		pm8150_l16: l16 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l17: l17 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l18: l18 {
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <728000>;
+		};
+	};
+};

-- 
2.34.1


