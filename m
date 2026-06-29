Return-Path: <linux-arm-msm+bounces-115239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bTQSGgjNQmrICgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:52:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C481B6DE823
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:52:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WQVSOeVX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H29ro2eJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115239-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115239-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCB3E303F7F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 19:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FC5322B7B;
	Mon, 29 Jun 2026 19:52:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CFE325483
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:52:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762736; cv=none; b=mAkhXCHRLgUZ71k+i+UCC6DGltIvhd1u2PbRUkBTwRvWxDMY7X7m2ETyjOhdeyIRBkMLZa7UouJByN1wE+V6AtSg1kT9g/m3WCa+gAIhXbYAc5YEcvNalzOpvh1vxBkDgA3PWTHnRdREFP2bRNCWe7+PyUHgTdT6/Ll3fGCbIzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762736; c=relaxed/simple;
	bh=t2q3hueHHFjC6M3y4vZ/UbqDmOXn3O/w1GSgT7yLWXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmOrBrcbipArIN4jcCOMxDhvelUCCG7zGYU2mN3LyOH+b1wnfH3TSIAJni39suIQxuUQ6j7E7gmocYRTTSRoUFMw1fMZoZqaCKqrXMrzko5Cm/Z1WT3stZjDUtzNtvZ/rNw38crn3bHpnchqakHkpQQrpLAEVBvOcwNgVg0sHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQVSOeVX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H29ro2eJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGKNoc3388900
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nnEry42tBD4SnoUYWwOk7jguZ/PQRVHc2ptyoseYjes=; b=WQVSOeVXMgnFA42v
	B/p2m8zTA7rgwtzmAnRBdOh2j0uj1nVmtFX59WhKYE9UZxpnLJ06U0vCP8OAsONV
	LO4/gX9NrUC3ZaepexbEdILQ8XMBzC49QMaHPjIeREOI+xijpce+n9CnYNwX59JG
	Lu64B5WY9k2tLTj1JNhAUTeaZ0yD37IYar4PQyfZwD59a3q7i8m0wbMSzP2xbaFl
	PZvIQR9J7CGdzvGteTnuB8jNjkjaaZAIMbXtQuvIvnPgcLCoZPHZZubG9m0IRPCK
	N6LYOV8ui0OBxk1xpuc7BXhKclKZqRMDJtVpDhMqu6ULuY6nPiAiCl/rkPvYNF6s
	GDlvMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vkma3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:52:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e623b0e95so63869785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782762733; x=1783367533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnEry42tBD4SnoUYWwOk7jguZ/PQRVHc2ptyoseYjes=;
        b=H29ro2eJz+r0MPUydCJXRYzmhgIm9FN9XMrpcub7NvDcgrsOYrKlZj5eFctaj5Fu0E
         KGDjxojWJGsy806/dlRMeyOgx4cfJ1LUVzIKFaKMxME/6kxk3SUP0KjYFi2eIHz419cI
         e3Cl5/yPDCHRBtoSf62UIdd97RCYuXF4j2hD2vujG1MTX3RDQGsA1VXQS8GWJxTnp+6N
         2q9tWbZEi+4Qx2k6qzK6sON44uG8u0p5bp7x94u0jx88QcZk1NuDZzg2A9gab9xAAZec
         eQnAqjrYRIB1uRxqTX09x2So4EqX1nQDFPMRX4dzXY1QSvRPMXG0HK8J4P6RSVJhGkxv
         eF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762733; x=1783367533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nnEry42tBD4SnoUYWwOk7jguZ/PQRVHc2ptyoseYjes=;
        b=VvHUg/7L/k+jk3H4tBXnl22ZmmYqDpVYdvJEUkGSwApmb2FMMWWy57FbAyu6hvKKXq
         uJxyoNnd5pRFpxXTpmwljFFeckShUB1ShC3NxEyEtAnAsG4Zj8fOdHikwCRJGRzBIeDi
         aP001TbQSPEyDBKdqoLkVtmQzphEyJp1z+mcMOQQ9SZCnL7xdb8GSoPuTuXwF+W4FhFV
         V6PjBZZFxqS4Lg1jz0R0fteTMrGm3glLeCwTP/1WTEe4NYnDjzrcuky2ViMxhD20GtuZ
         8ozK3Z+EQ/psFzD2HqRYLh+FErBa4x22dK1+rzbHOGMvna3Hka98Ds7P5n9DIobxojhS
         es4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9znB7iHxj1oTqH/hsHoz1kUiMUqaQyfCADw+OvztqfWBbmnoK5LRB2+FgfB5c8nk8Xvyxdzd49mqG4LmjL@vger.kernel.org
X-Gm-Message-State: AOJu0YwW8Lv0m6JpWhIbBIOdeOMiGAW+WNQdj5qi+r90A7/0f+15pFD2
	Eq3alShVu9v2vDcYjyuV0nlzqFFBytSxNIUfRbtM0Ish0X05kECX4Egys8whRLZNWP9d3EpWDJg
	937nAQr0A0lfXQF6wNHUO2T9nO1hfvReVMGYhgxYBuOmtuW8UKL7kbaLxft/r3/ozEoJw
X-Gm-Gg: AfdE7ckD8WWWbmLSYifC+1X9wijf3MMcU9PNKaFWPMz+Df+mCA/mYvenJdKnnCIO6FE
	1OxTAoKyfaEzT4UIqSEOmrvS7BCy3iovxfYa9BUSCgIE8UILv3dBGNxNqeRm+LYrZnHRpTv5l+2
	q7VlRFFP7zfXjZhhgSV2/n3DOji08qq8HAG/mO51vseBdLUROGuB2esXOkAbqcSAJOmJ85EcWpX
	1afwRC4tazv1LKOAVM5g0GZGMsOTak6/WfPdhHGPOGDLHzpRsACDu5kQ1Hdx+5Wikp5eWRUqGCG
	6Lqu0nwJUN2ZE6YX4/rvctVVu2WvO+xiLDD5QpLHxFM190S0I6lmI/jYuirFfa2oDUuBGqAjPUK
	3J+7JUHEddg7jqyy7e37Cdax81GZIR4ZpF7gLEQTnRCBR2msv3X0jbwtYb0n6fFXtlgi0LqHa95
	3dFnviJ8K+67nhkL8gckeeRUHe4eVzel0NJvFlWMURg8MhLPkFrtosmP/EKlbwbsqFr5wrw8E2V
	9X/Iw3bRTkRTs970BFW
X-Received: by 2002:a05:620a:1d01:b0:92b:6805:eae5 with SMTP id af79cd13be357-92e62818b40mr152194485a.66.1782762733136;
        Mon, 29 Jun 2026 12:52:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1d01:b0:92b:6805:eae5 with SMTP id af79cd13be357-92e62818b40mr152187985a.66.1782762732482;
        Mon, 29 Jun 2026 12:52:12 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d99565sm6360005e9.0.2026.06.29.12.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:52:11 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:52:07 +0200
Subject: [PATCH 1/3] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-monza-leds-v1-1-0cf7c0a7dc14@oss.qualcomm.com>
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
In-Reply-To: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
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
X-Proofpoint-GUID: DWaK5aC6wd8VRYmRx-Aqr64mVTze29nd
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a42ccee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX1gqPAUJa4J9C
 l00ykuO3D3trIShW0U+v86sPGu1dxW1Ay/Hh3B5g7IXPe6LgKpTDflVFD319yVKJ1uHhxZam4RM
 hB1N9bX3/K/rkZecOcSWNdaO18o92ao=
X-Proofpoint-ORIG-GUID: DWaK5aC6wd8VRYmRx-Aqr64mVTze29nd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfXxAYJP7j6txsE
 dDjUwauEUHLsWY/WfVgdBF+sHSLtyUaKnwBCzX2ldbNRiX8Bqc8at6rFWLSCPbUIbbUvNqlS8uz
 lgnJzmhICreT+UumcB7MtmGqKcgUaSFMQg5iLxAiMpbkBloW8jOGlPHq6JaFxbexqf6BEl5mg3j
 OjdNyBBuRCyQ3wso5OVyJdLnh3zkNllU+P+M4HBLI1XUrUIrQdGHG9+TJ7H6Mo3u8e8gz3EOI4B
 5LWzneB24IwWlraor2uiBJrdO93kmjkoFlWQtXVaS0zgeqXzQ0gf80hHIXyKDPq3JVs2fRG62/G
 Vifr9CNTK5kUD1UE8IBQcygP/bemCFjlbzIuJ7ti1xDqYxrF+UvpyOdAqcJuXVbrhjUZNyJek0b
 5mENIeA6CeJd5MGMzaof5UwhcvBPJDqeHEUB1KiaBkN5U2Abl17Qi9mnzhzFMnXuAemoXgLXXxT
 TTrB84bt/nka1GQ7Oeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290166
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115239-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: C481B6DE823

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 83 +++++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..09ec140c5092950c54e1d4a55f52e11e8dd7b0f0 100644
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
@@ -84,13 +117,13 @@ allOf:
               - nxp,pca9633
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 3
     else:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 7
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


