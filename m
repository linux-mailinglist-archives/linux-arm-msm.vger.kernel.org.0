Return-Path: <linux-arm-msm+bounces-84291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 326FACA2559
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7060C3026214
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDF13002C6;
	Thu,  4 Dec 2025 04:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQFTLZBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FDwEG6cL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381C43002A2
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764823396; cv=none; b=KA6A0eexzXvM9CBfqeVL/xeL8mz8x0Ic7fv1JNCp2O01LzuxdxIzMjmZHlpfmKzkzHsGM7S8Nd2fh5u1HODd0UelAbrID/I0gtjGrGdM7YFCQRFajZYJMIj3fYfl7UDptUkYU7ku+GEGqS4keq5gveQwoOWcp/cyNWLpltSK5XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764823396; c=relaxed/simple;
	bh=Y867aF4IBjLOR2gpmZC8PqfLpe9/4Juk6DhmSLbLZ8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YpRkJmNmtd8tD+pOedvAXsgcZxSo+QHG78z5DYINolRQOuTXstun7ioL2BajwDHCqt+qOLYmT4mJQCxWN+0iqQxfgeprbF0BrgI3n8Q+dUbIWkj01HWdkzRo0zcuZT1xU3fjaJ9rBA3VieBQ34bHTLMk0tboakEZG1ixQsdW2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQFTLZBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDwEG6cL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B42M0Os122757
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 04:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=; b=ZQFTLZBfZaPoPoj7
	Vut/+qT/1pVJ1uLmGG7+VqmG+staSoK4hsXewHdpzYaVUJQRMfY+pSRlSHGr25kc
	SZoxvzYaZi6aTP3KpKP2GrmxxqJC1I5aU5RvvuMpxfOL92kH+baHWB9bJjgtMill
	w7bAHS6g58D8rA2PV6YnhXi+fWeqAQYE4S2aMQj0QgHAQOMgKq9sslvoVC6f/cwq
	skUGAAyMMYxr/RF8H/VEbs60jxh4FgKXJh0+MsFPSgcrs2WE2vR9+Aeq6/Xnbl2x
	tCkdW4//ajke4aOxu+ILdUrDiJfp4CZhij91cSR3pEy+H9aE4yKbNjY6QMo0FuJ0
	tBXSuQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f00a57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 04:43:13 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7c702d1a4f7so1074937a34.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764823392; x=1765428192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=;
        b=FDwEG6cLzuAbIYy5oHfSvuWZgz4tY+2fGeEuO0hqP3HtsH+cfrYA1L73pttzCPmUfe
         irzmy+LTmzYotnFfUYBJDT2DQKrCD2naidT1bC72RBMhz2iLFTLDbUFwfhODhiQGUE9c
         DHF9KvPLuqyBcGALbVSMeCnuSFFZ+OB7LZIAS8j0q6IoecE8ErCOBTtXVQPsq9rQHmHs
         2RHhu2AuoYHeeJ1Eki8ShcVPE3JNiTsMacqD+6Um8YWiIvDq9slg4ELhmycsgAUk3WKT
         PKIzAeYVXp8lVXLWQnlnYXx5wSH5K/yji/q8As9ApF1eYkaGmGkPlSl9U3VqcrBo4a2q
         s4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764823392; x=1765428192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=;
        b=BaVyu/bZfPy6widhOovswp91ux1WmGjXK0IDA4eoXQAg8d7jN93AIjRF+zB/u7oK5/
         5XjWNPbkw9/QLeQHGna4uPX4DK1wW7UdZCVNafwYnWl0hsy9WAJdTchwz2Ef9pH0ItO1
         CAll3PSbCpdk5fAfyfoiJ+uTYAFOZHNfmlqldneLzTlXdktsMlFs5h5hXpcCX7YfN0Ok
         zP5GkM3UCLfZJyCzn9i5iXL1DDOP85aFd6SNtJRHtQDRHZbODH4dhY+y5E688KIpM3XX
         qkoEONqEiDsmQc1HovSgM+jXToKAv0SWsfPRJwJEi0bnTMCxS658UkDOE2AKzOji5ATs
         T9JA==
X-Forwarded-Encrypted: i=1; AJvYcCWsmPj5MLk+U9lbdrk+FxmJfxAlh0nmRCnOgJ3XjJRwAJEibFHCGWrk4e2AcoeIoDmCaUu9KwbuvzGQHd4U@vger.kernel.org
X-Gm-Message-State: AOJu0YyfLwlZuCt1rNqrZrogP8qhjQuKpjUq/aM1ox5WBkZ+ruXR9dwS
	wiuIFDOXMl3dacZY0iITSq8WZDzNqf7Rh11Hl+vqIjdgp9hhStZI/K0KF3NZhJfDGILJpnR8a9z
	3+pTyD3LkeM6KcO/FoTNkhpd+ubOSr25XP/8rDRrF89V47gdzZYasc2gKb3vfDqgcJNYa
X-Gm-Gg: ASbGncvtNUouet58AbkEjiP/7RYZZLHRYav2crJidQso5JHxhcWBosCpPL9piDXLpAe
	CrQKB488IpR3uD2cPMvnAv5ewHr6mZr0xI6L1Af2An8o4tn+/6PWh4ZAp9SDr4QLk53NZs7K4ft
	NqswpJ/xV4VWl83I4GlCJGQ0zWa8tBzCraCPkFkzcJ/BAkEIJMW7YzaZsPn6Rf1yBNWh/P0GxeE
	efeVBJZWpziR+P+wa/rq1DH/9nFeKRiOlsq/TorbMGvmd2SE/A2b17sh3FCnBuauHX85mFxFCza
	uR9+tYXV0D3CfD0dnWVM4nwgeTXjJy13L3oxG2gPWTIQDBSbQIqx37swdtAoMFeen/z01j0y0BH
	6usVaik7mtmF4Rp1CE0laxiaJMdrgKNQONay+J/n+2oawayU9BP71z1nqngDzO1ey+DE=
X-Received: by 2002:a05:6830:6da2:b0:7c7:1e8a:c9d8 with SMTP id 46e09a7af769-7c94dbc018amr2232469a34.36.1764823392465;
        Wed, 03 Dec 2025 20:43:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlQI4J5ktvT4qDZHre6EgJd3SdtO9l5Ym4G402JMyQKGDhofxX5C5c0bcjZ28Z3CYWt0MNHQ==
X-Received: by 2002:a05:6830:6da2:b0:7c7:1e8a:c9d8 with SMTP id 46e09a7af769-7c94dbc018amr2232444a34.36.1764823392013;
        Wed, 03 Dec 2025 20:43:12 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ec5b35csm213766eaf.7.2025.12.03.20.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:43:11 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 20:43:07 -0800
Subject: [PATCH RESEND v5 1/3] dt-bindings: arm: qcom: Add Coresight
 Interconnect TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-itnoc-v5-1-5b97c63f2268@oss.qualcomm.com>
References: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
In-Reply-To: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764823388; l=3075;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Y867aF4IBjLOR2gpmZC8PqfLpe9/4Juk6DhmSLbLZ8U=;
 b=5PQaJnoEfAdrn2uEA9wiEn+5CwF2jQPZQH/vTvT8XvYcTNIzXNIn+5B9MWwpkdvboOcupnyxH
 Pi2/SIdFHHQDecfz+Lwa1hMu6vBgWZWXHk1xArFqnarHdNIQlHu3Q3O
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: 2yaV7cxOHv0j2PdUfTYYTNO0hl1yTzpM
X-Proofpoint-ORIG-GUID: 2yaV7cxOHv0j2PdUfTYYTNO0hl1yTzpM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzNSBTYWx0ZWRfX3PXZvISux9W0
 NzidJfOUmltmlEgZ9aWSKCNU3lwGrxw/pBqX6IPkICa0FPaNBvAelXhCB6P7dzs9pt0dKiRqCuv
 /9oNyo/GFX9nwZmatL1c4BcJXA9xEtVITn+M9EBiBmYSpw5Um2VDlxDde3L0PH3kUCMPTkmIKAN
 /Epga9okKzueuhmhzfV9JxGZ4bD8oBxguQ8GsQRIBRXDEezAjvAVRoUgmGLJWcxHSm6XL7J1jVE
 B0Ed6QrvKzQSYNo9m02D/k4FaKcMKvDtwe8y9Gb07TpsHDJ/OiKfqr54hhkB0VdjT5whot9LShJ
 JopXVOdhesszB0MF6hO6xFk2I2pkk6QsllzX2sEW6HY4RHawUr6cVOk4n8uXAcOVerh6BAyhx/I
 G/4IuSf8Qf3DvIvQ4eHs1Yr8X7X8dA==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69311161 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=-QmmxQN2S_yWG1-YAlkA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040035

Add device tree binding for Qualcomm Coresight Interconnect Trace
Network On Chip (ITNOC). This TNOC acts as a CoreSight
graph link that forwards trace data from a subsystem to the
Aggregator TNOC, without aggregation or ATID functionality.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


