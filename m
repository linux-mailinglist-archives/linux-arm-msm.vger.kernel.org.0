Return-Path: <linux-arm-msm+bounces-115341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BUlLJ5qKQ2pGawoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:21:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE6A6E2143
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:21:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YZ2llTgP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115341-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115341-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B5873036EBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AF83A1A29;
	Tue, 30 Jun 2026 09:20:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6D0149C7B;
	Tue, 30 Jun 2026 09:20:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811235; cv=none; b=bDQYLwi+BChMyCnUER4GjANgzOvco7EO4TSoBhaj6n2RXNs3gOUlMYIpUpVqXu5GUAn0q6hyzo13GbkXq3u/zcvDtkfDeG5j0KPam9zxku+LNgy8PIySHcGa9C39vwXpkFfuOfsFm5YLRU1rULi0eF5n5PIFQSzdSvtCpIgBHxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811235; c=relaxed/simple;
	bh=yHXQzWfKIrMS1thbmwcjoQkZZEgv4j6q8RQShadUNfY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SI2mJbUGKTDS7N26mBygMm6ZwCWc956SuKCcXwYQ7oT3ejjknhJxBRnEl3wTmscjPga0aBd3HfQbL2C2ckE4vy4spKb5ggG9EOEA99X/6zrcA/EeH0B12ykXpoBIcfxwwtIuTnQDRI+hbHYpDxB5c/xim5/JhKEnrErhYNcPNzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZ2llTgP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U96bmi1502099;
	Tue, 30 Jun 2026 09:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KxWOrQvJyBa
	vesURanTT5ltmEfDhFxKTC2gzZsyDLvU=; b=YZ2llTgPZSfSw0Bw2yfQcoMfW7x
	EfA+vdOfpQF51MRQXPPVCeBTzxD4kAcC2aU8aAi274YpB8ZZSP00lkzbn4cYTwdx
	EwNWiqwLcPTij+xtJcRxCuvDVXiGqh+2T9CYmeSWn2eSop47nISpa0ffsCmXhW3I
	782xdiDCXsLB6uRlQkHAR3IIKqa+GMKSaz1x+qnaqT7RaI9HBOo1rUuFucDe+8tx
	3ytwLEKQM/8xo4ttvDXeUvekVeEcFLOwSCV4Cyh1MrEgaJ5WN1UDT4J08k4zNKZw
	F3FsPAK4dxzC8YqZbhvbq2nmDRXQdR3n22P1ghAwM2w3KnsHWbtEpFAq/uQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpr2d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:22 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65U9KICP010622;
	Tue, 30 Jun 2026 09:20:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kjmeqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:19 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65U9KHVS010592;
	Tue, 30 Jun 2026 09:20:19 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65U9KIIM010689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:19 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 91FAE639; Tue, 30 Jun 2026 14:50:16 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v2 5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot properties
Date: Tue, 30 Jun 2026 14:46:03 +0530
Message-Id: <20260630091605.4043426-6-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: sMxTqHNBX8NIfPfGVDpFvlL4xgwlZzaJ
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a438a56 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=xr6tc2DuHRNcHCIOwl4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfXxPZ4LhSwhF9x
 O7FblPTdiEtsLtcCu254e2u/QEXbB5rKhtw6VCAcC3iADIwE+Bx9fOZ4dj0O7bqIt62Yt2wRrWR
 sQmy6QE1iL9Zm6AKH8djGaQLn05FNv80Fb69X6Se8/6wnv99FMvrp/DH4U0WgTZi+DUmQl+H33r
 DxTIP6l36iCuGxgyd+tgQYXWeYPKVBEKcdnY8+BsWUoq1ArRpWszG1lUI/9IGQNkL8CL1BhJx0I
 PUjQkbor6n96Pmb3xWjvwQhe4W62zk+WpC7dgI/I1s0H9k8r/jAuNB4CFxaJs9lXVdppPttjyly
 7ypdP/syx+HJTJp3P6wUXQC48w7Mf+/vP7Cp/YAD0gdWXj4A1H9Xwph9HvmMjoVzDH3VD0dMT+T
 bcR0Ok1Uw6+tR+pmI+R8W4Qeo5YMmTid7AlSQkhjDY1ww+3Uq0auvX7zPtMgWNvxjVeKwkFBALx
 bs8+5uNLGaiidBzSngQ==
X-Proofpoint-ORIG-GUID: sMxTqHNBX8NIfPfGVDpFvlL4xgwlZzaJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX2+lJRk7Dy4j5
 99eP73wdIrB5q/WDJi3lPsLzAW+NVTd7XoyNgnLS+atq+C+ncVvX/TZyUkPRlwfphMTaim48tiv
 cL0Q3r+3eFT8akWnM2Bdk2eKMg2VAjI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115341-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BE6A6E2143

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
 .../bindings/sound/qcom,sm8250.yaml           | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..c82c6c521f40 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -90,6 +90,19 @@ patternProperties:
           sound-dai:
             maxItems: 1
 
+          dai-tdm-slot-num:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Number of slots in use
+
+          dai-tdm-slot-width:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Width, in bits, of each slot
+
+        patternProperties:
+          '^dai-tdm-slot-[rt]x-mask$':
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            description: Slot mask for active TDM slots
+
       platform:
         description: Holds subnode which indicates platform dai.
         type: object
@@ -109,6 +122,19 @@ patternProperties:
             minItems: 1
             maxItems: 8
 
+          dai-tdm-slot-num:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Number of slots in use
+
+          dai-tdm-slot-width:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Width, in bits, of each slot
+
+        patternProperties:
+          '^dai-tdm-slot-[rt]x-mask$':
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            description: Slot mask for active TDM slots
+
     required:
       - link-name
       - cpu
-- 
2.34.1


