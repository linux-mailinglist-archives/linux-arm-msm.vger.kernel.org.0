Return-Path: <linux-arm-msm+bounces-80437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19787C35115
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 11:18:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACFF93B2142
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 10:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECDF2FFFB4;
	Wed,  5 Nov 2025 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RC+kGHDT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVs+ePiA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F812FFF92
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762337808; cv=none; b=Zw2RZ0HLuhmZr9PJihbFcGv3PR7HrJIFWI7feW7RmprQov5AT8u4TEyZdgaTfP1a2OFE/VUGWN+8RDwF2SQ4R5NIQyBg2LfUKmONgbwMl5c3za+aCl0dBQkeFCu1j+UpazJS68YfdxMHAem36ylUw136sAFtNwouCAdmInvC9zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762337808; c=relaxed/simple;
	bh=eYXTB12G4Jjz2dQ1iA0d+Zq4M53rRq5th60nE7Q8+ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fO++yFfYMR20xh2TCn8GGgq6i4wRHhQKSAmokGGuAzMnKEj9T6g2KyOVDnIz7tdvkQZM2w381lLtCpEFLhTh/ghY/Uffb4r+yp+uNKcpNcpclq8Y558sUlj1DLIwLTRRAmlTYMFJ9m0l2BJd2vLgeNBr1iKAjHGHJNO8FFVlZgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RC+kGHDT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVs+ePiA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A58KBtw2927485
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 10:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ta2hRtjIGYutwa8+T+jr5APKYGbkaeiNFYgNPk9GyZs=; b=RC+kGHDTS6JoWG5p
	L8H+qjW8iRH0MF7ABUr10ZTs/K10OcVvNiLn757+xRnXzXhNBg9e5RxrjkaFMVzX
	bLSVssRbVCLzIPtcjeePxnq+H6M2Ni74pWaGQn+9rZaMlLOC3c9j4hh5TWNBwoJ2
	QRB7mnBcBvqZLudzjzwmMEuIr0HM4qta+QM1cUkNzOulkiR3y6cNAkk2+jCxEqU0
	D15P0oA3gImp7EeOJO75rXrXwg4H/SpwV0jJVLMWr0hP7UvMgj7P78z+9tbDslJ+
	HIa8FLKtDvTwiuMssPMTDVEEqkE/MK9t8nuLcpFrQr5Fj8WbtUOyM6yGBKn6twzN
	dZFL1g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7me5tx9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 10:16:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-294ecd3fdd4so82772035ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 02:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762337805; x=1762942605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ta2hRtjIGYutwa8+T+jr5APKYGbkaeiNFYgNPk9GyZs=;
        b=ZVs+ePiAyFZ6vcAjN5ZKktYWy9gpDkAMhE9YbKHpRvGB+OU/a2bMmOaUC6LvH/ohmY
         kCwqkHuaoLkjX5AkAvPdOZ9uZjvaVIgN0GEhX2QeSmtOpvQxU1n+b/TNQjup3wh95Y9G
         TPokpxO0C8TrR0Vy5F0g7U6xZJvPCLEWL5KTfy5cQFi95lda7j5choaKBS7nOb2A4+zF
         4lKATIJsEhWbvkQiZXaQtCcxxM5O2K34EHJ8KCro+Vg4EIdZ2Jk4qtfOVaPA5xHyV1xN
         VRX3mKJjZkDHp28/87LpzpiUNUh+OCIVUVoBUXmNXw+2yXrfwVJHTF35LqmxkwXJJxGc
         xQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762337805; x=1762942605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ta2hRtjIGYutwa8+T+jr5APKYGbkaeiNFYgNPk9GyZs=;
        b=VjWgCNyO6Y1hVoSR7VQ1+f/6Cr+bfjXObwT5h1Z/FbI085/OX2S4+bWbUdYR8DyMbR
         ok621TaR4TjZtHK/EH6XQiHbZr9b8q//mfiWw6o6n+eXpGjiaz4gDI5UYJFbSlcpzWlx
         SM/SZoa6XVA2q3DWERIL/0BhM6jXJ4bBBu6xCXp21GzWxeLTkUO+JfNSZs3I6hA+8jhi
         BkJlfNhr1u53iuohitbmn3JQy56Gs9yG3k68KBScUTzZ6zATqbp+IUcygVXpqkrbjlLx
         328gbTnYBApprkj3pY1O57bpTiNrM+KOSMEx2dudJWUZ83wWXLG7UBtyxQUfijDv/gPg
         ThgA==
X-Forwarded-Encrypted: i=1; AJvYcCVJl2oY0C6XCzqL4uQ55tHmSvhPHY9lvl0a6Np6yS3IE7UgxG0ZTmitDK6h67gibYC2PO7vcGiePYo5P84D@vger.kernel.org
X-Gm-Message-State: AOJu0YyW51ErrUsmhTN3AbrM3BzntTqnkC7i+m0M4dZIRksEiwncTBGQ
	NP6M1vOvOYyCfGWteqFduhR88++zPgJZ/rZrDgV/DAxv8O4EH/1yQHnWD8YTRjTjSgdEY0aMs3m
	BdmU98Gs7r+3iru/OsfMjkRyzIhRN9uV34XE6tQZkdSJp1TUlpx0WlnLAUi3FuD4GJLdv
X-Gm-Gg: ASbGnctSkAMwZhfw8kAcbwYvkAJwTRWhwst4NJypmklKm+2y6HfDZJXLWJpM+PuTQDK
	r2BZec6Iacv1+jpWrHDUcWsHeDEqW1j6zwsqS/2KvMsX7ITec9xo3VtVkQqleuWx+Jba5c1kwvX
	TC6vtFQQAzMJDAchKNQfj1NnAr4mtJjaeSTST/dDyo2TQmfYm7hydUJYnueH/R4IeEa5g0VjWyy
	zUMkvMTmYGhRcfHnNGLsEpoNfJ9Zs27OzmyDnB/jUaB2Lx0hXzGcwve0w1fJW50ocP01FYbCHNl
	DUngJ98SxXzQeuqR12IN70o2/j+KH5PVSckV0JmIpx+QYu9/O5O/RBh2yaL/2lRfK+Cd6AGXMa9
	1rA9QGikzCvuBvX7PiQ3ica6/j1vLXr1h5gSoaQCU1+Mm3f+iSqibZPuyjacy0nb8778cDg==
X-Received: by 2002:a17:903:1ce:b0:292:dca8:c140 with SMTP id d9443c01a7336-2962adb9205mr41766625ad.44.1762337805119;
        Wed, 05 Nov 2025 02:16:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEERiVnLzKuHQJ0gmzb0TNIDrn5liDBDTJoghkGYIdT79j0+ZWIT8X5xbtlRH3ZR2fs/EOZQg==
X-Received: by 2002:a17:903:1ce:b0:292:dca8:c140 with SMTP id d9443c01a7336-2962adb9205mr41766255ad.44.1762337804622;
        Wed, 05 Nov 2025 02:16:44 -0800 (PST)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2960199831esm55608125ad.37.2025.11.05.02.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 02:16:44 -0800 (PST)
Message-ID: <dc2d7940-8750-4ba7-9e4d-05c8b4bbb819@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 18:16:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
 <20251104064043.88972-2-songwei.chai@oss.qualcomm.com>
 <20251105-industrious-oxpecker-of-valor-af17fa@kuoka>
 <746b292f-fc3a-43a8-89b1-76f61ccc0630@oss.qualcomm.com>
 <7ba7e32b-f00a-4f77-88da-047126a8c3f9@kernel.org>
 <b9e7f8ba-a629-4316-a6dd-d765ed0037ee@oss.qualcomm.com>
 <38452e04-255e-477d-8262-53aeb3c87a01@kernel.org>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <38452e04-255e-477d-8262-53aeb3c87a01@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bHODj4QkNwlEz7gr4L26Jpifa14Hdwj1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA3NSBTYWx0ZWRfXzo5IldmYxYXh
 A6yZUngcCNzaSvVts0JMaxuVgvl/2+61pZ7HUPl56KqgGg3rvrH7sIUEqJGBNjgkWI2OQ422lrv
 T70d+YVksRWNPBuKhBaG5bcOeeC1QMQOBhhXcN/SW86LY6w+7Ja86h5uTSagJ+pRohmOnqUdDrx
 Qw/jGnWsm4bXy8U3Br84hzLEyj3h1GPiLCVHu5NrekhwPGGKgQf7qI0KQjmxvzGSuSgNlnfUDyB
 qZpAWRHVmPKXWnNTh1Of0O1ZfwXyHviGJeNO8FOu18NlYA6pg0keEt0bRb6W2yxv0+wKMuugXd8
 6CVj3ybybMu5rGBCFRcPJ5cQYJowG/AxV4I6rJ3w0Z7rM26n99IL4nJPrGG73OdFN/QopXw9MzN
 OKbTMwovi+LxuK35jkOc6K/pigRwjw==
X-Proofpoint-ORIG-GUID: bHODj4QkNwlEz7gr4L26Jpifa14Hdwj1
X-Authority-Analysis: v=2.4 cv=IpsTsb/g c=1 sm=1 tr=0 ts=690b240d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jwEE-YN-BAOtPsYX2CoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050075


On 11/5/2025 5:03 PM, Krzysztof Kozlowski wrote:
> On 05/11/2025 09:49, Songwei Chai wrote:
>> On 11/5/2025 4:15 PM, Krzysztof Kozlowski wrote:
>>> On 05/11/2025 09:11, Songwei Chai wrote:
>>>> On 11/5/2025 3:49 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Nov 03, 2025 at 10:40:37PM -0800, Songwei Chai wrote:
>>>>>> The Trigger Generation Unit (TGU) is designed to detect patterns or
>>>>>> sequences within a specific region of the System on Chip (SoC). Once
>>>>>> configured and activated, it monitors sense inputs and can detect a
>>>>>> pre-programmed state or sequence across clock cycles, subsequently
>>>>>> producing a trigger.
>>>>>>
>>>>> I do not understand: You got review which you ignored and then you
>>>>> removed pieces of this code to make it incorrect. Go back to previous
>>>>> versions so you won't waste our time re-doing review.
>>>> Hi Krzysztof,
>>>>
>>>> The previous reviewed-by is no longer applicable because in this
>>>> version, we moved
>>>>
>>>> the driver from /drivers/hwtracing/coresight/ to
>>>> /drivers/hwtracing/qcom/. This means the
>>>>
>>>> required compatible has changed from "/qcom,coresight-tgu/" to "/qcom,tgu/".
>>>>
>>>> Since this involves changes to devicetree binding, i didn't not carry
>>>> over the previous review tags.
>>> And which part of changelog explains the exact reasons to drop review
>>> tags? Not mentioning that changelog is almost impossible to find, buried
>>> under 10 pages of some repetitive introduction
>>>
>>> Did you read submitting patches?
>> As I mentioned above, the |compatible| string in this version has
>> changed compared to
>>
>> the previously reviewed binding. Therefore, I believe it's a default
>> rule that the previous
>>
>> |Reviewed-by|tags are no longer applicable. If the community requires a
>> note in the changelog to explain this,
>>
>> I will make sure to include it in the next version.
>>
>>
>> “
>>
>> Did you read submitting patches?
>>
>> ”
>>
>> Yes, the explanations in the cover letter were written by me, so I have
>> definitely read them. All of these explanatory documents are
>>
>
> Heh, why I am even reviewing this... you indicated in your address list
> that you do not wish review from me, so I will keep that in mind and not
> provide review.

Hi Krzysztof,

Apologies - I just realized i forgot to include you in the To list earlier.

Your input has always been valuable and welcome to me and i've learned a 
lot from our past discussions.

>
> Best regards,
> Krzysztof

