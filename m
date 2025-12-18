Return-Path: <linux-arm-msm+bounces-85703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F0ECCC3E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59EA630CBE6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9023370FA;
	Thu, 18 Dec 2025 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXfppaV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TExsO59Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD637336EEE
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766066881; cv=none; b=g+ZjNPRY2wvBr3hU8s0SvFoW83JoLS9hL4XASWd6PwlQM4rSUr4+xcFfMDRxa02d/FCdY29iu3ezl7oHJW/H41FG8W3uzcLDr9oXp5vQ1CtkjrBIlFG/CFHUqMRn9fyC6HI4R1B90JqiIQgMESGamYYO4gWO246TSp09rhvMAgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766066881; c=relaxed/simple;
	bh=sdoaS3aVPnS8mlbKoSr87lcUSDSkDh/AS/lPTgP6tjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XngVW9DT9f07DF8/RgAIehM46/lykFGxIw3DwtTCVFkTe7TZgYgiU3rcDMrjX9Um+Wbjj/zRmV9axxjvOCAL1/mZo6V2DD18wnfGjFy6f573NTueyq7/MUpNIOb775tzOxlQBI7k+ZAZfksI9+ZOn9VLqdvdoIyzUGwXIaOyZl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXfppaV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TExsO59Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9KFHe4057275
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o87SlVtSMSkrOoLeMNWzmv5vpvWXLBuQJpH68X8QlW4=; b=mXfppaV7X9Dxt9Vf
	LA9opNIPxTOI69qUfqof8ArhXpia6iOvBIRyoGfltkS657FQ2MgEjUpUidMD2CwJ
	YUfjaouirQTR+mjmQfdmymOqD4j1TjDPw5ND8LSm2xnP9oarl4A2zCXMy4uPYTMI
	yZywaCaSyLu9ewRabwpS0LF/3cTwlLZzd1ldSUgoPojojWKX3taHAmiP9oWcZ1NY
	1L/uexS7d8Jnw6KISu11wrQMcUH5+xder+j9GLl17ifLq8LHqpha7dL3rTyd/ouS
	idmFTqe3n9FR1UAdlheZCqlmzMfxNagenGAfdV4T82s1yvWWUQ/or7KuMWIUHOAs
	A6TRaA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5bupn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:07:58 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-78e7a045cb3so218927b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766066878; x=1766671678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o87SlVtSMSkrOoLeMNWzmv5vpvWXLBuQJpH68X8QlW4=;
        b=TExsO59YlJqePpCNxibTsiJr66WtU0RmS8u/UGfiGw7+ZWhEyv8SqM3D9yJlocyA1V
         051NUdN8HG3+OGb5/2x5z6P8jm31GSByoRg4i+r0s0Cjz/y9fJCipqEHv8FavAV5tBvg
         FP2Vgs4eK8SlW1PtO2LXvOnqjxFw5tEOw0eWBr1polhhZgTq9zQMflgEXP0AAPK4Dhet
         0GWgFUimBPCA0sMhHwdD045RnuKE9cGDqrgdzTX4cmevykucyk5eXYcjYm8XpqEo5CHU
         4+q408bo/FwuoGpwKyHPUu/pTDUPDlzfrSW1PymUais+4tttXXJ48WJDZbo97VTTp06z
         z/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766066878; x=1766671678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o87SlVtSMSkrOoLeMNWzmv5vpvWXLBuQJpH68X8QlW4=;
        b=Bk996OVcGRqugZdthupaCgPFQZpWyGMUtAUZIQlLw5/dEokWlN+BDHfdsxl6kbto+x
         1vI59Jbpjigvfi/QUICJNwS223/DwLxvcQmsYgxIpWv5pS33CJUJ0l9njfTpgMZ71qsI
         w8R/AbILbFP7+QlNP5rP+DGRaWD/i+EyqurU4lNu+nAtbFMYStQSHAUmj6592Ijv/Rlx
         WqzOJiAPtDzH8yoZO+YtHZ4A2R/akoFtfZFin2bPZnLtiElTR71YApXfO7O/6dY/UVqi
         DhzwrfsXQU7TMX/jDxGMJVU4YlYUT5rtdf8EE5xXBenjqEnbrHIg/9aeUPnMOT8VZCz3
         pT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHZM2JBRtnAeZx2SCSAZU3YLew8KaeIUBah5iqEz5BUVA2u57zGLU7agBK7b7rV8GPh3gUWElFBbPBD8QD@vger.kernel.org
X-Gm-Message-State: AOJu0YyXLcUgjhzmFWJKUZdm95Kg7xdEHtQqrJweVA88763mdCdp/97d
	3TGZa9a1FufFlSSxwpCgUy+yFAVPz5B/faRb/PPRqrojFCHNzuq0uPRiHtJdz7Lw3dcCvF0tIfa
	Tfi7ftOmmcTt8ihpL3dU009cbJBrNmWo7dEjl6l6XsbtyVCbKyqkhuAaLjAdIa4pZ3NNk
X-Gm-Gg: AY/fxX5fLSPw1X7//2RD1C4Ao+iAe0vdcZuv0IE4RhrpWHNMUW3+C4sMro12Svvu4hi
	NPgAcCMhC41LZKImChv6p28P6OtsQSRZtnAf5fad5Hz+cB5pJyra1flzdYjKjgG82jvkm7j28uB
	hQ/JYC8/gCOqsahyZeK1EusxUxETe+6RtZUjkMh4yOj0r29TExJiwM4oi05sn+j+s5ulVUdlHPg
	Ua0QSxumRaQlQ0tVOwcvIrxtMk0jA2360fdnbPBO5hg57jNj3hHpjdHFVuIwvVo2vSRWi/8m0gN
	C05Opcb791F/6mC0A+CfrWTB87Ga0yEdKmWeQgMKJ68nGm6uk5G5FEO5sY4KUZ2mmhfL7c2Eyd5
	QWo4um+845W6l39w8R1X62XDhdt8qy89oHG3CY667jxiW8osAzDbKl9BnjafDKGL/dw==
X-Received: by 2002:a05:690c:398:b0:78f:9d17:aff2 with SMTP id 00721157ae682-78fa7fb0c7amr17541607b3.5.1766066878036;
        Thu, 18 Dec 2025 06:07:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgUVF2ZvoMUW7DMha9Kz/azXqDs9FfldE8kOJJ1DVHmIj4XY8q/Ljmvx8z/7Vv2VwzZXA3Ug==
X-Received: by 2002:a05:690c:398:b0:78f:9d17:aff2 with SMTP id 00721157ae682-78fa7fb0c7amr17541447b3.5.1766066877595;
        Thu, 18 Dec 2025 06:07:57 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80234a2d9bsm249294866b.48.2025.12.18.06.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 06:07:56 -0800 (PST)
Message-ID: <80cb1b5f-7950-4014-913f-838d35fb64bd@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 15:07:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
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
 <jX9Ifmjba1jKjv7wLdH0BnDY-4Zo91ibfsoeCCOFvKhD_a8NWM8ONnJtbO_Cr5v6tttjEI8b-l0O7na3iXSL9Q==@protonmail.internalid>
 <28207f1f-31f0-4007-bab5-e073ddf2d262@oss.qualcomm.com>
 <24aa56bf-b03f-4b4b-9ac6-89fc91762179@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <24aa56bf-b03f-4b4b-9ac6-89fc91762179@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9zVBZjYiPBiPhBCalm_tOHi0MOIxh5Cu
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=69440abe cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=inLNWrLPvn9skOYvWnUA:9 a=uiejn4RyafnNK9Kq:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExNyBTYWx0ZWRfXxcZrVaz8OLns
 udki04rtG7eTLiJDt7TFbnvvhLnDrAP/HonYn84TFpS1iVZhckRMmUeL9NXM6ARm+PahSEWQ+qb
 GuBxFWoFkXxGgzNck8Jc0XtNU2OXNpeejwIDyabm5v8hWxHaIILqO3AWFBawTbNcef7vAQuJY8j
 nR7FC8bHNJPJc2J5oFEBN9Sk3uT64PP5GK3iVMRtRu+9QkucHZS3jnoT7uSk1ZtEdFHZ43KGuDE
 Bi97rfhWdGe2dqGF3qu17LxVdHy+YQuhb8eM74BRt5yhbYnPuZKtdrMksRxJ5Xg/nSYQZ+ztIaD
 /JpdJoRm9bSgBZZvkJ9YZjl5iY+jkKjaHUxbSei1mnOZLuk98wdq9rcxhJbTnW7SnFbhdtD+imB
 4egop0lmJSgtwK07XxUILItaCvHG5A==
X-Proofpoint-ORIG-GUID: 9zVBZjYiPBiPhBCalm_tOHi0MOIxh5Cu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180117

On 12/18/25 5:32 AM, Bryan O'Donoghue wrote:
> On 17/12/2025 11:43, Konrad Dybcio wrote:
>> On 12/17/25 11:08 AM, Vikash Garodia wrote:
>>>
>>> On 12/6/2025 2:48 AM, Dmitry Baryshkov wrote:
>>>> On Wed, Dec 03, 2025 at 10:48:14AM +0530, Vikash Garodia wrote:
>>>>>
>>>>> On 12/3/2025 2:54 AM, Bjorn Andersson wrote:
>>>>>> On Tue, Dec 02, 2025 at 03:43:17PM +0530, Vikash Garodia wrote:
>>>>>>>
>>>>>>> On 12/2/2025 2:06 PM, Mukesh Ojha wrote:
>>>>>>>> On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
>>>>>>>>> On 21/11/2025 11:37, Mukesh Ojha wrote:
>>>>>>>>>>> Sorry.
>>>>>>>>>>>
>>>>>>>>>>> Did we actually come up with a cogent reason to omit the video firmware
>>>>>>>>>>> loading here ?
>>>>>>>>>>>
>>>>>>>>>>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
>>>>>>>>>>> getting video stuff done and storing up trouble.
>>>>>>>>>>>
>>>>>>>>>>> What exactly is the blockage - is it something you want help with ?
>>>>>>>>>> I replied to you here[1] and given my reason..till something concluded on
>>>>>>>>>> "multi-cell IOMMU[2]", I can not add video and block what is working
>>>>>>>>>> already.
>>>>>>>>>>
>>>>>>>>>> [1]
>>>>>>>>>> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
>>>>>>>>>> hyd.qualcomm.com/
>>>>>>>>>
>>>>>>>>> Why though ?
>>>>>>>>>
>>>>>>>>> You are mixing together the issue of multiple SIDs and the original loading
>>>>>>>>> of firmware which could easily reuse the venus method of
>>>>>>>>>
>>>>>>>>> &iris {
>>>>>>>>>      video-firmware {
>>>>>>>>>          iommus = <&apss_smmu hex>;
>>>>>>>>>      };
>>>>>>>>> };
>>>>>>>>
>>>>>>>> I completely understand what you are saying, and it would be very easy
>>>>>>>> for me to do that if it gets accepted. However, I doubt that the people
>>>>>>>> who raised this concern would agree with the approach.
>>>>>>>>
>>>>>>>> I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
>>>>>>>> banks separately. I’ll leave this to @Vikas to answer.
>>>>>>>
>>>>>>> Not exactly as a separate sub-node, but i do like the idea of introducing a
>>>>>>> simple iommu property, something like this, which Stephan proposed earlier
>>>>>>> in the discussion [1]
>>>>>>>
>>>>>>> firmware-iommus = <&apps_smmu ...>;
>>>>>>>
>>>>>>> I understand that we are doing the iommu-map thing, but a property
>>>>>>> exclusively for firmware like above look much simpler to me.
>>>>>>>
>>>>>>
>>>>>> "We know we need to find a generic solution to this very problem, but
>>>>>> while we work on that let's add this quick hack to the ABI"?
>>>>>
>>>>> I would not call that as hack, rather a simpler solution instead of packing
>>>>> everything into the generic iommu-map.
>>>>>
>>>>> "firmware-iommus" is much more readable to interpret something running in
>>>>> el2 mode, than digging into function ids inside iommu-map and then matching
>>>>> it up with specific SIDs to confirm.
>>>>
>>>> If you want it formally, NAK from my side for firmware-iommus. Either
>>>> reuse an existing approach (at least it makese sense from the historical
>>>> point of view) or introduce a generic approach, which is iommu-maps. The
>>>> proposed firmware-iommus is definitely a hack around the IOMMU
>>>> properties.
>>>>
>>>> But it's really off-topic here.
>>>
>>> Infact i see a concern with the iommu-map approach for firmware SIDs. Let say the hardware generates 10 SIDs, including firmware. So video binding should describe those 10 SIDs and the DTS should have all those 10 SIDs as well, including firmware SID.
>>> Given above, video driver cannot distinguish if the SOC is running in EL2 (KVM) mode or Gunyah mode.
>>
>> EL2 vs Gunyah is not hard (something like is_hyp_mode_available()), but
>> again, this should all be calling some sort of is_gunyah() which would
>> come from the gunyah hyp drivers, which have seen no activity on lkml
>> for over a year..
>>
>> Konrad
> 
> What exactly is the status of the iommu-map stuff and when is it likely to land ?

I don't know. This is unrelated to the issue this patchset is solving.

> We _already_ have thanks to chromeos a way to define this stuff in venus.

Which was.. heavily debated, let's call it, after Krzysztof noticed it exists
and you agreed it should not spread by leaving your r-b on:

6d3926a237b6 ("dt-bindings: media: qcom,sm8550-iris: Do not reference legacy venus properties")

> My €0.02 is 100% fine with iommu-map as a solution for VPU but then, actually want to see it as part of the series solving the problem.
> 
> Else, we should reuse the venus approach.
> 
> Right now we have the worst of both worlds. Iris is blocked waiting on iommu-map but the iommu-map series has dropped Iris support because - reasons.

I think you're replying to the wrong series.

> The very definition of being stuck between a rock and a hard place.
> 
> @Mukesh - can you add Iris support back into the series ? If so then is it perfectly reasonable to proceed with iommu-map for Iris.
> 
> If not then we should just reuse the approach we have.
> 
> Either way I regard this series as broken right now, as it applies a solution that excludes one of the primary users of that solution with no view as to when that user gets enabled, worse still it requires adaptation to the new solution but the proposer won't do that work...

Why should Mukesh be required to carry your burden?

You (as the Iris maintainer) are a consumer of this new set of APIs provided in
this series, so one would expect that you can help test it by creating a
downstream patch (that would be nice to share), rebased on new revisions as
necessary and sharing feedback based on the drawbacks you notice.
> It places Iris in a very invidious position.
> 
> So again I think if we can agree to add Iris support back into this series then we should go ahead with implementing in Iris.
> 
> If not then the conclusion is Iris _won't_ use that solution and we go with the previous venus solution.

Because that surely won't get any pushback.. 

Konrad

> Either way, the proposed series as is, is an effective blocker for Iris so I'd like a commitment either to re-add or we agree it won't be added at all.
> 
> Either way Iris gets unblocked.
> 
> ---
> bod

