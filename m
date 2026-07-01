Return-Path: <linux-arm-msm+bounces-115762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id djo1EitGRWqH9woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:54:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0A76F0051
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:54:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ov5mht/d";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X7epOAWz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115762-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115762-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 507223029A45
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76ECA372069;
	Wed,  1 Jul 2026 16:31:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086C3371D0A
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:31:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923486; cv=none; b=f9IFlXBFHAq4Cs8BZZzcSTLsEyEJRBzSmDd+5RCLRqzrbaecEAeTycLvzYOnti/mehnnvISd3u+gIhfmfsA5FPPtu56rXe4XA3sexDQ+pg6TNRZKBfUzZaR8abtMQE8vgP6Wzn0Qo0qBTLWpy4caAUmPr8ovcX1UPIV9iKGVyd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923486; c=relaxed/simple;
	bh=Cmf2tas+7KmcpT6LiXuKW8bG6nRTbz++pqJrdVNObQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qqp4TZpdfyvNjzr7gmVFQ9svvFLNxCOLivI1j0ysaJmqkeowuhr57Ng1y2FGQURr5jk1u78a3JMKq59pe5puPZhDUDTdTjwlkpggFk1Mrh//16GVYiqyX/uz98wDEZzBduiNdYUfb+TlQr2ymU0/cQiLVBD9sq2GuPLHQhTb4Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ov5mht/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X7epOAWz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Fo9Nc1512948
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/PufBh9rPr8
	oagbh2Gp+KNcLg15esEAYaPIkHJlU/fQ=; b=ov5mht/d6V4S5a+0dpaXKs5Fvlr
	nfs8ajnWiO0ILO7Pre4hvcDPKTZ3QhUqch4w3Tf3exwgGgoK1YoDx2lnE/4MZO9n
	b8aykqPkDYQb7LHcSlRkVNYE2jhhj/Z1n9gevloO33tlNkcFlqk8l8SRkkBzSduy
	XQrp/feT0M7fotKGVX5c77YX41MZmskI4+uqYQ6B9WyR/gr6ddkxe3tnrH129Pho
	XAJXIdQSoux3yZy0MtN+oxz3A0elUrH5KrN43CIoY7ZEKt1pd2alyfPN/30FN3x5
	Gn/b0A4khFUgO+uBCgaRa1gzESUT0GDS3/JIV7FRrqTs4pk6qAXbZNAtGXQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwd44q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:31:23 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bdda66a906so690964e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782923483; x=1783528283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PufBh9rPr8oagbh2Gp+KNcLg15esEAYaPIkHJlU/fQ=;
        b=X7epOAWzsUi0oG8o72+1NNRz/+bv7AigRFKxucVHU0bx1eAGq87aMfqhYc7SOnl5ig
         woX4lggxVSlKkso3BIiznKhhXmY6a/CujHhnZT2KjRxf6dQ+V6UoMeKwEXRbxEhV7tou
         TyKeh1D4mrvj8LYDWDpG8zUGetP2jqzTO2ZB5hThEs8xzecWbbX4tzonKJ0MJckpv6Kr
         xPSVn/0Q33H9K5NySD2bBe0ZLTXvX+/FlI5mL/yxISX84pZIue5017nJNlXFzcuEXFoj
         r8HFmHX7lb8JgOrEp2fFYnujJP6uonzeG3CP49TXNQHAlmM7esZRfoGzbQXgyVzt45KX
         0kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782923483; x=1783528283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PufBh9rPr8oagbh2Gp+KNcLg15esEAYaPIkHJlU/fQ=;
        b=oreMqWdGQL9visS7YHT8CQ7h0bPt8z/FlE89SHVlP8dgUW4YXoY6ndOrITXkETZAUR
         Joy0E2egbqXUxcabwsjQL8/J7mR1bXE+jwIL8aQhBHL+SJ6YItx76ozi29/AYaiFfyFr
         FYoROdnskJyF/erlQ5gx0ChEx65APA9+kiQ6/rL9iQqN+gYEjoxIB1wjjx0Uf3NT014H
         rE8zRbizENFcXUdyc4Vb+GQVYtg/EJEVoGGlnqAoMpSHTysZOFQ+IPMK8ikFq6DUDImz
         zqAIjikrdgkfj+NfgyXpEOnXl+llmWNR0oA8331ABWnvzc/DuMeopVhZdwmysDDqPG/A
         nR0g==
X-Forwarded-Encrypted: i=1; AHgh+RqWdABahxQ1dWlXgXriJnR6HyzM/ffWjVh7+ONX/C7SscPKrAdAEf6NLl/AgTcaa2ytr59JkCFcywdwHtMj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Od/6jE/EH/BexalHikG1HL60SCesiuVMFhmgvUWMGvMjQTUR
	XhkNZIZ3rQq+05UJe9VHviC4+3oiONizSPB9+HcSvvD6pWrfYWXQ2LkhZD9Rj4YESYi1gM97Tkd
	lqxLrmITg70A/v6CAjoHEhOe+LL7/BtGRwGYdhCS0IAS5qHmVZIt0HY3xCqJAFDUs4fyw
X-Gm-Gg: AfdE7cldlm39QWtox8G3IiMPUKKjjTUoHWf36tUAFTzhA9GfRAAS8PLpiN4fPNdqLm8
	gBoViO7tuBQutJP+5qiGLmsdNbNzB5JHJ3wOScZowceBIrv30u0jDBupv9spBE0NgjDWt7/NWeV
	X8vVWcYGzQgns7PpnArHORE57sOZqF4c6bGS3O5vSpE6O6inMZqcyuaAC5U1825ArBeEjcKfUld
	ust9A7D0guVkwmAA454Qy3hjSf+9PhepIVYckKQWWPG5/7R6ujBbzv8rOSyi0kPvVecrG/R603C
	IdJ4Wv1zsSb9dkEU5qClj99IXgrQaBxfv3OIPoaS1RlxK7UU+4i1f729CiSKgxY5P4SgzA78CQ0
	pLIPP0DHwxvcE8dOTkQw9vxrJ
X-Received: by 2002:a05:6122:e202:b0:5bd:9ce8:304a with SMTP id 71dfb90a1353d-5bde3b71d5bmr805893e0c.13.1782923483392;
        Wed, 01 Jul 2026 09:31:23 -0700 (PDT)
X-Received: by 2002:a05:6122:e202:b0:5bd:9ce8:304a with SMTP id 71dfb90a1353d-5bde3b71d5bmr805852e0c.13.1782923482952;
        Wed, 01 Jul 2026 09:31:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b73sm1077874f8f.15.2026.07.01.09.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:31:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org,
        sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/3] dt-bindings: soundwire: qcom: Increase max data ports to 17
Date: Wed,  1 Jul 2026 17:31:13 +0100
Message-ID: <20260701163115.3701298-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -7AvqDyd0-fhfSPwtw_j37vI0VJaBYVN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX2A5jZkZWVYOI
 Pk52XgY5lk9u7d4GfPGxP+XsIh3dhJeML5n7zlbkLrLmJ7I35PCoE959VH3sF5zcAAxgGEB1XTV
 OM7jFgCHcqwYklYvI/Hso6Fd+aaSPe0=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a4540dc cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BZ2PEOZbcBSxFJMT2ysA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: -7AvqDyd0-fhfSPwtw_j37vI0VJaBYVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX983g3aYiFDjQ
 y5lzG5Wz3xETGsWRagVe45XZq3ouvQcTkmpK1FnwHUnpJnV+PUiYzDz13pGtaq9KcPx835ch4JG
 YffcQs8JqvxUzI6YaACibVHbBX9V4HufX7IeKaTaJa1G+35q1kSqDDtDAhwm+Y3JVT09FzAHDhG
 kHzkiEUjzVGSqgnF/44qMddR5HbxU0Cc9eEfAQZ9suNeQ8QOfmcgu5gN+CJrgo8eDExorfCxpED
 b9H/rUQNQbTqfZp+uTwf+/qPofIlXhNWxaZ5wBEz2JDwfHRlM0XSCGTiXHhlvL8IQuxepCdrmMu
 nam6Mv0SXMwT96g4dCU04ZymiIFtnYCUhkQuEnaapUJQzcqK6MsLAU9icnIopkNjfm5lJmty1n3
 IsmbQRHJQE1JDxE8IBiltVo55i5xoVx6vjuuQSHM0UmMUmmAY6BSd3UQWx2gBub6kDmfUnGTZmh
 ZuCO/uIMtbu7y31woUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-115762-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:vkoul@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:prasad.kumpatla@oss.qualcomm.com,m:quic_srivasam@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B0A76F0051

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Bump the maxItems from 16 to 17 for all qcom,ports-* properties to
accommodate SoundWire controllers v3.1.0 with 17 data ports.

WSA instances on Glymur has 6 DIN and 11 DOUT ports.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 9447a2f371b5..8e6973fa229c 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -90,7 +90,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-sinterval-low:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -101,7 +101,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-sinterval:
     $ref: /schemas/types.yaml#/definitions/uint16-array
@@ -112,7 +112,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-offset1:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -123,7 +123,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-offset2:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -134,7 +134,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-lane-control:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -145,7 +145,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-block-pack-mode:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -158,7 +158,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -175,7 +175,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -192,7 +192,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -208,7 +208,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
-- 
2.53.0


