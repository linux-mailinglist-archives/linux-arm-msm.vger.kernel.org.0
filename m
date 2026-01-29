Return-Path: <linux-arm-msm+bounces-91203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIBVNuSYe2nOGAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 18:29:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED9B2E62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 18:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99EC7300615A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 17:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C828D34D4CB;
	Thu, 29 Jan 2026 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcqKi/1j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCQUn7NK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E0934C9AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 17:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707744; cv=none; b=LttKhLj3cOxoKoa5BDLmeSVpkdHHlkIXuLwk55yNP4H0Zj0Ns42tj8hK8/0ChDmipfFAghdwKdxk0bnn2+XDlwFqLyiVbh9qtJW3zw2MeIcPVa1Z6hEdZQ2RH56idzO+m8BA7NBFPhGRDGf3Jjs/X04nVMbhy9cTCjZ9MgZ7iGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707744; c=relaxed/simple;
	bh=tOpoouS1GOqm5S0gPdiCvx8Lntq3+wpPhlq3nUIVtAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MX1F5q47NMK/AsKsC6ilM7Q54tH8A00uVdh4xPIuWi04wn8qVrG3/yC60yxDEyOA+Z0SI2ogErY0RVZYwVVTdbzv6G9ctDVvor4i5Z0Y0EXSFBfSGtUSDcglH1j7L6VgOc9JhPw07ZEi0lgFpJXj7BgdO0Mltiup7Kb6nHKrMJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcqKi/1j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCQUn7NK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAP6bk3901035
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 17:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cUGR0nDDhb8
	mtzKVP0sRXejh74CUiunJ2IIIvN6IccY=; b=dcqKi/1jve8Cr4w0hsFBGuGbwxr
	w/JWWqgS1GmLYWT+SLQjBnoMQoR2zNl+L6AOj4ORf9kpQ5DBDi8mlMMxK4S8O16W
	rar/JNhgywIX7cive21TFXF80cmFPvVKeOOyyr2sQUt07IEw/oyL5HlD8mWFVX96
	Hd9Z8fdl7rcWJfwE/cmu+DdssPZ+R/PHB5myAbuAV5imf5F9+xPKnzIBU6RUMgW6
	s49lk+oIuIq2YmKpCBo/FBpqaFkFQcAd3ptDcSKxMeFg5E2lv3WNw/fJmQ3sF+p8
	Ngw6EnWsTZ/4WRe1wnzyiTRIGUdcGjav+9m7UyCokIdX5f0yjGoEBwx26Qg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05se9dkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 17:29:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d0ae4b1aso3578235ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 09:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769707741; x=1770312541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUGR0nDDhb8mtzKVP0sRXejh74CUiunJ2IIIvN6IccY=;
        b=TCQUn7NK80zoK7Pk0i/ojwG7bvXe4GpJaxkNJi5V0l7tfGTDPMfMBe9KhTSBGX9yFv
         gsg4im/8OQkCz0L607KctH2rqGi+i9BDVBqzp7GtwI9VWZBq8HIb5a6YPg5FQowEl88Z
         2t0rt/Ou+yR2SJH1iAypwurPHrAx84Z7x9Jxw43gqC2eOlJC5QNaG8Y7aWeTWBhA8kGs
         LFoOLWB3sk22LIopyIiUAmUlGqDFmbNTmoQhnIVA14Rry4ZFY7HVUZiMNeekJBHrTg4U
         IOifbJy5oPHQR+78iAW+zRrFVDBrtJf2KJczuZRyDoRe9ZwhyR7QLtSQ/QbDXckiPddv
         PV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769707741; x=1770312541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cUGR0nDDhb8mtzKVP0sRXejh74CUiunJ2IIIvN6IccY=;
        b=R0O4nZ2J2qqBl2dASHveazDg3KRxvWNdaR8MwKvMurZuEbA50bonbMaCVFFbwt64QK
         qQkG8PEUVfxNs2QufZbtQuWGlk0OKryCqgm0cbkv4GwIw8ZMPReDnJ2//XRQfM3oHaC1
         sHd0kcMkajiE9gCSC8CBPBA0jkDDBt168n2Wnc1johBUxous4PABIv7NJnMcjS+ACRIg
         YIGbVZVNKvCxvGkr7B2vf6es7NeWaFqgVL5Qh6fatMQWEQc/mjzuDAOQUwFBWnU63YXu
         Nsn8FyNlHdeviP2BQ3N4tKmyrBuHK/rCLAopeltmXsngzYlhx+ZQVqSqVcUNDYm4QcEX
         sj5w==
X-Gm-Message-State: AOJu0YybWOiwTAYXf2Tw4ZwiOovdybzq2d+kKwurYc2LGtmJKtl8+kNt
	gUzQPjVgqT2XiyD5tBxE1O8wnwBq6ie8B5KA6rCR8VLBMJHBqXTnyM0prCI4mbMY+98lLyQ5cmq
	EY/8M+imEE7PHr+eMY/CUtKjHTwT4Q5wljtxn4AXigi74tq7q8SSuIzNvpLntajWprhnT
X-Gm-Gg: AZuq6aL1QqjhzkIsQm9Lc/caC7MHjcfxinjBal3jtsrsv70sGfIZMPtXTXZa61TwfUG
	/QjKJja1d6FlG00WPbblPl+ZPdSVCBl4Mkif/O45qycs2xREY6o6jx9AdoLmU3eS1/KyylNbJcM
	pSsqW6FQE1YVdfSD+b778e6ubJ0hNVuf9IXii9xoTpjmMG1d11w24XhmfYaxsauDJ8GEjuOIl9j
	E7mbS5n0gUz9BcybrR5gW3yBA1DbjES6ZjGaOkzVZeffWYy5d0dHqYyeYQ2pXJCCdtVDec11RXw
	IF8xGTHxNhde4H7Sqmhx6XcyAqYLb/RWkYzwtUM01trqUXv6i4y56jJhOPbGBF39V0lahlIwCTL
	0798Dt9pjCZQJuZngHrayvijSoTh3fwedodzWyZQN
X-Received: by 2002:a17:902:e80b:b0:2a0:f0c7:9998 with SMTP id d9443c01a7336-2a8b2094c08mr30793865ad.6.1769707741374;
        Thu, 29 Jan 2026 09:29:01 -0800 (PST)
X-Received: by 2002:a17:902:e80b:b0:2a0:f0c7:9998 with SMTP id d9443c01a7336-2a8b2094c08mr30793635ad.6.1769707740873;
        Thu, 29 Jan 2026 09:29:00 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8b47f4717sm37384105ad.18.2026.01.29.09.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:29:00 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH 1/1] arm64: dts: qcom: lemans-evk: Add Mezzanine
Date: Thu, 29 Jan 2026 22:58:50 +0530
Message-Id: <20260129172850.1175728-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260129172850.1175728-1-umang.chheda@oss.qualcomm.com>
References: <20260129172850.1175728-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6dtF4uVxX5wJs2F7hVrCyzb_NhCs9UtH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEyMyBTYWx0ZWRfX6sGd7Yrkl/5A
 I/o5y791WM+G9dgQBhjsuvS0Kg0QxyeL9ZjK4OmlzOWW9PaCzBtxAUBB8dDNL7+ZyQo7c4szMLv
 mbF0BGwMeow55S+2C3wHIHIXXQPzaDP5LgVg52P8UwZT/39Etnx3kej5/v1fg4o8S8KHOMDJYZA
 vtMgfjUYlcAPsQAxqwNSRUsh5Y/2k0xxHzbsSh4b6bHmuQhXvHtTkpkzq9pmLSfcluwdfN6ubRd
 JlI/Yhbhi44EIdEtTqjJPxzw7stg47g9nKt3p7HgjmovWcCiwrMya5jC1UUzmtWaCwiuSsH27Tr
 k5T16cfta7QonezPNOqZ8gJznA1EHgYeeFB+kTH7pw8mfu+8cYGouX7S2j1uw0IRkpVHrMHk+BJ
 mh/NyuuTgwgNDBJYdCm949zsyflZiEjYCoqWXZS4LkUl57XnMNjmri2I89lqiZOoQybYopI5Gds
 vOVILAizR3ym1g91yjg==
X-Authority-Analysis: v=2.4 cv=RIu+3oi+ c=1 sm=1 tr=0 ts=697b98de cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jnsgzKaiXtoIhPlfe4IA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 6dtF4uVxX5wJs2F7hVrCyzb_NhCs9UtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91203-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,0.0.0.2:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.3:email,0.0.0.52:email];
	DBL_PROHIBIT(0.00)[0.0.0.18:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83ED9B2E62
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
index 000000000000..a0dc6daec754
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
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <24000000>;
+		regulator-max-microvolt = <24000000>;
+	};
+
+	vreg_4p2: regulator-vreg-4p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_4P2";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+
+		vin-supply = <&vreg_sys_pwr>;
+	};
+
+	vreg_1p8: regulator-vreg-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		vin-supply = <&vreg_4p2>;
+	};
+
+	vreg_3p3: regulator-vreg-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P3";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vreg_4p2>;
+	};
+
+	vreg_0p9: regulator-vreg-0p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
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
+		ethernet1_mdc: ethernet1-mdc-pins {
+			pins = "gpio20";
+			function = "emac1_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet1_mdio: ethernet1-mdio-pins {
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


