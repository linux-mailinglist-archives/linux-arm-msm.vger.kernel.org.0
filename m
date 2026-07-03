Return-Path: <linux-arm-msm+bounces-116229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hLT0Fy10R2rVYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:34:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D4F7001EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:34:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aOmQVJto;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zce1hbjX;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116229-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116229-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55D7131471AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780D1346A13;
	Fri,  3 Jul 2026 08:25:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7F3433E9D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:25:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067149; cv=none; b=Ncf9bvv4hLj1HSX77uESckjByhyltfrhFIluwWW7zX/GqN7z24Itd9xBUu/36dFXMXhpGMaEwmciLtAQ7hTMbmTsEj2YNDvXHDcF5+PnyaDT+7NgZj+mLxnNiMu8jwbb9Ih5MCWtZMXmngHC0vik21mri1o9nEKPxMb+8FAXwd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067149; c=relaxed/simple;
	bh=Z3lhZcvTy3ChvwrsZwjryfnqt63yUqro+E8ba0wENaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3bUl2Ejx1yuZjVWd4MKwxP85CqnxoCdgNMyfUDrGkeFjinKuNRBdaTyTbJwpRj5GNfUAomqbyjqjRFKC4QASu4g3v6yxXaXGgeEnOf78lfCnAWNSWbxKDr2c8R0YYYWmIfo5vhzpKGNWYiRtmeZNA+T1Mcm/oFgQxfkBx0KP8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOmQVJto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zce1hbjX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rf232994887
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	muNeEPc2vpjuOsLjLd4zSCfTUU2sqAB/F6JbZI/i5BY=; b=aOmQVJto31isSbl/
	qfWSCSG3v4pXIhUSvwVqonp8Bmz1j9cuRdqmxS4psUVlFW0PRqBPDaM3gKX2xnh1
	Wy3Yk3C7HIjgzWSiY6YXXWFtvnbEesF0tpihjutQH59EGOpmK7j0ogvneiwDaRAK
	APiOWv5eTiehuu4PnsctkDnksfjoqs7m8HKb6blH9VtjtI+hGZBziym1ZU2drAI2
	UFD1VJAtNkR0M4IRQtfJc0mJs9w/OpELHDBXv/6uMssVVNryTpuiW0FTR5Gff0gY
	GBNWRDn6daL/UbZFWP6w05ryR2JNjRCcxmoO58LgXn62glh2mI5TaFoE+RE5P8VD
	lSvMwg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1eed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:25:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37c9127e316so690475a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067146; x=1783671946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=muNeEPc2vpjuOsLjLd4zSCfTUU2sqAB/F6JbZI/i5BY=;
        b=Zce1hbjXCA8VTFqoCjM8EHBL7oSKg5qkOkevTipnjilzL0Ak3b7EUOX7pD+mGC3TVc
         uXHrKWT1QettroPB2CyPTpuOaNfteTdOvgRgZ5gLWZZ7x0tNoHzvh+dwNlPn0KpgEE48
         a0zW7WsKQ8GwXpkqaMQc5VQakt6aLz/2M5+U2qkpYWH9ZqtSVR8f63NqrqtU2K6DRhTB
         sBgzVWUKYSIkf+BJjNPDAQwB4ke/R2RMRL37lDF2gDL4H1u6Totrrh10tasU+EVtcUQ+
         6YxOkQAyL8xist1nP/fEZe3KP9RDjrZX5SdLZH2QdqfGh3QKyC6rqJzJSYWPJu6ztjHp
         LA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067146; x=1783671946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muNeEPc2vpjuOsLjLd4zSCfTUU2sqAB/F6JbZI/i5BY=;
        b=DdcMFJvgkC6IUfGbhAJ9X1sbyMyIJX0We9zSlEXiXL0a+JwMBTyyhUbLZHLELqKBrf
         Cyno8vj1lNjyO3ou5R6F8ewP/ZPuNB0CAXaTHIVWLKjGaqf3CYj4pGDfgBQgZKALWFpC
         HiRCt2+2NLDk3Amn56rWiUExgfm1qlmVEMdqtnZUZV/TVh1y/OOIfZ9iQm+Tw+PfW3n6
         /FV+vEeRxtQBxg4BXUtNih9RwGIuuKU+qMasuuABZBJY0oiAD3nLq4nhiouCAnpMrR6I
         bllgJxsVIY0jF4LgRi8QIiWyyEikeP0wxkjs0dbZxUBnY+dIf5kyWE6qKbhHbyK3IOAU
         kniQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFC6WQq9K3jaF4p0X5AX0OugiLkHU/47FwQRuZJTdO9BtvWkesrcaJWCUmhtGpaOAb8PBe8ZgCdfDdNIvu@vger.kernel.org
X-Gm-Message-State: AOJu0YwPWIjs8ojhUW6M518D5TAOzxSF+qvbaPfyk0q/W49LBBmubjGj
	XK73Y90DnH3ns6uPcLyn2xVxD8d5FAruT5+aSNTWLS3LeL9AFB/wh5b7jv/2ls8xg0JTQHThTPv
	+uSXAuGA1PxKgyGfpH137RGKk8h+mQWrFDpRne2uDfzfcRicaaBzegcG9Z70J1T7GjOS3
X-Gm-Gg: AfdE7cm7uBZ1+o4wmYAcaov3Jy7NKldxnRS2nohJFwo+BSMa+gaKTOOtgyqrPrreO2u
	uuIBu2mTHYpBV/Wghkxui3P03kkl0qsi/5AaIAkKU46tGwZrDdWcyYn552Ur4jNbOF5N6G0F7yY
	Znt8z/geCctyFRCtVswA56QcArgySmZria+vhSr4Jau47KRjqAoU5oFhrmNwPVVCgFq+5IkU2dH
	/k+zR9YyIoiFb+QGsI7chMk4AWYilhL2TDjD2n47Q6wLxi4Fcg7N4U6AUfOyEhWEwR4w0eEQPNt
	h0bQ1PK9XXCI2QqnoET2nIPn7hHx8RpOWAXXMlHZT9obtQ6sueSVR9pqbgcEL+npKBvJC3e85Pf
	S/berXWg4TLuX3c1fl6CCm2QK5Km57HdciTgseoqKNxE=
X-Received: by 2002:a17:90b:528b:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-3813b5d35f1mr1237831a91.1.1783067145699;
        Fri, 03 Jul 2026 01:25:45 -0700 (PDT)
X-Received: by 2002:a17:90b:528b:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-3813b5d35f1mr1237775a91.1.1783067144955;
        Fri, 03 Jul 2026 01:25:44 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm30312280eec.9.2026.07.03.01.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:25:44 -0700 (PDT)
Message-ID: <1db1de13-385e-4b9e-b18f-f7035f1b58f5@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 13:55:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: crypto: qcom,inline-crypto-engine:
 Fix legacy/new SoC strictness split
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-1-66173f2f28b3@qti.qualcomm.com>
 <20260703-nice-beetle-of-efficiency-eafad3@quoll>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260703-nice-beetle-of-efficiency-eafad3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3OSBTYWx0ZWRfX/n3YCKO/ptxF
 +UiIlZOpo3K5hTIQU4S9J1Vdc89iH6e85wTu9tTiwI+rzpTeKNW9ZceV3aBJE2Vk3v49PAUxKVN
 GDVRPfIa3wMjoFRMyLFZgMHQh8b5iRc=
X-Proofpoint-ORIG-GUID: JL93quABLPMzglTPR-Udg5M8ke5BAaQQ
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a47720a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QthcfW-pFkhp4WIqV0YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: JL93quABLPMzglTPR-Udg5M8ke5BAaQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3OSBTYWx0ZWRfXwHsE10ddXljV
 occpEU48k5sOWocNlp/cwQMTIyUkXG2wr4af5iZACbZh6oEu57RVZj9rqXVyFmS+lquXpwBXWle
 Cu067s31bZ9CyLR1nH2xD2d0NcoAEcP6+NFeTc0RGNeZumdj5L7qosbCuyiD2EGqFt+ok1eW1kL
 dauxTVeQiTzQChdh2n0MbmJh7izLNpQumBYkifQIMWl6ttNtlWR5dXciibbg8yF9Opu86xq2aoe
 yShaYEbNokVnzEOVpbAqnoC3sf5loG8EHhaN6XD5QEon8Ji0XrOvsKzxakKVo7rPWoqYCx6zQe7
 /fN9+xtm2bNiaKk2NwS7MKo7fr0XNS+DMmXx7FLd44j0FDsODqGzudBsyapuRtVMwhK/OEZm6ag
 fcAR5vvi5YD30Y7lmmZUSY3Tl76nuidteb1cK8TlSBwxVJd2ar6YXY7+dQBoHrESTThMXvUFnG5
 O3w6rEhCVYYRWun49ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116229-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: C6D4F7001EB

On 03-07-2026 12:21, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 01:47:11AM +0530, Kuldeep Singh wrote:
>> Couple of already merged SoCs describe ICE as single clock historically
>> which are recently updated with mandatory 2 clocks.
>>
>> Keep only the known legacy compatibles flexible, and make strict
>> validation default(of power-domains and 2 clocks) for all other Soc
>> compatibles.
>>
>> This ensures old DTs are valid while ensuring any new SoC (not in the
>> legacy allowlist) must follow latest requirements by default.
>>
>> Fixes: e27264daac7d ("dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk")
> 
> Please drop, original codeo was correct, no bug to fix.

Ok.

> 
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> ---
>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml | 23 ++++++++++++++++------
>>  1 file changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> index db895c50e2d2..4f3689a24410 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> @@ -55,14 +55,25 @@ required:
>>  
>>  additionalProperties: false
>>  
>> +# Do not extend the list.
>> +# Legacy SoCs are allowed for single clock.
>> +# New SoCs must provide both clocks and power domains.
>>  allOf:
>>    - if:
>> -      properties:
>> -        compatible:
>> -          contains:
>> -            enum:
>> -              - qcom,eliza-inline-crypto-engine
>> -              - qcom,milos-inline-crypto-engine
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              enum:
>> +                - qcom,kaanapali-inline-crypto-engine
> 
> Your change is not equivalent in relation to hawi. Please make it
> explicit in commit msg - all devices which are fixed by this.

Sure, eliza/milos/hawi are non-legacy and will adapt 2 clocks model by
default so will update them in commit message.

-- 
Regards
Kuldeep


