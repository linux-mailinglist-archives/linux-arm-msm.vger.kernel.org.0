Return-Path: <linux-arm-msm+bounces-66534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCF7B10B0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE773A496C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E1B2D5425;
	Thu, 24 Jul 2025 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hL8bEBJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170932D5412
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753362708; cv=none; b=g7xqnCQhdif1jIJUFl1IOBZsDOqSB8jzgfueAIPot4YlyilwDp22pAumtjXJGrTqzu1yfeY+J8/HsVmIn3vkWqrZSdk2ASPznlpMPKKqbNQPx/MmjInzVL2sxINIt1wFDSl14qF8nEoeTh13mmuDI+ay+NFNQgAd2XgVfL86XJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753362708; c=relaxed/simple;
	bh=sQUVRr+DIVouijZAUFnKBN8/lKBzUmdx7Plm5JfcaAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t9BD/nhTnU+BhnFWGNqPOV09+lStQJjKLmTCjAefO2cHsBSqQs4jT1uYlZ3vDWPKgVXIZD/LQsTT/EOJlTHdJd+pI4JGF8+pqoaSStqNiayLvQ9EUaTuTAyRHWFSR+my9upR+sVrdfmshnY/yBofG28aUvMKLNUmt+d8CQGfd+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hL8bEBJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9VeJr015228
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0K+e7rJgZSq6tnIWJuJWStOUGslGM+UG4V9oh+SiyA=; b=hL8bEBJb9b/BllZ8
	aQnP/jxfONoTZRAnJGQ2vpAuLPjsqxxiw+ZtjFgVQTHVWPnDxPmxsDBsHj2pr2O6
	YENWv4fGKLpGFlWU98MQVkiLkfM3vR5gJvt9RDy8NnHdPdyjGNQUKlvSLUyIVD0f
	fiLEay8KUaiMqsQ/h0FE7HNmLHeHAnqvBBduZbkzsQVsjaQvwME0QLRwj+67THfh
	eU8fI96lT/J/ZyGAoTEUIDEQBjE3xF9p3RpRJV2t21Tv68t2vP9SDfqF11Bi2aWy
	luummD2nGvB/bNuh9+pdHkWd1uizbV0OaJSiIH/6J9H8+TcFu9IgRA0IeJqLzOH2
	ioa4tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379ty0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:11:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e344f333beso19666785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753362705; x=1753967505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0K+e7rJgZSq6tnIWJuJWStOUGslGM+UG4V9oh+SiyA=;
        b=Xw88aT6g13sZkry9Dl+cC6Nc/PZwxdw8gLwh764nZ0JQI2jt0KZllvgQZ6QeZprKoS
         xLyjyP541qVMwD/QU93eJKhJIeinFRYuW4quCHJwkRqonVclZ7dtbJ+xhAJxGDvDV7xg
         rXdwCeWmA3zXAFDSiL5eRvqt+H5ndgZcO1qWH13ayO0ZIpEq1TTT1nvbrHknqYN9VV5x
         HZP56ttDrESWAzjjiUihwjtURLiuU0g2YdJlTbOrEeXeA3CTWITSYSoDqh4wBn+U98mv
         Yz7judsl9cXgP33pca3al3IixKPGs6UOvfhf7oO/dw0YWcvEY7gX9oLIH5dTAszh2/3J
         qRRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+AJARH9Um60qfs6iRjFyyBsQnJeHVW1aU3wvf+2IEUR4tnMAfCF/5lDUKtP37GXBdLJx+i8WT+wNEcSfo@vger.kernel.org
X-Gm-Message-State: AOJu0YyJeuQA8DPrkMbFBt38iXv/rV9uGQv2FTVqRKdZEO+qV61OxpO2
	ldUR4YlNcOMXgYO5EpdsOOEAIXb82zVSPwILIy5PzrQ6diSiBvWXOgpwIQ8B05MErRHDhq6VvOE
	F5QcLMlqoxofiWAy0tK0j1gCU4uuKFAfx8wO3K8z53xZfWEMyEWv5yoeda9R8vvzhZtrZ
X-Gm-Gg: ASbGnctSb60i9TjrVTScuUqJzgoI3TlYjd7OqV68MEk5dLubQmQHMbGYCUhfp0p6DmG
	SpLfJ098KBfL/Q6jTa26OhyuVHVly/v7EKYNnmKfpTN0v8sk1aoyGN5FhXpnklIPViwxVIZR3c1
	+SOCjeBMardUcp5HMN0Qs0XgvkJWbaykG62sJcQGrotyxElD0qvawfoc2HJ+NkEncYQe4OGFLyM
	L1/XFxjklBF9+sIJZkKEA0jff0pczbBMYI/gKIoLYiEac3GOTiv8oj4QuqTIZ60F5akJN9MmU1j
	zPxXq0v0iMKCShb84RNSFdAIdzw6/fDL7dSwp1MRwbRssygAzjF9SF4BF5h8bVz3RM/GEqcfLWB
	skGo9dIIgU2yzOQ7mng==
X-Received: by 2002:a05:620a:8327:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7e62a172a3emr267903185a.11.1753362704539;
        Thu, 24 Jul 2025 06:11:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhYGn9CGeMn27MIN0M023g3aUqmiruI7RPJTYq02Iu137ror6Y5i+xclq2UWbIHAg9Q45Jxg==
X-Received: by 2002:a05:620a:8327:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7e62a172a3emr267897485a.11.1753362702795;
        Thu, 24 Jul 2025 06:11:42 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd0d1297sm843086a12.1.2025.07.24.06.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 06:11:42 -0700 (PDT)
Message-ID: <fd1a9f2f-3314-4aef-a183-9f6439b7db26@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 15:11:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
 <20250723-swinging-chirpy-hornet-eed2f2@kuoka>
 <159eb27b-fca8-4f7e-b604-ba19d6f9ada7@oss.qualcomm.com>
 <e718d0d8-87e7-435f-9174-7b376bf6fa2f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e718d0d8-87e7-435f-9174-7b376bf6fa2f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -VphvtssS3xDrGvtRVtKiBMNWhV7UOEr
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=68823112 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=93qQf8JY70_oINAjwcAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5OSBTYWx0ZWRfX1YUjDTIb47EC
 66l6Rejy7kmvHArKaEqJD9xrsVYHt9/T1GHw0dJmWhLcH2G7JUyB6h+tbAL9CBPhAg13sT+yYaG
 PZ3QFMtJPJo3TzYRw6w8teMsQkKzt/HvU0e4AaY4ruvs6pAljE2CC/F/OosbQM3zm+W+A6l5cvV
 rVYS31XlLDzFpwYCi9wJ0z1FOmYInF0wREnKdw54rWnNTdB8z/AtRZc9h4UPG2t48wCW1qB8wTT
 78SP2dLDaVxUnLRiK8+3KMVXq5KTAV7YCpUHTKniMh7ndwkxwh3BKKb30QXDitOkeLnMPe1oWzc
 pxt6cxEYHJJisX9hZJ4UkDMknG0wwJJxzPwDRvwt208mcxkAzGB8NOxHi7zjnevf1Bp0DLje9s2
 3NwpkORr7n6thcKVgGy3kiVcbzJ82mAQ5yGJvV0yCh7L9vAD2oufH6+bCq9B64nd7jy5Je8k
X-Proofpoint-ORIG-GUID: -VphvtssS3xDrGvtRVtKiBMNWhV7UOEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240099

On 7/24/25 2:51 PM, Krzysztof Kozlowski wrote:
> On 24/07/2025 14:47, Konrad Dybcio wrote:
>> On 7/23/25 10:29 AM, 'Krzysztof Kozlowski' via kernel wrote:
>>> On Tue, Jul 22, 2025 at 08:19:20PM +0530, Wasim Nazir wrote:
>>>> SA8775P, QCS9100 and QCS9075 are all variants of the same die,
>>>> collectively referred to as lemans. Most notably, the last of them
>>>> has the SAIL (Safety Island) fused off, but remains identical
>>>> otherwise.
>>>>
>>>> In an effort to streamline the codebase, rename the SoC DTSI, moving
>>>> away from less meaningful numerical model identifiers.
>>>>
>>>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} | 0
>>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi             | 2 +-
>>>
>>> No, stop with this rename.
>>>
>>> There is no policy of renaming existing files.
>>
>> There's no policy against renaming existing files either.
> 
> There is, because you break all the users. All the distros, bootloaders
> using this DTS, people's scripts.

Renames happen every now and then, when new variants are added or
discovered (-oled/lcd, -rev-xyz etc.) and they break things as well.
Same way as (non-uapi) headers move around and break compilation for
external projects as well.

> 
>>
>>> It's ridicilous. Just
>>> because you introduced a new naming model for NEW SOC, does not mean you
>>> now going to rename all boards which you already upstreamed.
>>
>> This is a genuine improvement, trying to untangle the mess that you
>> expressed vast discontent about..
>>
>> There will be new boards based on this family of SoCs submitted either
>> way, so I really think it makes sense to solve it once and for all,
>> instead of bikeshedding over it again and again each time you get a new
>> dt-bindings change in your inbox.
>>
>> I understand you're unhappy about patch 6, but the others are
>> basically code janitoring.
> 
> Renaming already accepted DTS is not improvement and not untangling
> anything. These names were discussed (for very long time) and agreed on.

We did not have clearance to use the real name of the silicon back then,
so this wasn't an option.

> What is the point of spending DT maintainers time to discuss the sa8775p
> earlier when year later you come and start reversing things (like in
> patch 6).

It's quite obviously a huge mess.. but we have a choice between sitting on
it and complaining, or moving on.

I don't really see the need for patch 6, but I think the filename changes
are truly required for sanity going forward.
We don't want to spawn meaningless .dts files NUM_SKUS * NUM_BOARDS times.

So far these are basically Qualcomm-internal boards, or at the very least
there was zero interest shown from people that weren't contracted to work
on them.

Konrad

