Return-Path: <linux-arm-msm+bounces-85216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48605CBD20C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 10:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3F65302D918
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429F132FA1A;
	Mon, 15 Dec 2025 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRL5oEJj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJ9EcJX/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2239232F740
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789665; cv=none; b=ZaoH/b/8u5e3NFw4hLC9yGwnYBrp2bM6naDwYBjQ+OGEHUcqxQuU25sI2+E9fQ+kIqNo093JG7Xcp5BlkdFLJucGcMsGtZTPex9vDNuWRoA3RIzrHFpfwtN2mpR5M/QZBHTKnI6mBAKP5SnfecPMWAYbCVV8CgZP3omhPotupno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789665; c=relaxed/simple;
	bh=4Efl78C8pyw+hoEtIJfsPs/QdgTQ3zjDSBiSKuJLGVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWUf+NjJisbUyISd68ONhJjO45UT4KhcQcOT0idOdRSCui+ZYxD8mZitUA0w7cPu7+B2uRY3iV8KFzc9XNE2Y5TuQe5WhSkcJD9oWQzGB0uhQ8zDfiV2toYRqCVzAAYZQf/3b1Vc5whCvAJHzOpkWxwvVcnezDaXbn81I3/s0Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRL5oEJj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJ9EcJX/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF8sIwK2779876
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u2Cw65RSJxI9Ed4WvG49SuB8oE9ceu8493lkw2tc+VY=; b=NRL5oEJjYiwI6Xee
	ey0YXmyAnLnEg0oefnKOIISBnSYjcUolHmvwDeV15ABr7L7QjE/03A72shaCllv7
	+XbyCfLfWYfdAc76NFgx+nsKFYjnbUg7INhgbQtUnihkd4MRU87iQZYkfIps5dDd
	Q479gd6B5WUGPWhiFllxbCjlUk2E6VPdncjCF/aT3Set7acQIZHyc0bCCsDonCQz
	bn5Z3ompIbFVC2MWK3hogpAxGj5XcBDioMwMQ0vGsl3H32lfgcJN7ro07lWc6Cn9
	MkMHQYmPO2Cv+i5qrme0amk+LRy5L45q6J9eSWeNBYeHdcEJbVhr56tq1NoCRYad
	wJgOaQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11c6kxd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:07:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b993eb2701bso3218980a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 01:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765789659; x=1766394459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2Cw65RSJxI9Ed4WvG49SuB8oE9ceu8493lkw2tc+VY=;
        b=OJ9EcJX/KcpJRLLg5o9sZMXgpSjxidNvfIFIdXTuz58qYL7d5MC5+ZrJVl69i4nGZ1
         PsWiRzLN5DIL3nvykoSHCkkvX9GH6PyBfmMXDbx8GuChWRgHlJJpnsH0lwGUZxkEVNpA
         pNG6TOo+vGDksnUNMDlTDHV5oCVjDjQsWKPtKq2pvFZmL/n5pA8oeRByHISifz7inPzX
         82QDCcH5ztFiYAakM4CxBCZv6AVIIpzS+v5zr6i+dW1HhgJIBX24PE3wulsKqtPacoEL
         lC1MNzx0ONA46PoBUtPPGz3yYVk6vxJvhcrgfzyxm9M3vbh14T3VR00k++TirvtzvosO
         P60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765789659; x=1766394459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u2Cw65RSJxI9Ed4WvG49SuB8oE9ceu8493lkw2tc+VY=;
        b=hH5Rkbus298ZsS+3NJ/DrCUpIwv0FK8TIArHB48GxpJGGmuPWHqJDz2xjBHgsfDYq4
         peBAM5jCuchazPtgDElkx6Ys3pYE8og6Ll24QpNRJYRyPOEDpCcPdtItWkZA6BJ5/3lW
         WjtNwiC9DG1hLF4eAoRNoNSrZVJ9k3q7oc11Jx5h3hjlGuW0QKggTbclbRjJ7qbTPCI5
         IgO8g65eC5L8V74By5JgUQ9yTqgOPE4TcanRFTNdPI8s77EJ9vBiN/NvUy7aF0hryS7d
         Xb9fypD8k/NLzM3U/Hh7+e2GefxGOg0RLbgA2JVv6MZe5M/Bvj9/N1ogzTM+d+tDdtCI
         PUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5jSwSwvSEi3zD6sNHTKlok8ExzdHOIYuWUpim/SuQMeZGTMbyrHQ2Vryq8e8p+K/TXv/Ykwrxdl52yXB3@vger.kernel.org
X-Gm-Message-State: AOJu0YwYg8jc3aA/wn1XxXiQP6ETXj9djCMkTqwr8Ej/lp4W1C3l6Gmo
	X47WYi1xrZdxp8urTbuHy2lRrCpwuuVM/TCVIgRCoWjjdPO7a8eOTdBHgStDJ6Er3aS7etb2eAQ
	3M2FcmzxonfdwkKVU9qpdsSgwKK7Zfasyv/vpzzdkgCeSaL2/3PSweoHNNKzoZ0Xx3DZP
X-Gm-Gg: AY/fxX7UKCMoj0rUqTJUdU/Y/+oPEycFfxX+j1wqOmLESI32a5DCQsnZKfnGkMSZOnV
	KeFslzD7izpsvFHCNEW7EuiSUGaSDhA+AYXaCEwFq+rG9E3CwGWKLMOoW2gsNoazDK+JqJduhBS
	TqASW8uyssNvAyd5UVXszHHjbXadXxRv+vFwlIXC6X6QBs3o/hU7yWJSToLV2VSDHQdtgBk4pej
	DEbM+un+QXpoj5iOD7GH36/wwlQzRcSkc4iH2IY8Xt/+i93KRKurCJQQD0uo/XD3IO6rvBRZ33c
	dlHb0Po9Vr4V3+Z6RCgBMlrXAy6cUXRQoRhKoL9XTqj9rCrXIoIbSegmVkuiU6g5BLXpC7R+fDj
	GctD65BXGaEcUqZGl7q9qAkifvS20rhTtAswANWYK60roKzJJ9d7rW5NxTP53
X-Received: by 2002:a05:7301:db10:b0:2a4:3592:c60c with SMTP id 5a478bee46e88-2ac303c924dmr5285390eec.29.1765789658966;
        Mon, 15 Dec 2025 01:07:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWoHqBIRbnDQ677PDZ+HDQbOAyjEJ9xhVZwLYMvaUUjOAiN35wLdtZmW6MMtPiTiYr0w5eCw==
X-Received: by 2002:a05:7301:db10:b0:2a4:3592:c60c with SMTP id 5a478bee46e88-2ac303c924dmr5285376eec.29.1765789658299;
        Mon, 15 Dec 2025 01:07:38 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac3c13d60bsm15439671eec.0.2025.12.15.01.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:07:37 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 01:07:24 -0800
Subject: [PATCH v4 4/5] arm64: dts: qcom: kaanapali: Add base MTP board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-knp-dts-v4-4-1541bebeb89f@oss.qualcomm.com>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
In-Reply-To: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765789652; l=23816;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=4Efl78C8pyw+hoEtIJfsPs/QdgTQ3zjDSBiSKuJLGVQ=;
 b=/vpJY24yq9l1l51Ird6e78ptRqKUJtrYXv3SHYm4YY6ZEyfub1/mAG30XuucsvDR7NI/b3ZD4
 1QMab5KpBHhBl/Hq+WXH9NWBN6MO/T/kflM207pFpBjscv0HHKjJSrl
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=actsXBot c=1 sm=1 tr=0 ts=693fcfdd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tb9M4NetvsSJUPytCegA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: JNmild8FwBnOWDky4ijgNcx3zQi7w_fr
X-Proofpoint-GUID: JNmild8FwBnOWDky4ijgNcx3zQi7w_fr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3NiBTYWx0ZWRfX3GcVXZLJ2M/F
 H+5My+kOvUxnoT+5Pe65Y9evp9hNZdcT8GeKxhNWt+y4x0O8R2xsl+FcVtBOBXvgliVAKKHPZeE
 VhBsEJT2tDp7s79N4g/6yMAdBvi5LPIug8orXu4fwvszIDpT/m9XPuAj0X3437cSnESAYDKLzez
 TQoScsCCuWOzViJS5yuQ732ZUPd7eJ85wQf9WsAazMCOAJHgI7Jky6Kjm7aQwtoJt/r4mgiMIya
 aC/mKdJ7Su2ZagUdpTHLH4SghwB2Mw2rmpP1sBsML95rVExX5T45HjvoOHSakoXJxt3IY0qJkW3
 ERIGCr2A01wa4MaaVMhKw7jjdQcOua3GpB/eAuYeJNR0jNO8ZgwNwcUunVZE1a6IXh850qLFgmd
 GQHe+dCBAfKsSwPqbL8pQsr7DUx3Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150076

Add initial support for Qualcomm Kaanapali MTP board which enables PCIe,
SD Card, UFS and booting to shell with UART console.

Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
(added UFS), Manish Pandey (added SD Card) and Qiang Yu (added PCIe).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |   1 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 754 +++++++++++++++++++++++++++++
 2 files changed, 755 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..ac6c0178aae4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -30,6 +30,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
new file mode 100644
index 000000000000..32a082598434
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -0,0 +1,754 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "kaanapali.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kaanapali MTP";
+	compatible = "qcom,kaanapali-mtp", "qcom,kaanapali";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmh0101-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <4000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <3552000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3048000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <3100000>;
+			regulator-max-microvolt = <3148000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l7b_1p8: ldo7 {
+			regulator-name = "vreg_l7b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l8b_1p8: ldo8 {
+			regulator-name = "vreg_l8b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l11b_1p0: ldo11 {
+			regulator-name = "vreg_l11b_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1292000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l12b_1p8: ldo12 {
+			regulator-name = "vreg_l12b_1p8";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l14b_3p2: ldo14 {
+			regulator-name = "vreg_l14b_3p2";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_1p2: ldo18 {
+			regulator-name = "vreg_l18b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "D_E0";
+
+		vreg_s10d_1p0: smps10 {
+			regulator-name = "vreg_s10d_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1d_1p2: ldo1 {
+			regulator-name = "vreg_l1d_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2d_0p9: ldo2 {
+			regulator-name = "vreg_l2d_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3d_0p8: ldo3 {
+			regulator-name = "vreg_l3d_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4d_1p2: ldo4 {
+			regulator-name = "vreg_l4d_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_s6f_0p5: smps6 {
+			regulator-name = "vreg_s6f_0p5";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7f_1p2: smps7 {
+			regulator-name = "vreg_s7f_1p2";
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1372000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8f_1p8: smps8 {
+			regulator-name = "vreg_s8f_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_1p2: ldo1 {
+			regulator-name = "vreg_l1f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2f_1p2: ldo2 {
+			regulator-name = "vreg_l2f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3f_0p8: ldo3 {
+			regulator-name = "vreg_l3f_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4f_0p8: ldo4 {
+			regulator-name = "vreg_l4f_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "G_E0";
+
+		vreg_s7g_0p9: smps7 {
+			regulator-name = "vreg_s7g_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9g_1p0: smps9 {
+			regulator-name = "vreg_s9g_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1g_1p2: ldo1 {
+			regulator-name = "vreg_l1g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2g_1p8: ldo2 {
+			regulator-name = "vreg_l2g_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3g_1p2: ldo3 {
+			regulator-name = "vreg_l3g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4g_0p9: ldo4 {
+			regulator-name = "vreg_l4g_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "I_E0";
+
+		vreg_s7i_0p9: smps7 {
+			regulator-name = "vreg_s7i_0p9";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <972000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3i_0p8: ldo3 {
+			regulator-name = "vreg_l3i_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pmh0104-rpmh-regulators";
+		qcom,pmic-id = "J_E1";
+
+		vreg_s1j_0p8: smps1 {
+			regulator-name = "vreg_s1j_0p8";
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2j_0p8: smps2 {
+			regulator-name = "vreg_s2j_0p8";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3j_1p2: smps3 {
+			regulator-name = "vreg_s3j_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4j_0p7: smps4 {
+			regulator-name = "vreg_s4j_0p7";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-6 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+		qcom,pmic-id = "K_E1";
+
+		vreg_l1k_0p8: ldo1 {
+			regulator-name = "vreg_l1k_0p8";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k_0p7: ldo2 {
+			regulator-name = "vreg_l2k_0p7";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k_1p2: ldo3 {
+			regulator-name = "vreg_l3k_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k_1p0: ldo4 {
+			regulator-name = "vreg_l4k_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k_0p7: ldo5 {
+			regulator-name = "vreg_l5k_0p7";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k_1p7: ldo6 {
+			regulator-name = "vreg_l6k_1p7";
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k_0p7: ldo7 {
+			regulator-name = "vreg_l7k_0p7";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <848000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-7 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "M_E1";
+
+		vreg_l1m_1p0: ldo1 {
+			regulator-name = "vreg_l1m_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p0: ldo2 {
+			regulator-name = "vreg_l2m_1p0";
+			regulator-min-microvolt = <1096000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_2p8: ldo3 {
+			regulator-name = "vreg_l3m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_2p2: ldo4 {
+			regulator-name = "vreg_l4m_2p2";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6m_2p8: ldo6 {
+			regulator-name = "vreg_l6m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "N_E1";
+
+		vreg_l1n_1p1: ldo1 {
+			regulator-name = "vreg_l1n_1p1";
+			regulator-min-microvolt = <1096000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2n_1p2: ldo2 {
+			regulator-name = "vreg_l2n_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3n_1p8: ldo3 {
+			regulator-name = "vreg_l3n_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4n_1p8: ldo4 {
+			regulator-name = "vreg_l4n_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5n_2p8: ldo5 {
+			regulator-name = "vreg_l5n_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6n_2p8: ldo6 {
+			regulator-name = "vreg_l6n_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7n_3p3: ldo7 {
+			regulator-name = "vreg_l7n_3p3";
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&pcie_port0 {
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
+			       <74 1>, /* eSE */
+			       <119 2>, /* SoCCP */
+			       <144 4>; /* CXM UART */
+
+	pcie0_default_state: pcie0-default-state {
+		perst-n-pins {
+			pins = "gpio102";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		clkreq-n-pins {
+			pins = "gpio103";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-n-pins {
+			pins = "gpio104";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 217 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1200000>;
+	vccq-supply = <&vreg_l4d_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4g_0p9>;
+	vdda-pll-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};

-- 
2.25.1


