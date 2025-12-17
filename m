Return-Path: <linux-arm-msm+bounces-85463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E97B0CC6FAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C06BB3051602
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 10:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777AF34B42C;
	Wed, 17 Dec 2025 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNcJ6Z5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlqPGPOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462FB34B414
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966117; cv=none; b=fQC3a4YmPc4ZRfGU7MnEj33VJEPed7dJq5TKSKJYt1HP26F+k4igkSnEeYwVJqy6L7RoSMI84G59HIVYIWbwvp8tVKgExYjQN+xwwAvz+QsPiZJHFcpQVsXfQJUxuirH51HeSayl4GaUDjxF1OXXdzlBWr9Lqi75GFKdVyQ3uWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966117; c=relaxed/simple;
	bh=e03yN4PSC1w6aBbtPzvDebOeR75CPTHswZIO3lmyqK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERTeSv4IhLfzzDekwvunMoylM5I/q8KWi0b6ixPy9Ga2uHMVFxTdRlToO+5DtTS/FtdJbTX0F5oSHWhBnYsKjtcRBQgKUU1coPW3dCaYT3BbmEjnLIXsaOyg6o8pkOzwO+X2f60aJlkd+99DJZ8fqIHxgDnyxuIq31URVdQa2Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNcJ6Z5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlqPGPOB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH9pJpq008969
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ob1B7GC3z4Hye/c8cOiOMchvI+sRX/aL+C4QZ7XJJzk=; b=SNcJ6Z5j2SqaeOrM
	zBR9APL/cLu3cj4BydHd5XnRl5LYK9FIRWnI/09VQ4gdTlQ8/Cq9E8R0vSog5gYU
	WwkPK0ponZDxwnT4D8Q3Z+4dfjYeH9mToh+qlT82miy23RbPP9YB+4uZ6yiTY+0D
	MpN9+YGV+P0qxVETo8oAku5Osgo9YbxkhQz3yfwzLM93ibgASVA+jFOgUbk9YuLD
	nO24jelVyzBEXdqi+GutrHq943QCoDj6T0zKu1Xz/iIcnVmFyP0YjymVUsjeqaCD
	r56N9Hts/fVVt3uPKff5W2AeR/aswk3BnNPGDEr+3Ook5DKnJN/CIPz0KIWJnonq
	Iuexjg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e023b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:08:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso10082582a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765966113; x=1766570913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ob1B7GC3z4Hye/c8cOiOMchvI+sRX/aL+C4QZ7XJJzk=;
        b=GlqPGPOBtfDdCIjeydILc+78sLal1LeqaPVPT8FN2a1p8jmtTHcDC6qP7uJOjGeeVW
         6NdN3YBog5b7AFEdMbJEy3Wigc9oAQ8vsxEJREVBVWUbvR0/SLMOA0vrqeVUzmhhOH00
         sGyDhd9q/nk08+cwPn2DKWZXYpFp79bCwp0SOOSbZro/NDQSKlvdB5NmLdOsT3gvlADA
         uhDqjI67mKXfX2N9KjzA90kseAQwxhWohlgv8gKKTcDApKTQBzjTRcR5duEay3aYmAEj
         leFmWQJYhQr3mU/RIFxrs8QywgeaSEc2V8f2XP29kZJ9KKsxoXJOjBniCd7juVykgbsQ
         sNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966113; x=1766570913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ob1B7GC3z4Hye/c8cOiOMchvI+sRX/aL+C4QZ7XJJzk=;
        b=Z+EdAFyR6XuTibZaAYnace++w+bs/aSw/acJ7uExxghyNJyswY+UXLiIX9OCgqoRoa
         vRLblbbY8ytCGRosYRnV/Op7RtVymZZdm+laM9Hv01vSZRC6zffpYkDkGY78GOp3tAGO
         u0L+/f6XkXOu22P96xWhoinCco00uzgL6+A2uMZS+A1VT/vOgSop4CEPO4kltZwc0eeg
         Lrmh4saJbO/ukwJ6Dw43W+qaaq+Cnkz+N4ifLY1qglvVTwx8sgKRmORlWclQqp5giEMB
         5kQEThDpNEeYjei1E24kOYFtZMl3oZ+J6qP/pcy2KHhCxj27kadYZuWPJECUdI/V6Rhd
         92UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4oqSixKfYcYELF1dY8seacAQNlb33AE5hfkApluhQBtcxK0inFsBnJfPYVjpFU/og4f5Y4Vwg6ap7N0Tu@vger.kernel.org
X-Gm-Message-State: AOJu0YzRf3/Ol97fDoZPdsqtmbNHXOVqod+Sz5s1ooxWi+IoZ/CTiJpg
	Bv/xdvTzgnOy64U6GOGQ2qWr7z1KPcgX4blLCx0L8spXpIrkCjMLZlX20jlwtzEJwVYP6quV7kj
	XJvSBWpo9RzkUw2jo+GKxGn3GuLUY9bjHI4NGoBzkLOu9rTxsAkE7oDPupECCS8P6fXyQ
X-Gm-Gg: AY/fxX4qY+sZNc6H70/SIg1OcGZYr25fxdkZ2Va9eqTrtzlasX0FZF/MZK1iRpBWjjV
	dEW98mR1KCePiYY/UmYFj781I9nl+DQa5kXheOMgmP8eZJeAfuF9ipR/pi9tFdDaNk8u6069Sud
	BIqzpfbdWF1sDUn92MSY9zIdIBlXmCdXzHVUqt4BakhmJoHyLyE/At/6BdsLBOehSCxa/RwTjXf
	vwQm874CUryroZruABsi17zBFobix4bgKe9FMzGPkP27oGdToMaqkWRiW8SXLen/CYLduVDlfHS
	m6wI1NgkSI+Z9mw6fR5A1IOi4iGq+CjJKWOICpn8b2khvKHNoXaufOjCoE1Exx2mP3s/OoY9BcF
	UOFFENAJrqK7JFtLjr0TmpNf5b5s1cosAm2wJybLpoQ==
X-Received: by 2002:a05:6a20:7fa3:b0:361:2f3e:cac2 with SMTP id adf61e73a8af0-369ae7766a2mr18899037637.33.1765966113379;
        Wed, 17 Dec 2025 02:08:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3QmyjSiMweA/arYt/8VUm5ViMFMTTEaOxXTtRy2plCGXPaoJUh9fBxLm1FZMRzWIkrWhcMg==
X-Received: by 2002:a05:6a20:7fa3:b0:361:2f3e:cac2 with SMTP id adf61e73a8af0-369ae7766a2mr18899007637.33.1765966112887;
        Wed, 17 Dec 2025 02:08:32 -0800 (PST)
Received: from [10.204.100.70] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2ae4e163sm17636576a12.20.2025.12.17.02.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:08:32 -0800 (PST)
Message-ID: <55f68c6f-9b7e-4393-9ca2-b94551cd81b8@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 15:38:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <Ux4KioDAyhqgZYleT-eeeFKzuT_qadCIpP3RgyB40apZPX4I9_JwcfY9mebop4gmFcyh4LPw0KQvFzL4zzysJQ==@protonmail.internalid>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
 <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
 <623225c2-166a-49a1-9856-d02ed55f1e47@oss.qualcomm.com>
 <bds552pvggsf6jgfyghyigp2fb6zb6hucwqirwye5puctnrhdi@tqw4b2nc3mkg>
 <64dbe824-a94c-4394-8cbe-ebdb7a3c42fd@oss.qualcomm.com>
 <qnpgm5zmiqvwwmwc4z64uqssodrkcjaai4ro5tt36wua2jljlv@y3dx5s2sxrlp>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <qnpgm5zmiqvwwmwc4z64uqssodrkcjaai4ro5tt36wua2jljlv@y3dx5s2sxrlp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4MCBTYWx0ZWRfX7WZOmXJFrUAF
 mLyCuMZ395x97tYLQWkf50xUbzc6KYG8c8ruWyuJW0dnP1R4XOWiWRHuZc3XtTuUtQfhDVXTNpb
 6HMdQlOJ+kpta/ofbkmoQ6HFvGD8ciYO6Gcp9ynWPlR8e5jYO4yYE/11R9q3ypZf13AQfsT3aZv
 irCTOaJ/e+OTU3ivuuUxx2KEMB9dX6XXcML1G+7k0IVsD5k5p3hHyul2uydNB2Ly0lPW7RjOdVZ
 mUp+CsnHntY39LWmFMP6MSzmmix8CoKg+Ga3/gTjtghiP32I/ue3sAia6qRGQUu88qk3/p229JJ
 rMSbnU6SK5yx9qAHRkeVun07cRRT6f8AgbvUU9eVhFIEWhAkDOsyT2Pr/aBh9Z+PxvbrN9XwYDh
 N5eDcUxxY8XhTbGiG5qa2vNPeYlcQQ==
X-Proofpoint-GUID: tWg6haoM0G6nnS5hkBZlCaasoULFymPc
X-Proofpoint-ORIG-GUID: tWg6haoM0G6nnS5hkBZlCaasoULFymPc
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=69428122 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KssOz9qI_-APc-HC6jIA:9 a=A62DG5RJPRbGacMD:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170080


On 12/6/2025 2:48 AM, Dmitry Baryshkov wrote:
> On Wed, Dec 03, 2025 at 10:48:14AM +0530, Vikash Garodia wrote:
>>
>> On 12/3/2025 2:54 AM, Bjorn Andersson wrote:
>>> On Tue, Dec 02, 2025 at 03:43:17PM +0530, Vikash Garodia wrote:
>>>>
>>>> On 12/2/2025 2:06 PM, Mukesh Ojha wrote:
>>>>> On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
>>>>>> On 21/11/2025 11:37, Mukesh Ojha wrote:
>>>>>>>> Sorry.
>>>>>>>>
>>>>>>>> Did we actually come up with a cogent reason to omit the video firmware
>>>>>>>> loading here ?
>>>>>>>>
>>>>>>>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
>>>>>>>> getting video stuff done and storing up trouble.
>>>>>>>>
>>>>>>>> What exactly is the blockage - is it something you want help with ?
>>>>>>> I replied to you here[1] and given my reason..till something concluded on
>>>>>>> "multi-cell IOMMU[2]", I can not add video and block what is working
>>>>>>> already.
>>>>>>>
>>>>>>> [1]
>>>>>>> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
>>>>>>> hyd.qualcomm.com/
>>>>>>
>>>>>> Why though ?
>>>>>>
>>>>>> You are mixing together the issue of multiple SIDs and the original loading
>>>>>> of firmware which could easily reuse the venus method of
>>>>>>
>>>>>> &iris {
>>>>>> 	video-firmware {
>>>>>> 		iommus = <&apss_smmu hex>;
>>>>>> 	};
>>>>>> };
>>>>>
>>>>> I completely understand what you are saying, and it would be very easy
>>>>> for me to do that if it gets accepted. However, I doubt that the people
>>>>> who raised this concern would agree with the approach.
>>>>>
>>>>> I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
>>>>> banks separately. I’ll leave this to @Vikas to answer.
>>>>
>>>> Not exactly as a separate sub-node, but i do like the idea of introducing a
>>>> simple iommu property, something like this, which Stephan proposed earlier
>>>> in the discussion [1]
>>>>
>>>> firmware-iommus = <&apps_smmu ...>;
>>>>
>>>> I understand that we are doing the iommu-map thing, but a property
>>>> exclusively for firmware like above look much simpler to me.
>>>>
>>>
>>> "We know we need to find a generic solution to this very problem, but
>>> while we work on that let's add this quick hack to the ABI"?
>>
>> I would not call that as hack, rather a simpler solution instead of packing
>> everything into the generic iommu-map.
>>
>> "firmware-iommus" is much more readable to interpret something running in
>> el2 mode, than digging into function ids inside iommu-map and then matching
>> it up with specific SIDs to confirm.
> 
> If you want it formally, NAK from my side for firmware-iommus. Either
> reuse an existing approach (at least it makese sense from the historical
> point of view) or introduce a generic approach, which is iommu-maps. The
> proposed firmware-iommus is definitely a hack around the IOMMU
> properties.
> 
> But it's really off-topic here.

Infact i see a concern with the iommu-map approach for firmware SIDs. 
Let say the hardware generates 10 SIDs, including firmware. So video 
binding should describe those 10 SIDs and the DTS should have all those 
10 SIDs as well, including firmware SID.
Given above, video driver cannot distinguish if the SOC is running in 
EL2 (KVM) mode or Gunyah mode.

Could you please suggest if we can make it work with iommu-map approach

Regards,
Vikash

