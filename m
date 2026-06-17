Return-Path: <linux-arm-msm+bounces-113678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /OaACszbMmrt6AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:39:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D482569BBC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:39:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NH1INrx4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F8GOZ1kp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113678-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113678-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60899302620E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CB4376BFB;
	Wed, 17 Jun 2026 17:39:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9473750CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:39:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781717946; cv=none; b=hW9EF9B6wKzj59n6yTPRwAugJgHpQ1UxoxgoYA7iCg7fGZH6O1HTex6EBLMJu3tonui8Edl1pBpsxUBTA2rHOtzZd2H/8tSFtB8HWo7OOlJB1yVLmiwaOfjIaASSSVrTGJo5ezh2kXycZUzpdsdj0ktjR6BHLjcGXnm77pCn6Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781717946; c=relaxed/simple;
	bh=dE6/5esF/eMPOaURmocWJsZguEErQvH5GRyjJ7XmrpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4z8186YDC/Y5tZsmFjhQ5uVHOfQVpOa4Oy+2Oj/06o53Ua5P4G8XJ7fN4qoIkwWIw8Sn4CpJbheNm/MoWGEggf7osfBsGhAHJa6ZO2b7zPGen6pJORUQfa5POeJuNeRwL8HJ3shwrJ7bbHyxv+zKBMhITlwcKXhyxLISic1dOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NH1INrx4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8GOZ1kp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHd5KZ2976524
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JhQGMJo/Hy8WFmRJlMLasay8E9zFQoFdfklzAuPVRdc=; b=NH1INrx4as7ovag6
	mDgzLofjBNxz9/UXAVZ1HkUij4KlGzv5vJW1S844cyPrJsvkiy/KSlUKW5Uc6Tdn
	iiCoKtM5Kj6NmmIC/ZtRccddNDppFgcMmI2MqHxwTutf9SHTqUIT6RjeehiBBdtz
	IdUZBvY/SQ5lOuujT0sWMCC/jpEDFd5XiQ7UpVNP2tam6pTYyDS/w3V8NGwhi5EA
	09VRpM+XQZLFkEZuN4QFvjpFheFQuR91bT54Z8TjndQYCi5AadubrO6QiyVS7d1N
	TlWxpBqvIrkG1xYyv4QfOcpHPyHE74zCinjt6GH96Q/ttw2hqpZaJXNFqBFAubGL
	qK1oqg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2c8td8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:39:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0d0516ad7so740385ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781717943; x=1782322743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhQGMJo/Hy8WFmRJlMLasay8E9zFQoFdfklzAuPVRdc=;
        b=F8GOZ1kpR/FDyqUWgwvNXm/NWcDNtaxfoTRCmKrOu32LqFK6OjcOpmiUeegzlVlAPf
         K/JLuOywpNq3EBLBaBG37w/ybK0p+2PPMJmPX/kc0onI1QMHqYLQCIkYI8VlnBfrngHg
         ClwaWRubEEFav2sJD1j3w/gI2sU7+XFIXzxmaSGgrhnHdPa5Wt1NedL6tTJ9OFbNifVa
         RMCGGBFYNNm6YEBmVu/g6pRXBGoqOrqZocycdJ/O/5FkWUV6lhyT0S0O5kbANiE2mMW/
         7IA8vg+TbDRqPNjt6YHChhz7kuhEfgccIS4as8wb2/bjI5rdxKG3fH4/dOhBUYR6E0jf
         N9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781717943; x=1782322743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JhQGMJo/Hy8WFmRJlMLasay8E9zFQoFdfklzAuPVRdc=;
        b=H45rL9s7zdRFX8l61ZLQnbpJ4adJwtrX2iQOWcmBKPLrMw/lbYPsztLCIiDda1Xy34
         uAdAXdA4+7nzOrXlH//CD3LU1VAD0TZAsUgjSLtxpOOP8+pV2n7hsmgQbhAZgww+dQW3
         PdS3fQfvCQlrAs5IyPZOJRVV273JimJS9r/NL+HV28JkFmfIcLg68asz28CmvEhPpT7K
         cg3jz4nuvI/Xjmso9NO2Kvg6pM30mTube78MQe8JszLXLON2aAhTGqd63rRH/X05biJp
         iyhdXNKxc+TCppNzTfi5jP0afRfMUxb5vAlXG2C6f+7seWtVbXA/cAsxwRR12xZiKOd9
         v8GQ==
X-Gm-Message-State: AOJu0YwrDrsQ8ZYjNGj5+P63rZGfLLFZZpQDiO4JXn434YEjVJFv7q3V
	R75wrmH/cUDt/uUvji41fTxLPVqIHSZ4AhkM1j6g62RNeqecXvyHQfBrEog4qUu5BTbCPqfuTmN
	1UK9Swlo95bKFEWfib55tq6OIQ6iD5zg1Ymn7kNxnq0fA/lFpzSNy5/MwBVk3xna6UZLz
X-Gm-Gg: AfdE7ckt+06nFHRX8lvfMzIHGkmtRYqf1tnfXB0spTv/APRr82tTLZyRNNcG68aboX3
	/75jcNwMuoae+EHeHOvJtKrD7ifQcjxRSR91dOrhrTXyW+c3cWFzdS7Mi1Vr8Ah8AZ91Teia851
	a9fiYgKGJodxChGkZzj9OQSxQw5dwJdocZGJQmIW1qzxn/YZCZaJW2qLTbTbmj4s2TwjilW0xxE
	7Pg8sy3q3VgbBFCi2stvtd3U/ITlz3auKF+1gkBCwQdagHSmVUVrgoCn3Sa8VeqGAhD5XM5eQ6l
	QT3l5LhNUGx2ZbKjO/A2udthf6DHOzy1tOEtUpwcSMR7bK7js3hWXanyyox+Ri0/RB0BmMsSO0t
	yF+23YOK4qPmxNiwmyOu46iQQIUV7RrRGefUjYSuENGdk6k0OCnhiwhDMmgA50QKt+MtoCE8VTP
	Sk/lQVsoel223YC8dUKQQCOqpmvrt10DSZDXW7ObKwNu99qg==
X-Received: by 2002:a17:903:986:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2c6bc21012cmr47168525ad.32.1781717942679;
        Wed, 17 Jun 2026 10:39:02 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2c6bc21012cmr47168325ad.32.1781717942271;
        Wed, 17 Jun 2026 10:39:02 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm173973215ad.73.2026.06.17.10.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:39:01 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 23:08:44 +0530
Subject: [PATCH v4 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-ipq9650_refgen-v4-2-c505ea6c6661@oss.qualcomm.com>
References: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
In-Reply-To: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE3MCBTYWx0ZWRfX71bPBQx46Tce
 RBPwwGpNhANrGhVXdLRhwQcR+sbckMFzSdIa5Bn5hM1z7kX06l/2VY3ilyepzVNh9J7p+0b5a0j
 kTB9rsVgIHa/UYTl07nOmGcD0ZM+NwYYSt1aFpVL+Bnm9klDVnkIoLaC3zul9hz0P/JTCqgsZHU
 aAPg61XhUxKs+b7FeI0ROf54o4Jv6qs+fhHcEBSv8OhsWbtkCnoMmbxDc/j7O5t+OPncVYLddaN
 wqfDo17wsZwGmpYvRCY2ZKSN8CN864bp+YPv5GQYpKnPvrwc7hILOjK+A5zvFRCs0f3/L/aD73b
 vGA7pSLKM9u8mc4b2/gkj+CesOq0s3yaqVGc7hPK9uJfJ1bWDy7DfDVyZ+VpRUBlSKYN9o9C4uJ
 xQ2EgN0YG9E2AtvCzSAeIIwgaK35JyjbDeA7b36SR34ykG0ufMwRcIic7umqg86I9CVeCUtju2j
 0c1TIdciNxyCKCHgwOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE3MCBTYWx0ZWRfX1KT6UeZwjQfR
 pbrbUdoQvC/0IEnE1dNNMGgBy8A/AzeYl/qhIG060u5HnDEGRswF1JdpYDq7IBWwxlnnrLi4v7T
 eHXx6gU1fodLTEpaaytiuVPOtU1GiJI=
X-Proofpoint-GUID: gaumTduy9ne7HCY98FVzkAA2vzx1uPpG
X-Proofpoint-ORIG-GUID: gaumTduy9ne7HCY98FVzkAA2vzx1uPpG
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a32dbb8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=be7_h8-LoVvd1EpECVAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113678-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D482569BBC3

IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
REFGEN clocks to be enabled explicitly.

Document the IPQ9650 compatible and the required clocks for it.

While at it, move the allOf block after the 'required' property section.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 31 +++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
index 40f9223d4c27..0bbf7c806fbc 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
@@ -13,9 +13,6 @@ description:
   The REFGEN (reference voltage generator) regulator provides reference
   voltage for on-chip IPs (like PHYs) on some Qualcomm SoCs.
 
-allOf:
-  - $ref: regulator.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -39,16 +36,44 @@ properties:
           - const: qcom,sm8250-refgen-regulator
 
       - enum:
+          - qcom,ipq9650-refgen-regulator
           - qcom,sdm845-refgen-regulator
           - qcom,sm8250-refgen-regulator
 
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
 
+allOf:
+  - $ref: regulator.yaml#
+
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
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


