Return-Path: <linux-arm-msm+bounces-94428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHB1BwpxoWm6swQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:25:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7583B1B5F99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7959304EABD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76F63D349A;
	Fri, 27 Feb 2026 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hm+/wzdb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beR+2d+d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE6328150F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772187892; cv=none; b=EXUC25+q+wzQj8QI8odHxoz9EvjGeEUX7wVVlMVmOyjdQ1cBCjmkjuEtQSTPh5ljrxrCRIUoDspooYQ5riq/m7fYfsLgkr2ybHBUu2+goy8dhbQlzvDhG0BunjycXwzREurONv6imBOOWm6W4sPDtZE2EKXzus1KPBgB2mKwmDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772187892; c=relaxed/simple;
	bh=PVKuzIIiyI6bfHJM2VnasbsTZ11eY1o+wq0JrJM2h8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SaKUfucRoxCMi3Ql4mV+kzx3Cqn4+edgELkhE5jAk5MEw++F32vYpl/0ihZ4RLWu2wFB9MLwMLU+9TP5usSrUX/b3nsucpt2yaLLjzG0Dcpsv3kA5i0+9Kvr+ukoc7+0uCXtwWgMrRXjdGgoiQ/JBV1AoEA0uMUX6J7csi9BwaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hm+/wzdb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beR+2d+d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9mniP2403203
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T9LEXguKdgq
	JJlmIhwqnfJCeQrLFY3eTG6LcsZvk1iQ=; b=Hm+/wzdbEhgXRSYtxme9j8Wb3e0
	4UTp9Q5B1VIF7XVNGtdbSm+i+zhTm8WatgEIXzfEnPqIn24A3z0jNSu6uPUtUpCZ
	aYu2fQ0oR3J4kWbzYBfX4/H8iJxvFub0kRYQx9yUE58Zv7sINSDAtWQCJrKCunvE
	4+UhiqMafrBbABK6T4vEaQpWOyOl55OST32GFcUv4t4zcx8isMgYZxX7D03Mc+pl
	6dEy3qFLf7hG5oix+wUpcO7ukq72ACw0UzSaxa8WcEMzc8NOR0HV3qauXr9q1aHE
	VxZsmgoxQSLOAYukLBXrz6UbU9PknKfftoaXVpMgQYYpQL9ywFW51eyE7HA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw23acgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:24:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8272825e843so1383862b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 02:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772187889; x=1772792689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9LEXguKdgqJJlmIhwqnfJCeQrLFY3eTG6LcsZvk1iQ=;
        b=beR+2d+dxZva6BMgaWxPmek0w49gXzrrPctRiFWo/+SGWGzENuYQQcTa35jNXcbRwh
         jXLSWT+6ZY+8+7y9kcAT5TiW3N27rXHz+c9XyeeeocgJXHcReRVzfL5TRCeC4axdGNAV
         LMTPrw7vDTLf3yxBx7FWOR1Vek1LXVU3Ss8D354tfZgOGoF2U5ghnlPDJhEpNGGLltvN
         KJkRVcKOF3jjLQQiin3TCN/rVDuSHttZlHLQQ2Pi18gSo/oAf3fDq8z1jgA9DFYk0rxX
         3t3G2SyoxOmuzI9snIQUwzLyO3x/uqEvSvcor6/9+3IZe4RvI7zaz1OV2AomMIzCwWYC
         jXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772187889; x=1772792689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T9LEXguKdgqJJlmIhwqnfJCeQrLFY3eTG6LcsZvk1iQ=;
        b=TBPXX3u9xo7ET5tQUUbB+GaKASKF+M8J3w+1W3Xch+qHRY2JRSyn5MvX84sV+RXSgq
         B9CyT+feFYFTGNAAOp4r62IR7vgSbW4N5VdUiFFgAVwVXTMc1QjgN3jQA1Q4s7A1mb+W
         o/Q2oG6kbIoRHtmzBjDudtzs8Vzve+wFA0wPSBmE63r4VhNMtpzGxzQwrYPoqMaeqH1E
         /71dXO+EYvqNUnMh//O13drdj3zI68X7owOBW5JRho6+ipxj67KT4kA08XxCdzk4u2d/
         JYv7aJKm/N0LXzdoq+qStFwOFj/qBbxeddxCQaBXs++rQWBToiuWUp5/z6UQ6T5AQwPE
         ENzA==
X-Gm-Message-State: AOJu0Yy73taP25ScQb4gQOVxP2ng/IdExJPPlFITkXFswmv38mS2X/MV
	rAXZD9wRWmS7H+1O0Z3BlKhYMlkouhPm7BzWzr5N7a6d+hq4LfdYDw6QnLDHHiQRQxTdurAT4gr
	se7WOj+YN7K1nS4hn5hC8nVFxeLAWPvb40G/0SEUH71Q3SxGWA8D/m86xZ0kAZ1+9nuoE
X-Gm-Gg: ATEYQzxD0QI/X5YPWnb4gt1tZavUDLb1RuD1Mr1o4pE1Z7LYeDBMa/sFc0RDZa+GVti
	p6zXwyJ1oEe90fYdisHYyl+rklXKoknQ0FBmuW/ED18ZwAxtqxAFq8ZA/zertHysIhjDj+MavsE
	cEeYe9c4xiG3k5Zcnzbu3kWnbAgSw5sAHSGoPSDyVgfN29jaNMAhPzxFWttIAIb2a/DqOO2zAq/
	5VB+If+oB9fFeuQZ2MbWg6jgJftbs9uC+mkignPpIpzajpoxa15MYZBOxOhMKLAE7et1ivsFWFi
	g8WY9kWOAmqAoi8LDr17J3ZVL9WkDhgcADZzEmmDo9eahgw4RMAdGiDbl8bySyM9dMgxp35pIku
	3lt4B18drr5lMM8I+OlRaf8VwPv//UDDRzW4rxnPauVYLBuB9ZekPRRyv
X-Received: by 2002:a05:6a00:4109:b0:827:2ee0:411f with SMTP id d2e1a72fcca58-8274d933d62mr2227929b3a.4.1772187889356;
        Fri, 27 Feb 2026 02:24:49 -0800 (PST)
X-Received: by 2002:a05:6a00:4109:b0:827:2ee0:411f with SMTP id d2e1a72fcca58-8274d933d62mr2227902b3a.4.1772187888841;
        Fri, 27 Feb 2026 02:24:48 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a0299d9sm5350234b3a.51.2026.02.27.02.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 02:24:48 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V1 2/2] arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay
Date: Fri, 27 Feb 2026 15:54:05 +0530
Message-Id: <20260227102405.2339544-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
References: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BpX5vAxklj_fvBAySj1L0fVZDBVqIxDh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5MCBTYWx0ZWRfX4X+ZaNmd28br
 4ch3VSCueNfgS04QDfOcbayVLtoqWyo/0zrsVqLknK5XiNYwrr8xMYltcqMuMHERDvDLeJOyJzs
 q/PZlAAey+rbA51GDDGjMD7E7yB6zOvngIj1Qg8G+9Z+/TeijVWzqNwAiPGm1l/nfP1+GnrL/++
 SnjFaKQ7SqwpaR/1vT9fGxS3GTZgWPvts7fZ6uarlRQAyzmnNarWCluAU07/Yeb9xgywtiG+8KJ
 bqH8ndoR4nDvZLN18b54quXPb5EKRvDzSMNJf1FQklkLCDk43y5DZyNLM8NeV89BJ0HRJpbU5rM
 M+pIEHrP03iYOpDz7Y+6jeerfnDLXVlDhivFb0U7o1LFFzxI0gc40vnj3VvJnUc0nIxkRgI97MJ
 ufKoTH2tuTXF4pKS/GtYVDZZVZrW2QnbFz6ILSrxBe2cgbzJlnSTOD6I0ur3ucOpuB7FNvWxjoW
 2plkER4MJqAkTfxz/3Q==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a170f2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=m25OAOzQKwXoSehIqtIA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: BpX5vAxklj_fvBAySj1L0fVZDBVqIxDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94428-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,87c4000:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7583B1B5F99
X-Rspamd-Action: no action

Enable the SDHCI controller for eMMC functionality on the lemans EVK
using a device tree overlay. Configure the corresponding addresse space
and resources for eMMC.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 10 ++-
 3 files changed, 74 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e5ea8de55df7..5f5fcbef81d4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -35,6 +35,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
+lemans-evk-emmc-dtbs := lemans-evk.dtb lemans-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-emmc.dtb
+
 lemans-evk-sd-card-dtbs := lemans-evk.dtb lemans-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-sd-card.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
new file mode 100644
index 000000000000..52739d39a1ff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+
+/ {
+	vmmc_sdc1: regulator-l8c {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-sdc1";
+
+		regulator-min-microvolt = <2960000>;
+		regulator-max-microvolt = <2960000>;
+	};
+
+	vqmmc_sdc1: regulator-s4a {
+		compatible = "regulator-fixed";
+		regulator-name = "vqmmc-sdc1";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+};
+
+&sdhc {
+	vmmc-supply = <&vmmc_sdc1>;
+	vqmmc-supply = <&vqmmc_sdc1>;
+
+	pinctrl-0 = <&sdc_default>, <&sdc_rclk>;
+	pinctrl-1 = <&sdc_sleep>, <&sdc_rclk_sleep>;
+
+	pinctrl-names = "default", "sleep";
+
+	supports-cqe;
+	non-removable;
+
+	qcom,dll-config = <0x000F64EC>;
+	max-frequency = <50000000>;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&tlmm {
+        sdc_rclk: sdc1-rclk-state {
+                pins = "sdc1_rclk";
+                bias-pull-down;
+        };
+
+        sdc_rclk_sleep: sdc1-rclk-sleep-state {
+                pins = "sdc1_rclk";
+                drive-strength = <2>;
+                bias-bus-hold;
+        };
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..23d48f901e08 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3953,7 +3953,9 @@ apss_tpdm2_out: endpoint {
 
 		sdhc: mmc@87c4000 {
 			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0x0 0x087c4000 0x0 0x1000>;
+			reg = <0x0 0x87C4000 0x0 0x1000>,
+			      <0x0 0x87C5000 0x0 0x1000>;
+			reg-names = "hc", "cqhci";
 
 			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
@@ -3961,9 +3963,11 @@ sdhc: mmc@87c4000 {
 					  "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
-				 <&gcc GCC_SDCC1_APPS_CLK>;
+				<&gcc GCC_SDCC1_APPS_CLK>,
+				<&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "iface",
-				      "core";
+				      "core",
+				      "xo";
 
 			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-- 
2.34.1


