Return-Path: <linux-arm-msm+bounces-104684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNEVOFY172mR+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:07:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F641470900
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1742C302D594
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9F13B47D9;
	Mon, 27 Apr 2026 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYqUrJEo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOV6UGLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CF33B4E83
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284333; cv=none; b=EjcXsgvNfRKtxEUx49xQ4E+m5tDmeO5IZxKsfH1GuBTSSuGAcfDDuofGB6Rj5TbZke91jDybk+pJVuWQaO0Uvw6Bmv0JIoLO/MKO07EuWB1lJ6adGp9giImpr4aqlHKQnbVT/5up2t6KdMj9ZrhiftP38EvszrKEjf68RnAQwcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284333; c=relaxed/simple;
	bh=zFarwFyP7Mwjc36+jVJxSXy6/e4tQoyriPLsSHSmWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtD5h9w3hT2T541dcOAxJtm/8M3AGfquuVTf8STN329xWNqyAPVXAcjwtW8qLk/3jd9qrp7Rz6JgwZl04g00E7OwqarglGPjuT3FkEEkQwzyT+Mqm99ZX17TW3/jnKiQ9nFaoaw+K2InXgt51mUOUVjR2Y6AzKqdUJMjSgnemKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYqUrJEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOV6UGLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TLGA3683006
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=; b=WYqUrJEoiVFArZGy
	nJIBZb3a3PgX7GJtmkR9ZHutSLEhXOeSAy/vgVYRnzn6K8sWDOQclsRKPzZspMaP
	L7k21madqwSV94yBcn0ww0u2QCHIZvHkc7svz2+UQrh37XJ+YdzavIEsy3pEn99t
	TuhSM3pzNYJ/tU8043NMJrcnfSbh14MX2EZIZ1rhhmgSC+/15kq9Ruc/xVDOCn5o
	fpyVoTxMNCc+L2QBhXzGH14Ra9RdAeLDx96bmX4R7TrEPkWP744kc49PToDLmWKU
	Rgbx83zndobpYkBhyWoVoaILCoo7vK0A3DkkfGoczDv4d4/CGonPUq7jpZ+d8mS2
	1Lt2bA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr5k3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so12170082b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284330; x=1777889130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=QOV6UGLYMt3ZuIa3hLkeMurokulxZfNqVajpl3fkZRQaRVfH/Rt6hgcBezd356M6gD
         5ytKrAx0dmfmH9xrwk0kC3OKsnVyuMO11z0qLwAPRHHS2AHx3YHEnTmWjt79GlguNQcP
         0WXYoiD+/jS+pNuKPRgacA/8/590up+WOlz3XR4W4uGfz7DAm7wtRKV00bppQjNL3N+k
         fr6HqDIBXr+5OO62P7ewh+OhVKSHQKbIlOQMBC3NZ0nh/NkBxzZ4sZEOI2e/8FY2P1Ms
         zVNpn1qHLADDT0k5ZcqTYPm6zuxxQ/w+ufFXv7le7NMxxu3ExlguK0JkGtSjkViMWAB0
         IaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284330; x=1777889130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=QOxy5j2szDwAtL0OWJLfFUrt02k7EZIu9g+T9ihzv5cpnZD3lDTqwua14gcMAVVN0u
         JYKo+Hd939bp8gwO3d3PtAgdg4odgEZ4wgW1y/K+KUBUFFzTfYU0YL2g9bt/nApH5sXL
         PplfqO/XRryjUcQp4HoykS2HTU663r4rW5/Tne03+tAK3j63s0AXX/mNtOGOqEW89sKM
         mpAfswMnd9qq2CyR2x4ylk47Bqh9w9d3sHGIkp3S6k9GE+DfFYEiadgUOTQLiVnk5nSX
         z0XKK0C/8fuYY8RDrsY133zOAHL/barg89w1umnU58TPszZVqcbSyHWPAspf1d1idMrB
         ThcQ==
X-Gm-Message-State: AOJu0YwyOIqBZaCxno9Mk9+qf//joSFvE1CHQrl0PcWXNDosDka7lMle
	gYhpN+NMsDFIt3POWpwjv+bFcvXzZQ/80VHsyU9KFp3vHrUMIQQq/zWHfUwO+2MOUwlNW4wHcD4
	hz9EnVGU7dsWVM29HG8YKhoQu7yqxYVjzo/lz01JhnQwQdNQ0ta7S/j5HRb2D4TGidEb1
X-Gm-Gg: AeBDieum4YUCAPXbU3xnuL1kGWr3scAVjgQfLN5Y38EPM6yy69LB2JKwmA3RFS8Juot
	0nz624pNnbSXH4z8j3eqbyVLuvEopZ9NIGbgBDaeD9/Q8J8/KaTv76ITjKZTjy1c0KosKk75jWD
	rOC2DdFs8A2vkilBUtWydadD3+gPpnKzCbTvyuyEAs8+re2e7ewGXokxl86BzPVve830xWizT7b
	uYfg4MZvK2AiONlxk+ED8sWZYbv9trRBj41O8r16wnkEhfagynvt+walUBKfyTgayN8mTzKI7uJ
	S+0xSb65ST/k6I96NImkcBivSKs4Sc0X6nlSjkYlZ/xPN29ZkiHQJcTDQDtV7PKpGOrH/qJaKdj
	b6sAM8TNSuUfKFxctqWD8w5YyFyQel/k1Tqmj63ph8oQt4RX6I1Hv+2jcxVJpz8itSOu3ou+pZ6
	oLsSOeER9tyuNOLQU8Wfshgzy98R5blmcBTP3wpdnVCpjV
X-Received: by 2002:a05:6a00:929b:b0:82f:5051:f022 with SMTP id d2e1a72fcca58-82f8c8c7bc4mr44751994b3a.32.1777284329636;
        Mon, 27 Apr 2026 03:05:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:929b:b0:82f:5051:f022 with SMTP id d2e1a72fcca58-82f8c8c7bc4mr44751948b3a.32.1777284329165;
        Mon, 27 Apr 2026 03:05:29 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:28 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:52 +0530
Subject: [PATCH v8 1/6] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-1-702f74e495f7@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=2330;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p1qib2l7A/JEOeiEFUXoqiCJEoH/aeCCTCy9wrPvB6A=;
 b=ErNzU5mw83Da2u7kh008/Dc0CT1AdXprku9fq+PLAB/henuOdFNdmhU9r870WHRACmc6EEBKF
 1J2D6KcowsVBQ+RURg+8DJkn1ei+/DxrRWRW/LMM3p9WPpGpLe6w5xS
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef34ea cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 498afg2FXeCnJ9IG7g8qvCpBMOKdkuyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX3fAPpP7etjvN
 SGCcliNP7rCk60X9+5EgXuhN4O2UpuiAD7cKxQ0emOI5s6CgluqwxiuOj+aG65NMoJyNRaBpzIx
 pdk4n5fiAGs0OM8pK8QFH9xOgxnv/zLRfqmKq90lcWFUfDmvWxp0IQwRfP88xvfMVMu4vMn98o1
 C2N6oknkTrxhjMyEAvu7KlapkoboJ/m7/w/fu7SqQ5VBynVeFBtBqmambvtwz58x4CqaAM+q+mt
 v8Q1umKIGjznXfRb930bI7/84S7jbwBjc9fxnwApCInLWfbQyY8Y0XuGEJmNT/QCvjS4zQ8riZy
 Wt5H/XDl6zGi4TozJfAZ8EqhI7qX5k+Z4k2ffbNg/Gisze+ANWudcF4dLoVTbC1KBGiraeyH5QG
 HQZ4oDHOAsxd8CaHY2LugKXUUEUig1Ezm93PbuD8Lv7TMCrDHsXg75S50dv0Vn10WkTxfhFMyfO
 74v++P97MjohY7QsA/A==
X-Proofpoint-ORIG-GUID: 498afg2FXeCnJ9IG7g8qvCpBMOKdkuyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270105
X-Rspamd-Queue-Id: 5F641470900
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104684-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.76:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Maya Matuszczyk <maccraft123mc@gmail.com>

Add description for the EC firmware running on Hamoa/Purwa and Glymur
reference devices.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
new file mode 100644
index 000000000000..ac5a08f8f76d
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hamoa Embedded Controller
+
+maintainers:
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description:
+  Qualcomm Snapdragon based Hamoa/Purwa and Glymur reference devices have an
+  EC running on different MCU chips. The EC handles things like fan control,
+  temperature sensors, access to EC internal state changes.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-crd-ec
+              - qcom,hamoa-iot-evk-ec
+          - const: qcom,hamoa-crd-ec
+      - enum:
+          - qcom,hamoa-crd-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "qcom,hamoa-crd-ec";
+            reg = <0x76>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...

-- 
2.34.1


