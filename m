Return-Path: <linux-arm-msm+bounces-85761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B541CCE53D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 143A33030CAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 03:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B65273D84;
	Fri, 19 Dec 2025 03:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvM09aFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmPEQWGU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D807F2BE032
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766113833; cv=none; b=rUiia4x77/eAwd7TNQSfOb3q6SQhyvp7ttigz5nBRs/2x0E/ebSuhHtg4h1DQXqsmi+twhvMtGPakvfWm2mplFrXE//Cghlfy3EHFbiudPQvLwHbfhcKZGHPSGzTzzqBiTC0JH2jKVuSnaa5HBlrKmp92x6VLn6At0FTv2TiLzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766113833; c=relaxed/simple;
	bh=h8mX/eWsKQwF0Uehul0qVJWkLSuoHda8rUYiQFELRIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g+mM7j0yHiaOFIE/eFxdRLYMrvjcyAxaTTbizhEnNF/Ys8cHJMPxHGUm7mK6QqJxU78gft0CvGemzWvtNGM6lTJdlkgcIRhaAOYFe/sB244TaGUgfD/OZ0+8rviPujLqsHUFKw5BHbKNcmyF4fd8GVFtRlF86jYNZxmYJ1XQ2jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvM09aFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmPEQWGU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ2NsE73997610
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eW5n61pbmay
	uVuiaYDK5efDpDPsykPGK92MqwSXBzYs=; b=lvM09aFr4/Fsv7dxHrmlCFrHPOf
	JfPIzC7Q4O1SdMjZGfu/nb/QyqnxWA+jSP+qBMTs5gH9JUkHm7syF7IkiewOwiix
	u12ktSiFpSgNEx95xwzdhWum9R7mOlO4c5Sxt8KPqzQ85aJkDR8mUU9Aklo2cdbW
	V/CpTeymmKJwfxYz6R6o8L4Or6ui15s6eGtrLD+iD+Mb63j8jin67cSQnFmwP5Pj
	8QuoXfoULR1lZowZQsZ+VshwkZzNiXAirrFMm+ysrXECsyvNdusMcsaYXXoClntt
	utM7o27wMgPa5G15b3VcwgNauzcRiiEepmONGcd3lIGuaDKXDfIOcV7iXxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2e9085-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c213419f5so1289402a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 19:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766113830; x=1766718630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eW5n61pbmayuVuiaYDK5efDpDPsykPGK92MqwSXBzYs=;
        b=OmPEQWGUAS6CZ/keJfozll9akjQnwz5Eok+8d54hzJK3P0ipk3ivwNwN5Q5hlNRtmd
         uz/NJmTHxCvjzxWweqEVPx2W86CFF28GXH473bDXwIn0UhCj50JZsWDO3jxqzN6RQonL
         +MH3KrqjKT+TNMA0dA1bXqloTW9yO7MPmjTaM13QUVPmZsS4oWHK/zdngh+wrujYUXGS
         5DynK8f3J5bb1FelIaK8uUIIZIYQwrX1dufxWoGPFMO0ssIS/71tc5b44wfat2NSy/6U
         HcqnBaGnoOD3PIvlfmxKjPLdJA1sWSyIYyw72MWnc+aAi+CH4pK0vxgQmf43E9PPZQa2
         YLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766113830; x=1766718630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eW5n61pbmayuVuiaYDK5efDpDPsykPGK92MqwSXBzYs=;
        b=GKLUHejOBTpaPP16SSczWu0apF0u6KuVbNv5nwhP93MFuLdJ5mgzpNaeQcz55WPR1t
         xd/S9GVnSMlrwpLE6Wm6Xyl9wfuswzDTIu7/iuNX5KRlG3QEU0r3ANdwAhnitCn18eyH
         6fm1084zDiZucF+cq9TEfkqLVEBvZc9FQSU1Fn87SUIlB43Cqix/KL0jRCDPH58p2g5h
         uK/RsDL9Qi/fw+J1VzPfeIjgXk8mWElZ1PT0LcIkQYlZJIba42vqy2sENX4K0ugnmkd2
         MY3t6YU2rykj55efKvqFNUsLY3XRVLbOTmLjkzB51eyxAPHnVUzAT0K8vRRpVqagEa7y
         HLaA==
X-Forwarded-Encrypted: i=1; AJvYcCVEd50D4IXmFKou5s4yfX6SNim09nuft/A2eKYZk3PQ1UWVIvACbIV8h2lvFOQQq3N679+e+/EVlbHpvYDL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ZikXIBjL+nit+JhfPiS1wHZEzzg/zMmeXtGagezRS9WDSULE
	JjPbOqJaESM4mfMJQJmaVLOF+S30HceFUnSJ0CAjSJLxCmwcPJCew1VyRSxZ/yrBouYWFRytLBB
	LnfiszCOAvXJKRnXUAP8Ms3MPZ+B0W2Ew0OOum/+eyq1emPgpJf1KB7RemULys99tpmQr
X-Gm-Gg: AY/fxX471m9ikzExosYe0Nc4deY24d2VAQYCxud8sWjtS7OStTyCwJff1wFFIK5nW82
	OUF2MvDUAE6pOQHYwg2SrsBwv2UX9JwRvoDZjaMJZGu6uTXU1EB3BGHNdbDV9WyX129tfDYgalc
	mnHpVF0bcEy/t5rLxD21zLBe/gbw4nxnpAQHor4zuNSG8BWa5x8g1F2Zf2F8ZCCtJigb+xZzPn0
	1q4uYyIXKXUHv1X14X2zS9H5mvphY5/wFbop9slIxlFwPqNClbB65dZgeIti87M0YhephBQcbVQ
	8PbTSWBYvQoWR6i4IXMmlGpcKc/b6jTkEnFOwxUEQLzyzA7oZrysVpjowwb0zHUwnvV+mCmfJlh
	Tn6FmHpb4Q2lx1c47yEG1uUnhZ68VaLGQR0+ubvcz1R9Zyl7SvT21I5ILq+Pp5vkv6j77CDSnPt
	dgLxEQLnlxPO74RvNS9rIAarlaJiSZMZoCNKddqUI=
X-Received: by 2002:a17:90b:3f90:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-34e92129212mr1124490a91.9.1766113829561;
        Thu, 18 Dec 2025 19:10:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnapohLuqpn29XFnuZf7NflGg1MlQmGn/daIsas6ruwh8VynXYNP21k8N9QNAD+pJyb9LwZg==
X-Received: by 2002:a17:90b:3f90:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-34e92129212mr1124455a91.9.1766113828632;
        Thu, 18 Dec 2025 19:10:28 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d656casm3737867a91.7.2025.12.18.19.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:10:28 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v8 2/6] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Fri, 19 Dec 2025 08:40:06 +0530
Message-Id: <20251219031010.2919875-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAyMyBTYWx0ZWRfX+kJNvCumphzb
 9zsWMiNiTvJhswEXfPKTKzmH2L0xZSz6WHl0COq79YplpfgRG70audlPRjJRU90DYHE5mJu5Zrt
 erBV6kmQW8OnkymemWrh6NZPgHzFgSATZumTQ2X2QslCBOPTqnox6m2JFVuZlnjEWHpQepsz8Ei
 IptI1RMsixolkXrl3edI0SUJK3wwUFKHvNlwqI8j9OrMNNs4wb54hjUJIemza7iEsG2ovSQTZ5w
 eyXEu4reyB2LSb7yD/YNZE6TVAHjJ03YMVFd+gW4C+W/wfFb1MSbzq5KjrbjW7yvX/QThSvYiga
 0+U13OD3ql2Ds3oGY5YHghoMdmbFTZewc5XWOOdsdhPyGg5bpVvFk4fwqwDdBynxH2tPuJa3QFv
 MbUyiBp/tprHb2ybjHb6gfsdy+othiQcwERCIO8IQ/jugoiJ+JBXQnQm/bIJaxY+ycleGRWfXMd
 y5wQMjVqGQJN0RB93SA==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=6944c226 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=djG-9oOksrOeMvnSsGYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9d8eKqkQoIEuZL4XMzF0p27MdfqeArbG
X-Proofpoint-GUID: 9d8eKqkQoIEuZL4XMzF0p27MdfqeArbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190023

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v8: Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
    Drop ipq5424 support
    Update example to ipq9574 instead of ipq5424
    Change 'mboxes' description
---
 .../remoteproc/qcom,wcss-sec-pil.yaml         | 172 ++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
new file mode 100644
index 000000000000..0fe04e0a4ca5
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,wcss-sec-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCSS Secure Peripheral Image Loader
+
+maintainers:
+  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
+
+description:
+  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
+  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5018-wcss-sec-pil
+      - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq9574-wcss-sec-pil
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the Hexagon core
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  clock-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+  mboxes:
+    items:
+      - description: TMECom mailbox driver
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Stop Q6
+      - description: Shutdown Q6
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: stop
+      - const: shutdown
+
+  memory-region:
+    items:
+      - description: Q6 reserved region
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - firmware-name
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - memory-region
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5018-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+            - description: AHB interconnect clock
+        clock-names:
+          items:
+            - const: sleep
+            - const: interconnect
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5332-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+        clock-names:
+          items:
+            - const: sleep
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-wcss-sec-pil
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    q6v5_wcss: remoteproc@cd00000 {
+        compatible = "qcom,ipq9574-wcss-sec-pil";
+        reg = <0x0cd00000 0x10000>;
+        firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+        interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack";
+
+        qcom,smem-states = <&smp2p_wcss_out 1>,
+                           <&smp2p_wcss_out 0>;
+        qcom,smem-state-names = "stop",
+                                "shutdown";
+        memory-region = <&q6_region>;
+
+        glink-edge {
+            interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+            label = "rtr";
+            qcom,remote-pid = <1>;
+            mboxes = <&apcs_glb 8>;
+        };
+    };
-- 
2.34.1


