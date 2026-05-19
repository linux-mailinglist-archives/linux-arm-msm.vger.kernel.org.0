Return-Path: <linux-arm-msm+bounces-108379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP1cCNoQDGr6VQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:27:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F306579093
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B80893084107
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AA23D34AC;
	Tue, 19 May 2026 07:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yu2CxyIN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jiTIckeD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6323D3488
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175472; cv=none; b=eiZXf7b17T6cUP+eo7lRr+hcpZBbs0PRvmWfcxgimbI+3/Lr7QeCfQd9Fm5lYXRWokv5qqyNC4vXfy8qXnm0D0yZ/KHI07kxs4DgWcU5V/F3ou9FwL0+Z0N1ZaLd+BHgsx8dNt18jrxC4HxufK8VDIijew6dSuP2r2f10bbQ3bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175472; c=relaxed/simple;
	bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QxJw1hoxnWk2cVWseCEO9RKaZ5rc/tsKPGeHI+fzIN62pAddYtNSC1MC7u2xYNkIYoKMMtsagkZbwEBW6IXyr+WDJMnajmSZar9FhOPuiLZSkGJWGvvRV++5BnXFdXVTIDyGWEpUm27TcfKbYmIKmu9KcyzQkOf5NHv2vCmds6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yu2CxyIN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jiTIckeD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4MVCU2482375
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=; b=Yu2CxyINOvd9/idW
	trRWA5KyG8ECQ6dTFE23pRUbMdarVfLc00ephTJ/49Li+WE78uBWw9o+Zik0OLNq
	ljrhbCUHJKc/rXJNlhkwfi4Lk7MjqSmgaJkquD89vCcjf5HhG1ifVvUrLagMrrLd
	fgHSaP4PHJ4oV9jLH/59u4qdt2Zv2/ZSx2rjMZpKhnOv0JHpo40GjtZCNd4nLD8a
	8E2PiozikittSlcf0NQ552wYlwYTR6gGxn6qvbVtd2PgcwLyIkG1zVozlH8WQVIw
	SFKauN88fusikZo69zR4uAhT3Txwv0ysDxg3vu2wCR01Sxo7LjdSdFXmWt4tXqmb
	37Qv5w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvm0t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so4405197eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175468; x=1779780268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=jiTIckeDEfQiQotFJi36U7Yd0B9dW2vqxZ3MVvVH1wRKjypo/EFsacZtGdViAnfBk1
         K9Es8TYO0maCq+fLfTt9VRr5vUKk1zh+n6w4nS1hHULczMttTNSnI86Ot2HND1PdsXaf
         rKh99V/6s0wNBqRtq3kJ5qVhvDsN265amQzpj0ghnn7UW4gHPG1gfjH0fdpVMJ+4ux31
         34a+YoKFyyKssEmj/CxGuF6gdmmeie3HVWoZ72dGCxmiYjkK50UvOn/THyI5RfPDzGpP
         tnioFuJ5SlY+W9B3THG5RotEhSqFvF5kRmQSoEh9ZUrXbk0OC1Jxttejf797FFncIRIF
         vX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175468; x=1779780268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=jb1dKFIIU86mi0pfMr86yzO7SFnFBRoK/g94eESuei2NL64SbAdToTS/dnU9qqcPpT
         XUh698KlS4XF0eqC3vbwsFcrmJpcVDpkfS0AXGZXDokHPz5g8So5EcINq5nkhWXOiNQI
         6IGmLatmLNEWVrIIrC93ogp0oOvBc6Z1nWMs/nBw4eVDq+vuFFVWHlnbEyUkUz7ouSSr
         ezWbkPnCvnUBS+rBbz8XoGL67mTNNR2RfY95ZGtTl+GXoJz+EWEflcaArnRC2puZGsPA
         pT52SzqOJjH/RoJT3GgnRCnIavKw+I9LKlCFBrMnM9Y7xezUso0pSIr09lIF1Xr7aeEV
         Vl+A==
X-Forwarded-Encrypted: i=1; AFNElJ9Wh1I8wFhxOTmUQk+DJ6Zxlko2I7qV2DR42Ri1DoqSaeiIK9fUm+i7jjFPkuddNMa2+FIa89JPOhjJsW9v@vger.kernel.org
X-Gm-Message-State: AOJu0Yym1Hew2DUUBoZAuyjMwdxcVe9UQFwYI7Rxd39OXceNr+fq1f+7
	uxT4Dkt1n+m5736pxjaswAoMm7tgAvDGyI8zenCuigbh32fn3C9UJQkUg1H2c38DtGOig030CKT
	sOEnGc1G/5NPp0f/57ioq28l8zx9Q/Zh2nShhYqqYzK0/ompK9yV5oEoThwF/emTdIIMW
X-Gm-Gg: Acq92OFQKgZmDUz8/aMCmXrSFKBnufBd8wNDm6t6+to9ij3rx+NF/uwbb4/KDaa8Zie
	0haD7cNzZdNAGibXhxHZQsP4tBuEbWK070qgrbmG1VDZaN6oRdkglRRx4I1SfAm3aRBZxHn0/Sf
	WABz8F5iemlcYgShBZCr+6INDh/bKJlyduASwnFJTEVrq1V2kls+s3s/lbIGl7yVa03L5n51B0D
	JzYxHHo9rRKiNc97oo3+n80b8McWR8/91fzCrNw8+xs8AGFNqGTQIz1vPBxM+glgOdgSSVKnWNr
	UjMCdNKvnYB+pqOb6zN1VVuBucn5gfWmy4MUKjhO+taINhuHxLIHS/QeHUJqRa7wMW7Zl0JbItd
	R1qssNtHI9AcLmbQQin2UFb/XKJ6LCrfhp78acDxXvARMQZ+kDTaKXTTvyOfnJ3NJ+IQmUeAr
X-Received: by 2002:a05:7022:69a9:b0:12d:de3e:86b9 with SMTP id a92af1059eb24-1350592f049mr8723127c88.41.1779175467616;
        Tue, 19 May 2026 00:24:27 -0700 (PDT)
X-Received: by 2002:a05:7022:69a9:b0:12d:de3e:86b9 with SMTP id a92af1059eb24-1350592f049mr8723090c88.41.1779175467042;
        Tue, 19 May 2026 00:24:27 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:26 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:19 -0700
Subject: [PATCH v6 1/6] dt-bindings: remoteproc: qcom: cleanup
 qcom,adsp.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-1-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=2807;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
 b=cuOgpRJtHlfYWJtGFnd5LiDPUuT4WcCd02AaKUlrprpWmRqGjO1IlgGFHoi7ZwC5+oQbVZhf+
 zJzEKHN/EvzCMOzwLG+QsVt4VC3jQyuGw7Ur5nBG1fc+9wZlKiWDGda
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfXxQHNTz/YcNAF
 sa5e5kb8UlNuvJWGqcTd3Ao/W2MsHdYBjt1/J+FCgP3rvROB+Td1Gkfwu10u4yTExuNbNizps+3
 oownmpNXPDXXjTqNtQ1IVs7Vniny7enrIYIUuGj6k5gJ3C9U4m6a7wtcSyEqnZlJ68846z2NPru
 AE57vaaTAeMrObDvNEcXyIE5z4lmPmpSoBmVYqxQhgccgcXcUz0PT9Lsen4Xto/iaZD1/IVdZSA
 rpeqypUb/W9NSlVZjh52oXgrGHWhfeOFNj2dz95EfVyOBPy+BefBO75phkj/50k1AmJRq0bJOSD
 2BVLWvPatoxwj8eP1CIS3U9iXGWgU8mFwtdjSw7SeghguE7eAo/i12vVp4SbBXKGi0mbz4BG9Ux
 PZvk9Xw1YiM201ugdp+cLtSwpK5V9/BzEFbDqjwOwXXF+2nUXQLEhts0HNvWs6eUyqjYeFGxWCU
 KF8swJ4nM/FgDdmXFug==
X-Proofpoint-GUID: doYVtOrQa3uxKpR84MqcStQj1TYnMK4-
X-Proofpoint-ORIG-GUID: doYVtOrQa3uxKpR84MqcStQj1TYnMK4-
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0c102d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VspIq9AKIDY_7iLw7w4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108379-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F306579093
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


