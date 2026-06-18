Return-Path: <linux-arm-msm+bounces-113768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3uSbCkzjM2q1HgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:23:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 735D869FFDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:23:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RyGsABgU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WoT+dGSJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113768-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113768-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E33330CF503
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEA43F482B;
	Thu, 18 Jun 2026 12:20:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EEB3F44F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:20:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785255; cv=none; b=ZAN1lpmsYNpix9Sfu/BasQe6ktYkOwH7rr5WqF/N5YEGpvdMW+cK5pZZCIaRc2HgARoPjCynPWmZieG6aA4qReSgute6ETPTMzpcwjIeNomSKZdgeMqhcCEYrjTKyo+rS0C05orYeBH1FfH0vQte9EAY07dEZeldVpMVFh+HTRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785255; c=relaxed/simple;
	bh=GtplIB74PhHYyP/abkhb2MdhJVPsMdyuoG/lp950Tn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2IPzpW20BexBmA2ZZS42Yf7RP9R8OZUjbwQC4W4I8fXymMc9rci5u8hq/5R9I7sSj+bIctBullpGWVHxo16VnDUDnN19d0qCWwCWxiPJmfE5+oJxHyKqiaU/+ZgZHnUEmyu2CY8g42xKi91jdel9/N1tsM8/CfdiDrDPgDihl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RyGsABgU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoT+dGSJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IArgcr936336
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNC+MjdPQmYRBJXCHlLJ4FXMLy/ssZcMsCeR5gbt2lQ=; b=RyGsABgUW27Ipza2
	jzyUO7zjzepEd5wwzpJOkds+dUfMfx7iD73wPYnneAcZntBdqoxLZWmgHBxe1E83
	SDhbfDRmt+88clXpen/wvtV93tFYUDuV19LxCmjoh1dn5vEcJKUmspn6dKr1hoW/
	Fdm/1/CsdF+1KDoC1QezGisrBLetDc8VIG66elSfFStl0whIB0CtM3lel/fbBufs
	RsyBup8vktFHAv8MsMdsu5VxIiSAQSOtNUS6muxdW+c+EGBhhcDOUG2xMgwGEsTy
	rR0yfT+OKQxVWGpPbiiWgn2o1s1sCuHYo8AAk0iDAmMBuBh3DsRGGApN38EXtVaf
	1O5YeA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt545h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:20:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c6d4a825d5so63625137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781785251; x=1782390051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNC+MjdPQmYRBJXCHlLJ4FXMLy/ssZcMsCeR5gbt2lQ=;
        b=WoT+dGSJxaqVuRk23KIIJ64NOGm4OOnaCrEnP0enxOsm9dc64ssKwFCZ5O99lsZ7Fi
         uoieSuuvFaAaFZjX3nI53eDGKKpfFtF5zowXcfAhdmWZUhz3k3AOQZW36Asmm+iZ17Fg
         mBMBE4YiPhQNbcwtLnRYY7svjR0O1p+5oemZtuS/Hm/mcVIEKIsWE1lc2fujwO2z24gR
         4dL+JFzNB/vcYc8gT/P4luzGOYmZxcy9eGreddBWwreZFbvv/vmy4HS/7uH3XlXZhOwT
         BP/BVOUpe1ro8Mn4qdzBjALwupC5ynXBb7L/MgHRuF3UPRUkdKgdP/K0fQNzKao+BLIx
         +Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785251; x=1782390051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNC+MjdPQmYRBJXCHlLJ4FXMLy/ssZcMsCeR5gbt2lQ=;
        b=bcKnKAQMGaA0FzIa5x2ZuArLO769R1Tp/BKwYRmEAumxMVsCB+iQ6FRO2CB5TA4oKI
         tOtcJO0Ry6WWPX1j+njyHIZ4K18LgtzHBVkZA2wPs2QUp04KYCV1xgH8hZkdkkr5uosS
         3zV67BmAVg9sPxX2k7CayWwdfL8HyZFFgKrNN1WRqm5GZ0u0yiqfkiut+tGEjAz4uhrI
         yCBEDLtTx7hLEj2xIQoqIrDkd0c36DR3etqe5c0eoz10RJsUcHU3iduir9xO/9oods0t
         bAx7vP9p5lpUJrrZ22yrDewH7EiBZ4ryE5YWSn2DLClQjsxwzSls93jc3d2sHr/CBrNS
         kgXA==
X-Forwarded-Encrypted: i=1; AFNElJ8yYg9iwMXWp72huiM4Q9DVp60LpNvrTQZAYmablDkt32BZK8Up3eKBjd8bWe82tuabpLb9ROoZNYaCtRQp@vger.kernel.org
X-Gm-Message-State: AOJu0YzywUSpUHba/oELoX/lcrXx8idNL9/IQBPT1t6JJJAeRUSll4Jq
	YCNrLU+7DY2gcBXWetFP6OWEon7Oe9rL/gfYEa/FrEYL2NWrLDXRFipD/eQHwvOgzARjn/SjCsR
	scLD/enhGg25PifukyLQT9/zAU3MmLxHrOKiQCKLZ453fidIedEzrblCYrB/ZEVSiPvo2
X-Gm-Gg: AfdE7cnWCXf25Mbt22PQU7/Hb3txopehghZL4dJwD3TU0HkpRU4ByvV1H0fvsUpdvCB
	hdT5unOIOESxLaVRXxUlZtLRMcWfmCqKX4xTVzWuN995HhVI0S7ZdP74GY5IWn0NwgkpxdjIeFn
	sCO++2Umuei8NrONYHm9m1GHxe11mo5iXQpq4BqvJiNi5D/QS3HHgOFtT/gzS4lvU0MQ2oZo3ec
	ENvGXjXnDnmhq3LT94WyMlWeFjI4a7+I8JDUC/SKP8DrqjW04FXB4dSI3UAHF9NI2wI/fkI8KQ0
	3NVdMoimhLYoYm8uZxJ+UMt3DcxVxhDJ2U5uYGKSIgadeuDh6rdl0b9Xf5WYM0EzxjP13hVaecn
	IF+UGNIodd5anq/Zb3XDzeZv+zxA0lIylNjU=
X-Received: by 2002:a05:6102:4bc9:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-727c9ceb5bcmr670260137.1.1781785250876;
        Thu, 18 Jun 2026 05:20:50 -0700 (PDT)
X-Received: by 2002:a05:6102:4bc9:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-727c9ceb5bcmr670248137.1.1781785250503;
        Thu, 18 Jun 2026 05:20:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-695b46f7f39sm1418286a12.27.2026.06.18.05.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 05:20:49 -0700 (PDT)
Message-ID: <b5287c07-24b1-4011-9805-529f6f51c22f@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:20:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
 <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
 <0debc1fb-f6ae-44c6-aa87-d5ef3e39b47d@oss.qualcomm.com>
 <b4794e93-0fd3-4559-9ecd-02d679bd06b5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b4794e93-0fd3-4559-9ecd-02d679bd06b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ztha89A4LZxm6E6I3pAZL6Kc6F3Hxr05
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExNCBTYWx0ZWRfX0aOtPiqRQmT+
 2Gcq3gP1MGjG28gj5AVa21RJ3kTKG5BbYldV+0SFy53UvaWGP8rBRxOJspM/g+aCZMH4flYE0Jb
 r4vJFdShBwWdLmrc9dvOivdPSrkyloQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExNCBTYWx0ZWRfX72TsfB6qozPS
 F1iqjfFRBif8nwLSXTzYrL7QoFn2uUi6eq9hDEkNeU+IpwZpHC4vmaIXhqobm6NNqqxIPb67cPk
 JGqU/ewC0lpRV9Znnb0VMzJ+RXWpJRDuQPOCJV6kNPlo0TvN/GoEbbt4vrpntMBzugZ73ThnDpP
 PDP+1gmTdUatV6chnHszicQdA3cbBHrlSx/n2e9QA9Vt65F0wIS/22jWxJ/y/RfzJS5S/voboK1
 OsNd7qRek85t5VlN5c5IzRQ7m/c9XQm0TJKO6h7jKWnMQ0Ac4snX/ArV5GfRVqMEuGUKIgwhA6T
 00jiLORnGOhFNeSOUW85n/nuO+sTxYUj2oPs/NEjoBNYnA4TSIHmMo37W/EDMeia37JyEd9Byw/
 QeFsqrGbBDKNV9JxCev0yQXUFfZf/gQYqUW8UGPOU909QFtG5TIbK7lGNK6GQfGQT7B1dqVIXj6
 4sX6XwhBZyBMh2LU6FQ==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a33e2a4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=i0djx3qMVQoBlMXpResA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: Ztha89A4LZxm6E6I3pAZL6Kc6F3Hxr05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113768-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:harshal.dev@oss.qualcomm.com,m:andersson@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 735D869FFDE

On 6/18/26 1:58 PM, Harshal Dev wrote:
> Hi Bjorn,
> 
> On 6/9/2026 12:06 PM, Harshal Dev wrote:
>> Hello Bjorn,
>>
>> On 5/18/2026 2:06 PM, Harshal Dev wrote:
>>> Hi Bjorn,
>>>
>>> On 4/24/2026 2:05 PM, Harshal Dev wrote:
>>>> Glymur has a True Random Number Generator, add the node with the correct
>>>> compatible set.
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> index f23cf81ddb77..64bbd5691229 100644
>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>>>>  			status = "disabled";
>>>>  		};
>>>>  
>>>> +		rng: rng@10c3000 {
>>>> +			compatible = "qcom,glymur-trng", "qcom,trng";
>>>> +			reg = <0x0 0x010c3000 0x0 0x1000>;
>>>> +		};
>>>> +
>>>>  		tcsr_mutex: hwlock@1f40000 {
>>>>  			compatible = "qcom,tcsr-mutex";
>>>>  			reg = <0x0 0x01f40000 0x0 0x20000>;
>>>>
>>>
>>> A gentle reminder to pick this patch for the 7.2 merge window.
>>>
>>
>> Another reminder to pick this patch up in-case you've missed it.
>>
> 
> Gentle reminder.

Bjorn and I were both out at the time, after we returned it was too
late to accept new patches.

Currently we're halfway through the merge window (where Torvalds
receives pull requests to create 7.2-rc1 out of), during which
contributions are not accepted. They will resume in ~1.5wk after
7.2-rc1 is tagged, targetting 7.3

Konrad

