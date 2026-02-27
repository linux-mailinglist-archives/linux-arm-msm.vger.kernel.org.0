Return-Path: <linux-arm-msm+bounces-94427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD74AO5woWm6swQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:24:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E481B5F83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91CCE30318AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4203B8BA1;
	Fri, 27 Feb 2026 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iK6+px+6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fm9X/g1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F16930FF36
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772187880; cv=none; b=DijUPTV+arpU/71nfyb/hTQgBFeec6yM2fjKFQGWMvPH0iqN5qxliS4w4KEkbW/mlA3Bxf/YHQw4A7tD35+7Ogix3JjIlxp3/wBu35rWllUTt/orPPI6yMTztVq65xBlQ8uvdlLlqARg3btxzv2HWAeZLcDOLKr3Q6E2yItbHDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772187880; c=relaxed/simple;
	bh=Cu0DqKhNQLFER0L+/yaDNNnJ3JVN/tq//cgEtUCr71c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AoLzPBEGTUvYerGgJofxzxt4wtTQHoW24ZoLAWWZ81IsYhgBmY6+R47wEc6eTj6IBioQRKAew4g/BR/2uqzt/YiJT6K+Goe12wiK0PgiixIqikcs6yvB5E1+8rkvQLacVZ5nPQUMqhugmwlYkebHzwLE2u1uFZMqTDxNAnagth8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iK6+px+6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fm9X/g1F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RACEMD3762550
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J+LdOGeOg3S
	DZDj99yfmSEd4t8qtfh6HH2JNba+pZdU=; b=iK6+px+6USqENEWm0MqIe1r2HZr
	uFTjnxcU28/B/ANXuO2EHIJJVG1NqXVG/bykULsGkNGOAWOHTxrnndI/zRENFUxM
	HqSws4zhabE1A4reN2LPmVVBq1vP42lM9BIXATKSPp8MRWN/lF3BZm+LkHOlGfKS
	W/fpH4YJeROelSN0vC+PquyV1hm0jyp/5VZ7yzQMNuDYkVU6Es6qarm6lmr2ux6X
	rf78XLdJrDF32h//bPmcBW+dHf4OQ4QqDn2qpfaQF5Un73pApvYocJBKGbe12Iq4
	X0Go9UXJYSJainZe96928LO27Oc10tf2MkfdvrF5bCH/v8UwO5oz3L5NgGw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7yb5u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:24:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70eb4d56fcso1166253a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 02:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772187878; x=1772792678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+LdOGeOg3SDZDj99yfmSEd4t8qtfh6HH2JNba+pZdU=;
        b=fm9X/g1FD+GpQnYelmYXAFdtZOQ1djrgklW/T7C1GnLr/z1wwLg+xopFHboc0z28WE
         +u7VuG66JuvTGNKsMM2QRmWSHpSypy9ln8YxAGeIqw9Oh2uITYE9iSmI4VIHe0MBedCr
         yO/rrcWQWE3umIfCvp+/XO4BvPuM3HznMxVGcXfli5mtQ7PzM0r6J7M0VBP0PHQxTzaa
         R+2/HQrd0MqlfIHFUR0FqF4jYNDqyUhEdUIRzmjLUkIETp5Zi/zy/yCMSqQ5wFSW1yCs
         ll4e+W/BJ4XRDg3iXqzpmeeMhqATEWYT0AdDRSeMFNYDOoi7/tQcKbqO/8uT/inZZfM8
         pdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772187878; x=1772792678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J+LdOGeOg3SDZDj99yfmSEd4t8qtfh6HH2JNba+pZdU=;
        b=qoPf8Q9i0fzcsU7v8FH7JAiKU0N/kt7b2pyBFJt9ysrjXKxcVmowEiu97FK7h6YgVZ
         W2Oa7ARdlWnVPpH5ubGxBYGedvn0GZVXb/Up/9l5TMFPV5efBV93pvqlxq2Wa9WKwKQL
         ByHfOaS2IF+oFrQFqVOKiwGvUN2qfg/9JIDrRIrcORktllgKezPNnXFuR7dLX8gfPaU9
         g6tBW5l609zRPUF0McxsRYEch3e1cPoOpTvJxILa31cqE7ERdukfVkC2a+wCqwPVgVrO
         ETXDF+bk983Fuq4SQqP7MBmZ/CsBr6s1T1qPEs7Segr+dhUHGglhFCyVGWtnsMaX0W7d
         JHDw==
X-Gm-Message-State: AOJu0YyHxLDSLvxXSk2lYpBAb56KxcmOLr2GkwQP3qeFcVBsJjgBbtml
	cQ37nDHexGlKvq9ja6M/58k3lkjRBaW5+U5kE46dA3gWWrEVCu2ZttfPJ5/Mx8Bjx/qehC2gDyb
	3BSsEqM5sCsqZgLwmWl6TLv5sSZjWqL5l/NWA8l61gVURA+ToB+9UUtKN6HbMWpCv+K3A
X-Gm-Gg: ATEYQzzPd1ocqK4NoZmZkSRetmdGebOQhK9J7pkFryOR2yiBzRMz1dshxBHyaWYWVpH
	tXuedFluAVkgopXVPCeHBR70wB+DTDYc4sRmvxztejLxN+bFNEk5pWGj/SmWiWtjf5alxHFl+c9
	e+Uw5BVe0eQgYuToHOVks2Kb3QeXbk9Qyxgbw3oSnvGzYlL3TQy/wwb6PM7dRwu21TGfU6+Ex20
	Sox7vpPVBoVyKjiteYzQ5+wnrqk/qzxR94yxzKlDtlfiN3hLYXn1BKo8H0JgGAQB9LP0vQYaGpc
	bdyQ/9QuGv2b8WcFe4PpuhOI5jSM/z4PfEf2yC2/cuEbRW3lG7O22wVN+rw5Qz19aw8CPdqUU5f
	BHqjQiMCEBlfVLAJu6DRtWrZ4hdgXt89yXgrhMrko0j46WakbV/OjNnbG
X-Received: by 2002:a05:6a00:3d12:b0:823:1406:8797 with SMTP id d2e1a72fcca58-8274da12bbbmr2181221b3a.31.1772187878138;
        Fri, 27 Feb 2026 02:24:38 -0800 (PST)
X-Received: by 2002:a05:6a00:3d12:b0:823:1406:8797 with SMTP id d2e1a72fcca58-8274da12bbbmr2181189b3a.31.1772187877629;
        Fri, 27 Feb 2026 02:24:37 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a0299d9sm5350234b3a.51.2026.02.27.02.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 02:24:37 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V1 1/2] arm64: dts: qcom: lemans-evk: Move SD card support to overlay
Date: Fri, 27 Feb 2026 15:54:04 +0530
Message-Id: <20260227102405.2339544-2-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: pE7GBzfb6GaAAI2oyD_yPXJVuiTFXNZ8
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a170e6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SHdjWYHVZS5j3GEiNv0A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: pE7GBzfb6GaAAI2oyD_yPXJVuiTFXNZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5MCBTYWx0ZWRfX3aRiEAPD0mVJ
 lmTgkGarSq+1VwEuaAlL4P2g0IWCSSXhc5LnfHj4A8fS+rwyqKJNVzWOlVfY7SPL06siY+thOlb
 g+CTxUrJeFl/mWzy1z6gESwpzs+vRx/aNSPBt0o4C2G+jmJIA0M4545NbqgpkzMFJ9Iw3JKYVWc
 4xFPZ/ZlDV/xkH+4WnxCcrxNyFxfMvMkjEz18kTxp6YZghbCHWPzurBKyf7Q5/yFHhwxrBQ8NnG
 ZQ9FUzZ7YpSpw3uaoydQY7wvF864M4Tg257/NBCjttn0pF3BOAsOl+YxCkBX66kDerp9YZjhx0l
 sTzcGs4opDfWq8Jvh7boYO2q1XtTEK09A4FUDlU2QXdzQPsMS0Pt7GmIMwUM+BbZmfgTCuM0S1D
 78yEvuMyqc1b3p05T+kncVIT2cKTyuPcrSD6mnAECVQOEwkchCseGnHKyQprZX4Y92w25f+Ms65
 2K1khCIQNu9quhpYK6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94427-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 24E481B5F83
X-Rspamd-Action: no action

The lemans EVK board supports either eMMC or SD-card, but only one can
be active at a time.

Move the SDHC node for SD card into a dedicated device tree overlay.
This decoupling allows the storage medium to be selected dynamically by
applying the appropriate overlay for either SD card or eMMC support.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +++
 .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 ------------
 3 files changed, 28 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 317af937d038..e5ea8de55df7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -35,6 +35,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
+lemans-evk-sd-card-dtbs := lemans-evk.dtb lemans-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-sd-card.dtb
+
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
 lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
new file mode 100644
index 000000000000..007ab6347349
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
@@ -0,0 +1,25 @@
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
+&sdhc {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 90fce947ca7e..7f10f312b7e4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -751,22 +751,6 @@ &remoteproc_gpdsp1 {
 	status = "okay";
 };
 
-&sdhc {
-	vmmc-supply = <&vmmc_sdc>;
-	vqmmc-supply = <&vreg_sdc>;
-
-	pinctrl-0 = <&sdc_default>, <&sd_cd>;
-	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
-	pinctrl-names = "default", "sleep";
-
-	bus-width = <4>;
-	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
-	no-mmc;
-	no-sdio;
-
-	status = "okay";
-};
-
 &serdes0 {
 	phy-supply = <&vreg_l5a>;
 
-- 
2.34.1


