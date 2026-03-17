Return-Path: <linux-arm-msm+bounces-98047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oExQLAbKuGmcjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 04:27:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7802A32E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 04:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B06AB3012A8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 03:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E3E2DC34B;
	Tue, 17 Mar 2026 03:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAAnisiF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McacIj1p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF92D9EFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 03:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773718009; cv=none; b=s58dOAcEJgeTWJFSlmi0HNsj/wA8ICrz+x/ujW4ivkzi3N/CoPBGd9BOtXy362C7BH/l4eGIDYfiC6qkWpkhAxghNhycZb3ZLZ+TgFZ7NAO8l5vSnR2FQCp/c6sVYDigcYqHnwYxNbuQMwVALoKvLQukzwqL9sJ17iXCehxdhlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773718009; c=relaxed/simple;
	bh=HKFOu1fNblOcn/HFOdu48EyT+lBa2UuOd8Ya8wh5870=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GQPsSE+nc44YlE2G0kggFEElzid2fGGCrMrv5H4lPIKJQ0NBrR8p3DzObrsjZKJUNABWBqUac7DuRGook8kjfFZ4B7naIBDDLSjxPOJHE6iWK5DJYrj2qE75KRGPqLcz/aYz11cki8768Cg0IaJnBf3o3XObQ7wTmtihfPWqlJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAAnisiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McacIj1p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GN7rAJ1639254
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 03:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=AAAnisiFj2zY5YrL3HKPnJJK/N7
	2vH3oBAanY0B6iBl5Mnj4rU09pWMdtesDNyGNJhoDPO/e+rGpbw3+XuTPqJXm3Xk
	DxNmIftP3Cp2ngm38HzQ3Cc9pwvhNjfApjmhjlYX2370JKxdCYVJpnrkjDkMXkpQ
	vAUE5NSQYv2T54IIPAvcQyhlkigNXgDcv1reDZm/ypAFIKowlHqTpNnnp0LODkkQ
	9wncZ/e9bjv80VZolW8G0bPOmRKLPZlDixYHZ0uZd0Y1GcyOnHw+uBkpZZEWIp3N
	L3HL/oKI3XSUuEfoX7HEtAl6zTUWcezLMUtoOa0HzI+XF3bGhhJqQ9CFSog==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0acju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 03:26:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bda35eab74so204525eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 20:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773718006; x=1774322806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=McacIj1pE6quuTF18MXplcbQnm3olLiEISiGNZYdoJBWupkESrQZZctvrAqeqFxqzk
         hK1+Mz2NDMHu/b7pzlStDFyH3YZmTsSZv5oC2szAFo4qF9YXGfXHujxxVC/hUYNri0u4
         KOm6hoNLVCRfO/BGFItTrn93QRHFAzxDgjmlpmz5pU3XK0JjWsyyhxTkaKsBa1gL0wSW
         hpwZeelwGrAdDrUV53SFgQCm9/VANHI4MwsYpCuOhcKTTPBZ4cR+X/corvih2eaIvnFS
         InJVw/spjxIIluUxHedk67PBIobYE1LJjiqNsbWChSWFsNY570zqaAeUKS1+EiL0KKko
         6rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718006; x=1774322806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=A6XLPaFsBQ6Nyqmjjnuz/STwQXthCTv/fRLeE1CzCXIvKw4xKAIu8jwKa3uiXhX4P/
         yV0ukPGIufbCPmBhOwCEvUvlOZEuK5SVdrp+hdlkfaYZokm7uCff49n17okd3kgaxg5L
         O5/rRtntKs1lJ4XBF0cvPVJkFWAdqtQuKDUJA5f1zoCOprjXYwu7rKlXG5FPFoNjQPLe
         yaOrFK7qGo1ADOGVW+pKLItXevnEmX45Lcmy7ePNtoejxxzM7/QRQc5070SL5M3ZfrNE
         ZF4709rGLNPlTEe6E2mhmQ1iPWM+6MQsoE61xwCnt/LmmIWK6dhbgReGm1iPWDF8RceR
         iCPw==
X-Forwarded-Encrypted: i=1; AJvYcCU9pe/8bdRfq2VXdUx98gCW0hw6l9KRp3XMFkepEAF+54Yme5DaDZc3fw2dpmk++hFoozxyJoKdVvWBGz1z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6dMQ7pliIqRX7tMoqd6NaRxx6POqxLgMH7N8iujKjRgK9s4rV
	QHAgOJGHQUtA311cK2zdbpBiPM00G+v+R4Jd1iCXytfe8tMUOzjFJR/BI1WCXPucAjvRSEuZgR/
	xXe9cHfFJA/hnv0ejTMNjQDR6HsSDZZ7ERBaxtyd5CeTXxfbqegiM+oWYhXc++jwKToSJ
X-Gm-Gg: ATEYQzyEx4GApxgp6NtQtoOVgWjCmqlOfsPWGTdHVJJZcRqq7J9By/ed/6AxKjk+iDB
	W5pepOnHfs0z9N2qlu2CqJ830pf0a3V7VWMpYEdsQMemjKvDGDcZIQEj1AEkmrgoCfCz/IBsZXj
	uF/v2kaDy754aCFKIUnxlZda69ufl6eT6aEtCsl4NV0fF1qczXhQhR2t1cN/CtH73/9XcWSZx1A
	9efcIDHvSKoF1JrMxFFIvA7w19pIC6R9oIAzkz6VH4LGlGBPRUa6Xrz+DJ7JAXhyO3EVOIeAKB7
	A/ixCtfL4AHn82wHVYitmyQD10ZD7e/Qk9e97AAb3DRTzEJkfNAMAOhsfFoc7e+oOHqo605Co7W
	wg7rZWGg4ZFRbR2Y1fqaLcpI2bN4blJxEOJzmsGbPXaXhkrtt0JunoZcJiuUzDhJde/jcWIP6p5
	Lh
X-Received: by 2002:a05:7301:1001:b0:2be:b02b:1b3f with SMTP id 5a478bee46e88-2c0d51f2448mr704165eec.13.1773718005838;
        Mon, 16 Mar 2026 20:26:45 -0700 (PDT)
X-Received: by 2002:a05:7301:1001:b0:2be:b02b:1b3f with SMTP id 5a478bee46e88-2c0d51f2448mr704157eec.13.1773718005213;
        Mon, 16 Mar 2026 20:26:45 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3ef844sm17445895eec.15.2026.03.16.20.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 20:26:44 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v12 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Mon, 16 Mar 2026 20:26:33 -0700
Message-Id: <20260317032639.2393221-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5-7EBLAyQIxx5m5L50xHG1vCDdA7zMZh
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b8c9f6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAyNyBTYWx0ZWRfX/P2zPZGFt3rY
 ngg6D/Jp9hUvtSBPRAmrUT6Pq8cXUUy1SpFTmJ+Pf8BP/RUyZKqVcOje7WPTpMdKmxiY3hXe/TM
 yPWnfpMB8Hozq2oncQDa5hjqhG8z6qfhpJ2EfNWFspV+6isHvG8ifrMCJRh64xT3RGRuPQhhtXZ
 4s87W/pqw6N/BHWEVJVmfilA4fpKBR15xBJfJqrNSdAFOJXcM6XZYGUj2f6nWOHAiGsjUzfy3mV
 4EB220g8/4yomuCPWesNqmHotxTu4G5/gzf+YS2tu71wH4N13I14EY3L707HRepslXZL0bVdqpP
 b8CetzyZP3o5NqbypHlTd3L4okRvbbFS0/P0ZomBqqtlCL0hM93BM72ITqsYh0DvvPT2jckJzIr
 VRN+8heaGRvUGPQ/FaxOv3A07WVhXFK5E8oMbSQArJQgOKL6d9DDHI9ww46V4SWQeaSTHBGzTKF
 QVc1cL3cTPo6Of1uVwQ==
X-Proofpoint-GUID: 5-7EBLAyQIxx5m5L50xHG1vCDdA7zMZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170027
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98047-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF7802A32E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..76440f2497b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,71 @@
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
+    };
+...
-- 
2.34.1


