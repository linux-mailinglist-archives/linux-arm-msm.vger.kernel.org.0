Return-Path: <linux-arm-msm+bounces-115785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KOZVATB4RWoOAwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:27:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E036F1762
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:27:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y+pe1A9N;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iHSKREVV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115785-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115785-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C965F30442A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8B82D0C97;
	Wed,  1 Jul 2026 20:17:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97F3B7753
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 20:17:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937057; cv=none; b=J96cIGnYxoP/ftz2gkIbX4buyR1joV9yIVAuWX0uwEEqhYtl4T4s+uE+1+fR4aDBTxkKQYnM1GtOYbxIvFDxYcfhBb1p9lZo9ZCMZMKV6fZIrMNJzGbQXmxQevr7JOSLF676s0aaDwSZ4qspyxu2O5WCzxBf+Uo1SDOOoP1xxsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937057; c=relaxed/simple;
	bh=O7e+z5O3u9p4uqA/rqmuYxUbGbJniNI35Wn8W2asCMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QhiBGLfn4aI5ZQEomlsWRjLGaJsLIqHtoqY1nx4xfW6hBV5ii9hSJ8DL6pdm8JvduX6GZLLRZOPjCLt0vSFFMxVIjRD09lbkR4SWGMd9+ydD6erYVMo0idz+qJtP/U1M/ICeaPYX0p7HuJ4wlCjtIZQqsYl9VxS6V0O3gpapUi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+pe1A9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHSKREVV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gn9cV1628835
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 20:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7pDwUG0o43LTe/Dy+wxU5CdZ2Kvmmv68kgvFJA86g4=; b=Y+pe1A9NvQlS45WS
	Fg4S4EPaUbCjPetEh7nNIPOLgGfSOlqbvIGLOdlObLNeOTxIsrVFvlujRI3nDs/s
	N5V/csiqle80RLbhMeWt6NXEktGvL4n9GwG0Wn17t0RS6qLtWUGppyvSEykBaMPk
	lBRAebl6JdbbJ1OYmR6EDqZe1funFp+bcvltM3XQsJCfKOgeJPERo6FZpjVyokRu
	2D05yT7LZRn7mpaZMBw3FA1ONw3Cz5aWMWyRRTpxC5gnt4zUd0l2RueaNyKE+tZ6
	hDpwKv3Wu6czk1If9EVt0N2CDdINRB50ALc4njdxguN64JmnPpS2P1iTnsU/eQaT
	XPCGWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563090s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 20:17:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fe5d16d15so1636698a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782937054; x=1783541854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7pDwUG0o43LTe/Dy+wxU5CdZ2Kvmmv68kgvFJA86g4=;
        b=iHSKREVVVM+Xzzl6EzIPDkAdfq3iG7UJdFrelG6xSJn6TjHOrzXT5XxJjHgJmuDeYL
         Uxl98S2HiDnoHF17V4YaS+hx1YZkl8xHbGlM16OQQeo6IGGILSm0HqLZKg8LfAov/RJs
         b+XEgzBdMD2C12pDEpQ4aYid3O6AqKXKoYRaVzvl1JEsZF9piaQXJvOe5Dr5KjPqw0jn
         vdKluUFcBZAzFhgLODrDm1SSClJ/sSkrSWOAqxbY9rPq4vQ3CSzYJZz5ygLXqX90LosD
         JAs/hEUW5GGm8qSmRxDyIALlXvH/fgHP6CgwpKA7l7fe0XkRSEbczY8okxFSO0KK3rQP
         xe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782937054; x=1783541854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R7pDwUG0o43LTe/Dy+wxU5CdZ2Kvmmv68kgvFJA86g4=;
        b=YJN4D3cNZCdHXGhOUSX2JY3O1VXZ+BPLGpHuYUtHRyqGG04wPiil0Wm1Arc6OBQfET
         /W1NDoW46cGvKXI0tF0hLgJq+nqkeh30DkIFpBfTifdHk5tOAgWwpROU4Dl1RjFIugGB
         q6TVp2rs68fw9folu/B/0zo1MRx4SkstCt/QijvDMXUm8i/I6mj/TiP+FUy+/QFQ1iP/
         bazWx7lQozqdwZD5miPrg0pYH+LAFmsCN670ZDAaR31pYh2Eg5sJ0RSmhhvVEzyTQMrJ
         QJ9h7pPMxUrV4wq55BoHbODq3paYZuRe0YlBovfgH1OButQeXpaOS3cT9qPLVHf1g18y
         PjqA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7W2dyPq3el3EAClTUaYQpNbJcYnGYMdryZK5lzmzMcErWt75+DWDk91gxOalK8IAzVdq7QnqaTSoz7isk@vger.kernel.org
X-Gm-Message-State: AOJu0YwrWngMwVwa36L/7FTfpbDxky3TCox5yPfoGdodkaPeGqpo+nPH
	zjS8Q5//fyPtg7b8ZkSvJUMYJCTnVTI7FANquJWA5zq6YUo+Q7ItHstsyZkDJbB0EgJfbQHgYAg
	QBBNisF71xoh6HkBTX4P2gxOVsT4xwHGMr1mWZOzX9L8Lulij+tEh1YPSjPUZOKND72sa
X-Gm-Gg: AfdE7cmYUepiEDPIG81uuGVtqqHc7rBdZMvFgm8ui6bJW2ityeQdtxCcuoLbfiQgr3U
	yFolFdnryR+tFnwIkAmrgQJ6DgtKHpmcKn4wjvSJLIWCnOdpJwIg6RKvJ9jAalulIGVggGlJ90s
	6souz4L2lR6IM6/8ZUd3HBqHycT66hU2sFOIqWA7z4N9eBf5eokuysjz0Ss77AwyLLyAFI9j5lu
	wy+kCZavUK5GwhTJeuPXcx+IvhKKxaCg/ROjlpKjWIO/iIxIGXgNdCJpRMibLe/c9MEJY93as/O
	rNR9GB9sjdvJhY8QRBLX7uY1dt47a2+SwArW6VOCM/EcmMnISdt6CWJT2lfhX2GRl36DQmF4jAY
	bz6lsGwWXJpf68ciNbLk11HGb0/3ZW2MPUr56O420Zrz3
X-Received: by 2002:a17:90b:57e8:b0:37f:caeb:69df with SMTP id 98e67ed59e1d1-380ba94f8a0mr2661478a91.22.1782937054423;
        Wed, 01 Jul 2026 13:17:34 -0700 (PDT)
X-Received: by 2002:a17:90b:57e8:b0:37f:caeb:69df with SMTP id 98e67ed59e1d1-380ba94f8a0mr2661432a91.22.1782937053810;
        Wed, 01 Jul 2026 13:17:33 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc79231sm948685eec.31.2026.07.01.13.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:17:33 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 01:47:11 +0530
Subject: [PATCH v2 1/6] dt-bindings: crypto: qcom,inline-crypto-engine: Fix
 legacy/new SoC strictness split
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b4-shikra_crypto_changse-v2-1-66173f2f28b3@qti.qualcomm.com>
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
In-Reply-To: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a4575df cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=F4we2z5FY3kt4yoF36sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfXyu7kcZAKp8Vl
 4EPlFD1mktxUqVMa0Jbc2CQr5S28rJKqJc8HOEVYBjmgtdMhNBtLpveIzLqfllTeNCPZOVKcBVL
 LbaxEMmh0uRImEp+AGYuTKwYJJSU/Bw=
X-Proofpoint-ORIG-GUID: 1W7W9tHS9TR6QGYAo9l0eGnzo461YqYj
X-Proofpoint-GUID: 1W7W9tHS9TR6QGYAo9l0eGnzo461YqYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfX5Wo+KxJskYCS
 QTXeNFkIcl7gavav3pwmR0zHR8R2uvn9oNOs7d1i+eI9jnlqBdl9AzJj8X2qxPC18LcVoGaVwFv
 nyX8bg5TYlhxJWJgYiYfrGnS5JVUTTkeJ5MbXbpjqoD94ckUnidlrTM3jh8kfS/5ylefuB3JAFv
 H+ftvopMvBVhvgNXXKoVH2J65Ezp3w60+TK6C+YlYYbLCfLwGTpTalJrd4kxSTzU6iVjK4/Gwj9
 aXPyOGg7iF4YSxs06zmf+l151VlpIU+pB6A3vMax146mzDWHqHmfWRPsU82/Vr5anxvbD7LrOiE
 B8g/XLssyrY0LlJQjyafRAq1gA4UoQzZRmNuUCULzbWRZDv1BfT6Fv7D4xjIiRgzsFTXJpn3gVs
 4i954cTUO1uDDT9ZLGVcfzDyzHaEqicC0Bwnshis8zks894zmKNSLauywaSrGPhuVvfriDXPkeG
 RxrqQD2hkA30GF4rJnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010216
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115785-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02E036F1762

Couple of already merged SoCs describe ICE as single clock historically
which are recently updated with mandatory 2 clocks.

Keep only the known legacy compatibles flexible, and make strict
validation default(of power-domains and 2 clocks) for all other Soc
compatibles.

This ensures old DTs are valid while ensuring any new SoC (not in the
legacy allowlist) must follow latest requirements by default.

Fixes: e27264daac7d ("dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 23 ++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index db895c50e2d2..4f3689a24410 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -55,14 +55,25 @@ required:
 
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
-              - qcom,milos-inline-crypto-engine
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


