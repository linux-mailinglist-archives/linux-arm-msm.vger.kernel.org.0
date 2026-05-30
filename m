Return-Path: <linux-arm-msm+bounces-110411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAp0D40uG2qU/wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:38:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89304612209
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76259315638D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 18:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6033CC320;
	Sat, 30 May 2026 18:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etnj3zXr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WdYuPS66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442753C585B
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165725; cv=none; b=i3mVUBBQZg/4nI0NSJeAdMEDup4B1piK1HRy1Zj3Vmk66OZRdx25tl/27i/jdoHWXs1eixvicoL/5fyNlu3Plv5mNTOM+lcPwmpcWUwv1r2KFulnVUkTgxAhNAkXigS6p4pcOmTeKxt6vHSH8Fjb5fJob5Bb+NU3a/A64f49/pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165725; c=relaxed/simple;
	bh=vtH/fYxHW/XKO4yiyG3ZciHyofKNFTseYo3IhGupIUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUFwOD/Cv3T6/qYCnebVd7GOp9KXrFUL9bNYtw63gYn7spjgwLS/Kf6MEvLP+8U8XvSCHtpfHuy6FImucTZJBkBXAea1W9akq6IwRqirWzjGgGViJnhbS/d0r3hIlZBTYfn/P393/gv4YpnfXR0TFkAUpEV2ddPf8AiCF7BzJ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etnj3zXr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdYuPS66; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOkHA250576
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AR30QZHv+lLBWravcP8qPIk+O9IcqL2hfuXUPlb5+5Y=; b=etnj3zXr3n4WlQU/
	UUIXDTOPb4JHXAtDV0Ocj7ekDGPLJlW/60mhQbXmBRIPlKcAew8mnWyaapXhqWWu
	GeUFToOaYXnyZmxqAyzpSJOyjM2PJnDwp884ITb47SpRLIhhq3FlSy6cSwFWlU4m
	tmP+tykjbbHq2JzCWLk65M00uUcJYTzoQRjXULfpHxYLXxrPbnqsbcRH0Yj95R/7
	1pvWRreIoNHrla9yFjtvhNvNYz36StDkqvVCcym5WkwWi6e+Rulc1JDgtyM3+YFS
	o/Yn/xuon/6Fm0yBWUESqriakh/qhU4RrD3wxHE39w1mmduA44M10rzsClmyGtND
	blWCCQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux519n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so9052185ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 11:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165723; x=1780770523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AR30QZHv+lLBWravcP8qPIk+O9IcqL2hfuXUPlb5+5Y=;
        b=WdYuPS66Dic53USaNNwDkdRuvQr1zN6IxBE1etWRPsvCnuPVUgXdOvcOvr92c12XuK
         HqSNq49wRZ5w8n2aDsJGsS8DuWSHGVGcTvxiUpYkbOmEGIrv64bkC3OpunXb7uwlrkVZ
         PlHhuggrQ6I4DcJXXQDrF/K/6lmQ+p5FQWKPIDhigbRumBi9+fXSZOz3mLC6aFGLaYav
         /758lp+V1Aof54UR2W70gUFiVf4ecmFz7TXn81PBwBUMBGfc/m0JTj57DM14uQ63Wrux
         unxZMSt4v5st3xWjSLHhWS3FF1vL/ObZJhNps6wLwvmDllCOlOH/qswgIGvG1K5Ltcbd
         uU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165723; x=1780770523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AR30QZHv+lLBWravcP8qPIk+O9IcqL2hfuXUPlb5+5Y=;
        b=c8JVQPzhan2fy338nU94+919EPcZ59A87ehFquF7oK2osSTjYI5EPsFw6nwTUtt2B+
         fhyW7IC89Iv8whh/GVN+PiEUFKN6DoVJD7HGTQbLqDV5EsYEGXbXMoh0HOlB1TMEm8Cd
         kUm4AmQXYuQFGv5A6FmQ/tT5lrl/X1YwhxfuF52xdKobMQJhB2oB0yLjqNWvo2WxEUgj
         O6Nt5fSv2vinV0Iuw4mf0qj2Pubc5kUjNq2ZDblhXGtJnTzYZlPcddcqXkUD/lFTO1Is
         DdFC1KHf33Bkcbew9TRZl0PMKkP38v2UDQx6putjxN5IYB2FwVA21RJ1vo8jci+Qijqj
         8c5Q==
X-Gm-Message-State: AOJu0YzoR7AH3LUOrWEFZVS/Vii3DvnSdsuqbpDelgFPoBJWCcqq7vNv
	dWM0VEkHolAx3ZvSf0L2uWBNRJrECG4K3x0b99y+DzN5sOkBvZD+7+BLpKMNMqsfeghHnzZvggN
	yOYPxFKMG2KQKVZn8/srIRC/qqm7X0XLWaUN2G8a2nyaKNOH2u+wfbh8TFP4wNqTC5z5Z
X-Gm-Gg: Acq92OHa906IkhSUgDB9V2/R6xIhBB1+qeAFfhQ0I1KA3nSUxKXWzlYIiVRsL9zp/VK
	ms+L8+ddWvz7wAe3nV7F9qhvKxR+xbfHaiCm0sSym7COXpNnF03gOVQqFxqMt5gryghaGo51DfF
	WGRyR7yj9+8ivwdiZPQ1kQqsfLcJgrbkz2bLMjG+9jGL6zA5BSfbSMeoIhqgzrHc1O4515hDkWv
	vUmeRxGpOfZjRi7saMJrsggG3PQ572fDeJAlNaiwlFF4F5x8rEhh37KyPIUsNN2Z6cKEBkU1X/G
	h3B1RjdFw3wa9XimOk1pcysjHKCYtgw0FXi92ZP8qyk0/mMBwoBSNFZt9YEYlaFFIKmMO+LrD8r
	oFZMC2HcSGnw6niqgV3macKxdSKENQ0qTHJawpqL1uJSTKiVKRkOXdVNDIoxrC/T7aQ==
X-Received: by 2002:a17:903:1ac8:b0:2bf:276a:e0c1 with SMTP id d9443c01a7336-2bf3685d845mr57629805ad.31.1780165722913;
        Sat, 30 May 2026 11:28:42 -0700 (PDT)
X-Received: by 2002:a17:903:1ac8:b0:2bf:276a:e0c1 with SMTP id d9443c01a7336-2bf3685d845mr57629535ad.31.1780165722356;
        Sat, 30 May 2026 11:28:42 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a27ee3sm56879635ad.36.2026.05.30.11.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:42 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:58:23 +0530
Subject: [PATCH v2 1/4] spi: dt-bindings: describe SA8255p
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-enable-spi-on-sa8255p-v2-1-17574601bd63@oss.qualcomm.com>
References: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
In-Reply-To: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165714; l=2539;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=vtH/fYxHW/XKO4yiyG3ZciHyofKNFTseYo3IhGupIUo=;
 b=e/GTEleHAJLjyzyZimMlSqidF8KX4InFfYKU75ozr78XEEj8bdFBWfpMnA/dHeJfmkGLvktv2
 9avRqfDEg4PBzFO6nQL3OXODZVQTxeRDFt5HOfVQeClK2ERAaFtD8+S
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: vESEamLgd4wDubkasli2R9O3_9iXEZsX
X-Proofpoint-ORIG-GUID: vESEamLgd4wDubkasli2R9O3_9iXEZsX
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1b2c5b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=b8-5IbU7OP05I74H5fIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfXykJaP+r+kLo+
 yR9zHZNeMIbOjhECCnhwR7t4+bkSvdtuYhR1G6eaNn6pY9yhn5CZtuyRwKK/sNAE+r4q5dylPJW
 3iXFHStd8OPNFCX9IFpYLw7j39YSFAuv14glvTMoZ4k9qPz6RbD34oZD24kRbbQ+FI5V0atEj2Q
 wluBTpcMcGCLuC/ZCbZn531XZdZ+YaW8mOvUisPUMTgU7cErH2fwEcCQ6jaABYpSoeW9WWZ1mPz
 cf++bIfUUhE/m6ctPoX/nRfchxi67hzyP+LDzcxq65yENx2l2ywVDbS576EuG3X7UEdTkZ/01ii
 odleIEKI4f8/IuyNY22AkA1midj47NM2CSyi/Xmfu8o1zbjjLpQNjoPxfOqDRgHFFlCsmq2638F
 KZrKt6QtmrSdWgVYjfrHyvnSI3MJdDkbrISpGA8K5OKWmCwAH0cHw/iTQnBo3eYF173jCnlFrWN
 FH3/dPsuHXv+kC4z/TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,0.13.140.192:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110411-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89304612209
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add DT bindings for the QUP GENI SPI controller on sa8255p platform.

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocols are
utilized to request resource configurations.

SA8255p platform does not require the Serial Engine (SE) common properties
as the SE firmware is loaded and managed by the TrustZone (TZ) secure
environment.

Co-developed-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
new file mode 100644
index 000000000000..8c6825b8ddb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/qcom,sa8255p-geni-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GENI based Qualcomm Universal Peripheral (QUP) Serial Peripheral Interface (SPI)
+
+maintainers:
+  - Praveen Talari <praveen.talari@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-geni-spi
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/dma/qcom-gpi.h>
+
+    spi@888000 {
+        compatible = "qcom,sa8255p-geni-spi";
+        reg = <0x888000 0x4000>;
+        interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+               <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };

-- 
2.34.1


