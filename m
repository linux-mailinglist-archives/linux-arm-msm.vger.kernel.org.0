Return-Path: <linux-arm-msm+bounces-75276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C81BA2D04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BD1C16F221
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F2428A1F1;
	Fri, 26 Sep 2025 07:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwVXIY+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA0127C842
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758872076; cv=none; b=Sc95Jmw75Opu8Neo2oNZtl3tKNMwAOwrq/hJEpAYEC7GXDyzo85buhCBcOXTHSYCB433DluBCxppA2Eh8myiM+OmHC0GtlUPGAErS58GgIAsCNRnB73JL82UjmAgCKaQnlMWA/+ukNrqAXmmKRoePyZHXTV0f9J+Pwo3rxB4R0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758872076; c=relaxed/simple;
	bh=vgrsRGF2X72LzCSWHnhcbeAYtX4kO2jUD2JtNTJYzxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W2Wh0NDvNkAPRYCn+umn5J3U9+m9WQzpDuy69sBsbdaAX3l17J/AzWVg3wePIb3PB9214Qu1R8kDuCrxdDAPnhly82Of4FX2xklFsmQNJVLUUxQiWwFYHNC4hLYOq8K89P3wpVEhR47pjxQK9z0JQ18LfmUONXVIbCu3iLJs3YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwVXIY+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q7AZrS027516
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+mmgz37Uv+A
	eRgPO+mReb10DH0VT6NyGPQbQD7907lA=; b=bwVXIY+EMAZEdAdHZK1ibzrKwCz
	wJyoUtKOEEsQ+Nr2lfSX2m6uRcfdho8hO2KHPOm6O4fBDZopf3qBGKSqHvhQE1pY
	nrNtXUxbxeHscR4y4vFEPdg1Q84LbqtA+i8pv42wq+p1k0t/eAEi/IEqjUIaXmKZ
	KT4jSW8LrHMYxglg3SyEfSLi73iCJF/9O7uK1boNdBJLMCsWA+aCsclB57IHTi2k
	hR7BuyLcatfOYXYvtdCapl72USG5epdDFivcQK+XlTl7u5R9lY5jiT/kK2jYiEn3
	LempB58ab92YsRSEF9ofIWnL9prFULtaqXpzfffVGIWRhlXB+VaFWpdikZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q1wfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:34:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d91b91b6f8so38459331cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758872073; x=1759476873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mmgz37Uv+AeRgPO+mReb10DH0VT6NyGPQbQD7907lA=;
        b=PjbC9uZp2nzpGFnsDbopinqiU+0hTmMi3VIxP4VWPsUkvjJD9NAtZlWvRBHR1wnaN2
         PMsiTVcxbKvAXuXHCDO3QqhV0p19MP95s1HKD3FEHeeYcqVl7m/ZGPR8FVJH6fBbLo8v
         jFBRUEnDdTqzC6havnBtpDT9LqRZGMfr0grlJ6gY/DLetAb+BUW7sKnElUV4XmkrU9tE
         v+oeWaeOBQ1SZymhPWIlI3XRoEDu9m97osf4ux9xikk21PhZ96QpfeaJK+NFgkVxKAMF
         jM0w6Z/H3kML6zBzQ+5QUYqr36XdJnvqYzsDQbnJZ7WNoMRQvXFOEgcMKNfIbztR44Go
         mBlg==
X-Gm-Message-State: AOJu0YyC0gz1vvzztOG5fKdk4wLlZq/ZRBxJj990qvhuH46zMFIpNn6P
	cdta5kFDNrz+8gZyFFqUbFWrdri9tD7+cz7pmeP5AgjVh65WwLBUw1vt1iER09c8wDbx3Ng/WNF
	p+UIym+6rW/kXbTAZ91YznDVtm09iOjaGAk5DDFWqK5WQKbC8QiqJUkgPq9Is34YKC+b8
X-Gm-Gg: ASbGnctqEpF8z9CrXm/v77cpR/7M7goKVfPcXIhYmjIPRc6NlJRjjTq3YE6IlXEuRG/
	CRnvETdWfe6vlP4M1fadO6ZNX2lKIZEEdCBWcYxkaJjyVrCKzN+Tg1W0ixUYA3LEwkmdN68CYcG
	3jQfNqHVPEtlT1JTzHjafKanIv5aMP274eITz1LpYkcR8wcw/OgaqkKzhf3B2ZB5tyceEAMYIr/
	qdwxUplXno5J+AN97whUrA7TJ3DlsOAYOGM+Goi5O+flbCdX3N080Bn9eiIEMEIaH75HxUwg8Vp
	Tf0uUHt4sUQC17She0tYa7lr4ru4oYI1+0T00DFe/hQv3iPdxMU500NyDibaC5aT2wkjgLLp9rq
	4+ZDyiAw50AHGaNMoEPMM0s67rjdF
X-Received: by 2002:a05:622a:5e0b:b0:4db:29eb:901a with SMTP id d75a77b69052e-4db29eb9503mr44240441cf.35.1758872072330;
        Fri, 26 Sep 2025 00:34:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGshBzJtM6YOzHmRdy3HJRWysdkNo2IWZgWC6jZEQ/Za7M7pO+C0xrfpw7CSBrVs87Z2qJsaw==
X-Received: by 2002:a05:622a:5e0b:b0:4db:29eb:901a with SMTP id d75a77b69052e-4db29eb9503mr44240251cf.35.1758872071852;
        Fri, 26 Sep 2025 00:34:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:5de9:cd6:92fe:bfb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fd0a54sm320481666b.86.2025.09.26.00.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:34:31 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine
Date: Fri, 26 Sep 2025 09:34:21 +0200
Message-Id: <20250926073421.17408-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXwWk/y9YIXwAb
 CYxltk9IYM3BlAYzIBI+mLGHSGyPt4FF+e0IRyquDtviXmtMaArSC6ctiGRg26x72kdfVJeEC1h
 5VVsfuBWxpBbyTD+ZKLEVJpkli0363w9MvLSHp/ws+9TInbCtnyJFSrPKY6aZiE7uN+TtZSoFld
 M/yL9KTYBkgSzZTvpEkn0EWYmvY6cbtujCLFDXLKoBRSHxYahC1+cRqXc9W5+VKwhEJjC/xrbw5
 EKtFXBBpqIOpb6v35ATybAY7r4atIy947iIFZ8wswy7hwBt8I/dEZUsxWdJLmqhhe5h9DST2kIp
 vdPWQgATwSrB9QDvVW8QmuS3aKPguQVTY1POUZ1917X6+vDZFnBritZUTJUu+xDin6wp8JFEU9J
 vUFzWlj87wcWPnnA4N/kT6E9FXzboQ==
X-Proofpoint-GUID: 72ykh5VhmmVHvTsntHD5iMIz4TitTlV4
X-Proofpoint-ORIG-GUID: 72ykh5VhmmVHvTsntHD5iMIz4TitTlV4
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d6420a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=adKDawEoGyzw0LH5ae4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

This initial version includes support for OV9282 camera sensor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 76 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d7f22476d510..bee021efc249 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -138,6 +138,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
+
+qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1-vision-mezzanine.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
new file mode 100644
index 000000000000..3b6261131b75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&tlmm {
+	cam0a_default: cam0a-default-state {
+		pins = "gpio28";
+		function = "cam_mclk";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
+
+&pm8008 {
+	status = "okay";
+};
+
+&camss {
+	status = "okay";
+
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
+
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov9282_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */
+	camera@60 {
+		compatible = "ovti,ov9282";
+		reg = <0x60>;
+
+		/* Note: Reset is active-low but ov9282 driver logic is inverted... */
+		reset-gpios = <&tlmm 18 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&cam0a_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_l3p>;
+		dvdd-supply = <&vreg_l1p>;
+		dovdd-supply = <&vreg_l7p>;
+
+		port {
+			ov9282_ep: endpoint {
+				link-frequencies = /bits/ 64 <400000000>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&csiphy0_ep>;
+                        };
+                };
+	};
+};
-- 
2.34.1


