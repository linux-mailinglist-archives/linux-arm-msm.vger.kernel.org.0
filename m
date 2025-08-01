Return-Path: <linux-arm-msm+bounces-67408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF5BB185E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 18:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A0AF1C27415
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 16:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16811B87E9;
	Fri,  1 Aug 2025 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gseAsHPt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22C01ADC69
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754066183; cv=none; b=MGl+Z5lBzwEN3PfyviUQWZ/melf81SGk4vE2fyVe22CaoYFXDqOscGjiKWwd1tx1dPxtalBe7w6hG/7EvfH1p2+jXwrtdHae0u3BxCLbUS3Tbb20PSL6AEc5MZGR/pPBkXrc2bvhlWjsGgXieiEwiz2heyE82KAE0iOF3H64E0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754066183; c=relaxed/simple;
	bh=b//hYbYliU/8P3RTN783VYganL3Ol2zEJN77zRvNyLg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ubm4W0CjUspfz7QFVmCFsDFNUgwhO6h/mBSl3YJa+L5robbu8wJVajRbhFgjdhwSzligOW9bl/1OfEQQnjjBOjjUid+37oUzAaMcEm5v7N0ipbFysXU5U6+2ggFelZplQP6NncYcOOVvzb5DttamUrpyIAlDgH0BDF7iwd36YNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gseAsHPt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571FNnLC011259
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 16:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wEkRL75bXb6
	Pl/HcrbFe3TqfpebbWXrUj4mMXP5CW4Q=; b=gseAsHPtHufeBDctfYb1MlxIdlP
	R0VQqBO5/DU75WHx1M5um+2R7WmHXaOxBg1JWBuxmlYNradH7EujTR+/F1X+PYXe
	iMbiBq61CZf2ECnAT2k6zwXlhDQksWou3DG7eypFwEop6Nd7hbX3Z57SKM8aZpTg
	MkmpgL863sVYEN9XplIsgX1wrl0n4Essdpega56cf0UAWCFTW7Wk1BvYYlhDPIyE
	j9NYNSHYmgx2eiY/LU42NU8V/tj50Fkd30wMOvzrDNwBQlnNtQ14QDrOvtuX7/32
	GALDpzLa41q4USop3OmTRYeBOJqGJQu8LB/AN91QizIdtx8/RnU29vZqR3Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdaccem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 16:36:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4243b67817so24968a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 09:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754066179; x=1754670979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEkRL75bXb6Pl/HcrbFe3TqfpebbWXrUj4mMXP5CW4Q=;
        b=tLxe95bUNO58Pl1Se2rIEYO0Vd89Nj9Rp7MjGPmAPPzl4ItD6Vqzi+UZjJ/u2xE5dR
         ZOBkjY647BVq3nSBHy5IJVA0pdAGE81ijF2ANT5xvWLZAJGrmq3j/QsnvrjkcFHIxv91
         6x2eo2TIm9MCxCPkfiu1UuX11UacbW/CFfbusY36NpaRI62uJPl/6FmCLfknAxcCJOFL
         UP/0PecLz3GyDCCFyHQvF5HyE7vBRENHXwCxxzMuKAVfGBONgg+BUmfxu8+Hm3eV12Cq
         nVmMyALTsMyeWOeDW9yrfMc/eZLhSQUmJrNFPoGtN7+H7/N5eRHmlck1Pn1F9nHwYWwV
         y8Qw==
X-Gm-Message-State: AOJu0YwvvaxXj3F0tHNb54wcErAdoARog+yLs+loPw+Ru9NU8vziPsmy
	93CMZ0z3URKLcy3ghGJBXIA4bnLJe7T4z4+nmXZ0Y909DU/Ya2V9Sac0tk9o5yGMLAjuTyDKxE0
	c+IUcATlL+cM2yXe5q10kmXVufTZLDZI6aT4LWESdGjt2qlhvqBWkoigelU33yCo/2oJq
X-Gm-Gg: ASbGncv/TbDbm2kuYP2RJWVr9lCMJd7OSdk2bBlsg8TeDW7jFl+1BJ7StDDrPrO6VCw
	0GPxihTU/AOSsbsIYILUl17yq+II2dvRvlKmpdIaor8OYZPhePNGI0sg7nSKm1jG21RWMwXoGeZ
	20zPDrw+5tbouvAUnQpELKEtL140uF+ucJrNQxkt9e/MlFwi9/6U9AXGd9Ac76C0B79WqKlzSFz
	is0aBYYOqGoaFPhXrqPipliST7r/IRg4Fy7uBtRrXwvEMWdiv9gDBRZ+8sFd7DvI4yW9G+FTZ7g
	gScDYKFNXuVs/Z44HXed/U4TtlHTSlcIkH17DdHHNtjDXHDsriXRl31QFVQU3+tSGxxDpkI=
X-Received: by 2002:a05:6a00:4fd0:b0:76b:cb84:36a5 with SMTP id d2e1a72fcca58-76bec47b498mr10547b3a.3.1754066179267;
        Fri, 01 Aug 2025 09:36:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFalZVepWoXtdwaNrf7aexAxdNq6RbQWYwfJrlsYqwzyjpXgv+4BnKeD01P79q6RKWno3acAg==
X-Received: by 2002:a05:6a00:4fd0:b0:76b:cb84:36a5 with SMTP id d2e1a72fcca58-76bec47b498mr10524b3a.3.1754066178746;
        Fri, 01 Aug 2025 09:36:18 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe74bfsm4508775b3a.121.2025.08.01.09.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 09:36:18 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        Rakesh Kota <quic_kotarake@quicinc.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Subject: [PATCH V2 2/2] arm64: dts: qcom: Add Monaco evaluation kit initial board support
Date: Fri,  1 Aug 2025 22:06:07 +0530
Message-Id: <20250801163607.1464037-3-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250801163607.1464037-1-umang.chheda@oss.qualcomm.com>
References: <20250801163607.1464037-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z_NuglHfp2bFhB58N9FsDjlR-9tOQLn8
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688ced04 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=bzA1Lde-YTL5c-jrauIA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: z_NuglHfp2bFhB58N9FsDjlR-9tOQLn8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEyNyBTYWx0ZWRfX2RsewEKVwOnr
 LpFDjrhxth6iOxLkVFr4lqXceA72T2+H2JgvLQ0dXVKKpxrFuuDPmw8Ur2jJEPi1i24JkWbI7DC
 +hBUOt8eRzxtSwAJFCrj+JOiSlj+nKeZ8/Ne/nJTqranohPizx1Z8s8LxS8WOxDdNg3F4p3ZliX
 BlihckXNk1/3KVt7EHfENvOooCGQhM83nsAMEHUIsldPrben4yyPIXS7S1XectWejrYEQijtvCR
 kwPPwVXwZBw4tAAn1FOiHMoW+7ISoJxYf1JcdfLT4W3qEAMbEikV87R+8jV9ZRaARCYcNe2lHXr
 bpmRIoNOyH6iSb2248r1Is3Uph3BALqmwYwQfams5ALPTtyVOiUTfxg54y/bz8Y+Psl2ggQxD7g
 aa5TutSECFpMRS2Jr+6IO7GU7uF5YZYvXpQANGDP1pVgVItUsCjIWK6Pj+RiwuvdZvjCGqjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_05,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010127

Add initial device tree support for Monaco EVK board, based on
Qualcomm's QCS8300 SoC.

Implement basic features like uart/ufs to enable 'boot to shell'.

Co-developed-by: Rakesh Kota <quic_kotarake@quicinc.com>
Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile       |   1 +
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 199 ++++++++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4bfa926b6a08..e78f56762b6d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
new file mode 100644
index 000000000000..1e0635c93556
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "qcs8300.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Monaco EVK";
+	compatible = "qcom,monaco-evk", "qcom,qcs8300";
+
+	aliases {
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_l3a: ldo3 {
+			regulator-name = "vreg_l3a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s5c: smps5 {
+			regulator-name = "vreg_s5c";
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <512000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
-- 
2.25.1


