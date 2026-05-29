Return-Path: <linux-arm-msm+bounces-110200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Bm2G3LnGGruoggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:10:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A95FBD7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9760B31A59FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 01:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A48A3546C8;
	Fri, 29 May 2026 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BY8/Sy7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1j63/JO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880E934DCE4
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016750; cv=none; b=jJNF2owAUbBMznEjx/TKV0c815FoULlI7QYXas54ZxH4tfoFaj6yTtd64/FA/JC2ZqUlnKiqh78kFPJrtzV4O2Hz0HQy+F+ppV/eARJr1L2v2zg3LposvCMc2bGuhJHwT2qYu5lNN+TYNefmfLQgyaFjAskG6bm4JPPqj+XrhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016750; c=relaxed/simple;
	bh=lXy4t/t9OCmAgFepSL86P9vwWEgmZ7kUmPb0JJyweV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aV7R6pOeYe0BhtMN4R2NZ+wq3ooZOzvdboFa4ZNwzHQX3VLPSe8dquDYGUr5y7YkSG6DQahkE3TJoSy63b3ZarjvYal5kiqoFFN23BdEogMvDOkY26d/fVR6K2bikNpkAO7194h8KplKXbwZzkKSFji8QPk18iPanZXf1o1d9Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BY8/Sy7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1j63/JO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0A5vp1495603
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u1PyjGjvKsU44wuqA0Tto9I3prCpdK/S5nLQhgommlI=; b=BY8/Sy7YEVtBa8O+
	G1Qi7JpGGF9vxDTfK+oC+9hpCUJqtYV7rH9iKoIAO+HdXmyiPlwLUcGShpa+BbrN
	sx2BDujI++nRJDvyBorIp+1rayp1Jnnc7iztWLfkztSQwYD7ZoyuUP2SXoeO0nfK
	wv8qIcYOgwfD0/EVnUL9889TppeY5+Rhrc2sqK2kLkmYhfzQ5NlwpxgAhzaFzguy
	l9H2uoLN/dQ4l7PtB/f5FyTMq+wpz2pZCcCy4Kcfqgu5IC/n6KeEb1VGJBv4SoW5
	S2ihaOSprCxpEVGy1+ZtfDKeGKMZUmFTlyGiEXLZIsY3XNhPyvUfP6YmyH7NBBLk
	kMN5vg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef01585kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:05:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304dd917645so1023373eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780016746; x=1780621546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1PyjGjvKsU44wuqA0Tto9I3prCpdK/S5nLQhgommlI=;
        b=i1j63/JOQTXMh+ENzMnCwfY/fFnvl/JY+3US9r4g6wXJBS+/gBwAKN1ZRWDKISKtLI
         drv/NzbhXVDFp6U/FFxSUhgEKCySV1aoB6KOP7F2xkDB97+0BMcq5XGppk9sogCWl31A
         XnX7RILAD5o5g7l37uTkzFDzsnBnNmedWByQpVZfkbxrAj/jm8sBxzQZp5sv/a4UUbDh
         jkiFzFFx8lXP9nXiLfTeA8CjzsrzEGVR0nxXZohMgNMK2mtqm8hTFuIBHJQPZW5PgicG
         vwd9xACvXZgsNyrKo0y9s4JxHyAnIhFlm2PUaoiuvy1hZUf9bR13M5Jcirb/f+lcQME7
         ylIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016746; x=1780621546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u1PyjGjvKsU44wuqA0Tto9I3prCpdK/S5nLQhgommlI=;
        b=SDFNTs9wuOklk8U69NMCACBa8b/6G0qFZ6O9UdfBFKa6dkGk4z2z0Bp7i90i3FPXlN
         MTUpCnWtN5o3g25/i3ouhO0JNM8aMGwPK0YoNiQUVjv/W1Tuz34FqhuuECrJZFsgY+b/
         kBxhXL13JS4dos6k2JtdUDrT8SvlPfkAyuaT6jFW5+xDI/IGXaSMAF/0ozi4AmyONyQ+
         D/L/Adb72kYbjz7azgqhfAt07dQAg3v2dhKFTlrSP1JTYLeVlkFpvOHsf8n5x9fVlpLd
         iNKGsvRkN7dehQjNMdBNCBP/ur7kRHmnGKP3EwfLhxTe/bqQUYgThIDe2O6FFDOoW0is
         CFQA==
X-Gm-Message-State: AOJu0YyYzm/3peswBTt8M0OoplgTFVL0MVdW04+UD0N2CSyj39vdybbM
	2ednE03HKU/zVRC7tnxEbN6OzkISzRlfsH4cfriVClOxk96pYyehEnjffWTJOnXxnqDLLPv+IOJ
	T+kPYpOyCkrNRhJ+d0hvdFX5FaFOp4az5Uq3HWcbJXfPCLGVe2aJK1HTfvGE8neTs/Ozf
X-Gm-Gg: Acq92OFTvrYq24omTVyD4pMr3duS3VKHlNO6OBCI2Bphgew4Dapcb4+wvdvRF1s2J4c
	wx8IqrtUTCNz9OI7rs9l/DSaqoCShNYxLOebHqzpDBiCJhzmFAmmGCL/luSCEkj9LwPKhTjbav9
	IMPgT4rZQ6W5V8g4guT0jQIKpd73xjC1oI7XJ/tugUiQYPBpY2PaAyg4rzmI5q25V8t54BjEazp
	VaVZ3vB3svOKoL/ur4MZP35HfHfq++xBbC/TskpmbrgiiEak1egEOmh4TI/XHezngT9Br0KzCQB
	Dx9FGPI+WlnSTmsbuTYUIQcsIjoGp1rvnHtIBkhU3UcMJZLJ32x9eheg042S1W9FNnO6D6JKCqo
	BiqMhozM0tV2Hjb24C2cg956JZ9li7hf33ByBVMRsiU5/sktYqwTylghVX7JKOUUOOg25S9Bcdz
	NQPg40jAKg
X-Received: by 2002:a05:7300:a484:b0:2d0:239a:23cb with SMTP id 5a478bee46e88-304eb0d866dmr475132eec.16.1780016746070;
        Thu, 28 May 2026 18:05:46 -0700 (PDT)
X-Received: by 2002:a05:7300:a484:b0:2d0:239a:23cb with SMTP id 5a478bee46e88-304eb0d866dmr475101eec.16.1780016745528;
        Thu, 28 May 2026 18:05:45 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c3121sm179812eec.5.2026.05.28.18.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:05:44 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:05:36 -0700
Subject: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 level-shifter function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-pinctrl-level-shifter-v2-2-3a6a025392bf@oss.qualcomm.com>
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
In-Reply-To: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780016741; l=4665;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=lXy4t/t9OCmAgFepSL86P9vwWEgmZ7kUmPb0JJyweV0=;
 b=VmA/SAjy7f4I991yfIMjzvCQdrqCb0zwssphblgXNFImVZft9fr4KM4C4Bbnw1S2jJoli3KNF
 T0DrFWOqOKVBJ/uIBeGaYuTzgbuN0oW3YihDJQP7kPejTVAD2TDoV4m
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: fzq8G-WKU0j6bG3GPfnowtxR64_nLF5B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwNyBTYWx0ZWRfXxpNfIKkIP+EG
 A+qn29UDHOmvkGy3gt3ioXb2JiatP+/0BGW/M4qHHcsRvClsgquDkGArZx/cr2oovR55oLRmPvA
 DGX0jZJtX57wQTVrRSgYdRuY1vzABxxtTM+wPLQHpkiPuzUd+Qv6mDejqcMELq9SGj9zcG+rbHP
 uBr4EPaDgln55270oZGW5zyfY3P/CqKe3dbGT4IvPmBDJeSIrL2ReehJQ2PPSVSqQk8oNh9kaMx
 T64fC8GcP0vxOS2yPJA+ukTpFynqtQcStwOoltD2o7lYt12YdLtxrLHQ2VslbKU+V7daZrguwGZ
 YOWrUDG/O6dlzGdURZnKDA43iors2V56y+5Okbrjq0aVgVbQV6t5fsEydJ0SWt5kcosgKVuS+oK
 EpZEf2/rVHN69pZg8cj32zR3f4bx9vD1Odl9Cvba+cAPk31DVEiyRPtwTZy4txNJN5EoUlZruj9
 LSEXNuz/ad3NDXwJL4Q==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a18e66a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oPYuZtxd-o3nixQqOr8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: fzq8G-WKU0j6bG3GPfnowtxR64_nLF5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290007
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-110200-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E87A95FBD7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the "level-shifter" function and add the required DT properties to
allow RPMh firmware to control the level-shifter. Introduce a custom
pinconf parameter "qcom,1p2v-1p8v-ls-en" for enabling or disabling the
level-shifter function.

Additionally, add the "groups" property with the allowed group names
that can be used to control the level-shifter function on pmh0101.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 66 +++++++++++++++++++++-
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  1 +
 2 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index b8109e6c2a10..19dc61ddff2d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -119,6 +119,21 @@ properties:
       The first cell will be used to define gpio number and the
       second denotes the flags for this gpio
 
+  qcom,rpmh:
+    description:
+      Phandle to the RPMh controller device. Required for PMICs when the
+      bidirectional level shifters is used (e.g., pmh0101), to enable
+      communication with RPMh firmware for level shifter control.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  qcom,pmic-id:
+    description:
+      The ID of the PMIC which supports bidirectional level shifter function.
+      It is used as the RPMh resource name suffix to request control of the
+      level shifter to the RPMh firmware.
+    $ref: /schemas/types.yaml#/definitions/string
+    pattern: "^[A-N]_E[0-3]+$"
+
 additionalProperties: false
 
 required:
@@ -330,6 +345,22 @@ allOf:
           contains:
             enum:
               - qcom,pmh0101-gpio
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 18
+          maxItems: 18
+        gpio-reserved-ranges:
+          minItems: 1
+          maxItems: 9
+        qcom,rpmh: true
+        qcom,pmic-id: true
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,pmih0108-gpio
     then:
       properties:
@@ -523,6 +554,19 @@ $defs:
         items:
           pattern: '^gpio([0-9]+)$'
 
+      groups:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description:
+          List of GPIO groups to apply properties to. Only valid for
+          function "level-shifter" on pmh0101. Valid groups are
+          gpio11, gpio12; gpio13, gpio14; gpio15, gpio16; gpio17, gpio18.
+        items:
+          enum:
+            - gpio11, gpio12
+            - gpio13, gpio14
+            - gpio15, gpio16
+            - gpio17, gpio18
+
       function:
         items:
           - enum:
@@ -536,6 +580,7 @@ $defs:
               - dtest4
               - func3  # supported by LV/MV GPIO subtypes
               - func4  # supported by LV/MV GPIO subtypes
+              - level-shifter  # supported only by pmh0101
 
       bias-disable: true
       bias-pull-down: true
@@ -592,9 +637,24 @@ $defs:
           configured as digital input.
         enum: [1, 2, 3, 4]
 
-    required:
-      - pins
-      - function
+      qcom,1p2v-1p8v-ls-en:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable or disable the bidirectional 1.2V/1.8V level shifter
+          associated with the specified GPIO group. When set to 1, an RPMh
+          vote is sent to AOP to enable the level shifter. When set to 0,
+          the vote is withdrawn. Only valid when function is "level-shifter"
+          and groups is a level-shifter GPIO pair (e.g., "gpio11, gpio12"
+          on pmh0101).
+        enum: [0, 1]
+
+    oneOf:
+      - required:
+          - pins
+          - function
+      - required:
+          - groups
+          - function
 
     additionalProperties: false
 
diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
index e5df5ce45a0f..b0824d5eb056 100644
--- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
+++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
@@ -105,6 +105,7 @@
 #define PMIC_GPIO_FUNC_DTEST2		"dtest2"
 #define PMIC_GPIO_FUNC_DTEST3		"dtest3"
 #define PMIC_GPIO_FUNC_DTEST4		"dtest4"
+#define PMIC_GPIO_FUNC_LEVEL_SHIFTER	"level-shifter"
 
 #define PM8038_GPIO1_2_LPG_DRV		PMIC_GPIO_FUNC_FUNC1
 #define PM8038_GPIO3_5V_BOOST_EN	PMIC_GPIO_FUNC_FUNC1

-- 
2.43.0


