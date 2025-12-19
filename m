Return-Path: <linux-arm-msm+bounces-85781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 330B8CCEB08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 07:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6309303ADCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 06:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EA92DD5F6;
	Fri, 19 Dec 2025 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGW11hoY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HbhFkftf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5362D94A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766127560; cv=none; b=gQnNilnU8mROw9Fgf6hxbh2DNO99d1WaZYDfiT8W2OBkoUkJ1zFKooI5TiGcnm2JqyF30sZQVX+893QOFndTN2TDWAd0K+vGcowoX1KaiosuSgT2l69aiKBhjLejfPJnLe3AXo47uFFtfdqGOJdgR7V0i8p+OHc84KZ/aIESrYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766127560; c=relaxed/simple;
	bh=6VY87t9VghiDLhppTTyGc/EGkt+kVJvSCivK71N+61o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uHLX6ZIp49gjYsoQkDnqUEVrh6LIebYOhvliQJjzpq4d2l/0CoG5B8bphZMy1XtyxUqbHp1gZnx9MLRk4iB6tqS8vbpPL/LlZY2QdZkxc0fhhLZfiCypRrb4MD//CnYx3/AXQAIlWnYDfc6vBXCPcwZqEXqLD+O+R/5hlSEsOHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGW11hoY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbhFkftf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cONd3700883
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nWc4h1iM5D
	mFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=; b=mGW11hoYuf8oovORYJS0AOnjvkm
	HPkNqqdH2C0xSoFrjNRMA5LU08NVhGTzZ21Aj5ncaxpcaqxaioJyIRtca4pjea6Y
	deI3QoMbp94eLcrxdxi4kwHdJ15D4+9uu/NrvIBDVoRZnGm3n6s5x4POoPcaD7rb
	SW5UP8KXJ33xdMZbscEsuM4p2wA1qiVk32gsxidvxkLJYlLYVcrxUf5E+VQTzctm
	5wn9WRhY0vdxghYg/SmtaXVMqjGvyulz7PIAJckAQX6ns8xRrTALDaAA+ZC83/IV
	N5n2FV77hsdJ4OZASvXVpUtihj1+aMdFVOrOGbg+TZ7dxt5gh6BuNqrnBEg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ehk9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:59:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c0bead25feeso1248243a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 22:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766127556; x=1766732356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=HbhFkftfhiMzQ5SwI3vZbdZnRpQSPmFRhx/vmHekfsYNi6UNORy9+jSJ5SCQ76OdDm
         Jt8SL1kPwY5TrzalNLye9cvYu0h3NvS9AoikqOoxqC1B38jL6dTthWjr62CppQ0Jl78s
         AZMbYKhqaNw4sRXHOnuBVXu2uqRRCssgOplP2XnzyYRY4L6qHbOEKUWie/WUXBnLCbgn
         ZreKn+fSoAdyxgkoat6ZxnRqB3CTuvhZjBTO1fvfSTUpOU0iZOxb/IKZKXQ3ARUxshKq
         ORrAOPo1FGMcTUZTbnHDQjEckbqu2zukwhlsMNuLlebNxtui55Xa+ugthFz2Vz6CiCxm
         hQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127556; x=1766732356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=O0mc/j4+SC8m+lI1hJbiO5SnxBj7sJSZvo/tyhuZCMSt11119l+o9ozGIXxh6tJg/s
         tEXnBWARlQEhFFrgA8s7LplVHYYNJKIvSiOk0M4ItGdZi6DWnv78pd0RGm/VZU4CAL0a
         iyWUA+Vw8XCzCdIYtqN34Z/MIHIwvxvhBG9axai3MeWXHn6fZr870nqb1QKxnKkSMdee
         dLqG3Q+kBbxGoe6Y0Pc7+UZ/1LCr1i2MmV+oMxMQGZ/QuTaeXgAE8aWBdbSQ8NASyjFa
         WEaiW15bUFJ1UvZzrrZ1MYpbSDTWZskE8uUcRqCI9uG60b7OmonqiNvhLszFQSWk4XqN
         Aq/w==
X-Forwarded-Encrypted: i=1; AJvYcCXoiUmTTbrt+0rvsb/di3s1CVf9NUNpIiwkU8lHBMIEmOOUBqPg9SuBMkYXzmpdEra3wBL0PfpgIANy+FcQ@vger.kernel.org
X-Gm-Message-State: AOJu0YySHLMH74luKHawEZjTdq+3ZH/MjUYPFq9VTMjA9pTsRHN673IT
	g0M8YwGKWoRlCYT/ppcw1BLvZvuS3BOcPvgAWGT3qaJahtwGyxFX1qo79dhyBLuphYi1YXwFnoP
	wOMhmrIZujfJL7BlNH3RyelADmWG+09klOrRf+81FLi1eLJ1ofZhyQlRXmLUt5PYzqhCw
X-Gm-Gg: AY/fxX7ePakWstAplO4WFhMHpQ5/JYEHTYllpX6mdoEk9Fh6HjLCZ4Pgi12AcL5tLfN
	oiewJ7TXBQYNR91mdh44ZuYp91AjA5jwzRFEv/iUeomJjZdWmaaZLP3nXqQNj2tgjP5t9icRIWw
	MlkH7ak5APwMoZ79dM8Z6RGwz40l72XvXfHbd5kmZNEXFhN8UVgrGq1EzsVq8Y3f9W7Wg0DTS7A
	eiXNlPkgiVuX6r//BptE8Je6BBQCwtglLMGFs+k3BmOupQalzvYMEidz3QokTjM+yUH3U0VUNrm
	pBTPYg4a+U9k/MePMooyXpTuwIs0ymt2dIxqenCZE/brDyJj23pCNShGZsT6l0SPpLGC1DlV8jt
	vjhm+A5dOIAiOMrFz+GzPZsCLUNytMCWFolYFrWWmV3Wa942pLlwayBLpbdipSgI6
X-Received: by 2002:a05:7022:6894:b0:119:e55a:9bff with SMTP id a92af1059eb24-121722dd666mr1906788c88.27.1766127556254;
        Thu, 18 Dec 2025 22:59:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3MkjuJpL3ndfq28woc+DY1x5eft/ObZXlyr5BZCx9Z/dRnigx/T/e88b6txTPhWXxGRLPYQ==
X-Received: by 2002:a05:7022:6894:b0:119:e55a:9bff with SMTP id a92af1059eb24-121722dd666mr1906767c88.27.1766127555681;
        Thu, 18 Dec 2025 22:59:15 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm3614954eec.0.2025.12.18.22.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:59:15 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Thu, 18 Dec 2025 22:58:56 -0800
Message-Id: <20251219065902.2296896-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ciNV2v---vIWMqX1l4swc7GbOVKgoSdk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA1NiBTYWx0ZWRfXy/Lo0yk9Q8x9
 hxwMozqOgIIv/KfDpLb72ZNtO6G8HX8NXNFfh8pJUN9tEwmzcLtqiEcSZLY2fT5CKkuLZoVAtGf
 Whml4w1uPvLKHNh+fqrJgwkIGjyKFAR/1DUhcFVyUpv2W/DUMVrQTg/E3i2gcZVrDB3aGqKpXt9
 mgz1SfVDiMlGarPYm9EAuN2VWae+lt45gMeZFfzOAiLYC8+UV8hVISMo89Or6cNBpGe1ImQde8P
 l/j2e43mNzv6HWKlBFxM62xE0Fkzv6ygUGCSlmi8MPxgG6QSnvBqKqcTMmlxBQvFuCbTnmzePzZ
 fXPseNgW+Fflr3F2GlLsVibRFBy9O8N7RIT+/FlxFhUKpCQBGIjZScm/4NlwK2JZUMpy+8IXucZ
 Jfaryg+zu628rcQ9oxIy7ukAq5hi2ee3IRhTdyTMajZoao1N+G6JG4pOM/mJ6RQ8VmKy72vMMoV
 XP07XfCAiKpjbq8n2Rg==
X-Proofpoint-ORIG-GUID: ciNV2v---vIWMqX1l4swc7GbOVKgoSdk
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=6944f7c5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190056

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


