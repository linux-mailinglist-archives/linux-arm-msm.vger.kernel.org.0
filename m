Return-Path: <linux-arm-msm+bounces-91872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACt3JnBehGnS2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:10:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 493A0F05B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE2553092007
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46C139E6E9;
	Thu,  5 Feb 2026 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfvJZ+YN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpF/6gN0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D439E6D7
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281996; cv=none; b=JRW93/hul4/1rKZMXMRSLnysH+1lioC9vvknmQUEgASKzqJgWmA1SFg6g8lkAkt9oze0g+Py9OhHEnIR31Dso8i+ye+NrCsDU35hicmmEYW/2+KZkrKBZtfRstUIDh5xBSXBjbW0IAkHARhYDu7omtnNltejY4ripjTKIj7e9mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281996; c=relaxed/simple;
	bh=jYTuh6AvT00hS+ztrHmmCLD/Zg4HW7+s+/ojFxST5g4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V9YNYINzPuwWu/nMrFXCscBbl1/Vni4rKSIrZnQzj3BXMu0UxChEReiSuzxb/a7pnB1Ltv0aMiSK/+zP/vyD7FTITkeJjl9MjVUegRS6SBNd/dITS1Gs1vmxkfn3nbJgWGkHF3IjY0Li6+2ijqljz6WIXPgpU07lxtc/8b8cty0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfvJZ+YN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpF/6gN0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6157MrY7890582
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wx772aEjSA5
	JzRXh8350g7n9FN/U+r11KMjcQ5sjnLY=; b=KfvJZ+YN8DWRDfn4X/bwE8sMGkE
	0Tc2ozgkIQnwVdE0BRbNR9+5BZFHyJC8MINTYFEQe6G/Slvy3dwRvqr1FdvAjqRX
	ouUt52zL8OnebdOORNKcTyejkKOa+RA/6ikf3pjqSWyrQpi4v+OJyN2tVXT+Omsn
	0Lti2HjEGZ+hI5J51tBf96BzEjPHglwNYbVvK5eHjvjoJqybVz14glbNarr0atMb
	UORgOiNcGAwbfsB/WT7jYOU9MbgpuUhToOUP5rjQ3moN4ygG42LZzL4kJadLrWe9
	6h7x+lA3PBAJDYXYxfihLgIPyVc8gH9t5wGW1nugmIWodHvaPSYCZLtPbeA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prx89df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:59:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3545dbb7f14so717758a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770281995; x=1770886795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wx772aEjSA5JzRXh8350g7n9FN/U+r11KMjcQ5sjnLY=;
        b=OpF/6gN0xejhoNXsMmEcQhnWEMWCryACGwPGV7Ta9v6T26NLu9jHxGlf686W+hKirj
         xjOPYE8FBYOHH0FGG5oj+Kkkz8c17fLm26/hekWb/e8UVPo/fX8Jz1N/wjYvEKF8cm0l
         7P7oH6rzEYUvdq2PPY9mzPI94F0xJrctkWoxDDTO6GgTfFi0dOrWSGV/xbTVT6ph3bQk
         lMq7s3mJeNODCpvpmGDjAtvp+IXdAyan2MJ+sIF95+LUAp+g3bmWjOtvFZygqThnuDTY
         UMdX+GpEMngVKvSdWX6qEeEnft5AVVtIoA4zYPhuLoubz7XXXrzpFmlV8YRbjFweLcJm
         KNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281995; x=1770886795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wx772aEjSA5JzRXh8350g7n9FN/U+r11KMjcQ5sjnLY=;
        b=oytQzi3yUYR02yHYfKGUdBubycWuikNxXPiyTgx07x1ZkNBVWm/vm+Xon8ra1wh1F9
         Q/hT2v/rcAb8zs26BP+2sWm0lvLC1+VebcSX/FT7n2ceu+Z3IP/6OYtPVQfSlUY9imy6
         enrdWePPBkj6C7kPfbhZ8GHLeXbMEjisPYFe993Jf+hOLa0FVL3rsuZQX6Ck71ZS+0Nz
         VGKEsOwZfH8YLJk/iINIEaYsIKFtceJQdiLkC+M+di5QQmqvEUMU91/kdbWq3nw47kyA
         5BRIhUN9dgGI2QZXnyxbLpmXEbKyVjjUmDPvIOsZkpkQRs6S8EXF7OC9uzliGILXVXYx
         siEA==
X-Forwarded-Encrypted: i=1; AJvYcCX3OykDsnZSLowvUuucdJZvqe6btTb5eLlQZE93Mp73sHq3i/Ia6lfoHM5MhfSvIqoBQjSU27GMiWCQbKaR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6xpUxk1l1rKL0zhhhStCxBQ7ziOeQja0kv1Fn62dfttVn/yO7
	Bk2Fk1GftLq2PvqGUyxK0IzXSsNfqQa5hmTcU6FHi6H6lvrfZuhBe25qhAoeNhP+FmYrOxzJUiQ
	W+QBVCGdzYq3QOmjcgkmT1guDJ+DCKcJvYBrvfbZEvT++k5VWIT7dVombvKPdt+oPmQip
X-Gm-Gg: AZuq6aJNQizRWHkqeVbSvhUNazXMWWp6FmwDwD8DBxeSfAhQafFR++kn5ZlEF4750sz
	9XbQVeHKHtTrmvcS5Bmgqt4KfuPHwS/BxHf0sFu2khGain4Kd3i/8/m+b0VNxWonYxbAcHjc1eA
	r2vB18feIj7C3l96X1TyCBY+poCq9zZkTJVsXJofXFrDqLgKm9j6lR5pUnTc7JVj35Z08F7qGDg
	xW+89CVkk1q2/QeMrDJ+xCgJLkdLZv8eCZ/FNvCT9ikCaCo+Jfan16ekigNFlZPzipstbWlEVrZ
	qPIMkxmW4Adye95C+UgQkuh8JUGJEnH8XVVLG1hPdNlmwi2w26pZ9oVXJ50sYEM+8S0Ggi52hiL
	qOOGmLls+VMljmLqxiTs5GhAGe4hVMAdylrt+mfE/dd0o/zpjXEklyjzV1SnrHALu1aAHXpjYdB
	2/3qcJ1Y0Ug5MqK6/jS5zVLUfuEkF656QMniC3TE8=
X-Received: by 2002:a05:6a21:e58d:b0:38d:f56f:cdde with SMTP id adf61e73a8af0-3937207383emr5542958637.8.1770281995196;
        Thu, 05 Feb 2026 00:59:55 -0800 (PST)
X-Received: by 2002:a05:6a21:e58d:b0:38d:f56f:cdde with SMTP id adf61e73a8af0-3937207383emr5542926637.8.1770281994716;
        Thu, 05 Feb 2026 00:59:54 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8572b4e7sm4361984a12.33.2026.02.05.00.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 00:59:54 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 2/4] arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS to introduce eMMC support
Date: Thu,  5 Feb 2026 14:29:34 +0530
Message-Id: <20260205085936.3220108-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205085936.3220108-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260205085936.3220108-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xhkDRYq37KRwyBwXkz4VYAg-t77cZIwE
X-Proofpoint-ORIG-GUID: xhkDRYq37KRwyBwXkz4VYAg-t77cZIwE
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=69845c0b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1Iu_2fk8mI7RMVeon3sA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NCBTYWx0ZWRfXxW7lL5SMSglt
 zLrqYRRbbTVuOlYFLffHErL8dRnTVEXAiwESYctvgRPJYygCPO4cKy3/lqjoBRHGWZOMkPvRjkH
 fjJSqyjFgJRU2/JNZtnDarActah95A5pCpZlxL2atCrybROvBoFPH2enPb4nBibeXZIrv/kTrSE
 yX2KasLMaAZkpFmChsC7P+1hfg+IUe84PCCEuKxWILI4lW2WVjXy5SjQ1XkZWcrjzU6w0a06A18
 Ttpx2AZL2Y5A3cVutgqSv4c4UwT2m970hZjVd9LxdVQD+MV1uDHAU1LzZ+Yxs55XIpgfOLUOYh1
 Gf1YYgmzUfbUIggWW4pyD8cnDFCRFxiy8SgK6u9sKV74qbMdUvOZluFraz/N+e8CLMmrTdUsdz1
 BXh86b5HX+1SK9pIeKW289kdev4HAohgTIOQiUre3W9rmn7JWHLPNd2cGC1NfGSa9Z7fu13H7q7
 7xgCcXclj+ZIoEc3uuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91872-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 493A0F05B4
X-Rspamd-Action: no action

The RDP433 has NAND and eMMC variants. Presently, only NAND variant is
supported. To enable support for eMMC variant, move the common nodes from
ipq9574-rdp433.dts to ipq9574-rdp433-common.dtsi. ipq9574-rdp433-common.dtsi
will be included in rdp433 NAND and eMMC DT files.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v5: Enable qpic_nand in rdp433 dts as it is not enabled in common dts

v4: Not enabling qpic_nand in ipq9574-rdp433.dts as it is enabled in
    ipq9574-rdp-common.dtsi

v3: Since qpic_nand is disabled in ipq9574-rdp-common.dtsi, enable it here.
    Add 'Reviewed-by: Konrad Dybcio'

v2: Move common nodes into ipq9574-rdp433-common.dtsi
    Trim down ipq9574-rdp433.dts and #include rdp433-common.dtsi
---
 .../boot/dts/qcom/ipq9574-rdp433-common.dtsi  | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   | 116 +----------------
 2 files changed, 122 insertions(+), 115 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
new file mode 100644
index 000000000000..3422058ac480
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: BSD-3-Clause
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
index 73091067bad2..88439697c074 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -8,128 +8,14 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
 #include "ipq9574-rdp-common.dtsi"
+#include "ipq9574-rdp433-common.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7";
 	compatible = "qcom,ipq9574-ap-al02-c7", "qcom,ipq9574";
 };
 
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
 &qpic_nand {
 	status = "okay";
 };
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


