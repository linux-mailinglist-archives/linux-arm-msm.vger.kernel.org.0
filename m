Return-Path: <linux-arm-msm+bounces-117653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s2dKB7xeTmq2LQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:29:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1243F727591
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:29:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=owrAu1gj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U4WBLyyp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117653-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117653-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F281303501D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A57647B436;
	Wed,  8 Jul 2026 14:19:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33FB44CAE0
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:19:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520350; cv=none; b=m1aJh509CZWH+CsW4zcjMVj0FVvw07luKhY7B2tGvg2FVpifrTmgdfgl42SXwohhkll8ot8cJmY8gqShqQCOoY9YceDNAug6PZaBrIdnVGXHdw+ixCBseReuT/SQyXidPOk1ryXsHXIZKTiiISXXWEzQyeyIY7R4314GXMed1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520350; c=relaxed/simple;
	bh=A9oiqMvMvHneoJV2ZBiozRHMKsNh7mwKSxwv4q8Mt54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUQwer/QzaADIyRtzB/82i5M6TW4+nB2mV+Wu/LqxLS1kpXigaf2pu72pniXHMx8OSKLsHOSzGB11r+e7ZEhrWzxl6ti4DYowKzH4VMV0j/s4wkhSx3YOogc2YFpsmtI5/nbxBf3/tmBhrC+bh2fc4264IlOLk2Hqsw/oXh0qKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owrAu1gj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4WBLyyp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Dqq2751270
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 14:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Id2VXhGZdTLxLIP+KHMKsc8u39pNhhgBQwA5jSrqzjo=; b=owrAu1gjdGnPQkgP
	D732Wx4rmkUUSHa6KVUcYJORwChWv/exGbo+IQ5fTn26XAbHBQeIYfIwvEKZt6zk
	s42eRNSmdzLSGB+vlaOI2IEjjVdiJUBdwNq6rsk21E0sRMD1MdSyI63/mKYoeLGC
	VEnFLj6Qt99KJGCaIt4oR5ktGbPFNOWfWQC5FQMVbRxF1zRQNR/LKYEwBDB0yVZi
	bd3zRMyfQ3vShDeg0AMmQRw6vgtpEiODQ7r6QTHD0mX0JHJynurQkhUbWO1RDjDi
	5kyHL2CvE9mMd8Speuwy+hfGSVJQv5OzOjVJP+y6C9x9FS4eB4RYk9wLXAHqOcqn
	J8xXQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hj2cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 14:19:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso8026951cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520347; x=1784125147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Id2VXhGZdTLxLIP+KHMKsc8u39pNhhgBQwA5jSrqzjo=;
        b=U4WBLyypzJSx4DNEYQFmH7KNJlv8Il5VDp+eEE1SZb5fsYd6o1ZZVXOvMYO6XYSk+d
         AXBzSVrWFet4EPl8W1UqG60O7+deWuDgGlMa0Z6pqH+H70VgFMwHxgAtShN6aS62JQK9
         MGv2b3l2iYiDfjzfYPHj7gPwML3E01TMQA4XwcT37ZnQ6LKYtmYpmtNPYXk0HYryDHyo
         jEiUJrnerN8HB+fVUWdfjGA2BLUE9ZoqEmo097eraWwAg+E9tCX8/fldEAMiS2FGg0Hi
         hKw0+RbDiC0ebxQmWaKGr0q9O8x/mVqUWmPvmadvsJDfNpwodh7c0SvtR0AICSjfqUSY
         vHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520347; x=1784125147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Id2VXhGZdTLxLIP+KHMKsc8u39pNhhgBQwA5jSrqzjo=;
        b=TuTd4orhrtE8QWUVn2XKnEgqVyFf1ys0CJzN71ePJg/RfYAY0YqP/unEPjwiaiNIBw
         CT94gtwgsmHaBakKI0Q2pBlgu7JKyTpjpMTWlTF7+54hu3BbOkRHs8BCvoBSJ8+dunIS
         fJRP0AKwibm+8WIs1gf2JQVNLjJjCjnd1MvUyOn/xg2sVfF53mnrwrK4+6u6c2muagVo
         RDPfUOJatxI+gTiCvQJ2Ite88R7RX7l45dK6shZmm8S8oiloPg9KTVB4Jh6ELhpXKdAL
         oS8wqxV4PpNp66d35xaIEh0jC+bZCztDJOO50D5pKxXP8L8dcm/W3Ceb7mxolanOOtia
         njVA==
X-Forwarded-Encrypted: i=1; AHgh+Rqt11ISY8+6+7mK9YEkCJ4B9z9N9ziJikHasCK7WLdWzcp/CTabg1AXcJvp8iWCpvvNvQ9fEkHujj5+uHSO@vger.kernel.org
X-Gm-Message-State: AOJu0YxzhZ/ERI2dFe/U7u3AlEaiPtJI3ktoQEFYWC6iNcUVTBCPrLCc
	CVArpn4QQZeLvyA9qwobsoQNLsa7upAmUKwkTkEkOr3HLckvbbWEXJ6htc3um89p+RbRtgW3h6N
	Rty9CWB/qk6g09+W0KbtaALgjR6OSbc8Jz6nPAhgmqQYxNDNd9ZWezGqTrpM9eQzaqSkNXvG624
	1QX8A=
X-Gm-Gg: AfdE7ckMJEu1BBmR7JsACXV4fIXvXDlMhjjOCH/yAlpCKGuRYbvLtmpN47rBf96Qp34
	YzoPeyoc8A+p/e6IDz9H6KINLs6T62I8QTjP2L2NfPSaIYqFL1K6oPgOfst+lLUnqeQQYkKHkLI
	9RrfIuepevbJkEt0ksDKpHctxyDc5xNfQ1SOAQrcyVVXTGLyjeZmGpoLJKuHLSWwMBRjr8zsDYi
	Z3eSc7AeYJQeqPshH80UKjoZnJksdjCXFUlTcmXpLA9K/fmZJT/y6L4TElGI5fHHcc623TfTYrT
	l5U1N7dSDexsAyseUXNR3ylv14OSyTExaUi5u5aWX2J1U7JyyVvvpG8mvrijVMnV5MxghvVOBss
	DSJjGDpEqdKi9bR6LPcptvvATPrUMg+hq5c0/ruvpxnrO+uKSRfOl1gqa5eFue2MxBH7RE9Gohq
	wl2Ipuc0eyc7n1NOxFCVgJCdGeR7+Y/1KvJ8hz2+GlBA2j8wpqw3ptgUyRH5VsjW72nyA5kAPre
	lYJYZsE3S6mfyrn4vFx
X-Received: by 2002:a05:622a:303:b0:51c:7b12:6007 with SMTP id d75a77b69052e-51c8b57f94dmr27120521cf.83.1783520346895;
        Wed, 08 Jul 2026 07:19:06 -0700 (PDT)
X-Received: by 2002:a05:622a:303:b0:51c:7b12:6007 with SMTP id d75a77b69052e-51c8b57f94dmr27119771cf.83.1783520346380;
        Wed, 08 Jul 2026 07:19:06 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:19:01 +0200
Subject: [PATCH v4 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-monza-leds-v4-2-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
In-Reply-To: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX50wC2f6Q6KTZ
 630/5SKvFyMUhVicOu9eV6lDW1Rs+tSOaYHxV39EhUhtivQUzbPb9qPTqUREirG1LoduRMfbWZj
 w24cjc2KbDe2mcd3CvREhUpihyIEv8yhbgcMU1TFPGF87M1khOKVJXKKyQSlB/Xuq71+qbzoW1c
 Y//I3wU/z5IvU0DFi6NMqHC5z38CQ6hkjO9jltroW+o9vE/zgCU04mI4VVFMs4lXH0bklbjiFir
 CKQr8ptZMj3e95qo6RU0L9jUtBzY3yUmdV26VGguGft/yXFJwAVkuZ0jvjF/MwAGJoJPaHbHUZF
 arvqP1+FiEMfQBLKzZzD1x1UUQq4LPYnF6cUKwlBvFBE6q+3xZxlhGn8QjxOG+ciLpCl1I5z0pR
 PhGpPrxFsZMI+L84G/dSS9dQSfiXCghbuKj7s+5UCv0xuDonQXANd5H230y6n4KNvcYRT9pPwNl
 sXdOzIiSuo0YAJZXNSQ==
X-Proofpoint-GUID: fPUp3bP12DNZTH0SlX375o6n0cs8WVbz
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e5c5c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX9WS/X8l/Jf52
 6p6aHiYFkvKyZKASy07PpQT8VjDTIRVl1Kqr+uHaLM7FI6BVk6I6HjWGLO+JKyutUynrM3KZDtJ
 MmYV58MTw0rz92xvN2FTVuEE/xfiViE=
X-Proofpoint-ORIG-GUID: fPUp3bP12DNZTH0SlX375o6n0cs8WVbz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117653-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1243F727591

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 96 +++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 4fda602912f7a9443b8a77e46bc015e244f82e08..eccf37de51285a0dc6d28ffaba2d47a9f93d867f 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,40 @@ patternProperties:
     required:
       - reg
 
+  "^multi-led@[0-9a-f]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maximum: 15
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maximum: 15
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
 allOf:
   - if:
       properties:
@@ -84,10 +118,16 @@ allOf:
               - nxp,pca9633
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 3
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 3
   - if:
       properties:
         compatible:
@@ -96,10 +136,16 @@ allOf:
               - nxp,pca9634
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 7
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 7
 
 additionalProperties: false
 
@@ -143,4 +189,50 @@ examples:
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


