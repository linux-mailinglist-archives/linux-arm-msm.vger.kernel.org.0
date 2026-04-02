Return-Path: <linux-arm-msm+bounces-101501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ1QEgk5zmmAmAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:38:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 027333870C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 582FA3196E2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563BD3ACF18;
	Thu,  2 Apr 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOsiPHKx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqWJDmaU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055F03A8750
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122143; cv=none; b=iNDUe5ZVTIOVIuS2vx72jrxzKPVoz7LII6nakNl4RcXf8UIT3WQe/P5PQEGgqRAQA6jHXpiHBq+bgWdcLn8TIhCaq9sz2YkbJjN3MxIUKSxLDGHQGSzhmskoEL/SWIaUEjb2nEYqOHQf2dos9QRn/cyI10dRu7wDqjkr2n8bm7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122143; c=relaxed/simple;
	bh=HKFOu1fNblOcn/HFOdu48EyT+lBa2UuOd8Ya8wh5870=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E2veqnb45mIOt4XTm0vxkicWsZzz2k3nICElqn4aA5x0kBU/fonvcQMcuRuoToDPLwyqezd0QmezGi1E2SvtNdAINOWdyk70DCqP1jqfRCNjQoo6Hyk0HuzhnACJfEkzuxaDuLPW5Y2j8O3W7b05vL27IaNOzBMf4fuS7347l1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOsiPHKx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqWJDmaU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63271bUV1965112
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 09:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=QOsiPHKxJU0AYO7HKMMYnthq4Ii
	kSXio3+LB27asj+rCsUYQqgIlPeCiY9HxV/48vVc/sJrRp+7flLGLsT6uaPcc0X7
	WMlCOfE5rsSTIWwPi+Ao2IgnCVlmq62Tr2Xnn9RD9YL7D3voogd/dojX5Orh3geM
	aAMJl0o98MwWXFM8P4EdQXvVojzVzgq1VNR2lBqxxaYimxAP5G5vp1O/OTazfskT
	XuM0buLVNxv3qLoswleMJOkypyNoYxp6PMeBDcEWMz/yfiGqhIUjymRcn/YEsIir
	ihif0/Da4b5j6ruH+wcGGhznU5wthOvfgcdTa5EvrPXITwiRQLQTADUYKqQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h2d85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 09:28:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c5b48baf75so5172273eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122132; x=1775726932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=HqWJDmaUNr1/iDCuHLNF++ScWdv4Oge8xMAgKR+rvaF1uVHnwFgeQAJ3I0PELWn20T
         9aG1sruwjO/s3AVSBtx928kvJpsLw5ykLzDFNS53Xwktgjh8eth9L4Qh0nTnpZDJL2DH
         es1UAZOSccsMQipW81exopKQy9DOy5nrpDsKqCNKquDJFFa9vTxRnnEnStcZi3N+3FtV
         JqTCmDbAVvuPXa53IUiTI1vS26GIG5ZlAJvRAdY2jKiBOaPIz+3EvnLJX8SVT0lbcdPJ
         1S7THaVVT7ZB8tTOI+61UV7j4tzltSAQ+Zk9WCDDR6TSbG7XN8zAQaCfMLxCiOvsSFQf
         dOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122132; x=1775726932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=KKJbGSNgvP/+VztzUMrB8Kz4Hm06hRYXQ6X6/g4yqgz7oBYc/JzPioaoXSgQaCsLlB
         sjRdozTAJRv9gfKneES6pGxMsfYriATQ+JjTV5EbQOYxo7hM1uPtqwHG9M7E+/zpyqRy
         Ozx1tYjT+q1uZIZlZH9sIl1+AZ1Is9rHRyD3qL7prxevE7oOrF7E5RPUtwvMAotenJFi
         CIGGiv45IzmzEovcff/0WP1Mv70bjHqAPAmEYHq8xFsbLPc/gXfO2lgCM57ZGlt4VOt/
         Eco1pWA7/4RzSWgHH75AcEHQS2QCKv8WJwDtSNEiA4Jlm2Oem3fyRmzGQagOOIeIUCwY
         UqMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbbXYvmMbV6I9qL9TQO1A2rDt1cBq/GnGaXWimKGQlqT73Mh3VhKMctNst6nYtVSdKwcn/fr5ufFNuzLkW@vger.kernel.org
X-Gm-Message-State: AOJu0YzPC4ZT0K9FYm8X7s8rlhnQFSaIYrZSQod22ruoPIGGUaLb/tyd
	FUCgLR7OZ6nmwx+w/d+ELmXdUGhg+I9rZzf8DiByO/M8EkOFohgxEW3jSo3I2DwS7ehub64ZKZH
	8bc8VS3m3wBsscbzR/w80YpqecldvmMLZzN+KwZRUQWBAAkIUucDOaq6UE6gQN9SpKPiU
X-Gm-Gg: ATEYQzxZVq3+2cRX7LL+XRBBM0qpbwXDifXKMPl7Lar97mMD6SxYs7uI68iI7rleHKw
	VzW5qe/GTroRuU8mt3DUAHmEsUv4/v00RqBz3BFEWHN7ftrEWzP2c3H0NCJp6NGZ/0cXg3T9N2Q
	nMIn/SSwAXV3AzULlPkvfYTsecFGx1fibGS79m5Y2M0p1NniCOU3JtWlJQi1b2Bm9hJWp3TT2En
	VtA/crnbX/yGQQqZC36qt3Wgi2wytzPVU6lU26A3vVwbxu9nA4iIysU/TlyqLF4Y9bwNm5ZQp9W
	MAbPLRZ5ctkr55KPW5p+LvJPyWcNReNHWG3Bl5hAyxr7Rnmixt7MIToj0Sn8Sc/Oo+FZWaLDklx
	Q6XX+K10P5HOSD8tFaiWo/lXU7ac/77G2ajwIL3mgjZC4g7KkTdZ2C82TGco8zKtdE5DFd+AaE4
	GK
X-Received: by 2002:a05:7301:6787:b0:2c5:fb3f:70e1 with SMTP id 5a478bee46e88-2ca9037b03fmr1380025eec.24.1775122131683;
        Thu, 02 Apr 2026 02:28:51 -0700 (PDT)
X-Received: by 2002:a05:7301:6787:b0:2c5:fb3f:70e1 with SMTP id 5a478bee46e88-2ca9037b03fmr1379996eec.24.1775122131091;
        Thu, 02 Apr 2026 02:28:51 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm951094eec.28.2026.04.02.02.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:28:50 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v13 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Thu,  2 Apr 2026 02:28:32 -0700
Message-Id: <20260402092838.341295-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce36d4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: GynuaPfd18RcgvLmoanUS1vK-FH4QHMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NCBTYWx0ZWRfXy7zqwpWlL60v
 socnjW4iLJyIuVNTZYyLPpkiStkXeOvLfqS05khyJ1Oza+rTNnkIZSugGKmctrKn1BzjaHYBOkm
 W1AGFk2uzXBgjKVOAlffuJqzmysuVaN0G84MaQ7acAMHAhEw70Ywd72ytmk0en72d7EQeISepBI
 9VtHoONGq9zdFIFtnYNg0lhgA3UuQjvQynFY7GwAo+EE7VULwmJkS7gT6ShNExN074v9j/TM4w1
 v5JGtyk81MFyUnVgTt9VOiKySmUfZBOAXAc6GW0OgMiS4QIaRQe7A3fgKWIECUkPEiCfyHn0eaA
 8w4wu9XlH1ikQwlLzPXCoJ8v+cioikQQ3+TX59QQBygEBlnICWylZs5yAEl7GDraUdc12lprQa0
 gq7Z6La6LjIPOkcmcHD7HFOUW1RhMmWFPDLVzXZ4ZBxXr9KpfRXCpeZ93o16KkkTa7m66amxWIg
 mj8+BqKOSd0toJ/MJdQ==
X-Proofpoint-GUID: GynuaPfd18RcgvLmoanUS1vK-FH4QHMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020084
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101501-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 027333870C1
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


