Return-Path: <linux-arm-msm+bounces-94433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC4vIJN3oWnJtQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:53:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D70ED1B63A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B629D303D730
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFCE39A7EE;
	Fri, 27 Feb 2026 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqWusIOC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dycCb9BB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9103D6476
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189499; cv=none; b=rgDsjnq7+UHqy3tP258v2MLDX0bhiaE654YHe6ZBP+XevPh6NaVYp78J5/z089i8FEDHYGimNy26ytsJtCD/OLqrOYa+HQC/L+aolZQwYbcfkG9j0d2ClGIfgAuprYqJKuQGokXdS4L4dN7c2vxLoQQB6XdJYPO+mgKDD826XyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189499; c=relaxed/simple;
	bh=L8ABybu6ViLjwkGghEeaCGBxv4ozkKZEegQCa339Ve0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oLoq0dhiVp496LtnGYZci/5fXqNTMWibpxVoAXwggUX6kDOCaYFtxPEsWGu2erToE+YBIt910YpxUAX2uGV5keRo0ZEG7eI24E3h78s5kS8tGmnZFhcGuDkV/lNOMuba0O4Ku6z+fYQuF2fUFMRVjhCjf7MPYkQBZNVGmcin6hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqWusIOC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dycCb9BB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9WDJg236041
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kNj1W6YrgTz
	QO3k9n1aoZP35kClENCGQC8Uac/tfXXw=; b=oqWusIOCOl5WWqhuSNPdEvO6Ms0
	P006FwnRuDnHuFtsy/x85edgQMrBSy8SY4kbjpP2Yj/QYLC6fdgOCXCyowaEywJh
	ICC/mzeJYrZvuj9CIFRwF0uMfsifAMcu3fpDc2ld0+HUiUD1Wu89rHR4aZGkS83X
	W9WTbqnxeL3IjAf6t7mof++sKxOaMTSeUrRVeC2mvmts1DGfveI636A9lkfsI98o
	2LcqqWIv8l+eTr4VQqUpP47gfBevlJ6v29qc3yLg5gFWC1XHspDt+R+/5orUJYWf
	JQGrHOtX8EkJSq+hpCKAxqTDxklBY+AJxSgEURhgyLxF6vetFEqkZ93q7kA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjx1xt6mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adad0625d1so118031715ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 02:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772189496; x=1772794296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNj1W6YrgTzQO3k9n1aoZP35kClENCGQC8Uac/tfXXw=;
        b=dycCb9BByV2U4tUQVmX3d9HvMRtfvDqKTUt+xnAFb0orYUv3dA0Bg+WPrJ5aUgoaxe
         Gv9Y96kazQAPcZnNp1e5ndrZtONuy3jgTtRZcLbVvdsGzKmBYLE69FQCNzP7Wj+0LX5t
         tkPZHMglidrEjaTeZOQd3RY0kNOrpV5hBX65oHlqREWxQwhS8wPpzVFoqsTNWHq97nb4
         xt81gzMo/a+YIaPGvIn+zqVf7rbd/KjV/8JmA3g4/CigpGumGgO93qSnSocfLTds6zt0
         2w/5CVTBjr0RyEbxPwlA5QIv0VwiBX/A2Khv9UShEC4DiA5sWeFEf6d1FpT1qPTeUkH9
         Tdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772189496; x=1772794296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kNj1W6YrgTzQO3k9n1aoZP35kClENCGQC8Uac/tfXXw=;
        b=v5DtXMe9CBuT3vWaXFnoyt2AuCXe+aEBFB60EfV9xEbTRYJOIXVBklYcgEbSASsECs
         P9MCXnO1STU0hD00qkEdNSt8sgZ95LEP3xpMQGYLSRynjSNQRcWPSMPlEJ7eKxvjx1ZX
         aAUIB5rneQV5SOVA9lA948KV0dvSoqFb+Y2q+rPjmaslQc3rplOhppdTguKi3zlIROcP
         VyWjA/ch9Xut6HFdRaeHU0yADSgTnlbCDlve3Ib1KKbkX35OKiMoTh/vTus/0Ldr8mWS
         kolIF5GQqLM4iVmq8DnInicE5FkQ1gbwklE5lK7XCjYjsDvowZn0rDR+FQWXtfB1Eo4A
         Mh5g==
X-Gm-Message-State: AOJu0Yyf9/aFq1+3BWJ3wwWYaPmhHsbxXA9LENt8qSN8FSBM5vX0eKTk
	8o+MKRvoo1UrfP7Quv9pOYIOJ+o2f98aXwn+tXC81dYd0TLKADrXTebRQudDwlglVXAaNLpqFY3
	lHLwkbTTNIsjgPbp5UHxCFXh7WP5zqyNE4ph5+gj10uk0NuixxLfuxkfKFtJRjPaLPGqAg/FoQI
	de
X-Gm-Gg: ATEYQzxrmVEN34sUZDHtqf/V5sq37VUdvgzpj06tI3MrDW20XeSKUSgoh3rvunSqQrg
	N244eB0Q6yN1K035bjls4i+C92vs1oLnLvSro61wXz+XnWyIekBg5wis7lQC1CliHAdgZnTJE0n
	DYUfXr4OYizKTThYVBM3Hg6Xn3oDsGHxvxph0HYvkogk0Qh/UTg0Sxt4wKiXXxK00XLd5fXSwPt
	0YOd2HQ6F1E5MHQEwkvDQRUColBDiqr8Ldu+EUQzPsH/R2edGNd4EKey1xfElOozMnAKF6nwf8w
	YcenjsY1b7ZI2NnivmO9qR/+8yerzGvXYuB2cxuL31ajJf1Mt/vhKjP2F8+6xNWJwC8G6LSTtW0
	yKpSG5gQFbwDG1tvu1gM2o2XZTH+5Frh6oKdgrYukRhTRKO3n6bMuf2rB
X-Received: by 2002:a17:903:3ba5:b0:2ad:cf11:5048 with SMTP id d9443c01a7336-2ae2e41917emr23463185ad.22.1772189496471;
        Fri, 27 Feb 2026 02:51:36 -0800 (PST)
X-Received: by 2002:a17:903:3ba5:b0:2ad:cf11:5048 with SMTP id d9443c01a7336-2ae2e41917emr23463055ad.22.1772189496019;
        Fri, 27 Feb 2026 02:51:36 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb757a8dsm73721885ad.40.2026.02.27.02.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 02:51:35 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
Date: Fri, 27 Feb 2026 16:20:55 +0530
Message-Id: <20260227105055.2364348-4-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ofMiwd2mP1DvO3z2_MSv8hAPUGRdMiXl
X-Authority-Analysis: v=2.4 cv=Vtouwu2n c=1 sm=1 tr=0 ts=69a17739 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=tsrPtohBIDvmYb6t_YsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5NCBTYWx0ZWRfX4Sth68GUtmXH
 I4x4ZjEle3PxF1Rpo/3TkdbUfqKYcZVzLEZN29XWY09LaFS8qzmsGo5G96BaMy2v4XQYePGCnVc
 LrYF17PeCqVcncn9Esy7AScprnSzR7dPfSFfPpCJOa+U0aprVx1el85K0zGw10kqYDH3gnIbHHm
 5ENtr6aD3VczPGLy54S5NNxwtDEMjO3a2lkCBq1qIoKR/iFuz7rljWqJcC4ZjC+0xOZaIsDgCoJ
 jDeawdYhFG28nhiWWTP82RkLmZ24F9NQoGOxPMw450P4t/2BCwdAczuClNb9WG0Db+hB3amqlXn
 McL0DWsuRJAEpcXH4fK5d8XLMLp4+sHSD0ot0TOQcW3rRYRPiFWrcImTxR+iPVR2DuEle9qY0px
 RGv3aQiu63QzT3bspQorysEiY8g0uPZFgZ7jgCajaodGQGOv2dN7TmPWW9SzdqV7B4qhGXaWSml
 Md55LU0mTh3z8SBV4DA==
X-Proofpoint-GUID: ofMiwd2mP1DvO3z2_MSv8hAPUGRdMiXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94433-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D70ED1B63A7
X-Rspamd-Action: no action

Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay. Configure the corresponding VCC regulator
parameters to support the eMMC interface.

Additionally, disable the UFS controller node. The VCC regulator is
shared between the UFS and eMMC subsystems; leaving UFS enabled while
operating eMMC results in power leakage on the shared rail.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 ++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 46 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index c86242a1631d..1660ed89fecb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -50,6 +50,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
 
+monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
new file mode 100644
index 000000000000..1ced916247c1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+        vreg_s2s: regulator-vreg-s2s {
+                compatible = "regulator-fixed";
+                regulator-name = "regulator-s2s";
+
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	supports-cqe;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "disabled";
+};
+
+&vreg_l8a {
+	regulator-min-microvolt = <2960000>;
+	regulator-max-microvolt = <2960000>;
+};
-- 
2.34.1


