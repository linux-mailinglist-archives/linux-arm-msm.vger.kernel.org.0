Return-Path: <linux-arm-msm+bounces-55018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B87CA97B6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 01:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F617179CAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 23:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E1021C9E8;
	Tue, 22 Apr 2025 23:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NedBK0c6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761BA21C184
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 23:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745366258; cv=none; b=DGaECIgGlplZ6e7QJDKSXaIeX2Mikch0rXF0mW1jGFN1PzbuVWwfCZFlYBldZbIIVsH6w040kzS18JXod1zHIzXCqC9fUBq2nizO82cpWsvpRd0jksW+m7OuQuNxQmQl/+gLj4xdGGnubpMEHeXIRcGF3X3KnETvcIqRb1gdiso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745366258; c=relaxed/simple;
	bh=FmAgiHjOXbqJcln/OIgUaR1I0UCojgC0IjHOSrAKSkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HqevbOq4JbVR5n27QMxlEpjFAGnLKbJllNgJP2Effw7IrduCY9vuEMG++YX3tAjqi1rBJg4+nZrnKPNEF5sqz7YBuEEVRXuHbVXC/xckhWn0amGp/k5vdTknnKVpoJoHbG3OsEAgtocYK4bsUZ7PVAVgZAoNFllCBdh/lsMOSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NedBK0c6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKpdjE021600
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 23:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H1IjI6zQkO1wJMxEGjiNO1XXndei6SHSNKx61xlsx+Y=; b=NedBK0c6t854p9eh
	CdZtrysS/hZcRtPXQSH4e/OocOoDDEuRwwwNNw9cKY3DwCW9eus4vDD697uKJhHH
	qzFbBpAMzOFKTXBtQ2cpYxlNvlDBPT9uTeB4oMXPE0dPxIfGmOm4FpKKOQGCTLV7
	lEJ++ol5DgDTCPx0w89mhnetm+jfpA68nGOGoxHrsHMEsMMzgzjP+6eIZ7ykaF90
	6z4lYqS6ext37V32U9h6BlcnNCwo/DkVEwzvrJP+D0deDUE74JTSRnzTLXZSzer6
	CnCYg9tWA0y303ceyy1h+g8uyX9uXyh1wHdAVdX9ZAgW7KPCezLRtpQCHgGkioT1
	MHmQ4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh38b0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 23:57:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c555d4ad75so26222885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 16:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745366254; x=1745971054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1IjI6zQkO1wJMxEGjiNO1XXndei6SHSNKx61xlsx+Y=;
        b=W/1ocTy9GNFNPR6QuBpNEsp95904Km+KOY+U4uAbuYC2aGnNDDynGrLe5afwsPvpO0
         RDbaUU5bTUZr+2IOrWC6anJDfvTVC18RifnLK8zHnfQ5cB3Phb6RQ3oX+spexXppsZGt
         S82/yCg0iaMZTNnck6gibw6xNIKmLV3HL73kFpvH91N6PzxBMvNnEoH/j3WqpQXhXkH7
         +mpTp5u0wQC6T5jq3QxPhugJZkqmhTuiALUZpv7s9de8ZQfQJsoc6agLfpuqaE3jJgC5
         g3zfSrHWqsQHTGrSxuqH6MMT5kJGc3vemXf3li05GIJyTUqroYqUx05/3t7CA8zIdwAZ
         ikzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW9MCbKGoVGIWQCvYP3jQ8qibSwDCdqxLbD61he8L44OUhLq3aDelJQo2v7T/DYw86FbSKVdBU/X7ctfhu@vger.kernel.org
X-Gm-Message-State: AOJu0YxyUwpCcpsLIIqOsGT3tM+5xSla1HCFROhyhNrFIoIx+tXdn0UN
	RZ3kCYzOhGWo3wBdG41f/fVD7itRv5ftUQ7xeupoDpOmu3fizm2HwvrlKnqMzx2kqmWhrLG8hjf
	aq+EoRWQD//LhU0E54tpEG2yn4SNLeQFTHlyysf5Oy06IUXOtNnXJfBJmFDBNJ93G
X-Gm-Gg: ASbGncs4jRbhpk1qAqFZ934aQJQbVtD/qPRK61/LdySR02M3siNu5BaFjVFwYl3vAeR
	2x7VKcUUy0wYISNGcrpm+fmrIpUmRTLXq6r+egmy/k3zEJCH2XSJzOrRlhT3Q77TviYO6V/MpL4
	s4ZJYAE4KWLR8IMbOX0BnW54tVpYTWKNKuigGHYrihBd3c7ldoz1TC+9o2MIQ7UWpyp0XpuSqN9
	+HxgOqxWVefgkw5bHIvuUgFKZCxRr8Y8FYN92zIXfAAQLnBf2IGsnu4dC/slWM05DDegtBfLSQb
	MB9++4mBzAXf5zHOsfS/1tbBdysAaS3XwkAyIVHfANQJ4cKoWly5yeDphHAETk8yKkM=
X-Received: by 2002:a05:620a:430b:b0:7c5:6fee:246f with SMTP id af79cd13be357-7c94d231186mr76783885a.1.1745366253948;
        Tue, 22 Apr 2025 16:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEwDHPfh+3S2avLrO37FcmKZFcnMLRvAj2FgPUvuV/KU+OjhRg4HtBNyxuqy6ggiQpB23oJw==
X-Received: by 2002:a05:620a:430b:b0:7c5:6fee:246f with SMTP id af79cd13be357-7c94d231186mr76781285a.1.1745366253511;
        Tue, 22 Apr 2025 16:57:33 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefd8e3sm723131566b.98.2025.04.22.16.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 16:57:32 -0700 (PDT)
Message-ID: <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 01:57:28 +0200
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE3OSBTYWx0ZWRfXxDNM047VlZnD AcvGeCvus0Z00DR9fRZxO3o1gMzpaV1fH97YsXIz0nIs5XyGnrWooVlpRO8j5K/q7D/5fX8pmy4 1ZX8VIT/XzVakOYo3UBYG59BYmn7Ub6ROI3UKINKait7Vm8N3/Z1aioRJuAkim8r6OefflWweMJ
 TIoD9Z4Wz97g5PqvqTmM0gSwN6PGeOgG5+qVM8FTL0Sc8mEDjfUGCk1jvaBgRksjdbarZ5TXi5U eW25JpEcJjM5Jdw5pvUml0j0D/S+nchLeqNfd4B79Bvql+fsPraXj4ziBz/Wlm/b+JIvuHB+UX3 RuJ+784atuSGNjH/1GSCJLnDar9YZ4aCrSZ7y6niU8kmMQfPzc9EaqcLtq8nmZFk7opJiQQAhXd
 WUt7p5eZF2LjRo5cMU8ElNBHZLwEctRJJR1Ck1tEwMVJW37F2c9JJwBpUbQPt4/IYDiACNJc
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=68082cef cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=bi7NrT-7VlQDZNL6n6kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SYjKw7tN3rGcMAK34hlSAUuXSh-HOWDT
X-Proofpoint-GUID: SYjKw7tN3rGcMAK34hlSAUuXSh-HOWDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_11,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504220179

On 4/21/25 10:13 PM, Rob Clark wrote:
> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>
>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>
>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>
>>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>>
>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>>> default (the one used prior to this change) on error.
>>>>>>>
>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>  #include <linux/pm_domain.h>
>>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>
>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>
>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>
>>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>  {
>>>>>>> +     int hbb;
>>>>>>> +
>>>>>>>       gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>       gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>       gpu->ubwc_config.min_acc_len = 0;
>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>           adreno_is_a690(gpu) ||
>>>>>>>           adreno_is_a730(gpu) ||
>>>>>>>           adreno_is_a740_family(gpu)) {
>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>               gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>               gpu->ubwc_config.amsbc = 1;
>>>>>>>               gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>               gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>               gpu->ubwc_config.min_acc_len = 1;
>>>>>>>       }
>>>>>>> +
>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>>>> +     if (hbb < 0)
>>>>>>> +             return;
>>>>>>> +
>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>>>
>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>>>> and every version of firmware. Also, until recently, this value was
>>>>>> hardcoded in Mesa which matched the value in KMD.
>>>>>
>>>>> To be clear about this, from the moment we introduced host image
>>>>> copies in Mesa we added support for querying the HBB from the kernel,
>>>>> explicitly so that we could do what this series does without Mesa ever
>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>>>> to support querying it. So don't let Mesa be the thing that stops us
>>>>> here.
>>>>
>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
>>>> is unused in production.
>>>
>>> Fair enough, I'm not going to argue with that part. Just wanted to
>>> clear up any confusion about Mesa.
>>>
>>> Although, IIRC kgsl did set different values for a650 depending on
>>> memory type... do you know what source that used?
>>
>> KGSL relies on an undocumented devicetree node populated by bootloader
>> to detect ddrtype and calculates the HBB value based on that.
> 
> Would it be reasonable to use the smem value, but if we find the
> undocumented dt property, WARN_ON() if it's value disagrees with smem?
> 
> That would at least give some confidence, or justified un-confidence
> about the smem values

The aforementioned value is populated based on the data that this
driver reads out, and only on the same range of platforms that this
driver happens to cater to

Konrad

