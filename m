Return-Path: <linux-arm-msm+bounces-103481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPmWLVvj4WkKzgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:38:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD8418059
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71DF930D4FF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA823793D5;
	Fri, 17 Apr 2026 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQA4SZub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/46h2os"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DF5378D78
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411307; cv=none; b=pArKjk2xx1crkA2IaFHEyVg/X3kg7ULt8sTse4P8LNLd5VH8ADKY4zYO67vX+YZ8+K3J05sEXNbFQDPxPeXSCZz1bWj1FfxTjNRyUR6L8KQBDL2qLfFkYTURUQSZyYjhk7fNqTaZU58PJgWQQfm0BoTWfKByjsvaie0kqcDjm0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411307; c=relaxed/simple;
	bh=HKFOu1fNblOcn/HFOdu48EyT+lBa2UuOd8Ya8wh5870=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EljL1kxU7QqRuLXs4OOnMu0dgy/rOHZIcqcv9VS5EXZlEnYreB0RvaQuZVbsUNzsV1QRZVlL1D/Ric8FSGdelr2ZzK5RgjjTn/ZhbG2I8DmJO7zA9Z7SJb7KxlriMf7mrZZ7I0FT2O/4Af7ijdEpKu62ndyxyX+VXIp6ZgzOZ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQA4SZub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/46h2os; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0g5AY869715
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=dQA4SZubLDaiuBxKUYiIq4Ybr6w
	9vB2BsgGzSRGwKmTIa9iWQcM5nZAKHTxfTx2e9YuMUbKkoC3IBGhnFBpy8SLrJnB
	QzbaEETN2tXw3BA4daapEWSQT7jXsxCn1/xI9emN1K8yRXpMil4Ib6+ibHd6leQ6
	EWS8pmarloLtU50t9Vy1sL3S4mgZOjkyPmYGPAe3v53WDWCTNlgw+qjc5sjWNZEx
	wUnjMcO+lfHDKU91JWbb4XAMgaA4ZCHngjFmeXq9d+Slkyt9DE0X17yLdoPhZhnB
	wC5LEhbergpdWw+A2We0mB0GYiZP6EBrEkXirp4Jwvx3BhVz63LouU/A/ZA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvruc853-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:35:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so518814eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 00:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776411241; x=1777016041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=D/46h2osfECa7f8VCcsnBkxoGZGbu0j5xGf0GhvsjUmNRhAh5UMBHuzhkp8S5rtNGf
         m3D1p/jdMpUKCk21t/TLQeCs77ScJBPFLMYrCISudXNJuRoqz/r62wueO2QaJVnPMnxj
         7+fyVusTFLBjvoplek38ZlJCJm5QSuuLbpwzd67PKoox6iW7efCBvMRfB4QllW1zMkZW
         PnA4mSxz7/JPCSndDxJgyYqlgAA3BNZbu/lQa+j6gvaZ3riFInEwrzFBYoopXcRNTuQ+
         TrSZI2XB34Z1s3FGQpV2tljgtTw1qelMeW787nAUDrfcrDGRMIErZNRu9BX3L7nkRa28
         N6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411241; x=1777016041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=aUrAphBevL9Ky5cmrjUMbVJ+KpI61O6g2vWQzLZ+btnGUoLvip/L9eP+mcFk+cJR8/
         k+a75Pnth4cb7J/D6kkW4IRRmEblJ9zHZ4FQHYwiUc4gXuGdjwbcPOijIltO4bhk/ICj
         ebxxCL8748ZXXQ/bloCIINgIU+ANP6mneeQAOwaOVEwyYjk/PqNyIFRuu/iczxURHL62
         kxjiED6z8e88sAr+4DD0ZWM/HUgEHa0TPd1iFbZ+z0z1VnGuvdO3oUKDkmS7X2LxQ7dY
         QPFsQMaii4cx9TnALpWrOHQRU6MRFOdTn1YBbd4SGYYUFR6eeQiLdBGfKBEq+i3Fyw8F
         TOAw==
X-Forwarded-Encrypted: i=1; AFNElJ+6e64HbT7ENXs3KJ/yxDwDzjQFs9b1jY71l9R3o1H2Ybkr5LgvHWBo7+Yh/9XHhDi/ufEMv2tyys4lAXUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxbsdP2EfIqUsjSalrVTKeEKv1049d6dbz9ywCkmTZF2S5Y2O41
	fPhKOm+uJ5WKhwqLyE4onj0cH2g8T7cnUiAm92fdYWWGUliFwm/IkILU8zbj7PraQq/XyMAbNga
	BRsthQ1FoKfhox6ERwuHAJFXSAorisgqJuJn8ojB6EBt7A9hHxXHsJF67DCKNeRjA1XxK
X-Gm-Gg: AeBDieuXYAAhcItLIqDSQxkepStPS+AlBFj2+KKAGMIGWQshpoaVuUllCPNXz+eRaeW
	2JlsUunadUwf48MrZfPV4FQnPeV5VKm8TuKeHpyN8GkXVtLWNIhs6hHY5kG+AC1ajigxtnHIfwY
	zsb/jP8oD+wo6MwKUiTzKXNRf1AWIm9w2XyGPHZ9jm8LKfIkQWvJDKmDEY6wwko9lk4xqROvYUq
	KcPI/Ao3OfmGEJXaOWXsagHxTBmoy0BcGWyKokeAMsphvPYbp8TQC2uO+dYjj4NKvlHL/X08Neb
	Vdj45lI+kmP8xG5mPIW3xM9eoyS0vdOCsiR7xXCdEIDXsDHv89tdoX8LTVBSrZTofEH2lQ6vMvH
	pXSK272bhk3D5SSqJvCsmFacsSx2gQqZAr+etkFYQDpzpLTur8Gfht3UtmbAPYOiwPEDJnHY0BP
	j7IIobeJYr4Vk=
X-Received: by 2002:a05:7300:6d23:b0:2ca:9b08:e7d2 with SMTP id 5a478bee46e88-2e478a34148mr814630eec.22.1776411240602;
        Fri, 17 Apr 2026 00:34:00 -0700 (PDT)
X-Received: by 2002:a05:7300:6d23:b0:2ca:9b08:e7d2 with SMTP id 5a478bee46e88-2e478a34148mr814613eec.22.1776411239982;
        Fri, 17 Apr 2026 00:33:59 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm1135168eec.18.2026.04.17.00.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:33:59 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v14 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Fri, 17 Apr 2026 00:33:30 -0700
Message-Id: <20260417073336.2712426-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3NCBTYWx0ZWRfX6DltMfnjuA6b
 01nBGxyCsccgfz6AGp7dNKUA95ER5NyUxeKsknwzoiQySNYl56gt/Gqshy2EcBxzGIoP5Gni9Cq
 8vFdzJm+tQmmTyMaowwtG7XjU33cm/mliRg8xuVC+zAQBxpfLLuUBMPucuszl/c1rHqdPmSLhZf
 MOo7bf7o/mTGZidztdHanCxYnF/DzpJufUfgcKP0wCSSx8GNoZcgAYibE9JGk9BnWUBd94Q+QsK
 BRSYg9BLMh8qe6sYLOPWlfubV0fxqnWzRN9n2W1UfwpuRJN4fvGl9VcO1xZH2+OuNOSMSkAGP2K
 lYsvSHC4fnlZ/WsC9yp/W9aNywrA/RP+eUiPh/d9s+muSWY98UDggZchl2avgcAq+cdLlNSjgDF
 luUexAYY6MbXJ/Oh3qLuMOmN/aZPYGMXTjI3nQu7PmMs0BuK6ROTA9CvMeC0UVMR7UHHHyX8sw3
 hFiMiJRfwiiDoLZ6uMw==
X-Proofpoint-GUID: rNrILV-v_mQxDfXYqxzLf_5snuNvtF4B
X-Proofpoint-ORIG-GUID: rNrILV-v_mQxDfXYqxzLf_5snuNvtF4B
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e1e2a7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170074
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103481-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.888];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58CD8418059
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


