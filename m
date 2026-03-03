Return-Path: <linux-arm-msm+bounces-95178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHHjOccPp2k0cwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 17:43:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF5A1F4022
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 17:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3044A3022C2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 16:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB51370D7C;
	Tue,  3 Mar 2026 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNEsRlGD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AB2V1/6A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E596F3264DE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772556209; cv=none; b=EbJMRdBC5pG3U/G1ydANXWqaoz/eUfwCtLptxyqNciPeBkK91rffpGEiIIFmmfv0QYJXqgdwxwo+37ny4GaDqfW0uSI3edv5Pfnvi1iwndJNWXMNI+hhU4FvDByRXB2JexIBleYESPwZwSTfTQBeW0/BqlrFiwhlIm+XGeTsbNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772556209; c=relaxed/simple;
	bh=/Y9yvbIVflTZGoxak/t0m6bjgdhG8e/xJZCPaqb1qSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YOjjXsY64k9BD8eoePhIgdMkrMFhJWUavUqi25f/eaZTCSrDcVbZcDB0XNuJrsPIERpWdDIqB0hH0yyyhmksiaX5HCqG+idGjs14u/CN2gDIV3gQw5oYU/liT/T1I99zVub45Z0JJc+zhDn3nDXu5l+tuC7Xx5651w9/A4+ps7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNEsRlGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AB2V1/6A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mhoD3951779
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 16:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QO1j4VMiZdP
	cMlS2TtY7aC9MsTd8SUCYpTe3L54onAI=; b=pNEsRlGDac1kFAneh+tqt514/BI
	XnUZGSBZhI98UWotHdMylkeADRkZR9ZEZ1vdiNlo41pnXAP7iyaakkaLa/DwEsUn
	zghz8x8SMR8RctIJ+LLhIdTWqKCH8jxVvdPMNNkvhPyOhStN30Zdl0hw9TrjR0cg
	RjsgYKs41oBo9odghwl7HG4HtimNqDR4k0b0rHCaI2GsnjZGynXmxdpPOM6pUNeV
	d8TX5RNoIeT/2euZbh+iDmOCoLypiRu8IaQpaCwtohHXzsZEns5SPXNfZ8Zpr05b
	00YquTSIHl6/7zEfPrKMlUZMUpEurHfA1DrP/PavQtl1b/6FYlR4o+WC8qw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnu3n9s3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 16:43:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-827401220cfso2574013b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772556206; x=1773161006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QO1j4VMiZdPcMlS2TtY7aC9MsTd8SUCYpTe3L54onAI=;
        b=AB2V1/6A2bKQqm7+HldYxRFq4gGTlOuJpPzoivBHgSyIWLYk0H18PujNrzvozCMlVS
         NWcZraYfmiQ7XfWsh9LR2wbUDl3nB8dLMIcPRFEj4K39YbnGcB87uIhd+f2IBU0HqUu3
         zDnqRSlcIJb2GBhmlaPffslVlrLae7KSdH2AtF8Xh771RmGvVOrMO8qJcI+3lblPvdl+
         KCiGXQXj9Qe/rv4bS3XSZ5FquuNBL/h1k9dIvaRf3BDTYmD+Wag+4vKc3Qgvs4HQxx/f
         8MJwG0RkNZTu6gxulRQ0vx/eLzBcoVjjkvzi6r/Hj8uVthu9NxwWe7yiVwD/RxB4XbBc
         X/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772556206; x=1773161006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QO1j4VMiZdPcMlS2TtY7aC9MsTd8SUCYpTe3L54onAI=;
        b=E/2WBN6gql49Pttl6LATHEG6TLmF9xZcnXqvbGUYy3kPJPPNl3PWCUSEWQzWHnDXma
         SL0Y+ohQADtSA5EAddrfWYW8z1qdATVNGQgRNKvO4QdFo283SuKxGM9bq2rOIDN1md5L
         G5xWd1oYhMYB3eUlKb6w13weOFnJsefxlxf9ZvhQVE3XR22AbxVxKw20bOGzMAZJ8NgD
         vQt1zSkpeiymeKSTtDjOxrHAKSIVp17LHNzzz+QY3d9jYqvY+8LgGk8XP8ANBOVQF2JX
         Q7gwjgm2+p/iNBZeeF9cGPqEdbvp9Q7Hcu0kvibq3npYuSM0JjV2+5nGVDoSt++YDt6H
         uf8w==
X-Gm-Message-State: AOJu0YwEC3wOcGVnJwsOmsMBBs7aYTaMrwtEpNybvjARjz4QZdKvpoQ7
	R3waC7OnajlzDHDpYtOSyRVOoQ+hcdO+4nvvooLz/qh3dur7F8eJsAcmJ3bH5/bhETo79Sf4Syl
	+aX42L2bfu+yo1tI4umjvkG4u2KnLguPQnUYnpUEPRVbUDEy2n0CZhtqqzc/9g+Zo1P6s
X-Gm-Gg: ATEYQzybClKEhgW37DUFlG0wvkmY3N+3TK7lQLQQ/mfij+w8dtlV/iE7wsZHA3amRZg
	pLVONToEP/K8Hip2YR5xVsXGIR0+ysUNeMdohhrs15zdYXOQD+bH6FJxyTedY8JcrqOTNVkYGE5
	UaaYuPIQ2Zz0iNG2RyPhmLkjcmItjjvmGjcQ2r71v9BDtiPn0Dipj720FLLPXgZzCSBgT0koR9I
	v7VvWXUBt3k+3F09U89fKTgFGGn04+If9v384yqHPZ95F8bfVD5l4yqNuQARqcFdzwuTVbU6RVM
	OT8ITQvFtyIeyWn1UgkUScp1UzMFBVJNJT958WTZs4Y55s+h9fHA3F77wrz+4p0/c7qky7cOLsV
	FoD4BSDe1QMg0j9pAS+UHkLiRLphajxB2+OXIukwF8+HPxn28M2DA
X-Received: by 2002:a05:6a00:390e:b0:824:9f50:83c7 with SMTP id d2e1a72fcca58-8274d7d4efbmr11136082b3a.0.1772556205630;
        Tue, 03 Mar 2026 08:43:25 -0800 (PST)
X-Received: by 2002:a05:6a00:390e:b0:824:9f50:83c7 with SMTP id d2e1a72fcca58-8274d7d4efbmr11136066b3a.0.1772556205055;
        Tue, 03 Mar 2026 08:43:25 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a048615sm16153508b3a.52.2026.03.03.08.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 08:43:24 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 1/1] arm64: dts: qcom: monaco-evk: Add IFP Mezzanine
Date: Tue,  3 Mar 2026 22:13:14 +0530
Message-Id: <20260303164314.886733-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260303164314.886733-1-umang.chheda@oss.qualcomm.com>
References: <20260303164314.886733-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JaexbEKV c=1 sm=1 tr=0 ts=69a70fae cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7WwWSvKBDqV37eUiOWMA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Yk-6XgSb1gLeNAtj3-Wf3pgnTIu6JJFm
X-Proofpoint-GUID: Yk-6XgSb1gLeNAtj3-Wf3pgnTIu6JJFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEzMyBTYWx0ZWRfXwHXdMa+cAc6Q
 47nwcW2m9ylGq6rWTR54sCeRUJJApi0cH8r+uFGtVfmD1PMzjBDrAhiIb54oFCvpHLNELDOwR6k
 zKocA9/fWKezu2J+QjPNmVvcezt4iv5/w1UC0w/khBWKCX/7PDNdLPa+FpUMFwMLxaA0F18NVhe
 Go2jbtbNMmVqcTDuAfKtpxL9M8qg/R9QXXWEoIkWrqcovFI5s8AtIEIANLfPoIK8BigUhUiK4q0
 I0M+v/ChkD/RngfXwh170llLICpPeMEtWq0ms6l5hcFlO3sHS/F6vkSLptH9fl7yFifnt1IPs5J
 XYZe2qPruCx7kEAA8Ve+wCniXbEirDbDwKIHobdLVhTFhXSy5+uEZRi/uDpRr/6Kil+FVpcmPkI
 yI4F6V9ZUdUqpBLq9deVCsUVgNGIKboDqkyDT0oKvGSpWMQvyRdtSeEfN+btHV393OSmvNWXomO
 GgGqG9HEzfWqunfYr6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030133
X-Rspamd-Queue-Id: DEF5A1F4022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.0.0.1:email,qualcomm.com:dkim,qualcomm.com:email,0.0.0.52:email,0.0.0.3:email];
	TAGGED_FROM(0.00)[bounces-95178-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.2:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The IFP Mezzanine is an hardware expansion add-on board designed
to be stacked on top of Monaco EVK.

It has following peripherals :
- 4x Type A USB ports in host mode.
- TC9563 PCIe switch, which has following three downstream ports (DSP) :
   - 1st DSP is routed to an M.2 E-Key connector, intended for
     WLAN modules.
   - 2nd DSP is routed to an M.2 B-key connector, intended for
     cellular modems.
   - 3rd DSP with support for Dual Ethernet ports.
- EEPROM.
- LVDS Display.
- 2*mini DP.

Add support for following peripherals :
- TC9563 PCIe Switch.
- EEPROM.

Enable support for USB hub, LVDS display and mini-DP later once dependent
changes are available in monaco-evk core-kit.

Written with inputs from :
    Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
    Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/monaco-evk-ifp-mezzanine.dtso    | 149 ++++++++++++++++++
 2 files changed, 153 insertions(+)
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
index 000000000000..e6beb4393430
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
@@ -0,0 +1,149 @@
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
+		/* Reset pin of tc9563 is active low hence set default
+		 * state of this pin to output-high.
+		 */
+		output-high;
+	};
+};
--
2.34.1


