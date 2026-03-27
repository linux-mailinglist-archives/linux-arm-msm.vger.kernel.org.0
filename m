Return-Path: <linux-arm-msm+bounces-100251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMOpNSFYxmkrJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:12:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D65342462
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA66230FCFF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53143AC0F1;
	Fri, 27 Mar 2026 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c55QlWZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZL6nmuwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C83AA4FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606110; cv=none; b=hDX58UboC+GbAtFeuQqoHMsHjpHh1CTJkT7Xhtwey2K7zu8gxNrPqQ0mlncdWP4eaFw+VC3Vgt8paDSvBjEg58PcCnoL+mL+huM4ZyvtUHvUHyTltNKts6jD9PrarAF8vKXb09eX4Rl3d5XYjHLNFZQXPr+wD8Vvhlb4alTkTIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606110; c=relaxed/simple;
	bh=zFarwFyP7Mwjc36+jVJxSXy6/e4tQoyriPLsSHSmWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drOaxXufm+MSx3nQcPOTpyz8McrcOJsof5Nk8YlhBHEZ67hrp732h0cZ0HQMwgVNKYklIlbsb36licN90SxqLCoHHzhM0iW4xkgZKFyHgBSAQpgSiqXHa3nMwF1PNiGgnMhbLvODr/yhLoKjk/PQjgUXJFNulmzHQbZGDEdTzqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c55QlWZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZL6nmuwT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vip8731349
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=; b=c55QlWZTIqH3kt0b
	BzT4MbUejVF5XT9ecsnKzSZOP+eUw79msQgPUYNjA8+bFexRV18N/ijY4pH50LLw
	CCjhajW5SYBJU//8y0DcSwqRsQ8j9AEM4ePRAkpLSMCnqEU4sP9k0Ud77E4AasBW
	shzoMTU6CHDGeXGn4GbOmrTsTjNeuPl/6cUx7SksfWrkG3Yc/FjdoTEZ6sAXwCla
	i8nr0GUIYFvmpKcKHJqbwsKGwfp7iSUG6lcmYQRLHuissM9kowGbIU/5SltnqTsg
	Ke0fZg+v6y/ZdKcrWzh6Y9N3p0RiAB51zvjpfw5kFQLAtnBlxwSLczj2PlfW2g4Z
	Jj9zUg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q2vvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0c8d0df40so31629305ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606108; x=1775210908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=ZL6nmuwT52ofx+3Jc8kS52AOcLIAdy8efUxQ/GYnCEq1fM18pjP9ZpljOY3EDW5AIR
         jiPpAN1wQWGrdf18YRerl1B8V9OXcfX/2ezUN04ynkiuDKcbP5hiKfxgO10nywgcFQEi
         HxNxOIdy0jbl5QNuSUraLD/9Dqn7WUJ2dBxZTa92eF10q10fvXJNK+D8piB7D2cP6BYk
         t9suRedfQHBt3XGIb5z1UqV8uJHWBgQlHF32p++bC64ryk4j56h8QHVj+wdTJPvmvs4S
         cIrcxxF1dlCD54i3ADECJI7pLCXFxp96SBg/DgzB1iSdC216YudXZsGuHHaHwyURGUU/
         WGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606108; x=1775210908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=idxboUpREkYFD2CIcRFtO25gl9ReehZxhvngeAJ6b0VZ1X76JrezFMlbUy0bcQxWzH
         XLlUjzs8bUrKSKq47nuRsjeIzkEYbm4ndOipqX7c80qc7MlWnP26Db3J3U6QLdJRhk5B
         VplA1zwOw3K1Fwi2JXy45Qy3YZNybGoMEV9MELGI7XiP+GsVJqZ9esj6HKc1USR2qgfi
         ayKxkjuaWYCjr0b0DITydVG1VcyAyMjy8mU8L06qXLez/WxGmTuxYqHGgCHzZ4pL3oV0
         1uI5h7h7XWpgVFJxosOtofa8xO6J6m4qBEPx9OuiCXZXuAXRjejJNvQAw7E18miH87bC
         1UMg==
X-Gm-Message-State: AOJu0YwX1AWInXEseAtUZZWpSrbdba74Qq7Yp99qEjEXtqWzpO5gXJmR
	3Gc1V4hZ6+qP5Uc2hp80BYYwgAc0e2URB2cIro6UbPdML+PEub2IohDhqeFl2G55mlYxHCOYeXa
	UDxXtFf/6eTFL+zx2q8nox4tB/oD+yRo212uqNqf+VthVsmV+f6744KGN3Ib/4Wy2Xd1P
X-Gm-Gg: ATEYQzwOBkIEt8nSG9SDXySzBplw9LvtiAd0YIw+GT15dKzzp4fkULk1jewrE7KPOgC
	Hzl2fZoRPx9+SLBgkJs9Q3s/1O6yC+q+FBpxAmEuzVjcgT9Z31n31HdmDvd3xfppMlbOFtX/YZt
	/3oQHxxakR5M62SZk5tDYM+uKS2BLEpHWSzqZ7VBscMFX4LbjFPE/d2AJWx7ov/7yAOsmRv1MOq
	oasAzNLAvczjCq5fcRqNxCZK4lIlmvpXPzihE4Vx+k5XwG1kHkhSrgRnkju07r62JYSHpXgDIUx
	m2aDoHqkIEqprUfzRlXDyU9fefVugKcfh97qP5s9C2YPNbOEwQkGHXEkW7hDZWg5bsMgg5qgJtp
	BPCujk7R4/1JSx9jsUqlKZyRgiqUYjzqrnLq/p63JakSS0ewD+ARFs9JFIJ/hLaL5R3sTccdssE
	UO3XU61MV8GF2w1TzSd0WeOGXbrGGBgyUDsA==
X-Received: by 2002:a17:903:4407:b0:2b0:5e10:9dbd with SMTP id d9443c01a7336-2b0cdbeb419mr21200135ad.3.1774606108340;
        Fri, 27 Mar 2026 03:08:28 -0700 (PDT)
X-Received: by 2002:a17:903:4407:b0:2b0:5e10:9dbd with SMTP id d9443c01a7336-2b0cdbeb419mr21199805ad.3.1774606107878;
        Fri, 27 Mar 2026 03:08:27 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:27 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:38:14 +0530
Subject: [PATCH v7 1/5] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-add-driver-for-ec-v7-1-7684c915e42c@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
In-Reply-To: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=2330;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p1qib2l7A/JEOeiEFUXoqiCJEoH/aeCCTCy9wrPvB6A=;
 b=ibsuvcDp7Sci9hgY/3jUzw1fXjDiY0ZejF27wXljaMswnfyugfwJ3uNG0dIWxoB8AvBUswIOD
 tEx7k/gH9++D2t9Xkg/+d1HwaTmOXDWXfd8TjfEHcfAacxuUgEvO+ZX
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: rgg7oU4sfa7a9AVVtHa8ov7xzkybAI9k
X-Proofpoint-ORIG-GUID: rgg7oU4sfa7a9AVVtHa8ov7xzkybAI9k
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c6571d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX4IwILjQh9vSX
 1mh5O2EZDfhP9q0tXENJupIePdaYGbdYGBgkcLIzw8wOlPIXgRpLbukVj1F9tc8Nl4k/uzw+Jja
 hJArmmZZABfZVMbcv3v1yC+ASRDA8lgETNS/E1XVQIPoDpUtPUgGdh3UnT7lC1csZmbhanlHP5V
 hBN+q6rZVI3QZynHUSgXcBuHj/X74EYV/e01JCaAUO2a+DuFTGtOUqhmZrbvi+f6vI09tR97Dt6
 zehy/sEO2sA8eWLogOifG21Yj9pyIqeOYGJ6UnDM2SMgKe5P7s+oshmCdBBlETT6KHpHK5fxpcn
 74wbb+fnFf3CxxwvRJIwYnp72dH+k/jXNS7mJKxu1KbVBDVLUv1zoWKkaoEemD8ojL4NXXX2wYK
 GcadiUPpOZsY9TjbBLrZWvVAtpWCSgt6Qu1ZKOKB/Y/8xWpZoiedcxt+ZsF9LRN4g3CbjEXBo5H
 0/xtw8/Xr4EnErLQf3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-100251-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.76:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38D65342462
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


