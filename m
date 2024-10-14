Return-Path: <linux-arm-msm+bounces-34373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A199D824
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 22:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F35C1C22CD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 20:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646501D0942;
	Mon, 14 Oct 2024 20:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mn3ShdzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7066A1D0490;
	Mon, 14 Oct 2024 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728937429; cv=none; b=ncwte0u5qKhE0970p+TtpOawk1SrV3za5IsNw5kt2RE3D7qgtkJ9W3I/WlSY5Ph+DEPLmbU7B33p1owTKrqREhz/EZ5lxTqbQRB/FGfqJJRpv4oDWF/zB64P6pvSGAKh2QLUeTBygZ/4oXIvjTsaxw9q5pV4rY91SaMqUUachV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728937429; c=relaxed/simple;
	bh=LviqP7dfxzphekEg06s6g4kBqxHkUFlHvfJIaO/HC1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ECV5t8DnXA6DlUXZ0Hy/9TTHlQl5yQSjNVu/Fi6PCEWFXk5dcrZMKfKu7cJ3/6dK4fSPQnr759xeWu+WlEVTHIyKVW0rBTGdQGAlZVjs5HILRSHKR53XtUuLMB1H78eMdlWyI9naMRBgFfnxmcawfz81LOAPH621npe3/Ar/RvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mn3ShdzU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EBvZg7017256;
	Mon, 14 Oct 2024 20:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mvzjs9vn24PX6m8HBm1RR4yT3b4jLp9/QR1eizu7Iv0=; b=mn3ShdzUXeSpoyIi
	ImoN/r/R+muNOyBoxUlhTg/O+oiT3r4vtWOnzaUQQ0S9SNrOwxk0hwPKBJzLM+DN
	Pq6TRdYRRgODDqZqeyUeK7FlhNXlu7JbZZET4HPHyq5i3IRvNRvb7s7IT+6OpZes
	2T3fXw5F9O+nRDbvjZS+acVy5EaJ3bSOIGyt0mUoC8IozZv/ybT/stOB9pUlxmj+
	OmvodHshLuXs7kdU7ina4FCztqo9LxUTwepXzjb4dMprhYK0tVDD1kJ5Zat6yzti
	qP/1crd3YYIlFLxUX76KVQiiv5gl95MUjjEDjyohz8qJ3qk/KmseF7mTLCO7JTWv
	4pLXiw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hb35dy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 20:23:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EKNYtx019269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 20:23:34 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 13:23:33 -0700
Message-ID: <098b51a8-0165-4d14-9365-ef56ea2bcfae@quicinc.com>
Date: Mon, 14 Oct 2024 13:23:24 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: don't always activate merge_3d block
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241011-merge3d-fix-v2-1-2082470f573c@quicinc.com>
 <kah73euzauizsxvcrgmfsatshfe4pytgb7xe5iprtajg7abhsv@l7jdcxza5gd2>
 <0ca707a4-bd5f-4a31-a424-f466afa08e0d@quicinc.com>
 <pahfbstxa6snym7bem456npsp6bdekjqhnjcsrlpbfn77hkrut@uviaesubwz2a>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <pahfbstxa6snym7bem456npsp6bdekjqhnjcsrlpbfn77hkrut@uviaesubwz2a>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cuVXLuwnSQvaTMs3JxINy6cUg0iFoGA5
X-Proofpoint-GUID: cuVXLuwnSQvaTMs3JxINy6cUg0iFoGA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140144



On 10/14/2024 12:13 AM, Dmitry Baryshkov wrote:
> On Sun, Oct 13, 2024 at 07:37:20PM -0700, Abhinav Kumar wrote:
>> Hi Dmitry
>>
>> On 10/13/2024 5:20 PM, Dmitry Baryshkov wrote:
>>> On Fri, Oct 11, 2024 at 10:25:13AM -0700, Jessica Zhang wrote:
>>>> Only enable the merge_3d block for the video phys encoder when the 3d
>>>> blend mode is not *_NONE since there is no need to activate the merge_3d
>>>> block for cases where merge_3d is not needed.
>>>>
>>>> Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
>>>> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>> Changes in v2:
>>>> - Added more detailed commit message
>>>> - Link to v1: https://lore.kernel.org/r/20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> LGTM now. Please clarify, is there any dependency between this patch and
>>> [1]
>>>
>>
>> No dependency as such. Both are tackling similar issues though. One for
>> video mode and the other for writeback thats all. Namely:
>>
>> 1) We should not be enabling merge_3d block if two LMs are not being used as
>> that block needs to be enabled only to merge two streams. If its always
>> enabled, its incorrect programming because as per the docs its mentioned "if
>> required". Even if thats not causing issues, I would prefer not to enable it
>> always due to the "if required" clause and also we dont need to enable a
>> hardware sub-block unnecessarily.
>>
>> 2) We should be flushing the merge_3d only if its active like Jessica wrote
>> in the commit message of [1]. Otherwise, the flush bit will never be taken
>> by hardware leading to the false timeout errors.
>>
>> It has been sent as two patches as one is for video mode and the other for
>> writeback and for writeback it includes both (1) and (2) together in the
>> same patch.
> 
> I think it's better to handle (1) in a single patch (both for video and
> WB) and (2) in another patch. This way it becomes more obvious that WB
> had two different independent issues issues.

Hi Dmitry,

Just to clarify, the patches are already being split this way.

Thanks,

Jessica Zhang

> 
>>
>> I thought this separation is fine, if we need to squash it, let me know.
>>
>> Thanks
>>
>> Abhinav
>>
>>> [1] https://lore.kernel.org/dri-devel/20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com/
>>>
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> index ba8878d21cf0e1945a393cca806cb64f03b16640..c5e27eeaff0423a69fad98122ffef7e041fbc68e 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> @@ -302,7 +302,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>>>>    	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>>>>    	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>>>    	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>>>> -	if (phys_enc->hw_pp->merge_3d)
>>>> +	if (intf_cfg.mode_3d && phys_enc->hw_pp->merge_3d)
>>>>    		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>>>>    	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>>>>
>>>> ---
>>>> base-commit: a20a91fb1bfac5d05ec5bcf9afe0c9363f6c8c93
>>>> change-id: 20240828-merge3d-fix-1a8d005e3277
>>>>
>>>> Best regards,
>>>> -- 
>>>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>
>>>
> 
> -- 
> With best wishes
> Dmitry


