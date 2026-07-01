Return-Path: <linux-arm-msm+bounces-115757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2cH3Bbc+RWog9QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:22:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C916EFB66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:22:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DoMrJ3IL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W1a4J6pE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115757-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115757-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A88CB3055812
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F22365A14;
	Wed,  1 Jul 2026 16:15:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304603612F5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:15:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922559; cv=none; b=JymchviwMIWF35vUIdar3RGZNf2dAcpXCdolKsUhXdrG6ahR76uHpgXYguspvOI/3wuL9dLjNy7dKcPjY3uVbFhzmRW8NgRMFl2Ri43fYWc92puY26lhYhVluQe7/mmhHEiJp1Uu5bLtoIBuamshPu8qD7mH5HwYIGaaXaYXGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922559; c=relaxed/simple;
	bh=pFSbTRCJzU6q36Dh8FaRMCEnLAZ/U8kQDE+7od1r148=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lo7T/FveLXG+/e0Pm8k0bELwVnMAVFlB3Or156Uv44/IuX6imFl1W1KFRG+4GFfOpzDPb8KOj1PAn6zWimyWvk2enT5dIr0RkT2do3G78CWawDesqht1vl/Wlalj+9Fy44BGMSDZHhmGpfm70/Q6ELrGD4/yGYMgwgWHsuDlmaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoMrJ3IL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1a4J6pE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Fo9J41457669
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/+4MD3mpODzSWY/mOJb34WlGF9b+ZYiU+CvAZt4d58=; b=DoMrJ3ILkQpfurPb
	68aSgMsXwWYr6UrjiFHU8PhniBKLnq2Q/sOaTHcQ6Ad9mDguSAcetcP4vN03SWbT
	JnTP3u89Vw9mm0nhtI0iE+ggNLpxU0ho5G9802bEEsFUnD12oXelVaeq3+a7WNxs
	34gH6FdhJUNpJYs249HO60fchMWUUTHy/8bPABpSDR4Dr3J99SRLRL9G6Y+VgJCk
	cUkxNLOpz9+IYgko9HqcE692xrISEyUSlPbiqDkZwtnsqkpTvqRYjIgpS+ldR1+1
	+//4Th3OuW2P9AkF0ui/MiaTrc0x4aEF3Aaiu1Bpz3Alfk0hhVA53Gl31EBQrNSu
	xF9wLw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502ustn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:15:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737435677d8so972666137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782922556; x=1783527356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/+4MD3mpODzSWY/mOJb34WlGF9b+ZYiU+CvAZt4d58=;
        b=W1a4J6pEYuLqT60wjLJLBBXHlQySK6mXVzRMtRiKkuPGUC9hsjI5zBQOiASjeSWO+B
         DsSPaKr/ccsiGqJs9Uo4+FcxxYorz4wx0RSSTLgfXK1Q3IkqyRWUuPk/kFEyKaRlOuQf
         9Kz5TzETzY9LCOKN8JmnsSMiNEHiCDhS+19MqBgM3wY6js43YGme1B6ea6g8mTfQDNL3
         A7/E3dAPT8FnpsR7xH33xfnELNaHsFMZHjGI0gBE5klX6HqJqnn5MR7NJ9U0J+b1x+GS
         O6o/GIpg0SVGTHD4G+ZGONZKY0689n84Zk5PWOy6Rq4QE1HR6Q4mn5DGd6YksP9ze05y
         y6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922556; x=1783527356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B/+4MD3mpODzSWY/mOJb34WlGF9b+ZYiU+CvAZt4d58=;
        b=ERAsmgY0q6bB4ZRgpq6fsFh3waLY4ERASKDevc89/qntNUVTmkLwszEJT4OXwuDxTT
         0X3tFd8wc/dmHYyrQ4RjZNDw/CD5JhOuZjgbNBcDJPVz0th8njaQa2nvb0ku61WcnJAg
         DRHdJigTZMNbcRBo4kfh1cbPH3Q3xBrdO/wbQBAltTo7Sempt9CJCK7t7/N+NGRi/zi7
         +LgmTrmuqexEPs3wXwI0eP88slRZLtYmjsaI6TyLy/+FwmIrv3gz1NSrhhXgkvXp6mtg
         DWGhLOpeYEA0T1oGDw/vJ5tF5KTlRyfzUmXTrBU+Y0ImO6oMaImi9isGlp7wwsQnEXEW
         TABQ==
X-Forwarded-Encrypted: i=1; AHgh+RpY2S2CghQ77SvjQDnPALQhzRvCkKPLY072cm2wGGh4dnTsxl4e+sRfws7X8bFSxPdwqCo6+8wgAY2mBs8H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9eug2ORgeUOGIs+zV0kAn1p2iyZuPqglhMZV70hbKC1oEOBF9
	ZPRQ29JIsCzxVmerVMxAtnmBswP7QhyKBEjWxJlQeqOxhqQu7IwKptDOOns4TlA4Lx57KMr8Dk7
	m6/2csyloiVJZNN83eRFENXRISxWadyhIxKQYilm4jfC6PRPryjKhthWMtUmmU81/BPk4
X-Gm-Gg: AfdE7clyRN6r3TgIdfDN2AtFDOPPNiGSbnfUCsrBjHvav0b5myjExBJI6oTLp5SQUTz
	OMfYHdOvNmwxysqp0kM8H7Ep4NMcRSJ1eSd+24Vq32LsF2mW6w/pSzkJZV3ET+3eBZmzB4fiv8f
	/zfgGoqOsliy1Wp6pKdNqybOG3q32GrdTV3cI96FJFmel3ugXD68S/D48dv7nHDQJ5V+blq+bRn
	eg5Man8yaWjQJwQjHDFpQ1EnSglTEI0abINiATHdHUfhChEV3DmB/l/ckZOmxjGxcujHxPjAIZO
	5Gsbsm9Hq4NNeI1w1koBboLKt4XmDnZjp27dOkC2n8PCb5pTUKGLa43/JANOEk+E5/S9JTrJNXv
	hNEokkI7/c5BbJe5WOGGnTyDrSuO5wTPQE2Wbpknbp+kyjqanvzOa9cw+D1IdENKss450gj9YjD
	E7I5aUW4897hY0wcXWMhF6QgVcBB6Z6lPmJqdZ4ZTxTqjjUebw0bgOIdFYt4oF71Q=
X-Received: by 2002:a05:6102:2c0d:b0:737:5c42:858b with SMTP id ada2fe7eead31-73dbe25087cmr915933137.11.1782922556244;
        Wed, 01 Jul 2026 09:15:56 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0d:b0:737:5c42:858b with SMTP id ada2fe7eead31-73dbe25087cmr915878137.11.1782922555676;
        Wed, 01 Jul 2026 09:15:55 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ea70sm299570266b.3.2026.07.01.09.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:15:54 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:15:51 +0200
Subject: [PATCH v2 1/3] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-monza-leds-v2-1-c1be0b472926@oss.qualcomm.com>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
In-Reply-To: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX1cK4GrLCazTc
 KPUql8amoIzJY1kpn0+6tmnUhfQy4Q0M6P8NcTS7o+D8Vbc2muRhUWoNjngipJJ9UPqqwC3GSbX
 0ldcfZsFfidflrXsiinusDA+p66qVew=
X-Proofpoint-GUID: WqqnXY6ZI1yRwqLP5eQ6XclUxq2H5fKu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX834/5M8Hl0js
 fSLg+GebFDkpmunBUrBZbxEN1TKRyhHra1rJjczoJF8UTYPrsNoPyOsj7qvsve7hW/LGL0V55kx
 V1Eq4TN1V9C32uqeREKJMgjN70TENKQlc7CPbzP7qPHEtmgMYbQ7WcG0VfLjwy9V5VKuzq6zBCs
 QldlKUa+bPrycwufH2kkVK5iKPCY8sd4ro7QK1tL66eqCLNQfqyzFo4CauPDIkH3m9AS8fQXnDS
 jBOJPVH6icAh/6A7n72frC5kykrmG34U/+Np1MjZ6ZujZnzIBoBjR4R+bIvkOyNDe2AHyWUSbYO
 jiC283RsvKagqu3+CbKF4VOj602gODlt4nlU4BWZVnQXAWmU1IuPb/ilffRtUtmAeCUVgkRnbbI
 V9IHyY9bwBC39g2e8wVskFaUVW2jZE7aTFHBT7/D7Jy3M443b27y4wkzcY2u5/lxN57yBkRvDzA
 kB8UUGqZnyFXeEKrQRA==
X-Proofpoint-ORIG-GUID: WqqnXY6ZI1yRwqLP5eQ6XclUxq2H5fKu
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a453d3d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=bawOQVNTVwYUprhOnAsA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115757-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81C916EFB66

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..04b05b8195c18ae9fc1c1cb9d3c694d819ea88e5 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,39 @@ patternProperties:
     required:
       - reg
 
+  "^multi-led@[0-9a-f]+$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]+$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            minimum: 0
+
+        required:
+          - reg
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
 allOf:
   - if:
       properties:
@@ -137,4 +170,50 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@62 {
+            compatible = "nxp,pca9633";
+            reg = <0x62>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* Three channels controlling one RGB LED */
+            multi-led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_RGB>;
+                    function = LED_FUNCTION_STATUS;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    led@0 {
+                            reg = <0>;
+                            color = <LED_COLOR_ID_RED>;
+                    };
+
+                    led@1 {
+                            reg = <1>;
+                            color = <LED_COLOR_ID_GREEN>;
+                    };
+
+                    led@2 {
+                            reg = <2>;
+                            color = <LED_COLOR_ID_BLUE>;
+                    };
+            };
+
+            /* Remaining channel used as a plain white LED */
+            led@3 {
+                    reg = <3>;
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_STATUS;
+            };
+        };
+    };
+
 ...

-- 
2.34.1


