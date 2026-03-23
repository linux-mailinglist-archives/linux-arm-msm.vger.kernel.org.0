Return-Path: <linux-arm-msm+bounces-99140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDPgBHgGwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:23:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5FE2EEF73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 943A4305E80C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3697C383C67;
	Mon, 23 Mar 2026 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEj0+6TD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJi+Zuc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFAF38424F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257504; cv=none; b=oePp6y2/6m0k0Na1gueE8lkykDfZIeOAcfCt3JHyFLdMr3Ts7xgZJ+euWGjfkTkymw9G4/dhDKr3dEnmxwLY68b20qsDW9refcuIx+TGG7erOOnB/2y4OBwcgDy57SrhyLZjiIZ1XHSR68QWppyW1THrlxCZiiyo0zlvbwNbftU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257504; c=relaxed/simple;
	bh=ZkSKYFbNGjak0Dho+sw2XFyENeFl4F9edtmWT5qEn8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UrtVc7/dca+sFRONpa/nUZ2KeYG87gvSoYEZaWBzFaAs1FduCRXh7urdycP29+5Lffov9RyfWd46zlFevNoHfWccd8qYm/h9o/M/j24NoKyoKId0Apd9waT2kUeo0lJLlqEnybCUCs1GXgW+On8eHK/Kan/Q01QOBYcr1dRE4cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEj0+6TD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJi+Zuc5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7YhMS303995
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBQnVcwBQGVsncjSxa74jLLcr1ZR+vADPj+TOnhgQ0E=; b=AEj0+6TDepAkektK
	gl929XK97X92Xj93AxV5AMxxWbZom6YkZdXiZWCBqykDIHXFpzxKVwJD0dHRCeFr
	XNHFOmWIF1RBeKruoQtt6fxkP9nGgZ5ETa4KCFPbdqhTzNtkNqI26Su9h7clpcDR
	Uas5LH7W3j/cHt5pxqF+8V1xYVoFBWuE+N5vQDovgI0GfQLTZ/44j2QkcjJa9+z4
	3evruiak/jJDHJWatURiQQzcgQxmjF0GyXhHYo7N3SPO4ZnmsBcr260Z+PdnyuJ5
	KPs1AAaBsBCkiQjAFMS8v/54J29lLzaFKNLvGebDOnIpNZhUjNbE5vL8WkSz8ykQ
	pJcyVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4t4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso118393a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257501; x=1774862301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBQnVcwBQGVsncjSxa74jLLcr1ZR+vADPj+TOnhgQ0E=;
        b=WJi+Zuc5J71l0KxZASwWcNcgY80c/7tsmd8SQHLeqAS0z5lO9nD0lwH+2LRfKgINSn
         LBa88ojq8IyGnGDrhCptUMBtg28vLxmkNUOWcdYhdTb9GxwhBbHk++7KVdAQu1ld+D8t
         Y67CH2iKGQ4YTzi5plLDz/lorhiX9xGThXirlm5xqYZfcBRnTdV4s/EJjeE5zCzVrp0F
         BsNeO637rTYjkU5vIsC6UfTWp/NzxUboLLLb2jVHkBYk7EG6vrsiDxRdz55CsR8QyD93
         wKcMATRHJd7G87m4KVtKH2G+F4GMXN6w+HqS8xN5sVG2QKDolfad+r30aZs6FJQgr6Bj
         RiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257501; x=1774862301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fBQnVcwBQGVsncjSxa74jLLcr1ZR+vADPj+TOnhgQ0E=;
        b=PkoFfxsruNd9uxdndzMXZB/s+fMqJC34yU979+HAk0+opDZQ/tI3+FqSym6AtjRW4+
         AsDuERBfULztzQRnGcA3ZEENzeewc5V4ATWHl6hX+qAz1c9s/oPwc7qJ8fNqrpPZcUzm
         LknPqx1zFg1V2Ews3hC0YCxDhGcf32s4Iw++7BLFEoc8aPxbYYRfIsjv0o0Lwh6xDD2Q
         JdmEJFXjukCUG3tzUy3ruAZ8EjJ5SUzCGlApeE/4cFavw9EfSOyIYFsmG3tBn/Emb4Sq
         pMHN96uRoFoQHQWj9IxVB5roKE6XyVugDZzRwXTtDnVkbmo9cjplI4af5lfmO8Fp9N8h
         BDIw==
X-Forwarded-Encrypted: i=1; AJvYcCXOOScv1izhwZQQkMqjbEZp4Ph5KIt4Ntvo6FTG06hDNb2H9Q4nPKnMy0IYMXi0a+Hz7YJ8UMWqCskHtmdR@vger.kernel.org
X-Gm-Message-State: AOJu0YzpdWwjM144+dY9K2lB5A7Zc1R24RWsQrUr6rJbQ140e9hp8+CL
	lORfAqnKEs9TLRhKUSLClXd9CIqnjpXwRy8kjgy7PNqwelmANoJ40MvQ/AdOo7to40xOTMw5hN9
	NgglCEYjwWTjJj2PHKnpB+/fucUU/0KCJ6NBd7XASrU6jKdJkpJ6Co2GtH7anYlBTJ7lF
X-Gm-Gg: ATEYQzxskE1/IEz0VLrZGIU/TDieCGiE7lyd4pPqbCB3zlio/1BF7BVXOlcf/loQjCR
	28CSbS8Hs5zfD0vqoy6my0FXF2g9Ep6Alxi2aLX+P5LiEKaAJR3eSOyHuRB1gu+2KNmdWHtYMOC
	lZyDJepwPyGaKxiSkayWXAuLM2kjWdKwSPOKNzxLldhXFlKLGCb2G4D36VDS4cUvSltFK4qe39l
	sw48fFRMKdXsLPh3as+RiOYzn4UCGfN55Fkv6bvu6mavy7PXKgk5USqTLCiQjH/0/ALPXOWsxpp
	DENxbRkN4FKt6pQ4YDNrR4capDq6/NsaYz+iPDut4Sqndn6UGxRk7D/AMILhGtAKus4MhUY4GUp
	4yZnxfJYipLWhJa0M2Ies/y4EPHZNEcKK1KXwx0HcsyvADH8=
X-Received: by 2002:a17:90b:4b04:b0:354:a284:3fff with SMTP id 98e67ed59e1d1-35bd2d187e4mr9885925a91.25.1774257500839;
        Mon, 23 Mar 2026 02:18:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4b04:b0:354:a284:3fff with SMTP id 98e67ed59e1d1-35bd2d187e4mr9885892a91.25.1774257500337;
        Mon, 23 Mar 2026 02:18:20 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:18:19 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:47:54 +0530
Subject: [PATCH v4 01/11] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-1-e36044bbdfe9@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=2604;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=ZkSKYFbNGjak0Dho+sw2XFyENeFl4F9edtmWT5qEn8I=;
 b=3ogJNiFMZD+SsmLzmxVbrbnwcmwDDcXVV2MpBtJuZ7PqL4ZR4j9qyX8pHgxnnjUpQcLljmBG9
 kiHfJkPAbWTAAnYi0vsijUZYjfStyZ97yHZSTuEpLah8Egi4FW0Emrp
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: jaVi0V280AMuYPaTY1Bddq91hOfWbZFa
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c1055d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nlf9mDh_Z9TmLa7YYksA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX6qQGBuz1+DGQ
 AitvogvXf2GpVQAyyKHePjwUJwKc1e3zvyiTiyHjVgZjbmWtZgQrUQL41LCI0j7j2EZ2SDCHrg9
 MEGQCotLjqevz8NLfMSxlEypt73LNiGMDU+ujClRGQkg1QpQ5ThOtwcgN9/uJ83fFk2SvuAEYDq
 gUzyTiHvxpyyIT43F2TiLpXaXgeIhZxSxPtYHA69kWPGhnjuUpChtKgFGXA5pEEqLXuPAHLGqpf
 GOmkpgC3qf7mwOPZTqRvm32Z/8zXpyYB5Ksw5XRUzSj0UXcTYLFdjdtWikNrCArfGy6JfnUVStZ
 CrSayT7plZLsUik03zjzIxnr9In1ofGWWu6niZqOGxdl/HqVCwvWRn/SqIxoo4wF6pl0BB02cLa
 NksdXGt6kVudhM4MmM6ICPzidrzV7OFKdJe9I88wPE1EatMmN8o1imuiUZy4+rMsc5AJu1mTXS/
 YCEcPibE/lWkT0KKhyA==
X-Proofpoint-GUID: jaVi0V280AMuYPaTY1Bddq91hOfWbZFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99140-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F5FE2EEF73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DT bindings for inline-crypto engine do not specify the UFS_PHY_GDSC
power-domain and iface clock. Without enabling the iface clock and the
associated power-domain the ICE hardware cannot function correctly and
leads to unclocked hardware accesses being observed during probe.

Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
power-domain and iface clock for new devices (Eliza and Milos) introduced
in the current release (7.0) with yet-to-stabilize ABI, while preserving
backward compatibility for older devices.

Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..ccb6b8dd8e11 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -30,6 +30,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: iface
+
+  power-domains:
     maxItems: 1
 
   operating-points-v2: true
@@ -44,6 +54,25 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-inline-crypto-engine
+              - qcom,milos-inline-crypto-engine
+
+    then:
+      required:
+        - power-domains
+        - clock-names
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,sm8550-gcc.h>
@@ -52,7 +81,11 @@ examples:
       compatible = "qcom,sm8550-inline-crypto-engine",
                    "qcom,inline-crypto-engine";
       reg = <0x01d88000 0x8000>;
-      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+               <&gcc GCC_UFS_PHY_AHB_CLK>;
+      clock-names = "core",
+                    "iface";
+      power-domains = <&gcc UFS_PHY_GDSC>;
 
       operating-points-v2 = <&ice_opp_table>;
 

-- 
2.34.1


