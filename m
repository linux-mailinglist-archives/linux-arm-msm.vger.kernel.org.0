Return-Path: <linux-arm-msm+bounces-88206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41455D07ABB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2776B3008F5C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EA72FBE0F;
	Fri,  9 Jan 2026 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFsVvqex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFOgQWyW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C562FD1B5
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945617; cv=none; b=SMRvCye3kGGG06lAyg5UdkjjKmQgNf5zx9adXrMtaVqAqB+If8BrERP3k5MIbiHBnkdu/8z7GilRBCzANXlEEeS7jr4mLg+6slDgkzb0kNL0jWcnnsj+Eyt2pVCDrHmAajs41e9SEtYfufxNIVoPxk0LIIj7foWwRWxgUz3kTB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945617; c=relaxed/simple;
	bh=TxIABztGOxMCT6KjlGvBhONzbwVAySlcD5Nn1lNtVWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbgz5K2WfKqzEjHqRkKLJi+g5Wzpvj7L13WCx3N51ZopAIJm3gcu6K0F53ebVHH88qMzwBGNJm6FzMokNprGCVoI3/CrSPE3k/AuB7HIlatt0UMrYKa3H6mOhIbDTmT8suBT26AXR8Lv8com3cQA58eoJT6AW4Wxh6nIZkW9iFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFsVvqex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFOgQWyW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095mHbn3019005
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 08:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ml4IUEmjn59UwQP/YRggnWXAhMe9MUXbm693jybTycU=; b=bFsVvqexIKnW+tkL
	1vwDOl4F9aOFImwr59WIy+unoBBAWWIatE9+pIHeUJ6CNwojITkBWF/th7B6pTAU
	XOCl39vW+8vCJLdLZecdt4/pbu9Srx2TU2jdxvu3R5TaaVQ47KVBhPrS49Hi14lG
	mQnIp9OIeTERdbFiZhebjNqOgoTf9G6DYVXkfzm7bLoI1xdnVdIgFxmGv9yLoIn4
	vObNGfKqQQOniIKABLzJk+Saa9rohblbv3GPHCUVmN+Kp7LvO/DWRde7bS8z89nD
	8dnARvyNqd7kqIe5zVkiv2xhfyScgzKqis0cmN3p/zfQ1VMPtG4gGt7AJgC5T1JB
	KqR99g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3hu4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 08:00:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a377e15716so85070505ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767945611; x=1768550411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml4IUEmjn59UwQP/YRggnWXAhMe9MUXbm693jybTycU=;
        b=iFOgQWyWrUGzMvPFvLs1oNdJOzedxt/slEa0UodtOP5GPQ4Op5cpZuFQbRZDEYMH35
         5VDppcBhBio+cyFYu7/aa+yVzE5PMSWx3V9KInQW40QibT2KMEO33COHYw5dfmyFiHTV
         KcKiQAMtE6Nqkfa4bDdkTgvWJjKlv+8fNBbUNPS7OuIp9FPwPy5wmU/ny6Peq/qyrlv8
         Lh2WJoLllHwUuhS3IDmXZ9yCNlwX0li0WqBf5GAlRLVB2bwMDedQY5KPeoPKBGRsN8yz
         3ekih/kOO9OgZeL7GM2vLNnjID6L1ZaHnExjXFBAjMiVXiuxlEH9HTgP2iVZBE39RNFh
         SAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767945611; x=1768550411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ml4IUEmjn59UwQP/YRggnWXAhMe9MUXbm693jybTycU=;
        b=QziA5717L4b0r1U+to2H//UCYCHWmA1/CFMYNidsm8EIrXdj2JtBVkCZdL78KQBFL6
         ynI2y6tAyABaGrPvlp9HXxHLSnDrLWutyHqFFYurp6Vjw/4iEuw+0BWhPtGrU3xs7nxn
         WojHx95+nLGpYrdwjVHqiGPtRve94hprMqPL2+2HRDiqyi3xjff9YtAiPZ6zsGSg1blk
         HBlFPcE4lq5OL7I4NKBxcDBrBpf7Sg7DYh3pW/I2YNLjAhbCAl/N/YKuTLgQoVFU6MzD
         3s34g5vIQHp3cpOsqS3yfPFFAfq8X8pjcw2Si6JjbEm9xboT/Hy0ULdnXhbB9+kXOLcZ
         W5gg==
X-Gm-Message-State: AOJu0Yx61rx0JG75F20gaAXFxIVzd0cEvk5EaHdweIA9c+XusDvfUSzQ
	3Ib8UrWWVgUoluZSvwg8GJxNFb5kl6sp4RbYKnxAOG0P++l0Fc+HNPCzurfx3etiIRe4Dd9NZGA
	K27lIPEAK2y0P46gunMC0urxgxOGmK7rjGSLPgMGKUUf3r4ZTEvu5OW6mWYLzmuH0kbecIe7PYw
	QmvG0=
X-Gm-Gg: AY/fxX79hgur0vZg7PQQ1t78sqxLskwrIrxz2cZv0RPeGcH8Cy3lE/3f5r2WJXKtN4h
	XouN+Em6oNw3A+ahYOIx4WUYb7oHFoJS7nGIYdghuPpf9CgYnC9TfNialQWzKxO9BAy9ZR+mL+J
	hCTf3+2RlvYKm++RAOr1iEY7eIGwyW+IIqEb27XN3VONC4xvY55z1/7SCq1ww414Zf9RR0KVxug
	O0ozCb3LROZGZXhjG7rJSRRe6INlD6VO09JVH1BszU5EOLE/qpzZI7KmjSQ6qeI24VshTxM8HYi
	PEupOf2TWCez6WP00IU50KwypOCJw7tN6RidjxasTjwDyX03+ZlR/UyUDi9NLyi7mO1nWFEQ9ef
	lZlMM8SIYKd49f82BO4/JlcqP/sSiCV11IVZAfy0eVcOcbSjPWk/JfcqYcrTTY/zT9Jv0fSswqb
	k=
X-Received: by 2002:a17:903:32d1:b0:298:3892:3279 with SMTP id d9443c01a7336-2a3ee4363abmr88140835ad.17.1767945611167;
        Fri, 09 Jan 2026 00:00:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEO/Q/HCc6sRK8eCIon2vdXEafi0MIZvoT0qCqqlDk72otebFrx2RXwZYT2+zdvPZ/+4Xv8qQ==
X-Received: by 2002:a17:903:32d1:b0:298:3892:3279 with SMTP id d9443c01a7336-2a3ee4363abmr88140585ad.17.1767945610695;
        Fri, 09 Jan 2026 00:00:10 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a56bsm96808445ad.20.2026.01.09.00.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:00:10 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: [PATCH v2 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
Date: Fri,  9 Jan 2026 15:59:53 +0800
Message-Id: <20260109080000.606603-3-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YAMURfiLSLcSvg_wJFi9_Uoz_2Nqa2MI
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960b58c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=93V5M4jBH0hLqW-x8QsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: YAMURfiLSLcSvg_wJFi9_Uoz_2Nqa2MI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1NSBTYWx0ZWRfX758K7oHKJpKw
 VMw65Yje3ms/nfw5rcaFMd++fQ+GF97t4PipKgK8iuA9Dlxuxft9Z9WGDHGTvaN/5PzGYBzLjBo
 fsetcQ+KU2oq9zqk7BJ6S2UqYaSr2j36vOgJWS0bzGCXij0f6JoloGWKtoT7k0bgrM1hi5KU8xn
 m8XRi879IuizjqnmJqfl1WbJi63vAnxiz347O0YTMUPonGdfYj++DunXx2QzuAah8TNilXjAQmQ
 CEM+V/PtGE29Zb9EVZ/IRE9EWOmaK0buGUnEWL3/NAbYq9dPqvp1eHmPO6SJVE53HBLJ8/2j76G
 dlxIrg7j5g8Sh9YitEy/gHurpC/iVr/syu5qnzF7jcVLIHDrMzcQpzwCDJ7v7LArXI3H/SlGQTv
 7iITssYyz0sQ3H8/qK8QlRdLPPiiLwnytRfv7Iohm620p6+7LwLoRkdt2S+pUQ+5AsfI7JR5SJD
 1yzl3IeZY0rdNhZv8Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090055

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

The PURWA-IOT-SOM is a compact computing module that integrates a System
on Chip (SoC) — specifically the x1p42100 — along with essential
components optimized for IoT applications. It is designed to be mounted on
carrier boards, enabling the development of complete embedded systems.

Make the following peripherals on the SOM enabled:
- Regulators on the SOM
- Reserved memory regions
- PCIe6a and its PHY
- PCIe4 and its PHY
- USB0 through USB6 and their PHYs
- ADSP, CDSP
- Graphic

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 .../dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi}   | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 copy arch/arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
similarity index 99%
copy from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
copy to arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 4a69852e9176..16f11a81163e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -3,7 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include "hamoa.dtsi"
+#include "purwa.dtsi"
 #include "hamoa-pmics.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -378,16 +378,12 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
-&iris {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
+	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
 &pcie4 {
-- 
2.34.1


