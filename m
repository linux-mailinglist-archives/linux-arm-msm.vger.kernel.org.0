Return-Path: <linux-arm-msm+bounces-117617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9oHjJ7hATmrQJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:21:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9491E7263FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:21:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aZyyFRQn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kY01AsBA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117617-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117617-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29183302A665
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE8643DA33;
	Wed,  8 Jul 2026 12:18:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D592C43F4C8
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:18:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513093; cv=none; b=r2IiuGjhcGPmQCt9IwpzVJD4JP1hQPbsDUpajmLlp1tP/mZeAU6LbN1pkbggq6G5tBEbhcuVVCYwUxGinUdYBfZkaAoPkX0HIfUw+9qW+w3tZKSUJYWK9HwS3Cif4MvaUI7s90Z/ji0ajJ4oVHI7tIXI3X13Lv7y8ZKCX0zN3og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513093; c=relaxed/simple;
	bh=JKX5E70My+XVRb8vy3rdWNaWfMYpHPcqDmprlGqm6Uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bxwYiFLwPdumtAjUPUQH9gB6HCoEKhR1VWwAw93d/YTI5Qp4vuWFStNzAlAJ209e52v2ngBgF2daaBe6XrRsywvE/4n/ttbAoXVLfdT5St84BxHeXeydycZ/87tfDpwT+9tc9ah/cxsIHHqNDLIvg325u2ve3K93c0JNXG/ItNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZyyFRQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kY01AsBA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C39s42736111
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 12:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LtyVAmWN4f3TIqof37EPSTRIN6h1TXFrEzrycroYe/g=; b=aZyyFRQnAV2yNo6+
	YCqX2aMadCo3DykmCnaVYkCChqNK/etTIskBXrxz9wfOQv6eNKFhAQb7tkivKBbK
	cjVzd3z3IWbs2kdaDyjbLWW0RiMIDMIZ7/oGXqEP6DiAAx5H0cEwFvBQ9HmRxRIH
	5wgvmcAIc3dsR03S9pQ0ny6DvRbCjPXT6+GeVPxGDjapLmWeHt1Sl9Qw4HcuNxZx
	ys9kSlKzJdRuRf79xe0CmtxCooOVTh+mBZ0YnWJG8Zez8laA3a5Bbo5Vk/hWr/3e
	dFpe3knAlilEqzeiSf6NTlZnucWUZ66IU+bAYtliLzISJmF5m30kJpDPuY3Kjnd5
	sxN0Ow==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv17f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 12:18:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848415e9e8eso1064069b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513091; x=1784117891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtyVAmWN4f3TIqof37EPSTRIN6h1TXFrEzrycroYe/g=;
        b=kY01AsBAo/VNxw3WeWXSElGVyl7KJ4Jj/P6exVckg2Ue4I6KSy15Vx7npQ+IM91UAB
         6kOfYh8UsEpW/nr6VXFpjfRkroVwQW/C+WE86XcFMXcAmmJ92FDcmGr3BRIr29xkILVy
         aQ2Tojn9aRgjyvMHynq8LsF7ez1bUXfGI/Nj2e3v2xO85hJC3WY5DOehw2pDLAM5seHS
         m59SbF5DhfBuC2dF/hMggrTmqEO8L0a3o2LrR+9nZxnYgtMEo9qLAbfyR40eJJSwPr60
         UpPjWAviQI5zhpxiS06F+S/meQtqULfFyR+W5vlGN0M3erGEE3vZoT55mDBNrxH5T8kf
         AJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513091; x=1784117891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LtyVAmWN4f3TIqof37EPSTRIN6h1TXFrEzrycroYe/g=;
        b=ba2oaQ2AcK2OJ7DCTvSyteCKeEqOFWwcqHMcxdbBG0q0+U/AVi9zN0QGqWlqoUGjwA
         2WC0tjBgVoPgs+fjdBAfHjdo+j8KwdHbqYqPJ1QR4nSdWZD2FEXNTZT8UmHF/DNEOw4S
         VIpvlSkkRdvMZB5qMuJpqr8RLSflJhr+IM6mMV6BIaEa86Dq1Y4S9NoU7DoVN3lTYyuz
         RXUdPHKq+ZvunVqBNSUOrJIwcNB6MjlrctCLUAWSbGyz3uzIps7mMSMeBnWufwbB2/Ac
         5A7iekBg108G+P7WKsNFlPvAruT8ciXIrwSEZq4oQW0CmE7bVVY83PY8FF7KPYCg4D9V
         N8dw==
X-Gm-Message-State: AOJu0YyTaSiustqucCoty8+Ro/KYFWNFG5/vJRysol4UYGFj3Prl4kAZ
	2QZ57h6LvgX9lAw9QixrFLgGKbjO6wIDC6NsC8JtdFdV2gUpeHUwhTNZSCeed/6AyuxgM1i9ij6
	4ZsDe94v7UNm4pCAMeFTWxdAmdU5FgRVHxGJV/ZBhK6HcnfhzHaDp1QGscMV6QVb9MKm+
X-Gm-Gg: AfdE7clqtARZPs+8y8nnhJ/Zf0A8OeEk0dkvfa2TEVT6hpex73MUCqTvbfx2D5sQOxL
	ykavcm7cjIuP7p6t7z7uzeWbhUbdPJ1md019vAIg1bZzlm5x7G3B6Cuqm91iJUsu7LMGSKIIibF
	EBRHwCaRgeHzmVVulXwAHKiSldsjvc/JvXtm9IL+ZVgtc310qrwq6j4RrE9ERj+bwIl3adJQZQx
	G7bYN5PT84CIyPF+24Ycgi0CAYEfZdfoCN384h7DoafEn8sAftbDjIxcktp0AAdRuGZL1ugkAnx
	Z6LD0uiNXUndjDXpedXag0azPzPeWHn05isyBCShIBd5MVQJR/2JE6raZCxZBH/ICDOg1MzV66i
	u1Tcvt0qqjqoIMMuAWG13qToZKw==
X-Received: by 2002:a05:6a00:3a1a:b0:845:e41f:9696 with SMTP id d2e1a72fcca58-84842efc60amr2344162b3a.25.1783513090468;
        Wed, 08 Jul 2026 05:18:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a1a:b0:845:e41f:9696 with SMTP id d2e1a72fcca58-84842efc60amr2344124b3a.25.1783513089953;
        Wed, 08 Jul 2026 05:18:09 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848337d12ccsm2367474b3a.48.2026.07.08.05.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:18:09 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 17:47:33 +0530
Subject: [PATCH v7 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-dt-v7-4-977b65a300c1@oss.qualcomm.com>
References: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783513058; l=4667;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=JKX5E70My+XVRb8vy3rdWNaWfMYpHPcqDmprlGqm6Uc=;
 b=RU3wvT0LYgQ5pv/gjeo2egvywfcFhq1D5piWQdQc5qMXUgwSwcp6KTHL1k5iTElQDvkIeVBri
 FQ0UX24I72ICfEZS/Uq9fiUMGBp8Gfjgg5bwpdemUYOkx/VMpB+qrRo
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e4003 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IZjsGcCFCfEoDLf82CEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX/CtBeXfj9sZ/
 VkF/SzMOANKaEkW3hp/FQg1658BM+E4W6emWiFjTAfgCkgybSRUuKaT+mChsQtmlTU9hH2zcVFa
 Fq8dWWC2zwvR1ZtHcUaaxciLLyg0UDA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfXxlsGkJIJ4Eio
 b1G9uNQcsQlQH5zuflukIMc+TMovgPSDfGHHfyVc+0F43gCP70Z7CapS3tnmB4On/QPFb5zBKgG
 a478cUY4WoyqP+GxKiVL3CkXq8B8iaM6urMmc5GRoQrZjX16GHDk1MZnL9RxVk0NTJj1e7LjCWx
 gfVwrmWe+X1SkFN4LoUK1Mx9kh33vSeisGW5E/rQNFgAtIWV8hv2eLJn3nYY88oiJRALWQAiRfT
 NyE8BE2vgHpt92/i9vv69Cn04libpSIVOFVpP7h4b+7vUQnC9pzhZkQPz0aEYPNiUN22z6RerZP
 ZtnjtXuIV646nPPw3yb/G+Jc48yXUk7GMtNMQyYo3LdtFK9i3Pf+i7LJwr6h7dgY0a9x67+/TUK
 8qt4EGP/TUPXoPzNM68IJHmWxscneh4/pqEFgsgzRMmEupsl6NX67d1GPswbI3iCyMN3+T+AO4b
 6pWqo2MNIx95FtCmsFQ==
X-Proofpoint-ORIG-GUID: SxRuxzmJhD4aHHH4wXCpl29hdrDsMWiN
X-Proofpoint-GUID: SxRuxzmJhD4aHHH4wXCpl29hdrDsMWiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117617-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9491E7263FD

Add device tree include for the IQ2390S variant of the Shikra
System-on-Module, an industrial compute module integrating the Shikra
SoC and PMIC for industrial IoT applications, designed to mount on
carrier boards.

  - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)

The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
definitions specific to this variant.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


