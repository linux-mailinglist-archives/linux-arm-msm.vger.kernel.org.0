Return-Path: <linux-arm-msm+bounces-88815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F07D19E98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3AD63051B6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0942D0C97;
	Tue, 13 Jan 2026 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDuBqgf2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdKl1DoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED593033F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318284; cv=none; b=VT6Bf4CPVISX1G6Fjo760LYwj3Dv+UVPvhOBZXaX8+jTWtDiyOeFVZim/GccXgU398vKgxd14XmkcGc46XKKRXB0XK4r9HKOWXLwG7tYfS+sfS4T9RuODMYwcKgJxM2Azz4HLkRe79bSx1oS0ypr8+6j3V9UA0YrNVaGY2N2Kig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318284; c=relaxed/simple;
	bh=pagwsMEhIBmSOcK4BaiKARoNQzk6E3odr509GL2yYFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHNd3l9/YLSA/Ew9ISYLYFEVXnbinDLJVgFYdQjRGpY3hzR19EBg/GiWaGbAdXhUkTyoYjmJPlWeiWZKEodnOYFkE4rrf4ERbPyatO27dx8LzMPSuxPpsWwq2YkM5wTWGg0bL9/nGaqmu0mqLYC2PvMqqDqRG1TrluPvCHoKjtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDuBqgf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdKl1DoF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DC6exU2865817
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jdh/o+SXQDB+611mtKFjE/D68KoXr5mEtsYbTZq6sHI=; b=NDuBqgf2zIg+H73n
	i6AtMEXz6x5zXjXzrYrAyKNFRBSo9tcOl+8FFlednRWBrPPTu6Tn2nML5zR0OQrL
	q7TjA+gyj8esCth8LQ94/XNe/yuGGEd9s0DoQyjR4xv37mXSAbmLdcg4+3U/AqTH
	RzZUvrygy6dPloZ73RjXgb+7AyLbCygJUV6Xt2aN2Da5JEO+kuJDN/csT0yfoK5R
	0U50xIj/IkbofXQRRgHzKZuzX+tboeTmaId8X8pAZgxQaDIH/kB3UYX37Kuq8Eh6
	moH1OK6Gd4CioisOiVJL6FfmnaMXxZQ5fPzEZyiCerLX/8cuNcZSxhr6nbJi5whD
	j4nXKA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjh9xmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:31:21 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ed07bdcefbso208499137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768318281; x=1768923081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jdh/o+SXQDB+611mtKFjE/D68KoXr5mEtsYbTZq6sHI=;
        b=OdKl1DoFMTqXrGRNmSffDWgsPivJa6NYgjD8AVe36bFKl5yFwcZ5V/0Hs7wrgAB+0d
         GAG2IJjGZdM/YUr2nnJwc2xlT2lfFR0UbgzQpmVhMJ1fZWy0v67XjV596/cGE5aazbIR
         s2F+nPvU5rgB8MvYAgvnXuIo82YSrTThwTrX79Ta/nKAjDaK04O41aVSu+ALJUX86jZu
         lZ1AFKFQum76NPVQ3ngoJhP0wBHQovnjzv5HqtXfH9Oj38/BdzqW/nhFtq+dcaV6oCYR
         dB/+zr6tQVqefT/pTrPEougUUcNJXvXoDfp7M6ZWfYu/SFTIQRUVFkF8U/PEfVfNCDSO
         pKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318281; x=1768923081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jdh/o+SXQDB+611mtKFjE/D68KoXr5mEtsYbTZq6sHI=;
        b=aA/nDDf5p2KEhr10zKjHu9vTws7WmCelChP6EMJCqSU5RKHjcVmRyhFQABpevSAlox
         85linRPAoUwu4Z7zT00n6r67seqg5E68+sR4ax64abtrZi2snO4JgVt4t7iH1s0vUSX0
         sA1D8sAohKmY4vpHdEmFNvI3KV4E+/FTYguASIyqycc73nrYPAgrmfIdEGUEwO2oM0jC
         bMS+IAKTj2lG7mcTSOV2E4AIqBgrr7sR3gB/vQSMOTgY5OGQToo0Wgu0V7oB+ExQjcLG
         1oH8yvZI7WIQyYglIXaTuJb18qWvVJmNYCpE1FLeCl9yy+s9GGDXEqTDEIOq3g383LEa
         1iFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+GuQ+8DiPxEtH5gP5zIN8JA1+yu0VZovcTprrYntKESTWC4bYrkKm97Kef7Zdure3dLtFJWUqQwAgJvmf@vger.kernel.org
X-Gm-Message-State: AOJu0YybsEUYH5aOygFQEwwtrWIw51zvxWfTlmn5+z7o5efJWFzrBJwb
	7kqnLHlZsm4Ibd5qMkAJk6d1m7IT9g0WFi7o7wWrqoA8xHAwSjV7XK1zeRSOGYIqd5L3iIONaFw
	iv8zOgeI9YSy7ansV/WPmYvGghTqmZIiEv/EwBDQ6ARSQKjIJrE7EYPUU92Gq9v0j1LWz
X-Gm-Gg: AY/fxX4rUctcpeCHZUbauKuGuboGvVyZxjD/+CjTj0MC148YjsAAkFhiBAz4JShx9yA
	gUA30aJxj1yTk5e2AMVHFm6Qkx24ZI9wtVncRXTdIzZf91I8gDLdKikJjiMcMrPmTG18sWwW5ti
	uwazieKP1DVYmLRz1hA9O5aI8VEGUORaDU7EKjydZZoaGkb/U7MLY96osCkfCIy89H2o6Q6W7/T
	w7b+4bg6STM3J9CkU/8EuAELCiafLq6ktQNkfdF0J53nMV/JBhUyrMhbQxb1jXEFSQCTGCJUsEs
	mln2CGDJ2vNuw/By68oY1CJeRnZxS8wxFe+XATP5Opf4cKQwaWxZZ052ZldhKIaku7Zidtg2Cas
	S/qCFwJEWKmq+ZOjitXb8jLO9fW6VaOlKpLxfNAFzrXhJbmpGdwYg7RJDR0iw98nYJZI=
X-Received: by 2002:a05:6122:c1ce:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-5634735d2e6mr3999005e0c.0.1768318279995;
        Tue, 13 Jan 2026 07:31:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJaDNb89277U09zQgcbIRSDmN8Tc2NQbPIkmYjjiiCT9F6GWII0ZfQNvgvatDzT93Kgyw+wg==
X-Received: by 2002:a05:6122:c1ce:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-5634735d2e6mr3998977e0c.0.1768318279128;
        Tue, 13 Jan 2026 07:31:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87207e08a7sm519832466b.55.2026.01.13.07.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 07:31:18 -0800 (PST)
Message-ID: <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:31:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
 <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfXyOuiVbHBW2u5
 tm+Zgb/cYkStXARZsV1rNxPbk2dFxw26xHeVR0kjN6kQa1gu0F9YJ28+qut7azmnydR/tlsolMq
 Wdyqw7xtsqecLWBCE/i7R4qkxkXBoQhxWaxwSJ2WQs/dfho/cl2Kxz7mUA+G30+hyKiMGDipIMY
 8/eISEpA+0lD/lFbzdaGWjxeBzfR0knDpzXJ9ECXQHZD7gnVDnDnpqp54tXrl0+ds9zjXcv96x/
 e8e9x0wg3gVsf/OWY7r9OeZTteRnlePb//OX365+LneEDvlYiyylNmvAZzOxdDucF43H3TFK8Km
 8uZDXgmZqcAHGLFiFGYCHI+V4lRGsC+qBKYKkdX56i8SieQg8YkU1S/3SAKbjR/Rn891AokThXJ
 wamPiTfscGPLDdTUT+uco2YRWOXxH3pvTEGqc+XNrZch866HV5S2kIcm5Rj+4CLGfnOwlPuCpnl
 RNwFJ2naETaj4JYWUag==
X-Proofpoint-GUID: H_omS5_HU938WmGmjxXRMSVgKaZAzExj
X-Proofpoint-ORIG-GUID: H_omS5_HU938WmGmjxXRMSVgKaZAzExj
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=69666549 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KxVwwE8FzcsyeGkQqd4A:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130129

On 1/10/26 11:45 AM, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
>> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
>>> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
>>>> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
>>>>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> To make sure the correct settings for a given DRAM configuration get
>>>>>> applied, attempt to retrieve that data from SMEM (which happens to be
>>>>>> what the BSP kernel does, albeit with through convoluted means of the
>>>>>> bootloader altering the DT with this data).
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> ---
>>>>>> I'm not sure about this approach - perhaps a global variable storing
>>>>>> the selected config, which would then be non-const would be better?
>>>>>
>>>>> I'd prefer if const data was const, split HBB to a separate API.
>>>>>
>>>>
>>>> I agree, but I'd prefer to avoid a separate API for it.
>>>>
>>>> Instead I'd like to either return the struct by value (after updating
>>>> the hbb), but we then loose the ability to return errors, or by changing
>>>> the signature to:
>>>>
>>>> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
>>>>
>>>> This costs us an additional 16 bytes in each client (as the pointer is
>>>> replaced with the data), but I think it's a cleaner API.
>>>
>>> What about:
>>>
>>> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
>>>
>>> I really want to keep the data as const and, as important, use it as a
>>> const pointer.
>>>
>>
>> I guess the question is what are you actually trying to achive; my goal
>> was to keep the base data constant, but I'm guessing that you also want
>> to retain the "const" classifier in the client's context struct (e.g.
>> the "mdss" member in struct dpu_kms)
>>
>> If we're returning the data by value, there's no way for you to mark
>> it as "const" in the calling code's context object (as by definition you
>> shouldn't be able to change the value after initializing the object).
> 
> And I, of course, misssed one star:
> 
> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb)
> 
> This leaks the knowledge that HBB is slightly different kind of property
> than the rest of UBWC data.
> 
>>
>> You also can't return the data by value and then track it by reference -
>> as that value lives on the stack. This has the benefit of making the
>> lifecycle of that object clear (it lives in each client) - but perhaps
>> not a goal of ours... 
>>
>> How come the ubwc config is const but the hbb isn't?
>>
>>
>> If we want both the per-target data to remain const and data in the
>> client's context to be carrying the const qualifier, the one solution I
>> can see is:
>>
>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
>> {
>>         const struct qcom_ubwc_cfg_data *data;
>>         static struct qcom_ubwc_cfg_data cfg;
>>         int hbb;
>>
>>         ...
>>
>>         data = of_machine_get_match_data(qcom_ubwc_configs);
>>         ...
>>
>>         hbb = qcom_smem_dram_get_hbb();
>> 	...
>>
>>         cfg = *data;
>>         cfg.highest_bank_bit = hbb;
>>
>>         return &cfg;
>> }
>>
>> But we'd need to deal with the race in cfg assignment...
> 
> static struct qcom_ubwc_cfg_data *cfg;
> static DEFINE_MUTEX(cfg_mutex);
> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> {
>         const struct qcom_ubwc_cfg_data *data;
>         int hbb;
> 
> 	guard(mutex)(&cfg_mutex);
> 
> 	if (cfg)
> 		return cfg;
> 
>         data = of_machine_get_match_data(qcom_ubwc_configs);
> 	if (!data)
> 		return ERR_PTR(-ENOMEM);
> 
>         hbb = qcom_smem_dram_get_hbb();
> 	if (hbb = -ENODATA)
> 		hbb = 15; /* I think it was default */
> 	else if (hbb < 0)
> 		return ERR_PTR(hbb);
> 
>         cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
> 	if (!cfg)
> 		return ERR_PTR(-ENOMEM);
> 
>         cfg->highest_bank_bit = hbb;
> 
> 	return cfg;
> }
> 
> This potentially leaks sizeof(*data) memory if the module gets removed.
> Granted that all users also use qcom_ubwc_config_get_data() symbol, it
> should be safe to kfree(cfg) on module removal.

I really don't understand why you'd want a separate API for hbb, if
hbb is already available from the larger struct *and* if a driver needs
to know about the value of hbb, it really needs to know about all the
other values as well

Konrad

