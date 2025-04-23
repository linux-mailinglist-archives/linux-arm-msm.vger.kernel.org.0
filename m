Return-Path: <linux-arm-msm+bounces-55160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CC1A9900F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 17:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD99B1647DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA14293B7C;
	Wed, 23 Apr 2025 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lN51bZXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC470283687
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420848; cv=none; b=q+YDh+UMEjh+eUP6VrnWLacj7hTTMnA+jS2X5gyAEEoFyDfqnpqHrHCBpytsrIQ/nNh2J/fPxIk7jvU6yzCx/Tji/lNA2BMIkX7Zm37KpQ632HKyay8TBNFMdiigSapvfljWA7psdeMMlRgnK4zaUs7pzF2D8w5OOP9sLHL7B04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420848; c=relaxed/simple;
	bh=0qLq6C9nC74yKJhixSLN/mgZGQ06Kzm0RtJXMfbpLkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpZswMOETRJGqBPMEATPwh7U8q3RixQPmYul+I0XQ8T24SVc5nvPC/eupY8S3wJJQ29houwgQiSJbc5V/p78MnuK/CyIouRMT/xF5wpmKso5uyer4rSRGv40E32N+HQKr3uQsB5X2Z10Z0MeLhjGEnxcmib8yxfKjvQ9XecgrrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lN51bZXz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAfuau021519
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 15:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooYfMd07xIcz3T1xZDga/jOa+Ql6uCCOowC2QW8VZ5A=; b=lN51bZXzgfPS4Es7
	zf3kF7mctoa7zY9zgsPfAZIBspN/Usg1a5wZP3g04Vd0VTVhJbsxVHcTMt30WDbI
	KqTOBn61xtF6rxTTGSKRt9WupjJSe1Q/iyf+8SVODafFCt44wJh1uvvd4x+ADsTA
	SMqPROFlesC+2FBoiFZu1aRRAGioiGMHh4+bjNf6ZsEqn1tPIsEu7ow+e/CLnV7Z
	WSh0309u4AO7OhAJXWDsmF/O0c4GOM7rKuxCPMhY3YZD3mrGo/G0HCWeNZreo+OE
	g3VqFQOS3mvAdu8Do3EqIAqIZAWwPhWvcrmTnSfzoNsVkwrc1BTAeUdq0iQXBKJn
	TkOGlg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh22hvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 15:07:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5530c2e01so63711985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 08:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420843; x=1746025643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooYfMd07xIcz3T1xZDga/jOa+Ql6uCCOowC2QW8VZ5A=;
        b=JD1kqe3XbM43xsdUvBv6t3/O1hbttT2WCWUeVnWLxmxL7uAj47txuoHt/OcayiOwvP
         3IzADHfHIr4oQwLaGc9QNAcP4C3/iYK6EX6aAGDMR2+CN+2WgSTtWk4lD6fbb9NXlhlF
         iRrBLrSQH6h/UWEQQQwJYeQkUubpYoVeqwZKmoBd1Xc8DxuA3tcJCDVIiHk5pF/fiP/e
         GVd0oFiDWucVi5TTVpMJGnzNBsWBNkYOkfjevD56Fp81vfAHhDN66C5AkfP+5065TV+c
         R0QZ2RYl80xP+aUqtsBnhYENQWClvWIgDjxnOYIDCTYpE2tKN+58IDK2bY3/dUsnaw0t
         ji8w==
X-Forwarded-Encrypted: i=1; AJvYcCUg50DEAJB4XU9RNvD0YNBwt4+zOmsL0wedxVZPBw+ezdtkCJYCrlU4FiF/bCV7ahCMEw4C+acIePcx8QbQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwWINrB2vyfu7lvRzoTf047VRGJZDb+FljznghEqDeRzP+uTb+3
	tRpqMYvgEW2/CA/3xVMQ4C4B+GQH6L1QxmcIebf2oZKZS7aSw+cAv7MwlcNBh4BPsRHHwgS6orM
	4VJ8NwhuORYppdpzI7T5fu+/2icQKH5cfMj1Z8lrNRu2M1XZeIxe1EoORTBIGIGKI
X-Gm-Gg: ASbGncszfDRyqiVkR+xPKkRiCAUPD+8+sVnOfhdQTW0v4VslBMnIin8n99sqEIFt4Mk
	tK+uskYO8if3gcjEZac/g5W9Gf5/KU3g5wsVl920wZVGfVQ795HKlOAg/1vRV44cjrIPp3swJCK
	/U/Iw92sA6XC51BypixjHfUFJzFuRhnqgk6fCVCNax0NS3tHB92+7FrWM9sNXLuoZaMcjMa/sLr
	5ReJuaZaBr8AALBl6jZyxDyOFNfHWt2o95xlanrC/55q+Qc30/GlAlEaMzxidKJSJaxp6L+WjjC
	G/HKMqHKF4QpYsqQJokATf4QuCCYi7qQQZw6nEzMWfZFPK0DH1h6nr1CNZ7sYeSgKOI=
X-Received: by 2002:a05:620a:4001:b0:7c3:dd6d:54e4 with SMTP id af79cd13be357-7c94d312c29mr193731285a.10.1745420842528;
        Wed, 23 Apr 2025 08:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3y2fbQMoGaZH1uZ10kEG8hUKVPrF8IAie/9F8Wav9gJS/3cG/yHeOsM4uimNso9CUToqxzw==
X-Received: by 2002:a05:620a:4001:b0:7c3:dd6d:54e4 with SMTP id af79cd13be357-7c94d312c29mr193727885a.10.1745420841997;
        Wed, 23 Apr 2025 08:07:21 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625578345sm7656981a12.28.2025.04.23.08.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 08:07:21 -0700 (PDT)
Message-ID: <bd9fe032-9844-4b1b-9e25-645b9c6a773d@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 17:07:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        dri-devel
 <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
 <d67b8fe7-ab92-4756-b549-827210240593@quicinc.com>
 <CAF6AEGut3VQpj=v1euA+re55cLYot+BpjWVBs7orHURQ=Xdhdg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGut3VQpj=v1euA+re55cLYot+BpjWVBs7orHURQ=Xdhdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6809022c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=U4o27yoWPFISaBf6hsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kDdDdJ4qSTvhnRi5x4QBtMxVO7ZYVN7_
X-Proofpoint-ORIG-GUID: kDdDdJ4qSTvhnRi5x4QBtMxVO7ZYVN7_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwNiBTYWx0ZWRfX6fJ472YNTRNI J9WnkSV0MaKJ+6G89wSNOJrMbnEFn5xwQPMKNEvthWsHolkmA4ZrC11TujDubjBuhCNUJNxipz5 0MIoku7I24tSL8NYMrQjMwStlcfZMkmrmeyv70fEqHCZAEa/3sBuEPYQn/TNXEJUBIrpDPUSprp
 9AFha6Cotyq8+yJL7CWdZWzWt4hfMYPKPpqsK/j28PUPPGaoFOlemcnnWeBDQS8Zis1CbXQFyQC arwZGrE27flC/CWCUE/uy+6e2Yyro2fidNBG+uqYSl1x5dYsLJWALrydzqv9ItnrVVxzgUv0HRf u6DaT2gnsaCPIkTVnXMeiXiB852AoLMtl5jBuFVcNI+f3NtaV1+8roTc675/ETNSIys6ZVSbiGZ
 vzKwchhbDPnHZiTvyMaXWVRpxOCvCVGnWUZe51QK/2PaX4y6TairvP0C0gz1b4TuHZ1f6zDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_09,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230106

On 4/23/25 4:56 PM, Rob Clark wrote:
> On Tue, Apr 22, 2025 at 11:55 PM Akhil P Oommen
> <quic_akhilpo@quicinc.com> wrote:
>>
>> On 4/23/2025 5:27 AM, Konrad Dybcio wrote:
>>> On 4/21/25 10:13 PM, Rob Clark wrote:
>>>> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>
>>>>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
>>>>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>
>>>>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>>>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>>
>>>>>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>>>>>
>>>>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>>>>>> default (the one used prior to this change) on error.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>> ---
>>>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>>>>  #include <linux/pm_domain.h>
>>>>>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>>>>
>>>>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>>>>
>>>>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>>>>
>>>>>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>>  {
>>>>>>>>>> +     int hbb;
>>>>>>>>>> +
>>>>>>>>>>       gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>>>>       gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>>>>       gpu->ubwc_config.min_acc_len = 0;
>>>>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>>           adreno_is_a690(gpu) ||
>>>>>>>>>>           adreno_is_a730(gpu) ||
>>>>>>>>>>           adreno_is_a740_family(gpu)) {
>>>>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>>>>               gpu->ubwc_config.amsbc = 1;
>>>>>>>>>>               gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>>>>               gpu->ubwc_config.min_acc_len = 1;
>>>>>>>>>>       }
>>>>>>>>>> +
>>>>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>>>>>>> +     if (hbb < 0)
>>>>>>>>>> +             return;
>>>>>>>>>> +
>>>>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>>>>>>
>>>>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>>>>>>> and every version of firmware. Also, until recently, this value was
>>>>>>>>> hardcoded in Mesa which matched the value in KMD.
>>>>>>>>
>>>>>>>> To be clear about this, from the moment we introduced host image
>>>>>>>> copies in Mesa we added support for querying the HBB from the kernel,
>>>>>>>> explicitly so that we could do what this series does without Mesa ever
>>>>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>>>>>>> to support querying it. So don't let Mesa be the thing that stops us
>>>>>>>> here.
>>>>>>>
>>>>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
>>>>>>> is unused in production.
>>>>>>
>>>>>> Fair enough, I'm not going to argue with that part. Just wanted to
>>>>>> clear up any confusion about Mesa.
>>>>>>
>>>>>> Although, IIRC kgsl did set different values for a650 depending on
>>>>>> memory type... do you know what source that used?
>>>>>
>>>>> KGSL relies on an undocumented devicetree node populated by bootloader
>>>>> to detect ddrtype and calculates the HBB value based on that.
>>>>
>>>> Would it be reasonable to use the smem value, but if we find the
>>>> undocumented dt property, WARN_ON() if it's value disagrees with smem?
>>>>
>>>> That would at least give some confidence, or justified un-confidence
>>>> about the smem values
>>>
>>> The aforementioned value is populated based on the data that this
>>> driver reads out, and only on the same range of platforms that this
>>> driver happens to cater to
>>
>> Like I suggested privately, can we centralize all ubwc configuration so
>> that it is consistent across all drivers. With that, we will need to
>> maintain a table of ubwc config for each chipset and HBB can be
>> calculated based on the DDR configuration identified from SMEM. Once we
>> migrate the downstream drivers to the new API, we can hopefully move to
>> the HBB value from SMEM. This will ensure that the SMEM data for HBB is
>> accurate in all future chipsets.
>>
> 
> yes please

Alright, I'll get this sorted out 

Konrad

