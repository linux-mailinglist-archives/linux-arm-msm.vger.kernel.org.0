Return-Path: <linux-arm-msm+bounces-118999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F16ZDEwKVmqEyQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:07:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6943B75334D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:07:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M4VEri9m;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ktB5fgaD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118999-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118999-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 216A130B3238
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8201363096;
	Tue, 14 Jul 2026 10:05:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD3B363C46
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:05:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023549; cv=none; b=oA0zfVMdJwIqLBRK7C+lLOmcsxeO5anIZt0ClEkiArEo47GjjC1AfxNvXTgKR1SAJSFVV2By8FEnil28gQm/CzivMPBBDbOPre3XzA1zMEtU7xKHji/aIorbwe6ZSN+DfOpibwKvdE5GDWNqHLJ9YyTyaBhBAPluzsWOPR6/vPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023549; c=relaxed/simple;
	bh=VKWRSEFUbemWfQG+OXGIX5arda6LIeITz85CHr5HnEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WlmEhgqaPQb6ikHBjnn/FAwaN7zifWbFOn4gTQORJGwqhDQMusjpNVocEki0S3l+3Pc/zys/H4JSMqg2DGgN1Bcb0EFP94Q9hCnjRsPGWncVbeOdcDnQrUQ4YjM6ApWXcaIb6awHHe6NWqNtdbkRfEKUSd1Q3XqZK7yYG81i5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4VEri9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktB5fgaD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SUWk3929125
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iCogDAWof12E6CRfCJqjcAH+F9g7nURKIMRduQn1mM=; b=M4VEri9mclUfV1ab
	MPWwrPTR4GQYzHwIVFo3HirhSJOiQqTDCzmQS8gGR/EmsqNVitu0UoVnXkVinkWV
	+in4NEPJFxe7XM1xdYD2+jxCHeVy+6vXw+ZKjrGlKKHc+C//sPFR2hQB54PWU7qg
	/yQP6Qo/p3rgglEH0t/RiuUcGCSQvXPSIHzfHqCUqLGFV2CFHgecAYmlihqWJT7b
	t6zvsviyVeQdYekGOIeDSSwCe2cHvOVPTzt7bkZklRe5KaArY0PuYOLwn6uMLv/q
	GvQB+nkRr+w4Ulpdgc/MSTgYniZyjJueUGH5eDSgjvfKqmHvSCeBWV9YviYXmSOt
	6QI9QQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xbf64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:05:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so39957115ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784023547; x=1784628347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iCogDAWof12E6CRfCJqjcAH+F9g7nURKIMRduQn1mM=;
        b=ktB5fgaDim9DAa6gmweNmoyn2NfRFKQ3vFD3KfvpF9uBYR6LXS5k3Q+U9IcWOIgTt3
         KXnbw+3LCMaWc0Q+jdcivTfudmjLwVDADMa4fLmZ8Ey81yXua+UiVyFwrCEWdN/Pdi6m
         gyaIjUoICgT9fwd3KYkgaPje1K5lIPK1n/Tu0jy17qEMD+2/XckgJU6kuV72Xlc84jDY
         eke2zgkiYjVBCA0TIr8P0EO6mylz3iyqhO8itwfoDhiPCbk4Zu0eWvwO83/KUh0cXQMQ
         HsnsEu8F6yqSmlSFpfopWX8gZD4xHYEYy6hAuK+Y+O/kl5AormhWFQji7MF4V4mcN5Jr
         2+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784023547; x=1784628347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iCogDAWof12E6CRfCJqjcAH+F9g7nURKIMRduQn1mM=;
        b=sGF7/7MjZ/S33+e0jCWegYuhR5sb1qYSHp5IvKT2XRlG2a8i0G7CgObksL2kq9DF+I
         kkXXEdru+WFG/MWxFzEbPRFbcJkL3OC4qHp+rIPiqAJPSZtoQelIIxR+Y6uo8LCq3rz1
         JC2a77Z4WZmfJH48B2LL3rn/6UtvWTP3ZKcjskMuA3WFPBd9bWrgVTizhbWqhGUIMpVz
         lC90muvHMI0bvMYTf1inKxpt8kcppssQ3qHsrz0wgdCZonG4lvY2x7BH6In4G17wZB35
         jwVBvw9b3ZR13zL8h3KzGqzesRpjjDEUklisHqhS8yaZDOhqIF8+dWkRFtaHlk7UEl3w
         TAUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+sX4DISgdYFHiqWhO2U9Seqmh3u2snaIjT/5XFMfpdAuqv/C1g3F4sjZNB0tx3/v/8Ey5m3bXn3FX5riF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbgsd0imdLOmRenfQ/ChZxEfaSBcq+LmLOA+LYiIT490OjXGAh
	1B0j8dyaDpN4ICfUgPgTnh9c8L29+vhjvDmi4rCajT4ENN8ENR/spHla42waiRYqWVG/z+/4V3v
	cNcCPJD+RhgrRBAzN8n9bRqNR5S4b/dON6R1feVCXEkU81As3lswQ6GqlgXxQUSd4dVyK
X-Gm-Gg: AfdE7ckKvjSpejU7qZ/WR8IgE1QroyHQXVdZtE1aZXjGPBWIsdKSxAXnd2E4GQWwlmK
	5r/iNd49Mw3odF1bW90t/FEpE9IKI8kIRBlybqKIvZ9n8nDMfIPPRPZGNaKqwGaI7PEI1OEFBa0
	Jn8M7Jd5ixrRUmY3RXn18v8rZlcWXaZF1MqY+D7vkzWjCK5NvnAOvLhBGGfk4Ygu9V1ouMkE4xY
	4vBPKe5XmSgRkktMD+2JqRpzQbjFVoQe9wwlX74NNzhfbhyhHg0lA+Pt1Yq+dtzLZ2oTl3Is1+9
	Qu+ylpHuoWih6hpS3DCGSkXjotM5SvIs7IrLauf4tVgWbaNJPXJL2r2jApU3HNXX+oY37lBVKYs
	Yu6r0Ii9qWX58dHsC8TYAEu1x2taf79jeYi/OR1zS8seO
X-Received: by 2002:a17:903:3d0d:b0:2ca:d151:383a with SMTP id d9443c01a7336-2cef13647e3mr20409685ad.20.1784023546705;
        Tue, 14 Jul 2026 03:05:46 -0700 (PDT)
X-Received: by 2002:a17:903:3d0d:b0:2ca:d151:383a with SMTP id d9443c01a7336-2cef13647e3mr20409225ad.20.1784023546058;
        Tue, 14 Jul 2026 03:05:46 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm112653485ad.19.2026.07.14.03.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:05:45 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:35:12 +0530
Subject: [PATCH v4 1/6] dt-bindings: crypto: qcom,inline-crypto-engine: Fix
 legacy/new SoC strictness split
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-b4-shikra_crypto_changse-v4-1-06a4ea97c209@oss.qualcomm.com>
References: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
In-Reply-To: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX8+uwwA88GK96
 zPQImSp77iT2SN/LNg7Ae5Vj5PpClp+jEK2XvZBgvnQ4SevzfwukHcvcNrz08JsBZ01N20QQaN6
 YLxRJDwD9YkcpQlYxOp60lNPeFsUbcU/uDdiF8C0zQ1yVpymEPtfpBFze2XQzp9kMeUimWtJltx
 fTFzTeDnehLuKnrsRbcHwdU60PvXbdd3Z1w0eWFSExjP3h4QZKKaU5k3szEDihM4JCLYHcLfJ81
 LmiYI068vCKnZfzxM+WHZCb6TuKwm6kCBOwY8zfiP1vlgiovLEyxR8ahMsFmx/WYqPtp3GHQ9dz
 gTXV4AdLmjsFwyK6O0QtwS6tgDne5QB0HK2yKouxD7ToiWTJGaWnyeXyAb/Qy6ARrMyQtfzFWjJ
 cRIVTBDy6YGYU7JeVlhUwNEGjKejZrkWU4wQ3NKJKJZzvTB+QlXVAZrvZf8wvoD1jvDi+HkqCl2
 vxaCC1V7pq0GrNV64Dg==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a5609fb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=F4we2z5FY3kt4yoF36sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: fwkqQu43XxLj3mVk8IKfPpN8lGBHFaaB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX+Dm8k78muwWG
 vWTbqGwWxsZM82LLZeFQ/Ws45gCcl8Kg8qkovYp2K92r8AR8/uh2mlN934rmtbNx2zNXY3Zr8tk
 S2oVWtyHcXHIRuilaupNGgDlQND3+yU=
X-Proofpoint-GUID: fwkqQu43XxLj3mVk8IKfPpN8lGBHFaaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140105
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
	TAGGED_FROM(0.00)[bounces-118999-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6943B75334D

Couple of already merged SoCs(like sc7280, sm8750, kaanapali etc.)
describe ICE as single clock historically which are recently updated
with mandatory 2 clocks.

Keep only the known legacy compatibles flexible, and make strict
validation default(of power-domains and 2 clocks) for all other Soc
compatibles.

This ensures old DTs are valid while ensuring any new SoC (like hawi,
milos, eliza, nord, maili or any upcoming ones) must follow latest
requirements by default.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 26 ++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 7be14e99be28..cce21aae6499 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -57,17 +57,25 @@ required:
 
 additionalProperties: false
 
+# Do not extend the list.
+# Legacy SoCs are allowed for single clock.
+# New SoCs must provide both clocks and power domains.
 allOf:
   - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,eliza-inline-crypto-engine
-              - qcom,hawi-inline-crypto-engine
-              - qcom,maili-inline-crypto-engine
-              - qcom,milos-inline-crypto-engine
-              - qcom,nord-inline-crypto-engine
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,kaanapali-inline-crypto-engine
+                - qcom,qcs8300-inline-crypto-engine
+                - qcom,sa8775p-inline-crypto-engine
+                - qcom,sc7180-inline-crypto-engine
+                - qcom,sc7280-inline-crypto-engine
+                - qcom,sm8450-inline-crypto-engine
+                - qcom,sm8550-inline-crypto-engine
+                - qcom,sm8650-inline-crypto-engine
+                - qcom,sm8750-inline-crypto-engine
 
     then:
       required:

-- 
2.34.1


