Return-Path: <linux-arm-msm+bounces-91651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDXOF3LKgWl1JwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:14:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08938D7654
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FE8D301C5B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 10:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A68339C653;
	Tue,  3 Feb 2026 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BznxzEMp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALjcs16Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D695A39C649
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113606; cv=none; b=aNZkPXckijlt69AVoMmpUgIVPgWt7ClBYj08gG2E6KsruRCrNUAEkyd6xDEBOtjbgDDOlnCtfaATBm2rk0FaLIaZE3pN/9cEJsbYrn95aeoRtziQ/w2awCdpDXzGHAgCmelBwfLpsFQmvr2IukWDdCKznxbliNObl982oqhvY7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113606; c=relaxed/simple;
	bh=B0tcpgXUYggEp5djWh8HPXelRHctZRqx5FqRdjDK8BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4Svt9RV3LliHigD+lJ1a5XhesD9oq2pEklKzFlnVw9uolDE0e94VBlH/rYQEk//OBttVOzdG4AsqJVnGIijHGp1bsO414AvO2RlZseY0OaN2sOPWu/Si+9zAXrSLLxqp3UY9oaWcs8OkC6WxQJWlrhS5fMYsxyUwn4RiHsB90E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BznxzEMp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALjcs16Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61366HkE3459151
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BwydnwgkADB6zoBphbfTvoWDQ4jJFOTu4lyIkJYnOfo=; b=BznxzEMpxOC8eLdf
	xvXw3ohy3CDDPKAE4wlvMy4u/NISLVjYJ5Lea1nUG33rEhe9NeAoh2LoART7Tc7L
	cpwQTSGML+WyW5Q8AktnWNaYmKz2NzpL1zrKNIPshlXfmUe4SqcM/VkH1HRkYIwx
	WXeTrDl1IU2HKkbLsEZcW5yMY4h8mbjhqOY8OHsUYl8wBTe5zWb34JLaJTMdd+tu
	39F29BJA1kjPoLSdTRuH2MwNeVE0lWJ4vSLQpt1vflh7GdC7bdfJhFXEl6IdO/hi
	TnvEHuF2TogMUOlCcMIcxaFnsiskmn+MOUJ3jrEOuumJQoThwZeVOCaoP56Rl+GT
	VCqQ7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbkum2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 10:13:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c7177d4ab4so129561685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 02:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770113603; x=1770718403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwydnwgkADB6zoBphbfTvoWDQ4jJFOTu4lyIkJYnOfo=;
        b=ALjcs16QI2Bu8G2u6ylEhfWhQ1DIHEJG3Eb1JGaSZFnHm4iJfYBDxqzWCsRTmOnFsD
         7Jjtp8MJYvb+v0/9B96A53iS64p+ispel1CpIiMa6YsSkWAOCnOTq7lIOpWmJlJFhjYI
         Lz0MGTnOHWUMoJwRdJaD286UwY3+jNwokF6Wz18spIIJD4Sqb54n4aCPHWZCJwfqIiVf
         TdgwODiC0nQmzgV9d7YMJWqVTZ+1zNXMt5n12wjBlhOUhi/K/3tEp4UTz73qTlTNyCl5
         auaeG01bTt8uaNwBxZhpTYD1SXHQeDmGxTKAkvhLqP+GPEs23KP2ushpuja6xhf3ECSP
         eDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113603; x=1770718403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwydnwgkADB6zoBphbfTvoWDQ4jJFOTu4lyIkJYnOfo=;
        b=kTWy6vCsk8SjyDcjVWnOsYHUpimwLGgW3zOxd9S2yczrNxmfC04UQ6yAQm4R31MVpf
         GwkWiw97XdHe75nvd+AuO2pLP2ra+ZYHJql8rK4Hvylq69yuDfFfDUPjowpWLvuklDpR
         j6TZrc83XjIetf5DEZPXYkpLVvb5Ov0K09Z5XqOVbIhh+XwmuUEtW9Hco2dO0anSTwBj
         lsc/6/ZE6JMGHJ16EkbBvl7WDMLTnS1gODQw1xGTLoWHn9VwhME/ycSwNyWKkZjFfBx4
         sXzVlDaO++tz6iedDNeQb0a9BGegfTBkyWIsZopZ7uFy208tf+Ug5eFRQDHCBWqfoJyO
         Ca+A==
X-Forwarded-Encrypted: i=1; AJvYcCXOelxHgSTLVEkYDdfYYuS8hmPz7/BvNrX6RkXA0SKmvrf09OwaadG0pZ4AqoI2+zx+GZaTq+6Att/vbftI@vger.kernel.org
X-Gm-Message-State: AOJu0YwpJf2V6aP8p6ytZkiCfkL81e3pXnndy/7Aizp4YhZzbosI6Umw
	hFcVWk06WmDF+hiZXkBgZeO1hfaaCqDx92CDwIasUxHQ0gXOzV6E9d/2eeIZNDS++JApbrYqVqP
	nPS+kJJMIChShyNrq+6QJfG39+6kPKjW1Nt2MFcXmXc6bwdPpCIJEtm75sWZRh0IhjwbF
X-Gm-Gg: AZuq6aKUF/eKqpd3oug+YtuOyNnBw1QG6C5BUR/KJpyBP8nr7ZJF/pp77ZVN66DOjxr
	ZjqcogIWNNf5JFN4GlhI72KV6bZYyR+dsVk4xgQ78orjEeQXMpLj4S8xzHt7WaI8iiFO65lBMne
	f6/siBoey0LW+4FpjsHFgN19CQtBIDPvJcPXD+y+Do0C3er1EfcgGpBjyrh7s37W/8P/4WmW1Ud
	ZUjwPT56ABGDOdJqE2GrEuIiNNWTKLArtjfAUleE8aJ9omXW+BDNjI8xAbQxRkuZLj3zarVQT20
	tYRG1adcNQ16n8WooiF9wRqdebOXlCw28O/F9I6zAZ+9sQbq6zUGz56yPot4j83HIG6oHcLuV3i
	P/7Mwh8gJ/5O6MOmZlGHfacA4amG2/PQ/x1i/oO0bATDWSMffCaBpPfmNUvQ5WnAZOyE=
X-Received: by 2002:a05:620a:454b:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8c9eb285634mr1471866485a.3.1770113603002;
        Tue, 03 Feb 2026 02:13:23 -0800 (PST)
X-Received: by 2002:a05:620a:454b:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8c9eb285634mr1471864385a.3.1770113602464;
        Tue, 03 Feb 2026 02:13:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a4bsm9283483a12.2.2026.02.03.02.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:13:21 -0800 (PST)
Message-ID: <0ff093e9-39a8-41df-81eb-c2f753a32a71@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:13:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
 <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
 <6c823646-9085-409e-a692-ae3e77347742@oss.qualcomm.com>
 <5911fe77-fe2c-4321-96a9-a1b6b3b5d1e3@arm.com>
 <a74b8e61-6e15-400a-a7aa-d589f3545421@oss.qualcomm.com>
 <cab2be55-2ea4-4bca-a574-eb6800cc38f1@arm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cab2be55-2ea4-4bca-a574-eb6800cc38f1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F9Hv1reV7rHy3R1vcolO_ObPAlrLU9Rj
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6981ca43 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CS0xlA_fLX8Yt5LHUfsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: F9Hv1reV7rHy3R1vcolO_ObPAlrLU9Rj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MSBTYWx0ZWRfX0e3DcUNJAfil
 xTcxPEWwd9YZtxpWBmjgrHOr0IXSzer4bTust/WT0BWRV8pfl4Uzp4o7Hn/oPhofEO56EoXafd3
 g/iYOFhAiBcLHDl7NuQlH74hoGYUjdknZJKOF0afXIeXxGAk67DtdLJuulYMEn52S8CtxyG5xh5
 tqjPn3eKXY92AerV0KaeW9VpgzlJJxyIYEM53D8iJFG1ePDKyKwbP5azHghnBgluZ4uzg+zwaaD
 vKgU4ogwX5NHdVXz6LSYYopxPAHgpbN+wrG8HxFMyiAM12weuKPt4m70LJXBu7CxCGYV9Hf+tp8
 zP92DhFS6W+i6EtbLjIUD4pTIp83NwkKbh5w8KG4O4yiLVVBjelZSfOYJUiFvuRURL/uHitqmwP
 W7iwProExl5ij7/bF93jm5j/w3JFhQTGIzdVRgX0k5mO6HO+fD8gPKU+zW5r0Zb+t8TO5wgBWfT
 Cz2ks+aVTJxVTUZVtNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91651-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 08938D7654
X-Rspamd-Action: no action

On 2/3/26 10:44 AM, Suzuki K Poulose wrote:
> On 03/02/2026 09:36, Konrad Dybcio wrote:
>> On 2/3/26 10:31 AM, Suzuki K Poulose wrote:
>>> On 03/02/2026 09:00, Jie Gan wrote:
>>>>
>>>>
>>>> On 2/3/2026 4:50 PM, Konrad Dybcio wrote:
>>>>> On 2/3/26 9:08 AM, Jie Gan wrote:
>>>>>> Document the platforms that fallback to using the qcom,sa8775p-ctcu
>>>>>> compatible for probing.
>>>>>>
>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>> ---
>>>>>>    Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>>>>>>    1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml
>>>>>> index e002f87361ad..68853db52bef 100644
>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>> @@ -29,6 +29,10 @@ properties:
>>>>>>        oneOf:
>>>>>>          - items:
>>>>>>              - enum:
>>>>>> +              - qcom,glymur-ctcu
>>>>>> +              - qcom,hamoa-ctcu
>>>>>> +              - qcom,kaanapali-ctcu
>>>>>> +              - qcom,pakala-ctcu
>>>>>
>>>>> Platforms with existing numeric compatibles should continue to use them,
>>>>> so that the mess is somewhat containable
>>>>
>>>> Sure Konrad. So for Pakala, I will change it back to qcom,sm8750-ctcu
>>>
>>> Why do we need different compatibles for the others ? Are they not all compliant to the CTCU programming model ? i.e., sa8775p-ctcu ? or even,
>>> a generic,
>>>
>>> qcom,coresight-ctcu
>>
>> It's a huge anti-pattern with the DT maintainers, since a compatible is
>> the only way to effectively differentiate different implementations (i.e.
>> instances on different SoCs) of an IP block
> 
> Do you mean, same IP block integrated to different SoC ? Or are they
> different implementations altogether ? Why are these not applicable for
> other components ? (e.g., Tnoc, I-Tnoc, TPDA, TPDM etc ?)

The former.

I think coresight bindings are fully generic, since they have been in
place for about as long as the arm64 port, which precedes actual bindings
validation (yaml dt-bindings) and in those times the requirements were way
more lax

Konrad

>> This is important for the case where a DTB is shipped as part of firmware
>> and can not be replaced - if some quirk needs to be applied retroactively,
>> we can look for "qcom,glymur-ctcu" without affecting all the 50 other'
>> users of the effectively-identical IP block
> 
> Fair enough, thank for the explanation.
> 
> Kind regards
> Suzuki
> 
>>
>> In this case, we're already reducing the impact on the driver, as that
>> only looks for the single fallback compatible (qcom,sa8775p-ctcu)
>>
>> Konrad
> 

