Return-Path: <linux-arm-msm+bounces-104773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMPrCVmY72mLDAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:09:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8A7476DBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E11493095BAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67A5339708;
	Mon, 27 Apr 2026 17:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSHlD92f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUx5mHxi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8A53DCDB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309526; cv=none; b=SJlndvCobFdCo7psCKZmOzoGGs9EOrE5M/n09gRQTEYaxlxzXTQEIGUmIvp9JuQRV4YWIRvNJ8ISMtpVx+r72MJzpCl/aEsXJMIS0FmmNkKkXS67ZvDOkuw8F1LdtUcWRezVSmptCJsXfjLRk2vqMVOASkpznU3toWVDtO+4crs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309526; c=relaxed/simple;
	bh=X1wjjd26sl0ymy8rlRcdia8IuyUNa2lgwSQjUBF8VxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uCrPNkvQfff/UGX8ukrpew0lsVJENSWGLm7dlLlA0xR1oEDm4PpILu9ASXhVM9U3L+j8mTcm5DVRBjaALIIgcGnPwe8kn9Eh9ku/i6Pmc+1ATBV3Gwyx7sEmnmVpi/oJu/cOkrqeP/tizBBgdn8iQ8JuVLKFZcuD35eiPxNuZKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSHlD92f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUx5mHxi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDrHax3961889
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yyZ2p1/F48a
	Sx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=; b=QSHlD92fwVP9/bjwMJEWnPgKcMN
	TeCZ6WcLktUAaHR60Z3nuqOj81KtMTW56IKhS2PdD58hndzvM3SsGWtx4gFKQmNJ
	ugqR93mdn7MeZKekD0Jqt26U3y6Yh7rYJ8YOVgujvekvXFEGf+jX7xO5PQXtei50
	MB9Z97OwGEXPmjkcP8aCYBUs6VB2SJqeBi3UaayyrDzBRO0lgiBbTKxpVpiKAq08
	QCF9JsLdfKXHgUNuHUFRzZjLW/8NAMyqq6Q+UvX8Ioj5+AY6b0CGQqTq0dHgw4QU
	8mGl0H/9fSGRpSCbxGvjtgMys+XW7i+tOr7xUOIwMBiI+R3TodwTedCKQ8w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k323vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fc7ce432bso2532734a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777309524; x=1777914324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyZ2p1/F48aSx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=;
        b=MUx5mHxiCWEAnolkse36XT7T+aqUEP6dUbW3CfC2nJ+HbL9iav8TQAF3VO8zufQfOC
         bWUu3SsDu423FgVRxapFZ7/SFbJhQpkOd2Boi3aDqvU619EAEt7VgNbTp6lWiwcRcA85
         4iUSpkLTdOQV1S5+7/4YHZ9M6IrUiMRjHPRwIeflO5Gce7HKWrz9Tkadx91Ufom0i/4s
         n5eu19Al95DRLht1C8pnqB3xKm9dc21eZ/jYx+JBzpEUJlbCKfy8jx9FNk07EEov8xSm
         JC9XtlLrUTdpaACKQyYpZDQwXNcv5xGiQfP8iiuhc5OFQ4tVxTX5KIORHY/2aXCzb/Mh
         +Y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309524; x=1777914324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yyZ2p1/F48aSx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=;
        b=HVTgOjGmO/wvQQXyFCI2khmae20hsToHya0hTLMjA/U9fNon7pkYG2EIRxgpkYH6Do
         xtofn/vLoYey3ULauCK3JXSIALfJQXZ7Xl+0D4Xn5ClSe0Ns333VQzDznFlcoOpoc/un
         GSf2ehqFlzWViNDR/Ye8vTD6z+frF2fSsojh6aRW1yo8TyHbe6pjVtzQmG5JiSf6BD2I
         E8zkql+JNxkiRgXkb4gueL3/4qAFZxp+EOkO0lL8uKKKZjU6pGppLSmfKabVpU6SYqT3
         l4aWkZC5bDg/Tl/+M7OmxCax1P4VJLqktKRRXg1090U9DqLd/sRTOEyDUTgR4S0qoYnJ
         v7ZQ==
X-Gm-Message-State: AOJu0YyK2NnFnmJp/nT4MqOWzykdNU1cgNqhPDi4VDSmfpSQGi8QpQNO
	GENjnG+x4RajrVKALbPWmRRWuPSQJklbqSvE4+jRpa7QvyNo/M01cgQf0ih2xSHi3J+nvQgyNPu
	FRxQDBSucLDBbRRZ1hU0odoojo8y0XRmy7P4UckHLAiPTGwv8Xfcde1jbMByy/QglTRAz
X-Gm-Gg: AeBDietMwcVTtaM+2tqRFNR1FGx9boMsTRFMweR+E2M5+hfB3RnsBtPQTN4qYGAYHSp
	NRISF28Tgu+6vnFlEFR6ahdXy+t6yP2D2KHvUmHT7g6FtM4LZahYUfAQ0TH4ZXASqwpYKfXBlzK
	PyNaDH0uIez+geV/xR0qSr7O+oZkpxoHLvN8siMObfDhF+0+W2PHugalD0QiKon9ld6T1RJbADM
	cXb9xyHWYW2NPMvhes/Bif0MK/e4oJ3IEZzf1U3InLZLwcpMF2cTGK8SJEJcf0EQheBtxSCcQCI
	xT6F5xGnF/6ANBbx4luC9P0eYt+nN5EYjJHXquJ+8eNxu/5pkmMPx2U7gsgzwDuegZ24eGi7qB4
	Kcey+H+TS6fWMCTBnXmrhOpYbAqQf306qTEuLBXxRptZzBBs95sPMOCPihn7wxfY=
X-Received: by 2002:a17:90b:3d0e:b0:35f:baad:99c5 with SMTP id 98e67ed59e1d1-36140373c6bmr24450699a91.2.1777309523417;
        Mon, 27 Apr 2026 10:05:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3d0e:b0:35f:baad:99c5 with SMTP id 98e67ed59e1d1-36140373c6bmr24450670a91.2.1777309522575;
        Mon, 27 Apr 2026 10:05:22 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490025d98sm99313a91.4.2026.04.27.10.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:05:22 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH v4 3/4] arm64: dts: qcom: monaco: Add monaco-ac EVK board
Date: Mon, 27 Apr 2026 22:35:04 +0530
Message-Id: <20260427170505.1494703-4-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4MSBTYWx0ZWRfXyG/f+J8iI3Wd
 57/Y80uPnJ6ZU3CqZtnMohTKUe/UoENLf8OtAp/zcOSy72MWqDYxSrxxZ9KTdLzCqqDs2P6Ziti
 vYMfS9f5HY+XAxS8vaIWnKvKa/fTvPAHEv4AJL+u+2YKl5tBUeE+WDjSxps6B71m1HaEtwvoNQK
 xsyO2LomCTopuS5Z3aZYXVmn9feiDuY3BxHLzuzZ5kzt2FziFCfoRa2UhhgBdSqCV1sLZWUmNRQ
 SM2DZD8qQcsMETPyN+Ar7r84FjyD0scv5kW0JAUPTeCVAbHDETrLCOBkroxY/kUetqLrPAyviwS
 TyyY/grFzBj5aNPJTL7ZNgY0XVsmZS6NejnLABmJiU6De/qEp/fGr4ccI4eaXmTNJlIqnmSik66
 aMGCut3ARgyIQCUSzqcIzZrmcQCpbm6V5RN1yP7hv4X5woMsKFOIZLxdgIllwkWzuKbvmmFuRJ5
 9W0MbyEDgVkF64FHfKg==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef9754 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=O7TEEOfKfJVoiFKcZRIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: HnjI4PoWfhvfpC_E3bv5YUKN7Js9kThL
X-Proofpoint-ORIG-GUID: HnjI4PoWfhvfpC_E3bv5YUKN7Js9kThL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270181
X-Rspamd-Queue-Id: 6E8A7476DBF
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-104773-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Add initial device tree support for monaco-ac EVK board, based
on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.

Compared to the existing monaco-evk board, which is based on the
QCS8300-AA SKU and uses a four-PMIC power delivery network
(2x PM8650AU, Maxim MAX20018, TI TPS6594) to support higher power
requirements, the monaco-ac EVK uses QCS8300-AC SKU
(with 20 TOPS NPU capability) and a simplified two-PMIC power
delivery network (2x PM8650AU).

Apart from the SoC SKU and PDN differences, the board layout and
peripherals are equivalent to the monaco-evk design and are reused
accordingly.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |  1 +
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..852d2b86407b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -57,6 +57,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb

 monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
new file mode 100644
index 000000000000..6405d1e1939b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "monaco-evk-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Monaco-ac EVK";
+	compatible = "qcom,monaco-ac-evk", "qcom,qcs8300";
+};
+
+&apps_rsc {
+	regulators-0 {
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9a: smps9 {
+			regulator-name = "vreg_s9a";
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
--
2.34.1


