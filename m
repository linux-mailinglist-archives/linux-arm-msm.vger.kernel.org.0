Return-Path: <linux-arm-msm+bounces-85881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB79CCFEF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 87B4A30019CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC8E31E107;
	Fri, 19 Dec 2025 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGnJGFFI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kuK//Dqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9AE2820D1
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149198; cv=none; b=XLtAZh0prD7f2GvxPECX/pdjQAuTyxtfvHJPpqrnNwbQsB6ak9Tnzl30PgFyb+ODdArqIIk5NJE1RuNKKagRlAfyqnX8NZGYz2D0vIx0mjNgXG8j8sYnRdJgVHps+KbOHPn4rmOtZhOXPgGLZ4yRgSZNHiVIESNziAcezLR297o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149198; c=relaxed/simple;
	bh=EOL6PQ/u2G2IGnbiEjczbalUkxet7R3Cs0ByyQPY9VI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+tCn1ElgJA2T753QetDG9wE2NeecFhiw/I9ZImu6O4t0e78swBLKmawNsCe30I3Wqi42HDTM0e3KyGqcACj8T91WsCIjcTsEhFaxYPo7J4Zgu8FD/jE+7eFOwIoUg4QLafUMTa2ofVtsUTaaDzkhLuAIkPVozKkjXITxLBsnM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGnJGFFI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kuK//Dqh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB4hqf3559014
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDatXU9sVuQNjMrgEpskfEj2cmOKOLi/Cc2zxJakF40=; b=XGnJGFFI6I3dFl9d
	/9drXzoH9V3S1c6bE63XRIYZ5N+V0VFjmEmEtNw4RvBGT2/PCPRiFr7e+xPpqjyj
	3nVobtuOcct9JEuyWu9ljw6Y76fvB3yECtocRJfd0jQPdiMDzZPO3HkjpRji6iuA
	Ms9qza35JYlfxpnXo90yErUUtpq7ari+Az8H/WsTIy8eLZFMfyJ535kvIfM/Yv3A
	f8Vw/RrC7Z7pBqE56UXvVj2XBiPlWQ4HPAAhDLPamTCOPwYhpakBAfdvPzMXq4Jn
	G8odNBlIRKMKfsVdwttWJTubR504OL5Z97cAxGMFUOAaHI5aq8WDbxKnOp54cKJr
	Wh70Ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2caqk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:59:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f34b9ab702so2995571cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766149193; x=1766753993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDatXU9sVuQNjMrgEpskfEj2cmOKOLi/Cc2zxJakF40=;
        b=kuK//DqhvOeQk18D40CoDKuDNUzwtSYajZyH8SZ0lFpumwYHbSNgpk12EAMUL2ObLh
         tsjETk6mfwd27kW9wPNqTW/xFSmeuRnC23ucpQdnxabskLINZfSk2BmClKLgfhZTti/z
         fC4iKA2BYi4tftaAfP61ztlRPUdOuFC5UqMsFteovSVqBmHeKr9lPI3hqVgx3erUlr9f
         OHBkstGENSTy/3E/lr6RpkimNaS5vRqpgUTIkO07keRIxQUZNYrkIelGFlX21A9AaHwS
         HbMRVWVRc/OMJdVmW50H0W8XHjCBKD5K4fatXeDvm416/iWcjQc8qA0Jf31WmJfVYZLW
         LPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149193; x=1766753993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDatXU9sVuQNjMrgEpskfEj2cmOKOLi/Cc2zxJakF40=;
        b=FsUe/AdfQSt+LHpmPZSNFZn4QM4qQO559ef2vFaBJRSPL8SM7q/j+VG5CLx7RnHG0m
         arqz0+fd6dvZF7THfH7OK32lv+ugymreLsqfzT4bnHc4SO/ETIl0pk9cgk8fYxf+l92j
         pO8Jir4FfBGOf5/2fUXQz07Lav1wJee/RB/Fe8MhGuDx2VXrc5x92eO3VKHqWSnsU51+
         TK77YXL5EwmQR4Xx0nUK5F9BXfG2zV3t86/TeXVLwhOLpbLKMn5oVVViSH/vWopD97Ih
         Bf2ZLudDozmHPkiozL39uylSgo3vZ4iwYYJwhjO83zDl25ZcVYIAYlhZj0ZBfLak2SOO
         OWew==
X-Forwarded-Encrypted: i=1; AJvYcCVMO1+4fJfgOLRQ9tzIscF7vgrSA43p38OcoxwZH5RhmOnjrK9zXlF6rSKMv11+Ju1MbOJ3N/aeBI2CdBSM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg4W428KGPVzvjsH8fC0iy3oBXxIPgAPg1bIdexwoZBnLWbaIl
	pUtejmLCrmfjYSccxZ4n8ZVZ1n8tcAPrW1SiFZLsoTuvdBT0WK6Lyzh8X8XBb4bwa775DTvEhJi
	LCzSkSCJr8rs9dwb8D0dDn0NNKx/B7U3C3yk5Gwwaqb/G/eMmL0dOS8GTchYbfbiQOL2VAGtLYN
	/k
X-Gm-Gg: AY/fxX6mvKbyxEQWxTS2pfAV5kiciVkLwlZoRhf96ubP3dw3zbnTFef/bXL1E+iq9VC
	Ke6fiQMaDduzvGZp8gve3p743bSlyUq079msWPxuWetkn4pocDZY9xcvwmn4I+BDZGlf2slPL44
	vph3F7XnGX7CfECltmCkTYwUWlYYA0O0OrCddcIb6B1mLN+V9QIZIi4ffA8WGFoKs5rvL9GUcxq
	kTvFkzPNLJz6QMFlmmn9sn17ZYv4ZGNrECAyI6IjJ6+ifEOHR4DiBiqeyLCq/ygXbSInen+MsWO
	4aQmXMMXJG3Cd+ysmTP/HAvMEusQklCIBgEJTAKN4T2b8DkB88x19Y7r64b3pJ9E4DD8Ca3qWS+
	Za3pSCAwbxdaOsGs4FhbEQA9Fj3k0MqGqRByCZDmlZVwCo7bqmj6gOGpbR5BCDOkTpw==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr25245701cf.11.1766149193648;
        Fri, 19 Dec 2025 04:59:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjcthfl3sxtdcKpBgFJkGHhbCyHkIuhfXhbLOo69LJeriInHWrUVeKj3LisrSYtdhhwb9hUw==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr25245511cf.11.1766149193156;
        Fri, 19 Dec 2025 04:59:53 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae9556sm232741466b.28.2025.12.19.04.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:59:52 -0800 (PST)
Message-ID: <e6b2daf9-4bb6-423c-ba4c-593f2ca04ab0@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:59:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio
 playback over DisplayPort
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>
References: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251217120051.98198-4-krzysztof.kozlowski@oss.qualcomm.com>
 <2d4953c6-184d-423b-80e9-871c6e00da35@oss.qualcomm.com>
 <564732e7-2c86-417d-8568-69f40ea7d4da@kernel.org>
 <47758ce9-5ec6-4ed6-9f84-13cbdd444d75@oss.qualcomm.com>
 <487ff592-e67c-41c8-a398-f79aa6e5f69c@kernel.org>
 <455edd55-132d-423d-b0c0-afc7fa40aa30@oss.qualcomm.com>
 <267dad52-0f22-4e5b-a929-a77cdc062490@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <267dad52-0f22-4e5b-a929-a77cdc062490@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=69454c4a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dyGxTdY6081K_zEpinIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwNiBTYWx0ZWRfX1yi8OTVGUBwO
 xU8uUhLYc6umI56tAlSXrqLMGCNJ1rqu+R9mdgK2tx3EdVC2qwkgoQonsINW7j9McprzUuIUuFw
 qh6/an+n85Y8BUFe6I5Ocn6xVow9LGtad6l/mlJ7q8/8fWYnQkv2gH/SyOUeHYKUY1yqXNwbEco
 1R1ftd/tN7QT1LGiqC+S3AatjukQ2ASqi1htOK/Pm0T5qSC1bm6Mtai55GgmAPs8ieRAO1EnK8I
 TGWJhalyIuNgkifxMjVqeYCZSQPqOSF0vrb67hWOwYza61pObfxaoEJrEIuJfGkgu7whR1nON+G
 2MQfiK0o70NlRlcyyRqPL5utLNcna9pzOcyD/KCHejO/l9FFoxpAbaQ7ktAHmTtFjaz09Q5x268
 kU5+guCvwG7kA0IQ4+H5PuA8nW2XItLiJYEPDmxMuBju/YgY0Kv58x2hKGVoc6e+6I7VL7QQPMB
 6e/1+AeD4fYbUUyI4Fg==
X-Proofpoint-GUID: rgoe0P1Eml7d--LUd1Hn1W6u24JUbj-r
X-Proofpoint-ORIG-GUID: rgoe0P1Eml7d--LUd1Hn1W6u24JUbj-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190106

On 12/19/25 1:57 PM, Krzysztof Kozlowski wrote:
> On 19/12/2025 13:53, Konrad Dybcio wrote:
>> On 12/17/25 2:00 PM, Krzysztof Kozlowski wrote:
>>> On 17/12/2025 13:51, Konrad Dybcio wrote:
>>>> On 12/17/25 1:38 PM, Krzysztof Kozlowski wrote:
>>>>> On 17/12/2025 13:33, Konrad Dybcio wrote:
>>>>>> On 12/17/25 1:00 PM, Krzysztof Kozlowski wrote:
>>>>>>> Add necessary DAI links and DAI name prefixes to enable audio playback
>>>>>>> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
>>>>>>> should carry respective DAI name prefix regardless.
>>>>>>>
>>>>>>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
>>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>>>
>>>>>>> ---
>>>>>>
>>>>>> (something's inserting a \n before --- in your latest patches but I
>>>>>
>>>>> No, it is not. It was always like that and only recently git started
>>>>> dropping it, but it is irrelevant.
>>>>>
>>>>>> don't know if this is a problem)
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +		displayport-2-dai-link {
>>>>>>> +			link-name = "DisplayPort2 Playback";
>>>>>>> +
>>>>>>> +			codec {
>>>>>>> +				sound-dai = <&mdss_dp2>;
>>>>>>
>>>>>> How does this work out with fw_devlink?
>>>>>
>>>>> How is this related to this patchset? Please stop nit-picking irrelevant
>>>>> things.
>>>>
>>>> I'm asking whether this is going to break sync_state because you're not
>>>> enabling mdss_dp2 - I believe that's a fair question..
>>>
>>> DTS description is independent of driver, thus this is correct code
>>> regardless whether there is interconnect involved anywhere or not. I
>>> don't have the answer how this affects interconnect, but I see no reason
>>> anyone would create such ICC path - between hardware and fake SW construct.
>>
>> sync_state isn't exclusive to the interconnect framework
>>
>> In any case, could you please confirm/deny that sound still works as
>> expected with linux-next/master + this patch alone and we move on?
> 
> It was working all the time - I was using it on my machine for 3 months
> already. Other people are also using it, because it is part of our
> laptop tree and no regressions or issues were reported.

Thanks, all of my previous comments stemmed from the worries of
side-effects of referencing a status=disabled node

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

