Return-Path: <linux-arm-msm+bounces-74764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DF7B9CA39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E20EA189D6A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7814F2C236C;
	Wed, 24 Sep 2025 23:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqmfDFdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE752C11FE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757057; cv=none; b=bzNLLWRw2dK1iNIBT4LiegcnAbxNXq0XDOykp0BTiEbGYJ0w6OPSBii7aLpqmKVdnukGWA1cuUqqv2m/44s6QYIjgHpVbOBmwWiMBCCQqhEo1jAqMBAyvyR+vcDJQ4nF4n2V7Z5ZJdX17kIfLFG5nZBpyHhs70f4HXWXL969tuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757057; c=relaxed/simple;
	bh=E2kswPEa7Z/dqa18AN4dVGtUw40R4o+M3q4COnW3j04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tu2iQt9LDZ2sncuj5Xm2bKwtNeLbNgGw9Q44JEtPB09ZzErBVUsCuRtQ3N4POI4rhTWSDxJiZkY4nd5fGLmDgfk9OQUeJDqtU/V2lSHzNeKoTc3VPABml0Q6bfRQ8QlZQUb+YBSN6GBoMifPvX8vwCR3xgdinQWSlk/TKIsDtnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqmfDFdk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD5hpk029706
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7JCp1XKi9OGxshd/TqEHFsIIymZn1vrcxRRDzJe/aeY=; b=IqmfDFdkwNRJQxKU
	K6PKUqQgv1ZHCoZKZinSwYVJ489HL3jPW22NrSY4KOCSc//QIjMisJYe3OqLMXpv
	hyFm5zm95CMRsho5SrDpi1Xpsj7gY3bFSNySjculhdabukds7N5DPmF2YYHaTu8G
	RZe32gR9yFLKk9UmaDCRHpNwCQGFXFANuM7sPTD9lI234nO4WfL3QTjBSQ43VyCx
	E1/kDvk/wSTFWc2zVdRd/ITK6KtEGgeUo+uliInLkIwQWoy7bHxLBu/qHcIi1QQg
	aob0bbRRcYAskQWPdwpiI5v8wywRRNLexRqTaGhEoRZ7mJ1vbqVb5apQNB+LKIXV
	WVrz6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fnx9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso292992a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757054; x=1759361854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JCp1XKi9OGxshd/TqEHFsIIymZn1vrcxRRDzJe/aeY=;
        b=m6d+iGhVq8XRzh97Ed1MVT70YVmzEAmmVsNvYaDdouOl2A5EJ6sglBHlHTt3qs08S8
         V9el+0F/287s1GjG+n7V12qej+7Cmvbe530xSyM9DLINI4pQSWu9UwR6POLZ+NZHRCpE
         pRHuIeADJknSFaIdwooZsoPT/Jw2qqw74PjNtWFeqRwCdC2jLExZoNq/52W5fXBNi/5n
         kjYmncfeYKsuWjbkmPxXoXCAFsUnm4Po209p8kcrNQZ0mTSkqJ9pXblcK4qnzPFNlI+p
         Q8Hc9nDvQItKeSF4u3jLfhQCLLiypJ0ypcufQ3m04+Rqxe2zEdaxSxcEFM77F6ad7p1i
         B21w==
X-Gm-Message-State: AOJu0YzYgYJxLQbKJZLn1ZpPfmUs1cviWVdriMDAn4SymlLwJWtXSmeL
	aD7uOiblvaSWJy0hxk2LQo1udN1qQWXjEzpBaSZmXNRWj4dSvOMdemW+iaKOmYJOdzk9vFBHY+6
	ToGKwJhAFzDNNWdHS3XkwrZV5++3VwXBWiA9E6Lly4heI2fPKkvO/yz7zuq0g7GKKDkwU
X-Gm-Gg: ASbGnct2+4Vsoi0bVh1gmKa5bWzZLYpcgMBq3OrH7DZdAqF0ReKD1XGWGo0w2Dc6bxZ
	B8HTA/aeAwNF4iPuoQ53q1I2k0XnYdxi53xW+tntuqr9FD1XtKDf89Ehj+3zGGplZPwCSJGcIMB
	MG4DUSHU84GgkT8zRMhxddDOZPkvIXErjlk3sjkVxMZrp1jPEalMAbjZdoAiGbvIpe8pbXsMgQc
	bHDRdKDMMpXFk5gILYJsUXh+d+z6elmGciloxTqpFV7e+cf3c9GvUaFUu66tumOuLeWtFcySe5+
	WeNzGT2W4sS9q32Rt23IryrxTXm44jhaWrFtMO4upmWePmiqcMHjm/tjObTR1v2kzgp25OWTyhw
	LzIT/uWYtsBuj0+s=
X-Received: by 2002:a17:90b:1c11:b0:32e:96b1:fb70 with SMTP id 98e67ed59e1d1-3342a24d44cmr1795296a91.12.1758757054174;
        Wed, 24 Sep 2025 16:37:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkkN9qQrO5+bWN6i2GUTxUabSc1/MZtBCOrbjb13Hv1Tm1gNtYANazjt+JQcQDCxBNjhg1Ug==
X-Received: by 2002:a17:90b:1c11:b0:32e:96b1:fb70 with SMTP id 98e67ed59e1d1-3342a24d44cmr1795259a91.12.1758757053697;
        Wed, 24 Sep 2025 16:37:33 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d73550sm227187a91.3.2025.09.24.16.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:37:33 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:37:25 -0700
Subject: [PATCH 4/6] dt-bindings: remoteproc: qcom,pas: Document pas for
 Kaanapali SoCCP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-remoteproc-v1-4-611bf7be8329@oss.qualcomm.com>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
In-Reply-To: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757046; l=6113;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=E2kswPEa7Z/dqa18AN4dVGtUw40R4o+M3q4COnW3j04=;
 b=1pJcIo6vuAOk1AcZ4llHnvrfOfOKZbMGPh418Pe1TuYYTp6+XRP5aG40/GG8nncFu0kaz7frn
 qv3nGiG2GvCClljSUNnXlo0fFTtP8pG7fLL934D1QDPfD0NTOB4ywB1
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: fyLXTQnUjDpLLg1Lg9JxbujNspQY-m58
X-Proofpoint-GUID: fyLXTQnUjDpLLg1Lg9JxbujNspQY-m58
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d480bf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=prA4bPuakm6frSlqrYEA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX50E1GyfLyAm/
 u8jCEvn82aoQ4korkiiJiQa0CNECZViIOK76Tt3ddxjMoa3SQZoJ4UmZCzYKi3Gw0cci2v7DDOQ
 fy2S9CTVTpi7/KbzmesLPzA9/JbfjLu8XgM+wnXGMi/iGJX/37GbjKJrY/Pt8BxCXD37p6JZa0p
 yTWdGSbuVJGhD5WKS6US3FzEzzDZQ9M9a+b5um3IpIjQLqMx0tD/jD6MCdvqkkiWkK986h0969c
 dk28qXi4V0EIalIP3ZHXbZWoSkTMUck4b956nO35LLoJepbR3RxobIK/QaH9t6DUyrr6HUNKCbq
 kddU7CM3OerZ7dkGwIs7bbGrD/kCkEmbvLNK0DNyq1EIQZImjxo962zRJ+2K9KVcsvh+v/dA4ak
 x6jsD3/I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Document the component used to boot SoCCP on Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 174 +++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
new file mode 100644
index 000000000000..79f678f5f7d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,kaanapali-soccp-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali SoCCP Peripheral Authentication Service
+
+maintainers:
+  - Jingyi Wang <jingyi.wang@oss.qualcomm.com>
+
+description:
+  The SoC Control Processor (SoCCP) is small RISC-V MCU that controls USB
+  Type-C, battery charging and various other functions on Qualcomm SoCs, somewhat
+  analogous to traditional PC Embedded Controllers. This document describes
+  the Peripheral Authentication Service loads and boots firmware for SoCCP.
+
+properties:
+  compatible:
+    enum:
+      - qcom,kaanapali-soccp-pas
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Pong interrupt
+      - description: Wake acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: pong
+      - const: wake-ack
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+  memory-region:
+    items:
+      - description: Memory region for main Firmware authentication
+      - description: Memory region for Devicetree Firmware authentication
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the Hexagon core
+    items:
+      - description: Stop the remoteproc
+      - description: wakeup the remoteproc
+      - description: make remoteproc sleep
+      - description: ping the remoteproc
+
+  qcom,smem-state-names:
+    description: The names of the state bits used for SMP2P output
+    items:
+      - const: stop
+      - const: wakeup
+      - const: sleep
+      - const: ping
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    unevaluatedProperties: false
+    description: |
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Remoteproc.
+
+required:
+  - compatible
+  - reg
+  - memory-region
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc@d00000 {
+        compatible = "qcom,kaanapali-soccp-pas";
+        reg = <0x00d00000 0x200000>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack",
+                          "pong",
+                          "wake-ack";
+
+        memory-region = <&soccp_mem>,
+                        <&soccp_dtb_mem_mem>;
+
+        firmware-name = "qcom/kaanapali/soccp.mbn",
+                        "qcom/kaanapali/soccp_dtb.mbn";
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx",
+                             "mx";
+
+        qcom,smem-states = <&soccp_smp2p_out 0>,
+                           <&soccp_smp2p_out 10>,
+                           <&soccp_smp2p_out 9>,
+                           <&soccp_smp2p_out 8>;
+        qcom,smem-state-names = "stop",
+                                "wakeup",
+                                "sleep",
+                                "ping";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_MPROC_SOCCP
+                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "soccp";
+            qcom,remote-pid = <19>;
+
+            /* ... */
+        };
+    };

-- 
2.25.1


