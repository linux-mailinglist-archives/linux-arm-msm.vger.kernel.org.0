Return-Path: <linux-arm-msm+bounces-112699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4R1wKUSKKmoqsAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:13:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E72C6670C0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:13:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b9DAsjty;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C4kW0Yrx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112699-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112699-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C175A3363B05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B603CAA57;
	Thu, 11 Jun 2026 10:10:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A253C988D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172643; cv=none; b=XZjfpdGWA7EBCSpI1tHaekIHWhUO38tuUUMfc30TN41HNGZ/JO+FJtpXluZN+Ys3b7g9FYSBKaGa6EwCMFneIWwRo/Gw3qks2s8py86IIjD1myk+TzBTfMOWYJsuOstLACO/oG2PMC7YOMkuEaIiVAmfn2gJXVZMw4HmpyumSGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172643; c=relaxed/simple;
	bh=w1EEpnLR6xXq+MivEnb+PLIzt6dGl5j6KmvIWASlAcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkuEmSeAXocBKco8mm9cVSCErkF0LCVtD36/VqzbgGrKKm5j2Nkpj/2b4bmeBW5t2agk+YzbUAyVaKmu/k0pirIYghXboW6v9Jdh6V6svifiZYUBsYer1cOiSe7cDg9E7qszKt6cRNIJ1F/X+s1BlLHFJ1mXgEYSRsnAG/T+TBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9DAsjty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4kW0Yrx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xpMN214478
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=; b=b9DAsjtyF6XGUzuh
	7e/d+VvDRiKucG7gUFlZiJk+SNnSc75Y0a2QHcjklMrG62b6qUqqJjxaNABLt2PC
	eVM3tY1Hcordj6fmHzqA5JbH2rRDZlU5pODHDB9J9bnHzyIbAAYiMnsvCC6deVqB
	U/DymwsaN09FrW6lZ5R/KcNuCm5Sf+h/a/ahF+Y8Qva3hSycpUQlbgVXvOaITedi
	+gsfBm0hdckn+MLGOYQNdn5VOBoGXHUUOJ5LyA426nw3emKM11DEku7xhj+F8cJt
	zQNckpfqDgkJUeZYwLnRaFm+Sknhxw43IPdyEk+EHq+5YZxgj1VDyicAbnem2bE9
	d6v2cg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjxkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85d9f0ace9so7482510a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781172640; x=1781777440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=;
        b=C4kW0Yrx8g11DVArIKyDAna2A6pTFYZw70XE4AgFmazk7C58F6VioJNqOGrEZpW6Pv
         ehsKcxF2dh+OjaZhiPVuz9im3Pr0i2xVsjW8+wR48ncz4PmBU2s0V3cHJ4t8AFwNAth4
         V8+N8R1XsDAsv87RlPjrqENoasq9ScN4Vr9MSCex9yNDh9q8Mi/oa88ouMk3cdGuvUNZ
         XbJvcXsk31F84hrqwIp+8a+Dc2nDOTpZSLPKN8bZLCvXSKtx5nHmmTMFgJJF8yKzvdhA
         gT8ETbkflHBJamyGXtlFQU86QrzBgGdVXS+WQyY1QFQ0gACc0vCxiiA5szlzeh29KhrB
         F0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172640; x=1781777440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=;
        b=XhwInUqfBKzQqRUYMBb11+ryQmZEcCi0V0tX8hSGj5YAXzGqo8MnQmTJKNFwS9ifLI
         NQwNu+RJJgL/eGNUfClmYCs+egiLpVlVO388PkgvKMIcrx2SLRQiAjkWBXurdtnKl5zR
         +KP5iHA8KKEdk+0+Trh8LCJCAFdjB8kfCcANVq6Xu49a0gqJAjyCYSdVKihud4HEOimf
         GSFpG0/j8iXtEIvpTBqKEVu3X3m7E4ZkcT/Khf56mvFJy/sBQesy3DbhNemdtwJzdYVk
         GAA0Uz1iWhCJFfSpsKQuxCf7InbjuhOfMt/tfg6pFJCQDev51sn4dG60oXDnqDwiYCga
         JR6w==
X-Gm-Message-State: AOJu0YyKdyZFr8ooAUUktKCM3fl6/9F2V9HhrAnttzQ6yO16HvItGbQx
	Qw//LCP/VlTF6PYDL4Tl3biy1DZQos/qvFHQhde22fvo/5Yg3pk9QlTcRjCUQxu86gbJMfXezHk
	IEwKpB2WM0KHX+isHyJx4+J3KDrBFWUIGUvYavR7kOa0U4HuLqkaNl00h2nN56nfiiSnq
X-Gm-Gg: Acq92OHynva15/cWM0+ExXVbUAMTrtkub/2lylJvULr1yIb6EbjT3Vrf7phU2RmdS1k
	9qfQBOTIsxXqqAxJTlcNXy31wW+O3dub9Iz5k8qdKF11/N2e0ald6AHVIxmPn/aeyKCG7m7itSw
	jLGep59tHg7Ds8bBf3VsuYUavDanvu4hB06aILzsSBBxZ8oskKJuEEqeWaTM+t2LluWUo/rudZf
	F7BQCJygV+cDHHhATkbHNeV9SGTOAGHNr3dJi3Ius82lD5t63gmLghV/wJZPh7Ucq+lCKphWet+
	FuN4ulPfn1GEsXGW/3rZqZHrPHMKz1h2avA0dmeRVyrN2btznfmKVqUvCRmoGJeTIyU+4nTH7KO
	pMXpY2VfeaQv1K0hMXA2/q5ln3XJiogJjobZU1oP4OgfPqQw=
X-Received: by 2002:a05:6a20:2448:b0:3b4:87c0:d90 with SMTP id adf61e73a8af0-3b5e33586femr2423584637.28.1781172640043;
        Thu, 11 Jun 2026 03:10:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:2448:b0:3b4:87c0:d90 with SMTP id adf61e73a8af0-3b5e33586femr2423539637.28.1781172639553;
        Thu, 11 Jun 2026 03:10:39 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865860f3d4sm1279646a12.19.2026.06.11.03.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:10:39 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 15:40:10 +0530
Subject: [PATCH v5 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-shikra-dt-v5-3-103ed26a8529@oss.qualcomm.com>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
In-Reply-To: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
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
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781172612; l=4449;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=w1EEpnLR6xXq+MivEnb+PLIzt6dGl5j6KmvIWASlAcs=;
 b=8gVoS30lkuWjAWd86AnwnX/01hSYh8ATXkBrk3/U4Xsku5YpjfWMCzOehMCEqMv9m+Rd/O8b9
 k0O39HTkG/NDhY/ENhEHotPjfmSjEx1HY1vGlNtpnDHdpY35PIfDSJS
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a89a1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=s31jhp6hv9j5UOuNascA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: rIpQx5zRso1NqyQrlFaiE3EKDfSpaXOq
X-Proofpoint-GUID: rIpQx5zRso1NqyQrlFaiE3EKDfSpaXOq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfX6EW6Asxfibhi
 gy3M2maVgAwCXrpayJjuX8CX2gMfY1l0JkPgeLH49MK27GFxC3xHXlWFQja/qg0OdmHTsQyVTpu
 /tT2CIVYucbam5TsB2s55PkioiEI5VVzeYkvv1KMiURrU9qK1tmpkXQRbRl/63yTgDxu3wDYCjO
 +BgoMEy3wvBDi+kzLg1m/GcGSDmwbS+FT+6/oI2YXE94c5QtYlGYi9HchIBsjpC2EVccagDhjMM
 Xb2ZsJ1uZ7EMQkNWvgWB3m0fS5wwutzqb9L1kcmK7eHSTPB9JIMXc9vNYPaGaa3PATZXRuVBFU/
 bbZ1PQpqYHRNqOsJn3/M3LlTHe47l6jrqSBBG+VKOBy2bcdQcDEyqYXXXvGVe7HU5fIG3JGS6ss
 /dAZOTjXK+nFz16JgOHw7us7TzZSQFJ5iy4IWpxR2ocWHg37oz7QuwzwGNex3ThBitJcXMmwGTN
 iPeoHnIHEsUo5vaYulQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfX97Km+h5FsJ32
 rjW8s6X5Vlfqof0+NHsHRYTeNSLg7vCqt0I8/jDC7zg5mbwsEJItLY8u9P4oDVO66aJSSwjNqa+
 l+U9RljEBlYaMgqzOy4iQMPkxSfw0xA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112699-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: E72C6670C0C

Add device tree include for the CQ2390M variant of the Shikra
System-on-Module, a compact compute module integrating the Shikra SoC
and PMIC for IoT applications, designed to mount on carrier boards.

  - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)

The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
peripheral definitions specific to this variant. Since PM8005 regulators
are controlled by rpmpd, so disabling the pm8005 regulators.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 156 +++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
new file mode 100644
index 000000000000..dc3861489f64
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "shikra.dtsi"
+#include "pm4125.dtsi"
+#include "pm8005.dtsi"
+
+/ {
+	gpio-keys {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+		pinctrl-0 = <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm4125_gpios 9 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
+&pm4125_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio9";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&pm4125_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm8005_regulators {
+	status = "disabled";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm2250-regulators";
+
+		pm4125_s2: s2 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm4125_l3: l3 {
+			regulator-min-microvolt = <624000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm4125_l4: l4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l5: l5 {
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l6: l6 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm4125_l7: l7 {
+			regulator-min-microvolt = <664000>;
+			regulator-max-microvolt = <664000>;
+		};
+
+		pm4125_l8: l8 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l10: l10 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l12: l12 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm4125_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l17: l17 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm4125_l18: l18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l19: l19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l20: l20 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+		};
+
+		pm4125_l21: l21 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3056000>;
+		};
+
+		pm4125_l22: l22 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+		};
+	};
+};

-- 
2.34.1


