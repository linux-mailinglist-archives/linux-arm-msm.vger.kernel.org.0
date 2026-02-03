Return-Path: <linux-arm-msm+bounces-91722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGp4FfZOgmmBSAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 20:39:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79BDE2FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 20:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B7A830C1446
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 19:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303673644CF;
	Tue,  3 Feb 2026 19:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQ4bvaA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjCinhdM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C25F3624BC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 19:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147543; cv=none; b=G3AKSAat3C1xxx4ze2o+qnq8hoiBs18F/1q7Duqa6Z8+CsH8o1iD/JBcYTl1J1wHV3Q6X8lSreeEaiddKHrUUPF31HK/noE9yaZ4hlKCtGbY6qrxbpzCTQ1kQV8Fi0UbEVBlC6hau9Z8dVzbYiM8T2Doo3jhHSog9DVRsEFVaw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147543; c=relaxed/simple;
	bh=luDuy1KvYoUdQOys48ufTnz9vzt2mw/XCLMyEAMu7dM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j+ToJtBPKgjECzfGJywew39qrKVRBTef1bM8Pzdxp9wLgcfX+ikyNBd0wIh68kMRidZLcekbf9bjDG05F0da8VWxTl/eFqX/WSTsRSdKh+HZ7ZQghdOVvI+EI/PCIPtwSdosIAhb1qMYdteIWctqlJuzJFfp6O92oP3R6KnhzBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQ4bvaA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjCinhdM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ImRlx3824402
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 19:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j0KM72+jRw0
	fxpHCEdkc2LXgF+igTMtvNypI68Htrts=; b=QQ4bvaA/58LpiohxrpIXAqCqAkl
	j41Eucskt7JUu6Ov2PV5ov26ScCvZc1AHQdBoUj8klMcdC65QCfKr/rdPiDt1aI9
	iaGO6zchHZTHg90hkbdhSeRqfFTzU1MIqS1Xce28M42U/lSG+5n+YMqTSIJNVqf1
	K0iHXxypDn8sCjh2qo9y9POzDASXS7Y1mEx9psAbOLZzm163ZBOc4VTcQ2x3bHd8
	TQTStMAMt/5iVOFGUjk2QPqO5WUp98DUesdVQmSetndAzcoXCmv0ytlm6bSFfmQB
	ZWqJ1TkHaIbp8sJr1dUtm95BmHhqINN76g4rqQy3gsLr2z6BT5Z8S5QL1vQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33hmvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 19:39:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7caf012c0so11028465ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 11:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770147539; x=1770752339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0KM72+jRw0fxpHCEdkc2LXgF+igTMtvNypI68Htrts=;
        b=OjCinhdMFoY1aepsx8jGesI5JKQSrlWsBFhbGUc7tuvmcrmsQIe99bSVKZNtLKhy7Y
         XzQOGb2GHo4KZK9iXsxBSBRGQIda6+BcgjFbgizp6bxgUKTr9LV5ulJ/0IFwtb0w2sIm
         sSJ+j2Jivh4AcGS2vSX9AJASxrBnet85V6sBh3wIV7GfN3F0uk40gfWxe9IQUK7rxIF1
         jtVRAQmpPYgakYBBs6+9maapqIsvZ6pCuT8sstMb22Kd+8iOy61w1XMqevEUNEtgtJjG
         FXOy/fsQka39uw6oUHdwTYIwIxi9gZXx+XpAoOgywJlFZNL1bna6fspg6L2HKOPxWrCg
         dKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770147539; x=1770752339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0KM72+jRw0fxpHCEdkc2LXgF+igTMtvNypI68Htrts=;
        b=hxYZccjyHNqTYna24z3mNf1gB2PTcY5byxzgJJP51HGpFMZAprTEZ3LwecMQXaGgfh
         4JWTnaxCwDBMgQVlwp/OhaQXc2A3vZAWgkrmcJSBsk/CY3XB6DKiSzCMuspLGKd6ates
         ZfZNBZCWT3x3hp6uzFETXSnDqz98SYNo0FbgbLw0sr1Y7Qnjbtx6eXzxUspX7Fgg6bGd
         GWuNQUIzz862k3yFnjRUqiivdEEi/S8OMKpeZEK4jPHb255vSafH4499238DkQkl8a0D
         09s5VRhDWphtzHRrXe+hL9VCZ+61A9zqRWcA7Y6aGAf7/ADYGaEmlAroy04JfHL1qIBv
         5Lig==
X-Gm-Message-State: AOJu0YzdL/ZJU2pRHoWahkIOd4TMF6QelzWbTpgE/TPeybZEislWDJCB
	RIxsI9aKBkbwWry62yMJnKJCI4GvXPigg7UkkBXzG88SZCrkdmyc5eHTHOW1xIjasHGb81P2zKe
	IQrdc8sA19FZWLLQT04c0/M6PPhe8uMvNZHc1stwkrUJLY/NrlZcjiFdYy/1LvKrelAfS1Yv652
	kO
X-Gm-Gg: AZuq6aIoX4pNI5MBSb3B6/jfk1zAKPXXnbkX/pEI+e+Zgk3Jiyno9cAh8HPsq6gzjZ/
	NPlKOZmbvXNPqRyM4FLkbsWVimMxiv/TldTgVBi0nijWapl7jyYiyETR5jA5Li+LDlLMzIG6/0H
	td4rWUMLxJtkblmYZXFmuilnlQZo98eNw4PdBDgTcEo96FsadkIF6dP/AwDZjQL6i9pDA7CxNUt
	Uwhq1yQ47qQ4mI8jJjzlJF8YbEkUgEY3Q5PSbyEbPaZ484wbm+PmWf78Ca2KlRqKV9pbnaCBABp
	GsyXPI3cxPElZ0mCRceomOHMqhvLpoQ9nnaGBEkzrhTqRNlyTk6TaFoKcL8gu7Ms3rhLvrwAQIk
	A3Eg+ijLRjYXSqtGXxnxek87tU5Q4RQd5S3h2e4II
X-Received: by 2002:a17:903:18d:b0:29f:2df2:cf49 with SMTP id d9443c01a7336-2a933e603c5mr2817765ad.5.1770147539113;
        Tue, 03 Feb 2026 11:38:59 -0800 (PST)
X-Received: by 2002:a17:903:18d:b0:29f:2df2:cf49 with SMTP id d9443c01a7336-2a933e603c5mr2817525ad.5.1770147538592;
        Tue, 03 Feb 2026 11:38:58 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9338a11f1sm3368055ad.38.2026.02.03.11.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:38:58 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH v3 1/1] arm64: dts: qcom: lemans-evk: Add Mezzanine
Date: Wed,  4 Feb 2026 01:08:48 +0530
Message-Id: <20260203193848.123307-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260203193848.123307-1-umang.chheda@oss.qualcomm.com>
References: <20260203193848.123307-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=69824ed4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jnsgzKaiXtoIhPlfe4IA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: o3K9Q2QySxt9q09arpMUAkJhHv05c4Py
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE1NiBTYWx0ZWRfX7sQq3Gfz1i7g
 gf6Hdu764g6fh10gCD3ilzpigCRHr2lMapt9k+FK1m3XKGxS/ED/lKvBbN/qwPh9zXhw9YWD9ul
 nUVvqMVS9nDSvbg1tfNrtVPDAUTzAP5qBlkOvAEJ3YRpgfcRaKfJaKu6oSj5+1hZXvh/6bfzwz4
 z66haboFCKNkv6gi3DuUlzhmAcm434+ud8SbNlmPOL96UszUDgN+5QcGs/VRqLbL5jShYCE31u7
 WaSOaSCKxc/HBg+1Vbd3x/0UUIHZRcuFYr/I5LGJVkjlqU0TXV0+hslYGwGe9O0SOfjhTnEBYgd
 dA3AVHfeuXFhXFAVG3IFnv2igRzLPpI3xk6f79PmI7iLXRAYnOkp46mvFsa/9tPMm82Mkt3UksS
 ujqKy91Rb7DS3u3uAC55oV0/jBlqUiMQwqXyQbj70I+P8dk9q/gwxDHEgzGlMhYu1k/6Ujhg5dO
 hVYCwXOnZZ7SPKf4P7A==
X-Proofpoint-GUID: o3K9Q2QySxt9q09arpMUAkJhHv05c4Py
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91722-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.3:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email];
	DBL_PROHIBIT(0.00)[0.0.0.18:email,0.0.0.52:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B79BDE2FE
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
index 000000000000..4fab96ba873c
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


