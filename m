Return-Path: <linux-arm-msm+bounces-94432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOdyA113oWnHtQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:52:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 638381B6363
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D22773051A9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256133DA7E7;
	Fri, 27 Feb 2026 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2fgT1MU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vzadcb44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AFF3C198F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189491; cv=none; b=BusL638PXQ2G4oRIdO3++ot8IkElONJrn8UurBC5TMuCzv5pBzpujMxzeUlTDk86BK2pHnG4y9T175whK+fFisnuBDp1aeLFtJ6BSssQ6i9bfL4jjRm3KePA2RbxsgIh2OOOfTjRqpiB6uWeKF30XTTxDopRt45qhyGxcf/TcC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189491; c=relaxed/simple;
	bh=1Hb/nG2DLItH9eFzX0E+MOBrifvM46uMYRnC3z3p9K8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lYlZE6LEGSoaI699m9pwKZ/8x9QubUDeMpD8MPAWX2t5MhpuzEjtjCdTUkdub6abtEuvk6LCZWVy3bclDKCZ7UptZ+8/2MABuXke199FCYNh35kfbemkm/eybE0XR6KhxpAqLMpcftiXD5/orfYL08U+I3GwfW3IAo3QILfwYpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2fgT1MU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vzadcb44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R7fP2e2307392
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JIqgn5XczyF
	fCUA1CWXG9QSO1jiL5d+mIQ18DFyeMNE=; b=Q2fgT1MU2kqLLlH08b5Ac15sxdv
	JFu2k128pieCOeBzQ9XQjATH0yndUbIgV08avr3J6C7Vu7nL1C7n8HGi+NpWseuD
	54DnucHLtxzrSUnD/DBvWD4Yr++Mprn2h7HBB1eUPc6yljkH6g3P8+1TN5mXtfEY
	8L3Dnt6Lu3/qdoWqJ8OIhJVWdqqK5AmFtOWI71MLfkn98o4jlOnBJG90VcmkCXIH
	+WyvU7aWb0vFYrcuEjnXyjVOsZZPQNTcorZZlU+nZ8RyfZMRzglBUF1DKHcu8H6z
	/AGs1ZPZRT1X3EwMoyFrh7Z14rhb4ThAJrQtv0gJA03DUQvaxidaEZZjfAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck73q0k1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2addb9ba334so19831245ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 02:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772189488; x=1772794288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIqgn5XczyFfCUA1CWXG9QSO1jiL5d+mIQ18DFyeMNE=;
        b=Vzadcb44mKGNFbU1Jwi1+bEaQy8I50p7ALmcHh4FlMMj1s/fK8sdoDh+Di7yEAA/3I
         3JlISJXm7R0OFEbyEnD0SpDCjxbwmmD9coJQLHl03LChkuGb+H10artjCi/hTTJa+xMT
         WB5kSOWYFdbobeRi0KJMQm3IE6+nm8iD8z3Cbwh2fPEhIZw1TJIPOAW24XtDbVAARfv0
         2iPcqpV24EhrlOd+ssLkwg0TsqmtZvzkjqkO2Fozd/4uhA4hIcFWygvpvD8O7tHl/5u9
         Buw439NDpQxVxr4O6B31Fk6A5UsNB5D7V3jMIAZgLTB6MXz5SZ9buUDnCsGM2vulSJId
         veeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772189488; x=1772794288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIqgn5XczyFfCUA1CWXG9QSO1jiL5d+mIQ18DFyeMNE=;
        b=mGCkKEbUoVER7lOHwz0i0OFcO06NI67qH5oaRod8/qLAfyyAAZyJrN1gs8CNUUjLhu
         AH6R7z+i0GbUlsx05Pqd8iXdubb8NB/Un2x4Z+XjXTMO7T+Os//6Zc7APBOIydpR6LPf
         TsT+QlciDfrZlFqHcB+Yt9hqs5abhYFBdAN+nJ6AYRjJgjHjbQs/5q3DKdUogy6GVd50
         Jj2C1DFPIJuH7L5y0p44Z6MLJQ9H4IWmlnyxzobQQMr7FK4CapztjHhXGKHpQ0QIoMgd
         FrKDueQLCaFUpLTJl5KWVT+esWGVVytft402lN89w9XMlrbgskWMTeERzJxEEEp0UBg+
         fZFg==
X-Gm-Message-State: AOJu0Yy3G/ochiqz7n119gYZ9r5oHec5R76zMf1lZq4m/IQr7a95bHgp
	rSbO3R3GzWM7uinujG4rgxRmbGcIm8wYIPYdpd8XogobS8Z/7QcOzDep3RzTIpwHACf7Bv/aTBU
	/r1LW5dozjoN9+xNruHpSwrPkGrN7xQd+8ZshWWtUkr71zTAbB9CSfkFkuqPIGNBFM8SG
X-Gm-Gg: ATEYQzxdvjCHuta+mAxmOVaw6q7meuyOjy0gKxX1q/MGs8GBi4wqXm7bP9pJ+Ir9MKx
	D7QdPab2ZTKpVMNwrRO4YBtWJ2MDA3Q6hOL3v/yPzu4l+iX4X4Xakc3lKJGJVOoIlb4s79raRht
	iZQdBENydGVFE1ZWE2CWm0FtSfQXyNBWn+sAsahKIr+5MYhNLLEFzoaH+EfKPrHlteWChthLCk7
	C64L9XKPF3QZpW/yI3Rj9N6BOXhrWddWJafX9RouN7CIknnfDUyl4yKnnARKHdjsLDb+1Fa36xt
	Q8LGK4arQrkWoDnY3/CfTqceTWXNXhdYsuAqBB1/AV9Nc2WhmhdNM0cIzkT96G7za6BjXNzbmoH
	j6uVZjmPDZpjuAq9MVE8/GLJJDg0o0URRC+TTPhQt2Wc/cdFm5mQs5icu
X-Received: by 2002:a17:903:32c5:b0:2a0:c942:8adf with SMTP id d9443c01a7336-2ae2e3e0f59mr21115965ad.8.1772189487716;
        Fri, 27 Feb 2026 02:51:27 -0800 (PST)
X-Received: by 2002:a17:903:32c5:b0:2a0:c942:8adf with SMTP id d9443c01a7336-2ae2e3e0f59mr21115785ad.8.1772189487252;
        Fri, 27 Feb 2026 02:51:27 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb757a8dsm73721885ad.40.2026.02.27.02.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 02:51:26 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
Date: Fri, 27 Feb 2026 16:20:54 +0530
Message-Id: <20260227105055.2364348-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5NCBTYWx0ZWRfX2+QhiFC+zoGY
 UAG59WcAYlVzzOEZ4CzQEolKSiGPqhMiD011XDCOoNF5FcHp2sqr+qInvgSGhDjGEABVbHZH39n
 PppsrsfkpHnazYmI92wKXEtskFiGhKEZJ6AcyjK005I585cc7gXfqw7Js1QRpgtlwwbhDU6GQsw
 z1ADQ+55wLjNIbflCvLnyQKY073Z+mZCmuopF4Cf5C3CA0/CrCeYRksMWow4ITOypfzUKvFyh3g
 Gdga+QqWHfaA+sFUdjzi5uSAi4/q195vkaLgCjGAsFK5GplZdzobsC5VRnoygdKYfwajZMwSAiM
 W6cHNhUmvc0ykIICoIJTcM7Ttfl1L+RCmW1BHR0YQZOEAB7y3nkI9FCIOyos9w7IvUnSotJ9m5T
 HuIMYs2/zAXlmeynpHWa7ZMY0a/mQr01UedJoXKGG3VwPKWM2rocsY/OFrzbsHBX98xmdUtMODD
 wqimTPtWjL6LtsIQoDw==
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=69a17730 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MGA-IAg3UYKhKOWSYZAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: DrlHw9gcpx0ZsmG3SxAAqEbfb25tYu3I
X-Proofpoint-GUID: DrlHw9gcpx0ZsmG3SxAAqEbfb25tYu3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270094
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
	TAGGED_FROM(0.00)[bounces-94432-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 638381B6363
X-Rspamd-Action: no action

The monaco EVK board supports either eMMC or SD-card, but only one
can be active at a time.

Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
to support SD Card for storage via a device tree overlay. This allows
eMMC support to be enabled through a separate overlay when required.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 ++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 317af937d038..c86242a1631d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -46,6 +46,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
+
+monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
new file mode 100644
index 000000000000..a0bc5c47d40b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
@@ -0,0 +1,72 @@
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
+/ {
+        vmmc_sdc: regulator-dummy {
+                compatible = "regulator-fixed";
+
+                regulator-name = "vmmc_sdc";
+                regulator-min-microvolt = <2950000>;
+                regulator-max-microvolt = <2950000>;
+        };
+
+        vreg_sdc: regulator-sdc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "vreg_sdc";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>, <2950000 0>;
+
+		startup-delay-us = <100>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
+	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	cap-sd-highspeed;
+	no-1-8-v;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc1_opp_table {
+	opp-100000000 {
+		opp-hz = /bits/ 64 <100000000>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+	};
+
+	opp-202000000 {
+		opp-hz = /bits/ 64 <202000000>;
+		required-opps = <&rpmhpd_opp_svs_l1>;
+	};
+};
+
+&tlmm {
+        sd_cd: sd-cd-state {
+                pins = "gpio11";
+                function = "gpio";
+                bias-pull-up;
+        };
+};
-- 
2.34.1


