Return-Path: <linux-arm-msm+bounces-36151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8839D9B2EEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 12:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA8671C217AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0888F54765;
	Mon, 28 Oct 2024 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O48pUA0f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8EBA59
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 11:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730115118; cv=none; b=APLixd2IFIuUug9KCSHrOW3QKMXt16vN0nQsBX4Mt3qBGgklIbjGnSlzblPpDh5TKq6K+RI+Nfs6eeBjrB3CyfdImcbiJCTqCAN7+uXRBkiUA2CSpzzuO/oLlBJ18gOo1549Je+pc5h1gyToLDStqHj6RJSeH7M2t1/AGzzsWOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730115118; c=relaxed/simple;
	bh=PDN9vXO/dZI0+lgwYlek32a4uiMHBlWo7Nb6O/Pgn7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYCufxNYCk2O4d48pClobPPjhWhlFplQyrGwCMhbP+5vKrLjO7F6ZbzBAc6hwYvtop0mWUjCZxtgetYoyM3Mg6HgKWVmTmHu54TuFPYroPFa2jfQXO7J0Cqmm9GOxoL9em8CzOuGmtSFBmprb9ip0Nr5dNhbliHM3xx8SNPtUZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O48pUA0f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SBEreN017467
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 11:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fay1WfqSR5ZfNix8IeEA2i6PepY/ruW4Izlv+/bHV0A=; b=O48pUA0fHbAHs9On
	A0j2qJbEO+quqEysLo8jMe9xmB1AaO39EC43zjrhqCmbo+KwkaN03bDuY/4kEHj5
	0q56AdsX/T8s6epYeDPU/w1QshWLaoFh5Tj9XO1n1ExjjEjL/8kpNGXiq8GbR2HB
	vdC/Vrm+fvtqSBU1Nw37m14wASTPpKznP2Gr+863Td8RFDg9e/nEmSzbbgxxJOWW
	epA+v79Fl4OgWSfPr3h1HNAW8+qwLBV0gcEkCPqLVS/7gyZThC/Hhkd5F8HCs9fo
	PyVuYOUu9lrL9w3gozkW61DQ8CmJTBRfkUFOGwVaIz5L5smg33kYxy23LyCLk0YE
	fADK7A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgmp4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 11:31:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe91571easo15369486d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 04:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730115115; x=1730719915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fay1WfqSR5ZfNix8IeEA2i6PepY/ruW4Izlv+/bHV0A=;
        b=q56iYg3FAlZo527/P+An9xsOC6hQE7C1Ff15FA4/KEPkJErII4bUJXa0yXb0HhqlTa
         sHgYCC1ni8OuAfLO7C6sHuxpQegXJ0EqcLLKEder3J9GN1wPASaPxr+X2GjKvrUM4IEw
         LQHyoUTIRH/woVsNnN0WoKkl0K8TdDTnrTKCKoDKRWdFb06MaLNeqtX2hCVoHtL2ypZO
         wm4FFgKVJ6TTdheAUHDhRMMmx5s+LbEzHBaY8GrocrQ5SG/Y+l1PcK0L50JpwLOfuNv7
         OUdLBrrJDeFfkD71kJnXPXeFaEPNhL9/ylO9p96CVHGVZVvtD7vBZFXSEegSjwE0TwJF
         ovqA==
X-Forwarded-Encrypted: i=1; AJvYcCUidQt/zUhfeU/3U3DL0wpYOSVIPt6yoQxmthC4q/6BcQ/QikzG3Z67gPMIYnb4FH4nuHCn5k2+C2GZuJb+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9IlRGRjui8JpX+twbkNZwu+Daue/p7kYZTF2W+Q3iIJ3uIZ06
	9kv6cqCtiLG8SNdPV5by+F5DZLQEyLgCFypg2ykw7OosUSqsnH/1hiw5Xrm1SphF6ypRKyY53Bd
	R4/BG39nwwedCLhWBN9tJ5eusssPDNkThSZj76kkAqhAOs+byJDjjx/IKy2Uifdyx
X-Received: by 2002:a05:6214:2583:b0:6c5:3338:45d6 with SMTP id 6a1803df08f44-6d18583be81mr55405616d6.11.1730115114827;
        Mon, 28 Oct 2024 04:31:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkvgYqxpo2ACrB5DdSvsn7yzDd4MDBFRzTXO/ZPMds196WuLyzCIGXKaPWm/X4ux6U8JcyOw==
X-Received: by 2002:a05:6214:2583:b0:6c5:3338:45d6 with SMTP id 6a1803df08f44-6d18583be81mr55405456d6.11.1730115114488;
        Mon, 28 Oct 2024 04:31:54 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1e0b232dsm366494766b.26.2024.10.28.04.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:31:54 -0700 (PDT)
Message-ID: <27bea27a-9aa3-42f5-9b0a-df5744276966@oss.qualcomm.com>
Date: Mon, 28 Oct 2024 12:31:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Arnd Bergmann <arnd@kernel.org>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts>
 <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
 <CAA8EJpodjP3rY0Twe9sP37LWwk5ppP36dyLC9WKD6CTDOtmwzA@mail.gmail.com>
 <b7f72f38-2758-405b-abc7-60b73448d8bb@oss.qualcomm.com>
 <vtj3yahojkozge4bvq66ax2c2idbw27c3hs7l6cy3e7ucz4jqb@qge2nckj3mr4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vtj3yahojkozge4bvq66ax2c2idbw27c3hs7l6cy3e7ucz4jqb@qge2nckj3mr4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6VIyq-zVf4FLeCJNkMpRCNirzxIupqXf
X-Proofpoint-GUID: 6VIyq-zVf4FLeCJNkMpRCNirzxIupqXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280093

On 28.10.2024 11:52 AM, Dmitry Baryshkov wrote:
> On Mon, Oct 28, 2024 at 11:36:15AM +0100, Konrad Dybcio wrote:
>> On 28.10.2024 11:27 AM, Dmitry Baryshkov wrote:
>>> On Mon, 28 Oct 2024 at 12:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 10/28/2024 1:56 PM, Dmitry Baryshkov wrote:
>>>>> On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
>>>>>> Clang-19 and above sometimes end up with multiple copies of the large
>>>>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>>>>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
>>>>>> fill the structure, but these create another copy of the structure on
>>>>>> the stack which gets copied to the first.
>>>>>>
>>>>>> If the functions get inlined, that busts the warning limit:
>>>>>>
>>>>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
>>>>>>
>>>>>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
>>>>>> the stack. Also, use this opportunity to skip re-initializing this table
>>>>>> to optimize gpu wake up latency.
>>>>>>
>>>>>> Cc: Arnd Bergmann <arnd@kernel.org>
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
>>>>>>  2 files changed, 23 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>>>>> index 94b6c5cab6f4..b4a79f88ccf4 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>>>>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
>>>>>>      struct completion pd_gate;
>>>>>>
>>>>>>      struct qmp *qmp;
>>>>>> +    struct a6xx_hfi_msg_bw_table *bw_table;
>>>>>>  };
>>>>>>
>>>>>>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>>>>>> index cdb3f6e74d3e..55e51c81be1f 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>>>>>> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>>>>>>
>>>>>>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>>>>>  {
>>>>>> -    struct a6xx_hfi_msg_bw_table msg = { 0 };
>>>>>> +    struct a6xx_hfi_msg_bw_table *msg;
>>>>>>      struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>>>>      struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>>>>
>>>>>> +    if (gmu->bw_table)
>>>>>> +            goto send;
>>>>>> +
>>>>>> +    msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
>>>>>
>>>>> Is it necessary after being sent? Isn't it better to just kzalloc() it
>>>>> and then kfree() it at the end of the function?
>>>>
>>>> Keeping it around will help to cut down unnecessary work during
>>>> subsequent gpu wake ups.
>>>
>>> Then, I'd say, it is better to make it a part of the a6xx_gpu struct.
>>
>> I think a6xx_gmu makes more logical sense here.
>>
>> FWIW, the driver allocates both _gmu and _gpu for all GPUs regardless
> 
> Hmm, are we expected to handle / perform BW requests in case of GMU-less
> devices?

opp-table does that for us

In case of no gmu ("gmu wrapper"), Linux is the only entity that controls
things

Konrad

