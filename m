Return-Path: <linux-arm-msm+bounces-95372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N5XBhJmqGl3uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:04:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E202C204CC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18CF730B2C8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 16:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A923935BDBC;
	Wed,  4 Mar 2026 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hidXsICR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WmVGYAo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382FC372ECD
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 16:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772643579; cv=none; b=U13T1oFJ9UOLuJOx+Mcu90Y/YlL/7iIPcrH0gWPQhdwLs5q4LNgHHe+VtSiNIOcQ4PS0a/mXwvHTG15pn3NyVan0aLJ8neO8l6sMSbRCCCWBW6aT203a3ZqqF1Xo8MzyMuU1+22IVncBAPO3+x6lGzp1kMgVl0Tj2RmeJKU4OpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772643579; c=relaxed/simple;
	bh=XD9dhoS4sImyDfdwavsER9DFYTLMibEWfVBhZWIr2wE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hQzBkafJqjf2POm9+CTJaxP2645q15B59s/o26Ni7/kL4LmVXY6tcn4TZb9V2KfIw/nQm6daZ4PZ7jTAh1jX/TH89wdkf6R7IJzjE/5+Io4HayU3lC4xrML3OxfR2OJtCmawxFtik4qGc38SfJ4ak4pc9S8hQln4r9mSucdQglY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hidXsICR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmVGYAo5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Ccrps2275097
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 16:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4BzXM9+hcRl
	+9NZ+Gcz8KxqxYWqZ9juws+1KiNTKMbA=; b=hidXsICRL7IQQyy2cBY0UBH8FyV
	lov+Nwy/z5+odHjHzA+gkSgyGgQh8HWzInmg5g98YGpeuVOPzbTa09HiARlmgR/j
	OU5g0/jGDeJLSO+vvrMOIcNppPad7pPcdsDgAoLFx1hKeZ0KZPDLTnEyZr3vRM0O
	xrXIoqj9iUq/HExRlRpwdfTbR3I9DFgQNQ0c9+aXcaZ/RC8g5Y6NoFyZlJiO2H4i
	lTz6yVDqLQqZXZQmDTuf1t7b91qrt4a8zcI0xpjuarhd851yZL+DH2tXBzz8QsKn
	yZxzT42xGBOQffOcpCVKs9IX67BSdyAxaP032+Vv3pXi3mFY3sIgkLZ6ZTA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4mtkr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 16:59:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824afd103eeso2318860b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 08:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772643576; x=1773248376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BzXM9+hcRl+9NZ+Gcz8KxqxYWqZ9juws+1KiNTKMbA=;
        b=WmVGYAo5TTv2j62UZ5/4qA4Z3cS1XdCqtZ290Red/rcjGc4x4CdHIUqWBZlCBkMPli
         q81wqEP1RPysUv+Mz/TwB9lWbybjvGeyLMhSLpvdcqDzz1y+56cihSOVuFOuoGaEaDmI
         EOi3O2oVUFAMdn74KpwoIOnKBXCBAYX10nzxzbnbM/zCh9BVvVSIaotjbByoJhiISZw4
         R0kmQ4mWKpXDYCs4puSnSrGmxzG05QZGVwi1kAcvLfelb9SOHXFzvPpZ9uhXwuoKE4XV
         muN4onk1YfK12zfOh9JmL1+33j2mYtbHtkcmgOlIiHSOmT+wzZIxkav5e83YN+AIpyo7
         fxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643576; x=1773248376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4BzXM9+hcRl+9NZ+Gcz8KxqxYWqZ9juws+1KiNTKMbA=;
        b=U3BDJI2k06tvzU2ZYS4k//Ke9jjqWGahROM9JxHDu20xGNixQ4+q3t/ui+CVX85zee
         erXnLkBTFcLyTkek46Q2CwuxtcgqHWynDdxJf0fl/DwLQPn7WiMvPye4t2BTe+6m+rXt
         9QQFJpj5Ydc2vhOP67kZR+JMQxn9ISRGieYYCtvvZD/qNehN5b/6gTqjMmdMlyEx8gek
         aebGkLgytJu0cGIi7OLgyeBYSewIiayGohmTU4/J1zxYqsy1zWxX9o5b04VrTu4++q0/
         68J0imma+woN5eEelgyKGeEmQiUWBN1ykWGIcjI1ubk6s7zZ0tLdJaEZ4SYT+f2+0j7D
         xkGw==
X-Gm-Message-State: AOJu0Yzx2AuE4MnAbgOhrICp4UJqPfPWP1Jn6S0aNswyWKSWC1btWv9T
	L/YGoM+fIbHZZ/ph0yN/5WxUjzAVIREbAA4z0EjPEi86gQ1y61ZqZLsIVuJlytdD2DIptrSJdKH
	8+KGM0ov3x6D2UgXyXb1ICaouZ8kZStmqTBLdzJqcF4REW2KyhyQSmIQrBWvQ/LiN1SB7APb+V2
	Cd
X-Gm-Gg: ATEYQzy92EkpvavFVK0nkXuvlBNsJnf0ejz+aVC95beSpRV3EmHtG0/kAiSY3f2H/Gn
	FMymo1EWmO9crK38Si6pgct6dLjX1hJT0qFCnc1Ji8eI0sVrw/Y6pzlw4qFf43/r10pWebpSikx
	Pb484BpXBnu+bmdy15aHhs7rTLSTX5jRillHUzhAHXXTREdqomWH9CvzO0Mjg0WXoneqoDrTql2
	VLVt0VLypYjT+CCBglRdTtbrfgZOvUQscpVPdqjAqD6i/g8C+4XJg6MZ1PI35m27OF8vHBdwpot
	W7YLO+qL5hykCoX8Gn1ILNv1PF8h2eGvPd6PZGC8Zi3Yg8HsNPSWISU1rJrQEUAezeshUK+GyDm
	OSUfzQoh3mYz9EubeK8ZjWJjF6gmfHS/pQkaAEq9HnmJAB6Awo634
X-Received: by 2002:a05:6a00:26f4:b0:81f:72ef:27f0 with SMTP id d2e1a72fcca58-82972d5502emr1239898b3a.6.1772643575844;
        Wed, 04 Mar 2026 08:59:35 -0800 (PST)
X-Received: by 2002:a05:6a00:26f4:b0:81f:72ef:27f0 with SMTP id d2e1a72fcca58-82972d5502emr1239880b3a.6.1772643575324;
        Wed, 04 Mar 2026 08:59:35 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8bcb2sm18637245b3a.22.2026.03.04.08.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:59:34 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 1/1] arm64: dts: qcom: lemans-evk: Add IFP Mezzanine
Date: Wed,  4 Mar 2026 22:29:25 +0530
Message-Id: <20260304165925.1535938-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260304165925.1535938-1-umang.chheda@oss.qualcomm.com>
References: <20260304165925.1535938-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dtRB96TQTVaqbLiduzzBBf69sqhja8s0
X-Proofpoint-GUID: dtRB96TQTVaqbLiduzzBBf69sqhja8s0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEzOCBTYWx0ZWRfX0a2iPL2qjwf2
 3SNwx03Et9WD8vigd4OTZ4DVIMN3rEF+djEloUHuu/Dp4A0RT4j/O7WPBRuLlWF7FLwpraamupb
 IonznH8q6Ikv4TJ1stzU+Kbd4oLB7fEQnog9O+gh52yvJO+jvZlI+edRH47j92rCvYxeTBB6fJ4
 sPK0HlDxjxSZ/a2Y51yPnkUV3DJNQYO/JqFOMZaBgm8AiKilNQPLoedBin37scuQ40qrMlXF0gi
 FP34cNskAsFpPtzoRfzdXxKgeEhGEPXYoLTP4vW4s3436rOIAOKqdcTyMHpXjd1e6wLSZUFCCk1
 Lpgr6rGqp26phEZk5rGrUFlXwRx25OlpVb3uhhDE9lkPayUOCSR/6NNfE0pw8TpCrPWElA1onmb
 GS4sQXnic04ZGikIODTiuhdQSZgr7oQ14h3cLD+3HlDRXv2I2NvsHcJoOg/1h2x+PpBN5c1cQTc
 I4PVI7BWUlVnhGMWMxA==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a864f9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fEJyUVx_nSu-fnBOE0MA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040138
X-Rspamd-Queue-Id: E202C204CC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95372-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Interface Plus [IFP] Mezzanine is an hardware expansion add-on
board designed to be stacked on top of Lemans EVK.

It has following peripherals :

- 4x Type A USB ports in host mode.
- TC9563 PCIe switch, which has following three downstream ports (DSP) :
   - 1st DSP is routed to an M.2 E-key connector, intended for
     WLAN modules.
   - 2nd DSP is routed to an M.2 B-key connector, intended for
     cellular modems.
   - 3rd DSP with support for Dual Ethernet ports.
- eMMC.
- Additional 2.5GbE Ethernet PHY connected to native EMAC with support for
  MAC Address configuration via NVMEM.
- EEPROM.
- LVDS Display.
- 2*mini DP.

Add support for following peripherals :
- TC9563 PCIe Switch.
- Additional 2.5GbE Ethernet Port.
- EEPROM.

Enable support for USB hub, LVDS display and mini-DP later once
dependent changes are available in lemans-evk core-kit.

Written with inputs from :
    Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> - Ethernet.
    Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
    Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/lemans-evk-ifp-mezzanine.dtso    | 263 ++++++++++++++++++
 2 files changed, 267 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6d87be639aac..9872bbab2c71 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -45,6 +45,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
 lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
+
+lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
new file mode 100644
index 000000000000..268fc6b05d4b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -0,0 +1,263 @@
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
+	model = "Qualcomm Technologies, Inc. Lemans-evk IFP Mezzanine";
+
+	vreg_0p9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&ethernet1 {
+	phy-handle = <&hsgmii_phy1>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet1_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+	nvmem-cells = <&mac_addr1>;
+	nvmem-cell-names = "mac-address";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy1: ethernet-phy@18 {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x18>;
+			reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup1: rx-queues-config {
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
+	mtl_tx_setup1: tx-queues-config {
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
+&i2c18 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@52 {
+		compatible = "giantec,gt24c256c", "atmel,24c256";
+		reg = <0x52>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mac_addr1: mac-addr@0 {
+				reg = <0x0 0x6>;
+			};
+		};
+	};
+};
+
+&pcie0 {
+	iommu-map = <0x0 &pcie_smmu 0x0 0x1>,
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
+		i2c-parent = <&i2c18 0x77>;
+
+		resx-gpios = <&tlmm 140 GPIO_ACTIVE_LOW>;
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
+&serdes1 {
+	phy-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&tlmm {
+	ethernet1_default: ethernet1-default-state {
+		ethernet1-mdc-pins {
+			pins = "gpio20";
+			function = "emac1_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet1-mdio-pins {
+			pins = "gpio21";
+			function = "emac1_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	tc9563_resx_n: tc9563-resx-state {
+		pins = "gpio140";
+		function = "gpio";
+		bias-disable;
+		/* Reset pin of tc9563 is active low hence set default
+		 * state of this pin to output-high.
+		 */
+		output-high;
+	};
+};
-- 
2.34.1


