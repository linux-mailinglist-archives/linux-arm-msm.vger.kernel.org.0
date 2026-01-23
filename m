Return-Path: <linux-arm-msm+bounces-90340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM7bDQhjc2luvQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:01:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E70F757E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4810E300D276
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AF833B6D3;
	Fri, 23 Jan 2026 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ox/WnUWF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZB+xaaM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310C62DF3DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169634; cv=none; b=mp+k10qXv/DKy2EpjLyUGBE9b9FfJSV/tU0OCg+XuY4b4GhpKSG2p5TVDSu0S0VLSpyPRBxe4qHN7nZodk6/VdTFC+LlKa6FpBNY1um64ojo+WvrFKFgk4pLp9tYwNllvFQROjeehOowndmnEh3SyM0BM1H1lzLB2MZ/yrfrVOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169634; c=relaxed/simple;
	bh=Yhq0h+wOgLyV6xXPYhZgca8QSJ0Ie1jnkAAlaFukkAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fub6251hT1h4L939rqbs/9bvM8lIAnLQOIunJJbesnxFfF7SYc/ycncm6w+H4+J9ZPmmeJEsrpdX+5FP1U33wUVFCerHXg7pqdqlDOzRmf8+QIDjjfRPQS9/MKq6mI7bPPKl7av+YLdoLDGMKJEkd06KB1pLqhn+HuUx+RLDTBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ox/WnUWF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZB+xaaM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N8Wiff3649033
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=emZalPRO/Oi
	iKkmxVGztYKI8ysNV0q8Lau2ucg4rFnc=; b=ox/WnUWF4qZAcnpOZgRGTUeNz1Z
	p1cCCOBtBljyb0p3ifNDNOMrGARPcv2MgAe8pCFaFNzlibkrVe1az25oTYGYxG+v
	4MSSk/M9+My9Zpa1Ha1SmkSULwRn3pdrJkWGAXjFfftqRO55m+G1O6kUbLuAkpKY
	7+UZ9YgD4H1P32DLoNjHl42dYVxuigH/GlfKHri/uVsPbRONOi/ko0s+878hN+hv
	db/TBzEhT6uqIowuXeCxVtgo35yRmYPNxlQvKArVGZsPrvlgVtTUVSE+/h4YIxni
	6oqGSGvXl03OwdG2EncJjmo3XHn8FmBTn+rWE5ab8H/q/b3qaggtOiKa+QA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4nt798-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so1383771a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 04:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769169631; x=1769774431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emZalPRO/OiiKkmxVGztYKI8ysNV0q8Lau2ucg4rFnc=;
        b=EZB+xaaMDvOwu3kCj08yat/pAI2d0EqL9PwFYJk3punz8SzVvJM/aiKlmyjlKlSA6w
         hhwp4TdknIk0uGj0GNgIJT+nvrHGMcHwsMMqBC23oBtjbLpQW4vP+692STnEAHsH+KgP
         MnfIn7Vsdx0huxQe/CIovreBqJqfL/96JwxwktF7O/HyCGjhiZenFlCg4gGFaBO5wLA3
         6DlEqf6V0KnutDaETh+EudACQ2LVrqdzKHWPgFGHGH7rI4cARgqVaHlipxhu+PHJwXSN
         LLIqDpbvPYxZ9++2c6ZR5q5leGbFRMtmmds0YVIHyIzlF7y8MMfB0JkmYfH5MfXI6WwE
         Vw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769169631; x=1769774431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=emZalPRO/OiiKkmxVGztYKI8ysNV0q8Lau2ucg4rFnc=;
        b=sSSS8KdThdmlrlr0xjXgvQCUwJhg8rvJ1tMR6agx0aj7LN7gHH3zzhsDmimwaB1mCq
         D4d5k77DelBtAwPDptShF4SD2voE78/w0xoeXGAr/Jin5IhrPDhUxsDTUdxnTP6rUtXH
         2VPgSkZBOrIof2Ie3l8YkdYAo6WjgpcxQrnq5gRdjrIIIPmr/UG2BJxs/prYAAdQd7u2
         fO8sf0qjdCu+ToWuB5pYYBUMnZunjpCzEkgIIFY6poFaSrbexb9TPmU7vPy7C2e1hLpk
         hsV6QKq+4FegV28++QApPQQq2wLt4+i2e8adf2/W5swEr6vNczr/mfnXCTsZL/6XFaXt
         kOBA==
X-Forwarded-Encrypted: i=1; AJvYcCV6dusrkOO2Mi+XgkgS9ZQ3tS8XbCFscbKuqpGI7WC5fm9zN49M8knfB7nCVerE2AR5uDyhQQnlWM3aU1eM@vger.kernel.org
X-Gm-Message-State: AOJu0YxCS2xXKU5FYsOg9zHXy/4RxaXSptyngQggQq4+taQcFi4iy21h
	QziRT6CKYlXJmkwkbLtfBWUpOq8GrDoTQDbtZbB4dwMoeoMGI1IHMJVbvBRX+rBNktwB5X0fAY7
	BmPzDfQ5cG1262oho9ovgqcyo39/C89uV6uYb37Vc4TfvSBCsrvKRoWq9WvGVXLzzekIGisTu2c
	25
X-Gm-Gg: AZuq6aLMGgwQqEYqCiu9qStoYLmmhDbvum5d+60UtL4KcS/ZcTCnw7dxkwrngGCPMnB
	DIOSO7fyN5r003lHaa2rnSQ+pGDKulXZk1uKNvk28U1hMEyjmJrj3N2bL1vo4nudbY9H+s40PS0
	WtjGYyMivKrVTXIqe5UNn7j8Z83lHlabVdVPTbJ5VyFj/V8ZKitN7Yd6vfo9cnfK6jHykMbFJ4K
	9rOHY0g/xWWg4i2/dvh5OBnrR3P2heg+mLGstmo6XnDLbHxqofoLwXCvkv+2uYOl5mrsXxA94Jl
	SWJV0XxjUnrYJyAjK+uY5Nz/J8ixowoUK3ES9YpT6EMXhVAp+vU7iT6ZJz0jas58x/TWrVmX9D9
	2PRuEb48FU7RKneNn6XTGyZ2MkTxWQRd8DgNoFjf7QGmR72yPHXZ6zCULBE5arsg8ug4Ym3Caav
	SyrF9JH8hr7LDnMz2DBAdUomX1LEZix+7gNcvHX2U=
X-Received: by 2002:a05:6a21:32a7:b0:35f:26b2:2f94 with SMTP id adf61e73a8af0-38e6f7ce97fmr2819818637.46.1769169630765;
        Fri, 23 Jan 2026 04:00:30 -0800 (PST)
X-Received: by 2002:a05:6a21:32a7:b0:35f:26b2:2f94 with SMTP id adf61e73a8af0-38e6f7ce97fmr2819761637.46.1769169630153;
        Fri, 23 Jan 2026 04:00:30 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dce0ccsm19047295ad.32.2026.01.23.04.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:00:29 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 2/4] arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS to introduce eMMC support
Date: Fri, 23 Jan 2026 17:30:14 +0530
Message-Id: <20260123120016.3671812-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EUU9ZOIV5wLzgaBvQ5V99TU9TcNnzUAT
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=697362e0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TP8aHUymSOKQWh1oKwsA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: EUU9ZOIV5wLzgaBvQ5V99TU9TcNnzUAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5OCBTYWx0ZWRfX7Z+w+vpNW26Q
 KfL96o50yUbS9iWwUP11wiQCKQoHUUt0MsSdkgBY84j6Ncjg1l15hbqDgdxgcty7yKGG61yyO+E
 b8/ZRGerZuTcTb0WMvmSXEiU3gH3upE388b36/BE/phXTKQBhK4Ifj4ySKoT0DpRN/T8t4INi1Y
 A6SDX+tWdAc1w/IMgtYaU7l5K6uubMupwdxH/xuU8BLY8ekLDK5yKnIvzCRVUzWjBgq8j5NlCZi
 ME87MYXQYe+eWF+EKwlhH/ObyRVhlT4euq5d90ENIQTQ6oPUBSdyHevf/OzLsVj6ImHCR8qCv+4
 blubAjSPf19pjz9gBxotzWzLb5rLATd6dI9zI9I7YO0W0/YgmaX7lZSlxR8CFnGBbS/saJgjzY7
 ZTK0uhS8Vknw71UUQfzec2MJeZlETPgcCjfh+oDr7dz+MuqShLFw7wI1ZuA3WcXkhTKVurFgRit
 j6De01By/9EIJDp0PEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90340-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E70F757E5
X-Rspamd-Action: no action

The RDP433 has NAND and eMMC variants. Presently, only NAND variant is
supported. To enable support for eMMC variant, move the common nodes from
ipq9574-rdp433.dts to ipq9574-rdp433-common.dtsi. ipq9574-rdp433-common.dtsi
will be included in rdp433 NAND and eMMC DT files.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v2: Move common nodes into ipq9574-rdp433-common.dtsi
    Trim down ipq9574-rdp433.dts and #include rdp433-common.dtsi
---
 .../boot/dts/qcom/ipq9574-rdp433-common.dtsi  | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   | 116 +----------------
 2 files changed, 122 insertions(+), 115 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
new file mode 100644
index 000000000000..49c1b83bed10
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * IPQ9574 RDP433 board device tree source
+ *
+ * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default>;
+	pinctrl-names = "default";
+
+	perst-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 27 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	status = "okay";
+};
+
+&pcie2 {
+	pinctrl-0 = <&pcie2_default>;
+	pinctrl-names = "default";
+
+	perst-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie3_phy {
+	status = "okay";
+};
+
+&pcie3 {
+	pinctrl-0 = <&pcie3_default>;
+	pinctrl-names = "default";
+
+	perst-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&tlmm {
+
+	pcie1_default: pcie1-default-state {
+		clkreq-n-pins {
+			pins = "gpio25";
+			function = "pcie1_clk";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio26";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+			output-low;
+		};
+
+		wake-n-pins {
+			pins = "gpio27";
+			function = "pcie1_wake";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
+	pcie2_default: pcie2-default-state {
+		clkreq-n-pins {
+			pins = "gpio28";
+			function = "pcie2_clk";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio29";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+			output-low;
+		};
+
+		wake-n-pins {
+			pins = "gpio30";
+			function = "pcie2_wake";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
+	pcie3_default: pcie3-default-state {
+		clkreq-n-pins {
+			pins = "gpio31";
+			function = "pcie3_clk";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio32";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-up;
+			output-low;
+		};
+
+		wake-n-pins {
+			pins = "gpio33";
+			function = "pcie3_wake";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 5a546a14998b..6794c9ac0b67 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -8,124 +8,10 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
 #include "ipq9574-rdp-common.dtsi"
+#include "ipq9574-rdp433-common.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7";
 	compatible = "qcom,ipq9574-ap-al02-c7", "qcom,ipq9574";
 };
-
-&pcie1_phy {
-	status = "okay";
-};
-
-&pcie1 {
-	pinctrl-0 = <&pcie1_default>;
-	pinctrl-names = "default";
-
-	perst-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 27 GPIO_ACTIVE_LOW>;
-	status = "okay";
-};
-
-&pcie2_phy {
-	status = "okay";
-};
-
-&pcie2 {
-	pinctrl-0 = <&pcie2_default>;
-	pinctrl-names = "default";
-
-	perst-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
-	status = "okay";
-};
-
-&pcie3_phy {
-	status = "okay";
-};
-
-&pcie3 {
-	pinctrl-0 = <&pcie3_default>;
-	pinctrl-names = "default";
-
-	perst-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
-	status = "okay";
-};
-
-&tlmm {
-
-	pcie1_default: pcie1-default-state {
-		clkreq-n-pins {
-			pins = "gpio25";
-			function = "pcie1_clk";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio26";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-			output-low;
-		};
-
-		wake-n-pins {
-			pins = "gpio27";
-			function = "pcie1_wake";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-	};
-
-	pcie2_default: pcie2-default-state {
-		clkreq-n-pins {
-			pins = "gpio28";
-			function = "pcie2_clk";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio29";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-			output-low;
-		};
-
-		wake-n-pins {
-			pins = "gpio30";
-			function = "pcie2_wake";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-	};
-
-	pcie3_default: pcie3-default-state {
-		clkreq-n-pins {
-			pins = "gpio31";
-			function = "pcie3_clk";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio32";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-up;
-			output-low;
-		};
-
-		wake-n-pins {
-			pins = "gpio33";
-			function = "pcie3_wake";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-	};
-};
-- 
2.34.1


