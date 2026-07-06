Return-Path: <linux-arm-msm+bounces-116777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 15f1L8WxS2qTYgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:46:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5955B711719
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:46:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="I/2Ep4gQ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xy5F3oDj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116777-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116777-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D87E327E979
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6497423775;
	Mon,  6 Jul 2026 12:02:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5407141DED6
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:02:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339328; cv=none; b=ok5rUkHzugzMaTT4V8aOoPabsr7AXVf6s3izKZANN6OHZ7MxDXRdKahUF7P/qZ98wOeSpfcaJBPBfcwpAx5eJSDK0JCDY0z3pGwlHF/+qOrI0dUEWLDsfZmKaSR3B7Akg8Z4rKuQ208SPt9TlR/lTfnAgRiR75l48ARBA/ojrGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339328; c=relaxed/simple;
	bh=ibd9j0TYhA3ef6VnnsN6ZGeTU9TDGcUj6xKZLhqifXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dXJS8J8u0JoBMSxr2KIAoHLbI+WYKSNfyxxf6iIeuzDOvbzEI8bdgRpfrUU8uwBEeqiL2P08iTD9yMms8IXQZFDoan154xthLqPo6wE7YO9Ijomho8jPhBLVEpDNskVyJhWwJipiZAyM0ZZvrQANR1OzCI7mnbtLtl7yOC/dSLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/2Ep4gQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xy5F3oDj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJVD361440
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRfU2tL6xvmoxRw85U0zq8PguQiagILdyl9QqLKfIk8=; b=I/2Ep4gQUtfyQBSC
	nORKngLwgB1B+83CKEG+wcwb9jvwmBHNmIfUIblF8x1PEQjfL285Evu1KUJKFCW0
	AbngmzoJhZpN2c4ApkUIUtmo5G9DSL5wa23P8qrrsTNcjN9smIuhNcPD1nJXk9uo
	6vx4+uwOb8S2lJG4siYDCb5fp0QiUtC9j093TpUpgjXkboZR4CKZ9xcXkmuXCzbF
	Dd3eB7vHVG8W4FsoOpgvL0R9oiSDb3YK1X/He5a0ygbw6kxzR69Jq04TH89jQaKM
	7GiXmLM7Y40fi5NV3TauLMjysN0vOLKWPObi70UqokqQNi4SbhvDItv4tbtg6lUD
	4eKt4Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h50w5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:02:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso4697647a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783339325; x=1783944125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jRfU2tL6xvmoxRw85U0zq8PguQiagILdyl9QqLKfIk8=;
        b=Xy5F3oDjAdTItVz92uytkiIMrVerfeTgvmFQ0OxMPZCdwL0L+p6Md1WVg1AzDf02j5
         LX7syI01VqlDXP1zV1P1BM2E+tE0nCpHe8lkwsRu/KkwMaOnGqF2ewrcsY7NqXK8BzEF
         ZoBMOlE7KyY3HijdU6qsEmIw8tGT4FdsCi16tov3Da/0QWQ+PD9+nE4Wz7Vu2cveuz7U
         fHEcN3acEFW2Sn9c2ul2CcvdFSJ2RHJrbS/nQwtNBtRLCLRM5DV5e1MAtNaTM2tUot73
         Mh5FyrIBNN+bsVPZcbd2HoNV7IY87iHxEOw0R4+onFUAu3UqMun2AF59YVYXArHjMsWQ
         ATAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339325; x=1783944125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRfU2tL6xvmoxRw85U0zq8PguQiagILdyl9QqLKfIk8=;
        b=TJyRfPxnnxWyhwW1O4jirVoPWqMfjH+JFFJ8E+xxqRd7uZEA7SNFsk3iYnNNaq+bR9
         2VXiAQWKYEuXP3uO69O1QJzQ45bgx2eQj1X8HAKLwSHOOM1o/Kb7kE6onJz5TqzH+nrs
         Xethxo9aXlTQ4r66mgo8L8AsS9BCTXZulOUTKseHqogFDnni83Oc7NjZHU2oqueoa8eY
         q+EUGkx/coIwFOcCzANqESWR0EYGtV/lUnC8yW4jZLoJAxkjOI/WQ7o3NR0V3P3DOQm1
         9Nn0Tzx7DnqtUXsSz8PBJyt/s8f2KkHHyXlfS9bU5QNV1HMq6G4HmwGV9BWmo4RiXCCr
         cI6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqXDVzIon8IV2/If0rm/XYYJ7vo8WPNO+NaKvcnTwZKPldgxLmQm79Hvda3Bh3qCAInoA6czz6/G5ZGD8fW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9JMCbosiq9Xw1SbAehz9uAWmGfvZjeRbLSuSolFT1JL+l6Awl
	H2jShhVV2WVJk0BvUjQR7/tlxQzwsOadW0WpMm2cMCF8LrEI7Yct/2mfycSIQiJ19jSMTBcwvf1
	fIGmnUBMcjEwzexkIEG6gwk66ktCZNqlsIAqQban98Yu0jXjum9ob+dictRN+ZtrUIXft
X-Gm-Gg: AfdE7cngaUh2IAEWtKMtIMLmHhfMshBxjrkOnBdMWizgR2xokecWTmRQz0YFbOs8xII
	B20EpPPyL5umM34LYvq0K7Y6KEfcp3oGiI81mG4N9JIlkz8owX3X0ix10wvyboJHvchOJcVC0hg
	3OxqWhzFrX2DfKJ9bB3CDORZpM1NCCZoVQCr/W2i4bOn+7tBxaKSGiHkWLbAliAs6vGS8Kx6wu0
	pJk1mO1sluTWkohcn+gWAF9Gn59UBEek/mNS+0yQpWj1p4Dlv+sctlJRdpJi5JXJdzPSswXgZIS
	C+IjuDAx5qI1iTNEAKD4xjj/yxIpxNh2fPHBKAR8gy3UytO0mZUQjd+y6Pf+1NWRjXFM9tKSYU1
	4Io6tB1WlSXQHCkld/LIo9V10p+sgl110qmmPWpxkHWA=
X-Received: by 2002:a05:6a20:2589:b0:3bf:b3d5:ce2d with SMTP id adf61e73a8af0-3c08ed5080dmr302728637.7.1783339325143;
        Mon, 06 Jul 2026 05:02:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:2589:b0:3bf:b3d5:ce2d with SMTP id adf61e73a8af0-3c08ed5080dmr302556637.7.1783339322904;
        Mon, 06 Jul 2026 05:02:02 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb10645sm6364018a12.4.2026.07.06.05.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:02:01 -0700 (PDT)
Message-ID: <4a2a6773-75e0-49b1-8e47-a9094d84f5ce@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:31:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Maili ICE
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
 <20260628-maili-crypto-v2-2-f8ce760f71d6@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260628-maili-crypto-v2-2-f8ce760f71d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MasRoASNDbVgV4GSqd7mERuOYLxTgF6m
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfXzNXDh8c6LXnN
 L4lmbwWCkbfWaN9LvLgYIgSPDXqCF/s3Mdw1XgU/ExcOYagBwNduSeJx5g+aV99k+Mhj8HiUUPJ
 pMRydtXCKk6BLuAtBNIbvKY0TJqhal4=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b993e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2m2jUygTAEm4Nlw8oZsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX72K4Qu9+t82e
 9a0yu8TQvw4PI0XNTGE0WzaYcscMi3snTDI0opSAolqwH67wStE0kTDVbLd+jBJpCadu3kKcjFp
 gGVjLfaliQAb5s0Vtl4OYzbXW/awI8bEaH2eMPA2+mXAmlsn5EKVdChb3v8rYgEXs6wcfrObHhc
 CuK+OZd7DpB6iN6YHtoWttM0VOPkKIuT2IcCbSLuZcYZ2J0k+s55KVpp19yIdsD1RP7GZDq9FZ0
 cxFSKNjRSxMv+J4+ftQhrZOnQ8/VqlTj1KWoEAjYK+cb9RseXzgyUVPnrBSPJgYE1p8oycYlHAQ
 TtVzgl47bnh39ML22VPDWBwIfFdnTaxoKp1mFbUMNr8aticVvtg8QGyrmZdabRLKuucH7a1yNCK
 bwf+YcF2AI60F6YPscBK3XY9/t96afFKBPbCvzbifR0T/2OwPmQiEuv4CRq4W0hqaop1X4GIVPc
 LA6/6KWLdPD2jUvxL2w==
X-Proofpoint-ORIG-GUID: MasRoASNDbVgV4GSqd7mERuOYLxTgF6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060121
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
	TAGGED_FROM(0.00)[bounces-116777-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 5955B711719

On 29-06-2026 12:14, Jingyi Wang wrote:
> The Inline Crypto Engine found on Maili SoC is compatible with the common
> baseline IP 'qcom,inline-crypto-engine' and requires the UFS_PHY_GDSC
> power-domain and iface clock. Hence, document the compatible as such.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index db895c50e2d2..d80f8445393b 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -16,6 +16,7 @@ properties:
>            - qcom,eliza-inline-crypto-engine
>            - qcom,hawi-inline-crypto-engine
>            - qcom,kaanapali-inline-crypto-engine
> +          - qcom,maili-inline-crypto-engine
>            - qcom,milos-inline-crypto-engine
>            - qcom,qcs8300-inline-crypto-engine
>            - qcom,sa8775p-inline-crypto-engine
> @@ -62,6 +63,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,eliza-inline-crypto-engine
> +              - qcom,maili-inline-crypto-engine

With below patch, maili and hawi addition can be dropped in the list.
https://lore.kernel.org/lkml/20260706-b4-shikra_crypto_changse-v3-1-23b4c2054227@oss.qualcomm.com/

-- 
Regards
Kuldeep


