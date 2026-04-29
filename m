Return-Path: <linux-arm-msm+bounces-105243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH1vJ8sk8mlmoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:33:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5992C496FDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7630B300F295
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8382C377EDD;
	Wed, 29 Apr 2026 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTtvo04z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AX5Nj/ID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965AF23ED5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476285; cv=none; b=IjhPFtzzzdiubbNxBJacaAdSe3WU5zdrKeL9VPZrHb20IYU9aZ+taYx38sJn7NENlW0fGSTg3wQpLRBceqyGqk4UTAbdjHCh6oyxa1HDFO68VJ9jIBm2MmTBNJNh2E5i647wzS43GwC6S9740pLG6qKmVvt1zb8BdWPIgULCXhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476285; c=relaxed/simple;
	bh=M98SHhJnejP9q8zgsyyblC/G92OTfC4PpM0GHqsfiYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Reth79U3MH1gXzNuj39cd/h1HeHJzEK3Nz7jjYbS+wuhiGiG9QJ0M7SObkMggiLLWKyG73mYTUU5smAf7dWc8ACGwyrXFvAiUT0knZkiYyUjSVy3PbNRlo1XsQDVs7sUhXCsJXmIObFeDXzpVi8wAkGPZ3Vm9dQuPJZbvYMIM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTtvo04z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AX5Nj/ID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCecMD317267
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYXgnsmjvXmWmarkuX5XpN6kOos9p6cT1Y93fzH2iuc=; b=eTtvo04ze8gc5G2Z
	3BZVZeCYV54wO75aZU1ub5Vtl2Wb4ThtXFVrAGGvaMmUrrr8OeQexaak2d7Tlfsc
	Xk4sg80VJSeVYZJJv72B7zxrE+5GCsZX3JqV4vGxHSwPCIcqZRtdC43lP6RjljX5
	uicmWuzuzA+96nfynu5THL6d8yC6iVtwrUlV/YiO6Rg9ULR2p8GY4xhzBBm3T5Ha
	B71ZB7yYKZ+Xb97kjtZpNKuQNzfy1DTPPxDzeiAYfgwQtxUdfeZ8beq0mixnXPcg
	eJnweYY0EgFWRDF5SB97pkAwJMUb50n08xycH99It4mzJL3CDMFAalet+Nk6aUZ3
	X7eq2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t8ku2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:24:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso12927934a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777476282; x=1778081082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYXgnsmjvXmWmarkuX5XpN6kOos9p6cT1Y93fzH2iuc=;
        b=AX5Nj/ID3/LLU57DNR25eL5HBXVPmS+SMLqbYfC7XHJT5+zRnTfn7pj+Pk2s+lZJKF
         FSHIl/+WVQ5NhTdI99Fa+ugPuZB4C9MjsqaJGIlCwZorwg2eRGjJjQC56wT9pwqlp2P/
         rawqkg/yAJTwoYjrTL5qutFK0Ur6QAaR2XJv0izVw455CMwayKiOJuZgayXH1vOKs+4j
         CWr4ZPMvYmCbzd0fJ+bOboDHApRw2wqvWr/v3HXZIeNYLiXCo+asMPYfq4HM8PHP0gFz
         SgrgDjq5LMWwyZHC4y8I8SxxjVBTWIk4sPJY8khhhP/+lvB1rox6e8b9tJIk5ag7IPqU
         +2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476282; x=1778081082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JYXgnsmjvXmWmarkuX5XpN6kOos9p6cT1Y93fzH2iuc=;
        b=qVdWYOKmTP+njVnmYHROMkh2pO1nr5N6asyM2JdNAu3gHlrqgnHh2UBHm8lmdR6l77
         CRypvE0kKB9dqlrhb+3Kq51w64k49dnUGa5kryRYRTOH8GNICReGgRo9tEFdTXnPca60
         hI9QFZlteQu/zWrUGKMbOfZaducJvo83uBQEC2QcjpJ3H8J2Zx082txD6fLO8PK/gYTG
         6jKWqkq7zCJIF6uRfDJfVSfvIJN96yeVjJsgNBjilVXjb0+JtHYIb63kYk6ZSgJaCrdW
         M066uNZIZsXA7nVQ9CUxCbZC+ZPSprNnYmyV2WhkJ7pbbOITUQfrlKBq9yweADMjsGhR
         NU6Q==
X-Gm-Message-State: AOJu0YxOZ5VTCRialMU9KdUe6mcSe7oVmMjOHv7MI8A2m2lhT1m3boyT
	d0bM/EwNTERenkehchJVBeZ+Uc/fgCnCxl6gjvAn4FudjJVawXkF1Z3lmuEqlfH0+t85CKmwifz
	7whlQInoLizlraCTFVovdXyDTE65XjPra/53SO3Xm6UuWejypgLTPokXYYXtoFx8eOcIe
X-Gm-Gg: AeBDieuHNcdbtxOJABiWkPvvGRgYt7J5bUFGHPt1Mb6A5ciPX66WFQQuBOKMpnxBNFj
	mdM3MCLJjZjZqI+/i5IowWROm5qcvm02RI+XegpWGxYNTs1dYO3dPgK2QWD+LyvUXey6ItceSx1
	elyAMBZqbeIm9Q6hgSAWIDFA4byI1iQ2tr5jk68A0nRkPMDuUnk79UPyfoByT1KTmaU6ptf9J4E
	icOAiZfV4BaQ/epfKqlAxu/95ln3b/g/G7RClRYPxOhPEbANFSj+DkFRYGBCxgz+ia0jsHwrpzi
	pO1+XqcAQPmZVN2/c2uDg6Qg5uHQXrHf2ljGyUFTk0bx1q4KAFW78lYQgI/8RPfafMGOfPwj/JV
	D+bDw77d/s4VqRh+yi1QNccAOIwm9otywr1vaDzfReA+kD40//ysRcCcwl8WPGldnElg2v1ca5b
	L/RyVhdcqexr5AXfi0KuP4Zc4ZOMJkaz0PG6GU8xkXPGKd8DJaqjqqmRQgzzuhhB48RDE=
X-Received: by 2002:a17:90b:5808:b0:35b:e5ce:73bb with SMTP id 98e67ed59e1d1-36491fbf11dmr8422640a91.1.1777476281793;
        Wed, 29 Apr 2026 08:24:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5808:b0:35b:e5ce:73bb with SMTP id 98e67ed59e1d1-36491fbf11dmr8422604a91.1.1777476281136;
        Wed, 29 Apr 2026 08:24:41 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd588ad5sm66732a91.3.2026.04.29.08.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:24:39 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:54:22 +0530
Subject: [PATCH v2 1/4] dt-bindings: clock: add Qualcomm IPQ9650 GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-ipq9650_boot_to_shell-v2-1-9b0dc3d1f3a8@oss.qualcomm.com>
References: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
In-Reply-To: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777476269; l=19689;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=M98SHhJnejP9q8zgsyyblC/G92OTfC4PpM0GHqsfiYY=;
 b=90UPQO2vKyz2TNehoCQoQeNfnFceQE0c/CDnDOWZhybBqklM3+Xu3FQKl6unUBuZJhcrAcxhD
 cNtVQbKty0QD1i0aaTezWzpo0+5qaI2TjUlSLQDf8dj7JYkpuOSG24A
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: DOFqaHVTXJsHZCk_q6JdR-94KeuHHq7U
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f222ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WFUcH46kpRkaEDnmzbAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: DOFqaHVTXJsHZCk_q6JdR-94KeuHHq7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NSBTYWx0ZWRfXw5pli7RhnsFI
 mq2T+zNVlUaoE0v30w6vMHqjyTT9yt4q73zQTVSqSs307vezZfgjiDZBoGBTSHIv98g5YOBjp+a
 qZXXwRVvKntqEIr1Cnfc+SgYUYp6S+1Gm5UPLdmPlGr+XgesUmUlsX2upH2LGQYaypp32hDS5Ga
 fcPPsmo9Zzi7fMt89gFKkHmcSn53dxGoQ959kAgv5lpSHoBYkHw6SNFWVDABj0FBf4zcnOkCCBK
 6OvdcFsb8kZqRGb3HsjnhTBZaeM56HxNDUeO7sN766xe9qONLx+SVKPnPh7MzLjxS3BKUPNEYt6
 zuHn4zE55tQ8qHr5PxcMsHwKevgyRS1/aNOrpKfOG4Ea/WemLhbAMoxWNTTVhrY1+jhL5QwblNn
 On5hkOWzOJ4CEsXcKV/PkMraDfKjzWJ7e4ovzyf+Y/858HWZCXdny0LIzihM/+siDc+gvq/9BC9
 4WvTICIF6VDvdNijdLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290155
X-Rspamd-Queue-Id: 5992C496FDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105243-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.27.119.64:email,devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add binding for the Qualcomm IPQ9650 Global Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |  68 ++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       | 190 +++++++++++++++++
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       | 228 +++++++++++++++++++++
 3 files changed, 486 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9650-gcc.yaml
new file mode 100644
index 000000000000..f33105217a06
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9650-gcc.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq9650-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on IPQ9650
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on IPQ9650
+
+  See also:
+    include/dt-bindings/clock/qcom,ipq9650-gcc.h
+    include/dt-bindings/reset/qcom,ipq9650-gcc.h
+
+properties:
+  compatible:
+    const: qcom,ipq9650-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIE30 PHY0 pipe clock source
+      - description: PCIE30 PHY1 pipe clock source
+      - description: PCIE30 PHY2 pipe clock source
+      - description: PCIE30 PHY3 pipe clock source
+      - description: PCIE30 PHY4 pipe clock source
+      - description: USB PCIE wrapper pipe clock source
+      - description: NSS common clock source
+
+  '#power-domain-cells': false
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-controller@1800000 {
+      compatible = "qcom,ipq9650-gcc";
+      reg = <0x01800000 0x40000>;
+      clocks = <&xo_board_clk>,
+               <&sleep_clk>,
+               <&pcie30_phy0_pipe_clk>,
+               <&pcie30_phy1_pipe_clk>,
+               <&pcie30_phy2_pipe_clk>,
+               <&pcie30_phy3_pipe_clk>,
+               <&pcie30_phy4_pipe_clk>,
+               <&usb3phy_0_cc_pipe_clk>,
+               <&nss_cmn_clk>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,ipq9650-gcc.h b/include/dt-bindings/clock/qcom,ipq9650-gcc.h
new file mode 100644
index 000000000000..600240227c3d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq9650-gcc.h
@@ -0,0 +1,190 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_IPQ_GCC_IPQ9650_H
+#define _DT_BINDINGS_CLOCK_IPQ_GCC_IPQ9650_H
+
+#define GCC_ADSS_PWM_CLK					0
+#define GCC_ADSS_PWM_CLK_SRC					1
+#define GCC_ANOC_PCIE0_1LANE_M_CLK				2
+#define GCC_ANOC_PCIE0_1LANE_S_CLK				3
+#define GCC_ANOC_PCIE1_2LANE_M_CLK				4
+#define GCC_ANOC_PCIE1_2LANE_S_CLK				5
+#define GCC_ANOC_PCIE2_2LANE_M_CLK				6
+#define GCC_ANOC_PCIE2_2LANE_S_CLK				7
+#define GCC_ANOC_PCIE3_2LANE_M_CLK				8
+#define GCC_ANOC_PCIE3_2LANE_S_CLK				9
+#define GCC_ANOC_PCIE4_1LANE_M_CLK				10
+#define GCC_ANOC_PCIE4_1LANE_S_CLK				11
+#define GCC_CMN_12GPLL_AHB_CLK					12
+#define GCC_CMN_12GPLL_APU_CLK					13
+#define GCC_CMN_12GPLL_SYS_CLK					14
+#define GCC_CMN_LDO_CLK						15
+#define GCC_MDIO_AHB_CLK					16
+#define GCC_NSSCC_CLK						17
+#define GCC_NSSCFG_CLK						18
+#define GCC_NSSNOC_ATB_CLK					19
+#define GCC_NSSNOC_MEMNOC_1_CLK					20
+#define GCC_NSSNOC_MEMNOC_BFDCD_CLK_SRC				21
+#define GCC_NSSNOC_MEMNOC_CLK					22
+#define GCC_NSSNOC_MEMNOC_DIV_CLK_SRC				23
+#define GCC_NSSNOC_NSSCC_CLK					24
+#define GCC_NSSNOC_PCNOC_1_CLK					25
+#define GCC_NSSNOC_QOSGEN_REF_CLK				26
+#define GCC_NSSNOC_SNOC_1_CLK					27
+#define GCC_NSSNOC_SNOC_CLK					28
+#define GCC_NSSNOC_TIMEOUT_REF_CLK				29
+#define GCC_NSSNOC_XO_DCD_CLK					30
+#define GCC_NSS_TS_CLK						31
+#define GCC_NSS_TS_CLK_SRC					32
+#define GCC_PCIE0_AHB_CLK					33
+#define GCC_PCIE0_AUX_CLK					34
+#define GCC_PCIE0_AXI_M_CLK					35
+#define GCC_PCIE0_AXI_M_CLK_SRC					36
+#define GCC_PCIE0_AXI_S_BRIDGE_CLK				37
+#define GCC_PCIE0_AXI_S_CLK					38
+#define GCC_PCIE0_AXI_S_CLK_SRC					39
+#define GCC_PCIE0_PIPE_CLK					40
+#define GCC_PCIE0_PIPE_CLK_SRC					41
+#define GCC_PCIE0_RCHNG_CLK					42
+#define GCC_PCIE0_RCHNG_CLK_SRC					43
+#define GCC_PCIE1_AHB_CLK					44
+#define GCC_PCIE1_AUX_CLK					45
+#define GCC_PCIE1_AXI_M_CLK					46
+#define GCC_PCIE1_AXI_M_CLK_SRC					47
+#define GCC_PCIE1_AXI_S_BRIDGE_CLK				48
+#define GCC_PCIE1_AXI_S_CLK					49
+#define GCC_PCIE1_AXI_S_CLK_SRC					50
+#define GCC_PCIE1_PIPE_CLK					51
+#define GCC_PCIE1_PIPE_CLK_SRC					52
+#define GCC_PCIE1_RCHNG_CLK					53
+#define GCC_PCIE1_RCHNG_CLK_SRC					54
+#define GCC_PCIE2_AHB_CLK					55
+#define GCC_PCIE2_AUX_CLK					56
+#define GCC_PCIE2_AXI_M_CLK					57
+#define GCC_PCIE2_AXI_M_CLK_SRC					58
+#define GCC_PCIE2_AXI_S_BRIDGE_CLK				59
+#define GCC_PCIE2_AXI_S_CLK					60
+#define GCC_PCIE2_AXI_S_CLK_SRC					61
+#define GCC_PCIE2_PIPE_CLK					62
+#define GCC_PCIE2_PIPE_CLK_SRC					63
+#define GCC_PCIE2_RCHNG_CLK					64
+#define GCC_PCIE2_RCHNG_CLK_SRC					65
+#define GCC_PCIE3_AHB_CLK					66
+#define GCC_PCIE3_AUX_CLK					67
+#define GCC_PCIE3_AXI_M_CLK					68
+#define GCC_PCIE3_AXI_M_CLK_SRC					69
+#define GCC_PCIE3_AXI_S_BRIDGE_CLK				70
+#define GCC_PCIE3_AXI_S_CLK					71
+#define GCC_PCIE3_AXI_S_CLK_SRC					72
+#define GCC_PCIE3_PIPE_CLK					73
+#define GCC_PCIE3_PIPE_CLK_SRC					74
+#define GCC_PCIE3_RCHNG_CLK					75
+#define GCC_PCIE3_RCHNG_CLK_SRC					76
+#define GCC_PCIE4_AHB_CLK					77
+#define GCC_PCIE4_AUX_CLK					78
+#define GCC_PCIE4_AXI_M_CLK					79
+#define GCC_PCIE4_AXI_M_CLK_SRC					80
+#define GCC_PCIE4_AXI_S_BRIDGE_CLK				81
+#define GCC_PCIE4_AXI_S_CLK					82
+#define GCC_PCIE4_AXI_S_CLK_SRC					83
+#define GCC_PCIE4_PIPE_CLK					84
+#define GCC_PCIE4_PIPE_CLK_SRC					85
+#define GCC_PCIE4_RCHNG_CLK					86
+#define GCC_PCIE4_RCHNG_CLK_SRC					87
+#define GCC_PCIE_AUX_CLK_SRC					88
+#define GCC_PCIE_CMN_HCLK					89
+#define GCC_PCIE_CMN_LDO_CLK					90
+#define GCC_PCNOC_BFDCD_CLK_SRC					91
+#define GCC_PRIMESS_AHBM_CLK					92
+#define GCC_PRIMESS_AHBM_CLK_SRC				93
+#define GCC_PRIMESS_AHBM_PARTIAL_CLK				94
+#define GCC_PRIMESS_AHBS_CLK					95
+#define GCC_PRIMESS_ATB_CLK					96
+#define GCC_PRIMESS_AXIM_CLK					97
+#define GCC_PRIMESS_AXIM_CLK_SRC				98
+#define GCC_PRIMESS_AXIM_PARTIAL_CLK				99
+#define GCC_PRIMESS_CLK						100
+#define GCC_PRIMESS_CLK_SRC					101
+#define GCC_PRIMESS_XO_CLK					102
+#define GCC_QDSS_AT_CLK						103
+#define GCC_QDSS_AT_CLK_SRC					104
+#define GCC_QDSS_DAP_CLK					105
+#define GCC_QDSS_TSCTR_CLK_SRC					106
+#define GCC_QPIC_AHB_CLK					107
+#define GCC_QPIC_CLK						108
+#define GCC_QPIC_CLK_SRC					109
+#define GCC_QPIC_IO_MACRO_CLK					110
+#define GCC_QPIC_IO_MACRO_CLK_SRC				111
+#define GCC_QPIC_SLEEP_CLK					112
+#define GCC_QUPV3_2X_CORE_CLK					113
+#define GCC_QUPV3_2X_CORE_CLK_SRC				114
+#define GCC_QUPV3_AHB_MST_CLK					115
+#define GCC_QUPV3_AHB_SLV_CLK					116
+#define GCC_QUPV3_CORE_CLK					117
+#define GCC_QUPV3_SLEEP_CLK					118
+#define GCC_QUPV3_WRAP_SE0_CLK					119
+#define GCC_QUPV3_WRAP_SE0_CLK_SRC				120
+#define GCC_QUPV3_WRAP_SE1_CLK					121
+#define GCC_QUPV3_WRAP_SE1_CLK_SRC				122
+#define GCC_QUPV3_WRAP_SE2_CLK					123
+#define GCC_QUPV3_WRAP_SE2_CLK_SRC				124
+#define GCC_QUPV3_WRAP_SE3_CLK					125
+#define GCC_QUPV3_WRAP_SE3_CLK_SRC				126
+#define GCC_QUPV3_WRAP_SE4_CLK					127
+#define GCC_QUPV3_WRAP_SE4_CLK_SRC				128
+#define GCC_QUPV3_WRAP_SE5_CLK					129
+#define GCC_QUPV3_WRAP_SE5_CLK_SRC				130
+#define GCC_QUPV3_WRAP_SE6_CLK					131
+#define GCC_QUPV3_WRAP_SE6_CLK_SRC				132
+#define GCC_QUPV3_WRAP_SE7_CLK					133
+#define GCC_QUPV3_WRAP_SE7_CLK_SRC				134
+#define GCC_REFGEN_CORE_CLK_SRC					135
+#define GCC_REFGEN_PCIE_CORE_CLK				136
+#define GCC_REFGEN_PCIE_HCLK					137
+#define GCC_SDCC1_AHB_CLK					138
+#define GCC_SDCC1_APPS_CLK					139
+#define GCC_SDCC1_APPS_CLK_SRC					140
+#define GCC_SDCC1_ICE_CORE_CLK					141
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				142
+#define GCC_SLEEP_CLK_SRC					143
+#define GCC_SNOC_USB_CLK					144
+#define GCC_SYSTEM_NOC_BFDCD_CLK_SRC				145
+#define GCC_TLMM_AHB_CLK					146
+#define GCC_TLMM_CLK						147
+#define GCC_UNIPHY0_AHB_CLK					148
+#define GCC_UNIPHY0_SYS_CLK					149
+#define GCC_UNIPHY1_AHB_CLK					150
+#define GCC_UNIPHY1_SYS_CLK					151
+#define GCC_UNIPHY2_AHB_CLK					152
+#define GCC_UNIPHY2_SYS_CLK					153
+#define GCC_UNIPHY_SYS_CLK_SRC					154
+#define GCC_USB0_AUX_CLK					155
+#define GCC_USB0_AUX_CLK_SRC					156
+#define GCC_USB0_EUD_AT_CLK					157
+#define GCC_USB0_MASTER_CLK					158
+#define GCC_USB0_MASTER_CLK_SRC					159
+#define GCC_USB0_MOCK_UTMI_CLK					160
+#define GCC_USB0_MOCK_UTMI_CLK_SRC				161
+#define GCC_USB0_MOCK_UTMI_DIV_CLK_SRC				162
+#define GCC_USB0_PHY_CFG_AHB_CLK				163
+#define GCC_USB0_PIPE_CLK					164
+#define GCC_USB0_PIPE_CLK_SRC					165
+#define GCC_USB0_SLEEP_CLK					166
+#define GCC_USB1_MASTER_CLK					167
+#define GCC_USB1_MOCK_UTMI_CLK					168
+#define GCC_USB1_MOCK_UTMI_CLK_SRC				169
+#define GCC_USB1_MOCK_UTMI_DIV_CLK_SRC				170
+#define GCC_USB1_PHY_CFG_AHB_CLK				171
+#define GCC_USB1_SLEEP_CLK					172
+#define GCC_USB_CMN_HCLK					173
+#define GCC_USB_CMN_LDO_CLK					174
+#define GCC_XO_CLK_SRC						175
+#define GPLL0							176
+#define GPLL0_MAIN						177
+#define GPLL2							178
+#define GPLL2_OUT_MAIN						179
+#define GPLL4							180
+#endif
diff --git a/include/dt-bindings/reset/qcom,ipq9650-gcc.h b/include/dt-bindings/reset/qcom,ipq9650-gcc.h
new file mode 100644
index 000000000000..0b8dd3ff4257
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,ipq9650-gcc.h
@@ -0,0 +1,228 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_RESET_IPQ_GCC_IPQ9650_H
+#define _DT_BINDINGS_RESET_IPQ_GCC_IPQ9650_H
+
+#define GCC_ADSS_BCR						0
+#define GCC_ADSS_PWM_CLK_ARES					1
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR			2
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_GPLL0_CLK_ARES		3
+#define GCC_APSS_AHB_CLK_ARES					4
+#define GCC_APSS_ATB_CLK_ARES					5
+#define GCC_APSS_AXI_CLK_ARES					6
+#define GCC_APSS_TS_CLK_ARES					7
+#define GCC_BOOT_ROM_AHB_CLK_ARES				8
+#define GCC_BOOT_ROM_BCR					9
+#define GCC_CMN_12GPLL_AHB_CLK_ARES				10
+#define GCC_CMN_12GPLL_APU_CLK_ARES				11
+#define GCC_CMN_12GPLL_SYS_CLK_ARES				12
+#define GCC_CMN_BLK_BCR						13
+#define GCC_CMN_LDO_CLK_ARES					14
+#define GCC_CPUSS_TRIG_CLK_ARES					15
+#define GCC_GP1_CLK_ARES					16
+#define GCC_GP2_CLK_ARES					17
+#define GCC_GP3_CLK_ARES					18
+#define GCC_MDIO_AHB_CLK_ARES					19
+#define GCC_MDIO_BCR						20
+#define GCC_NSSCC_CLK_ARES					21
+#define GCC_NSSCFG_CLK_ARES					22
+#define GCC_NSSNOC_ATB_CLK_ARES					23
+#define GCC_NSSNOC_MEMNOC_1_CLK_ARES				24
+#define GCC_NSSNOC_MEMNOC_CLK_ARES				25
+#define GCC_NSSNOC_NSSCC_CLK_ARES				26
+#define GCC_NSSNOC_PCNOC_1_CLK_ARES				27
+#define GCC_NSSNOC_QOSGEN_REF_CLK_ARES				28
+#define GCC_NSSNOC_SNOC_1_CLK_ARES				29
+#define GCC_NSSNOC_SNOC_CLK_ARES				30
+#define GCC_NSSNOC_TIMEOUT_REF_CLK_ARES				31
+#define GCC_NSSNOC_XO_DCD_CLK_ARES				32
+#define GCC_NSS_BCR						33
+#define GCC_NSS_TS_CLK_ARES					34
+#define GCC_PCIE0PHY_PHY_BCR					35
+#define GCC_PCIE0_AHB_CLK_ARES					36
+#define GCC_PCIE0_AHB_RESET					37
+#define GCC_PCIE0_AUX_CLK_ARES					38
+#define GCC_PCIE0_AUX_RESET					39
+#define GCC_PCIE0_AXI_M_CLK_ARES				40
+#define GCC_PCIE0_AXI_M_RESET					41
+#define GCC_PCIE0_AXI_M_STICKY_RESET				42
+#define GCC_PCIE0_AXI_S_BRIDGE_CLK_ARES				43
+#define GCC_PCIE0_AXI_S_CLK_ARES				44
+#define GCC_PCIE0_AXI_S_RESET					45
+#define GCC_PCIE0_AXI_S_STICKY_RESET				46
+#define GCC_PCIE0_BCR						47
+#define GCC_PCIE0_CORE_STICKY_RESET				48
+#define GCC_PCIE0_LINK_DOWN_BCR					49
+#define GCC_PCIE0_PHY_BCR					50
+#define GCC_PCIE0_PIPE_CLK_ARES					51
+#define GCC_PCIE0_PIPE_RESET					52
+#define GCC_PCIE1PHY_PHY_BCR					53
+#define GCC_PCIE1_AHB_CLK_ARES					54
+#define GCC_PCIE1_AHB_RESET					55
+#define GCC_PCIE1_AUX_CLK_ARES					56
+#define GCC_PCIE1_AUX_RESET					57
+#define GCC_PCIE1_AXI_M_CLK_ARES				58
+#define GCC_PCIE1_AXI_M_RESET					59
+#define GCC_PCIE1_AXI_M_STICKY_RESET				60
+#define GCC_PCIE1_AXI_S_BRIDGE_CLK_ARES				61
+#define GCC_PCIE1_AXI_S_CLK_ARES				62
+#define GCC_PCIE1_AXI_S_RESET					63
+#define GCC_PCIE1_AXI_S_STICKY_RESET				64
+#define GCC_PCIE1_BCR						65
+#define GCC_PCIE1_CORE_STICKY_RESET				66
+#define GCC_PCIE1_LINK_DOWN_BCR					67
+#define GCC_PCIE1_PHY_BCR					68
+#define GCC_PCIE1_PIPE_CLK_ARES					69
+#define GCC_PCIE1_PIPE_RESET					70
+#define GCC_PCIE2PHY_PHY_BCR					71
+#define GCC_PCIE2_AHB_CLK_ARES					72
+#define GCC_PCIE2_AHB_RESET					73
+#define GCC_PCIE2_AUX_CLK_ARES					74
+#define GCC_PCIE2_AUX_RESET					75
+#define GCC_PCIE2_AXI_M_CLK_ARES				76
+#define GCC_PCIE2_AXI_M_RESET					77
+#define GCC_PCIE2_AXI_M_STICKY_RESET				78
+#define GCC_PCIE2_AXI_S_BRIDGE_CLK_ARES				79
+#define GCC_PCIE2_AXI_S_CLK_ARES				80
+#define GCC_PCIE2_AXI_S_RESET					81
+#define GCC_PCIE2_AXI_S_STICKY_RESET				82
+#define GCC_PCIE2_BCR						83
+#define GCC_PCIE2_CORE_STICKY_RESET				84
+#define GCC_PCIE2_LINK_DOWN_BCR					85
+#define GCC_PCIE2_PHY_BCR					86
+#define GCC_PCIE2_PIPE_CLK_ARES					87
+#define GCC_PCIE2_PIPE_RESET					88
+#define GCC_PCIE3PHY_PHY_BCR					89
+#define GCC_PCIE3_AHB_CLK_ARES					90
+#define GCC_PCIE3_AHB_RESET					91
+#define GCC_PCIE3_AUX_CLK_ARES					92
+#define GCC_PCIE3_AUX_RESET					93
+#define GCC_PCIE3_AXI_M_CLK_ARES				94
+#define GCC_PCIE3_AXI_M_RESET					95
+#define GCC_PCIE3_AXI_M_STICKY_RESET				96
+#define GCC_PCIE3_AXI_S_BRIDGE_CLK_ARES				97
+#define GCC_PCIE3_AXI_S_CLK_ARES				98
+#define GCC_PCIE3_AXI_S_RESET					99
+#define GCC_PCIE3_AXI_S_STICKY_RESET				100
+#define GCC_PCIE3_BCR						101
+#define GCC_PCIE3_CORE_STICKY_RESET				102
+#define GCC_PCIE3_LINK_DOWN_BCR					103
+#define GCC_PCIE3_PHY_BCR					104
+#define GCC_PCIE3_PIPE_CLK_ARES					105
+#define GCC_PCIE3_PIPE_RESET					106
+#define GCC_PCIE4PHY_PHY_BCR					107
+#define GCC_PCIE4_AHB_CLK_ARES					108
+#define GCC_PCIE4_AHB_RESET					109
+#define GCC_PCIE4_AUX_CLK_ARES					110
+#define GCC_PCIE4_AUX_RESET					111
+#define GCC_PCIE4_AXI_M_CLK_ARES				112
+#define GCC_PCIE4_AXI_M_RESET					113
+#define GCC_PCIE4_AXI_M_STICKY_RESET				114
+#define GCC_PCIE4_AXI_S_BRIDGE_CLK_ARES				115
+#define GCC_PCIE4_AXI_S_CLK_ARES				116
+#define GCC_PCIE4_AXI_S_RESET					117
+#define GCC_PCIE4_AXI_S_STICKY_RESET				118
+#define GCC_PCIE4_BCR						119
+#define GCC_PCIE4_CORE_STICKY_RESET				120
+#define GCC_PCIE4_LINK_DOWN_BCR					121
+#define GCC_PCIE4_PHY_BCR					122
+#define GCC_PCIE4_PIPE_CLK_ARES					123
+#define GCC_PCIE4_PIPE_RESET					124
+#define GCC_PCIE_CMN_LDO_BCR					125
+#define GCC_PRIMESS_AHBM_CLK_ARES				126
+#define GCC_PRIMESS_AHBM_PARTIAL_CLK_ARES			127
+#define GCC_PRIMESS_AHBS_CLK_ARES				128
+#define GCC_PRIMESS_ATB_CLK_ARES				129
+#define GCC_PRIMESS_AXIM_CLK_ARES				130
+#define GCC_PRIMESS_AXIM_PARTIAL_CLK_ARES			131
+#define GCC_PRIMESS_CLK_ARES					132
+#define GCC_PRIMESS_XO_CLK_ARES					133
+#define GCC_PRIME_SS_BCR					134
+#define GCC_QDSS_APB2JTAG_CLK_ARES				135
+#define GCC_QDSS_AT_CLK_ARES					136
+#define GCC_QDSS_BCR						137
+#define GCC_QDSS_CFG_AHB_CLK_ARES				138
+#define GCC_QDSS_DAP_AHB_CLK_ARES				139
+#define GCC_QDSS_DAP_CLK_ARES					140
+#define GCC_QDSS_ETR_USB_CLK_ARES				141
+#define GCC_QDSS_EUD_AT_CLK_ARES				142
+#define GCC_QDSS_STM_CLK_ARES					143
+#define GCC_QDSS_TRACECLKIN_CLK_ARES				144
+#define GCC_QDSS_TSCTR_DIV16_CLK_ARES				145
+#define GCC_QDSS_TSCTR_DIV2_CLK_ARES				146
+#define GCC_QDSS_TSCTR_DIV3_CLK_ARES				147
+#define GCC_QDSS_TSCTR_DIV4_CLK_ARES				148
+#define GCC_QDSS_TSCTR_DIV8_CLK_ARES				149
+#define GCC_QDSS_TS_CLK_ARES					150
+#define GCC_QPIC_AHB_CLK_ARES					151
+#define GCC_QPIC_BCR						152
+#define GCC_QPIC_CLK_ARES					153
+#define GCC_QPIC_IO_MACRO_CLK_ARES				154
+#define GCC_QPIC_SLEEP_CLK_ARES					155
+#define GCC_QUPV3_2X_CORE_CLK_ARES				156
+#define GCC_QUPV3_AHB_MST_CLK_ARES				157
+#define GCC_QUPV3_AHB_SLV_CLK_ARES				158
+#define GCC_QUPV3_BCR						159
+#define GCC_QUPV3_CORE_CLK_ARES					160
+#define GCC_QUPV3_WRAP_SE0_BCR					161
+#define GCC_QUPV3_WRAP_SE0_CLK_ARES				162
+#define GCC_QUPV3_WRAP_SE1_BCR					163
+#define GCC_QUPV3_WRAP_SE1_CLK_ARES				164
+#define GCC_QUPV3_WRAP_SE2_BCR					165
+#define GCC_QUPV3_WRAP_SE2_CLK_ARES				166
+#define GCC_QUPV3_WRAP_SE3_BCR					167
+#define GCC_QUPV3_WRAP_SE3_CLK_ARES				168
+#define GCC_QUPV3_WRAP_SE4_BCR					169
+#define GCC_QUPV3_WRAP_SE4_CLK_ARES				170
+#define GCC_QUPV3_WRAP_SE5_BCR					171
+#define GCC_QUPV3_WRAP_SE5_CLK_ARES				172
+#define GCC_QUPV3_WRAP_SE6_BCR					173
+#define GCC_QUPV3_WRAP_SE6_CLK_ARES				174
+#define GCC_QUPV3_WRAP_SE7_BCR					175
+#define GCC_QUPV3_WRAP_SE7_CLK_ARES				176
+#define GCC_QUSB2_0_PHY_BCR					177
+#define GCC_QUSB2_1_PHY_BCR					178
+#define GCC_REFGEN_PCIE_BCR					179
+#define GCC_REFGEN_PCIE_CORE_CLK_ARES				180
+#define GCC_SDCC1_APPS_CLK_ARES					181
+#define GCC_SDCC1_ICE_CORE_CLK_ARES				182
+#define GCC_SDCC_BCR						183
+#define GCC_TLMM_AHB_CLK_ARES					184
+#define GCC_TLMM_BCR						185
+#define GCC_TLMM_CLK_ARES					186
+#define GCC_UNIPHY0_AHB_CLK_ARES				187
+#define GCC_UNIPHY0_BCR						188
+#define GCC_UNIPHY0_PMA_BCR					189
+#define GCC_UNIPHY0_SYS_CLK_ARES				190
+#define GCC_UNIPHY0_XPCS_ARES					191
+#define GCC_UNIPHY1_AHB_CLK_ARES				192
+#define GCC_UNIPHY1_BCR						193
+#define GCC_UNIPHY1_PMA_BCR					194
+#define GCC_UNIPHY1_SYS_CLK_ARES				195
+#define GCC_UNIPHY1_XPCS_ARES					196
+#define GCC_UNIPHY2_AHB_CLK_ARES				197
+#define GCC_UNIPHY2_BCR						198
+#define GCC_UNIPHY2_PMA_BCR					199
+#define GCC_UNIPHY2_SYS_CLK_ARES				200
+#define GCC_UNIPHY2_XPCS_ARES					201
+#define GCC_USB0_AUX_CLK_ARES					202
+#define GCC_USB0_MASTER_CLK_ARES				203
+#define GCC_USB0_MOCK_UTMI_CLK_ARES				204
+#define GCC_USB0_PHY_BCR					205
+#define GCC_USB0_PHY_CFG_AHB_CLK_ARES				206
+#define GCC_USB0_PIPE_CLK_ARES					207
+#define GCC_USB0_SLEEP_CLK_ARES					208
+#define GCC_USB1_BCR						209
+#define GCC_USB1_MASTER_CLK_ARES				210
+#define GCC_USB1_MOCK_UTMI_CLK_ARES				211
+#define GCC_USB1_PHY_CFG_AHB_CLK_ARES				212
+#define GCC_USB1_SLEEP_CLK_ARES					213
+#define GCC_USB3PHY_0_PHY_BCR					214
+#define GCC_USB_BCR						215
+#define GCC_USB_CMN_LDO_BCR					216
+#define GCC_UNIPHY1_XLGPCS_ARES					217
+#define GCC_UNIPHY2_XLGPCS_ARES					218
+#endif

-- 
2.34.1


