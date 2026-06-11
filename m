Return-Path: <linux-arm-msm+bounces-112664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JDNULFZ7Kmq8qgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:09:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD96703E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:09:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S38DtYPZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QI05Hx4w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112664-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112664-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1E6A32840DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A023BB122;
	Thu, 11 Jun 2026 09:03:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B293905EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168613; cv=none; b=AMMmWN09Eb356mEMj1b4WtWdbIzb4QgwryofVqmYYF3uS/NkdPLWWjDUkURAkYf/MFqaBPE9r9motyMxn79CA8BK20X9vfr42WBwnit8fqSETxZY2Q+soyu1/bcUu24H1GOkTfck4yF67ignxi9ilK9LznjC+C7t+6+z9qQEnf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168613; c=relaxed/simple;
	bh=qh5pRZnX4B9uijKs73q1IgZX/KhVoR40uSi6HD4HkzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBg/gcZAW5QraifMwH7APo4jq8wL6qnXXYNtWHK43Lii0UOlBL7BP8ROwtL/UdfSAE+i3zLzEOOskTtEvkxIH0QqUITitXXNox8eqbVWFAe7xbHRRKRnSQLs4yy+0YWoLr209vxA3tJ19eWpe3AQ1YZV2nmqExdIg6d33GYoxBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S38DtYPZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QI05Hx4w; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GMmI2248055
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DmZ6rmoSlBk61fs7laKykC6O/JMmRx/oB65jdV2lrCQ=; b=S38DtYPZ7J7AeXMK
	PlEy76o/QoBjhl1qFOWL0mYLXuzydcDqlL7ugD8vviJ4I9SkTFOJzZK6EQt08e/W
	AeLifv3hx7p6TR9p7uyoYITDXrZ8tsjmOFxstEv+ihlq0AZtDqvex3iXlltZ1vQL
	terjaDM96FMXreT7ZZBAMNLLMosLeF2wXG8u70D6QCNCOqeh7QIpv+4McfzhVBCL
	XfQR65HY+Saf7og50IRV8o0GqJ56udTFQHmTuph0f+aUuxmjtT/xqWTR51038Abl
	IciFCAD0G7AumBXLeqxlGEuFr4f3RJ13rNba8/gVYExc1mSQ5kNuO32nHhmulym/
	Cm/Trg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79jj7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2c98c1be2so11714065ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168611; x=1781773411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmZ6rmoSlBk61fs7laKykC6O/JMmRx/oB65jdV2lrCQ=;
        b=QI05Hx4wrw9XDjUvGrXBqVNdNnPWjVkQf/I4KW4l9uUwf4vhuncpI5XCq/gyeWXpSW
         Q5dxXje5uhlRgpcyQStR+8VO1PhzFkIzeXZQfaTaZZanzjzICFLNQoOG4D0HnGUbpPQU
         ZiPpw4wjZj4f/5nM/PTdUj97IKa/Cmp2x7tLuMvF9BELV4jViGnfZ2zQNFutE7q3x2bg
         BlbJNkAFhQcVyntKFRMNQS7eC7aAy3Cz/HOCrCdti3DRItjUdtopQdbHhdRQZf/dphcz
         /n8CoWGj1SclLHxE14x9Cc02QFiG5h0xU8zdE3KlVenVRNV1Oq/JgPDBx/5V0R58d4jY
         uc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168611; x=1781773411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DmZ6rmoSlBk61fs7laKykC6O/JMmRx/oB65jdV2lrCQ=;
        b=arwwa1sQqxiAQzUWAdCaHIgFRaAk8T3aC/32hgnitRpTV3KaHBSWB5hc5Fpr6kk6gE
         JFlUDd5MVKTfKydSRuRLuuup+aFK56OONbk/wClsZMG9uPf4NZ5u6N39E0T/ZhJQqZQR
         FJNG9PjqpsuVnpCM8xqiJZfwjGtkZuszR8tsGQtJD/f6KahtIT9mpU4/z08ou0UpxSTJ
         ANZYgk5hYhJ13R8mZ7xYy3D6zwoLXbrx7kVMaZbWF4x3FtRTzGZpOv/ubXhdD5VJwC+I
         KVbx4/JZkgQzoFQqluvXpvZ7pBAk6IdUhFmirXyk8unFTvEurlQnW/jDOxSzf9mo6dgI
         eXeQ==
X-Gm-Message-State: AOJu0YyVkxUFx3qXhEmCXA74vxydY1EDqhyTe7G1EF0NLQGCZpa+03V4
	k2UyJUB2K3NA9HLM/qMWhAhHla2mkfWU8clJsWjWFmRvSjKXhFwf7tN33Ke0pdphig/ztGOwKKB
	RYmQi1orRUJKMJF9iTf0sicraICDm4NwQhk7eIqRC4sPbqAmY+fX3xUiM3dTLA2UqadRdhWcdB3
	I6
X-Gm-Gg: Acq92OEP95vwJFOUjFhO3qw8hatJssX2eAhLR3qtoXSFcnk29lUUndd281AbVqBMVS5
	WoFICPF1O8bmVne21jPFPdgiyhxx96h9U78cNFfgu0oca2kyaEx8pVdXzLqvjUTGseoa8qnhVVt
	faUyTCswF5T4UJp7LWmKsUDhlC/ivdZ4O2SfRJZPyMZP3r+gZLOYtjloIU81iLMeTwm2vo/pgHU
	ZQ3Hm/4vf5Ng6wBESTl1dZ13c3UNBD0UTDAF1ae+NqpSamt+yK2y46VRnrzD48SXvDG5O/8t0Z+
	SFQcEuLQUmRDahw76LBgWpfVmfU7LD1b6DtOgi+2D2s9MPSPDL/vA4xW1L0JToy1SWnNn8mArBA
	uYkJie6YM8OJH05O+Z5kmHnxz39crqtLc7RP0iZQr2i51lSRLPdf2QmrWxPIesryx3cyJQIculc
	XwiMRzr03t8IcmPt3MiXs+AkDTXkPkms6zgSqXCAyRfR3dSLp29ksos7o5cO+0zjW23oI=
X-Received: by 2002:a17:902:cec5:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c2f005e44bmr22111845ad.7.1781168610579;
        Thu, 11 Jun 2026 02:03:30 -0700 (PDT)
X-Received: by 2002:a17:902:cec5:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c2f005e44bmr22111245ad.7.1781168609981;
        Thu, 11 Jun 2026 02:03:29 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm140980535ad.38.2026.06.11.02.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:03:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:33:17 +0530
Subject: [PATCH v2 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-ipq9650_refgen-v2-2-d96a91d5b99e@oss.qualcomm.com>
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
In-Reply-To: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: QL6M4MVFOTAn3X4SnE2oKzD-l-1VQlGC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX0164qWi40cpj
 ar9mJlY1LEjj0knq0DKcURFXd3YRW6drchoj9pNzbyizPOgc8lbi6UH3qKUVr9zc1cdZS/YvVqd
 CfAbD7LVMdQtlp/qMovwBwWZ9Xj4u9dBtaFBPsBIj+v23PlbU3sHbHXvg8My7AaQnJnaQMaQSKb
 ycw5dGalpv/THWQ2NsP8l4PKJEhLzeqgomcWe1gPKIXjLQicgAE2Hr3Gy6enTsFAY+VzP1PSTYQ
 qfbUIN58LTzVtbcqJtYuaOZO382LNMegq5BSE2gtTNVOMWKwPqkS1ei2LDNVAP0kX/Xezbdtuwd
 m4p3GDfgrobpBCBdXf3VJWhL7yWNIASZXLRq28anp61FZG4v78AGiilAPxbUz65iTCnjic6mR+L
 iAbU6WFfbCBMDM+1gl0I4fms9bcSV/jRhuXLNLKoAiXzZNkw1UYNJ6Twcqdc4ossy6dNjedLyqN
 wq7Nwp/i+A/rTA0Gv7g==
X-Proofpoint-GUID: QL6M4MVFOTAn3X4SnE2oKzD-l-1VQlGC
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a79e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VjL3xhqMjkKYvgIonoEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX2R9O/7qmejgD
 WsPyXXOJWzpfiMLh+mUT+1kGl1rvzv+7iEpgE2ZCNfH8oAK4QmXqZvOs8KCKQEa9Mqizqc0A2zl
 TUq2JvaVe2z1HNxzkoqz/058OTGAu8c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110089
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
	TAGGED_FROM(0.00)[bounces-112664-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26DD96703E3

IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
REFGEN clocks to be enabled explicitly.

Document the IPQ9650 compatible and the required clocks for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
index 40f9223d4c27..2016dd7a0bdd 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
@@ -16,6 +16,20 @@ description:
 allOf:
   - $ref: regulator.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq9650-refgen-regulator
+    then:
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        clocks: false
+        clock-names: false
+
 properties:
   compatible:
     oneOf:
@@ -29,6 +43,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,ipq9650-refgen-regulator
               - qcom,qcs8300-refgen-regulator
               - qcom,sa8775p-refgen-regulator
               - qcom,sc7280-refgen-regulator
@@ -45,6 +60,16 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Core reference clock
+      - description: AHB interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: hclk
+
 required:
   - compatible
   - reg

-- 
2.34.1


