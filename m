Return-Path: <linux-arm-msm+bounces-117390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id STeQGLRNTWrAxwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:04:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F158A71ED55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:04:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y4NXFs+Q;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117390-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117390-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CDDE30AB71C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 19:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AACA3A380A;
	Tue,  7 Jul 2026 19:01:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E4F360ED0;
	Tue,  7 Jul 2026 19:01:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450888; cv=none; b=T5ivZiBSxj9EAB/jZ31I6tAayqpwP00/9FXLAKD2ypIwZqIKbJ7wnfAPOm92DzryKzqam8rQCkQVTb2QtTCjHGJMtBALsMZXVcz5UNfnR1YWpOLHaQkS21STLGtS9hmspdxOPDquirB6lV1pUhs2T2FuaBfMeESHpwWY7xSoynU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450888; c=relaxed/simple;
	bh=wDoj0KCk8V3oqZAPdXnJXeUmLCLjKsD0FLHrS+2Pu+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TQ3Bq0wEsqsc2lJgOayySbDlxN12fRRlJ8cBtPSRVFQSUThqb6+VM+sQDgg4380bId6o9HrxMWEl/+C+GZHnrxMLAYYYJXNA3b0Ya+kkSarVMK4rJysPvN0WnMtdWuMlH0VJeC8ByPcYnpmlsjGmbhDEjv3avirDtFjSK8Js8F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4NXFs+Q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FSwbl045395;
	Tue, 7 Jul 2026 19:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E7dapoFWj0J
	2irDCujrCQwnpKlmzwBdSkzXDgFBfen4=; b=Y4NXFs+Q3Rorer//okDaqydqsol
	D19igkoZ2PZ36cX2EsQgm0GdTwrG+0aJGoK1Tgxcb7BB+w9B7H9LBiymTq1XZgpa
	tKP6pvBNpy/yyvqWLnFj+jNVZ5z531OGZjDW4nvOFNe9dCoAiSIGlA+tpYsAy+R1
	/HhNam/2ZHb6I3akIx9qnb8jJOgtcrdg9JDfl5lPT1pQ1PpOaxUInduF5DLQ8wFn
	Sdrv8m++sqXLT8IuKF5fdq0Py2WdD/BwYngAF/sZs6mfsesAXIby3WgJ/eKJ0VyU
	ZwGXHF4T4YFppu1In2G0qugQKZviE+VmwnFydWfx31pjBJIvN7lsUPQBNrQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11txva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 667J1ArA019108;
	Tue, 7 Jul 2026 19:01:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8k6b4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:11 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 667J1BFj019146;
	Tue, 7 Jul 2026 19:01:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 667J1BZL019139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:11 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id B91B6641; Wed,  8 Jul 2026 00:31:08 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v3 5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot properties
Date: Wed,  8 Jul 2026 00:31:04 +0530
Message-Id: <20260707190106.2876465-6-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4d4cfa cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=xr6tc2DuHRNcHCIOwl4A:9
X-Proofpoint-GUID: TDVL9XHlYZTU3h5KJS0sLvEQuPxtCAO3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4NiBTYWx0ZWRfX0n8lfymcaSBu
 jdaAbZVf2sWr1YgLABW/4fXwsrnBbJqAk2AgQp/LM1FJLZgGTRsrBirg1gJ7ubT6jGYaaV7MmLW
 eJWgD9E99+/IdNrlMrLQOK6uNgc3gRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4NiBTYWx0ZWRfX9IiBjaj7+01A
 /Zq8CoqYA/AHqv59Fs62bRTi9S062j+Y4fIF1TKINaTdHB92xGwY4/3olXeLmVWx0REDoTtoXzz
 6yoEGiwXmcllpVAs3KApMKhEp1/V9NOsAoblkxwPFUTGW52kBC+pwUXqaZ4aVupPQmj/Vn23mqN
 eWl4oybrWO/7GKOyrU+GNiTb6FMsTwpejqLOfEw4gWFvaY2s4wEFGeHNd+zHEoTaeEkGrcCeDQa
 VfPN8ogQaGrLlUIeiHzbGyM7I7Ti75sBplMr2exXh5JYxwcoJ/tJKvSM/GaoDR+VkIqvwGPbrCe
 0Wq4vbWRFPXyDY0xZOHgHbDbZV3OHZPU/WUN1aI1HwOjy82W34IiL/jU43vWqSDD+u6+aqo0yS4
 XQxx9NQv3dyljpvinX4qfnzdXwnJRUlicw6uXhVgAxVD3HDBQ4W0bR6uXLrgc4ltMi38hL1ZPfl
 CqGRJZkPhtQY/xKM+pw==
X-Proofpoint-ORIG-GUID: TDVL9XHlYZTU3h5KJS0sLvEQuPxtCAO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117390-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F158A71ED55

Allow the standard TDM slot properties in CPU and codec endpoint
nodes.

Some audio backends operate in TDM mode and require the slot
configuration to be described in Devicetree. The common TDM binding
defines dai-tdm-slot-num, dai-tdm-slot-width,
dai-tdm-slot-tx-mask and dai-tdm-slot-rx-mask for this purpose.

Permit these standard properties in endpoint nodes so TDM-capable
links can describe their slot configuration using the common binding.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,sm8250.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b..a45a1a00f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -84,12 +84,21 @@ patternProperties:
       cpu:
         description: Holds subnode which indicates cpu dai.
         type: object
+        allOf:
+          - $ref: "tdm-slot.yaml#"
+
         additionalProperties: false
 
         properties:
           sound-dai:
             maxItems: 1
 
+          dai-tdm-slot-num: true
+          dai-tdm-slot-width: true
+
+        patternProperties:
+          '^dai-tdm-slot-[rt]x-mask$': true
+
       platform:
         description: Holds subnode which indicates platform dai.
         type: object
@@ -102,6 +111,9 @@ patternProperties:
       codec:
         description: Holds subnode which indicates codec dai.
         type: object
+        allOf:
+          - $ref: "tdm-slot.yaml#"
+
         additionalProperties: false
 
         properties:
@@ -109,6 +121,12 @@ patternProperties:
             minItems: 1
             maxItems: 8
 
+          dai-tdm-slot-num: true
+          dai-tdm-slot-width: true
+
+        patternProperties:
+          '^dai-tdm-slot-[rt]x-mask$': true
+
     required:
       - link-name
       - cpu
-- 
2.34.1


