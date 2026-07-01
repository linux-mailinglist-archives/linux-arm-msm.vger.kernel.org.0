Return-Path: <linux-arm-msm+bounces-115789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HtnQMYx3RWrxAgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:24:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 296836F171F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:24:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dEJPQP4I;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DyZCzMsb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115789-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115789-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC7AA3151535
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5620C3B776F;
	Wed,  1 Jul 2026 20:18:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B778395AE2
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 20:18:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937087; cv=none; b=W7paNg2HNOKpchRb0EN4mUoqP1cQqQmzcdO3SPMMf/viInlyCs5LWLl5eCHA86Jq62xVYSwDr2iWtg9yBseREEPPaOWiJdTYZsyh1lz7h35aT7rHEPgUlbuQSDl6pKZOE3mJW6Dm9ErK8RXHMSA7AF0MvXAOIyd6psTumjfd9MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937087; c=relaxed/simple;
	bh=Eze2ioRdq2rIO2XoIkqX6nNtdm7cYbxnuQNbvnOoajE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwwlm8C5oaGrDXcEC4NmZ+kyYFRZJQCbaYDWh4UQmXoxn1NsfGC8WMLKk5POOagF1Epxfb21mqrfe4a0yA3NnYvYWbhMS676ondZqIyt/pWrNDRdrKjVCGeGcD4JQTUx2dx7uGmDTNluRLSDuEwSdWBU6p097brPZHNd6p8jg10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEJPQP4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyZCzMsb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gme0e1730616
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 20:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qyrH2W2sfwjDNEPGQYVoT+aVr52hlGBGd2sgUDya5+k=; b=dEJPQP4ITFS8647p
	h1fmsJ6dgeHyDHH0+enPUAWqOCeh1Yr65C8UKnFV8p9o79BhLpbdUvmaurmgO7AY
	DPpkoYFpIF54KImEGqGKZuvM6enoLDQ1kfpnw7mzWtN+1Ts463yYTdLEjGl5SGi0
	bS3bEc0yTsCkStI0rDPtxUm5TLuuv7eGq50XB2VQ4LhtzJzsLtkL/k72Q7PSQgGw
	Fgc54XSFKcWFbeOmMBFbfbcMQzv29pn9KbhCkGOUpRJSJrKUAB6dgRn1h7zBXGMZ
	9wZxbv1C2RX1v10x5uFDO/J/BYWwz0riN6wZY6CFXxdS1gwJmTIfaSTJB5FpxSkz
	sGmYew==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ajfp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 20:18:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e17ec1940so1138311a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782937085; x=1783541885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyrH2W2sfwjDNEPGQYVoT+aVr52hlGBGd2sgUDya5+k=;
        b=DyZCzMsbFma8dqvNj9z6kgZ/tHWOVe+521VBvxU0VKMTAuJFA/94MuNMMznwmqaULP
         16J+nT9AmNr6Iw7rI1d2R8uJxARP3v2QlWzSx32UF6i7fz07YE+ZGqvyVoQ4P/CAN/h4
         kXW8eM293iERZ5y3qaodbNUykufBM5U4beVZR4T4fM+TpCFpkR1paqS2WNGHOFmZtAXu
         DMWEKXvvieYUBQ1SfBjIUsom0f988yvaTk6ZWZc4ctp8XF9+CHveFacEDgWuRAy/4QE+
         /oMklyK60R8LkuueaSggzu8I6D/j00ubvjzesEBQjn7n3kROy5ey1bkq8bk1l98US12D
         YZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782937085; x=1783541885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qyrH2W2sfwjDNEPGQYVoT+aVr52hlGBGd2sgUDya5+k=;
        b=Bi6LP3JQ/d3xInqccV395dTfl+sI9b6fppcTizz0BG6GsehPZERZGYV+Cb5cNcRi+u
         e4mo6JXwpGi08N/Tb9LMjMX7z19tna+QTgDXCBnyoWk3Qi2KgzKrG9VPb60whu/gSh53
         kTgvy7tJNF0Jma/u8IPIqo3GQItwEVXPQAn0kjXeRsCd23brK7WA08Qus3Tp4N3TOSsj
         9g5kMI1yRfHJok34Hern0TEfz4kav1aJAa7kABjL2CHI4wWx28DdJS82Mfe85UHxa7kx
         E4dmip1DnrHphWzlVj8MpV60/xGbEP8/gl6mf8qPhbrsDO/JalP3oIFfI0M19F0Lm8zT
         QKxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQPWcnJQLc95if1dnGrOcLCWrSl22HbjmjunryIzhmed+yH90XQB3oOLdzzSCO2Eol7IamEZeCh09Xrvzz@vger.kernel.org
X-Gm-Message-State: AOJu0YwYi35zn2+iRodPmTkl5ZCJtJkD5/GPMXQHrLvue6N73Hjv0s6f
	VToFBLgweYTuaVB1gvDCwmmpl1iHy2ZvzO2tB9rg3lyL2DY+acTQpWtAmdFL3sP6vxRa6OYZ8RT
	Fk0vunak+WndFYDlPvTfX2qR9sEYPkvOpA41SjtSuuqyxx2RROBBVs5apinw1FslDv7SY
X-Gm-Gg: AfdE7cm75taqy7xhhKFIx1cIy3KLVOdGcCNvEuS/1WCZPzhl055SVakNAp2zRckMXj6
	iOII0CF5aCGeB5xu9Od7PJ407B7+TMXd8J1lLZ8LIeHj4c0AYqcb4r79P3ztomPfimR0+sATEN/
	eLcq/G1A3zGgPZGFgk/XbnDLBFxQidtkj/cx5iumLFge8BKuPXZvjSoyCf9yLDhJ7PVKcU9OlIv
	twS4YL+GZyQ8lgqe8xGa3840TdB3dFwifgbXJho2ZCxrtNnwTr+zoWvyu7+AOmbdCRddUd4dUD+
	xgUxlXZRV5vRZV2t1WA1wpqW7vqfr8QdvY/43mpiqfApM1gQGhEKm5IUQTv7PhW98WRhzKt/Q9k
	B3/yRM5RL0n5jOr8eL19gvfNvCR0Q1ws/ja1Qp3K3f6e5
X-Received: by 2002:a17:90b:1fc5:b0:380:a5a9:7586 with SMTP id 98e67ed59e1d1-380aa09529emr3080998a91.6.1782937084654;
        Wed, 01 Jul 2026 13:18:04 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc5:b0:380:a5a9:7586 with SMTP id 98e67ed59e1d1-380aa09529emr3080968a91.6.1782937084168;
        Wed, 01 Jul 2026 13:18:04 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc79231sm948685eec.31.2026.07.01.13.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:18:02 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 01:47:15 +0530
Subject: [PATCH v2 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b4-shikra_crypto_changse-v2-5-66173f2f28b3@qti.qualcomm.com>
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
X-Proofpoint-GUID: 4_siYX1iRARb2mp2Pia4hC3Oa2NrwO5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNyBTYWx0ZWRfXwVnfoiVymnj5
 sfTjMi1TZ13cjSfF3ePWJipskcRQwKUpX9kc6SLYGCe1louPJ1quj1iMibd2u1PQUtZKehTvuJc
 6LVFNPOKnjM0uqV1khyMsviTEd3NmKCYMnxzwg3brNzYIL5zjUA3i1Ak/E2/9y/O+RzF13iH4WI
 +fFZMqgrMmndCyaDxqnueKyjcLXq3WzbnL9eZrcA4aRA2rUwt7a1YtttukePz9lorwGBPYRDc5y
 HKctEDqjwie0hEoh9Jy6nhxegG3NW4DyoNxEuRrJINRevzYhSNkpzLeME7v7G/ah/5APUqIJ4l8
 1RS1KXlWwlECV0sCyKGqNr4M/5MK4GmrMXDs4AwLvgitBL/F2dX2vVQRUrPiqF11I2AGM9bses9
 Bt0hPVkNxSm0g9jKv3UH3ieGuj4ZEmdEcOFj4xXZJ162G/nwzUuwLPiH8R8xsafO4UYj7b5gF3v
 vKCnCjrvGtTngS8nM5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNyBTYWx0ZWRfX0tV89I3j8PUy
 hGthK1ci9Q8fPvkcHIEw03JJwDBAmRTjYXtEoCXaQhmenotFrK8Rkv0uJIuhI3R3UCojv/CtHae
 Z51l6d6u7spOx7VXXGQG0gU8FuCja7M=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a4575fd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=SaiSOrgfs3erbmmhS0kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 4_siYX1iRARb2mp2Pia4hC3Oa2NrwO5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115789-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,devicetree.org:url,qti.qualcomm.com:mid];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 296836F171F

Upcoming Shikra BAM DMA uses 7 IOMMU entries and not 6, so increase the
`iommus` maxItems constraint.

Fix below error:
dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[25, 132, 17], [25,
134, 17], [25, 146, 0], [25, 148, 17], [25, 150, 17], [25, 152, 1], [25,
159, 0]] is too long
      from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 0923fb189ada..e72adc172af1 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -48,7 +48,7 @@ properties:
 
   iommus:
     minItems: 1
-    maxItems: 6
+    maxItems: 7
 
   num-channels:
     $ref: /schemas/types.yaml#/definitions/uint32

-- 
2.34.1


