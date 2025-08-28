Return-Path: <linux-arm-msm+bounces-71084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE60B39834
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 11:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BF9017FEE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 09:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598EA2E8882;
	Thu, 28 Aug 2025 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMiOlCT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2582DF6F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756373251; cv=none; b=bDKkh/aU19NV/GSHKZRXOWJu/lty7f/qzuQ7VjU861S0qltgtuGwKJcRnonJngqJmpLJ9RR67e2Nln6u2WPI1uZ4ODW42zklYoX5ftRLiFEcUYyuf1sVtNjVp9a2qSxpEuw7IX0IK6MNPqcnuzxx/aGvyUSlQYd0FJOFDhRiZjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756373251; c=relaxed/simple;
	bh=ubXxXSq3HRpwyGgZB9pVBtD7LlF/Et+jBwYXGMM3AgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cz4K2384ZNnUQxBmQw8PuivLsATpr1+hGaeHgu5GcHAyiH0yJZN4+GXqftYlpUrKdT1OQ3JUUVH5frqHxrsOeG9tZ5jA+ozMkAKZjIekXEB0V52f6JXJRh6rZ9TLbgXsffboSkfaUC8KMROvS6hgvm0p+pHE3StXWqtaSkEN0rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LMiOlCT0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5O2Ff008255
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RBCQZAQQ3qbcPWi42TsUywUHN03HVpohWHspiY+9TU=; b=LMiOlCT0S04iqj/M
	7w+l3wHyTY3M9Te/rVK14U4cUyYxVR0uN+cAgQzCb3pAcABaK3fZ52hKSLqLyb0V
	3gy+MtcermJl5oqY+A5Xrvbcms3M43cogbmOKvpjfzeTpOxzHdO+0u+P+arChA8T
	D6fDq/4a3E+jbvJUzHMQzzzd311QgmtA8VYBjY+3VUgi/ML8IrBF+w7zIA6T9Ci6
	WXW8Vm/5ydGCyE51HKa9SoSIcwVCuD98WpTqdQW23nJsva9kwiqCPb4qiU6bCr0V
	LCSeLS+k+Wearw1FKPxyjVxONSzynfdLVkFgn28M/7/8vs+pD1sLP4SfUHDh1TZT
	5oo6Bw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8anygu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-248981c02cfso8953495ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 02:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373248; x=1756978048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RBCQZAQQ3qbcPWi42TsUywUHN03HVpohWHspiY+9TU=;
        b=MXLbq0DfjjTaxPPo5q4N9dnrjUOLTNoT4aLWRCep5mer9HJbwommFwApD1108GGiiJ
         huAjEZdTWLeAiFBBiGjG7qsR7xC9tyIqFTVQ2XQ3Qh0GNi0kCuFcio37XgR5ih0eGIHb
         dWjoByvUgp0pi1iW8zy+OYuu5fzGPQeWTvU9zGk1gSGEiJrNBDfIbc3nEo0b14Pn9xRd
         Id1tqzNG/+w8vI2/JiOk9Kg666X2kY8UkgBT62yzjwtv+w8ZwalP2GtQyMBv+eBcb4Xu
         4Z7E8F6UZw7u5TbI0Glvw0frcJ3P6jXxIfEd4XQRTFRUQ6ySmrw+/PbcJPdusCoP5GSK
         K4ug==
X-Forwarded-Encrypted: i=1; AJvYcCXMd1G6+S3vyi2W016Hyt7WQQsOzACkZftcLdeJfAHa0ASAC/YvzaQR98DEjzqYzfcJVCoVpE8uveuEyJbv@vger.kernel.org
X-Gm-Message-State: AOJu0YypHoJT3m+pirRMcMwL2ieVtUiOGL5GHzmMHBbJhl4VSM7sYGu6
	S4EhF82KMddwlGRex/leznZ1XZ9NAhuPU1YLyL1r0XVujk3rWU7TCp2YLYdSRKDvK6wxdCxhry9
	frcbzt/w3xEJ6x0CPdWH23SWi8fgjyY8eQuDRRMUtstwnM5bXPOIk7sm1rIDIvfnmGSNO
X-Gm-Gg: ASbGncs/j/InAEbmGxPzIne9HMkmcdrpLa/7LqryVj/4vjHsGVuuzcHqrHUJ1APhvo0
	r4wvU9wiMzCf4FixGw0GFo5Xthk/F/pZqN0kuHGYPrc/i7jyi2EhP36gi+3/ufKZRjSguZq6uvt
	vU17reiEPM82DrYdX5lUtotvA5JfoItAsGQ3rdfRZcKjrk4cJtO/34tVmXvLMxDe74PpwnzBkLm
	h47Az/qTCQZHzlVsl+h3X/zLVQTusLgXMu4HpQGljMSkQVHAGfiC7hyG/cUEZ75UxPmSXZO3hJv
	TT8jdc4JuC3CnwXvs07swJkciodUAjoBY72lE7paJ5LYKYsvx+XtqVLdh2AjducYgQ7qTugjZwG
	XSmnEnLmUITGUi3l4F2tb8g==
X-Received: by 2002:a17:902:ecc6:b0:243:12d5:db43 with SMTP id d9443c01a7336-2462eb44c45mr315240675ad.0.1756373248068;
        Thu, 28 Aug 2025 02:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhgSpOuOEMqNem7SfvViYQxUPC2kynQsuvn/YrvRYMejOOvFbxYueIAMEDlNDix/TQ6ccBgQ==
X-Received: by 2002:a17:902:ecc6:b0:243:12d5:db43 with SMTP id d9443c01a7336-2462eb44c45mr315240355ad.0.1756373247541;
        Thu, 28 Aug 2025 02:27:27 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246ed91ee20sm92497015ad.136.2025.08.28.02.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 02:27:27 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 02:27:22 -0700
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-itnoc-v3-1-f1b55dea7a27@oss.qualcomm.com>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
In-Reply-To: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756373245; l=3025;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ubXxXSq3HRpwyGgZB9pVBtD7LlF/Et+jBwYXGMM3AgA=;
 b=Zgwlt3jRD02lL12U66KU4jhzO1e2GLLqoZX5wl63ys0VNVc0JVoilJq8ycPw8K9YZrM2ChWM9
 6TEHNPVDzgxDr88uDQC8FjEDBveI9a2wEv/4o604J5gJoL0jiXMHGkV
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68b02101 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=-QmmxQN2S_yWG1-YAlkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfX6dP9OV2RMvpQ
 qWI3HVWXea4OCYQ+MBQrQ7VaEbsqY23fx88XS7QwhAjQt0lmCYmiNHbgjD7kg6z/aWf1m9Jtbon
 Hds9Qfm1AjuUsafKZyvIyoxYJG1HkCq+n8QOloyjhL0y3KCKVzsVNlISjgsqawT7aBx1XIy9v/U
 2hFTQ/ZUcb2cJgZKYoY6Pvo9CdJIVNCuKJJHj9zCoUjKvxLp2szT9JSUJKfY3nMUYvFZ0iwAw2P
 2hzGQi99oYPGMp7DfPCiF190B0/E1sizeFds7ctIebEkHA/n5ReKFF0OXdRC3LvD7xEOw25EQvv
 hSapJ+jSyJ6lIPzZ3YcNdaYEpChsfC12CmSYBSCfMv/9v/pNZKT99KZKK2788b7JGNey6DfgK/V
 mtHH13/Z
X-Proofpoint-GUID: BrVVp0Gqr9MKSdVYev_n_00Dt9mtejVn
X-Proofpoint-ORIG-GUID: BrVVp0Gqr9MKSdVYev_n_00Dt9mtejVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153

Add device tree binding for Qualcomm Coresight Interconnect Trace
Network On Chip (ITNOC). This TNOC acts as a CoreSight
graph link that forwards trace data from a subsystem to the
Aggregator TNOC, without aggregation or ATID functionality.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-itnoc.yaml         | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8936bb7c3e8ea267ca66e0cc3fc4dac33ba6de30
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
@@ -0,0 +1,90 @@
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
+description:
+  The Interconnect TNOC is a CoreSight graph link that forwards trace data
+  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
+  does not have aggregation and ATID functionality.
+
+properties:
+  $nodename:
+    pattern: "^itnoc(@[0-9a-f]+)?$"
+
+  compatible:
+    const: qcom,coresight-itnoc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port(@[0-9a-f]{1,2})?$':
+        description: Input connections from CoreSight Trace Bus
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description: out connections to aggregator TNOC
+        $ref: /schemas/graph.yaml#/properties/port
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
+    itnoc@109ac000 {
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


