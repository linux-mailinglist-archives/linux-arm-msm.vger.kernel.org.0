Return-Path: <linux-arm-msm+bounces-69361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D112B28081
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 15:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87FD3606A9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 13:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723F830276D;
	Fri, 15 Aug 2025 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8vGIPbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5772BF014
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755263913; cv=none; b=ClJbfSrMJfXN5QHt/Nkde7bGC2qTy6nSwq5CvZirYjwjIzK5Nc7+jn3mj6Fmibz2ld8Hi+BRJhc+JbedZYJYHIej/BUJN/8WdXX+TcIDLlarsl2+YOpzXcItf8ALqawL7qUxKF0ynkw6uoPvIWIDT6nuZdXvkEg/xVloJwynpxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755263913; c=relaxed/simple;
	bh=iFGrvpCpH4OzqPsKWLDwUClOVbka/29o5GG8qAczHik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qxIR7nJJX6/46Yo6dF84RS0JsY81KELGsA2cI2JOHIBIHPgHifJRFOTeQKf+Cy97poKIxeNa82grrLXwje/RYzh+F30iulSwO3/Olmvp+bI5skqbstrGjUhr6HbVj/ml6sZDngghPHcCMDWdOBpZzSrA7X0DiOOvECKpsN3QHDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a8vGIPbU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F9lmvT026511
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 13:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNTmoIT+3QSEdOQTRVOgb+e3bVVubsrbyt1Z7+uuZKE=; b=a8vGIPbUhBbv7WyP
	cXShsEKMilHW1xOWWDfq/frwKaFouOlgq+znPSdndqnMeXEqf2oOZi0YizC5mtli
	pApWXRJLOdBDybEi5HmgzJU7tAuees+ThcwE9xR4312mYu4Db0OyjzTf607ZaW8C
	nXw1bF31pBZ48fxY7ofO6QMaKIjsjx6kT+tsRuRc4OSVA3bChwxgGwcpUocanaGJ
	FDeWCq/dqiABK96S47nWAFM5VGnxPfFuQPcPQ7om8Cvf8EsSo4IPR8tehzGh3i5M
	IWzex0WH9zOBS8tBHc6wIPauDRRM8d3bQi/jgXBKegUTq+FM4L4lPH6snQMWCdWI
	3JDFaw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6y111-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 13:18:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e1ff27cfaso2603570b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 06:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755263910; x=1755868710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNTmoIT+3QSEdOQTRVOgb+e3bVVubsrbyt1Z7+uuZKE=;
        b=Pn9P8W9kcCrq0FLkMHkT+K22Ee2GpZOShCqsYqkA2BgriE14Quc8FmazyHe2TT+Dic
         HJ/b9uCGjLCR+Kn3HI7Aj9lsKn4yvBP4KlucHW3iv99oOExZ+GPG4wA+gbHvuU7qfcvl
         D4CKy8tSUPnjnOVYAISnVK6cz6nXN1IOh6J7BGrQ7Km8GDqxfiJqtZDxzxPO+3Ru0chn
         wsazy5FkWL2sBEi6airCQMlWRPtDsuXPHJ9ExaA5vcO2fkxhmLCz0KNzdL2GM1qI623b
         wj3V85sxtBJVdori3X2AKd9+9JeadAQm9e0PJruJS+gzxKHOODWkQmDbpTJJ6G9YPvNW
         5ciA==
X-Forwarded-Encrypted: i=1; AJvYcCX4oIs2707OaUItFaPI8J2we6kqGZiLRZYHMCitR9G1JyBboU7SBandEHsGCnsjnLiWhxpJnbelTnOWrAr7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+lSgSpH+1GmqncL/sMJCmmfRhehXGAKhtoCoN+fVdJi6vavS8
	pvnlbzgR/mqatyv96ATDtRUlYnRaUao+B+cOMDlfXf/1HugCrqbnr66P58DSWXeFX97U06aQ0K2
	zYbJaa1Yd0gioTDbFE2GXbvCJyKkXCue7EG76dZMRva7ijMbrNfHjunOXoYw8B3FzMPKKvrvuFH
	mRyP8=
X-Gm-Gg: ASbGncvtdGL4jPRyR0Yl0cK8Jk2cQO6PbeSAm/t9VvTjfRGLNlqcxaIDkS/8r8cf5UU
	GuKNOrvp9Clz3jvBRTAVMYKhGZclYWxSLwKPp/5spNsMKKNhkO4EYAypHCzpfxKleSimf0r6YH5
	srVu635LKD/kXsEugBvwwcBaJraMBm3CIJBx73sauG9GGqvxtmIyMIx4lsBWFWd3uIl+At7GbVP
	6YkscUiRtpBzFTIpVNeStiBr0n26wT+wCKiKETWECZqOxvmWACWmo9loTfV+3BY6SsQzQQ7ziKO
	U2apnc2Gnl6754DDHk5GvuCBIAJRFd1c0pCJUmeaKSHrtPcBTo2Z1BTPd9UTFGpYIFH2BP1CtzI
	zMhMEY7q3JE5v5BAQS+hL5A==
X-Received: by 2002:a05:6a20:a105:b0:235:2395:9b79 with SMTP id adf61e73a8af0-240bdbed996mr11657814637.20.1755263909694;
        Fri, 15 Aug 2025 06:18:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVgtlGuHI3R5UTZppK/I92pbWdnaCgqxM5po9lFPqc8ruSdgnzkjF7GUIatpizm+XOrJCpEg==
X-Received: by 2002:a05:6a20:a105:b0:235:2395:9b79 with SMTP id adf61e73a8af0-240bdbed996mr11657761637.20.1755263909236;
        Fri, 15 Aug 2025 06:18:29 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7944e6sm1256386a12.54.2025.08.15.06.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:18:28 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 06:18:12 -0700
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-itnoc-v1-1-62c8e4f7ad32@oss.qualcomm.com>
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
In-Reply-To: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755263906; l=3400;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=iFGrvpCpH4OzqPsKWLDwUClOVbka/29o5GG8qAczHik=;
 b=qyemCdR3P2VMmp7XSc+HQGGmjYmMzyTQG+snL1xiWIJZY/XORmtMi4kBRE3qJEpQsRwMvRJDo
 3CPb/IldSn1BjS12mEqgCgJiZjyfgJan0lEIGyUKjWy9sFlDUSulzWF
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfXyAng5zstMKWk
 qyQXBVTFW0F/n11F0NKUQJSq6WWhBKGQU11sHygJqPt0pFPq3Qh6wjeKQ/gMK1ISv+mkbGwE37X
 a+0LLYd0uh8NSyXYu5TpzjXHgcxh6uSUCkliUo3MBfLL3IMRH3TtowKHGk/NGJszfQOOtH06fsk
 OpmvNJrVA80QMu/LylE9NlAtqdbAp2kCKlu6UKhDrnTgR2KNqBBi3c3oC7lfN6YcHDUKpfM/yvl
 K+O5/W92hRn5ZIyNWQsL5lQ4H7rN+WjlPbpiADrHb0AECp4bYVmBM1OYNF85jNAVK2R6xcXSJ6n
 VGAhqh2nlueQCYrKbBesXRu3CxoMEx9GDv5J3mEytm7EIow/4PpJ0YIU8XaGdP5O9BL+Da99Ylk
 R6YTFovG
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689f33a6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=v7KY3twRVyNl3kJcRO4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: jYMcTJAPyUZL6MebE-l06xhiP6p2ri4R
X-Proofpoint-ORIG-GUID: jYMcTJAPyUZL6MebE-l06xhiP6p2ri4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

Add device tree binding for Qualcomm Coresight Interconnect Trace
Netwrok On Chip (ITNOC). This TNOC acts as a CoreSight
graph link that forwards trace data from a subsystem to the
Aggregator TNOC, without aggregation or ATID functionality.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-itnoc.yaml         | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fd224e07ce68918b453210763aacda585d5a5ca2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-itnoc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Interconnect Trace Network On Chip - ITNOC
+
+maintainers:
+  - Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
+
+description: |
+  The Interconnect TNOC is a CoreSight graph link that forwards trace data
+  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
+  does not have aggregation and ATID functionality.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,coresight-itnoc
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^tnoc(@[0-9a-f]+)?$"
+
+  compatible:
+    items:
+      - const: qcom,coresight-itnoc
+
+  reg:
+    maxItems: 1
+    description: Base address and size of the ITNOC registers.
+
+  clock-names:
+    items:
+      - const: apb
+
+  clocks:
+    maxItems: 1
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^port(@[0-9a-f]{1,2})?$':
+        description: Input connections from CoreSight Trace Bus
+        $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port:
+        description: out connections to aggregator TNOC
+        $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - in-ports
+  - out-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    tnoc@109ac000 {
+        compatible = "qcom,coresight-itnoc";
+        reg = <0x109ac000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb";
+
+        in-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                tn_ic_in_tpdm_dcc: endpoint {
+                    remote-endpoint = <&tpdm_dcc_out_tn_ic>;
+                };
+            };
+        };
+
+        out-ports {
+            port {
+                tn_ic_out_tnoc_aggr: endpoint {
+                    /* to Aggregator TNOC input */
+                    remote-endpoint = <&tn_ag_in_tn_ic>;
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


