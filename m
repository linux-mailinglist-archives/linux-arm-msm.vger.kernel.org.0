Return-Path: <linux-arm-msm+bounces-108779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOtSMlHJDWpM3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:46:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4414758FFA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BBF2230504C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B2A3EA968;
	Wed, 20 May 2026 14:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgCxv1rN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSxw9xgt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B109E3A1E89
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287901; cv=none; b=MLuP3ckfEG8gtbGdEKHVXvD5wqrYuXSFmcZlEEOgZHfnQaR8sSsd5xtvUhWyUZP0kwtdA+de85Ddi9u5TfDJoWAMTBjBKgyneo0DRhHQjcU35YTA8d6NgrV5bOJzX9J46OM5cV6VS9IxXHvojAO+6ngtqmtCds0uRgruBgyvixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287901; c=relaxed/simple;
	bh=EGM9jvLWLNGeQvHKK9ztbADqFJh7+FqdmpPCclQmMXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prLdoOl6LAbq8Cg6QLYQZWGLtyF9jMGlDjUM/PHeggk2PlfI5aRRP6FXzXiQ1buqJgsIbkilqQ0+oubBZDRQqgGexsKuopmcT4qXYAjU0TcvpMOcLyWue4Sa5Rb6CQth7l+GzV+vcFvnL1nw1m07b7KZrXBo8qb14r1Z2UQNdPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgCxv1rN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSxw9xgt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2RsY826685
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZKCu+AXC9KWnypjLBANGuqc2jfUvzBKHQUUKqDNOGQ=; b=BgCxv1rNlLNI7E5c
	6P/Zni150XgBWVtJZtdLxwwgARejEnoCvmChQWBUIo4WSMWOkYeXFYh7WvSUwjAa
	NcMIFhXPEK8tVOc/0MxPbzQLuohUnepbNYLmMTQ02p1l5gZlItNyJEws0KDmpU7M
	g6CG0ZtqMWeDuBFTpzpKeQXVD75w5cFb6QhC8rD7GCJqY0LgFnSmpGcWDu42WtRy
	sbVdHBQfDuGzImbrOFIkfW4TrKohwHprttwerqp5KqhUMbG3jBuPB1KO/Vrr2Uig
	zqMTSJs4BJcTTN/Zqk9w+h+ta8zhHClpE4oPkdsTzkETzdfuV2XV0+lrmZpaLCdX
	PoPpYg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecag4ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:38:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9fe2d6793so117491255ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287898; x=1779892698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZKCu+AXC9KWnypjLBANGuqc2jfUvzBKHQUUKqDNOGQ=;
        b=kSxw9xgtCxQgsUrZmbLyVygIxtauJXYSYFEOiESp+LH+Ac+xuAoaDc4hKF7WjI2/C4
         7w+7MVbFwzM99/dBY6IPSUu+dQDmpeq5+Lt2aU9EVUxk7GOsLnGEQ/LwlyDq319QUMGB
         9mQa43yZc5J430dASWnRr6Z9/FJA8KKtB0Zt71ualJQk/J3BAp7gi6rZStXuQr4HHKV/
         US/xVOFuOv0LhsUeYKgJunSeL8x+x8MXJHJNEl10B1kJfINI29EzSOkWTcHpfIJh/1kk
         o7mXXqqBVfwWsLoSHGtrxg/9ZsZnNURDj7mkHiU6vtBhBOJBVKmc/lL9jRNEIjZuTvd6
         BenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287898; x=1779892698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZKCu+AXC9KWnypjLBANGuqc2jfUvzBKHQUUKqDNOGQ=;
        b=Z2B+oMQG9LHdPNB754bXYAlwcZOag5kcjamh289kHZaS7+yXuVA+ORTTxtaGHo3AFa
         a0L7w2UT9pz1zzjyGQyN/ubHqIv1s/ZeWiL8h9Q3FE5wVr0ajnxzzh7GgUwGDH4M470x
         UYadX2XD+7YVbIblHQVRk3yGthuwmrTgGB6gQEneprYFlCHMWVyvRUILjJc+RmdK8uuX
         L+H1aOwA3yVwIfhTtNec/RDa7yODmB5tXJXPexjh0IMDUDN63P9Qof4YqGw5o8dv88GP
         LlFnnX/aGZaq7JAHdjA++TL2Rmu1RzBTQxZXB9LPFB3EMolYKcMtrXFtZEEEGpkS/wmX
         vpiA==
X-Gm-Message-State: AOJu0Yzke6N87Fy6K0lpjL8yBRh6wG2sjFn1Ia3kfq2O4fzgDYU70It+
	nCSVwGNw4DVjyrw0HsLMIReoQUN/uYQp7URiktXPiO0Oz3qFH6reatXaWbEoJ0YNWW6McOsjKNh
	4w9o25YJGvQ2DWAIN3XUaM0J5adRWIcNNYL0hKorZzxsnFHv0J38fb9H5/PXxwsh9hKBaWujd8o
	nP
X-Gm-Gg: Acq92OG/E4rBVjQVU0VQKvw/oSoqALP4H4stsVLXMlQ+NNt/Ppisbyq50BqGKhtjJ6b
	aFmNg8skgduvTc/rEAfkIFDkuLdcVBOSabj3JPyDulZNQ/LgvqMiAMqgNcRuvbh5JaWseGIyQsB
	hVokYWMnBOVrvv8/KGi+RdQuRaaIf9iQSjMluD2elso3TR39EKaZgtpEtAKEVx/4AV4oXf5ZDOM
	CPceJetPtaR0SC06DK4W5qm35P9FXMlxrhXge8oZ3tmc7OkMKA1O64303w2Vsb1kaQAKs7kxWu0
	QJIEFbBlGRCOcEVG/vTm8xrMOlZj5I2kdGi0W9HJ2GUPgkRkAiikD2bnt3zoLWR6JC7KD+HP7UF
	YIblOIF+Z8f4oHYm45AWKq3CHOPXrODkZnSUE
X-Received: by 2002:a17:902:b597:b0:2bc:f38f:15ad with SMTP id d9443c01a7336-2bd7e8f09dbmr180303005ad.38.1779287898027;
        Wed, 20 May 2026 07:38:18 -0700 (PDT)
X-Received: by 2002:a17:902:b597:b0:2bc:f38f:15ad with SMTP id d9443c01a7336-2bd7e8f09dbmr180302725ad.38.1779287897553;
        Wed, 20 May 2026 07:38:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc60sm232999015ad.9.2026.05.20.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:38:17 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 20 May 2026 20:08:05 +0530
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
References: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
In-Reply-To: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779287888; l=5098;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=EGM9jvLWLNGeQvHKK9ztbADqFJh7+FqdmpPCclQmMXQ=;
 b=w0rJb+4BXU4R97Dbnv5FHtnhIASBcYfiTqfalTddb2DgnNB/CBYiOuvSGMNw2zFk10xzzG3XO
 5o20/N/Qa5KDD19MLOE3RaCUV/TFBTnim3CpLMG2DeTISRRpUZwUvnr
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: TGkHOouQ8L8_8U2RYl8aglu7OVPUqUZt
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dc75a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=S-WjIMExaCF90Us_d_cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MiBTYWx0ZWRfX7fm+L68DYwue
 80vnKMmPbTRaR1Noxzmsd86tlX5b7R9Dugn0nEgBFCJwGd7DhY0JA4KV27qZWlw/CHtvfvDF4ci
 AcNOs5b+Dsxh+ECK47pjL3IstG6JBCvKchv4Hse7mbKVWhMi4T5Fyts7SLx4psjoO1v3E+31/Au
 fQic/5N5egB1ARa58BxtAI0kOoOktD7u0iT0MWOLPed6wQ7jfqhzE0qhPj7s7EYOhRRUoiNt9Nv
 cBEZkiPuXcAora2EhPUQW4aM7gZnLVJiXXI436MoM19SsO1cu749Qb0Q3K9hMtJrQwI5LVvljvc
 9hDf5efv1dhn6+fY4bz1QSSK0oWf33hiZEs6WIAlrPEEwBiphXJvG3ZbVu8wBpLQJGoqqKLoSkH
 xcZsxrXT4O5JEVyXESOAzGlOLasnx9cfBInzzxnFCD04NS7WuKWWhn9KRwNse8h1hCQzWMfiYLE
 518udeKG9/xw/tM7DTA==
X-Proofpoint-ORIG-GUID: TGkHOouQ8L8_8U2RYl8aglu7OVPUqUZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,b300000:email,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108779-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4414758FFA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the bindings for the CDSP, LPAICP and MPSS PAS on
the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 157 +++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
new file mode 100644
index 000000000000..f0b9e04d8462
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,shikra-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Shikra SoC Peripheral Authentication Service
+
+maintainers:
+  - Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
+  - Komal Bajaj <komal.bajaj@oss.qualcomm.com>
+
+description:
+  Qualcomm Shikra SoC Peripheral Authentication Service loads and boots
+  firmware on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-cdsp-pas
+      - qcom,shikra-lpaicp-pas
+      - qcom,shikra-mpss-pas
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  memory-region:
+    minItems: 1
+    maxItems: 2
+
+  smd-edge: false
+
+  firmware-name:
+    minItems: 1
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the remoteproc core.
+    unevaluatedProperties: false
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the Hexagon core
+    items:
+      - description: Stop the remote processor
+
+  qcom,smem-state-names:
+    description: The names of the state bits used for SMP2P output
+    items:
+      - const: stop
+
+required:
+  - compatible
+  - reg
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+            - qcom,shikra-mpss-pas
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+        interrupt-names:
+          minItems: 6
+        memory-region:
+          maxItems: 1
+        firmware-name:
+          maxItems: 1
+        power-domains:
+          items:
+            - description: CX power domain
+        power-domain-names:
+          items:
+            - const: cx
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpaicp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          maxItems: 5
+        memory-region:
+          minItems: 2
+        firmware-name:
+          minItems: 2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interconnect/qcom,shikra.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc@b300000 {
+        compatible = "qcom,shikra-cdsp-pas";
+        reg = <0x0b300000 0x100000>;
+
+        interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready",
+                          "handover", "stop-ack", "shutdown-ack";
+
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+        clock-names = "xo";
+
+        interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+        power-domains = <&rpmpd RPMHPD_CX>;
+        power-domain-names = "cx";
+
+        memory-region = <&cdsp_mem>;
+
+        qcom,smem-states = <&cdsp_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&apcs_glb 4>;
+            qcom,remote-pid = <5>;
+            label = "cdsp";
+        };
+    };

-- 
2.34.1


