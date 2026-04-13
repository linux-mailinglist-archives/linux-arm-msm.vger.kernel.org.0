Return-Path: <linux-arm-msm+bounces-102943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IFUO6bY3GmcWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:51:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD693EB8FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 402D93043ADC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48663BD62D;
	Mon, 13 Apr 2026 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuzFGIhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwsG1Dr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A53C3458
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080921; cv=none; b=gjX/SySJXMayrvQuBUNZ44VDcWm8qK1BPrdkA3QfNOqgvb+9kto524oNJcxia1pD7e0klYR/mPRi7qYSLYlQ9lU96RVU/XqmgsIKTQGlc7+XnvzkcEEpqP/6xYjU/MbxWRFsJ/PJszOs0gkxXnKQ6WsYHXz5+Fm/XSgLscvmf74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080921; c=relaxed/simple;
	bh=X1wjjd26sl0ymy8rlRcdia8IuyUNa2lgwSQjUBF8VxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GqI1EyeuRqwTll3qfK3ms1PCx/5YmGuGdF4gABc+0AR7gVBxUZRUPitZ9aa+lB53htcHE1Qo1jsXEGJhhwvZBM1v5QKl1z3arpVUQBPOfL/WYzlOGX0lS1jKTFNdIaEySUMMjVmhj/2bgbq2HiBy2qp16XckIBYLdxDXXxEXdwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuzFGIhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwsG1Dr4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6vJC2206759
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yyZ2p1/F48a
	Sx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=; b=WuzFGIhAgzaQlgokjgvr4HeW3hq
	0zU3VzyqW2np2uYo5AwNqLgMt7IHH5JtD95YMfL2iakAPbFa3bimFcSzDqH+rqqO
	EtThchMorTdG/vjPwbABoo4O+zI1+FXJoWxGHwysuBFXAVUuxwevIdPp23EafoUK
	pPtC4WHVL+n4ynJArp37YQxyz1a+tyzvrOgDC+ev6gLVmhUQPhgFDX8GzROiXmn/
	e0GKeoAtdtbWrjNfswk+OIjxZ3cc/ZMYUyIH+/pvjvfuMUERrcZbz2yLoAONEIeC
	Mhc/g74EW6kvnviR8t9MXhC9P4eXehnML9vZk6ZuptpkyxPxIJUHYUdnpNw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhw31k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:48:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3547c799b27so1741929a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 04:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776080919; x=1776685719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyZ2p1/F48aSx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=;
        b=SwsG1Dr42WPeH9//9MOgE2mYrsP7k6InLfq6/qKGxhIJLW5ZdQSsVsM9cZdbV/B6AH
         kA2rdEb1kZ8kjRpDynd9yTLMBjCM2nw6tlaFXoXVI7V2543bgbGfO7A9YoR9bZQiBn5X
         qgOADaOff+wFGBR9ilxo5mDP02q6+lDq6pI2P4zeB5XiXfPirSDTNyzzh5so8t99s4R6
         e/jTa7XV8rOV30DO70nC0YGvHdCT8bBqnI+CuybNQ6VRALyJP6VKUvQdWTui7riFHD8Y
         KaZuh7vwQkXzF/r8Llp8Mmjh5wsAwQZoc773ko14Ziv+wCGproj+cJFvc91TWRqIM9oT
         qqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080919; x=1776685719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yyZ2p1/F48aSx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=;
        b=olXPaiBzJ1RTGTye6i1ELDO8GZEhugX3kAqeVzZoOfg00fHLw7sxh9Dlm30f9HOZDz
         fFIddeCflzQ31DkgrErMTh0SK1xb6Gfy7zg8KdWO8lAXudVmB2vXdYN8dS1qx6fO9RAy
         2rJVrAi7F32qHHL7tdoTNH3yo8OVbRtSim5a4KYXlT08hcB3QQyvbzWQINLa9fJj4oPG
         F1BQQJb/pH+tBdpF36dMiXkwhA2nGM8hNb9w+o3nGeTdKkfTLWHxAYagQleRjGWSDvgc
         L78pXANS4Snf3ShSkx2c0Hhq07+hTJZjgXw/gg9+914JI/9NtjUslakbuTYrNNjN8Utd
         SDqw==
X-Gm-Message-State: AOJu0YyEQ0TpP13oX8X61pWW20Xl8tXzERjZb+S3F/wycZe9G00BgRmB
	/2c4YfQIcfCMtb1sC8UDbPE4sPnWw0tlvvfP7w14ANNjJF4MIpgUe3F1amqMqQ05hpeUX3TDye7
	mSUT1s16tv9ZYegDjIURhE3+vO+DOG66uG/HDfKqR6toyJbXahdzNM0bMNJ7iXFlis40f
X-Gm-Gg: AeBDievILiu4MG6Gw0VvBGnY1tAGB5IEvXpIxI6pcKHcLLb/Fg44d0aX9pVxQxfr7+4
	F1n7KdaFrQu93MPbxX+tI1r2mHztF55dMNaBD4UUXw61qPFuWs2iAhyo5WgQAyI225QabdW7HXu
	ONL9CA63azGQFLvVxG2aM1rPvnRU/FkQwFfG4jOtZNiS5IZokxtZT3PWEhsutNpqXjsF+GcR3CH
	qAAXgmfQABQ6bG09CH4N/lKFebaL44AZCOCU/8RePBZYNLFvrHaBmZCOPVSsj2zLLw24+3lbyCc
	0/GSx8YtRjjPasfrCti4Oe+vdEjxxIr8l5AWPCZy67F1YaOEITEO9kWgh5dY0d3kBTMNBL75POs
	GfmsC5hLHkAYczVzW3u5oCNKWWi0C+pJC0frDlvbEQoHeB5TQhvRQ
X-Received: by 2002:a05:6a21:2983:b0:398:a440:e3a8 with SMTP id adf61e73a8af0-39fe3793d8emr8019061637.0.1776080918866;
        Mon, 13 Apr 2026 04:48:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:2983:b0:398:a440:e3a8 with SMTP id adf61e73a8af0-39fe3793d8emr8019043637.0.1776080918447;
        Mon, 13 Apr 2026 04:48:38 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a12adasm9822453a12.26.2026.04.13.04.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:48:37 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: monaco: Add monaco-ac EVK board
Date: Mon, 13 Apr 2026 17:18:19 +0530
Message-Id: <20260413114819.3894307-4-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413114819.3894307-1-umang.chheda@oss.qualcomm.com>
References: <20260413114819.3894307-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExNiBTYWx0ZWRfX1IfwpOdTf1oc
 nxrLYm4zWbIEoEguYyYU14El1XiMtTR2cKqy0maiqRIEW22FlPxzNEsvxsUhL6rb4gZQFA6gNZp
 eKPrISYB5KOUyXOc9gbVgT8CMj9CUtNJwosS2jMZRnLnjKU3SzcyG1nFX/E6zOnJVmudMDZP+R5
 juBIM9KAB3+ZS/7/1N7ZPtjPPMcgkds8wFGaKYijmK01a0ACgdZWoPSenBIACe//rK1z519EM9l
 GL9QyazNW1qAB8FbBp+DBrqZ/9iwSTvsq95GuoL5S2kD3w+pzWOSlNtNUcNL/2JCLqV3YiMeGOD
 w5xoWBcz37x69hHgNqZa5QkoNPk41vDrZqF7QZ3iYX3aEr3dYrbBM0xZ0xNnCSASUawB8mUvBBP
 xK9Rb/YblaB4DdtF92rmhfVLU7eg0KfJmrxtqPboLTlVT6xE3Ax/Ya/F4quBe1NhbEuRR62m4fh
 OBCmT/4od8DYDViDGDg==
X-Proofpoint-ORIG-GUID: PTXbsHZxf-Ycw5HSld3KZI8D9xTSJAKp
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dcd817 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=O7TEEOfKfJVoiFKcZRIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: PTXbsHZxf-Ycw5HSld3KZI8D9xTSJAKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130116
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102943-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CD693EB8FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


