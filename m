Return-Path: <linux-arm-msm+bounces-83795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A0065C9262E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 16:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 612814E2298
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 15:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8413074AC;
	Fri, 28 Nov 2025 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHoP52BX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DD6yZMZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E0632ED42
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764342115; cv=none; b=CdEDt/q58cX1x/Y/Yzmb08O0mm7PGqF8ffbyJgSyJrUAblp2mjR9OYZeRxCGEEFiL8edhZBOg7hydmeGacs+YoP9b1u6CE6R5flEGND3ld7lTXypYDv1xD4DM0zKYFStMDStD/yuz7OnTr9QNVvBgEfx6nJyE1mof4kc40VLkgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764342115; c=relaxed/simple;
	bh=IMYLUe/iqCxNsBq51GotezbgyJ7h4uIKdZod+cjUFxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cKiakwIbfA0AdZaNq+WbwM4hoQs7r3awIG8blDB7o4sYMwX8iDnn6LLx4la5yoUl7bVno2V+hPv9wlQAZ7QGQCYcmW0+D66YJTv+dc5QygP0DmeH+iTtfcPRwshjaIrd1FNkDm53+y1bCyV95aEoA6fM0SxCj+H3k66RVrkJpJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHoP52BX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DD6yZMZN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8O5D53476496
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 15:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=nt1h8lj2PaJc9NFcbOupOH+PeDoPeb4OA7HSdoQp9n0=; b=YH
	oP52BXzMnOvpuZ8XtdN9RRSyQ5wwd0+6jSblJK8OAE1MReqPF1BJaEz0YkypQFQu
	OlpqjAE8YhE+rWhQUxSHeNLbDmeg0RGhn9dv5jknCTb4UQWcIdFPQCSNi6yroU2+
	VakleBu8vs2jDGZJLQevtOg48lieNxvsli5QvIK2UKpHlvx1uGJMzpBJFmlgkk8g
	jpxJZhGH9u67N7EA1vRh+gpIq9lUXHp69BiGZj9Aqfi+FJLI0ta48YFyTPKhJfyQ
	lIJD22dkzNffQ2sIfNBsHHqiNH/Hf0hMfTTBYYrtoQXqHYktRGcK4UH0cWQtO/Sn
	+qi7i3kRVtMCq3vvIoRA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aptpuarye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 15:01:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297df52c960so36102455ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764342113; x=1764946913; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nt1h8lj2PaJc9NFcbOupOH+PeDoPeb4OA7HSdoQp9n0=;
        b=DD6yZMZNUUNHo/pGNUspboaHjLAvquY89etvGo0fw2pFJHCUZvbB7IqlHB5vfg5IZy
         a2MAzia+yaujss8pba+E8oqpDo/2MtV+wkq7l3EwEAlNhB/nk5bGWYbU5rtXg7ywR1Cq
         jKfrRiyv6Sd7Aa+OWsQFpjDRTpXFAS0U4GcpL5W7OzVm7JBG+F81cLg1VCmCJ/8r7AJD
         C5sAoAspY6cjq6XcMNoc2AjnbbEL95PoJFEBohLi/p4QVORsdYBL6lyFZ4VNGuZ32Mz6
         jSpjP2i+gF6dT2qsR6FOtS2u9GHwWN+YtWKj0uvWbMETRAcyX17qeqNQyC1nvzaEXXIV
         /SKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764342113; x=1764946913;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nt1h8lj2PaJc9NFcbOupOH+PeDoPeb4OA7HSdoQp9n0=;
        b=YRpT2mrjHa3k/iu96eU93g1jTgEgEiLidTq3WspovpK/Uke2mvktl6yZ+cuL49bRTe
         Niox3EEoiCuBn9jw06cSa7hy1fy/17s/1PkNGRaFD6m8t8/+qWXrppQXJ2iwuLvrLqBg
         dk4Uipe0rZtNOJQSDbplk2uSxkE9aZQ7bP5meWP0gFI+isw33FL2AlpXS8z/Obzc/euV
         NoR5hvMsACpVPZHNc8n/NcAvrS4ueLJNp53xGhGcZrlCSFSiOT30aIRVL+uFGcOos/J7
         Eps6VXBzuMBJPGgT+JZgbLCq87UCd+bWg0IGTRxUvSI1evArM48EUCgQUZ98xoDY5cfL
         gdbw==
X-Forwarded-Encrypted: i=1; AJvYcCVFCtZUjbi6WmtcAQkBeJ7u2Y6vAEQ69g6dPHjCU+jsnUQLSIlneTjmh+8Aw5U6NbNVmwzeKxQ0/OQx7+Ei@vger.kernel.org
X-Gm-Message-State: AOJu0YzT2fK2wHp6PkhVTo1FQr9mCCFtg/TB4Siyrkq833/G8w6y4mrH
	zxYXhLJSMQTFQ+foxa3mWia6tf6CdgEXKqlXpVATrRKmhjHP7iAnI6b3BAJPLuldofWOQ4k7WoI
	1Vpv1QHuuXgHrjuO4Rl47CmuQxZuGWmxp/ca1zk2Uh+QpjfOAgVMfzvGvUH+dm6lb0SSB
X-Gm-Gg: ASbGncs82zDZoHbhS/mZC8aFIhcxpCUlUe5M9RWI/I9QKZ1D39kzRRtJXQW01T02Nkw
	hAIUyXGG81L0+yySaymZarYjsSTGDqgw7d+fkJbh2P/yZ5cQfP3IlmYozjZ1dC0JX8FkoMZSfDs
	Ynv6VQtlxoY0ATRBgIWMQTPXkvXhcZESHkI6iTXSH6gjmtwvu2rf4X9/QBxB1iTB8RFNNQBcTf6
	6zoIDg4gWzUkQASYfQRi5MrUon7sClX5WmGSzITufkvMvATgy10bCdeuGrohy1RvfSjFwDOyR0s
	1JZzvs9gDnx3SyjQs1von/2CRRzs+IfGd+wL2yNjPB6KG6nMbrGUtqyq9ulXVac8DrzpUq9QX5m
	Q6OMbwc1BZiZMenBX59CcppK/5UD/ISAYlEL7khBBud4=
X-Received: by 2002:a17:903:38c5:b0:298:1f9c:e0a2 with SMTP id d9443c01a7336-29b6bf804b1mr326588985ad.54.1764342112232;
        Fri, 28 Nov 2025 07:01:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrtoujn21Vz/n9fhB13s7On3iyOdgYLySngto6d4fsckx3iVqGAF6Nw8puhsnZX3EyxbIbSg==
X-Received: by 2002:a17:903:38c5:b0:298:1f9c:e0a2 with SMTP id d9443c01a7336-29b6bf804b1mr326586855ad.54.1764342110020;
        Fri, 28 Nov 2025 07:01:50 -0800 (PST)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7cf89sm48930635ad.99.2025.11.28.07.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 07:01:49 -0800 (PST)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: interconnect: add clocks property to enable QoS on qcs8300
Date: Fri, 28 Nov 2025 20:31:04 +0530
Message-Id: <20251128150106.13849-2-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
References: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
X-Proofpoint-GUID: N0Kev7LCvAUud5DE-3L4z-z_hjqGIAc4
X-Proofpoint-ORIG-GUID: N0Kev7LCvAUud5DE-3L4z-z_hjqGIAc4
X-Authority-Analysis: v=2.4 cv=WIZyn3sR c=1 sm=1 tr=0 ts=6929b961 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=O0wWR00VUJuU98rPFccA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDExMCBTYWx0ZWRfX97Mcgox4EEVI
 hP4VMytx9vctyWaK9hqbk90TWpr2EH7rb1qkiphXz4IV40+Kfyn54wrY9Ltvnhwq+urdGt9BLLS
 ZKCe1mfuGgirKqeAJaSF4RYoA/ZAoafw+PaSQrcIXKXNNADO9ZzyzU5kYLtkCo8aSN3bdDVBe5P
 K4ByPrS4zcGrlt1yjUCN93XL8FUsL502FF8OeywKfQG9EP9VA8i6ZQcEtAj33wCv5idJbE2gDyq
 0sH60vEojNi9Ffx6fie1lIl/vej9qqWxconxh5wykW3onqd17+IlXTsrqZbgFs//F/tbShLlwHd
 JzdXsT6rUha51W+2PGcLdGh4Cjyw75xqAtkw3N90zuVWMScmqaXAYMM2RRiRT3I79QRdKibz8HM
 WW9600YUk6wqDaDLwOv+KOGDNDKYoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280110
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add 'clocks' property to enable QoS configuration. This property
enables the necessary clocks for QoS configuration.

QoS configuration is essential for ensuring that latency sensitive
components such as CPUs and multimedia engines receive prioritized
access to memory and interconnect resources. This helps to manage
bandwidth and latency across subsystems, improving system responsiveness
and performance in concurrent workloads.

Both 'reg' and 'clocks' properties are optional. If either is missing,
QoS configuration will be skipped. This behavior is controlled by the
'qos_requires_clocks' flag in the driver, which ensures that QoS
configuration is bypassed when required clocks are not defined.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
---
 .../interconnect/qcom,qcs8300-rpmh.yaml       | 53 ++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml
index e9f528d6d9a8..594e835d1845 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml
@@ -35,6 +35,10 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 4
+
 required:
   - compatible
 
@@ -45,14 +49,39 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,qcs8300-clk-virt
-              - qcom,qcs8300-mc-virt
+              - qcom,qcs8300-aggre1-noc
     then:
       properties:
-        reg: false
-    else:
-      required:
-        - reg
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+            - description: aggre QUP PRIM AXI clock
+            - description: aggre USB2 PRIM AXI clock
+            - description: aggre USB3 PRIM AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs8300-aggre2-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs8300-gem-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GCC DDRSS GPU AXI clock
 
 unevaluatedProperties: false
 
@@ -63,6 +92,7 @@ examples:
         reg = <0x9100000 0xf7080>;
         #interconnect-cells = <2>;
         qcom,bcm-voters = <&apps_bcm_voter>;
+        clocks = <&gcc_ddrss_gpu_axi_clk>;
     };
 
     clk_virt: interconnect-0 {
@@ -70,3 +100,14 @@ examples:
         #interconnect-cells = <2>;
         qcom,bcm-voters = <&apps_bcm_voter>;
     };
+
+    aggre1_noc: interconnect@16c0000 {
+        compatible = "qcom,qcs8300-aggre1-noc";
+        reg = <0x016c0000 0x17080>;
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+        clocks = <&gcc_aggre_ufs_phy_axi_clk>,
+                 <&gcc_aggre_noc_qupv3_axi_clk>,
+                 <&gcc_aggre_usb2_prim_axi_clk>,
+                 <&gcc_aggre_usb3_prim_axi_clk>;
+    };
-- 
2.17.1


