Return-Path: <linux-arm-msm+bounces-103288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAP5FuJ332kATgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:34:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B520B403DE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7177B3113D31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D806537E2E4;
	Wed, 15 Apr 2026 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8R2VLDS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgZHSVd/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA2A37BE93
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252588; cv=none; b=nV4Kbid2AkiI1gCbmYxugCGK8sD4sbtKgpvArD8hpTahGkoIcKpp7+8GxJhTR/nwnf8tipM9ujw0w/5lIpeAg70E+L7lVvz3k19i7snVqP+Ju0Pqov2EGhVkN1/3iTxM+r2NpDNRpkLJc4qU2yfuVCu06S7v40BAu2053nw8u88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252588; c=relaxed/simple;
	bh=Kw7qLT5MhFXRMxGuny+FowYlCESO4Y+NTzQw2T7ofD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sCG6UA+m7Cl4B+jfnW1yAq771jmjKY42FOvS25wpctt0HoqxKWXlBmGB6yNuVux/3sLX6jusqdW0H+62WU64C7xCjWQl/KEaNcjr1qmuV8p6IKV8WlwS+ZUJUXNn4DLJ1kbkfklZnxvKEnGYf8hEf/5sEZeYL9bBuForHEE8P+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8R2VLDS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgZHSVd/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8xXhW3936729
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGbMTA0vTAbpSe432K7wxx+b2nfGZSxHUs6IcUD3ETk=; b=B8R2VLDS5hMPvKNN
	9JlMW2gHy8eokyof1el8lE4S3nCuaoaz64XZ1atuudmgEIwO/mmjFf9kTjIXgRaH
	2f4N4Q9Ts/uw6oqCqr2v4LLHREifDWlGLChnbAEHcDDqaVD5TVPis7b609r94wzC
	wmnpBAVlx5dUetjuAK1AyYgrqWJ5kIyJfON1n/IPURSHkDnoAXRjHQatUchPCCXU
	cg/5VC2VDpT77hk+GTsb/Gq12KSOpJat9j1IhRMPwYPgYRAoQZFHziJttsed86/g
	pWdvjxhD75YmYJZT5fsDQao5rNNw8XDN6r8EC1hd+7EqkLJZZU12z5rbmSyOkoEI
	WLfEnA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrbf3jb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:29:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76c6280732so7478829a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 04:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252586; x=1776857386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGbMTA0vTAbpSe432K7wxx+b2nfGZSxHUs6IcUD3ETk=;
        b=XgZHSVd/VCV28zAAsptHvBLVTStvy3bu4M/bf1rzByRl+nOGD4fj9pSjccJtl6QPXV
         82RpZvO6HkeT+VAhibCG5GZAFqZAc4meV9DMOJGKzNim0Zg0JBVKOFDj8hkZeNrdaIOO
         sXtgsBp7xCpFsyR19HFsNMcXcfNpGoTF08H8KlW2WgsZMfn29lYBR/Dmqq+ujJeGCNIK
         iUFGpSeU3amjfNTs8zMg7mnJqMTDO7Ua9w332wolnd9Pjl1qaSzHjXmPmLAOsSFO20Kt
         vSpKAfncIrpdNzA2M76NA5pjfs76BczBZdUsMfGUbQ7nr8FslNYQi1F8nkBKGRkxU/mK
         82Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252586; x=1776857386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dGbMTA0vTAbpSe432K7wxx+b2nfGZSxHUs6IcUD3ETk=;
        b=UaYrlTbAx/pmEWm5KsAHDXDQ66XZRL9IDQ7x56VgUcp+HprUNcnjRYxo2k0fz2kJDB
         E3yBGv6hQCCY3XcdT4/ItigOjNwzZZM9el066/QT1jK5koZVaJ8L1eWdarA/cJ+2hF0r
         pEeZ+O2MChs8r0+ZN/hidKMoPi/zA7+QQ/ImMG5zcbbfZyMNRTj4iX+jZ9kQ9085UMSn
         Jo6KT7G6yUjN8o0f6Q3e5SB2dK7RbCWHaOLpMKWjfFVfHFaICqoz/8QoGYoa+3VaLVMx
         4rohPhhUmIq/k0crU1t4JUsEVJbLQk+/C/xEbUXGXg2DLVK8a3i2yuQjJHPccl/Dhvek
         42zA==
X-Gm-Message-State: AOJu0YwcK1re1E1t2Tvlml8Nj+yMm6tglukO26uU35dIgSOvtBq6BTr4
	GY7UCvDqJ1Owh7aUtMELJODI4keEtwfggPjiQW5wV/CgpMtJlz46cTloSidr3Ank9YPE5OCEEzt
	q7DNBqHMIYbWxWR0r42nG2l1KXyHuHIr2bw5bNthsPisDmsjDQoEZoXFhq0F9WO0NG3f8
X-Gm-Gg: AeBDieto6Ls7wW0p7tfs/6Sqp6Gy9nVXpAQYT+ec+BHmj11mPrlwGIUJ8NlKsAtNRna
	qkAXzdlxEXUky5ollhLzLBeaacxz6GiomE7klRB8plKJZ8xkl5OGxk4Te7AQVmQQuU/g4pDKF4A
	Oo7b7SiJX6I8LDtF+597aNalPpX956lnSR0UNkeWuqRPsKCAEA0CBN2Ckd2QYFQJHHUkKK7axVV
	hT/v2myl9ghYZsbXKEofFYrKlb62Nk0DSJHzrbcCrTvnanojytFvqqabl2/4omyy4F5ANelMt9h
	ouOBPuG05R0wqid4HQ9hOsSGHvYl79gVMotrnqTBM4STNzdB4zEf9K5OcdlkFmSThV6e3EAzRJd
	kvqhQAyw0INpbUGIaeRCpUQE8WNqrP1ku0TsbmPDbaLQt3t/U7P/V1RpsW90o1zp0pVYfONqrtQ
	Edj05dlZgZdKSrJy9umznUd7uxs5DmVaJrp0QnRblilO8NnNniX4JhojEv
X-Received: by 2002:a05:6300:6a02:b0:39f:3dbf:b0d5 with SMTP id adf61e73a8af0-39fe3f5b42dmr17221257637.36.1776252586038;
        Wed, 15 Apr 2026 04:29:46 -0700 (PDT)
X-Received: by 2002:a05:6300:6a02:b0:39f:3dbf:b0d5 with SMTP id adf61e73a8af0-39fe3f5b42dmr17221234637.36.1776252585535;
        Wed, 15 Apr 2026 04:29:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ecee24sm1417183a12.1.2026.04.15.04.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:29:44 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 16:59:24 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: add IPQ9650 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_tlmm-v1-1-bd16ccb06332@oss.qualcomm.com>
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776252577; l=4547;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Kw7qLT5MhFXRMxGuny+FowYlCESO4Y+NTzQw2T7ofD0=;
 b=1rRUE+fuFkcnI51aMj/2eYvRE8Uo0OjJ0Ci/HAGR4XE2U8RtvvHKzKv0pA37hwQDOguw6fB5x
 WFgUG2IfYj6BeNcGi8JHCHBEAxgNe1xR/y0OfbwkjK2OTWS0+Iz8upx
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: dr5FdCdO3_k2IUIMEvuLm_Nwrax-wV4F
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=69df76aa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=N690yQSzLXC5e7GKbG4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: dr5FdCdO3_k2IUIMEvuLm_Nwrax-wV4F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfX3eN8AckwSYAS
 SrtiD5JSbGgORns4eOV3wzTkvIGnpQkcAR8qnjAAcKzg6SyBisOu2MUTXD9ps1r3+scf0vlCJXH
 hWWmrY/EHuHXS2Zp+HTgq8m2bmaEcRSowew2rdHbf+ZdWCliM2QGvHTmVXedByqfrvjqbs4cvAE
 XYsdf7YzAySsHyzNfHWjR4BSa8LG6F0kVTRdMw8q/gDM4OpDQNdbjrTt8NZAxcbwJYueC07VDOD
 f3idV8zDdQGTYBkPiEwgcmgFm1lxilBjpnelPbGxa9MueXVV5OKojxA5i+7Q18DU8IdFeouZyB0
 C19bxONKlMZxlP2wc1Z0FWJPvxPERsIHY0PnRIuYON6tam83IXNqeyLh2MsFkkYW3W9VbmwrxJW
 v4Naw9KZ77DC+0NcqC0XKkUFJpKrkBB0CtmOSSD7Z1i+aGtgW+bF1+YxZdNAkjlthNKrx4uaVKE
 CM18obdPd7Cx+rBvBaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.15.66.64:email,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103288-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B520B403DE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree bindings for IPQ9650 TLMM block.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,ipq9650-tlmm.yaml        | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq9650-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq9650-tlmm.yaml
new file mode 100644
index 000000000000..549eaa6aa11b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq9650-tlmm.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,ipq9650-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ9650 TLMM pin controller
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm IPQ9650 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,ipq9650-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 27
+
+  gpio-line-names:
+    maxItems: 54
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-ipq9650-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-ipq9650-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-ipq9650-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|[1-4][0-9]|5[0-3])$"
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ atest_char_start, atest_char_status0, atest_char_status1,
+                atest_char_status2, atest_char_status3, atest_tic_en,
+                audio_pri_mclk_in0, audio_pri_mclk_out0, audio_pri_mclk_in1,
+                audio_pri_mclk_out1, audio_pri, audio_sec, audio_sec_mclk_in0,
+                audio_sec_mclk_out0, audio_sec_mclk_in1, audio_sec_mclk_out1,
+                core_voltage_0, core_voltage_1, core_voltage_2, core_voltage_3,
+                core_voltage_4, cri_rng0, cri_rng1, cri_rng2, dbg_out_clk,
+                gcc_plltest_bypassnl, gcc_plltest_resetn, gcc_tlmm, gpio,
+                mdc_mst, mdc_slv0, mdc_slv1, mdio_mst, mdio_slv, mdio_slv0,
+                mdio_slv1, pcie0_clk_req_n, pcie0_wake, pcie1_clk_req_n,
+                pcie1_wake, pcie2_clk_req_n, pcie2_wake, pcie3_clk_req_n,
+                pcie3_wake, pcie4_clk_req_n, pcie4_wake, pll_bist_sync,
+                pll_test, pwm, qdss_cti_trig_in_a0, qdss_cti_trig_in_a1,
+                qdss_cti_trig_in_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_a0,
+                qdss_cti_trig_out_a1, qdss_cti_trig_out_b0, qdss_cti_trig_out_b1,
+                qdss_traceclk_a, qdss_tracectl_a, qdss_tracedata_a, qspi_data,
+                qspi_clk, qspi_cs_n, qup_se0, qup_se1, qup_se2, qup_se3,
+                qup_se4, qup_se5, qup_se6, qup_se7, resout, rx_los0, rx_los1,
+                rx_los2, sdc_clk, sdc_cmd, sdc_data, tsens_max, tsn ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,ipq9650-tlmm";
+        reg = <0x01000000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 54>;
+        interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-uart1-default-state {
+            pins = "gpio43", "gpio44";
+            function = "qup_se6";
+            drive-strength = <8>;
+            bias-pull-down;
+        };
+    };

-- 
2.34.1


