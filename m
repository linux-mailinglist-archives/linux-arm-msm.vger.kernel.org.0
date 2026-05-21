Return-Path: <linux-arm-msm+bounces-109099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHuPMqAND2qSEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:50:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 471605A6481
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C9F83201561
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80ED13E0740;
	Thu, 21 May 2026 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7VMxTf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cyKf2pcx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85953DD528
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369714; cv=none; b=b2hi8+dyHnFLPn56MUTs6GN4Sq4JSNyEFy7wqzpGCqcyF5S48GrO2+PuDJSf0T5XCPPsSKYRZhJoNwA8TcCcooiX077nezwC411d3KJ5ZQBxNThk08wqkcEiABWpJBact0qrEfoyE0BmIM/hwkftYJMF1mR4pjzwhqJ8xeoeb+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369714; c=relaxed/simple;
	bh=WOS9NeC39uxBDmQsKUonAixYkMMIuJtaJNc9JoBZf8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFw+uRNJkdWCqCAKSsGnHiungPeFL1tQDFq+ybYpGPr8OqcotxGz5IE+DbPeCh3rdXHS8baRRWoQ3Eg70Noy9/miucPqA9PYtfU7Fbac3JuUdsGrfytikTHDsz1KL69X9+eweAU+WacqcShD4/+vhxvqBMbLA9X8AK90qpcIUGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7VMxTf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyKf2pcx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AM5x1731236
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gDgmsAwXYnpFposLGCN80rVsLDgqPUCIlT960vNx4v8=; b=o7VMxTf4FH7ktOKU
	wC3DhOa9eFy3sOMF2ZgPvYfpYLYYhKhlIAvuq8ATEHfGMXeVuPKz62PxcranVWxa
	YnBP0bRCEn1Msry1vah399mOoBk5ZYC7ZOowMBiIVNaYW07Km3R7rLTQA7gLD9k9
	zMn+6KU3214UOMXuwg+nJtEU8JjX97VKdWtswt7SD/ggCXkNw04pF1/46xVMfgVT
	D/MZOO3strIGmK+NPE0md4NKnlYjKvzCMNbwFwykorr73CJXA17uZ5NxXP29RsLr
	iHirprh700rP90vtp2bStYDYKVL4W1B3ghMDgPVAsFMJsrBMSoLFoJZpRU1oc0BC
	Uhr4iA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f5hr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:21:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366015bca9bso5402614a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369711; x=1779974511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDgmsAwXYnpFposLGCN80rVsLDgqPUCIlT960vNx4v8=;
        b=cyKf2pcx+Mlfl/3KYSOuwAKFLSpovpU5SkZPzlLSIkp0SS4fPGS7d5sqANGMSe+z9n
         4ppehRsq22z8oCj/1BScKWUr0XsFtzKMnozMC56NGPi2yWgnnRlyIYGCSi6zNEzzb+kQ
         orXOIHX98bi5JkyqKvJ3QesmN5kAvInTCBoBchJLrus/2MaWmkmAMtZaGTHTbO1noj4v
         JKixsRpbS+7oi9NqcHvU2vT/1PaFCaj6ekd2o9NnU4Fmv0Srv13fqS/cOoRhvxVFcOXU
         +71T32vwGkugsVODiATFTX4/NgJjU6vAzUdo46FqNNyTA+nH7CamaLDeqzlN5Fz5Im3D
         ihuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369711; x=1779974511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDgmsAwXYnpFposLGCN80rVsLDgqPUCIlT960vNx4v8=;
        b=PZq5hFgvq70z0UzXvD4+SFk3YBi6O1dS/NOoB1M2q0Fe3e3KjLGXoeHZTA+JMQYPj7
         vv2IdonkhheddjJxksr9XOOcp/HSKHbf6b84nVGlxCP9FI8E82BFRsvS/AF65ENyuYN9
         NgPnZ0niE9cnyRHqf5o0WDwFao3EGqKlpx2lnN+tJ6ikFO/5fTgCNdbK5CPeK1qWQc2z
         H00/d2ww/1Xqv63eA15a5OqsIEEV3970wtHww46KxGUy9udDdchFxapuogbZ53f1clrP
         DWxyurnjHW6qB1zG5BT3ojAVMEuZqrqNNu2tfdekUrTkTjWXVVain3q8biRe4U10gBun
         ztOQ==
X-Gm-Message-State: AOJu0Yz/gJ/DMyXKR1iEcyJR0CcjGfwDImoccwPFQ/UXkSkTARZrSeBj
	XuSi8lbQZcmg+FXgbQENaFdmYZX35TIcNxwhDkq7KmEax7Nvi5hx/7FQgVnlnyJoWbxxz5AWpOr
	HniS3S74jbqDlmJi2LzD/gQeX5Ac8/bOeFQdRpvBzhPeFKYw3tnEEySQwdF3EA5KB9fxN
X-Gm-Gg: Acq92OGMBJQv+RSbSpaak29riDuYCBw9i9FkvUbniKObYKd2aIghLFS+6NeAqFX9sRo
	x6TrtvfpmMZU0gsHkvljMSYSfVpeZEIBBgAxz728CcbK2CcZBZchaMOvptLSuRz70vJFVdcfFxC
	Gk5ZlZIPfAbC2NaSM2G3du/JhwZGgVMNq6gsWBq3Q7Duy0ZY/2NqIKj2B9eQDYEi/Fi2Mb0Tn12
	xOoyJ5XgzdWXDl506QHLU7K5V4sLKDbikfahgG2dI+LhWNfg35AIFfWkAYlTs5YIaQQgWsNYQiQ
	SmdxlcEatlQses7Z6nuVC8UrLAgi9CmHdSvt0MJ2nHdgiJIIcpeQ3497jqu38gB9l3rGVhbTYD1
	HeIiEjJrQwOPtaInyQ3iSuC4LmKoY17wwRglZ
X-Received: by 2002:a17:90b:5209:b0:369:277b:38de with SMTP id 98e67ed59e1d1-36a47ad959amr2528185a91.18.1779369710628;
        Thu, 21 May 2026 06:21:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5209:b0:369:277b:38de with SMTP id 98e67ed59e1d1-36a47ad959amr2528149a91.18.1779369710107;
        Thu, 21 May 2026 06:21:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3d1e9300sm2927797a91.13.2026.05.21.06.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:21:49 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:51:37 +0530
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra-rproc-v3-1-2fca0bbe1ad7@oss.qualcomm.com>
References: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
In-Reply-To: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779369701; l=5517;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=WOS9NeC39uxBDmQsKUonAixYkMMIuJtaJNc9JoBZf8g=;
 b=s1Db3ywribOPFOGL48RLiERZSRJR9jr7SZgvy+nA029u/cPTYD5/xUAMSnvPjki8sPrsg8PT3
 hjBATZpXr+cCrRXRgnTSJ/3jujwrSe6TEb0eYrCSU28T+LOONjO32OF
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0f06ef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=3mtr4TzY_RZMnomRqisA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: upGwjdElKM3LWbX2DCZPplWu9x2e9dMR
X-Proofpoint-ORIG-GUID: upGwjdElKM3LWbX2DCZPplWu9x2e9dMR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzNCBTYWx0ZWRfX7hS1kkN1szpK
 8tbhRPQEnFRVJBm1P8wZs1V7QvgxpuLclc7IsA4bs5DjToztxcYVU5T5YxBx3dS3EszdcTAlTML
 oL6oIaWQD9BNzl3EKJmBLiTUuwIKJTTh1sRGOUpkbHtcAwbOseBaBFlEVAayQl6n8KNvk6TBS7C
 UcHOGY4gk30tsoccxGHpqv3ayRkm8wTo9QAN+Cd7GX6fxGB4gdtBLAyTeHhJ0QZq0jXUXYxC/yA
 v8JfGfiH58/8kE3k/PZrMs6I9l3KM1oVmJn+0xm6EOiF8tTQwskDokscMU0bwg65De2Y8xCPYC/
 fsNyzqNo+J2YyJxCL7onlWRUlW2pJr7RE0tIIGAEMneuyYb/JgSjprOvo8IAljIm4PJAXHOhCyi
 /ardWTjXOmclsZtxXMXdh1Sj2HWS6gIU/bk0oaqHrETVKaqeRwHcqhSe9x8VLpVSs++SKB/+AkX
 yAPvicdA5klYuxy9klw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109099-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 471605A6481
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the bindings for the CDSP, LPAICP and MPSS PAS on
the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 167 +++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
new file mode 100644
index 000000000000..253b14eb2b59
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -0,0 +1,167 @@
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
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 32
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
+        power-domains: false
+        power-domain-names: false
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
+        firmware-name = "qcom/shikra/cdsp.mbn";
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


