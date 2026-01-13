Return-Path: <linux-arm-msm+bounces-88884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E3ED1B553
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 22:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C633530090F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 21:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF502E7186;
	Tue, 13 Jan 2026 21:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+qWKaYj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Il6M4Zsa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA891D432D
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 21:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338135; cv=none; b=eRCWm4L0OwFw1hIn4fUfdahXQyl7MYP1GPOjQzIcCTto+KQCp00JskwUkkdhFTo4WV5R74X4/xRlnRFaXGlKEI6bcP5IVF4gWwXXyN7gwhAeUM+ZYEXcJCemjAD9px9olhiFQSWEucxKiWy/kLMme1yHARFEyRxZIimfblcTnC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338135; c=relaxed/simple;
	bh=ApM7OzbIE/riLz+7TahvI8JWee0B6zvWNi/c8/Iho4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQtazGA5lv2XNSYyS09sS2L8UQ4ZaivJ6UtAYmxudt+UKFANnAynw2eiodbYeBgjzlj2nrWaSLaII2IS5rWISgTgX6ysBs42lR+TgPqmVW/xTO5uY4G2WGEOtrdssdPjtDEvKt5XDN8hbo11gFkMgmDaMSfkGoNcd31eURBBERk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+qWKaYj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Il6M4Zsa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DI1OD94164961
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 21:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=; b=M+qWKaYjaEwGs7Xv
	1f0ZBNDgMy5taVSN17y1VlpHKIz3yinTD/VEQZMCRYUaE2DcUPd+JALbn2IOWlTe
	C5zbGPVBlFxdNbHlArgTGvZk9N00vfcXAhfhd1WNN6HapejiP2ok+FmMLvwN8IlA
	7HxHc0OVNZopGB7BjYxer4BjBHr4Jm2lY0Jax3wrEDOzo2QZqo+Rg5qbBP6vbsIs
	azoJn7eLlyYL0ngJDucVHxYUtsTYLKVMci05VaRJzDVaHcqLk+s1BrMtXNDt13kU
	ng4zgKl3pygNStskRIUSlSzqoQ3NSsLXDQDIwMjXaBLHXxBBtJ2ClqJSQ66dP2Ow
	/Ld6tQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06sy11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 21:02:12 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5634f5bd39bso14156511e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 13:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768338132; x=1768942932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=;
        b=Il6M4ZsacoSFYn4T9RNOYAzAYBaZwSm2xRbQPEoKVjPzsLcrPEBsblSsyQQvpSA/QA
         Z/0UdWC3mOVyXzcoFgjt1J6Xv+KimeUxWipZBfPofkb9Y7c/O1Kz9NgQEbdQNJPRxlEr
         CcxbpBN8Ad/eXVi8nsmitwkKmu38C5O4PQqdgKocOwMXSxaShiC0XuP7Ys1dwTUZyhAY
         NDoqeruz687TMcr5nzhyxnIgnZm4t5DKNHEDLxHIVLaPIp4W27RJD3hVoxpDltSRytHH
         6vQO14FKPfUp7P/pgoDV3C2O+WindeW0Nu5XYjNG+DK3LpkuYyVL7haG0XJDYNshgMgd
         PN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768338132; x=1768942932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=;
        b=TKtHOGdjLjM28xEV+wbMDKNRDuDPw7jAzCFmWaEg8eJJTUqC5kZTv4rIbArNTDNxof
         fJGfxq0pw+7LCszInKz2JYSC6pNmSST7I525HQ5Wr4HRed6y6TSZkQ0pP8s+sU2jHAN0
         5ljc3MtV6SVaqRG0k4STVDm9TYuWknRno8pfnp8Ictj9AKcoGqTZ8zbANsmH/DZF78VG
         qXh0cRfoBHNBZyj2tXi/lC7MkY0Yq0haiR0m2VAwY5d/LeP0ci6iZl9E5y+jamOaN5Ke
         oKRcWylklp3kAfakD4S6wcVikpzn8NXiLxY5KU1Hze6SbK0liIlzAjAA7IeDKlzgpaCi
         oxrg==
X-Forwarded-Encrypted: i=1; AJvYcCVRcSWO1pplCG9swDYqQWOuQZPAIACd+rglE95JSo+8AwiDhnmneO8Br6/2SVy6cQ0EAS5paW425kEuxomM@vger.kernel.org
X-Gm-Message-State: AOJu0YxLbKf8508AfrK93NkZSJk4lfh7Pj90+MYjglUkBKp0dirCXvLT
	6vUPkFljsm3pWw1RV+AAIUSIvaRt+5y4PXFLSSZb9zzLxKXX2Mb07dkDdXji3oZW9DOq0vEupQu
	vo+TV99in6rwlT7IDdF9oODZxwownYRHsOyioEQNTt1dvCcpuMYWbEouY9H2BpMLVXeTF
X-Gm-Gg: AY/fxX60mk44wTdbTlZ8RCzI2EuZpO7U/iUj3AYCJlhT0mO5I1Da24ttS3KRAwoB+5R
	Go8QuSPcRGYwv/F1grPVbfaN6v+iVAn0DoQLZm5jhEOzUdF7DnTeLxezRa0acpSUzcwJ8stzMEh
	pES2f45OPrnKCwZU8BL2teC9V/x8Tthaa/Eb/hfz+EymIJYg32dpUW/ehltP5Fc9eLhWGemBdL6
	LmQI6U73/KH1BIWkg0Mwd4cRws1eqeJnN4XHyEaStrxZ3Cg4myK3teObTtIpwKga0oJ6LIBcpBu
	NUrH+Ya/CrwioPk8O3avoNsL8GP+ZxEFMgs65jNDLqWV+w2v0SPJRmmRyUL94LsXwt4OFrzjNWA
	tOdyE/TE60Dplce4Gtb6HnmaFawFSs/44qWeHq81L00947lqIDLLbzcpMQE226Qao/9J1uBrBXr
	9Tdabk
X-Received: by 2002:a05:6122:46a2:b0:563:687f:360c with SMTP id 71dfb90a1353d-563a08080a7mr278140e0c.0.1768338131583;
        Tue, 13 Jan 2026 13:02:11 -0800 (PST)
X-Received: by 2002:a05:6122:46a2:b0:563:687f:360c with SMTP id 71dfb90a1353d-563a08080a7mr278104e0c.0.1768338131125;
        Tue, 13 Jan 2026 13:02:11 -0800 (PST)
Received: from [192.168.1.188] (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ebfd007fsm1126590566b.31.2026.01.13.13.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 13:02:10 -0800 (PST)
Message-ID: <0919844a-9246-4bdc-979c-115ccc3995c2@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 23:02:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
 <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
 <zmfgq5d2gwrxgvr4eh4th2gjef76gpbv54kz2myvfnqgpor4dn@7qjr262yryap>
 <20260113205955.GA2893481@ax162>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260113205955.GA2893481@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B39Nri8jkAW7CuxLUj8mxeyn9UCHfA3S
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=6966b2d4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8
 a=0--PztnLt7rTvDwXMSMA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: B39Nri8jkAW7CuxLUj8mxeyn9UCHfA3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE3MiBTYWx0ZWRfX861yEmLxdux6
 cA3ZFld7U7HPUe8ii9VBkOlwvBuaCXK8RT2z7rXhmWklPlcCWUUggXhsE2ljuT7uxVgv3HtZDB+
 UFCQp0AomQ6sIUCx00P4UcH+aIpSVN+UoxpodQ4i5n8SioQ0qg51s777hD8PvSJ3gYfJLa1Y8EB
 9a7xD6fzj+4l3Q18bOKvjSz67+2OMIPs+HRrLbUsZXeGSN/WS6e2pLTaqpXRSSvMrePSuI7z1rE
 UxAv9ZOOGq0z3sFZPjhygGWrOF9IiUf1/RcyXNbQmJFaWdUrEyvGcoTbElmcquC2EjDtcw7Ih7t
 1irppg1dtrXxs48q5e5IAuJispvWf9SDuTIX0UZVi6Cwj7EeHmrpuRlF/Sv9+/4yzyXU9hflE6D
 loxLMirdcxbp81TzYUPtP+dXm/uMxZH/lPxvap6O2LlYyxHegdOc55HKtMMlpAJuZR5qB0wVCum
 4urkwqLydCNRTI1xJng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130172



On 13/01/2026 22:59, Nathan Chancellor wrote:
> On Mon, Jan 12, 2026 at 04:37:46AM +0200, Dmitry Baryshkov wrote:
>> On Fri, Jan 09, 2026 at 10:06:29AM +0100, Konrad Dybcio wrote:
>>> Dmitry, would it be beneficial to throw an actual error when the rate is
>>> is mangled? i.e.
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> index aa2303d0e148..4f710b8e6bc6 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> @@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>>>          return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
>>>   }
>>>   
>>> -static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>> -                              u32 rate, u32 stream_rate_khz,
>>> -                              bool is_ycbcr_420)
>>> +static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>> +                                 u32 rate, u32 stream_rate_khz,
>>> +                                 bool is_ycbcr_420)
>>>   {
>>>          u32 pixel_m, pixel_n;
>>>          u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
>>> @@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>>          u32 const link_rate_hbr3 = 810000;
>>>          unsigned long den, num;
>>>   
>>> -       if (rate == link_rate_hbr3)
>>> +       switch (rate) {
>>> +       case link_rate_hbr3:
>>>                  pixel_div = 6;
>>> -       else if (rate == 162000 || rate == 270000)
>>> -               pixel_div = 2;
>>> -       else if (rate == link_rate_hbr2)
>>> +               break;
>>> +       case link_rate_hbr2:
>>>                  pixel_div = 4;
>>> -       else
>>> +               break;
>>> +       case 270000:
>>> +       case 162000:
>>> +               pixel_div = 2;
>>> +               break;
>>> +       default:
>>>                  DRM_ERROR("Invalid pixel mux divider\n");
>>> +               return -EINVAL;
>>
>> Well... In the ideal world, we can't end up here, PHY's
>> configure_dp_clocks (or qcom_edp_set_vco_div()) will fail if the link
>> rate is is invalid here. I think, we should return an error here, but
>> there is no need to propagate it further.
>>
>> See the discussion at https://lore.kernel.org/dri-devel/f2ce6ae51c50b0d2e57b905c63b43413@codeaurora.org/
> 
> I interpret that as approving of the above hunk but omitting the hunk
> that modifies msm_dp_ctrl_on_stream(). In that case, what is the point
> of changing the return type of msm_dp_ctrl_config_msa()? Wouldn't the
> below diff have the same exact effect as a smaller change? I don't mind
> rolling this up as a v2.
> 
> Cheers,
> Nathan
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index aa2303d0e148..d8ea73b89f7c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2409,20 +2409,27 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>   			       bool is_ycbcr_420)
>   {
>   	u32 pixel_m, pixel_n;
> -	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> +	u32 mvid, nvid, pixel_div, dispcc_input_rate;
>   	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
>   	u32 const link_rate_hbr2 = 540000;
>   	u32 const link_rate_hbr3 = 810000;
>   	unsigned long den, num;
>   
> -	if (rate == link_rate_hbr3)
> +	switch (rate) {
> +	case link_rate_hbr3:
>   		pixel_div = 6;
> -	else if (rate == 162000 || rate == 270000)
> -		pixel_div = 2;
> -	else if (rate == link_rate_hbr2)
> +		break;
> +	case link_rate_hbr2:
>   		pixel_div = 4;
> -	else
> +		break;
> +	case 162000:
> +	case 270000:
> +		pixel_div = 2;
> +		break;
> +	default:
>   		DRM_ERROR("Invalid pixel mux divider\n");
> +		return;

Please add a comment, stating that we can't actually reach it. LGTM 
otherwise.

> +	}
>   
>   	dispcc_input_rate = (rate * 10) / pixel_div;
>   

-- 
With best wishes
Dmitry


