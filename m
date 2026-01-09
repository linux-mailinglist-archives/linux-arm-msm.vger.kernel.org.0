Return-Path: <linux-arm-msm+bounces-88155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E3AD06CEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 03:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 533A83015AB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 02:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB53226FD97;
	Fri,  9 Jan 2026 02:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7AIir4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3UHkiqm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC1A267714
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 02:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767924730; cv=none; b=W1S/5hxbih/VeK8M7qNw83RAbetjL0bLMZlYxLGYSsEj6R5Vw3UOGvF54j+PwOV1wc41ePmN7IaICGqBjycmarEsJZQ93sZ/UUjVqR6J/T/1VUZMv66t0JanR1Cb2G22Dc91DIoInGfdbMp1u4+vregZH7jcydQFW3YEMLVm864=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767924730; c=relaxed/simple;
	bh=6VY87t9VghiDLhppTTyGc/EGkt+kVJvSCivK71N+61o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ebtb/KRUbRBTjjC0o6MX1VZOW2iHv2QCDa1pomm2foiPrBnFHKKFSpsvdPIFd2I9dh7gXA6SFayvPbtgTa89m0ghL6QUsojidhJVR+YWDJarI3b9ZJv+mygHJt9KrmLNLS59IwtKDm9L+/2jlL0kPX+j2v8cubNfi+HlY0bte+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7AIir4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3UHkiqm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Jkv7q2843049
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 02:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nWc4h1iM5D
	mFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=; b=L7AIir4POjTyxQCYaktvTprAb2n
	aN6m50RPWJ1AHDfXQTZ9rLkBwVX78uejRA5LSdTgxNJ7JjDxrehmLoqHfR1FMEBH
	r8zMv+MGJJeHrDfEiv8MCnTORPFMdYq7rWW+ocwh0i4DDlTSeFqDMEwhglRBGDpA
	mYWmNyx75TxOn01MKDZqbJEaQtoHGbSjL4UNuqcyv4W+xTRbneS5GMq+D+b9+OMU
	iOaveqW9n5myQ7pn1bJTGbC4GifULfU6ECSqg4MRUOFr2cnWs6cvYEM8KsZ4bIg9
	8+glFFFTAtsp+Zky9B9czk0ndOJ3zmONgpyb2itMw5/VwnOlXag8J3tf/CQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjt0gu3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 02:12:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b0530846d3so3158493eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 18:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924726; x=1768529526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=a3UHkiqmSlJ5m6raNf0Yme6qkRSRzp9uD7bO6EMExFmo85uyKmXZPJStGSXE2TIJA3
         sffkXgKK3v5tV1WcI0OYjdTP14R1zykFSNTtQke9yu3+ZbDOXM1sOzPlTuYqpLplCVQh
         fBn2yubmKLCRzlfMKt5dKD7RBaarBmj9ZBn23LEUC1Z/7vKvBUvTEn5ywmcuewfqB/C2
         HfQRWHvmnhqVs9ygcW0iCQ0WJJOipcDFH0U+LlwjCq4RQlxjW6pArYuLgmlg2yJjrc9i
         mJ3c8PwfHbKsg0Q9obano8NpaWW8QOSNYIeaaoca4r3X4s605or1qf0agIaWdXmGCXyZ
         XWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924726; x=1768529526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=TurBSnt+NyvlFHEL41ZFG0m9tQl89UCFSXX1mOkdbPvsQ3TtM5nVbHbG/KEajkuqCG
         0Jg9iO9AuosadG+d1V9oWHNgwKMq0ZAVAkC9YVV0p4juORVj2X0DEyWD4hUheEYc6lmH
         YGOYNFdvMV5aoJlihANbKCYgjB+dqiWKBuyXD2AAAdmaBY+5qxQYNcHYb9h5t015Zzhy
         qqG9kQZSC5AMyOnDCWCqvH6pRZLSLrv3PMdvT64pOZ1W2Gj5unmTiMzvwH3oYkLIp7J5
         c4vX40IdXC0j26XACMHsLtXT+bLGkuTJgXqb8eL+3YR+5+L1XE7kYabwktbKjcqb+HDu
         yF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjiuL+DKEatdofAV84AEiE9maQgycqYrqnkS8pNGrFwX+K2km9REY3S3so4QebuNUkuI+yi3BCzogPYYHI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1slML4DS4JnPqoo6pkG2xlhm45ueujadKLSInD5QJ8NmGzbP
	jGnC3NePlGpGROcr4Ra3eK/b/PEx8TGHuQknxyRoLjPyTm0poNz92wN3Av/UBivLRDp7wTvV7Zz
	v73344T2IwtZkH5IXQ+oxWZ7ycq5KaDC2wQxsMNChLH9iz/CK1D+m3s/W9cN/xAFVu2wM
X-Gm-Gg: AY/fxX67CUOLu5neX/e2HZLglw7BUZ9sd/1/ddoBeiMloieLOm7YZh/lLmOsxZ8oj/v
	jQupokxvfkiWPWGhqzSG8xw1V/HYqLBJiPB8H66tezwTtoy5OwATc/c6epz/35QrRPm5MbApTcr
	fa186ALkXQq6zuYv9wgvF831XJYQxBdCDIRibLJO1RveGkDm2FhQzNN+Foxioa2PPVFvHOVD3jt
	gbLP7TZkyfhOa3zT1jF3WJ27V/Qk7m7juKyKc3dGH8htzW8v0YgoYQI3qUJ0JXHwvdSIGQ/VvVN
	DPq7fJDeI+dAciCM/luzKbtna/fwfvlT75mTdFo9fSDOzfqF9xDhqx6QyTyxNzbGqwNLtlUGHH4
	tDWHEuccVgECXMTq3F/BaYS0YhOBIAtU2x5iiMOtDFsFZ4wbFhaXprcG1bhucgtjE
X-Received: by 2002:a05:7300:8aa4:b0:2a4:3592:c612 with SMTP id 5a478bee46e88-2b17d2d6606mr4790665eec.35.1767924726013;
        Thu, 08 Jan 2026 18:12:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgy6sYHhmXV0R+HsajFHl/JVX2fDprTnrm3I/yjxtsb+PByjDHZjVHQYgqLNx+6k5UNumKGw==
X-Received: by 2002:a05:7300:8aa4:b0:2a4:3592:c612 with SMTP id 5a478bee46e88-2b17d2d6606mr4790641eec.35.1767924725322;
        Thu, 08 Jan 2026 18:12:05 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:04 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v10 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Thu,  8 Jan 2026 18:11:35 -0800
Message-Id: <20260109021141.3778421-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5bYCOSl9RIJ_eG4M88wt4zBSk6cbOCpE
X-Authority-Analysis: v=2.4 cv=VJzQXtPX c=1 sm=1 tr=0 ts=696063f7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 5bYCOSl9RIJ_eG4M88wt4zBSk6cbOCpE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfX2YSZhET8Hynm
 ojoHGlNkraId0YGVQaCeApAnzAb1qX4cPcVofpNaJMsfDrxtJeLr24E1daBKFi5YII5k1cq9S4b
 BuzjovjsUqQ9krx2FbcGrCeHZ5BtJtBzfFgN2afMGuet9NfhVXaJ75amY6nzRK347IpU43YAxmE
 qvHNDud42ynzDrup9V97YXaB3ysgTgKsD2oJhYICPhwUAosMOWZxyWRzLLPw1h+pZckmc1QD1ed
 zdsrpLPFFgV/dO1f1QurJ3k5LYAKwousaqdBMoRKokZNur3WhW7TSIOyv3loTDtu+Cmj7W+VyXQ
 M6AKXAGkwLZUHl89va+Wm75qVEOUkFfNFLmtNtDYDdbuDOcfsQjQbTjQYXvNrgbuU7oOh7nhjaX
 qdfGBDe01kHp6p610uYBaMzyn7OgkTxVf0l8V21wu5uUve8BDR/woo/cohQyo+kEkuX4aOeG0nh
 HwHpyHy07MzauaT67cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090012

The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

   TGU configuration space
        offset table
 x-------------------------x
 |                         |
 |                         |
 |                         |                           Step configuration
 |                         |                             space layout
 |   coresight management  |                           x-------------x
 |        registers        |                     |---> |             |
 |                         |                     |     |  reserve    |
 |                         |                     |     |             |
 |-------------------------|                     |     |-------------|
 |                         |                     |     | priority[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | priority[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | priority[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | priority[0] |
 |                         |<--                  |     |-------------|
 |         step[0]         |-------------------->      |             |
 |-------------------------|                           |  condition  |
 |                         |                           |             |
 |     control and status  |                           x-------------x
 |           space         |                           |             |
 x-------------------------x                           |Timer/Counter|
                                                       |             |
						       x-------------x
TGU Configuration in Hardware

The TGU provides a step region for user configuration, similar
to a flow chart. Each step region consists of three register clusters:

1.Priority Region: Sets the required signals with priority.
2.Condition Region: Defines specific requirements (e.g., signal A
reaches three times) and the subsequent action once the requirement is
met.
3.Timer/Counter (Optional): Provides timing or counting functionality.

Add a new tgu.yaml file to describe the bindings required to
define the TGU in the device trees.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..5b6a58ebe691
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger Generation Unit - TGU
+
+description: |
+  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
+  to sense a plurality of signals and create a trigger into the CTI or
+  generate interrupts to processors. The TGU is like the trigger circuit
+  of a Logic Analyzer. The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region to identify the issue in time
+  once there is abnormal behavior in the subsystem.
+
+maintainers:
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Songwei Chai <songwei.chai@oss.qualcomm.com>
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,tgu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: qcom,tgu
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description:
+          The port mechanism here ensures the relationship between TGU and
+          TPDM, as TPDM is one of the inputs for TGU. It will allow TGU to
+          function as TPDM's helper and enable TGU when the connected
+          TPDM is enabled.
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+
+        in-ports {
+            port {
+                tgu_in_tpdm_swao: endpoint{
+                    remote-endpoint = <&tpdm_swao_out_tgu>;
+                };
+            };
+        };
+    };
+...
-- 
2.34.1


