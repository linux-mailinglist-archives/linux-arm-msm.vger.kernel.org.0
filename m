Return-Path: <linux-arm-msm+bounces-119003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FcT7JugKVmqqyQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:09:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0588B7533A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:09:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cMxlrDUu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ftNVt4qq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119003-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119003-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F2BE31631FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BED3630B7;
	Tue, 14 Jul 2026 10:06:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD90B363C40
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:06:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023574; cv=none; b=lXjJtmqiNOckLofkhjygIDKYDCbBQ9SLlRcM8DkohIh0bQMclmHmcEEZ2V14thHAankAfMhGmpB4i/8NLAn6/ML8xRDAYBihmIxCkK4uxQS2u5WJe/5AcgNdaaiECbiltS3k1+053LOKCLxNFi502xW1NvxP63gXRQNU7Sjfwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023574; c=relaxed/simple;
	bh=UoSRo1GW6MYk2CQkM+hrKXykAmZ+r0PsRTTvloWVEdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpsEkPk1ZP5MjZnPpbTdbi0zkalImkpmUwfWULLjglC93oF36qXqdyxVVEJSN2O22oncQHoeOthiJDkHQQFFxPbgm8FG3YUshn2ERH1L1APKuMy9SCGUYoX1Ibs2vnHKPr+26mnT0pAJcXQfHUQEs4zMr7vkxwhnp0dqoewzcM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMxlrDUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftNVt4qq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SQLh3625126
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T6ytOIDKhwkP2y8jVaN1ZuW7AxSttUCjFdaRma57k3Q=; b=cMxlrDUuEEEfhQiR
	xftx2pzAUcDNd4SpwQMFGiO0lAP3EBjagcqcMMHYgo1Gdcjlw4oYsFX/q0/8mg69
	Qc493r/zU2IBvMbja8P+SQ+HvDATPSodWNiSCk+MmDCbmpPvp1AaSyvFgCJJuwha
	7pkfpMXStKn2KBy/r6w3sh8Q4vyddf0rtVA1XNgMzmeMRHnV82k/CfdKO3dom1ly
	I3SlQ8W86dVwKnZTvx1h1FHw2Jfc4vCkG3Xt5/IeGCe9/4GOmIse5GzGmRUlJx+C
	mRc6rgrmBF59g7gvFy4QwnYGMmKSnTKBwRrcQxvNqxVsajUJUP7Rn2/ep50wOOE8
	sMLQ9w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdesa93r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:06:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce8a76df2dso73892065ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 03:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784023570; x=1784628370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T6ytOIDKhwkP2y8jVaN1ZuW7AxSttUCjFdaRma57k3Q=;
        b=ftNVt4qq2AmWMuzAS8jRQeBXjSdbpp8cKU0ISjLVUurcJOwaRQwexcA08L2L7dq3vc
         tlUIyyT8ycZhvWc3m9SidzwElswAPl/lrpxVxbXktk4yiccfhF6+6PomowWhtKvbbOQh
         9XN46W78dOGTrpWaRJ27SigwugpCFUaMVedXaKu4BWdZpjcCCtmfS0pfUSE9ZDjrJ4QE
         579n8abER9l6qi2da7izk6M09F7DamcZU4YaoTZU4xCbQuEfm+NJj3rsBaTSl2vLlK8T
         pzDzAzO9TGpqjPSjLjWPCdeG/g7nHPg8tJlBZSJDQV5IzTPAg1QFN3M1Z2fupNwgwyEh
         BK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784023570; x=1784628370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T6ytOIDKhwkP2y8jVaN1ZuW7AxSttUCjFdaRma57k3Q=;
        b=qROHkpxXXAUNiaXs0E6D/dadBnNJUFuqpLWM3FTVBltnTFwyVJ/N0JUvzb3O6fgbRX
         lACoPp4e71Pd3EZ0cRffvE3KXcVTCwylL1NyFfC+FuopzbPXxN2+EbctF5iF+lwJlwTe
         MvGe8/8KQNgJ4+hmFhfFlGwjBMO7KypveUCDf3viYVGYrgPYanFCzyvyeNZKMBUlgzPa
         LPvWKsy3tsj9wH3OsmO9Q7hN3C8q7pdisP59d9uCMKLTZe7lKCFWcmp1l+3oLstuFJnx
         KLp3AFq7bctQ1xWl/I9F5Vop01ADej1hBU9HhRwqH4CbLwpZ6ufQGMT9/9IXK25fVK2w
         DLGA==
X-Forwarded-Encrypted: i=1; AHgh+RpKDhiX5Yf9Tpws95opgZ7If0ITh4RSaAbb9w0EMIrkJrNOetknJewt4KKgqlBpgC4XOsBlrCERxrTm5xmo@vger.kernel.org
X-Gm-Message-State: AOJu0YyMTE1UvN1io01b0D20aZCrzXA54edwlWX3dTtkmtXrHgUsgAve
	FP/ga13ES72sKyiZT08MlU5rO4RKeiKa2x5l6dpy+eUuRPWOMpau5tmlowrCd2/IQA7p7x0uKOS
	5XwL8TL1XT9H5x10f5vgv3k7jP0B4Bv0cVM6dt1Zpf5Dk6uW/Bi0JU1n1LHfhKSzA6Y5h
X-Gm-Gg: AfdE7ckDYxK6uRGvd4yaxVh/x/K0NNfI8lfeCh91acEzqSgX1mFWtsqoduaLrKCWPRA
	9eCC+oHwRZTpdMdU9PAkakIh1NrEl61GaT6+GvWunpSwH5pD7sNFJxZewtNePZG5zkefTNzksp2
	OliA0+j7mNrsupoJad3zLDbyeL/IfyDvkKK6N/OKR5U5Ga62CWvrJOa8lndqc0OXyxBkw+8TBpf
	29fz9OqFKF0TWbzty617cOn8cl4xxZwzpqH8pjOEP2boeVwQ0D9ZLYOteFnWf9lSSi6OwrZoKBn
	htazAcXPrb59RgXefQWZuKgCmjn732tvggHvSig9v0PKQ0vazx7bNpW8+re5FMes77jiRxJ/Z/0
	L+/krakehIE2FbCmVvvczchGwP5Ce8hdUfeJgNA/KkNaM
X-Received: by 2002:a17:902:f70f:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2cef11ec5b1mr20322935ad.20.1784023569921;
        Tue, 14 Jul 2026 03:06:09 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2cef11ec5b1mr20322545ad.20.1784023569452;
        Tue, 14 Jul 2026 03:06:09 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm112653485ad.19.2026.07.14.03.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:06:09 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:35:16 +0530
Subject: [PATCH v4 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to 7
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-b4-shikra_crypto_changse-v4-5-06a4ea97c209@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfXxnWn06YkB7hJ
 U6gYz6i8q4tLg/PNsovz+nc7ZjdGBE79/NXPKx3A9U+TdcGXx7D9vfxTEPwjIhBrFK4olafP3mn
 NSqrOJvt77nTWgxoVM/0rz9Ma5amlHs=
X-Proofpoint-GUID: STWdGu-W-afWf__0RvvjewoUh-QGRv8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfXy2UUjO/BAjrS
 wVRO2P42HfpKMwFdtA4qC7ThVMLOdObvK7P/O8MtCw0kxePf3p2tWhS+Vm+O+UABGqafheTE7mG
 Qxlb9cezL3sW87Cfs4nlyotTY7rh3niKAt0FU2yN081gb28GBuTHfZsHshzE6M9gHV2Tn6ESvEY
 ngDVyajhNxnNSIw0pPEhwwil1UmNHT9XHIJE+3bJWDgyu0jR2lmghIJwc5ScqbH79ODSmZ1BSG4
 +bis6sMU3FDp5dHFzh6kW1JUyjxmdj7MMSrQfh7wx9LrJr2EmP86mlqvMbm6tdVBU4ZIK5frWAS
 WhZnvlk/C00QS3jMfPJJv3XvwN69k2Jp+khHfTFPLlcdP4LaA6YuffchVkjQd3ZX60DaGZWTqi/
 a9LuADH6r7XhVhZeMB6icGwEP9xvxFYEKqCCW+lfZ7+uvxeiB+QznPEHYwoaSpvsqHzypGEsDXx
 0rSpmna0OaDXHb/A06A==
X-Authority-Analysis: v=2.4 cv=PZLPQChd c=1 sm=1 tr=0 ts=6a560a12 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h8YGW4MSmiDDVbuT7RUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: STWdGu-W-afWf__0RvvjewoUh-QGRv8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140105
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
	TAGGED_FROM(0.00)[bounces-119003-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 0588B7533A7

Qualcomm Shikra platform describes the BAM DMA node with 7 iommus
entries. The current schema limit to 6, so update the binding to allow
up to 7 entries.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


