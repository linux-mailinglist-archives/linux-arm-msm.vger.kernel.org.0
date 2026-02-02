Return-Path: <linux-arm-msm+bounces-91557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IrhBO//gGk6DgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 20:50:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3840BD0BDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 20:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53E4E3059F35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 19:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432F93093B2;
	Mon,  2 Feb 2026 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eV7wwQvR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aY09TO2u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A308A3093C8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 19:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061367; cv=none; b=QgX579LdiJQJm59P7iDA5jgYoTjLpNRts+T8LjwMl/DXds5+TnoUSMl738dRXxDYqY6ivpXLaTqmKUlKQWzywgIBgyJmmhQuhKk7sR1rngcIshQ41MqS8l/arhqsAVCJydf7r6LGhvEUN3r12MdW2n4yB37go6Cjwz/vmXllFfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061367; c=relaxed/simple;
	bh=Zc1c7YcAeK99qR2H/ZIKOHh3sV02HZtBiv21dL1IYPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gzXQAOSaQuWbhCP3FmvucGUBJhLObhBWOUEV6Bb6thqeWWifx8GVRx4I2KrCFqilyJH3zJAL5J+rDP1cq/Sf4e4fH6yJK7/i8G49krhieCVDvwd+QIGBSD2CnwnQge/r8Dz/o6szorO8WhxedR72RQjV8xDbvGrZxt4I6TOgowc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eV7wwQvR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aY09TO2u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVGtN255369
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 19:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YAoZj9oUvrZ
	Sg0fIDu0QckqPYZS8QPgQgQ6+/EP1Rtc=; b=eV7wwQvRXNvQWen67emjoLZVrbL
	ZU/Ya5nwIb7ZywTqgBJpIjP25wZk3ts6ENpBOBhep+Lbvvf9hRRScRDoBMLShSeH
	HR5WCu9iMa6jQzuIArN0nHqbKaAwvef1O01i8bbp//Uu+cgmrT6SPMH/Q6jD92gU
	V4hzi/zlSkS6y5gDRUG8SeQO01t6VHlAWqWil+nlmT+s9WF8B0KeisQ6qIQvyY5w
	qS1pzWHPD/mGB2X0UvksfSDC+NedvZ5wnPSuED5AOwr4egFQ1xA/iOpe0iyQFWcp
	tnbZIwxxOcgwbv4/XOLsffPyaUQyAEw1W6oSpuuuIR5bdCTvR2y0Vgzf+oA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0khccg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 19:42:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8231cf56435so743082b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 11:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770061364; x=1770666164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAoZj9oUvrZSg0fIDu0QckqPYZS8QPgQgQ6+/EP1Rtc=;
        b=aY09TO2uqIypzLNKHMz26pM+fI7Cc1oAyuBfxm5dPf8aNllJ9NC8iBtjjjEMXSx+OW
         opmdWCCEW7fRGHsZHwgW6BCImgNmcRnMqP0Q29UAOZ8HiQPYvRH7lAATKoJl6/E6N/vV
         oape0Rc8Wqe6qYWnliCErqu01R9DYh7oaccl/PItqyOb4zDhX3AeSjkTZO6Dy5RyJKHo
         eFdUqSVe3PWnoN2X94f9z6SdMxE54ph2Ay2gW1CYlV7DvXxtmuof04jaB/cM5/RQ60XV
         vxPiPDg6MpaiCSHJ/+6gL9Uq7hGtamhK8GMVT1Dgs2DYcgHi1Lo9ySopOaJLt0MxO6AK
         uvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061364; x=1770666164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YAoZj9oUvrZSg0fIDu0QckqPYZS8QPgQgQ6+/EP1Rtc=;
        b=iv9JfrD8y10XbWGZ/mOOc8+Xgg6k2Hje2AAs4HuBPXbUtyYPbuGg4rDILsGzBIG5Ps
         8eDzVLH3sA16p0NycSHk3lKYHUu8x8sF+mQxIS+FluGdk8C+KPRLsOgLGf7aQvAzKJZJ
         AUyf3rrG/prXlrwY9pS0SoaklPB/ut9EC8DKGvbJJP36whlZdQrtTgYQx+0gUPLnJdhk
         ndx4vCINz3CQgDJDV0Qqg/lAMX9DlDMnwh/CD8y1hiLwTAnMol2PNcy81mvhndTOO2iJ
         jiAtDMOgXMTr0+GmKmvEWto0lsr6mUSlaHP7iKwsAWTkocM/l24/T/j3OYi5TCzyWDBO
         iaBw==
X-Gm-Message-State: AOJu0Yxk4CK8fsxHfIfvWBFCfZ0loKgNH6byuPRT5J7zJ257o3MavQXu
	pYWDHtudmt8b252UmYQDl25FsIx1U4t6O607W7Q9MBnVucqbEEq7o7o9vmuIjhI/HzI9t65Dw8Z
	iCN9Suqfl5HOyn35w/Cyt+I/jpWxgCrNOmQI8OcjntBS7QT13r9F0NuMZwbcyq8fV6B2S
X-Gm-Gg: AZuq6aL/TpNosLF0RbpjPQuNEoo3WZSbrng7UulWVeDJ++ZfObod+7Z4IhiKVnDHtve
	HVtL+M+GBhKbPGmoQXYvJbguY1EbsUJW/B1qU+TroTZICT5sdTmkEtNpQq0agg8Mc06oWetZJ7N
	mKqcDxJrnC+6FcXQT/7uj3Y8kyZZ4NE/uNnA0yMChXNJK0p3uiVzQu+1pzajIOZTRjUEv8tYFNn
	+XwxZ2fgl75TGBW8bs2fyyvkW5HYD8jcvf/y2Me9D0gdgdaPnNJrhNC2x5MgJv28tBFE7YM/gca
	nLbwmzGrLpcYT1MW0bP0anbh+7HM8+LbYCuOsfNm7m/LvZBh9jEkX+hr3GWFOW8AlVXsmBERcVg
	z3esVzERPYtHBzXS4CwDe8qNaI9paZWh8Nc1QyF7a
X-Received: by 2002:a05:6a00:2343:b0:81e:fc7c:6a5c with SMTP id d2e1a72fcca58-823ab317f94mr9126328b3a.0.1770061364113;
        Mon, 02 Feb 2026 11:42:44 -0800 (PST)
X-Received: by 2002:a05:6a00:2343:b0:81e:fc7c:6a5c with SMTP id d2e1a72fcca58-823ab317f94mr9126305b3a.0.1770061363631;
        Mon, 02 Feb 2026 11:42:43 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfcacesm17401779b3a.32.2026.02.02.11.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:42:43 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH v2 1/1] arm64: dts: qcom: lemans-evk: Add Mezzanine
Date: Tue,  3 Feb 2026 01:12:34 +0530
Message-Id: <20260202194234.3701434-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202194234.3701434-1-umang.chheda@oss.qualcomm.com>
References: <20260202194234.3701434-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6980fe34 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jnsgzKaiXtoIhPlfe4IA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1NCBTYWx0ZWRfX1jf2R12ukis/
 YLbJXo00fvKAWPJeEFTupVsfKm1RxVmMis9+2whtrAoGOH6hM65DNz90sG/nR7XXYfChI7fwqXI
 9RuzdhCPGYAU9mDSN8CAgZSo/jbS8DeJJZa1nxGsIxD/2dT/I99Gpo5oSCBvzVNC+itUqSIUbJ1
 KPR2k2Q69fBvChGEChYCAheAhwlFZ85pJVpZZ2/GgmrB/spptpYORtoFsqxhJ4bckeDBUBhxMRJ
 mIUMhOacLWNpptlBLvQUZFFpXlKbkos5py8U4adGwGHLl2fPIR7TXjE1frXwOhAN1+vq5kvX6WH
 aeLYcvgg1oeGwIcggwAiNVgVhbbpDW42TC3m7eBFQsVfxu1+05kwDJVf7p5qao3BhakC/40JvdB
 Iw9VaY+fg8lMVo5Icx/VyjQCYyE5c8BbqBkrqfk1sT7Gt+Sr5fS0BQyQ6b0yrxD9DNlKIDe53et
 Fth7/eWqpm8iPt+hEFg==
X-Proofpoint-GUID: pQExV0vot_Pwdm5AcJtTTB65jSJTMkv8
X-Proofpoint-ORIG-GUID: pQExV0vot_Pwdm5AcJtTTB65jSJTMkv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020154
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91557-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,0.0.0.52:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.3:email,0.0.0.0:email,0.0.0.1:email,0.0.0.18:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3840BD0BDE
X-Rspamd-Action: no action

The Mezzanine is an hardware expansion add-on board designed
to be stacked on top of Lemans EVK.

It has following peripherals :

- 4x Type A USB ports in host mode.
- TC9563 PCIe switch, which has following three downstream ports (DSP) :
   - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
   - 2nd DSP connects M.2 B-key connector for connecting cellular modems.
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

Written with inputs from :
    Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> - Ethernet.
    Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
    Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../boot/dts/qcom/lemans-evk-mezzanine.dtso   | 301 ++++++++++++++++++
 2 files changed, 305 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..79449004adfd 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -43,6 +43,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
 lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo

 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
+
+lemans-evk-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso
new file mode 100644
index 000000000000..674afe485a1b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso
@@ -0,0 +1,301 @@
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
+	model = "Qualcomm Technologies, Inc. Lemans-evk Mezzanine";
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
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+};
--
2.34.1


