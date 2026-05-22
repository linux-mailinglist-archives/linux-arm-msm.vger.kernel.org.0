Return-Path: <linux-arm-msm+bounces-109394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DUJMBieEGpuawYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:19:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BED7C5B8EE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98A263029479
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71317368D69;
	Fri, 22 May 2026 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kbf/6Gs5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpHAVk8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDC9367B66
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472981; cv=none; b=irVZvbyI6XpAVVPtd49uNjqsaS0DECrqGa5NW86CqvOo3nOTe/NC0LxwuTEpxQMh/cb80y8N4B8bXelisy0XPvPFVwq8QKIerAxd6ccUy0XVPZ1770SGONXaPmeOD4Fg8aOKhvW9gj+7xn4azpgR8gGZ294Bg8QaK2KRqctUPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472981; c=relaxed/simple;
	bh=gyY1XiTKArO3gJDJCSJfjS7xSgApxMt112/xnTGtpAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHQDbsLgA9Sjlf52oldwV03oJ0by7Q9rychkmVEEyZjTaAGMut4DnKISk/fJeNq+6j+mk+U3JpeaWOPITgrJrv+cmWbtNyFlEFT0D0N0mdbKrUCbdN6OZl3isJs2mKA/2v05+X5wwRc6aPOKsQOZX9Ix+s+gTSKzgUI/8PrP0Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kbf/6Gs5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpHAVk8V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBODlJ1298044
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYbCyoSrxp2f0yxvAlcjf3VHWtL27L0/ddWablgzkzk=; b=Kbf/6Gs5EBaOfZpY
	e42nxdQPhPyuAqLIxy2J9TipfdTHdsLkg2bRpgxKX5/AcbOid0ZacorUyQIaBBzG
	H7ndCf//zV3X3gQgMxJ06BGwUv2kEtQMQzuH2aieXYeQJeWtXSD56D7tMcbH4GI1
	OKaVAkJUT1MEEOqRsatYpWH2zB+2dei9OysI1i0Nsb3DPgwy6bfKN8VTg9cNHbQi
	SVWU7qMkfoXKq3xcGep/TMx6g+ci8zU/QgEjHzyUe9+P5txlir0rP1BGYdrsfDr+
	0LeambT3s81BS53Bw+fiqa5jZryOTsDDKZhRqu6qoul2oVjVux43tiySRp5P13eb
	w3xMjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0cb2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:02:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba115ab6bbso80107505ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779472974; x=1780077774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYbCyoSrxp2f0yxvAlcjf3VHWtL27L0/ddWablgzkzk=;
        b=IpHAVk8Vy6BAZNQp8SiU+K1nqor2wj3IFZstqNkGu/TuQC+42Ek2B3wRmtieNnMTU3
         0uKGYGvJJfbn4HHpnZ6qUGXuY5J1edHb+DTm/yuJhwGSsZyUBvuo3babQnQpp4NZqsnY
         x+FTo7js+rubKc8OnXQxRMzPVYv5Ra5RVY3xwIjUJWkH4Vw9HTyuC0Ush6mvSfv42w0B
         L5PEBRWSpyGpePbVCcX2Ef2M9qBkwffByzKJ9ibs0WTroVsdZxcJaqBARcf4eeKSFg8D
         06is6EhAXHoLbW1OrWs8mbnwCLSE2o1NPgBlti5V0wl4SPVQKbR0H/IiOqBi3/4z0CNd
         yq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472974; x=1780077774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LYbCyoSrxp2f0yxvAlcjf3VHWtL27L0/ddWablgzkzk=;
        b=egu14l0PoOLs5H6ixwoUXK3dwir7GLMtLyd53vLZhjrAkQsuPTuBqIwpXkc/qPJfl0
         tVJXj7UMCkoSIzJsPUCgJuDU1jwsXabGaMxLAes2vf+WevuUjKcxBb+r1yxyOscobiBC
         qljwiIYO2elIHtdciLWDeuATFNr+5lbLyW2GBbf3TrnSVH3mUIwP3/mey5UBL4jVBTRA
         11HcCodZnFsty1CuwhPWhbMbKRqNiW1ORwhHge1GtMIHFOhe9JsDoGPqU06VAuYvTpcj
         eJy0CO2SHwa2xf5bfsNYS/GCYrsLbnk3Y5J/bl9z6Zg1/WRKCGVn/0bs/9fW0OhliPjw
         K1Ww==
X-Gm-Message-State: AOJu0YzbHSyTqI7H/NRVPLLYpZuo00qT4Opkv28EBz9jtZwh3q6UhjLM
	2dSzlstT3Is+nzP9I5R2bZU0q3gCkUFuhDhQh6NRucpUuzUCjB+9mFoKftbfpsnUlJSW+KqjAd7
	fnDMFrFP7jGHb/iiPNWG5mlV1FV8qHvH7O0Cbcm8G2vEZWGdYRdLEZ+eta3hs8ZTAQ76a
X-Gm-Gg: Acq92OGJTyDpex6QWEOhM0CDVMK8WqKb3Z2xOohsVezI3v1VwzgTFE5kU7bIxPFxa4i
	Q23uGAT8eILrLoIZEBJrwEIh9KblSKWoSScThX/C8kRXCq4viNSDNcZ7cX6W6esbx6ZFfIDSjGf
	seGsPVjmlJ2pXuzUkn0SeTFEkrTMLG//kjhJdUro+7RAYHgy54/ITB1fsSQwA7Qt9yqFkXWR9cX
	B2cCUiRyq+RGu8Bvffpw2bnm+p/m2UG0EbFQVg06zMn9Ki5Ktv5ohO8aYeob+VdygPu+k7+814w
	itLWAgzMPqC9bkUrpAEX8mUy51cOyJRntBF5tem2wrvpoWkRWWg5ZnC3t/uZqol+S+rGk4srFrt
	cuY9vfzgewg0/4HEYJBx7w7p7JjhoEQFJeDk8
X-Received: by 2002:a17:903:1a10:b0:2bd:2430:eb7b with SMTP id d9443c01a7336-2beb06cbf6cmr53141115ad.12.1779472973784;
        Fri, 22 May 2026 11:02:53 -0700 (PDT)
X-Received: by 2002:a17:903:1a10:b0:2bd:2430:eb7b with SMTP id d9443c01a7336-2beb06cbf6cmr53140605ad.12.1779472973267;
        Fri, 22 May 2026 11:02:53 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58ff106sm21193645ad.74.2026.05.22.11.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 11:02:52 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 22 May 2026 23:32:26 +0530
Subject: [PATCH v3 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
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
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779472947; l=4361;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=gyY1XiTKArO3gJDJCSJfjS7xSgApxMt112/xnTGtpAM=;
 b=3hw0jq4U6PlOsygUfYiXLFHUOBdUHGipF5u5OsPsLZrj2E3lxCbBDryNt8DZzBw0Y9TPqVJOe
 cUBb9e7XfLRDkr6i4wecDON2DKyFAnSKvdbYj3ZGtiJSUZi4dvdzu7P
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE4MCBTYWx0ZWRfXxaTZkBIsR5wV
 xViDlNBZ8REDfv60KllD//b3uLhKZ7ZTSyJlt9k6dP6YhglaHvKTtrmIJT1lWLbgd5R8sXYBHZp
 9p5OSYVDGUjIpUKJjpz74HNWRIjeoeYAvXbR8cxv99vNUQRQZitVPkACf1Yid8mEBbYTeKVKWIG
 6dfb2th88s/SbB48znNzZ9/MFyv76GCiwpzgqyZ85wMw7kIBoYiWRchhhmCVQfPxRbWu54pmI9S
 3N9pbPQhuGD0wQfF5sQvduczhNz8qE5d2IwjzDfNDAJBUT/vQwY0b3WhsQY+GQbF/2JS2f+W+rE
 hukdCnTtT6l6Qd4kIErcOlrYrMexAAIJ1YjR/VNKR/KcwzVnQjSdILla8FRIl6MrnTuo2+kdiUq
 98KBvBoAFo66dBWPBZFeKP/BRjxa6+CZhDm12aWX03Mr32RiHbroYCs/poC/2puAiIf+5s1e/Zd
 YRMevSf0RaY1xc6F7Tg==
X-Proofpoint-GUID: PRgKThDmXUViZCGCY4WwfGwFhaDlGb6J
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a109a4e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=s31jhp6hv9j5UOuNascA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: PRgKThDmXUViZCGCY4WwfGwFhaDlGb6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220180
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109394-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BED7C5B8EE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree include for the CQ2390M variant of the Shikra
System-on-Module, a compact compute module integrating the Shikra SoC
and PMIC for IoT applications, designed to mount on carrier boards.

  - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)

The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
regulator definitions specific to this variant.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 156 +++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
new file mode 100644
index 000000000000..97966cff8896
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
+	gpio-key {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_n>;
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
+	status = "okay";
+};
+
+&pm8005_regulators {
+	status = "disabled";
+};
+
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


