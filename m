Return-Path: <linux-arm-msm+bounces-102445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCx7A9lo12myNggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:52:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE73C7FC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF9ED30091DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A29382F0E;
	Thu,  9 Apr 2026 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4B5RlPK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvcGtD8I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FB327281D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724756; cv=none; b=nv6B+j2YNvMZ+ChOY9jdAshrgykK1fsFLVQU9hRghtLBWCimIpG4mir1csOwp0/sqbbUoelj5vjb+eKmC4suQ79zPt8SksApkXuKdSc9t38hzrZhRmtS8t/dmMXF48osbC7XzhlS41kOLkEdooyQeXREVHHbPtqkW3ovoNv8/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724756; c=relaxed/simple;
	bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNW2LAIhXTRPgHspEpQM4dLT2xqwBBDV3VI8sW4wEPsruWLZCjmR7QW0c8bA5Jlrb8TEbwWojeLj0uc3tWaCTu/2nCnuXh3dF5Oj8AwOJnHq30atHo8WjAqiMlRDbmkNpN95LOGlqqurSvSonDzH+hSjnAZyh01rKOsO8/FXllU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4B5RlPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvcGtD8I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394UpKN3712976
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=; b=B4B5RlPKTTgJriLq
	l1ChMPjnmx536My1oGDjauUCeHUHDiLpMZcHS4dSDxW5g96j/ScFsqvtkefCG4Kg
	Etvy3P4cO3/qRH7NETllHgnSEDk2oNt/KJj6N9byzHOkKx3R/+JsU7bayroPCtQu
	OTf8y2cIivHphYWuchNtYceFd/M/nSpYc+E0OKJciYcgOGUPkxPFr6D0BDLm09SD
	nMKyFkHpqIPH8miHChrwTYXv7tRrDYbvt0MBD+16w4VyCk40bDXDQgr8ssz/DdoQ
	U54mUqdi0w3gGI9wFhT/ypYBmWTTBS6Ez10ikgaq/D16+HcKuTuSHjSU+lNRjnmS
	H9xbMQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74b656-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:52:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so2151492eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724754; x=1776329554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=KvcGtD8IhbjbmxaAJ/L4XVtTGtrerQb7BCIUHDf9+slUGrWUlAB9oe+iWFW7A1UtVN
         CuTMTSorqlYIDTEJ9277Y1wboLpcWcfqdMgcHtOYn16JGH2zdeyICqOeYmAmkqPwuHoh
         JvhtR9gIUvncwFwUFwez67RDYOOzY3pXoAETNPd+BusKh+QdF8tjBNgzqQytWLhZQAgw
         B9CI1hA+Ov6KTKRKHkXiZP30fNE/ELsmtwUbglJX9veMrsd0S6/SjMUraKsu/DlgYc/8
         YAXHq7y2YH5IGbzbVPzg+S3CGdQqW7qGWapBBoo6+5l8YatigXdGwOJ/m/2Xnwg7tR6I
         sJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724754; x=1776329554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=jDlDEDNiy/HXzpq0nl7A8fPHTa2XYlZxgXANlrQsI0Eqz5cYyZcYdjUywdk/MGo/Lf
         CDNCmfkHPH9vyu/ED9EBRfdx+nnhGmLhXXWjrUmi1Ms3rEO8u8QE308Ejt4mjWWZdb5r
         jf+t5jFNoMDHgrYSBnu/L/eKHUQ3i5s4/CFEKJ6YPRgfi8tg0hXw+t8udD73nUAY5RDU
         erX3cXZAeRyi/7G0DWDs26wa/ogtUOMZrG9TP7t6Vb3lHG8ad1LZeKcMEEZVSaiGI+RQ
         2JmfVJuHC+Yxw7vy293qU8+jed2WMX0OLh9mfTN7no/uSfd93q8FSRN5RX+AQMsMCWhv
         0KYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+LBGT8euiP623v715JYrg5ZVG+x/UFAIoLGOXQaDzOXUoRfe4d9O3sGAlLceA1pD0VLb0T8v45czuz17J@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Td4MwcgBGnDQPPUriF15BCUQeNM0pX4T6rsX5i6Tmo4STkkG
	XlY+WIpTNowsao2Dgzrsyz9b1XtINiL8CKOG/1vKzC6AkXieHRe2V3a85nSAAWYypVuM9Bw0OYD
	48lBT4UY4x3QIVLzJ1oOOclQ1o7sOlxudDm6O6I4dSXwfKgzwuQ6aaiXvhmeWaGWM4OJp
X-Gm-Gg: AeBDietF6p8bdnfPO58piyJdTg7RiIyFkohjAmHAt7M2harLnbElc9Sio3LEpz8u9++
	DGWIwgMcoCxH1mAplLQJXsiKkQfddEg4xoPybV1yiavT8n+1nWAyZ8A8J46pimWGmscj50tbyxw
	HVHF7OwFTAouYvr9P8nzTDK/iWhfQDpoyV8O/riOyPyLDNzqR/4J8JgCuRHJDizR7oPSAu99DE4
	alb0JvcQTcq/Bd0kHE+hZml0PUzH8+V5JTXR3dBmou6t+RNocUfJWVjGGqdFIh4kNFi5N96l+nK
	Sy3GyfCURtIW/LektU5rzr9A1Ui3Vqb3VO1nLSDZEyZKwgtdhkUvt1yUCZ9Y0zTGVosffEjXpwi
	VO1DppPx0RDaCObNAO0MHa7umDeXydH2AxLT91GAQfq7KVuHMtQ8tqufy67Fc6TufaY4lzsAA
X-Received: by 2002:a05:7300:fd16:b0:2c4:d01f:6ef7 with SMTP id 5a478bee46e88-2cbfa4c41f2mr14169767eec.13.1775724753669;
        Thu, 09 Apr 2026 01:52:33 -0700 (PDT)
X-Received: by 2002:a05:7300:fd16:b0:2c4:d01f:6ef7 with SMTP id 5a478bee46e88-2cbfa4c41f2mr14169732eec.13.1775724752976;
        Thu, 09 Apr 2026 01:52:32 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d460c8e9a5sm2312889eec.17.2026.04.09.01.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:52:32 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 01:52:24 -0700
Subject: [PATCH v5 1/5] dt-bindings: remoteproc: qcom: cleanup
 qcom,adsp.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-knp-soccp-v5-1-805a492124da@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
In-Reply-To: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724750; l=2807;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
 b=Pb+jPWKDcC45WGJHg9WVboFQh65d7ITa284WAAQJcSvKRDijifM+KPUsCIaFSCxdiZlFTAH6p
 GxqElbILrjPCrYtiVfKgxpJwbIwFOXvyqgr+u07O8ip9UG7nn2N43P3
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d768d2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VspIq9AKIDY_7iLw7w4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: YIDGnxn8DpB0AG88CeOJ32BqL1XkLo4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NiBTYWx0ZWRfX4bwaUs0FE+0z
 24Vrv/NjeXCohhXPCo3ohHD/aQwoeEI2la/HNJbCg484Uwpm/VL2NWWZxrQQn7zFImj6s2AK+aY
 nJHA7CS1iA5HYoW3FW2AOgAFz2Qse/GaUDwA9YEu8kghfRd1aaZSxuq7xcyLJVxons9DncmziK8
 7V5Vx22mYHjYlgKBsuuHiMpON4CV4KIQ9MNuZ0csbyJaqIXfB9dj1xU8lbjeugLe6UaZiBt/njb
 EPyS6S/w30aJuwu4mYPx641LypGr/MD9ZVq5c6+Kf0acD1kViOoXCKaVYYZUulaYplIaco9Rm1v
 /vqxmTN//0OXOwqX69Vtc7h2e2RNE9BD/9XEiUDlfBzuNdACQ6ZrtXMkZJTqyLdZcB+7wcxfHFi
 zuvq0KyGR0mgvyyZ9IM0gBmuBlleFOJygeWiA+2am7vGW0vnuIgFR3nssM8nxapUsQyd8h69WKb
 XVdgF2nZTWHh2G2MQCQ==
X-Proofpoint-GUID: YIDGnxn8DpB0AG88CeOJ32BqL1XkLo4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102445-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 07EE73C7FC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Items in qcom,adsp.yaml has common clock and interrupt properties, move
these out of the allOf section to avoid list the compatible repeatly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 64 +++++-----------------
 1 file changed, 14 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 16a245fe2738..a270834605da 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -32,6 +32,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
   cx-supply: true
 
   px-supply:
@@ -49,6 +57,12 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    maxItems: 5
+
 required:
   - compatible
   - memory-region
@@ -57,56 +71,6 @@ unevaluatedProperties: false
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        clocks:
-          items:
-            - description: XO clock
-        clock-names:
-          items:
-            - const: xo
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        interrupts:
-          maxItems: 5
-        interrupt-names:
-          maxItems: 5
-
   - if:
       properties:
         compatible:

-- 
2.34.1


