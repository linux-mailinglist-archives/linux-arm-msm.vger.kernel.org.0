Return-Path: <linux-arm-msm+bounces-85490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75ECC7680
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2C3E3053B3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F92D32825D;
	Wed, 17 Dec 2025 11:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWjXZXOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+pmSA2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EAC314D36
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765971803; cv=none; b=Kfgr/tLvuJln0PEVNXM22vJr7OO7v9dFxR5B6dOHFMPzrvgT9gzFUACw995BozwEFchB1q2Ya+Rc7pvLWANIKF3dQnakBPu4wLUGPc8aqvQ+eiaP7h2VT8O9i4tRM3NRgdxESkCBu8nOiVBPTv7wq5FvyHxg/hD/e61PSejZb8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765971803; c=relaxed/simple;
	bh=3EnvTxY0/bfuIeNDRDiGlF/1dOg95S8RcBq4z93kXFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HtHRYsyk0m+DpQgly5YWwJdbzYgoCylVEERnu9AOz3NEdMIssOH9KE4bp4fZ5dR8kxyrSAqUYu9ewB6acTNEZjFdjBQZnq34bHp9MTBgU7/acJNt1+oTiExuYBnaOKfulWie229om+S2M7AJNp3Nlp3LhMvXARBCMFOyW4PqtbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWjXZXOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+pmSA2r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAHIGO1281623
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uc8r4ogfZe3Nfe8rm/DbzqbRnN7GoD19BnhRvcrJm6s=; b=KWjXZXOX8V/XajIs
	dv+x3rVmMcP3G/RFoEAbmHBI8QKT9Es6ZSbcA+kSr+II3wFXJYIe+DFj0ubQZNEc
	q/niq4jd6tmb/mXx6GWfIFdZh5sH/HKv6GVos8q1hykwec7aJRBxTcyxRcRyLtiA
	UhEC+oUGYNRYXJMaHg/H0Uz5N6Ih8nLmZ59GniY0GSl7sroz4/oLo7cKdaXwmEoF
	qasCxppR8EaCDL2QLUhmQZyqrSK+746V+4hQbxC0toUTB1RH2BuJ7M/X8fV05ZjW
	7rJCA/mv77xlHhH7O0BrSAx4OULV4ZXg8kCVdI/xu0Vy/0HwapmuZ55xpNGT1ULj
	fcMSJw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2a8ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:43:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1e17aa706so17579361cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765971800; x=1766576600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uc8r4ogfZe3Nfe8rm/DbzqbRnN7GoD19BnhRvcrJm6s=;
        b=M+pmSA2rRflhVHilb2At9muUc+Odx4mezkfLC1FWMIpT6G3Ywc27NTy+3qGK40lpPb
         aJ813Do0TJDZuAUl13crWods8fWP1DQClvotSB7eCSMHmxHY8dH7VQ+vJt0DhAJLqt+c
         aDsIk9YyP9njEulsGkA51tM55wYYjmY2c9iQXPRbJdXSXYgCEbbWr0o1XNe+C+f8GzfC
         QHU2UQ61Q5km0XeUbOFuc5XVpWs1yF+/VlTfqmWAUD1yHmSA/8U7gmtxFKhfWvVv+lst
         IpNhzGCyXSK9cX6JStoKIW1dhexDwpko3oFNYgMejtdZbh69zIDmGv/Y5U20Vf0RkUwk
         HTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765971800; x=1766576600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uc8r4ogfZe3Nfe8rm/DbzqbRnN7GoD19BnhRvcrJm6s=;
        b=lAZJmsdPTK+uB7L3YsU5E27fYBo5W9YhUpiZg7i8vn49qEQrg4M3CK6EVlcSF1nRya
         Nm5hMqsKZZNYuuZZ+gii096oTsC5IHxgztwJvFiuRLeWP/DeU0X9w9x3m2iwEtceIK0T
         BmAkfe5yLifXtm8GT25Tjw9pbJ80PQGLt4EGDK5GMrPaaMq8eF7q3AvuDU5y9k79ELfd
         IRvrljzTRnyjPSOrSpvS1J2HDSbZ9E49t52eec7x7v/w5f8UlDRw2X+mJKPulUQGz/Nj
         VujQfbOw7OWBvBRQCsEh5WSADmfaPqRx4MqKhUxSBW+yOi2rnyFoJJCYCyAR7cC3vBs8
         uXNg==
X-Forwarded-Encrypted: i=1; AJvYcCWrNA2ERnINpYrOK4hpR/m0qBYZgrlQoODWKSP2YwQ+YbimDNtmZWo7GUxwVGGLiaZJmZ+qbumOwObry5PG@vger.kernel.org
X-Gm-Message-State: AOJu0YxRJCBW8P6vxK3UKitv9Q6Fjn4OtgymImNalCsv5S8xVaQZGLqF
	LNenjh9GWIDG7spwLxQ+RCckZgNj59BShRc5bZULBLlKMS98yKmR2Ffo1VqymS8CNDDfgFs+8Bd
	smMtBU+D36vsrQsaQ+YamNVtDvCB6D6MQqYvvp7JdSSAzUJ4r6ilsOniDJ1WJ641IUqQpu3IYFO
	7u
X-Gm-Gg: AY/fxX5c0tNa69fISczNqWxUh6oWHNrACsW1CpDu6jHXCrLzR72fjgPCQI6yas6ZbBd
	wkvre+l93QLGdSlDZ1qqRu/G6loWK7QzQks0f8sXCf61FLBwA+ojA/DehRXPOKZmwMRQIypwmyJ
	Om9+W2Uh0G6aVp7C4eeodK8W2HFv5aa2Di+AWre73+5Q5IQkkVmiOemTs+4bDB/MqpNkIP7eMk6
	bYgJ1kuDYd2mWHy2f1oaR1mBQ0Kn1kqgxla+lrjrvB8nXTHYHfVOwEzuKBuqfVfeQz4ZcQSa+3C
	CuX/tinrztwGxcwv7fSarX1rZHoM2dtFMrdiFMyDMtm2qjIvgyNQcB+O+Syumt1jScFbtobPP2j
	Kcb8jiI51O/VVPiW+KJnw/gZ5GD58jgjaYJe84RZ92m4M93Ak4w5jxHuZJy48le6JPw==
X-Received: by 2002:ac8:5e09:0:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4f1d06772cemr182329541cf.9.1765971799802;
        Wed, 17 Dec 2025 03:43:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPGUpg1VEdJQV0I0ezVEgDQeWCJmbibhBI34HanVShebTFaB9WoF8Il/29YJ8qGQzBrQH8pw==
X-Received: by 2002:ac8:5e09:0:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4f1d06772cemr182329231cf.9.1765971799255;
        Wed, 17 Dec 2025 03:43:19 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7fc04f6015sm1023112366b.50.2025.12.17.03.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:43:18 -0800 (PST)
Message-ID: <28207f1f-31f0-4007-bab5-e073ddf2d262@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:43:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org
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
 <55f68c6f-9b7e-4393-9ca2-b94551cd81b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <55f68c6f-9b7e-4393-9ca2-b94551cd81b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7usVzJgwQoxz6ZVBc6N5hIebfK4Adalc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5MiBTYWx0ZWRfX7SLhepKvsSyR
 2HbLTqsLwyqDMVvqMlv85UbxLy42uzbFEdbC2W6TvfFBwDJCJ9BNrc+LCptB6ZBRwDxXp1u97Gj
 TziSivr3DEa5cbieL1OPfn1hcFHFViIuodtWU7rUsAwJGi8AHooqrGPWtuMkpFiwdhw+HJGdq4w
 sS6o7e48MsBCLIDRUaA0v0cDbZ4Ou+lKzlYWy19HC3MZ1mjOEcRnGz8KuQ6fPDz2H+Nks1EC60i
 Rg+5Ae6AVY4ASc0FMHwMY+2eQyaoXDOtnrNxPKnfVixhVBrCAEUwm4JBlv5rYplTrWfBq2LDL2a
 iNbg6Rp/RTTecfv6gP33sNAeqRqSqVpABtp8wQQkKlZQVAJKyOs+bJtvYkEorG4ka46k4vKK3DV
 erxVJzMiI2qcFmVAcJHwQQiNWvf+Vg==
X-Proofpoint-ORIG-GUID: 7usVzJgwQoxz6ZVBc6N5hIebfK4Adalc
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=69429758 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QbrqHIRdYo9yJpEGGWUA:9 a=AxdYRY707WvbTN9U:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170092

On 12/17/25 11:08 AM, Vikash Garodia wrote:
> 
> On 12/6/2025 2:48 AM, Dmitry Baryshkov wrote:
>> On Wed, Dec 03, 2025 at 10:48:14AM +0530, Vikash Garodia wrote:
>>>
>>> On 12/3/2025 2:54 AM, Bjorn Andersson wrote:
>>>> On Tue, Dec 02, 2025 at 03:43:17PM +0530, Vikash Garodia wrote:
>>>>>
>>>>> On 12/2/2025 2:06 PM, Mukesh Ojha wrote:
>>>>>> On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
>>>>>>> On 21/11/2025 11:37, Mukesh Ojha wrote:
>>>>>>>>> Sorry.
>>>>>>>>>
>>>>>>>>> Did we actually come up with a cogent reason to omit the video firmware
>>>>>>>>> loading here ?
>>>>>>>>>
>>>>>>>>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
>>>>>>>>> getting video stuff done and storing up trouble.
>>>>>>>>>
>>>>>>>>> What exactly is the blockage - is it something you want help with ?
>>>>>>>> I replied to you here[1] and given my reason..till something concluded on
>>>>>>>> "multi-cell IOMMU[2]", I can not add video and block what is working
>>>>>>>> already.
>>>>>>>>
>>>>>>>> [1]
>>>>>>>> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
>>>>>>>> hyd.qualcomm.com/
>>>>>>>
>>>>>>> Why though ?
>>>>>>>
>>>>>>> You are mixing together the issue of multiple SIDs and the original loading
>>>>>>> of firmware which could easily reuse the venus method of
>>>>>>>
>>>>>>> &iris {
>>>>>>>     video-firmware {
>>>>>>>         iommus = <&apss_smmu hex>;
>>>>>>>     };
>>>>>>> };
>>>>>>
>>>>>> I completely understand what you are saying, and it would be very easy
>>>>>> for me to do that if it gets accepted. However, I doubt that the people
>>>>>> who raised this concern would agree with the approach.
>>>>>>
>>>>>> I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
>>>>>> banks separately. I’ll leave this to @Vikas to answer.
>>>>>
>>>>> Not exactly as a separate sub-node, but i do like the idea of introducing a
>>>>> simple iommu property, something like this, which Stephan proposed earlier
>>>>> in the discussion [1]
>>>>>
>>>>> firmware-iommus = <&apps_smmu ...>;
>>>>>
>>>>> I understand that we are doing the iommu-map thing, but a property
>>>>> exclusively for firmware like above look much simpler to me.
>>>>>
>>>>
>>>> "We know we need to find a generic solution to this very problem, but
>>>> while we work on that let's add this quick hack to the ABI"?
>>>
>>> I would not call that as hack, rather a simpler solution instead of packing
>>> everything into the generic iommu-map.
>>>
>>> "firmware-iommus" is much more readable to interpret something running in
>>> el2 mode, than digging into function ids inside iommu-map and then matching
>>> it up with specific SIDs to confirm.
>>
>> If you want it formally, NAK from my side for firmware-iommus. Either
>> reuse an existing approach (at least it makese sense from the historical
>> point of view) or introduce a generic approach, which is iommu-maps. The
>> proposed firmware-iommus is definitely a hack around the IOMMU
>> properties.
>>
>> But it's really off-topic here.
> 
> Infact i see a concern with the iommu-map approach for firmware SIDs. Let say the hardware generates 10 SIDs, including firmware. So video binding should describe those 10 SIDs and the DTS should have all those 10 SIDs as well, including firmware SID.
> Given above, video driver cannot distinguish if the SOC is running in EL2 (KVM) mode or Gunyah mode.

EL2 vs Gunyah is not hard (something like is_hyp_mode_available()), but
again, this should all be calling some sort of is_gunyah() which would
come from the gunyah hyp drivers, which have seen no activity on lkml
for over a year..

Konrad

